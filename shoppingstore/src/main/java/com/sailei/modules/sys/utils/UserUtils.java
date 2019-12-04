package com.sailei.modules.sys.utils;

import com.sailei.common.base.SpringContextHolder;
import com.sailei.common.redis.RedisUtil;
import com.sailei.config.shiro.ShiroKit;
import com.sailei.modules.sys.entity.User;
import com.sailei.modules.sys.service.UserService;

/**
 * 用户工具类
 *
 * @Author gaojin
 * @Date 2019-05-27 17:23:23
 */
public class UserUtils {

    private static final String USER_CACHE = "USER:";
    private static UserService userService = SpringContextHolder.getBean(UserService.class);

    /**
     * 根据ID获取用户
     *
     * @param userId
     * @return 取不到返回null
     */
    public static User getById(String userId) {
        String redisKey = USER_CACHE + userId;
        User user = RedisUtil.getKeyObject(redisKey, User.class);
        if (user == null) {
            user = userService.getById(userId);
            if (user == null) {
                return null;
            }
            RedisUtil.setKeyObject(redisKey, user, -1);
        }
        return user;
    }

    /**
     * 根据登录账号获取用户
     *
     * @param account
     * @return 取不到返回null
     */
    public static User getByAccount(String account) {
        String redisKey = USER_CACHE + account;
        User user = RedisUtil.getKeyObject(redisKey, User.class);
        if (user == null) {
            user = userService.getByAccount(account);
            if (user == null) {
                return null;
            }
            RedisUtil.setKeyObject(redisKey, user, -1);
        }
        return user;
    }

    /**
     * 获取当前登录用户
     *
     * @return 取不到返回null
     */
    public static User getUser() {
        User user = ShiroKit.getUser();
        return user;
    }

    /**
     * 清除指定用户缓存
     */
    public static void deleteKey(String key) {
        RedisUtil.deleteLikeKey(USER_CACHE + key);
    }

    /**
     * 清除所有用户缓存
     */
    public static void deleteAll() {
        RedisUtil.deleteLikeKey(USER_CACHE + "*");
    }

}
