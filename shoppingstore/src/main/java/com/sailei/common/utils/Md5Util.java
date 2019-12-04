package com.sailei.common.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.security.MessageDigest;

/**
 * 描述:MD5加密工具类
 *
 * @Author sailei
 * @Date 2019/7/2 13:40
 **/

public class Md5Util {

    /**
     * 记录日志
     */
    public static final Logger logger = LoggerFactory.getLogger(Md5Util.class);

    /**
     * md5加密字母大写 32位
     *
     * @param plainText
     * @return
     */
    public static String getMd5Upper(String plainText) {
        return getMd5Lower(plainText).toUpperCase();
    }

    /**
     * MD5加密
     *
     * @param data 待处理数据
     * @return MD5结果
     */
    public static String getMd5Lower(String data) {
        StringBuilder sb = new StringBuilder();
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] array = md.digest(data.getBytes("UTF-8"));
            for (byte item : array) {
                sb.append(Integer.toHexString((item & 0xFF) | 0x100).substring(1, 3));
            }
        } catch (Exception e) {
            logger.error("【MD5加密】报错：" + e.getMessage());
        }
        return sb.toString();
    }

}
