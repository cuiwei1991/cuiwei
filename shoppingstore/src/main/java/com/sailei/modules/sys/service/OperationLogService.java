package com.sailei.modules.sys.service;

import com.google.gson.Gson;
import com.sailei.common.rebbitmq.RabbitMqUtil;
import com.sailei.common.service.ServiceResult;
import com.sailei.common.utils.PageUtils;
import com.sailei.common.base.LayuiPage;
import com.sailei.modules.sys.entity.LoginLog;
import com.sailei.modules.sys.entity.OperationLog;
import com.sailei.modules.sys.mapper.OperationLogMapper;
import com.xiaoleilu.hutool.json.JSONUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** 
 * 描述:操作日志 服务实现类
 *  
 * @Author sailei
 * @Date 2019/7/21 12:35
 */
@Service
public class OperationLogService {

    @Autowired
    private OperationLogMapper operationLogMapper;
    /**
     * 记录日志
     */
    public static final Logger logger = LoggerFactory.getLogger(OperationLogService.class);
    /**
     * 获取操作日志列表
     *
     * @Author sailei
     * @Date 2018/12/23 5:41 PM
     */
    public LayuiPage queryPage(Map<String, Object> params) {

        /**处理分页参数*/
        PageUtils.changeForMap(params);
        /**获取分页列表*/
        List<OperationLog> list = operationLogMapper.queryPage(params);
        /**获取总条数*/
        long count = operationLogMapper.queryCount(params);
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
        operationLogMapper.removeAll();

        /** 记录日志 不能影响正常业务 */
        Map<String,String> map = new HashMap<>();
        map.put("title", "已移除当前所有的业务日志");
        RabbitMqUtil.sendLogOption("清空日志", "1", map);
    }

    public OperationLog getById(String id) {
        return operationLogMapper.getById(id);
    }

    /** 
     * 描述:创建日志
     *  
     * @Author sailei
     * @Date 2019/8/20 15:10
     */
    public ServiceResult createLog(Map<String, Object> map) {
        ServiceResult result = new ServiceResult();
        Gson gaon = new Gson();
        try{
            /** 获取MQ的数据保存到数据库 */
            String title = (String)map.get("title");
            String userId = (String)map.get("userId");
            String logType = (String)map.get("logType");
            Object bean = map.get("bean");
            OperationLog log = new OperationLog();
            log.setUserId(userId);
            log.setLogName(title);
            log.setCreateTime(new Date());
            log.setLogType(logType);
            log.setMessage(gaon.toJson(bean));
            operationLogMapper.insert(log);

            result.setCode(ServiceResult.STATUS_SUCCEED);
            result.setMessage("操作成功!");
        }catch (Exception e){
            result.setMessage(e.getMessage());
            logger.error("创建业务日志报错:", e);
        }

        return result;
    }
}
