package com.sailei.modules.gen.mapper;

import com.sailei.modules.gen.entity.GenScheme;
import com.sailei.modules.gen.entity.GenTable;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface GenSchemeMapper {

    List<GenTable> queryPage(Map<String, Object> params);

    long queryCount(Map<String, Object> params);

    void remove(@Param("id") Integer id);

    void insert(GenScheme genScheme);

    void update(GenScheme genScheme);

    GenScheme getByGenTableId(@Param("genTableId") String genTableId);
}
