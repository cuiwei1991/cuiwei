package com.sailei.modules.sys.mapper;

import com.sailei.common.base.ZTreeNode;
import com.sailei.modules.sys.entity.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 菜单表 Mapper 接口
 *
 * @Author sailei
 * @since 2018-12-07
 */
@Mapper
public interface MenuMapper{

    List<Menu> selectMenuList(@Param("roles") String roles, @Param("types") String types);

    void saveMenu(Menu menu);

    Menu getById(String menuId);

    List<Menu> queryPage(Map<String, Object> params);

    long queryCount(Map<String, Object> params);

    void updateMenu(Menu resultMenu);

    void deleteById(@Param("menuId") String menuId);

    List<Menu> getMenusByParentId(@Param("menuId") String menuId);

    List<String> getMenuIdsByRoleId(@Param("roleId") String roleId);

    List<ZTreeNode> menuTreeListByMenuIds(List<String> menuIds);

    List<ZTreeNode> menuTreeList();

    List<ZTreeNode> menuTreeListMyAuth(@Param("roles") String roles);
}
