package com.sailei.modules.test.tree.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.Map;
import java.util.List;
import com.sailei.common.base.ZTreeNode;
import com.sailei.modules.test.tree.entity.TestGenealogy;

/**
 * 族谱表Mapper接口
 *
 * @Author admin
 * @Date 2019-10-08 14:20:14
 */
@Mapper
public interface TestGenealogyMapper {

	/**
     * 根据ID查询记录
     */
	TestGenealogy getById(@Param("id") String id);

	/**
     * 根据条件查询列表
     */
    List<TestGenealogy> queryPage();

    /**
     * 获取树结构
     */
    List<ZTreeNode> tree();

	/**
     * 保存记录
     */
    void save(TestGenealogy testGenealogy);

	/**
     * 根据ID更新记录
     */
    void updateById(TestGenealogy testGenealogy);

	/**
     * 根据ID移除记录
     */
    void remove(@Param("id") String id);

	/**
     * 根据父ID移除所有子记录
     */
    void removeRelation(@Param("parentId") String parentId);

}