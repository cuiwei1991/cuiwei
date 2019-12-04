package com.sailei.modules.sys.mapper;

import com.sailei.modules.sys.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 管理员表 Mapper 接口
 *
 * @Author sailei
 * @since 2018-12-07
 */
@Mapper
public interface UserMapper{

    /**
     * 修改用户状态
     */
    int setStatus(@Param("userId") String userId, @Param("status") String status);

    /**
     * 设置用户的角色
     */
    int delAllRoles(@Param("userId") String userId);

    /**
     * 通过账号获取用户
     */
    User getByAccount(@Param("account") String account);

    List<User> queryPage(Map<String, Object> params);

    long queryCount(Map<String, Object> params);

    User getByUserId(@Param("userId") String userId);

    void updateById(User user);

    void addUser(User user);

    void addUserRole(@Param("userId") String userId, @Param("roleId") String roleId);

    void deleteUser(@Param("userId") String userId);

    List<String> getDeptIds(@Param("deptId") String deptId);

    void changePwd(User user);
}
