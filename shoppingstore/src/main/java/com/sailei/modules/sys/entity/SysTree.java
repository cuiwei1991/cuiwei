package com.sailei.modules.sys.entity;

import java.util.List;

public class SysTree {
    /**
     * ID
     */
    private String menuId;
    /**
     * 父ID
     */
    private String parentId;
    /**
     * 标题
     */
    private String title;
    /**
     * 图标
     */
    private String iconClass;
    /**
     * 链接
     */
    private String src;
    /**
     * 子菜单
     */
    private List<SysTree> children;

    public SysTree(String menuId, String parentId, String title, String src, String iconClass) {
        this.menuId = menuId;
        this.parentId = parentId;
        this.title = title;
        this.src = src;
        this.iconClass = iconClass;
    }

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getIconClass() {
        return iconClass;
    }

    public void setIconClass(String iconClass) {
        this.iconClass = iconClass;
    }

    public List<SysTree> getChildren() {
        return children;
    }

    public void setChildren(List<SysTree> children) {
        this.children = children;
    }
}
