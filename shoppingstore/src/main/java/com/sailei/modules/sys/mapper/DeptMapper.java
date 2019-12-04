package com.sailei.modules.sys.mapper;

import com.sailei.common.base.TreeviewNode;
import com.sailei.common.base.ZTreeNode;
import com.sailei.modules.sys.entity.Dept;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 部门表 Mapper 接口
 *
 * @Author sailei
 * @since 2018-12-07
 */
@Mapper
public interface DeptMapper{

    Dept getById(@Param("deptId") String deptId);

    List<Dept> queryPage(Map<String, Object> params);

    /**
     * 获取ztree的节点列表
     */
    List<ZTreeNode> tree();

    /**
     * 获取所有部门树列表
     */
    List<TreeviewNode> treeviewNodes();

    void saveDept(Dept dept);

    void removeById(@Param("deptId") String deptId);

    void updateById(Dept dept);
}
