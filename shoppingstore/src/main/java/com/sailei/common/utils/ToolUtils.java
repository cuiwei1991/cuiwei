package com.sailei.common.utils;

import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

/**
 * 描述:
 *
 * @Author sailei
 * @Date 2019/7/15 18:21
 **/
public class ToolUtils {
    
    /** 
     * 描述:判断对象是否为空
     *  
     * @Author sailei
     * @Date 2019/7/21 9:57
     */
    public static boolean isEmpty(Object o) {
        if (o == null) {
            return true;
        } else {
            if (o instanceof String) {
                if (o.toString().trim().equals("")) {
                    return true;
                }
            } else if (o instanceof List) {
                if (((List)o).size() == 0) {
                    return true;
                }
            } else if (o instanceof Map) {
                if (((Map)o).size() == 0) {
                    return true;
                }
            } else if (o instanceof Set) {
                if (((Set)o).size() == 0) {
                    return true;
                }
            } else if (o instanceof Object[]) {
                if (((Object[])o).length == 0) {
                    return true;
                }
            } else if (o instanceof int[]) {
                if (((int[])o).length == 0) {
                    return true;
                }
            } else if (o instanceof long[] && ((long[])((long[])o)).length == 0) {
                return true;
            }

            return false;
        }
    }
    
    /** 
     * 描述:判断对象是否不为空
     *  
     * @Author sailei
     * @Date 2019/7/21 10:03
     */
    public static boolean isNotEmpty(Object o) {
        return !isEmpty(o);
    }

    /** 
     * 描述:获取加密研
     *  
     * @Author sailei
     * @Date 2019/7/21 10:03
     */
    public static String getRandomString(int length) {
        String base = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();

        for(int i = 0; i < length; ++i) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }

        return sb.toString();
    }
    
    /** 
     * 描述:判断多个对象是否存在为空的对象
     *  
     * @Author sailei
     * @Date 2019/7/21 10:04
     */
    public static boolean isOneEmpty(Object... os) {
        Object[] var1 = os;
        int var2 = os.length;

        for(int var3 = 0; var3 < var2; ++var3) {
            Object o = var1[var3];
            if (isEmpty(o)) {
                return true;
            }
        }

        return false;
    }


}
