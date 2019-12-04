package com.sailei.modules.sys.entity;

import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * 配置参数表
 *
 * @Author gaojin
 */
public class Set {
    /**
     * 主键
     */
    private Integer setId;
    /**
     * 标题
     */
    private String title;
    /**
     * 业务类型 0 系统
     */
    private Integer setType;
    /**
     * 类型描述 0 系统
     */
    private String typeDesc;
    /**
     * 配置值类型 0 字符串 1 数字 2 浮点数值 3 时间
     */
    private Integer valueType;
    /**
     * 配置键
     */
    private String setKey;
    /**
     * 配置值
     */
    private String setValue;
    /**
     * 描述
     */
    private String remark;
    /**
     * 是否锁定 0 否 1 是 锁定后不允许修改，只有超级管理员可以解锁
     */
    private Integer isLock;
    /**
     * 更新时间
     */
    private Date updateTime;
    /**
     * 删除标记 0 默认 1 已删除
     */
    private Integer delFlag;

    public Integer getSetId() {
        return setId;
    }

    public void setSetId(Integer setId) {
        this.setId = setId;
    }
    @NotNull(message="名称不能为空")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    @NotNull(message="类型不能为空")
    public Integer getSetType() {
        return setType;
    }

    public void setSetType(Integer setType) {
        this.setType = setType;
    }

    public String getTypeDesc() {
        return typeDesc;
    }

    public void setTypeDesc(String typeDesc) {
        this.typeDesc = typeDesc;
    }
    @NotNull(message="配置值类型不能为空")
    public Integer getValueType() {
        return valueType;
    }

    public void setValueType(Integer valueType) {
        this.valueType = valueType;
    }
    @NotNull(message="名称不能为空")
    public String getSetKey() {
        return setKey;
    }

    public void setSetKey(String setKey) {
        this.setKey = setKey;
    }
    @NotNull(message="配置值不能为空")
    public String getSetValue() {
        return setValue;
    }

    public void setSetValue(String setValue) {
        this.setValue = setValue;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getIsLock() {
        return isLock;
    }

    public void setIsLock(Integer isLock) {
        this.isLock = isLock;
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
