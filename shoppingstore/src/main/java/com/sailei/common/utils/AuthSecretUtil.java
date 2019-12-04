package com.sailei.common.utils;

/**
 * 功能描述：各个请求渠道签名认证密钥工具类
 * 后期从Redis或数据库获取，动态维护
 *
 * @Author: sailei
 * @Date: 2019/6/15 19:38:00
 */
public class AuthSecretUtil {

    /**
     * PC前端请求
     */
    public static final String AUTH_QD = "5b6fa8942d03497089b64ead4a56e4ba";
    /**
     * IOS前端请求
     */
    public static final String AUTH_IOS = "633684fdb61543bfb2762540e95e451c";
    /**
     * ANDROID前端请求
     */
    public static final String AUTH_ANDROID = "8263bd70c921480694f1d0013ecf556a";
    /**
     * PC后台请求
     */
    public static final String AUTH_PC = "879ba84518fa4c2aaba3d7ffaf063a80";
    /**
     * 手机WAP前端请求
     */
    public static final String AUTH_WP = "88112946a86a48f08ecf0b05b56424d8";

    /**
     * 获取key
     *
     * @param authId
     * @return
     */
    public static String getAuthSecretKey(String authId) {
        if (ToolUtils.isEmpty(authId)) {
            return "";
        }
        if ("0".equals(authId)) {
            return AUTH_QD;
        }
        if ("1".equals(authId)) {
            return AUTH_IOS;
        }
        if ("2".equals(authId)) {
            return AUTH_ANDROID;
        }
        if ("3".equals(authId)) {
            return AUTH_PC;
        }
        if ("4".equals(authId)) {
            return AUTH_WP;
        }
        return "";
    }

}
