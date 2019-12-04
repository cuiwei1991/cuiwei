package com.sailei.modules.sys.service;

import com.sailei.common.rebbitmq.RabbitMqUtil;
import com.sailei.common.service.ServiceResult;
import com.sailei.common.utils.PageUtils;
import com.sailei.common.base.LayuiPage;
import com.sailei.modules.sys.entity.LoginLog;
import com.sailei.modules.sys.mapper.LoginLogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 登录记录 服务实现类
 *
 * @Author sailei
 * @since 2018-12-07
 */
@Service
public class LoginLogService {

    @Autowired
    private LoginLogMapper loginLogMapper;

    /**
     * 获取登录日志列表
     *
     * @Author sailei
     * @Date 2018/12/23 5:53 PM
     */
    public LayuiPage queryPage(Map<String, Object> params) {

        /**处理分页参数*/
        PageUtils.changeForMap(params);
        /**获取分页列表*/
        List<LoginLog> list = loginLogMapper.queryPage(params);
        /**获取总条数*/
        long count = loginLogMapper.queryCount(params);
        /**初始化LayuiPage*/
        LayuiPage page = new LayuiPage(list, count);

        return page;
    }

    /**
     * 描述:清空日志
     *
     * @Author sailei
     * @Date 2019/8/20 14:24
     */
    public void removeAll() {
        loginLogMapper.removeAll();

        /** 记录日志 不能影响正常业务 */
        Map<String,String> map = new HashMap<>();
        map.put("title", "已移除当前所有的登录日志");
        RabbitMqUtil.sendLogOption("清空日志", "1", map);
    }

    /** 
     * 描述:使用MQ接收消息保存登录日志
     *  
     * @Author sailei
     * @Date 2019/8/20 10:31
     */
    public ServiceResult createLog(Map<String, Object> map) {
        ServiceResult result = new ServiceResult();
        try{
            /** 获取MQ的数据保存到数据库 */
            String title = (String)map.get("title");
            String userId = (String)map.get("userId");
            Object bean = map.get("bean");
            LoginLog log = new LoginLog();
            log.setUserId(userId);
            log.setLogName(title);
            log.setCreateTime(new Date());
            log.setIpAddress(bean.toString());
            loginLogMapper.insert(log);

            result.setCode(ServiceResult.STATUS_SUCCEED);
            result.setMessage("操作成功!");
        }catch (Exception e){
            result.setMessage(e.getMessage());
        }

        return result;
    }
}
