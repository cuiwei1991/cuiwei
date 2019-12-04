package com.sailei.modules.sys.mapper;

import com.sailei.common.base.ZTreeNode;
import com.sailei.modules.sys.entity.Area;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AreaMapper {

    List<Area> selectAreaTree();

    Area getAreaById(@Param("id") String id);

    List<ZTreeNode> tree();

    void addArea(Area area);

    void updateById(Area area);

    void deleteArea(@Param("id") String id);

    void deleteByparentId(String id);
}
