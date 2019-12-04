package com.sailei.common.utils;

import com.xiaoleilu.hutool.util.RandomUtil;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * 描述:封装各种生成唯一性ID算法的工具类
 *
 * @Author sailei
 * @Date 2019/7/13 12:33
 **/
public class IdUtils {

    /**
     * 封装JDK自带的UUID, 通过Random数字生成, 中间无-分割.
     */
    public static String uuid() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    /**
     * 获取当前时间加几位随机数作为ID
     */
    public static String getNumberId() {
        /**
         * 获取时间戳
         */
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String id = dateFormat.format(new Date());
        /**
         * 转化为20位的数字字符串
         */
        String num = RandomUtil.randomNumbers(20 - id.length());
        return id + num;
    }
}
