package com.sailei.modules.sys.entity;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 菜单表
 *
 * @Author sailei
 * @since 2019-04-01
 */
public class Menu implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private String menuId;

    /**
     * 父ID
     */
    private String parentId;
    /**
     * 父菜单
     */
    private String parentName;

    /**
     * 父ID列表
     */
    private String parentIds;

    /**
     * 菜单名称
     */
    private String name;

    /**
     * 菜单图标
     */
    private String icon;

    /**
     * url地址
     */
    private String url;

    /**
     * 菜单排序号
     */
    private BigDecimal sort;

    /**
     * 菜单层级 1：第一层  2：第二层  3：第三层
     */
    private Integer levels;

    /**
     * 0:目录  1：菜单  2：按钮  3：数据权限
     */
    private Integer menuType;

    /**
     * 菜单状态(字典) 0 隐藏 1 显示
     */
    private Integer isShow;

    /**
     * 权限
     */
    private String permission;

    /**
     * 修改时间
     */
    private Date updateTime;

    /**
     * 删除标记 0 未删除 1 已删除
     */
    private Integer delFlag;

    public Menu(){}

    public Menu(String menuId, String name, String url, String icon) {
        this.menuId = menuId;
        this.name = name;
        this.url = url;
        this.icon = icon;
    }

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }
    @NotNull(message="父节点不能为空")
    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }
    @NotNull(message="名称不能为空")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public BigDecimal getSort() {
        return sort;
    }

    public void setSort(BigDecimal sort) {
        this.sort = sort;
    }

    public Integer getLevels() {
        return levels;
    }

    public void setLevels(Integer levels) {
        this.levels = levels;
    }
    @NotNull(message="类型不能为空")
    public Integer getMenuType() {
        return menuType;
    }

    public void setMenuType(Integer menuType) {
        this.menuType = menuType;
    }

    public Integer getIsShow() {
        return isShow;
    }

    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }
}
