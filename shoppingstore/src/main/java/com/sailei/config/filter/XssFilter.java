package com.sailei.config.filter;

import javax.servlet.*;
import javax.servlet.FilterConfig;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * 描述:防止Xss攻击过滤器
 *
 * @Author sailei
 * @Date 2019/7/19 15:21
 **/
public class XssFilter implements Filter{

    javax.servlet.FilterConfig filterConfig = null;
    private List<String> urlExclusion = null;

    public XssFilter() {
    }

    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }

    public void destroy() {
        this.filterConfig = null;
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest)request;
        String servletPath = httpServletRequest.getServletPath();
        if (this.urlExclusion != null && this.urlExclusion.contains(servletPath)) {
            chain.doFilter(request, response);
        } else {
            chain.doFilter(new XssHttpServletRequestWrapper((HttpServletRequest)request), response);
        }

    }

    public List<String> getUrlExclusion() {
        return this.urlExclusion;
    }

    public void setUrlExclusion(List<String> urlExclusion) {
        this.urlExclusion = urlExclusion;
    }
}
