package com.sailei.modules.sys.mapper;

import com.sailei.modules.sys.entity.LoginLog;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 登录记录 Mapper 接口
 *
 * @Author sailei
 * @since 2018-12-07
 */
@Mapper
public interface LoginLogMapper {

    /**
     * 获取登录日志
     */
    List<LoginLog> queryPage(Map<String, Object> params);

    long queryCount(Map<String, Object> params);

    void removeAll();

    void insert(LoginLog loginLog);
}
