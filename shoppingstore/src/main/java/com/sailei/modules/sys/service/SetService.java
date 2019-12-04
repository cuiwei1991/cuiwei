package com.sailei.modules.sys.service;

import com.sailei.common.base.LayuiPage;
import com.sailei.common.base.SLException;
import com.sailei.common.rebbitmq.RabbitMqUtil;
import com.sailei.common.service.R;
import com.sailei.common.utils.PageUtils;
import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.sys.entity.Set;
import com.sailei.modules.sys.mapper.SetMapper;
import com.sailei.modules.sys.utils.SetUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class SetService {

    @Autowired
    private SetMapper setMapper;

    /**
     * 查询列表
     * @param params
     * @return
     */
    public LayuiPage queryPage(Map<String, Object> params) {

        /**处理分页参数*/
        PageUtils.changeForMap(params);
        /**获取分页列表*/
        List<Set> sets = setMapper.queryPage(params);
        /**获取总条数*/
        long count = setMapper.queryCount(params);
        /**初始化LayuiPage*/
        LayuiPage page = new LayuiPage(sets, count);

        return page;
    }

    /**
     * 根据记录ID获取记录
     * @param setId
     * @return
     */
    public Set getById(Integer setId) {
        return setMapper.getById(setId);
    }

    /**
     * 保存记录
     * @param set
     */
    @Transactional(rollbackFor = Exception.class)
    public void saveSet(Set set) throws SLException {
        /**判断配置键是否重复*/
        Set setRe = setMapper.getByKey(set.getSetKey());
        if(setRe != null){
            throw new SLException("配置键已存在!");
        }
        set.setUpdateTime(new Date());
        set.setTypeDesc("系统");
        setMapper.saveSet(set);

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("添加配置", "1", set);
    }
    /**
     * 修改记录
     * @param set
     */
    @Transactional(rollbackFor = Exception.class)
    public void editSet(Set set) {
        setMapper.editSet(set);

        /**更新配置缓存*/
        SetUtils.edit(set.getSetKey(), set.getSetValue());

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("修改配置", "1", set);
    }

    /**
     * 删除记录
     * @param id
     */
    @Transactional(rollbackFor = Exception.class)
    public void remove(Integer id) {
        /**更新配置缓存*/
        Set set = setMapper.getById(id);

        setMapper.remove(id);
        SetUtils.delete(set.getSetKey());

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("删除配置", "1", set);
    }

    /**
     * 更新配置
     * @param set 配置ID
     */
    @Transactional(rollbackFor = Exception.class)
    public void update(Set set) throws SLException {
        /**首先查询数据库中的配置*/
        Set setOld = setMapper.getById(set.getSetId());
        if(set == null || set.getIsLock() == null || set.getIsLock() == 1){
            throw new SLException("配置信息已锁定，不能修改!");
        }

        setOld.setSetValue(set.getSetValue());
        setOld.setRemark(set.getRemark());
        setOld.setUpdateTime(new Date());
        setMapper.editSet(setOld);

        /**更新配置缓存*/
        SetUtils.edit(set.getSetKey(), set.getSetValue());

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("更新配置", "1", set);
    }

    /**
     * 加解锁配置
     * @param setId 配置ID
     */
    @Transactional(rollbackFor = Exception.class)
    public void lock(Integer setId) throws SLException {
        /**首先查询数据库中的配置*/
        Set set = setMapper.getById(setId);
        if(set == null || set.getIsLock() == null){
            throw new SLException("配置信息不存在!");
        }
        String type = "加锁配置";
        if(set.getIsLock() == 1){
            set.setIsLock(0);
            type = "解锁配置";
        }else{
            set.setIsLock(1);
        }
        setMapper.editSet(set);

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption(type, "1", set);
    }
}
