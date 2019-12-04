package com.sailei.modules.sys.entity;

import javax.validation.constraints.NotNull;

/**
 * 地区表
 *
 * @Author gaojin
 * @Date 2019-05-27 12:56:00
 */
public class Area {
    private static final long serialVersionUID = 1L;
    /**
     * 主键
     */
    private String id;
    /**
     * 父编号
     */
    private String parentId;
    /**
     * 父名称
     */
    private String parentName;
    /**
     * 所有父编号
     */
    private String parentIds;
    /**
     * 名称
     */
    private String name;
    /**
     * 级别
     */
    private Integer level;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }
}
