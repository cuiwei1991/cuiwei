package com.sailei.modules.test.news.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.Map;
import java.util.List;
import com.sailei.modules.test.news.entity.TestNews;

/**
 * 新闻表Mapper接口
 *
 * @Author 高进
 * @Date 2019-10-08 14:21:02
 */
@Mapper
public interface TestNewsMapper {

	/**
     * 根据ID查询记录
     */
	TestNews getById(@Param("id") String id);

	/**
     * 根据条件查询列表
     */
    List<TestNews> queryPage(Map<String, Object> params);

	/**
     * 根据条件查询列表数量
     */
    long queryCount(Map<String, Object> params);

	/**
     * 保存记录
     */
    void save(TestNews testNews);

	/**
     * 根据ID更新记录
     */
    void updateById(TestNews testNews);

	/**
     * 根据ID移除记录
     */
    void remove(@Param("id") String id);

}