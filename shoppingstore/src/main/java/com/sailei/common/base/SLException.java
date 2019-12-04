package com.sailei.common.base;

/**
 * 描述:自定义异常类
 *
 * @Author sailei
 * @Date 2019/7/21 15:00
 **/
public class SLException extends Exception {

    private String msg;
    private int code = 500;

    public SLException(String msg) {
        super(msg);
        this.msg = msg;
    }

    public SLException(String msg, Throwable e) {
        super(msg, e);
        this.msg = msg;
    }

    public SLException(String msg, int code) {
        super(msg);
        this.msg = msg;
        this.code = code;
    }

    public SLException(String msg, int code, Throwable e) {
        super(msg, e);
        this.msg = msg;
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
