package com.sailei.modules.gen.mapper;

import com.sailei.modules.gen.entity.GenTable;
import com.sailei.modules.gen.entity.GenTableColumn;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface GenTableColumnMapper {

    List<GenTable> queryPage(Map<String, Object> params);

    long queryCount(Map<String, Object> params);

    void remove(@Param("id") Integer id);

    GenTableColumn getById(@Param("id") String id);

    List<GenTableColumn> getByGenTableId(@Param("id") String id);

    void deleteByGenTable(GenTable genTable);

    void insert(GenTableColumn genTableColumn);

    List<GenTableColumn> queryColumnsByTid(@Param("genTableId") String genTableId);

    GenTableColumn getByName(@Param("name") String name, @Param("genTableId") String genTableId);
}
