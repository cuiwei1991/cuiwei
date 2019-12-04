package com.sailei.modules.sys.service;

import com.sailei.common.base.SLException;
import com.sailei.common.rebbitmq.RabbitMqUtil;
import com.sailei.common.utils.ToolUtils;
import com.sailei.common.utils.IdUtils;
import com.sailei.common.utils.PageUtils;
import com.sailei.common.service.R;
import com.sailei.common.base.LayuiPage;
import com.sailei.config.shiro.ShiroKit;
import com.sailei.modules.sys.entity.Role;
import com.sailei.modules.sys.entity.User;
import com.sailei.modules.sys.mapper.RoleMapper;
import com.sailei.modules.sys.utils.RoleUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 角色表 服务实现类
 *
 * @Author sailei
 * @since 2018-12-07
 */
@Service
public class RoleService {

    @Resource
    private RoleMapper roleMapper;

    /**
     * 添加角色
     *
     * @Author sailei
     * @Date 2018/12/23 6:40 PM
     */
    @Transactional(rollbackFor = Exception.class)
    public void addRole(Role role) throws SLException {
        User user = ShiroKit.getUser();
        role.setRoleId(IdUtils.getNumberId());
        role.setCreateUser(user.getUserId());
        role.setCreateTime(new Date());
        role.setUpdateTime(new Date());
        role.setUpdateUser(user.getUserId());
        role.setVersion(1);
        roleMapper.saveRole(role);

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("添加角色", "1", role);
    }

    /**
     * 编辑角色
     *
     * @Author sailei
     * @Date 2018/12/23 6:40 PM
     */
    @Transactional(rollbackFor = Exception.class)
    public void editRole(Role role) throws SLException {
        roleMapper.updateById(role);
        /** 删除缓存 */
        RoleUtils.deleteAll();

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("修改角色", "1", role);
    }

    /**
     * 设置某个角色的权限
     *
     * @param roleId 角色id
     * @param ids    权限的id
     * @Date 2017年2月13日 下午8:26:53
     */
    @Transactional(rollbackFor = Exception.class)
    public void setAuthority(String roleId, String ids) throws SLException {
        if (ToolUtils.isEmpty(roleId)) {
            throw new SLException("请求参数错误!");
        }
        /** 删除该角色所有的权限 */
        roleMapper.deleteRolesById(roleId);

        /** 添加新的权限 */
        for (String id : ids.split(",")) {
            Map<String, String> map = new HashMap<>();
            map.put("roleId", roleId);
            map.put("menuId", id);
            map.put("id", IdUtils.getNumberId());
            roleMapper.addRoleMenu(map);
        }

        /** 刷新当前用户的权限 */
        RoleUtils.deleteAll();

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("设置角色权限", "1", roleId + ":" + ids);
    }

    /**
     * 删除角色
     *
     * @Author sailei
     * @Date 2017/5/5 22:24
     */
    @Transactional(rollbackFor = Exception.class)
    public void delRoleById(String roleId) throws SLException {
        if (ToolUtils.isEmpty(roleId)) {
            throw new SLException("请求参数错误!");
        }

        /** 不能删除超级管理员角色 */
        if (roleId.equals("1")) {
            throw new SLException("不能删除超级管理员角色!");
        }
        Role role = roleMapper.getById(roleId);

        /** 删除角色 */
        roleMapper.deleteById(roleId);

        /** 删除该角色所有的权限 */
        roleMapper.deleteRolesById(roleId);

        /** 删除缓存 */
        RoleUtils.deleteAll();

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("删除角色", "1", role);
    }

    public Role getById(String roleId) {
        return roleMapper.getById(roleId);
    }

    public LayuiPage queryPage(Map<String, Object> params) {

        /**处理分页参数*/
        PageUtils.changeForMap(params);
        /**获取分页列表*/
        List<Role> list = roleMapper.queryPage(params);
        /**获取总条数*/
        long count = roleMapper.queryCount(params);
        /**初始化LayuiPage*/
        LayuiPage page = new LayuiPage(list, count);

        return page;
    }

    public List<Role> roleList() {
        return roleMapper.queryPage(new HashMap<>());
    }
}
