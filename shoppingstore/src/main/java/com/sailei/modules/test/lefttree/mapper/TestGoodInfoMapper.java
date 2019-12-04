package com.sailei.modules.test.lefttree.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.Map;
import java.util.List;
import com.sailei.modules.test.lefttree.entity.TestGoodInfo;

/**
 * 商品表Mapper接口
 *
 * @Author gaojin
 * @date 2019-10-08 14:20:22
 */
@Mapper
public interface TestGoodInfoMapper {

	/**
     * 根据ID查询记录
     */
	TestGoodInfo getById(@Param("id") String id);

	/**
     * 根据条件查询列表
     */
    List<TestGoodInfo> queryPage(Map<String, Object> params);

	/**
     * 根据条件查询列表数量
     */
    long queryCount(Map<String, Object> params);

	/**
     * 保存记录
     */
    void save(TestGoodInfo testGoodInfo);

	/**
     * 根据ID更新记录
     */
    void updateById(TestGoodInfo testGoodInfo);

	/**
     * 根据ID移除记录
     */
    void remove(@Param("id") String id);

}