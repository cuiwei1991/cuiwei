package com.sailei.modules.sys.controller;
import com.sailei.common.base.BaseController;
import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.sys.entity.Dict;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sailei.common.base.LayuiPage;
import com.sailei.common.service.R;
import com.sailei.modules.sys.entity.DictType;
import com.sailei.modules.sys.service.DictTypeService;

/**
 * 字典类型表 控制层
 *
 * @Author admin
 * @Date 2019-07-15 15:19:39
 */
@Controller
@RequestMapping("/sys/dictType")
public class DictTypeController extends BaseController{

    /**
     * 记录日志
     */
    public static final Logger logger = LoggerFactory.getLogger(DictTypeController.class);

    private static String PREFIX = "/modules/sys/dict";

    @Autowired
    private DictTypeService dictTypeService;

    /**
	 * 主页面
	 */
    @RequestMapping("/index")
    public String index() {
        return PREFIX + "/dictTypeList.html";
    }

    /**
     * 跳转到添加页面
	 */
    @RequestMapping("/index_add")
    public String add() {
        return PREFIX + "/dictTypeForm.html";
    }

    /**
     * 跳转到修改页面
	 */
    @RequestMapping("/index_edit")
    public String edit() {
        return PREFIX + "/dictTypeForm.html";
    }

    /**
     * 获取主页面数据
     */
    @ResponseBody
    @RequiresPermissions("sys:dictType:list")
    @RequestMapping(value = "/list")
    public LayuiPage list(@RequestParam Map<String, Object> params) {
        LayuiPage page = dictTypeService.queryPage(params);
        return page;
    }

    /**
     * 新增保存
     *
     * @param dictType
     */
    @ResponseBody
    @RequiresPermissions("sys:dictType:add")
    @RequestMapping(value = "/add")
    public R save(DictType dictType){
        try {
            /** 校验参数 */
            String errMsg = beanValidator(dictType);
            if (ToolUtils.isNotEmpty(errMsg)){
                return R.error(errMsg);
            }
            dictTypeService.saveOrupdate(dictType);
        }catch (Exception e){
            logger.error("【保存记录】出错：" + e.getMessage());
            return R.error(e.getMessage());
        }
        return R.ok();
    }

    /**
     * 获取dictType详情
     */
    @ResponseBody
    @RequiresPermissions("sys:dictType:edit")
	@RequestMapping(value = "/edit")
    public R edit(@RequestParam String id) {
    	try {
            return dictTypeService.getById(id);
        }catch (Exception e){
            logger.error("【获取dictType详情】出错:" + e.getMessage());
            return R.error(e.getMessage());
        }
    }

    /**
     * 根据ID移除记录
     */
    @ResponseBody
    @RequiresPermissions("sys:dictType:remove")
    @RequestMapping(value = "/remove")
    public R remove(@RequestParam String id) {
        try{
            return dictTypeService.remove(id);
        }catch (Exception e){
            logger.error("【根据ID移除记录】出错" + e.getMessage());
            return R.error(e.getMessage());
        }
    }

    /**
     * 查看详情接口
     *
     * @Author sailei
     * @Date 2019-03-13
     */
    @ResponseBody
    @RequestMapping("/dictType")
    public R dictType(String dictType) {
        List<Dict> dicts = dictTypeService.getByType(dictType);
        return R.ok().put("data", dicts);
    }

}