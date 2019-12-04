package com.sailei.common.rebbitmq;

import com.sailei.common.base.SpringContextHolder;
import com.sailei.modules.sys.entity.User;
import com.sailei.modules.sys.service.LoginLogService;
import com.sailei.modules.sys.service.OperationLogService;
import com.sailei.modules.sys.utils.UserUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * 描述:消息队列工具类
 *
 * @Author sailei
 * @Date 2019/7/2 13:53
 **/
public class RabbitMqUtil {

    /**
     * 记录日志
     */
    public static final Logger logger = LoggerFactory.getLogger(RabbitMqUtil.class);

    public static final String USER_LOGIN_NOTICE = "USER_LOGIN_NOTICE";
    public static final String OPTION_LOG_NOTICE = "OPTION_LOG_NOTICE";

    private static LoginLogService loginLogService = SpringContextHolder.getBean(LoginLogService.class);
    private static OperationLogService operationLogService = SpringContextHolder.getBean(OperationLogService.class);

    /**
     * 获取rabbitmq链接
     */
    /*public static Connection getConnection() throws Exception {
        Connection connection = null;
        try {
            *//**定义连接工厂*//*
            ConnectionFactory factory = new ConnectionFactory();
            *//**设置服务地址*//*
            factory.setHost(GlobalBean.RABBITMQ_HOST);
            *//**端口*//*
            factory.setPort(Integer.valueOf(GlobalBean.RABBITMQ_PORT));
            *//**设置账号信息，用户名、密码、vhost(指定用户能访问一个虚拟机)*//*
            factory.setUsername(GlobalBean.RABBITMQ_USERNAME);
            factory.setPassword(GlobalBean.RABBITMQ_PASSWORD);
            connection = factory.newConnection();
        } catch (Exception e) {
            logger.error("【获取rabbitmq链接】发生错误：" + e.getMessage());
        }

        return connection;
    }

    *//**
     * 发送RabbitMq消息
     *
     * @param queue   消息队列
     * @param message 消息内容 json格式的字符串
     *//*
    public static boolean sendMessage(String queue, String message) {
        boolean result = false;
        try {
            *//**获取到连接以及mq通道*//*
            Connection connection = getConnection();
            Channel channel = connection.createChannel();
            if (channel != null) {
                *//**发送消息*//*
                channel.basicPublish("", queue, null, message.getBytes("utf-8"));
                result = true;
            }

            if (channel != null) {
                channel.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            logger.error("【发送RabbitMq消息】发生错误：" + e.getMessage());
        }
        return result;
    }*/

    /**
     * 描述:发送特定类型的消息
     * 记录日志 不能影响正常业务
     *
     * @Author sailei
     * @Date 2019/8/20 9:24
     */
    public static boolean sendLogMessage(String type, String title, String logType, Object bean){
        try{
            User user = UserUtils.getUser();
            /*Gson gson = new Gson();*/
            Map<String,Object> map = new HashMap<>();
            map.put("type", type);
            map.put("title", title);
            map.put("userId", user != null ? user.getUserId() : "");
            map.put("logType", logType);
            map.put("bean", bean);
            if(USER_LOGIN_NOTICE.equals(type)){
                loginLogService.createLog(map);
            }else{
                operationLogService.createLog(map);
            }
            return true;
        }catch(Exception e){
            logger.error("保存日志出错:", e);
        }
        return false;
    }

    /**
     * 描述:发送登录日志MQ
     * 记录日志 不能影响正常业务
     *
     * @Author sailei
     * @Date 2019/8/20 9:24
     */
    public static boolean sendLogLogin(String title, String logType, String ip){
        return sendLogMessage(USER_LOGIN_NOTICE, title, logType, ip);
    }

    /**
     * 描述:发送业务日志MQ
     * 记录日志 不能影响正常业务
     *
     * @Author sailei
     * @Date 2019/8/20 9:24
     */
    public static boolean sendLogOption(String title, String logType, Object bean){
        return sendLogMessage(OPTION_LOG_NOTICE, title, logType, bean);
    }

}
