package com.sailei.config;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * 描述:整体参数工具类测试
 *
 * @Author sailei
 * @Date 2019/7/2 13:59
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class GlobalBeanTest {
    
    /**
     * 记录日志
     */
    private static Logger logger = LoggerFactory.getLogger(GlobalBeanTest.class);

    @Test
    public void testGlobalBean() {
        logger.info("GlobalBean.REDIS_ENABLE" + GlobalBean.REDIS_ENABLE);
        logger.info("GlobalBean.REDIS_POST" + GlobalBean.REDIS_POST);
        logger.info("GlobalBean.REDIS_HOST" + GlobalBean.REDIS_HOST);
        logger.info("GlobalBean.REDIS_PASSWORD" + GlobalBean.REDIS_PASSWORD);
        logger.info("GlobalBean.REDIS_DATABASE" + GlobalBean.REDIS_DATABASE);
        logger.info("GlobalBean.RABBITMQ_HOST" + GlobalBean.RABBITMQ_HOST);
        logger.info("GlobalBean.RABBITMQ_PORT" + GlobalBean.RABBITMQ_PORT);
        logger.info("GlobalBean.RABBITMQ_USERNAME" + GlobalBean.RABBITMQ_USERNAME);
        logger.info("GlobalBean.RABBITMQ_PASSWORD" + GlobalBean.RABBITMQ_PASSWORD);
    }
}
