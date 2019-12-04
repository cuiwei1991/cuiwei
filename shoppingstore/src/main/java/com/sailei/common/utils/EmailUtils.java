package com.sailei.common.utils;

import com.sailei.config.GlobalBean;
import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 描述: 邮件工具类
 *
 * @Author sailei
 * @Date 2019/7/2 16:42
 **/
public class EmailUtils {

    private static final String CHARSET = "utf-8";
    private static final String EMAIL_FROM_NAME = "赛雷";

    /**
     * 记录日志
     */
    public static final Logger logger = LoggerFactory.getLogger(EmailUtils.class);

    private static Map<String, String> hostMap = new HashMap();

    /**
     * 添加主要邮箱
     */
    static {
        hostMap.put("smtp.126", "smtp.126.com");
        hostMap.put("smtp.qq", "smtp.qq.com");
        hostMap.put("smtp.163", "smtp.163.com");
        hostMap.put("smtp.sina", "smtp.sina.com.cn");
        hostMap.put("smtp.tom", "smtp.tom.com");
        hostMap.put("smtp.263", "smtp.263.net");
        hostMap.put("smtp.yahoo", "smtp.mail.yahoo.com");
        hostMap.put("smtp.hotmail", "smtp.live.com");
        hostMap.put("smtp.gmail", "smtp.gmail.com");
        hostMap.put("smtp.port.gmail", "465");
    }

    /**
     * 从邮箱地址中获取Host
     **/
    public static String getHost(String email) throws Exception {
        Pattern pattern = Pattern.compile("\\w+@(\\w+)(\\.\\w+){1,2}");
        Matcher matcher = pattern.matcher(email);
        String key = "unSupportEmail";
        if (matcher.find()) {
            key = "smtp." + matcher.group(1);
        }
        if (hostMap.containsKey(key)) {
            return hostMap.get(key);
        }

        logger.error("unSupportEmail,获取Host失败");
        return null;
    }

    /**
     * 获取邮箱协议
     */
    public static int getSmtpPort(String email) throws Exception {
        Pattern pattern = Pattern.compile("\\w+@(\\w+)(\\.\\w+){1,2}");
        Matcher matcher = pattern.matcher(email);
        String key = "unSupportEmail";
        if (matcher.find()) {
            key = "smtp.port." + matcher.group(1);
        }
        if (hostMap.containsKey(key)) {
            return Integer.parseInt(hostMap.get(key));
        } else {
            return 25;
        }
    }

    /**
     * 发送普通邮件
     *
     * @param toMailAddr 收信人地址
     * @param subject    email主题
     * @param message    发送email信息
     */
    public static void sendCommonMail(String toMailAddr, String subject, String message) {
        HtmlEmail hemail = new HtmlEmail();
        try {
            hemail.setHostName(getHost(GlobalBean.EMAIL_FROM));
            hemail.setSmtpPort(getSmtpPort(GlobalBean.EMAIL_FROM));
            hemail.setCharset(CHARSET);
            hemail.addTo(toMailAddr);
            hemail.setFrom(GlobalBean.EMAIL_FROM, EMAIL_FROM_NAME);
            hemail.setAuthentication(GlobalBean.EMAIL_FROM, GlobalBean.EMAIL_PASSWORD);
            hemail.setSubject(subject);
            hemail.setMsg(message);
            hemail.send();
            logger.info("【发送普通邮件】发送成功!");
        } catch (Exception e) {
            logger.error("【发送普通邮件】发送失败：" + e.getMessage());
        }

    }

}
