package com.sailei.common.utils;

import com.xiaoleilu.hutool.http.HttpUtil;
import com.xiaoleilu.hutool.json.JSONUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

/**
 * 根据IP地址获取详细的地域信息
 * 淘宝API : http://ip.taobao.com/service/getIpInfo.php?ip=218.192.3.42
 * 新浪API : http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=218.192.3.42
 *
 * @Author sailei
 * @Date 2019年6月16日 下午1:46:37
 */
public class AddressUtils {

    /**
     * 记录日志
     */
    private static Logger logger = LoggerFactory.getLogger(AddressUtils.class);

    /**
     * 接口获取IP详情
     *
     * @param content 请求的参数 格式为：name=xxx&pwd=xxx
     */
    public static String getAddresses(String content) throws UnsupportedEncodingException {
        /**
         * 这里调用淘宝API
         */
        String urlStr = "http://ip.taobao.com/service/getIpInfo.php";
        Map<String, Object> map = new HashMap<>();
        map.put("ip", content);
        String returnStr = HttpUtil.post(urlStr, map);

        if (returnStr != null) {
            /** 转换成中文 */
            returnStr = decodeUnicode(returnStr);
            String[] temp = returnStr.split(",");
            if (temp.length < 3) {
                return "0";//无效IP，局域网测试
            }
            return returnStr;
        }
        return null;
    }

    /**
     * unicode 转换成 中文
     *
     * @param theString
     */
    public static String decodeUnicode(String theString) {
        char aChar;
        int len = theString.length();
        StringBuffer outBuffer = new StringBuffer(len);
        for (int x = 0; x < len; ) {
            aChar = theString.charAt(x++);
            if (aChar == '\\') {
                aChar = theString.charAt(x++);
                if (aChar == 'u') {
                    int value = 0;
                    for (int i = 0; i < 4; i++) {
                        aChar = theString.charAt(x++);
                        switch (aChar) {
                            case '0':
                            case '1':
                            case '2':
                            case '3':
                            case '4':
                            case '5':
                            case '6':
                            case '7':
                            case '8':
                            case '9':
                                value = (value << 4) + aChar - '0';
                                break;
                            case 'a':
                            case 'b':
                            case 'c':
                            case 'd':
                            case 'e':
                            case 'f':
                                value = (value << 4) + 10 + aChar - 'a';
                                break;
                            case 'A':
                            case 'B':
                            case 'C':
                            case 'D':
                            case 'E':
                            case 'F':
                                value = (value << 4) + 10 + aChar - 'A';
                                break;
                            default:
                                throw new IllegalArgumentException(
                                        "Malformed      encoding.");
                        }
                    }
                    outBuffer.append((char) value);
                } else {
                    if (aChar == 't') {
                        aChar = '\t';
                    } else if (aChar == 'r') {
                        aChar = '\r';
                    } else if (aChar == 'n') {
                        aChar = '\n';
                    } else if (aChar == 'f') {
                        aChar = '\f';
                    }
                    outBuffer.append(aChar);
                }
            } else {
                outBuffer.append(aChar);
            }
        }
        return outBuffer.toString();
    }

    /**
     * 根据IP获取城市
     *
     * @param ip
     */
    public static String getAddressByIp(String ip) {
        if (!ipCheck(ip)) {
            return null;
        }
        String json_result;
        try {
            json_result = AddressUtils.getAddresses(ip);
            Map<String, Object> map = JSONUtil.parseObj(json_result);
            String data = map.get("data").toString();
            Map<String, Object> mapData = JSONUtil.parseObj(data);
            String country = (String) mapData.get("country");
            String region = (String) mapData.get("region");
            String city = (String) mapData.get("city");
            String county = (String) mapData.get("county");
            String isp = (String) mapData.get("isp");
            String area = (String) mapData.get("area");
            logger.info("国家： " + country);
            logger.info("地区： " + area);
            logger.info("省份: " + region);
            logger.info("城市： " + city);
            logger.info("区/县： " + county);
            logger.info("互联网服务提供商： " + isp);
            return city;
        } catch (UnsupportedEncodingException e) {
            logger.error(e.getMessage());
        }
        return null;
    }


    /**
     * 校验IP是否正确
     *
     * @param text IP地址
     * @return
     */
    public static boolean ipCheck(String text) {
        if (text != null && !text.isEmpty()) {
            /** 定义正则表达式 */
            String regex = "^(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[1-9])\\."
                    + "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\."
                    + "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\."
                    + "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)$";
            /** 判断ip地址是否与正则表达式匹配 */
            if (text.matches(regex)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 获取用户真实IP地址，不使用request.getRemoteAddr();的原因是有可能用户使用了代理软件方式避免真实IP地址,
     *
     * 可是，如果通过了多级反向代理的话，X-Forwarded-For的值并不止一个，而是一串IP值，究竟哪个才是真正的用户端的真实IP呢？
     * 答案是取X-Forwarded-For中第一个非unknown的有效IP字符串。
     *
     * 如：X-Forwarded-For：192.168.1.110, 192.168.1.120, 192.168.1.130,
     * 192.168.1.100
     *
     * 用户真实IP为： 192.168.1.110
     *
     * @param request
     * @return
     */
    public static String getIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        try{
            if (ToolUtils.isEmpty(ip)) {
                ip = request.getHeader("Proxy-Client-IP");
            }
            if (ToolUtils.isEmpty(ip)) {
                ip = request.getHeader("WL-Proxy-Client-IP");
            }
            if (ToolUtils.isEmpty(ip)) {
                ip = request.getHeader("HTTP_CLIENT_IP");
            }
            if (ToolUtils.isEmpty(ip)) {
                ip = request.getHeader("HTTP_X_FORWARDED_FOR");
            }
            if (ToolUtils.isEmpty(ip)) {
                ip = request.getRemoteAddr();
            }

            /**如果传输中由多个IP，截取第一个。*/
            if(ip.indexOf(", ") != -1){
                ip = ip.substring(0, ip.indexOf(", "));
            }
        }catch (Exception e){
            logger.error("【获取请求IP地址】处理IP地址时出错！");
        }
        return ip;
    }

}

