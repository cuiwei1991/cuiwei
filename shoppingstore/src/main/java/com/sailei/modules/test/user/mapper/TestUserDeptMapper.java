package com.sailei.modules.test.user.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.Map;
import java.util.List;
import com.sailei.modules.test.user.entity.TestUserDept;

/**
 * 客户部门Mapper接口
 *
 * @Author gaojin
 * @Date
 */
@Mapper
public interface TestUserDeptMapper {

	/**
     * 根据ID查询记录
     */
	TestUserDept getById(@Param("id") String id);

	/**
     * 根据条件查询列表
     */
    List<TestUserDept> queryPage(Map<String, Object> params);

	/**
     * 根据条件查询列表数量
     */
    long queryCount(Map<String, Object> params);

	/**
     * 保存记录
     */
    void save(TestUserDept testUserDept);

	/**
     * 根据ID更新记录
     */
    void updateById(TestUserDept testUserDept);

	/**
     * 根据ID移除记录
     */
    void remove(@Param("id") String id);

	/**
     * 根据父节点ID移除记录
     */
    void removeByParentId(@Param("id") String id);

	/**
     * 根据父节点ID查询记录
     */
	List<TestUserDept> getByParentId(@Param("id") String id);

}