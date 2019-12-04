package com.sailei.modules.gen.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.plugins.Page;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.sailei.common.utils.StringUtils;
import org.apache.poi.ss.formula.functions.T;
import org.hibernate.validator.constraints.Length;

import javax.xml.bind.annotation.XmlTransient;
import java.util.*;

/**
 * 描述:代码生成表实体
 *
 * @Author sailei
 * @Date 2019/7/13 11:23
 */
public class GenTable {

    private static final long serialVersionUID = 1L;
    /**
     * 主键
     */
    private String id;
    /**
     * 表名
     */
    private String name;
    /**
     * 主键
     */
    private String pk;
    /**
     * 描述
     */
    private String comments;
    /**
     * 类型
     */
    private String tableType;
    /**
     * 类名
     */
    private String className;
    /**
     * 父表
     */
    private String parentTable;
    /**
     * 父表主键
     */
    private String parentTableFk;
    /**
     * 是否已同步
     */
    private String isSync;
    /**
     * 同步脚本
     */
    private String syncSql;
    /**
     * 主键策略 0 默认UUID 1 自动递增
     */
    private String genIdType;
    /**
     * 删除标记
     */
    private String delFlag;
    private String createBy;
    private String updateBy;
    private Date updateDate;
    private Date createDate;
    private String remarks;
    /**
     * 表字段集合
     */
    private List<GenTableColumn> columnList = new ArrayList<>();
    private String nameLike;
    /**
     * 主键集合
     */
    private List<String> pkList;
    /**
     * 父表
     */
    private GenTable parent;
    /**
     * 附表
     */
    private List<GenTable> childList = new ArrayList<>();
    /**
     * 新增保存时接收类型
     */
    private List<Map<String, Object>> columnListMap = new ArrayList<>();
    protected Page<T> page;

    public GenTable() {
    }

    public String getSyncSql() {
        return syncSql;
    }

    public void setSyncSql(String syncSql) {
        this.syncSql = syncSql;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Length(min = 1, max = 200)
    public String getName() {
        return StringUtils.lowerCase(this.name);
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPk() {
        if (this.pk == "" || this.pk == null) {
            this.pk = "id";
        }
        return this.pk;
    }
    public String getPkField() {
        return StringUtils.toCamelCase(getPk());
    }

    public void setPk(String pk) {
        this.pk = pk;
    }

    public String getComments() {
        return this.comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getClassName() {
        return this.className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getParentTable() {
        return StringUtils.lowerCase(this.parentTable);
    }

    public void setParentTable(String parentTable) {
        this.parentTable = parentTable;
    }

    public String getParentTableFk() {
        return StringUtils.lowerCase(this.parentTableFk);
    }

    public void setParentTableFk(String parentTableFk) {
        this.parentTableFk = parentTableFk;
    }

    public List<String> getPkList() {
        return this.pkList;
    }

    public void setPkList(List<String> pkList) {
        this.pkList = pkList;
        if (this.pkList.size() >= 1) {
            this.pk = this.pkList.get(0);
        }
    }

    public String getNameLike() {
        return this.nameLike;
    }

    public void setNameLike(String nameLike) {
        this.nameLike = nameLike;
    }

    public GenTable getParent() {
        return this.parent;
    }

    public void setParent(GenTable parent) {
        this.parent = parent;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public List<GenTableColumn> getColumnList() {
        return this.columnList;
    }

    public void setColumnList(List<GenTableColumn> columnList) {
        this.columnList = columnList;
    }

    public List<GenTable> getChildList() {
        return this.childList;
    }

    public void setChildList(List<GenTable> childList) {
        this.childList = childList;
    }

    public String getNameAndComments() {
        return getName() + (this.comments == null ? "" : new StringBuilder("  :  ").append(this.comments).toString());
    }

    /**
     * 需要引入的类
     */
    public List<String> getImportList() {
        List importList = new ArrayList<>();
        for (Iterator iterator = getColumnList().iterator(); iterator.hasNext(); ) {
            GenTableColumn column = (GenTableColumn) iterator.next();
            if (StringUtils.indexOf(column.getJavaType(), ".") != -1 && !importList.contains(column.getJavaType())) {
                importList.add(column.getJavaType());
            }
        }

        if (getChildList() != null && getChildList().size() > 0) {
            if (!importList.contains("java.util.List")) {
                importList.add("java.util.List");
            }
        }
        return importList;
    }

    public Boolean getParentExists() {
        if ((this.parent != null) && (StringUtils.isNotBlank(this.parentTable)) && (StringUtils.isNotBlank(this.parentTableFk))) {
            return Boolean.valueOf(true);
        }
        return Boolean.valueOf(false);
    }

    public Boolean getCreateDateExists() {
        for (GenTableColumn c : this.columnList) {
            if ("create_date".equals(c.getName())) {
                return Boolean.valueOf(true);
            }
        }
        return Boolean.valueOf(false);
    }

    public Boolean getUpdateDateExists() {
        for (GenTableColumn c : this.columnList) {
            if ("update_date".equals(c.getName())) {
                return Boolean.valueOf(true);
            }
        }
        return Boolean.valueOf(false);
    }

    public Boolean getDelFlagExists() {
        for (GenTableColumn c : this.columnList) {
            if ("del_flag".equals(c.getName())) {
                return Boolean.valueOf(true);
            }
        }
        return Boolean.valueOf(false);
    }

    public String getGenIdType() {
        return genIdType;
    }

    public void setGenIdType(String genIdType) {
        this.genIdType = genIdType;
    }

    @JsonIgnore
    @XmlTransient
    @JSONField(serialize = false)
    public Page<T> getPage() {
        if (page == null) {
            page = new Page<>();
        }
        return page;
    }

    public Page<T> setPage(Page<T> page) {
        this.page = page;
        return page;
    }

    public void setIsSync(String isSync) {
        this.isSync = isSync;
    }

    public String getIsSync() {
        return this.isSync;
    }

    public void setTableType(String tableType) {
        this.tableType = tableType;
    }

    public String getTableType() {
        return this.tableType;
    }

    public List<Map<String, Object>> getColumnListMap() {
        return columnListMap;
    }

    public void setColumnListMap(List<Map<String, Object>> columnListMap) {
        this.columnListMap = columnListMap;
    }

    public String getParentTablePk() {
        return StringUtils.toCamelCase(parentTableFk);
    }

}
