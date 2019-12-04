package com.sailei.modules.sys.mapper;

import com.sailei.modules.sys.entity.OperationLog;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 操作日志 Mapper 接口
 *
 * @Author sailei
 * @since 2018-12-07
 */
@Mapper
public interface OperationLogMapper{

    /**
     * 获取业务日志
     */
    List<OperationLog> queryPage(Map<String, Object> params);

    long queryCount(Map<String, Object> params);

    void removeAll();

    void insert(OperationLog loginLog);

    OperationLog getById(@Param("id") String id);
}
