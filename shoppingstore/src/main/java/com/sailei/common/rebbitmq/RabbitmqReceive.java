/*
package com.sailei.common.rebbitmq;

import com.rabbitmq.client.Channel;
import com.sailei.common.service.ServiceResult;
import com.sailei.modules.sys.service.LoginLogService;
import com.sailei.modules.sys.service.OperationLogService;
import com.xiaoleilu.hutool.json.JSONUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.util.Map;

*/
/**
 * 描述:接收rabbitmq消息
 *
 * @Author sailei
 * @Date 2019/7/2 13:53
 **//*

@Component
public class RabbitmqReceive {

    */
/**
     * 记录日志
     *//*

    private Logger logger = LoggerFactory.getLogger(RabbitmqReceive.class);
    @Autowired
    private LoginLogService loginLogService;
    @Autowired
    private OperationLogService operationLogService;
    */
/**
     * 接收通知消息
     *
     * @param message
     * @param channel
     *//*

    @RabbitListener(queues = "logQueue")
    public void receivSendMail(Message message, Channel channel) {
        String messageRec = new String(message.getBody());

        try {
            Map<String, Object> map = JSONUtil.parseObj(messageRec);
            logger.info("【接收通知消息】message=" + map);
            String type = (String) map.get("type");
            */
/** 只接受支持的类型消息 *//*

            if (StringUtils.isEmpty(type)) {
                logger.warn("【接收通知消息】告诉rabbitmq不接收此类型消息，重新放回到队列!");
                channel.basicNack(message.getMessageProperties().getDeliveryTag(), false, true);
            }

            */
/** 处理发货通知类型的消息 *//*

            if (RabbitMqUtil.USER_LOGIN_NOTICE.equals(type)) {
                */
/** 登录日志 *//*

                ServiceResult result = loginLogService.createLog(map);
                if(!ServiceResult.STATUS_SUCCEED.equals(result.getCode())){
                    logger.error("【接收通知消息】消息处理失败，详情:" + messageRec);
                }
            } else {
                */
/** 业务日志 *//*

                ServiceResult result = operationLogService.createLog(map);
                if(!ServiceResult.STATUS_SUCCEED.equals(result.getCode())){
                    logger.error("【接收通知消息】消息处理失败，详情:" + messageRec);
                }
            }

            */
/**
             * 处理逻辑结束通知rabbitmq
             *//*

            channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
        } catch (Exception e) {
            logger.error("【接收通知消息】接受消息时报错=" + e.getMessage());
            try {
                channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
            } catch (IOException e1) {
            }
        }
    }


}
*/
