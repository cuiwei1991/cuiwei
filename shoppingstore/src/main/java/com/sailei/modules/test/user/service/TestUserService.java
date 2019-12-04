package com.sailei.modules.test.user.service;

import java.util.*;
import java.math.BigDecimal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sailei.common.base.LayuiPage;
import com.sailei.common.service.R;
import com.sailei.common.utils.PageUtils;
import com.sailei.common.utils.IdUtils;
import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.test.user.entity.TestUser;
import com.sailei.modules.test.user.mapper.TestUserMapper;
import com.sailei.modules.test.user.entity.TestUserDept;
import com.sailei.modules.test.user.mapper.TestUserDeptMapper;
import com.sailei.modules.test.user.entity.TestUserSchool;
import com.sailei.modules.test.user.mapper.TestUserSchoolMapper;
/**
 * 用户表服务类
 *
 * @Author gaojin
 * @Date
 */
@Service
public class TestUserService{

	 @Autowired
     private TestUserMapper testUserMapper;
     @Autowired
     private TestUserDeptMapper testUserDeptMapper;
     @Autowired
     private TestUserSchoolMapper testUserSchoolMapper;

	/**
     * 根据条件查询列表
     *
     * @Author gaojin
     * @Date
     */
    public LayuiPage queryPage(Map<String, Object> params) {

        /**处理分页参数*/
        PageUtils.changeForMap(params);
        /**获取分页列表*/
        List<TestUser> testUsers = testUserMapper.queryPage(params);
        /**获取总条数*/
        long count = testUserMapper.queryCount(params);
        /**初始化LayuiPage*/
        LayuiPage page = new LayuiPage(testUsers, count);

        return page;
    }

    /**
     * 根据ID查询记录
     *
     * @param id 记录ID
     */
     public R getById(String id) {
        R result = R.ok();
        TestUser testUser = testUserMapper.getById(id);
        List<TestUserDept> testUserDeptList = testUserDeptMapper.getByParentId(id);
        testUser.setTestUserDeptList(testUserDeptList);
        List<TestUserSchool> testUserSchoolList = testUserSchoolMapper.getByParentId(id);
        testUser.setTestUserSchoolList(testUserSchoolList);
        result.put("testUser", testUser);
        return result;
    }

    /**
     * 保存记录
     *
     * @param testUser 保存的对象
     */
    @Transactional(rollbackFor = Exception.class)
	public R saveOrupdate(TestUser testUser) {
		/** 主表更新 */
        if(testUser.getId() != null && !"".equals(testUser.getId())){
			testUser.setUpdateDate(new Date());
            testUserMapper.updateById(testUser);
        }else{
            String id= IdUtils.getNumberId();
            testUser.setId(id);
			testUser.setCreateDate(new Date());
            testUserMapper.save(testUser);
        }

        /** 子表更新 */
		/** 如果是修改，先删除原子表内容 */
        if(testUser.getId() != null && !"".equals(testUser.getId())){
        	testUserDeptMapper.removeByParentId(testUser.getId());
        }
        List<Map<String,Object>> listTestUserDept = testUser.getTestUserDeptMapList();
		if(listTestUserDept != null && listTestUserDept.size() > 0){
			for(Map<String,Object> map : listTestUserDept){
				TestUserDept testUserDept = new TestUserDept();
			   	String childId = IdUtils.getNumberId();
			   	testUserDept.setId(childId);
			   	testUserDept.setUserId(testUser.getId());
				String deptName = map.get("deptName") != null ? map.get("deptName").toString() : "";
				testUserDept.setDeptName(deptName);
				String deptCode = map.get("deptCode") != null ? map.get("deptCode").toString() : "";
				testUserDept.setDeptCode(deptCode);
				String deptJob = map.get("deptJob") != null ? map.get("deptJob").toString() : "";
				testUserDept.setDeptJob(deptJob);
				testUserDept.setCreateDate(new Date());
				testUserDept.setUpdateDate(new Date());
			   testUserDeptMapper.save(testUserDept);
		   }
		}
		/** 如果是修改，先删除原子表内容 */
        if(testUser.getId() != null && !"".equals(testUser.getId())){
        	testUserSchoolMapper.removeByParentId(testUser.getId());
        }
        List<Map<String,Object>> listTestUserSchool = testUser.getTestUserSchoolMapList();
		if(listTestUserSchool != null && listTestUserSchool.size() > 0){
			for(Map<String,Object> map : listTestUserSchool){
				TestUserSchool testUserSchool = new TestUserSchool();
			   	String childId = IdUtils.getNumberId();
			   	testUserSchool.setId(childId);
			   	testUserSchool.setUserId(testUser.getId());
				String schoolName = map.get("schoolName") != null ? map.get("schoolName").toString() : "";
				testUserSchool.setSchoolName(schoolName);
				String type = map.get("type") != null ? map.get("type").toString() : "";
				testUserSchool.setType(type);
				String year = map.get("year") != null ? map.get("year").toString() : "";
				testUserSchool.setYear(year);
				String address = map.get("address") != null ? map.get("address").toString() : "";
				testUserSchool.setAddress(address);
				testUserSchool.setCreateDate(new Date());
				testUserSchool.setUpdateDate(new Date());
			   testUserSchoolMapper.save(testUserSchool);
		   }
		}

        return R.ok();
    }

    /**
     * 根据ID移除记录
     *
     * @param id 记录ID
     */
    public R remove(String id) {
        testUserMapper.remove(id);

        /** 移除子表数据 */
		testUserDeptMapper.removeByParentId(id);

        /** 移除子表数据 */
		testUserSchoolMapper.removeByParentId(id);

        return R.ok();
    }

}