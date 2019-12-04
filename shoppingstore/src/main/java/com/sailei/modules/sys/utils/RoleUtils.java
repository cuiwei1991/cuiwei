package com.sailei.modules.sys.utils;

import com.sailei.common.redis.RedisUtil;
import com.sailei.config.shiro.ShiroKit;
import com.sailei.modules.sys.entity.User;

import java.util.List;

/**
 * 角色工具类
 *
 * @Author gaojin
 * @Date 2019-5-27 12:22:00
 */
public class RoleUtils {

    public static final String ROLE_CACHE = "ROLE:";

    /**
     * 返回用户的所有角色列表结果以 '','',''方式
     * 如果用户是admin直接返回admin
     *
     * @return String
     */
    public static String getUserRoles() {
        User user = ShiroKit.getUserNotNull();
        String key = ROLE_CACHE + user.getUserId();
        String result = RedisUtil.getKeyStr(key);
        if (result == null) {
            /** admin拥有最高权限，所有菜单都可以访问。 */
            if ("admin".equals(user.getAccount())) {
                result = "admin";
            } else {
                /** 非admin用户根据用户拥有的角色查询拥有的菜单权限 */
                List<String> roleList = user.getRoles();
                if (roleList != null && roleList.size() > 0) {
                    StringBuffer roles = new StringBuffer();
                    for (String role : roleList) {
                        roles.append(role);
                        roles.append(",");
                    }
                    roles.deleteCharAt(roles.length() - 1);
                    result = roles.toString();
                }
            }
            RedisUtil.setKeyStr(key, result, -1);
        }

        return result;
    }

    /**
     * 清除所有角色缓存
     */
    public static void deleteAll() {
        RedisUtil.deleteLikeKey(ROLE_CACHE + "*");
        RedisUtil.deleteLikeKey(MenuUtils.MENU_CACHE + "*");
    }

}
