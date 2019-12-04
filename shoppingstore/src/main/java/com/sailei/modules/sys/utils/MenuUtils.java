package com.sailei.modules.sys.utils;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sailei.common.base.SpringContextHolder;
import com.sailei.common.redis.RedisUtil;
import com.sailei.common.utils.EmailUtils;
import com.sailei.config.shiro.ShiroKit;
import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.sys.entity.Dict;
import com.sailei.modules.sys.entity.Menu;
import com.sailei.modules.sys.entity.SysTree;
import com.sailei.modules.sys.entity.User;
import com.sailei.modules.sys.mapper.MenuMapper;
import com.xiaoleilu.hutool.json.JSONUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 菜单工具类
 *
 * @Author gaojin
 */
public class MenuUtils {

    public static final String MENU_CACHE = "MENU:";
    private static MenuMapper menuMapper = SpringContextHolder.getBean(MenuMapper.class);
    /**
     * 记录日志
     */
    public static final Logger logger = LoggerFactory.getLogger(MenuUtils.class);

    private static Map<String,List<Menu>> menus = new HashMap<>();

    /**
     * 查询用户有权限的菜单，只列出前三级。
     *
     * @return json格式的字符串
     */
    public static String listMenuTree() {

        /**先从缓存中获取*/
        User user = ShiroKit.getUserNotNull();
        String key = MENU_CACHE + user.getUserId();
        String result = RedisUtil.getKeyStr(key);

        /**缓存中不存在时查询数据库*/
        if (ToolUtils.isEmpty(result)) {
            List<SysTree> tree = new ArrayList<>();
            /**查询拥有权限的所有的菜单（非按钮）*/
            String roles = RoleUtils.getUserRoles();
            List<Menu> menus = menuMapper.selectMenuList(roles, "0,1");
            /**首先获取一级菜单*/
            if (menus != null && menus.size() > 0) {
                /**一级菜单添加子菜单*/
                for (Menu menu : menus) {
                    if (menu.getLevels() != null && menu.getLevels() == 1) {
                        SysTree sysTree = new SysTree(menu.getMenuId(), menu.getParentId(), menu.getName(), menu.getUrl(), menu.getIcon());
                        tree.add(sysTree);
                    }
                }

                /**二级菜单添加子菜单*/
                List<SysTree> treeSub = new ArrayList<>();
                for (Menu menu : menus) {
                    if (menu.getLevels() != null && menu.getLevels() == 2) {
                        SysTree sysTree = new SysTree(menu.getMenuId(), menu.getParentId(), menu.getName(), menu.getUrl(), menu.getIcon());
                        treeSub.add(sysTree);
                    }
                }

                /**三级菜单添加子菜单*/
                List<SysTree> treeSubSub = new ArrayList<>();
                for (Menu menu : menus) {
                    if (menu.getLevels() != null && menu.getLevels() == 3) {
                        SysTree sysTree = new SysTree(menu.getMenuId(), menu.getParentId(), menu.getName(), menu.getUrl(), menu.getIcon());
                        treeSubSub.add(sysTree);
                    }
                }

                /**将三级添加到二级*/
                addChildren(treeSub, treeSubSub);

                /**将二级添加到一级*/
                addChildren(tree, treeSub);

                result = JSONUtil.toJsonStr(tree);

                /**存入缓存*/
                RedisUtil.setKeyStr(key, result, -1);
            }
        }

        return result;
    }

    /**
     * 将父节点在tree中的treeSub列表中的菜单添加到tree的子节点
     *
     * @param tree    父列表
     * @param treeSub 子列表
     */
    private static void addChildren(List<SysTree> tree, List<SysTree> treeSub) {
        if (treeSub.size() > 0 && tree.size() > 0) {

            /**遍历父列表*/
            for (SysTree tre : tree) {

                /**创建父菜单的子列表集合*/
                List<SysTree> treeSubCop = new ArrayList<>();

                /**遍历子列表*/
                for (SysTree sysTreeSub : treeSub) {

                    /**将子列表中符合条件的添加到新建的列表*/
                    if (sysTreeSub.getParentId().equals(tre.getMenuId())) {
                        treeSubCop.add(sysTreeSub);
                    }
                }

                /**将新建的列表赋值给父列表*/
                tre.setChildren(treeSubCop);
            }
        }
    }

    public static List<Menu> selectMenuList(String roles, String types) {
        return menuMapper.selectMenuList(roles, types);
    }
    
    /** 
     * 描述:获取快捷菜单
     *  
     * @Author sailei
     * @Date 2019/8/13 12:31
     */
    public static List<Menu> getInkList() {
        List<Menu> data;
        User user = UserUtils.getUser();
        String key = MENU_CACHE + "INK-" + user.getUserId();
        String result = RedisUtil.getKeyStr(key);
        /**缓存中不存在时查询数据库*/
        if (ToolUtils.isEmpty(result)) {
            data = menus.get(key);
        }else {
            Gson gson = new Gson();
            data = gson.fromJson(result, new TypeToken<List<Menu>>() {}.getType());
        }
        return data;
    }

    /**
     * 描述:设置快捷方式
     *
     * @Author sailei
     * @Date 2019/8/13 13:51
     */
    public static void setUserMenuLnk(Menu menu) {
        try{
            User user = UserUtils.getUser();
            /** 缓存主键 */
            String key = MENU_CACHE + "INK-" + user.getUserId();
            Gson gson = new Gson();
            List<Menu> data;
            if(RedisUtil.redisFlag){
                /** 从Redis中获取 */
                String result = RedisUtil.getKeyStr(key);
                data = gson.fromJson(result, new TypeToken<List<Menu>>() {}.getType());
            }else{
                /** 从内存中获取 */
                data = menus.get(key);
            }

            /** 判断缓存中是否存在 */
            if(data != null && data.size() > 0){
                boolean doFlag = false;
                for(Menu m : data){
                    if(menu.getMenuId().equals(m.getMenuId())){
                        m.setIcon(menu.getIcon());
                        m.setName(menu.getName());
                        m.setUrl(menu.getUrl());
                        /** 说明是更新快捷方式 */
                        doFlag = true;
                    }
                }
                if(!doFlag){
                    /** 说明是新增快捷方式 */
                    data.add(menu);

                }
            }else{
                /** 缓存中不存在，创建新的 */
                data = new ArrayList<>();
                data.add(menu);
            }

            /** 更新缓存 */
            if(RedisUtil.redisFlag){
                RedisUtil.setKeyStr(key, gson.toJson(data), -1);
            }else{
                menus.put(key, data);
            }
        }catch (Exception e){
            logger.error("设置快捷方式报错:", e);
            throw new RuntimeException(e.getMessage());
        }


    }

    /**
     * 清除所有菜单缓存
     */
    public static void deleteAll() {
        RedisUtil.deleteLikeKey(MENU_CACHE + "*");
    }

}
