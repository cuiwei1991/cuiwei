package com.sailei.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

/**
 * 功能描述：初始化配置参数
 *
 * @Author sailei
 * @Date: 2018/5/9 11:07
 */
@Configuration
public class GlobleBeanConfig {
    @Autowired
    private Environment env;

    @Bean
    public int readConf() {

        GlobalBean.setRedisEnable(env.getProperty("spring.redis.enable"));
        GlobalBean.setRedisHost(env.getProperty("spring.redis.host"));
        GlobalBean.setRedisPost(env.getProperty("spring.redis.port"));
        GlobalBean.setRedisPassword(env.getProperty("spring.redis.password"));
        GlobalBean.setRedisDatabase(env.getProperty("spring.redis.database"));

        GlobalBean.setRabbitmqHost(env.getProperty("spring.rabbitmq.host"));
        GlobalBean.setRabbitmqPort(env.getProperty("spring.rabbitmq.port"));
        GlobalBean.setRabbitmqUsername(env.getProperty("spring.rabbitmq.username"));
        GlobalBean.setRabbitmqPassword(env.getProperty("spring.rabbitmq.password"));

        GlobalBean.setSwaggerActive(env.getProperty("swagger.active"));

        GlobalBean.setEmailFrom(env.getProperty("crm.email.from"));
        GlobalBean.setEmailPassword(env.getProperty("crm.email.password"));

        return 1;
    }
}
