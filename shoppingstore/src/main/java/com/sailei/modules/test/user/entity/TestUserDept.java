package com.sailei.modules.test.user.entity;

import java.util.*;
import java.util.Date;

/**
 * 客户部门实体类
 *
 * @Author gaojin
 * @Date
 */
public class TestUserDept{

    /**
     * ID
     */
    private String id;
    /**
     * 用户编号
     */
    private String userId;
    /**
     * 部门名称
     */
    private String deptName;
    /**
     * 部门名称
     */
    private String deptCode;
    /**
     * 部门职位
     */
    private String deptJob;
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
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getDeptCode() {
        return deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode;
    }

    public String getDeptJob() {
        return deptJob;
    }

    public void setDeptJob(String deptJob) {
        this.deptJob = deptJob;
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

}