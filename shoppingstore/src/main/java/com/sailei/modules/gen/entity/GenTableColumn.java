package com.sailei.modules.gen.entity;

import com.sailei.common.utils.StringUtils;
import org.hibernate.validator.constraints.Length;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/** 
 * 描述:代码生成表字段实体
 *  
 * @Author sailei
 * @Date 2019/7/13 11:26
 */
public class GenTableColumn {
    /**
     * 主键
     */
    private static final long serialVersionUID = 1L;
    /**
     * 编号
     */
    private String id;
    /**
     * 代码生成表
     */
    private GenTable genTable;
    /**
     * 代码生成表编号
     */
    private String genTableId;
    /**
     * 字段名
     */
    private String name;
    /**
     * 字段注释
     */
    private String comments;
    /**
     * 数据库类型
     */
    private String jdbcType;
    /**
     * Java类型
     */
    private String javaType;
    /**
     * Java字段名
     */
    private String javaField;
    /**
     * 是否主键
     */
    private String isPk;
    /**
     * 是否可为空
     */
    private String isNull;
    /**
     * 是否插入
     */
    private String isInsert;
    /**
     * 是否可修改
     */
    private String isEdit;
    /**
     * 是否列表显示
     */
    private String isList;
    /**
     * 是否可查询
     */
    private String isQuery;
    /**
     * 查询类型
     */
    private String queryType;
    /**
     * 显示类型
     */
    private String showType;
    /**
     * 使用字典
     */
    private String dictType;
    /**
     * 排序
     */
    private Integer sort;
    /**
     * 自动递增
     */
    private String autoIncrement;
    private String createBy;
    private String updateBy;
    private Date updateDate;
    private Date createDate;
    private String remarks;
    private String delFlag;

    public GenTableColumn() {
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

    public String getGenTableId() {
        return genTableId;
    }

    public void setGenTableId(String genTableId) {
        this.genTableId = genTableId;
    }

    public GenTableColumn(GenTable genTable) {
        this.genTable = genTable;
    }

    public GenTable getGenTable() {
        return this.genTable;
    }

    public void setGenTable(GenTable genTable) {
        this.genTable = genTable;
    }

    @Length(min = 1, max = 200)
    public String getName() {
        return StringUtils.lowerCase(this.name);
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComments() {
        return this.comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getJdbcType() {
        return StringUtils.lowerCase(this.jdbcType);
    }

    public void setJdbcType(String jdbcType) {
        this.jdbcType = jdbcType;
    }

    public String getJavaType() {
        return this.javaType;
    }

    public void setJavaType(String javaType) {
        this.javaType = javaType;
    }

    public String getJavaField() {
        return this.javaField;
    }

    public void setJavaField(String javaField) {
        this.javaField = javaField;
    }

    public String getIsPk() {
        return this.isPk;
    }

    public void setIsPk(String isPk) {
        this.isPk = isPk;
    }

    public String getIsNull() {
        return this.isNull;
    }

    public void setIsNull(String isNull) {
        this.isNull = isNull;
    }

    public String getIsInsert() {
        return this.isInsert;
    }

    public void setIsInsert(String isInsert) {
        this.isInsert = isInsert;
    }

    public String getIsEdit() {
        return this.isEdit;
    }

    public void setIsEdit(String isEdit) {
        this.isEdit = isEdit;
    }

    public String getIsList() {
        return this.isList;
    }

    public void setIsList(String isList) {
        this.isList = isList;
    }

    public String getIsQuery() {
        return this.isQuery;
    }

    public void setIsQuery(String isQuery) {
        this.isQuery = isQuery;
    }

    public String getQueryType() {
        return this.queryType;
    }

    public void setQueryType(String queryType) {
        this.queryType = queryType;
    }

    public String getShowType() {
        return this.showType;
    }

    public void setShowType(String showType) {
        this.showType = showType;
    }

    public String getDictType() {
        return this.dictType == null ? "" : this.dictType;
    }

    public void setDictType(String dictType) {
        this.dictType = dictType;
    }

    public Integer getSort() {
        return this.sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public String getNameAndComments() {
        return getName() + (this.comments == null ? "" : new StringBuilder("  :  ").append(this.comments).toString());
    }

    public String getDataLength() {
        String[] ss = StringUtils.split(StringUtils.substringBetween(getJdbcType(), "(", ")"), ",");
        if ((ss != null) && (ss.length == 1)) {
            return ss[0];
        }
        return "0";
    }

    public String getSimpleJavaType() {
        if ("This".equals(getJavaType())) {
            return StringUtils.capitalize(this.genTable.getClassName());
        }
        return StringUtils.indexOf(getJavaType(), ".") != -1 ?
                StringUtils.substringAfterLast(getJavaType(), ".") :
                getJavaType();
    }

    public String getSimpleJavaField() {
        return StringUtils.substringBefore(getJavaField(), ".");
    }

    public String getJavaFieldId() {
        return StringUtils.substringBefore(getJavaField(), "|");
    }

    public String getJavaFieldName() {
        String[][] ss = getJavaFieldAttrs();
        return ss.length > 0 ? getSimpleJavaField() + "." + ss[0][0] : "";
    }

    public String[][] getJavaFieldAttrs() {
        String[] ss = StringUtils.split(StringUtils.substringAfter(getJavaField(), "|"), "|");
        String[][] sss = new String[ss.length][2];
        if (ss != null) {
            for (int i = 0; i < ss.length; i++) {
                sss[i][0] = ss[i];
                sss[i][1] = StringUtils.toUnderScoreCase(ss[i]);
            }
        }
        return sss;
    }

    /** 
     * 描述:获取注释列表
     *  
     * @Author sailei
     * @Date 2019/7/13 11:32
     */
    public List<String> getAnnotationList() {
        List<String> list = new ArrayList<>();
        if ("This".equals(getJavaType())) {
            list.add("com.fasterxml.jackson.annotation.JsonBackReference");
        }
        if ("java.util.Date".equals(getJavaType())) {
            list.add("com.fasterxml.jackson.annotation.JsonFormat(pattern = \"yyyy-MM-dd HH:mm:ss\")");
        }
        if ((!"1".equals(getIsNull())) && (!"String".equals(getJavaType()))) {
            list.add("javax.validation.constraints.NotNull(message=\"" + getComments() + "不能为空\")");
        } else if ((!"1".equals(getIsNull())) && ("String".equals(getJavaType())) && (!"0".equals(getDataLength()))) {
            list.add("org.hibernate.validator.constraints.Length(min=1, max=" + getDataLength() +
                    ", message=\"" + getComments() + "长度必须介于 1 和 " + getDataLength() + " 之间\")");
        } else if (("String".equals(getJavaType())) && (!"0".equals(getDataLength()))) {
            list.add("org.hibernate.validator.constraints.Length(min=0, max=" + getDataLength() +
                    ", message=\"" + getComments() + "长度必须介于 0 和 " + getDataLength() + " 之间\")");
        }
        return list;
    }

    public List<String> getSimpleAnnotationList() {
        List<String> list = new ArrayList<>();
        for (String ann : getAnnotationList()) {
            list.add(StringUtils.substringAfterLast(ann, "."));
        }
        return list;
    }

    public Boolean getIsNotBaseField() {
        if ((!StringUtils.equals(getSimpleJavaField(), "id")) &&
                (!StringUtils.equals(getSimpleJavaField(), "remarks")) &&
                (!StringUtils.equals(getSimpleJavaField(), "createBy")) &&
                (!StringUtils.equals(getSimpleJavaField(), "createDate")) &&
                (!StringUtils.equals(getSimpleJavaField(), "updateBy")) &&
                (!StringUtils.equals(getSimpleJavaField(), "updateDate")) &&
                (!StringUtils.equals(getSimpleJavaField(), "delFlag"))) {
            return Boolean.valueOf(true);
        }
        return


                Boolean.valueOf(false);
    }

    public String getAutoIncrement() {
        return this.autoIncrement;
    }

    public void setAutoIncrement(String autoIncrement) {
        this.autoIncrement = autoIncrement;
    }
}
