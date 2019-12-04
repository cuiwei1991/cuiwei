package com.sailei.modules.sys.controller;

import com.sailei.common.base.BaseController;
import com.sailei.common.base.LayuiPage;
import com.sailei.common.base.ZTreeNode;
import com.sailei.common.service.R;
import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.sys.entity.Role;
import com.sailei.modules.sys.entity.User;
import com.sailei.modules.sys.service.RoleService;
import com.sailei.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 角色控制器
 *
 * @Author sailei
 * @Date 2017年2月12日21:59:14
 */
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController {

    private static String PREFIX = "/modules/sys/role";

    @Autowired
    private RoleService roleService;
    /**
     * 记录日志
     */
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 跳转到角色列表页面
     *
     * @Author sailei
     * @Date 2018/12/23 6:30 PM
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "/role.html";
    }

    /**
     * 跳转到添加角色
     *
     * @Author sailei
     * @Date 2018/12/23 6:30 PM
     */
    @RequestMapping(value = "/role_add")
    public String roleAdd() {
        return PREFIX + "/role_add.html";
    }

    /**
     * 跳转到修改角色
     *
     * @Author sailei
     * @Date 2018/12/23 6:31 PM
     */
    @RequiresPermissions("role:role_edit")
    @RequestMapping(value = "/role_edit")
    public String roleEdit() {
        return PREFIX + "/role_edit.html";
    }

    /**
     * 跳转到权限分配
     *
     * @Author sailei
     * @Date 2018/12/23 6:31 PM
     */
    @RequiresPermissions("role:role_assign")
    @RequestMapping(value = "/role_assign/{roleId}")
    public String roleAssign(@PathVariable("roleId") String roleId, Model model) {
        model.addAttribute("roleId", roleId);
        return PREFIX + "/role_assign.html";
    }

    /**
     * 获取角色列表
     *
     * @Author sailei
     * @Date 2018/12/23 6:31 PM
     */
    @ResponseBody
    @RequiresPermissions("role:list")
    @RequestMapping(value = "/list")
    public LayuiPage list(@RequestParam Map<String, Object> params) {
        LayuiPage page = roleService.queryPage(params);
        return page;
    }

    /**
     * 角色新增
     *
     * @Author sailei
     * @Date 2018/12/23 6:31 PM
     */
    @ResponseBody
    @RequestMapping(value = "/add")
    @RequiresPermissions("role:add")
    public R add(Role role) {
        try{
            /** 校验参数 */
            String errMsg = beanValidator(role);
            if (ToolUtils.isNotEmpty(errMsg)){
                return R.error(errMsg);
            }
            roleService.addRole(role);
            return R.ok();
        }catch(Exception e){
            logger.error("【角色新增】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 角色修改
     *
     * @Author sailei
     * @Date 2018/12/23 6:31 PM
     */
    @ResponseBody
    @RequestMapping(value = "/edit")
    @RequiresPermissions("role:edit")
    public R edit(Role role) {
        try{
            /** 校验参数 */
            String errMsg = beanValidator(role);
            if (ToolUtils.isNotEmpty(errMsg)){
                return R.error(errMsg);
            }
            roleService.editRole(role);
            return R.ok();
        }catch(Exception e){
            logger.error("【角色修改】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 删除角色
     *
     * @Author sailei
     * @Date 2018/12/23 6:31 PM
     */
    @ResponseBody
    @RequestMapping(value = "/remove")
    @RequiresPermissions("role:remove")
    public R remove(@RequestParam String roleId) {
        try{
            roleService.delRoleById(roleId);
            return R.ok();
        }catch(Exception e){
            logger.error("【删除角色】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 查看角色
     *
     * @Author sailei
     * @Date 2018/12/23 6:31 PM
     */
    @ResponseBody
    @RequestMapping(value = "/view/{roleId}")
    public R view(@PathVariable String roleId) {
        R result = R.ok();
        if (ToolUtils.isEmpty(roleId)) {
            return R.error("请求有错误!");
        }
        Role role = this.roleService.getById(roleId);
        result.put("data", role);

        return result;
    }

    /**
     * 配置权限
     *
     * @Author sailei
     * @Date 2018/12/23 6:31 PM
     */
    @ResponseBody
    @RequestMapping("/setAuthority")
    @RequiresPermissions("role:setAuthority")
    public R setAuthority(@RequestParam("roleId") String roleId, @RequestParam("ids") String ids) {
        try{
            roleService.setAuthority(roleId, ids);
            return R.ok();
        }catch(Exception e){
            logger.error("【配置权限】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 获取角色列表，通过用户id
     *
     * @Author sailei
     * @Date 2018/12/23 6:31 PM
     */
    @ResponseBody
    @RequestMapping(value = "/roleTreeListByUserId/{userId}")
    public List<ZTreeNode> roleTreeListByUserId(@PathVariable String userId) {
        /**定义返回结果*/
        List<ZTreeNode> result = new ArrayList<>();

        /**获取用户已拥有角色*/
        User theUser = UserUtils.getById(userId);
        List<String> roles = theUser.getRoles();

        /**获取所有角色*/
        List<Role> roleList = roleService.roleList();
        if(roleList != null && roleList.size() > 0){
            /** 便利所有角色 */
            for(Role role : roleList){
                /**定义新的结果单实体*/
                ZTreeNode tree = new  ZTreeNode();
                tree.setId(role.getRoleId());
                tree.setPId("0");
                tree.setName(role.getName());
                tree.setOpen(true);

                /**检查用户是否拥有该角色*/
                if(roles != null && roles.size() > 0 && roles.contains(role.getRoleId())){
                    tree.setChecked(true);
                }
                result.add(tree);
            }
        }
        return result;
    }
}
