package com.sailei.modules.test.user.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.Map;
import java.util.List;
import com.sailei.modules.test.user.entity.TestUser;

/**
 * 用户表Mapper接口
 *
 * @Author gaojin
 * @Date
 */
@Mapper
public interface TestUserMapper {

	/**
     * 根据ID查询记录
     */
	TestUser getById(@Param("id") String id);

	/**
     * 根据条件查询列表
     */
    List<TestUser> queryPage(Map<String, Object> params);

	/**
     * 根据条件查询列表数量
     */
    long queryCount(Map<String, Object> params);

	/**
     * 保存记录
     */
    void save(TestUser testUser);

	/**
     * 根据ID更新记录
     */
    void updateById(TestUser testUser);

	/**
     * 根据ID移除记录
     */
    void remove(@Param("id") String id);

	/**
     * 根据父节点ID移除记录
     */
    void removeByParentId(@Param("id") String id);


}