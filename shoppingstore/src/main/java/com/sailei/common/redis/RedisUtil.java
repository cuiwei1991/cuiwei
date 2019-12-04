package com.sailei.common.redis;

import com.google.gson.Gson;
import com.sailei.config.GlobalBean;
import com.xiaoleilu.hutool.json.JSONUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import redis.clients.jedis.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * redis数据存储工具类
 *
 * @Author sailei
 */
public class RedisUtil {

    /**
     * 记录日志
     */
    public static final Logger logger = LoggerFactory.getLogger(RedisUtil.class);

    private static JedisPool jedisPool = null;
    /**
     * Redis可用状态
     */
    public static boolean redisFlag = false;

    static {
        /** 配置项不适用缓存则直接修改flag */
        String flag = GlobalBean.REDIS_ENABLE;
        if ("true".equals(flag)) {
            redisFlag = true;
        }
    }

    /**
     * 初始化Redis连接池
     */
    private static void initialPool() {
        try {
            JedisPoolConfig config = new JedisPoolConfig();
            /**
             * 控制一个pool可分配多少个jedis实例，通过pool.getResource()来获取；
             * 如果赋值为-1，则表示不限制；如果pool已经分配了maxActive个jedis实例，则此时pool的状态为exhausted(耗尽)。
             */
            config.setMaxTotal(100);
            /** 控制一个pool最多有多少个状态为空闲的的jedis实例。*/
            config.setMaxIdle(1000);
            /** 表示当borrow(引入)一个jedis实例时，最大的等待时间，如果超过等待时间，则直接抛出JedisConnectionException；*/
            config.setMaxWaitMillis(3000);
            /** 在borrow一个jedis实例时，是否提前进行validate操作；如果为true，则得到的jedis实例均是可用的；*/
            config.setTestOnBorrow(true);
            String password = GlobalBean.REDIS_PASSWORD;
            if (StringUtils.isEmpty(password)) {
                jedisPool = new JedisPool(config, GlobalBean.REDIS_HOST, Integer.valueOf(GlobalBean.REDIS_POST), 2000);
            } else {
                jedisPool = new JedisPool(config, GlobalBean.REDIS_HOST, Integer.valueOf(GlobalBean.REDIS_POST), 2000, GlobalBean.REDIS_PASSWORD, Integer.valueOf(GlobalBean.REDIS_DATABASE));
            }
            logger.info("【Redis】初始化完毕!");
        } catch (Exception e) {
            logger.error("【Redis】初始化失败，后续将无法使用Redis缓存！如不使用缓存可在配置文件修改配置spring.redis.enable\r\n报错信息:" + e.getMessage());
            redisFlag = false;
        }
    }

    /**
     * 在多线程环境同步初始化
     */
    private static synchronized void poolInit() {
        if (jedisPool == null) {
            initialPool();
        }
    }

    /**
     * 同步获取Jedis实例
     *
     * @return Jedis
     */
    public synchronized static Jedis getJedis() {
        if (jedisPool == null) {
            poolInit();
        }
        Jedis jedis = null;
        try {
            if (jedisPool != null) {
                jedis = jedisPool.getResource();
            }
        } catch (Exception e) {
            logger.error("【Redis】初始化失败，后续将无法使用Redis缓存！如不使用缓存可在配置文件修改配置redis.flag\r\n报错信息:" + e.getMessage());
        }
        return jedis;
    }

    /**
     * 释放jedis资源
     *
     * @param jedis 资源
     */
    public static void returnResource(final Jedis jedis) {
        if (jedis != null) {
            jedis.close();
        }
    }

    /**
     * 添加字符串数据 设置超时时间 XX秒后失效
     *
     * @param key   键
     * @param value 值
     * @param min   多少秒后失效 -1 永久保存
     * @return 添加是否成功
     */
    public static boolean setKeyStr(String key, String value, int min) {
        boolean result = false;
        if (redisFlag) {
            Jedis jedis = getJedis();
            try {
                if (-1 == min) {
                    jedis.set(key, value);
                } else {
                    jedis.setex(key, min, value);
                }
                result = true;
            } catch (Exception e) {
                result = false;
            } finally {
                returnResource(jedis);
            }
        }
        return result;
    }

    /**
     * 获取字符串数据
     *
     * @param key 键
     * @return 对应的值
     */
    public static String getKeyStr(String key) {
        String result = null;
        if (redisFlag) {
            Jedis jedis = getJedis();
            try {
                result = jedis.get(key);
            } catch (Exception e) {
                /** 如果redis不可用。初始化时报错，此处不再报错 */
            } finally {
                returnResource(jedis);
            }
        }
        return result;
    }

    /**
     * 添加对象设置时间 XX秒后失效
     *
     * @param key  键
     * @param bean 对象
     * @param min  多少秒后失效 -1 永久保存
     * @return 是否添加成功
     */
    public static boolean setKeyObject(String key, Object bean, int min) {
        boolean result = false;
        if (redisFlag) {
            Jedis jedis = getJedis();
            try {
                /**将对象转化为json*/
                String value = JSONUtil.toJsonStr(bean);
                if (-1 == min) {
                    jedis.set(key, value);
                } else {
                    jedis.setex(key, min, value);
                }
                result = true;
            } catch (Exception e) {
                /** 如果redis不可用。初始化时报错，此处不再报错 */
                result = false;
            } finally {
                returnResource(jedis);
            }
        }
        return result;
    }

    /**
     * 获取对象
     *
     * @param key      键
     * @param classOfT 对象类型
     * @param <T>      返回对象
     */
    public static <T> T getKeyObject(String key, Class<T> classOfT) {
        T result = null;
        if (redisFlag) {
            Jedis jedis = getJedis();
            try {
                String value = jedis.get(key);
                /** 将json转化为对象 */
                Gson gson = new Gson();
                result = gson.fromJson(value, classOfT);
            } catch (Exception e) {
                /** 如果redis不可用。初始化时报错，此处不再报错 */
            } finally {
                returnResource(jedis);
            }
        }
        return result;
    }

    /**
     * 检查key是否存在
     *
     * @param key 键
     * @return 是否存在
     */
    public static boolean checkKey(String key) {
        boolean result = false;
        if (redisFlag) {
            Jedis jedis = getJedis();
            try {
                String value = jedis.get(key);
                if (value != null) {
                    result = true;
                }
            } catch (Exception e) {
                /** 如果redis不可用。初始化时报错，此处不再报错 */
            } finally {
                returnResource(jedis);
            }
        }
        return result;
    }

    /**
     * 删除Key
     *
     * @param key 键
     * @return 删除是否成功
     */
    public static boolean delKey(String key) {
        boolean result = false;
        if (redisFlag) {
            Jedis jedis = getJedis();
            try {
                jedis.del(key);
                result = true;
            } catch (Exception e) {
                /** 如果redis不可用。初始化时报错，此处不再报错 */
                result = false;
            } finally {
                returnResource(jedis);
            }
        }
        return result;
    }

    /**
     * 清除所有key
     *
     * @return 清除是否成功
     */
    public static boolean flushAll() {
        boolean result = false;
        if (redisFlag) {
            Jedis jedis = getJedis();
            try {
                jedis.flushAll();
                result = true;
            } catch (Exception e) {
                /** 如果redis不可用。初始化时报错，此处不再报错 */
                result = false;
            } finally {
                returnResource(jedis);
            }
        }
        return result;
    }

    /**
     * 添加Map数据
     *
     * @param key 键
     * @param map 值
     */
    public static boolean setKeyMap(String key, Map<String, String> map) {
        boolean result = false;
        if (redisFlag) {
            Jedis jedis = getJedis();
            try {
                jedis.hmset(key, map);
                result = true;
            } catch (Exception e) {
                /** 如果redis不可用。初始化时报错，此处不再报错 */
                result = false;
            } finally {
                returnResource(jedis);
            }
        }
        return result;
    }

    /**
     * 获取Map数据
     *
     * @param key 键
     */
    public static Map<String, String> getKeyMap(String key) {
        Map<String, String> result = null;
        if (redisFlag) {
            Jedis jedis = getJedis();
            try {
                result = jedis.hgetAll(key);
            } catch (Exception e) {
                /** 如果redis不可用。初始化时报错，此处不再报错 */
            } finally {
                returnResource(jedis);
            }
        }
        return result;
    }

    /**
     * 删除多个key
     *
     * @param list 键
     */
    public static boolean deleteKeys(List<String> list) {
        boolean result = false;
        if (redisFlag && list != null && list.size() > 0) {
            Jedis jedis = getJedis();
            try {
                if (list != null && list.size() > 0) {
                    /** 删除这些key */
                    for (String key : list) {
                        jedis.del(key);
                    }
                }
                result = true;
            } catch (Exception e) {
                /** 如果redis不可用。初始化时报错，此处不再报错*/
                result = false;
            } finally {
                returnResource(jedis);
            }
        }

        return result;
    }
    
    /** 
     * 描述:获取指定key的缓存
     *  
     * @Author sailei
     * @Date 2019/9/25 13:05
     */
    public static List<String> keys(String key){
        List<String> list = null;
        if (redisFlag) {
            Jedis jedis = getJedis();
            try {
                list = new ArrayList<>();
                /** 查询所有key */
                ScanParams params = new ScanParams();
                params.match(key);
                params.count(100);
                String cursor = "0";
                while (true) {
                    ScanResult scanResult = jedis.scan(cursor, params);
                    List<String> elements = scanResult.getResult();
                    if (elements != null && elements.size() > 0) {
                        list.addAll(elements);
                    }
                    cursor = scanResult.getStringCursor();
                    if ("0".equals(cursor)) {
                        break;
                    }
                }
            } catch (Exception e) {
                return null;
            } finally {
                returnResource(jedis);
            }
        }
        return list;
    }

    /**
     * 删除以表达式key的Redis缓存
     * 例如：删除以MENU开头的缓存则key输入“MENU*”
     * 删除以MENU结尾的缓存则key输入“*MENU”
     * 删除包含MENU的缓存则key输入“*MENU*”
     *
     * @param key
     */
    public static boolean deleteLikeKey(String key) {
        boolean result = false;
        if (redisFlag) {
            Jedis jedis = getJedis();
            try {
                /** 查询所有key */
                List<String> list = keys(key);

                /** 删除这些key */
                deleteKeys(list);

                result = true;
            } catch (Exception e) {
                result = false;
            } finally {
                returnResource(jedis);
            }
        }

        return result;
    }

}
