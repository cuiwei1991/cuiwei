package com.sailei.modules.gen.entity;

import java.util.Date;

/** 
 * 描述:代码生成记录实体
 *  
 * @Author sailei
 * @Date 2019/7/13 11:22
 */
public class GenScheme {

    private static final long serialVersionUID = 1L;
    /**
     * 主键
     */
    protected String id;
    /**
     * 生成表主键
     */
    private String genTableId;
    /**
     * 表类型
     */
    private String category;
    /**
     * 生成路径
     */
    private String projectPath;
    /**
     * 生成包名
     */
    private String packageName;
    /**
     * 生成模块名
     */
    private String moduleName;
    /**
     * 生成子模块名
     */
    private String subModuleName;
    /**
     * 生成功能名
     */
    private String functionName;
    /**
     * 生成功能名（简写）
     */
    private String functionNameSimple;
    /**
     * 生成功能作者
     */
    private String functionAuthor;
    /**
     * 生成表
     */
    private GenTable genTable;
    /**
     * 
     */
    private String flag;
    /**
     * 备注
     */
    private String remarks;
    /**
     * 是否覆盖已存在文件
     */
    private Boolean replaceFile;
    private String updateBy;
    private String createBy;
    private Date updateDate;
    private Date createDate;

    public GenScheme() {
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

    public String getPackageName() {
        return this.packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getModuleName() {
        return this.moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public String getSubModuleName() {
        return this.subModuleName;
    }

    public void setSubModuleName(String subModuleName) {
        this.subModuleName = subModuleName;
    }

    public String getCategory() {
        return this.category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getFunctionName() {
        return this.functionName;
    }

    public void setFunctionName(String functionName) {
        this.functionName = functionName;
    }

    public String getFunctionNameSimple() {
        return this.functionNameSimple;
    }

    public void setFunctionNameSimple(String functionNameSimple) {
        this.functionNameSimple = functionNameSimple;
    }

    public String getFunctionAuthor() {
        return this.functionAuthor;
    }

    public void setFunctionAuthor(String functionAuthor) {
        this.functionAuthor = functionAuthor;
    }

    public GenTable getGenTable() {
        return this.genTable;
    }

    public void setGenTable(GenTable genTable) {
        this.genTable = genTable;
    }

    public String getFlag() {
        return this.flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public Boolean getReplaceFile() {
        return this.replaceFile;
    }

    public void setReplaceFile(Boolean replaceFile) {
        this.replaceFile = replaceFile;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
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

    public String getProjectPath() {
        return projectPath;
    }

    public void setProjectPath(String projectPath) {
        this.projectPath = projectPath;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
