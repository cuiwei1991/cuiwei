package com.sailei.common.service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 接口服务返回结果统一实体类
 *
 * @Author sailei
 */
@ApiModel(description = "返回结果类")
public class ServiceResult<T> {
    /**
     * 成功代码
     */
    public static final String STATUS_SUCCEED = "000";
    /**
     * 请求参数错误
     */
    public static final String PARAMETER_ERROR = "100";
    /**
     * 签名验证失败
     */
    public static final String SIGN_ERROR = "101";
    /**
     * 登录超时，请重新登录！
     */
    public static final String LOGIN_TIME_OUT_ERROR = "102";
    /**
     * 用户不存在
     */
    public static final String NO_USER = "049";
    /**
     * 部分成功
     */
    public static final String PART_SUCCESS = "046";
    /**
     * 金额不匹配
     */
    public static final String AMOUNT_MISMATCH = "044";
    /**
     * 还款计划不存在
     */
    public static final String NO_REPAY_INFO = "043";
    /**
     * 余额不足
     */
    public static final String NO_ENOUGH_BALANCE = "042";
    /**
     * 系统错误
     */
    public static final String SYSTEM_ERROR = "555";

    /**
     * 返回结果编码
     */
    @ApiModelProperty(value = "返回结果编码 999 失败 000 成功")
    private String code = "999";
    /**
     * 返回结果详情
     */
    @ApiModelProperty(value = "返回结果详情")
    private String message = "失败！";
    /**
     * 返回结果对象
     */
    @ApiModelProperty(value = "返回结果对象")
    private T result;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getResult() {
        return result;
    }

    public void setResult(T result) {
        this.result = result;
    }

    @Override
    public String toString() {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        return gson.toJson(this);
    }
}
