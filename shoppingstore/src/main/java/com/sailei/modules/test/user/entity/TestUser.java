package com.sailei.modules.test.user.entity;

import java.util.*;
import java.util.Date;
import java.util.List;

/**
 * 用户表实体类
 *
 * @Author gaojin
 * @Date
 */
public class TestUser{

    /**
     * ID
     */
    private String id;
    /**
     * 姓名
     */
    private String name;
    /**
     * 昵称
     */
    private String nickName;
    /**
     * 年龄
     */
    private Integer age;
    /**
     * 身份证号
     */
    private String idNumber;
    /**
     * 手机号
     */
    private String mobile;
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
     * 子表列表
     */
	private List<TestUserDept> testUserDeptList = new ArrayList<>();
	/**
     * 子表列表数据接收Map
     */
	private List<Map<String,Object>> testUserDeptMapList = new ArrayList<>();
    /**
     * 子表列表
     */
	private List<TestUserSchool> testUserSchoolList = new ArrayList<>();
	/**
     * 子表列表数据接收Map
     */
	private List<Map<String,Object>> testUserSchoolMapList = new ArrayList<>();
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
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

	public List<TestUserDept> getTestUserDeptList() {
		return testUserDeptList;
	}

	public void setTestUserDeptList(List<TestUserDept> testUserDeptList) {
		this.testUserDeptList = testUserDeptList;
	}

	public List<Map<String, Object>> getTestUserDeptMapList() {
		return testUserDeptMapList;
	}

	public void setTestUserDeptMapList(List<Map<String, Object>>testUserDeptMapList) {
		this.testUserDeptMapList = testUserDeptMapList;
	}
	public List<TestUserSchool> getTestUserSchoolList() {
		return testUserSchoolList;
	}

	public void setTestUserSchoolList(List<TestUserSchool> testUserSchoolList) {
		this.testUserSchoolList = testUserSchoolList;
	}

	public List<Map<String, Object>> getTestUserSchoolMapList() {
		return testUserSchoolMapList;
	}

	public void setTestUserSchoolMapList(List<Map<String, Object>>testUserSchoolMapList) {
		this.testUserSchoolMapList = testUserSchoolMapList;
	}
}