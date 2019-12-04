package com.sailei.common.base;

import com.google.gson.Gson;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

/**
 * 描述:系统日志，切面处理类
 *
 * @Author sailei
 * @date 2019/7/8 15:31
 **/
@Aspect
@Component
public class LogAspect {
    private final Logger logger = LoggerFactory.getLogger(LogAspect.class);
    ThreadLocal<Long> startTime = new ThreadLocal<>();

    /**
     * 切入点描述 这个是controller包的切入点
     */
    @Pointcut("execution(public * com.sailei.modules..controller..*.*(..))")
    public void webLog(){}

    /**
     * 描述:在切入点的方法run之前要干的
     *  
     * @Author sailei
     * @Date 2019/7/8 15:57
     */
    @Before("webLog()")
    public void logBeforeController(JoinPoint joinPoint) {
        startTime.set(System.currentTimeMillis());
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        String url = request.getRequestURI().toString();
        /**
         * 记录下请求内容
         */
        /*logger.info("【" + url + "】请求参数:" + Arrays.toString(joinPoint.getArgs()));*/
    }
    
    /**
     * 描述:在切入点的方法run之后要干的
     *  
     * @Author sailei
     * @Date 2019/7/8 16:03
     */
    @AfterReturning(returning = "ret", pointcut = "webLog()")
    public void doAfterReturning(Object ret) {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        String url = request.getRequestURI().toString();
        /**
         * 记录返回结果及时间
         */
        Gson gson = new Gson();
        /*logger.info("【" + url + "】返回结果:" + gson.toJson(ret));
        logger.info("【" + url + "】处理时间】:" + (System.currentTimeMillis() - startTime.get()));*/
        startTime.remove();
    }

}
