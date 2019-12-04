package com.sailei.modules.sys.service;

import java.util.*;
import java.math.BigDecimal;

import com.sailei.common.rebbitmq.RabbitMqUtil;
import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.sys.entity.Dict;
import com.sailei.modules.sys.utils.DictUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sailei.common.base.LayuiPage;
import com.sailei.common.service.R;
import com.sailei.common.utils.PageUtils;
import com.sailei.common.utils.IdUtils;
import com.sailei.modules.sys.entity.DictType;
import com.sailei.modules.sys.mapper.DictTypeMapper;
import com.sailei.modules.sys.mapper.DictMapper;
/**
 * 字典类型表服务类
 *
 * @Author admin
 * @Date 2019-07-15 15:19:39
 */
@Service
public class DictTypeService{

	 @Autowired
     private DictTypeMapper dictTypeMapper;
     @Autowired
     private DictMapper dictMapper;

	/**
     * 根据条件查询列表
     *
     * @Author admin
     * @Date 2019-07-15 15:19:39
     */
    public LayuiPage queryPage(Map<String, Object> params) {

        /**处理分页参数*/
        PageUtils.changeForMap(params);
        /**获取分页列表*/
        List<DictType> dictTypes = dictTypeMapper.queryPage(params);
        /**获取总条数*/
        long count = dictTypeMapper.queryCount(params);
        /**初始化LayuiPage*/
        LayuiPage page = new LayuiPage(dictTypes, count);

        return page;
    }

    /**
     * 根据ID查询记录
     *
     * @param id 记录ID
     */
     public R getById(String id) {
        R result = R.ok();
        DictType dictType = dictTypeMapper.getById(id);
        List<Dict> dictList = dictMapper.getByParentId(id);
        dictType.setDictList(dictList);
        result.put("dictType", dictType);
        return result;
    }

    /**
     * 保存记录
     *
     * @param dictType 保存的对象
     */
    @Transactional(rollbackFor = Exception.class)
	public R saveOrupdate(DictType dictType) {
        String  title = "添加字典";
		/** 主表更新 */
        if(dictType.getDictTypeId() != null && !"".equals(dictType.getDictTypeId())){
            dictTypeMapper.updateById(dictType);
            title = "修改字典";
        }else{
            String id= IdUtils.getNumberId();
            dictType.setDictTypeId(id);
            dictTypeMapper.save(dictType);
        }

        /** 子表更新 */
		/** 如果是修改，先删除原子表内容 */
        if(dictType.getDictTypeId() != null && !"".equals(dictType.getDictTypeId())){
        	dictMapper.removeByParentId(dictType.getDictTypeId());
        }
        List<Map<String,Object>> listDict = dictType.getDictMapList();
		if(listDict != null && listDict.size() > 0){
			for(Map<String,Object> map : listDict){
				Dict dict = new Dict();
			   	String childId = IdUtils.getNumberId();
			   	dict.setDictId(childId);
			   	dict.setDictTypeId(dictType.getDictTypeId());
				String code = map.get("code") != null ? map.get("code").toString() : "";
				dict.setCode(code);
				String name = map.get("name") != null ? map.get("name").toString() : "";
				dict.setName(name);
				String sort = map.get("sort") != null ? map.get("sort").toString() : "0";
				dict.setSort(new BigDecimal(ToolUtils.isNotEmpty(sort) ? sort : "0"));
				String deion = map.get("deion") != null ? map.get("deion").toString() : "";
				dict.setDeion(deion);
			   dictMapper.save(dict);
		   }
		}

        /**清除缓存*/
        DictUtils.deleteKey(dictType.getCode());

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption(title, "1", dictType);

        return R.ok();
    }

    /**
     * 根据ID移除记录
     *
     * @param id 记录ID
     */
    public R remove(String id) {
        DictType dictType = dictTypeMapper.getById(id);
        dictTypeMapper.remove(id);

        /** 移除子表数据 */
		dictMapper.removeByParentId(id);

        /**清除缓存*/
        DictUtils.deleteKey(dictType.getCode());

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("删除字典", "1", dictType);

        return R.ok();
    }

    /**
     * 描述:获取字典属性
     *
     * @Author sailei
     * @Date 2019/7/15 15:24
     */
    public List<Dict> getByType(String dictType) {
        return DictUtils.getDictList(dictType);
    }
}