package com.sailei.modules.gen.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;

import com.sailei.common.utils.Reflections;
import com.sailei.common.utils.StringUtils;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;

/** 
 * 描述:树实体
 *  
 * @Author sailei
 * @Date 2019/7/13 11:36
 */
public abstract class TreeEntity<T> {

    private static final long serialVersionUID = 1L;

    protected T parent;    // 父级编号
    protected String parentIds; // 所有父级编号
    protected String name;    // 机构名称
    protected Integer sort;        // 排序
    private String id;

    public TreeEntity() {
        super();
        this.sort = 30;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    /**
     * 父对象，只能通过子类实现，父类实现mybatis无法读取
     *
     * @return
     */
    @JsonBackReference
    @NotNull
    public abstract T getParent();

    /**
     * 父对象，只能通过子类实现，父类实现mybatis无法读取
     *
     * @return
     */
    public abstract void setParent(T parent);

    @Length(min = 1, max = 2000)
    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }

    @Length(min = 1, max = 100)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getParentId() {
        String id = null;
        if (parent != null) {
            id = (String) Reflections.getFieldValue(parent, "id");
        }
        return StringUtils.isNotBlank(id) ? id : "0";
    }

}
