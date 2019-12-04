package com.sailei.common.base;

import java.io.Serializable;
import java.util.List;

/**
 * 描述:Layui分页
 *
 * @Author sailei
 * @Date 2019/7/19 18:18
 */
public class LayuiPage implements Serializable {

    private static final long serialVersionUID = 1L;

    private int code = 0;

    private String msg = "请求成功";
    /**
     * 总记录数
     */
    private long count;
    /**
     * 列表数据
     */
    private List<?> data;

    public LayuiPage(List<?> data, long count) {
        this.data = data;
        this.count = count;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public long getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public void setCount(long count) {
        this.count = count;
    }
}
