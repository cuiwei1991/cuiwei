package com.sailei.modules.sys.utils;

import com.sailei.common.base.SpringContextHolder;
import com.sailei.common.utils.ToolUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sailei.common.redis.RedisUtil;
import com.sailei.modules.sys.entity.Dict;
import com.sailei.modules.sys.mapper.DictMapper;

import java.util.List;

/**
 * 字典工具类
 *
 * @Author gaojin
 * @Date 2019-05-27 15:38:25
 */
public class DictUtils {

    private static final String DICT_CACHE = "DICT:";
    public static final String DICT_CACHE_PREFIX = "-";
    private static DictMapper dictMapper = SpringContextHolder.getBean(DictMapper.class);

    /**
     * 根据父字典编码获取字典名称
     * 用于页面显示
     *
     * @param code         字典编码
     * @param parentCode   父字典编码
     * @param defaultValue 默认值
     */
    public static String getDictValue(String code, String parentCode, String defaultValue) {
        String key = DICT_CACHE + parentCode + DICT_CACHE_PREFIX + code;
        String redisStr = RedisUtil.getKeyStr(key);
        if (ToolUtils.isEmpty(redisStr)) {
            List<Dict> dicts = dictMapper.getByType(parentCode);
            if (ToolUtils.isNotEmpty(dicts)) {
                for (Dict dict : dicts) {
                    if (code.equals(dict.getCode())) {
                        redisStr = dict.getName();
                        RedisUtil.setKeyStr(key, redisStr, -1);
                        return redisStr;
                    }
                }
            }
        } else {
            return redisStr;
        }

        return defaultValue;
    }

    /**
     * 根据父字典编码获取字典列表
     * 用于页面显示
     *
     * @param parentCode 父字典编码
     */
    public static List<Dict> getDictList(String parentCode) {
        String key = DICT_CACHE + parentCode;
        String redisStr = RedisUtil.getKeyStr(key);
        Gson gson = new Gson();
        List<Dict> dicts;
        if (ToolUtils.isEmpty(redisStr)) {
            dicts = dictMapper.getByType(parentCode);
            redisStr = gson.toJson(dicts);
            RedisUtil.setKeyStr(key, redisStr, -1);
        } else {
            dicts = gson.fromJson(redisStr, new TypeToken<List<Dict>>() {
            }.getType());
        }
        return dicts;
    }

    /**
     * 清除指定缓存
     *
     * @param key
     */
    public static void deleteKey(String key) {
        RedisUtil.delKey(DICT_CACHE + key);
    }

    /**
     * 清除所有缓存
     */
    public static void deleteAll() {
        RedisUtil.deleteLikeKey(DICT_CACHE + "*");
    }

}
