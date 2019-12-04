package com.sailei.config.filter;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Arrays;

/**
 * 描述:过滤器配置中心
 *
 * @Author sailei
 * @Date 2019/7/19 15:20
 **/
@Configuration
public class FilterConfig {

    @Bean
    public FilterRegistrationBean xssFilterRegistrationBean() {
        XssFilter xssFilter = new XssFilter();
        /** 这里可以加不被xss过滤的接口 */
        xssFilter.setUrlExclusion(Arrays.asList("/sys/dictType/edit", "/sys/dictType/add"));
        FilterRegistrationBean registration = new FilterRegistrationBean(xssFilter);
        registration.addUrlPatterns("/*");
        return registration;
    }

    /**
     * 多个过滤器继续在下面添加
     */
}
