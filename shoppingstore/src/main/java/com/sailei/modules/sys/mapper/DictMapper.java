package com.sailei.modules.sys.mapper;

import com.sailei.modules.sys.entity.Dict;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.Map;
import java.util.List;

/**
 * 基础字典Mapper接口
 *
 * @Author admin
 * @Date 2019-07-15 15:19:39
 */
@Mapper
public interface DictMapper {

	/**
     * 根据ID查询记录
     */
	Dict getById(@Param("id") String id);

	/**
     * 根据条件查询列表
     */
    List<Dict> queryPage(Map<String, Object> params);

	/**
     * 根据条件查询列表数量
     */
    long queryCount(Map<String, Object> params);

	/**
     * 保存记录
     */
    void save(Dict dict);

	/**
     * 根据ID更新记录
     */
    void updateById(Dict dict);

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
	List<Dict> getByParentId(@Param("id") String id);

	/**
	 * 获取字典属性
	 */
	List<Dict> getByType(@Param("dictType") String dictType);

}