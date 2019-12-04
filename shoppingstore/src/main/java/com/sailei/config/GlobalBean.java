package com.sailei.config;

/**
 * 描述:定义公共变量类
 *
 * @Author sailei
 * @Date 2019/7/2 13:54
 **/
public class GlobalBean {

    /**
     * Redis配置参数
     */
    public static String REDIS_ENABLE;
    public static String REDIS_HOST;
    public static String REDIS_POST;
    public static String REDIS_PASSWORD;
    public static String REDIS_DATABASE;

    /**
     * rabbitmq配置参数
     */
    public static String RABBITMQ_HOST;
    public static String RABBITMQ_PORT;
    public static String RABBITMQ_USERNAME;
    public static String RABBITMQ_PASSWORD;

    /**
     * swagger启用/禁用
     */
    public static String SWAGGER_ACTIVE;

    /**
     * email配置参数
     */
    public static String EMAIL_FROM;
    public static String EMAIL_PASSWORD;

    public static void setRedisEnable(String redisEnable) {
        REDIS_ENABLE = redisEnable;
    }

    public static void setRedisHost(String redisHost) {
        REDIS_HOST = redisHost;
    }

    public static void setRedisPost(String redisPost) {
        REDIS_POST = redisPost;
    }

    public static void setRedisPassword(String redisPassword) {
        REDIS_PASSWORD = redisPassword;
    }

    public static void setRedisDatabase(String redisDatabase) {
        REDIS_DATABASE = redisDatabase;
    }

    public static void setRabbitmqHost(String rabbitmqHost) {
        RABBITMQ_HOST = rabbitmqHost;
    }

    public static void setRabbitmqPort(String rabbitmqPort) {
        RABBITMQ_PORT = rabbitmqPort;
    }

    public static void setRabbitmqUsername(String rabbitmqUsername) {
        RABBITMQ_USERNAME = rabbitmqUsername;
    }

    public static void setRabbitmqPassword(String rabbitmqPassword) {
        RABBITMQ_PASSWORD = rabbitmqPassword;
    }

    public static void setSwaggerActive(String swaggerActive) {
        SWAGGER_ACTIVE = swaggerActive;
    }

    public static void setEmailFrom(String emailFrom) {
        EMAIL_FROM = emailFrom;
    }

    public static void setEmailPassword(String emailPassword) {
        EMAIL_PASSWORD = emailPassword;
    }
}
