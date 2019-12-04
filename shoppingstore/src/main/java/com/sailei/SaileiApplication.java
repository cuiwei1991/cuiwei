package com.sailei;

import com.sailei.common.base.UserfilesDownloadServlet;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * 描述:程序入口
 * 移植到多模块或cloud时可忽略 @EnableSwagger2 @EnableScheduling
 *
 * @Author sailei
 * @date 2019/7/2 13:56 
 **/
@EnableScheduling
@EnableSwagger2
@SpringBootApplication
public class SaileiApplication {

    public static void main(String[] args) {
        SpringApplication.run(SaileiApplication.class, args);
    }

    @Bean
    public ServletRegistrationBean servletRegistrationBean() {
        return new ServletRegistrationBean(new UserfilesDownloadServlet(), "/staticFiles/*");
    }
}
