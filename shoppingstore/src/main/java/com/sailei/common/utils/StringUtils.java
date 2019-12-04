package com.sailei.common.utils;

import com.xiaoleilu.hutool.date.DateUtil;
import org.apache.commons.lang3.text.StrBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.DecimalFormat;
import java.util.Date;

/**
 * 功能描述：字符串工具类
 *
 * @Author sailei
 * @Date 2018/2/13 13:38
 */
public class StringUtils extends org.apache.commons.lang3.StringUtils {

    private static final Logger logger = LoggerFactory.getLogger(StringUtils.class);

    /**
     * 转换格式 金额保留n位小数点
     * 金额保留n位小数,Double 类型的数据后面补0使其变成#####.****的格式
     *
     * @param object
     * @return
     */
    public static String fmtAmount(Object object, int n) {
        if (object == null) {
            return "";
        }
        Double d;
        try {
            d = Double.parseDouble(object.toString());
        } catch (Exception e) {
            logger.error("【转换格式】转换出错：" + e.getMessage() + ",object=" + object);
            return object.toString();
        }
        String wei = "00";
        for (int i = 2; i < n; i++) {
            wei += "0";
        }
        if (d == 0) {
            return "0." + wei;
        }
        DecimalFormat df = new DecimalFormat("#." + wei);
        String result = df.format(d);
        /**下面涉及到0.01这样的特殊情况，防止把前面的0去掉了。*/
        if (result.startsWith(".")) {
            result = "0" + result;
        }
        /**下面涉及到-0.01这样的特殊情况，防止把前面的0去掉了。*/
        if (result.startsWith("-.")) {
            result = result.replaceAll("-", "-0");
        }

        return result;
    }

    /**
     * 转化“,”分隔的ids为'a','b','c'格式
     *
     * @param ids 原字符串
     */
    public static String changeString(String ids) {
        StringBuffer result = new StringBuffer();
        String[] strs = ids.split(",");
        if (strs.length > 1) {
            for (String str : strs) {
                if (!ToolUtils.isEmpty(str)) {
                    result.append("'");
                    result.append(str);
                    result.append("',");
                }
            }
            result.deleteCharAt(result.length() - 1);
        } else {
            return "'" + strs[0] + "'";
        }
        return result.toString();
    }

    /** 
     * 描述:获取当前时间的yyyy-MM-dd HH:mm:ss格式
     *  
     * @Author sailei
     * @Date 2019/9/19 13:31
     */
    public static String getDateTime(){
        return DateUtil.format(new Date(), "yyyy-MM-dd HH:mm:ss");
    }

    /** 
     * 描述:获取指定格式的当前时间
     *  
     * @Author sailei
     * @Date 2019/9/19 13:31
     */
    public static String getDateTime(String format) {
        return DateUtil.format(new Date(), format);
    }

    /**
     * 驼峰首字符小写
     */
    public static String uncapitalize(String str) {
        int strLen;
        if (str == null || (strLen = str.length()) == 0) {
            return str;
        }
        return new StrBuilder(strLen).append(Character.toLowerCase(str.charAt(0))).append(str.substring(1)).toString();
    }

    /**
     * 驼峰命名法工具
     * @return
     * 		toCamelCase("hello_world") == "helloWorld"
     * 		toCapitalizeCamelCase("hello_world") == "HelloWorld"
     * 		toUnderScoreCase("helloWorld") = "hello_world"
     */
    public static String toCapitalizeCamelCase(String s) {
        if (s == null) {
            return null;
        }
        s = toCamelCase(s);
        return s.substring(0, 1).toUpperCase() + s.substring(1);
    }

    /**
     * 驼峰命名法工具
     *
     * @return toCamelCase(" hello_world ") == "helloWorld"
     * toCapitalizeCamelCase("hello_world") == "HelloWorld"
     * toUnderScoreCase("helloWorld") = "hello_world"
     */
    public static String toCamelCase(String s) {
        if (s == null) {
            return null;
        }

        s = s.toLowerCase();

        StringBuilder sb = new StringBuilder(s.length());
        boolean upperCase = false;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);

            if (c == '_') {
                upperCase = true;
            } else if (upperCase) {
                sb.append(Character.toUpperCase(c));
                upperCase = false;
            } else {
                sb.append(c);
            }
        }

        return sb.toString();
    }

    /**
     * 下划线转驼峰命名
     */
    public static String toUnderScoreCase(String s) {
        if (s == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        boolean upperCase = false;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);

            boolean nextUpperCase = true;

            if (i < (s.length() - 1)) {
                nextUpperCase = Character.isUpperCase(s.charAt(i + 1));
            }

            if ((i > 0) && Character.isUpperCase(c)) {
                if (!upperCase || !nextUpperCase) {
                    sb.append("_");
                }
                upperCase = true;
            } else {
                upperCase = false;
            }

            sb.append(Character.toLowerCase(c));
        }

        return sb.toString();
    }

}
