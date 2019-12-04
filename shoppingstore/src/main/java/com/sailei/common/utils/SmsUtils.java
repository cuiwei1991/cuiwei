package com.sailei.common.utils;

import com.sailei.common.service.ServiceResult;
import com.xiaoleilu.hutool.http.HttpUtil;
import com.xiaoleilu.hutool.json.JSONUtil;

import java.util.HashMap;
import java.util.Map;

/**
 * 发送短信工具类
 * 使用集团统一的短信接口
 *
 * @Author sailei
 */
public class SmsUtils {

    /**
     * 阿拉丁网平台APP_ID
     */
    private final static String APP_ID = "26e062014f474f0f96c9cd7aff478355";
    /**
     * 阿拉丁网平台APP_SECRET
     */
    private final static String APP_SECRET = "6432f03caf914ad4a0dda9b339cf67f3";
    /**
     * 接口地址
     */
    private final static String URL = "http://sms.aladinn.com/api/message";

    /**
     * 阿拉丁网验证码服务接口
     */
    public final static String ALADINN_CODE = "f3276cc6f0ef4a878c454c2ffb4463a3";

    /**
     * 发送短信方法
     *
     * @param smsId  接口ID
     * @param mobile 手机号
     * @param params 参数
     * @return R
     */
    public static ServiceResult sendMessage(String smsId, String mobile, Map<String, Object> params) {
        ServiceResult result = new ServiceResult();
        /**将参数转化为json格式*/
        String message = JSONUtil.toJsonStr(params);

        /**组织参数*/
        Map<String, Object> map = new HashMap<>();
        map.put("appId", APP_ID);
        map.put("smsId", smsId);
        map.put("mobile", mobile);
        map.put("message", message);
        String sign = Md5Util.getMd5Upper(APP_ID + smsId + mobile + APP_SECRET);
        map.put("sign", sign);

        /**调用接口得到返回结果*/
        String responseResult = HttpUtil.post(URL, map);

        /**分析结果*/
        Map<String, Object> reMap = JSONUtil.parseObj(responseResult);
        String code = (String) reMap.get("code");
        String msg = (String) reMap.get("message");
        result.setCode(code);
        result.setMessage(msg);

        return result;
    }

}
