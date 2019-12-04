package com.sailei.modules.gen.mapper;

import com.sailei.modules.gen.entity.GenTable;
import com.sailei.modules.gen.entity.GenTableColumn;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GenDataBaseDictMapper {
    List<GenTable> findTableList(GenTable paramGenTable);

    List<GenTableColumn> findTableColumnList(GenTable paramGenTable);

    List<String> findTablePK(GenTable paramGenTable);
}