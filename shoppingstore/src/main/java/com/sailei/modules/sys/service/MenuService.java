package com.sailei.modules.sys.service;

import com.sailei.common.base.LayuiPage;
import com.sailei.common.base.SLException;
import com.sailei.common.base.ZTreeNode;
import com.sailei.common.rebbitmq.RabbitMqUtil;
import com.sailei.common.utils.IdUtils;
import com.sailei.common.utils.PageUtils;
import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.sys.entity.Menu;
import com.sailei.modules.sys.mapper.MenuMapper;
import com.sailei.modules.sys.utils.MenuUtils;
import com.xiaoleilu.hutool.util.BeanUtil;
import com.xiaoleilu.hutool.util.StrUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

/**
 * 菜单表 服务实现类
 *
 * @Author sailei
 * @since 2018-12-07
 */
@Service
public class MenuService{

    @Resource
    private MenuMapper menuMapper;

    public Menu getById(String menuId) {
        return menuMapper.getById(menuId);
    }

    /**
     * 查询列表
     * @param params 参数map
     * @return
     */
    public LayuiPage queryPage(Map<String, Object> params) {

        /**处理分页参数*/
        PageUtils.changeForMap(params);
        /**获取分页列表*/
        List<Menu> menus = menuMapper.queryPage(params);
        /**获取总条数*/
        long count = menuMapper.queryCount(params);
        /**初始化LayuiPage*/
        LayuiPage page = new LayuiPage(menus, count);

        return page;
    }

    /**
     * 添加菜单
     *
     * @Author sailei
     * @Date 2018/12/23 5:59 PM
     */
    @Transactional(rollbackFor = Exception.class)
    public void addMenu(Menu menu){
        /**赋值必要参数*/
        menu.setMenuId(IdUtils.getNumberId());
        menu.setUpdateTime(new Date());

        /**设置parentIds和levels*/
        menu = menuSetPcode(menu);

        menuMapper.saveMenu(menu);

        /**清除菜单缓存*/
        MenuUtils.deleteAll();

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("添加菜单", "1", menu);

    }

    /**
     * 更新菜单
     *
     * @Author sailei
     * @Date 2019/2/27 4:09 PM
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateMenu(Menu menu){
        /** 获取旧的菜单 */
        String id = menu.getMenuId();
        Menu menuOld = menuMapper.getById(id);

        /** 设置父级菜单编号 */
        Menu resultMenu = menuSetPcode(menu);

        /** 查找该节点的子集合,并修改相应的pcodes和level(因为修改菜单后,层级可能变化了) */
        if(!menu.getParentId().equals(menuOld.getParentId())){
            updateSubMenuLevels(menuOld, resultMenu);
        }
        resultMenu.setUpdateTime(new Date());
        menuMapper.updateMenu(resultMenu);

        /**清除菜单缓存*/
        MenuUtils.deleteAll();

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("修改菜单", "1", menu);
    }

    /**
     * 更新所有子菜单的结构
     *
     * @param oldMenu 原来的菜单
     * @param newMenu 新菜单
     * @Author sailei
     * @Date 2019/2/27 4:25 PM
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateSubMenuLevels(Menu oldMenu, Menu newMenu) {

        List<Menu> menus = menuMapper.getMenusByParentId(oldMenu.getMenuId());

        for (Menu menu : menus) {

            /** 更新pcode */
            if (oldMenu.getMenuId().equals(menu.getParentId())) {
                menu.setParentId(newMenu.getMenuId());
            }

            /** 更新pcodes */
            String oldPcodesPrefix = oldMenu.getParentIds() + oldMenu.getMenuId() + ",";
            String oldPcodesSuffix = menu.getParentIds().substring(oldPcodesPrefix.length());
            String menuPcodes = newMenu.getParentIds()+ newMenu.getMenuId() + "," + oldPcodesSuffix;
            menu.setParentIds(menuPcodes);

            /** 更新levels */
            int level = StrUtil.count(menuPcodes, ",");
            menu.setLevels(level);
            menu.setUpdateTime(new Date());
            menuMapper.updateMenu(menu);
        }

    }

    /**
     * 删除菜单包含所有子菜单
     *
     * @Author sailei
     * @Date 2017/6/13 22:02
     */
    @Transactional(rollbackFor = Exception.class)
    public void delMenuContainSubMenus(String menuId) throws SLException {
        if (ToolUtils.isEmpty(menuId)) {
            throw new SLException("请求参数错误!");
        }

        Menu menu = menuMapper.getById(menuId);
        /**删除当前菜单*/
        menuMapper.deleteById(menuId);

        /**删除所有子菜单*/
        List<Menu> menus = menuMapper.getMenusByParentId(menuId);
        for (Menu temp : menus) {
            menuMapper.deleteById(temp.getMenuId());
        }

        /**清除菜单缓存*/
        MenuUtils.deleteAll();

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("删除菜单", "1", menu);

    }

    /**
     * 根据条件查询菜单
     *
     * @return
     * @Date 2017年2月12日 下午9:14:34
     */
    public List<String> getMenuIdsByRoleId(String roleId) {
        return menuMapper.getMenuIdsByRoleId(roleId);
    }

    /**
     * 获取菜单列表树
     *
     * @return
     * @Date 2017年2月19日 下午1:33:51
     */
    public List<ZTreeNode> menuTreeList() {
        return menuMapper.menuTreeList();
    }

    /**
     * 获取菜单列表树
     *
     * @return
     * @Date 2017年2月19日 下午1:33:51
     */
    public List<ZTreeNode> menuTreeListByMenuIds(List<String> menuIds) {
        return menuMapper.menuTreeListByMenuIds(menuIds);
    }

    /**
     * 根据请求的父级菜单编号设置pcode和层级
     *
     * @Author sailei
     * @Date 2018/12/23 5:54 PM
     */
    public Menu menuSetPcode(Menu menuParam) {

        Menu resultMenu = new Menu();
        BeanUtil.copyProperties(menuParam, resultMenu);

        if (ToolUtils.isEmpty(menuParam.getParentId()) || "0".equals(menuParam.getParentId())) {
            resultMenu.setParentId("0");
            resultMenu.setParentName("顶级");
            resultMenu.setParentIds("0,");
            resultMenu.setLevels(1);
        } else {
            String pid = menuParam.getParentId();
            Menu pMenu = this.getById(pid);
            Integer pLevels = pMenu.getLevels();

            /** 如果编号和父编号一致会导致无限递归 */
            if (menuParam.getMenuId().equals(menuParam.getParentId())) {
                throw new RuntimeException("如果编号和父编号一致会导致无限递归");
            }

            resultMenu.setLevels(pLevels + 1);
            resultMenu.setParentIds(pMenu.getParentIds() + pMenu.getMenuId() + ",");
        }

        return resultMenu;
    }

    /**
     * 获取菜单树形列表
     *
     * @Author sailei
     * @Date 2019/2/23 22:02
     */
    public List<Menu> selectMenuTree(String name, String level) {
        Map<String, Object> params = new HashMap<>(2);
        params.put("name", name);
        params.put("level", level);
        List<Menu> maps = menuMapper.queryPage(params);

        if (maps == null) {
            maps = new ArrayList<>();
        }

        /** 创建根节点 */
        Menu menu = new Menu();
        menu.setMenuId("-1L");
        menu.setName("根节点");
        menu.setMenuId("0");
        menu.setParentId("-2");

        maps.add(menu);

        return maps;
    }

    /**
     * 描述: 获取拥有权限的菜单
     *
     * @Author sailei
     * @Date 2019/8/13 16:35
     */
    public List<ZTreeNode> menuTreeListMyAuth(String roles) {
        return menuMapper.menuTreeListMyAuth(roles);
    }
}
