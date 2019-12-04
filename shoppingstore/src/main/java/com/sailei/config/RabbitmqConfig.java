/*
package com.sailei.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

*/
/**
 * 描述:Direct Exchange 直接匹配 配置中心
 *
 * @Author sailei
 * @Date 2019/7/2 13:54
 **//*

@Configuration
public class RabbitmqConfig {

    */
/**
     * 声明消息通知类队列
     *//*

    @Bean
    public Queue messageQueue() {
        return new Queue("messageQueue", true, false, false);
    }

    */
/**
     * 声明用户类型队列
     *//*

    @Bean
    public Queue userQueue() {
        return new Queue("userQueue", true, false, false);
    }

    */
/**
     * 声明商城类型队列
     *//*

    @Bean
    public Queue mallQueue() {
        return new Queue("logQueue", true, false, false);
    }

    */
/**
     * 声明主交换机
     *//*

    @Bean
    DirectExchange directexchange() {
        return new DirectExchange("saileiExchange");
    }

    */
/**
     * 定义绑定sailei 发送routingkey为sailei的消息时 messageQueue能够收到
     *
     * @param messageQueue   队列
     * @param directexchange 交换机
     *//*

    @Bean
    Binding bindingExchangeOrange(Queue messageQueue, DirectExchange directexchange) {
        return BindingBuilder.bind(messageQueue).to(directexchange).with("sailei");
    }


}
*/
