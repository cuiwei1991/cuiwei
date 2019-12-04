package com.sailei.modules.test.lefttree.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.Map;
import java.util.List;
import com.sailei.common.base.ZTreeNode;
import com.sailei.modules.test.lefttree.entity.TestGoodClass;

/**
 * 商品分类Mapper接口
 *
 * @Author gaojin
 * @Date 2019-10-08 14:20:22
 */
@Mapper
public interface TestGoodClassMapper {

	/**
     * 根据ID查询记录
     */
	TestGoodClass getById(@Param("id") String id);

	/**
     * 根据条件查询列表
     */
    List<TestGoodClass> queryPage();

    /**
     * 获取树结构
     */
    List<ZTreeNode> tree();

	/**
     * 保存记录
     */
    void save(TestGoodClass testGoodClass);

	/**
     * 根据ID更新记录
     */
    void updateById(TestGoodClass testGoodClass);

	/**
     * 根据ID移除记录
     */
    void remove(@Param("id") String id);

	/**
     * 根据父ID移除所有子记录
     */
    void removeRelation(@Param("parentId") String parentId);

}