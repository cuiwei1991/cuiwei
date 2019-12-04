package com.sailei.modules.sys.utils;

import com.sailei.common.base.SpringContextHolder;
import com.sailei.common.redis.RedisUtil;
import com.sailei.modules.sys.entity.Set;
import com.sailei.modules.sys.mapper.SetMapper;

/**
 * 配置工具类
 *
 * @Author gaojin
 * @Date 2019-05-27 16:46:25
 */
public class SetUtils {

    private static final String SET_CACHE = "SET:";
    private static SetMapper setMapper = SpringContextHolder.getBean(SetMapper.class);


    /**
     * 根据配置键获取值
     */
    public static String getSetValue(String key){
        String redisKey = SET_CACHE + key;
        String value = RedisUtil.getKeyStr(redisKey);
        if (value == null){
            Set set = setMapper.getByKey(key);
            if (set != null){
                value = set.getSetValue();
                RedisUtil.setKeyStr(redisKey, value, -1);
            }
        }
        if(value != null){
            return value;
        }else{
            return "未配置";
        }
    }

    /**
     * 修改配置
     */
    public static void edit(String key, String value){
        key = SET_CACHE + key;
        RedisUtil.setKeyStr(key, value, -1);
    }

    /**
     * 删除配置
     */
    public static void delete(String key){
        key = SET_CACHE + key;
        RedisUtil.delKey(key);
    }

    /**
     * 清除所有缓存
     */
    public static void deleteAll() {
        RedisUtil.deleteLikeKey(SET_CACHE + "*");
    }
}
