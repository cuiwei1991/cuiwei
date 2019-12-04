package com.sailei.common.redis;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 描述：防止并发工具类
 *
 * @Author sailei
 * @Date: 2018/11/17 13:37
 */
public class LockDoorUtil {

    /**
     * Redis键头
     */
    private static final String CASH_KEY = "LOCK:";

    /**
     * 间隔毫秒数 大于0的整数
     */
    private static final Integer NUMBER = 5;

    /**
     * 超过多少毫秒时重设，也是睡眠时间的报警值，达到报警值也就该重新设置了。
     */
    private static final Integer MAX_NUMBER = 1000;

    /**
     * 不使用Redis时内存存储的集合
     */
    public static List<String> LOCK_KEY_LIST = new ArrayList<>();

    /**
     * 存储key与该key的睡眠时间集合
     */
    public static Map<String, Integer> KEY_SLEEP_LIST = new HashMap<>();

    /**
     * 存储key与该key调用时的时间戳集合，适当的调整key的睡眠时间。
     */
    public static Map<String, Long> KEY_TIME_LIST = new HashMap<>();

    public static final Logger logger = LoggerFactory.getLogger(LockDoorUtil.class);

    public static boolean checkRedis() {
        return RedisUtil.redisFlag;
    }

    /**
     * 描述:存入Key,存入前先判断是否存在,存在则返回false,不存在直接存入.
     *
     * @Author sailei
     * @Date 2019/7/2 14:22
     **/
    public static synchronized boolean setKey(String key) {
        logger.info("【存入Key】接收到key=" + key);
        /** 随机睡眠50以内的数值的毫秒 避免锁门时并发 */
        try {
            int num = getKeySleepNum(key);
            logger.info("【存入Key】睡眠时间=" + num);
            Thread.sleep(num);
        } catch (Exception e) {

        }
        /** 判断是否使用了Redis缓存 */
        if (checkRedis()) {
            /** 检查Redis中是否存在Key */
            if (RedisUtil.checkKey(CASH_KEY + key)) {
                /** 存在则无法存入，直接返回存入失败 */
                return false;
            } else {
                /** 不存在则设置值，存入成功返回成功 */
                RedisUtil.setKeyStr(CASH_KEY + key, key, -1);
                logger.info("【存入Key】存入成功");
                return true;
            }
        } else {
            /** 检查内存中是否存在Key */
            if (LOCK_KEY_LIST.contains(key)) {
                /** 存在则无法存入，直接返回存入失败 */
                return false;
            } else {
                /** 不存在则设置值，存入成功返回成功 */
                LOCK_KEY_LIST.add(key);
                return true;
            }
        }
    }

    /**
     * 每个key都获取一个不超过50毫秒的睡眠时间
     * 每次获取都增加5毫秒
     *
     * @param key 键
     * @return 睡眠毫秒数
     */
    private static int getKeySleepNum(String key) {
        int num = NUMBER;
        Integer minis = KEY_SLEEP_LIST.get(key);
        Long times = KEY_TIME_LIST.get(key);
        if (minis == null) {
            KEY_SLEEP_LIST.put(key, num);
        } else {
            num += minis;
            if (times == null) {
                KEY_SLEEP_LIST.put(key, num);
            } else {
                Long now = System.currentTimeMillis();
                Long lastLimit = now - times;
                /** 如果上次请求与本次请求时间超过1s，将睡眠时间设置为5毫秒 */
                if (lastLimit >= MAX_NUMBER) {
                    KEY_SLEEP_LIST.put(key, 5);
                } else {
                    KEY_SLEEP_LIST.put(key, num);
                }
            }
        }

        /** 当睡眠时间达到上限时报警 */
        if (num >= MAX_NUMBER) {
            logger.error("key:" + key + "的睡眠时间已经超过最大值" + MAX_NUMBER);
        }

        KEY_TIME_LIST.put(key, System.currentTimeMillis());
        return num;
    }

    /**
     * 删除Key
     *
     * @param key
     */
    public static void delKey(String key) {
        if (checkRedis()) {
            RedisUtil.delKey(CASH_KEY + key);
        } else {
            LOCK_KEY_LIST.remove(key);
        }
    }


}
