package com.sailei.modules.sys.mapper;

import com.sailei.modules.sys.entity.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 角色表 Mapper 接口
 *
 * @Author sailei
 * @since 2018-12-07
 */
@Mapper
public interface RoleMapper{

    Role getById(String roleId);

    List<Role> queryPage(Map<String, Object> params);

    long queryCount(Map<String, Object> params);

    void saveRole(Role role);

    void updateById(Role role);

    void deleteById(String roleId);

    /**
     * 删除某个角色的所有权限
     *
     * @param roleId 角色id
     * @return
     * @Date 2017年2月13日 下午7:57:51
     */
    int deleteRolesById(@Param("roleId") String roleId);

    /**
     * 添加菜单权限
     * @param map
     */
    void addRoleMenu(Map<String, String> map);

}
