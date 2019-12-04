package com.sailei.modules.test.lefttree.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 商品分类实体类
 *
 * @Author gaojin
 * @Date 2019-10-08 14:20:22
 */
public class TestGoodClass{

    /**
     * ID
     */
    private String id;
    /**
     * 上级ID
     */
    private String parentId;
    /**
     * 上级树
     */
    private String parentIds;
    /**
     * 分类名称
     */
    private String name;
    /**
     * 排序
     */
    private BigDecimal sort;
    /**
     * 创建时间
     */
    private Date createDate;
    /**
     * 修改时间
     */
    private Date updateDate;
    /**
     * 删除标记
     */
    private Integer delFlag;
    /**
     * 父名称
     */
    private String parentName;
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getSort() {
        return sort;
    }

    public void setSort(BigDecimal sort) {
        this.sort = sort;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }
}