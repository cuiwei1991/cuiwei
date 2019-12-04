package com.sailei.modules.sys.mapper;

import com.sailei.modules.sys.entity.DictType;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 字典类型表Mapper接口
 *
 * @Author admin
 * @Date 2019-07-15 15:19:39
 */
@Mapper
public interface DictTypeMapper {

	/**
     * 根据ID查询记录
     */
	DictType getById(@Param("id") String id);

	/**
     * 根据条件查询列表
     */
    List<DictType> queryPage(Map<String, Object> params);

	/**
     * 根据条件查询列表数量
     */
    long queryCount(Map<String, Object> params);

	/**
     * 保存记录
     */
    void save(DictType dictType);

	/**
     * 根据ID更新记录
     */
    void updateById(DictType dictType);

	/**
     * 根据ID移除记录
     */
    void remove(@Param("id") String id);

	/**
     * 根据父节点ID移除记录
     */
    void removeByParentId(@Param("id") String id);

}