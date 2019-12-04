package com.sailei.config.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/**
 * 描述:防止Xss攻击过滤器主方法
 *
 * @Author sailei
 * @Date 2019/7/19 15:24
 **/
public class XssHttpServletRequestWrapper extends HttpServletRequestWrapper {
    public XssHttpServletRequestWrapper(HttpServletRequest servletRequest) {
        super(servletRequest);
    }

    public String[] getParameterValues(String parameter) {
        String[] values = super.getParameterValues(parameter);
        if (values == null) {
            return null;
        } else {
            int count = values.length;
            String[] encodedValues = new String[count];

            for(int i = 0; i < count; ++i) {
                encodedValues[i] = this.cleanXSS(values[i]);
            }

            return encodedValues;
        }
    }

    public String getParameter(String parameter) {
        String value = super.getParameter(parameter);
        return value == null ? null : this.cleanXSS(value);
    }

    public String getHeader(String name) {
        String value = super.getHeader(name);
        return value == null ? null : this.cleanXSS(value);
    }
    
    /** 
     * 描述:过滤特殊字符
     *  
     * @Author sailei
     * @Date 2019/7/21 10:08
     */
    private String cleanXSS(String value) {
        value = value.replaceAll("<", "& lt;").replaceAll(">", "& gt;");
        value = value.replaceAll("\\(", "& #40;").replaceAll("\\)", "& #41;");
        value = value.replaceAll("'", "& #39;");
        value = value.replaceAll("eval\\((.*)\\)", "");
        value = value.replaceAll("[\\\"\\'][\\s]*javascript:(.*)[\\\"\\']", "\"\"");
        value = value.replaceAll("script", "");
        return value;
    }
}
