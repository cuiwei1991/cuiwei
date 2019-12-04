package com.sailei.modules.sys.mapper;

import com.sailei.modules.sys.entity.Set;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface SetMapper {

    List<Set> queryPage(Map<String, Object> params);

    long queryCount(Map<String, Object> params);

    Set getById(@Param("setId") Integer setId);

    void saveSet(Set set);

    void editSet(Set set);

    void remove(@Param("setId") Integer setId);

    Set getByKey(@Param("setKey") String setKey);
}
