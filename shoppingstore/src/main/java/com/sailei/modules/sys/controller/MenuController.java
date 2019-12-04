package com.sailei.modules.sys.controller;

import com.sailei.common.base.BaseController;
import com.sailei.common.base.LayuiPage;
import com.sailei.common.base.ZTreeNode;
import com.sailei.common.service.R;
import com.sailei.common.utils.StringUtils;
import com.sailei.common.utils.ToolUtils;
import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.sys.entity.Menu;
import com.sailei.modules.sys.entity.User;
import com.sailei.modules.sys.service.MenuService;
import com.sailei.modules.sys.utils.MenuUtils;
import com.sailei.modules.sys.utils.RoleUtils;
import com.sailei.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 菜单控制器
 *
 * @Author sailei
 * @Date 2017年2月12日21:59:14
 */
@Controller
@RequestMapping("/menu")
public class MenuController extends BaseController {

    private static String PREFIX = "/modules/sys/menu/";

    @Autowired
    private MenuService menuService;
    /**
     * 记录日志
     */
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 跳转到菜单列表列表页面
     *
     * @Author sailei
     * @Date 2018/12/23 5:53 PM
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "menu.html";
    }

    /**
     * 跳转到菜单列表列表页面
     *
     * @Author sailei
     * @Date 2018/12/23 5:53 PM
     */
    @RequestMapping(value = "/menu_add")
    public String menuAdd() {
        return PREFIX + "menu_add.html";
    }

    /**
     * 跳转到菜单详情列表页面
     *
     * @Author sailei
     * @Date 2018/12/23 5:53 PM
     */
    @RequiresPermissions("menu:menu_edit")
    @RequestMapping(value = "/menu_edit")
    public String menuEdit() {
        return PREFIX + "menu_edit.html";
    }

    /**
     * 新增菜单
     *
     * @Author sailei
     * @Date 2018/12/23 5:53 PM
     */
    @ResponseBody
    @RequiresPermissions("menu:add")
    @RequestMapping(value = "/add")
    public R add(Menu menu) {
        try{
            /** 校验参数 */
            String errMsg = beanValidator(menu);
            if (ToolUtils.isNotEmpty(errMsg)){
                return R.error(errMsg);
            }
            menuService.addMenu(menu);
            return R.ok();
        }catch(Exception e){
           logger.error("【新增菜单】报错:", e);
           return R.error(e.getMessage());
        }
    }

    /**
     * 修改菜单
     *
     * @Author sailei
     * @Date 2018/12/23 5:53 PM
     */
    @ResponseBody
    @RequiresPermissions("menu:edit")
    @RequestMapping(value = "/edit")
    public R edit(Menu menu) {
        try{
            /** 校验参数 */
            String errMsg = beanValidator(menu);
            if (ToolUtils.isNotEmpty(errMsg)){
                return R.error(errMsg);
            }
            menuService.updateMenu(menu);
            /**刷新当前用户菜单*/
            RoleUtils.deleteAll();
            return R.ok();
        }catch(Exception e){
            logger.error("【修改菜单】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 获取菜单列表
     *
     * @Author sailei
     * @Date 2018/12/23 5:53 PM
     */
    @ResponseBody
    @RequiresPermissions("menu:list")
    @RequestMapping(value = "/list")
    public LayuiPage list(@RequestParam Map<String, Object> params) {
        LayuiPage page = menuService.queryPage(params);
        return page;
    }

    /**
     * 获取菜单列表（s树形）
     *
     * @Author sailei
     * @Date 2019年2月23日22:01:47
     */
    @ResponseBody
    @RequiresPermissions("menu:list")
    @RequestMapping(value = "/listTree")
    public Object listTree(@RequestParam(required = false) String menuName,
                           @RequestParam(required = false) String level) {
        List<Menu> menus = this.menuService.selectMenuTree(menuName, level);

        LayuiPage result = new LayuiPage(menus, menus.size());
        return result;
    }

    /**
     * 删除菜单
     *
     * @Author sailei
     * @Date 2018/12/23 5:53 PM
     */
    @ResponseBody
    @RequiresPermissions("menu:remove")
    @RequestMapping(value = "/remove")
    public R remove(@RequestParam String menuId) {
        try{
            menuService.delMenuContainSubMenus(menuId);
            return R.ok();
        }catch(Exception e){
            logger.error("【删除菜单】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 查看菜单
     *
     * @Author sailei
     * @Date 2018/12/23 5:53 PM
     */
    @ResponseBody
    @RequiresPermissions("menu:view")
    @RequestMapping(value = "/view/{menuId}")
    public R view(@PathVariable String menuId) {
        if (ToolUtils.isEmpty(menuId)) {
            return R.error("参数错误");
        }
        Menu menu = this.menuService.getById(menuId);
        return R.ok().put("data", menu);
    }

    /**
     * 获取菜单信息
     *
     * @Author sailei
     * @Date 2018/12/23 5:53 PM
     */
    @ResponseBody
    @RequiresPermissions("menu:view")
    @RequestMapping(value = "/getMenuInfo")
    public R getMenuInfo(@RequestParam String menuId) {
        if (ToolUtils.isEmpty(menuId)) {
            return R.error("参数错误");
        }

        Menu menu = this.menuService.getById(menuId);

        return R.ok().put("data", menu);
    }

    /**
     * 获取菜单列表(首页用)
     *
     * @Author sailei
     * @Date 2018/12/23 5:54 PM
     */
    @ResponseBody
    @RequestMapping(value = "/menuTreeList")
    public List<ZTreeNode> menuTreeList() {
        return this.menuService.menuTreeList();
    }

    /**
     * 获取菜单列表(选择父级菜单用)
     *
     * @Author sailei
     * @Date 2018/12/23 5:54 PM
     */
    @ResponseBody
    @RequestMapping(value = "/selectMenuTreeList")
    public List<ZTreeNode> selectMenuTreeList() {
        List<ZTreeNode> roleTreeList = menuService.menuTreeList();
        roleTreeList.add(ZTreeNode.createParent());

        return roleTreeList;
    }

    /**
     * 获取菜单树
     * @Author gaojin
     * @Date 2019-05-06
     */
    @ResponseBody
    @RequestMapping(value = "/listMenuTree")
    public String listMenuTree() {
        return MenuUtils.listMenuTree();
    }

    /**
     * 获取角色的菜单列表
     *
     * @Author sailei
     * @Date 2018/12/23 5:54 PM
     */
    @ResponseBody
    @RequestMapping(value = "/menuTreeListByRoleId/{roleId}")
    public List<ZTreeNode> menuTreeListByRoleId(@PathVariable String roleId) {
        List<String> menuIds = this.menuService.getMenuIdsByRoleId(roleId);
        if (ToolUtils.isEmpty(menuIds)) {
            return this.menuService.menuTreeList();
        } else {
            return this.menuService.menuTreeListByMenuIds(menuIds);
        }
    }

    /**
     * 获取权限内的菜单树
     *
     * @Author sailei
     * @Date 2018/12/23 5:54 PM
     */
    @ResponseBody
    @RequestMapping(value = "/menuTreeListUser")
    public List<ZTreeNode> menuTreeListUser() {
        User user = UserUtils.getUser();
        String roles = StringUtils.changeString(user.getRoleIds());
        return menuService.menuTreeListMyAuth(roles);
    }

}
