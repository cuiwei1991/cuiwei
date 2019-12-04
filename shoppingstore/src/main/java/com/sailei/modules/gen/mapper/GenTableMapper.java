package com.sailei.modules.gen.mapper;

import com.sailei.modules.gen.entity.GenTable;
import com.sailei.modules.gen.entity.GenTableColumn;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Mapper
public interface GenTableMapper {

    List<GenTable> queryPage(Map<String, Object> params);

    long queryCount(Map<String, Object> params);

    void remove(@Param("id") Integer id);

    GenTable getById(@Param("id") String id);

    List<GenTable> findList(GenTable genTable);

    List<GenTable> findList();

    void insert(GenTable genTable);

    void update(GenTable genTable);

    void deleteById(GenTable genTable);

    int buildTable(@Param("sql") String paramString);

    List<GenTable> findTableListFormDb();

    List<GenTableColumn> getGenTableColumn(@Param("tableName") String tableName);
}
