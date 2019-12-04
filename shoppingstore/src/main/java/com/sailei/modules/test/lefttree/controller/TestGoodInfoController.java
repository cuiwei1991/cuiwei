package com.sailei.modules.test.lefttree.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sailei.common.base.LayuiPage;
import com.sailei.common.service.R;
import org.springframework.ui.Model;
import com.sailei.modules.test.lefttree.entity.TestGoodInfo;
import com.sailei.modules.test.lefttree.service.TestGoodInfoService;
import com.sailei.modules.test.lefttree.entity.TestGoodClass;
import com.sailei.modules.test.lefttree.service.TestGoodClassService;

/**
 * 商品表 控制层
 *
 * @Author gaojin
 * @date 2019-10-08 14:20:22
 */
@Controller
@RequestMapping("/test/lefttree/testGoodInfo")
public class TestGoodInfoController {

    /**
     * 记录日志
     */
    public static final Logger logger = LoggerFactory.getLogger(TestGoodInfoController.class);

    private static String PREFIX = "/modules/test/lefttree";

    @Autowired
    private TestGoodInfoService testGoodInfoService;
    @Autowired
    private TestGoodClassService testGoodClassService;

    /**
	 * 主页面
	 */
    @RequestMapping("/index")
    public String index() {
        return PREFIX + "/testGoodInfoList.html";
    }

    /**
     * 跳转到添加页面
	 */
    @RequestMapping("/index_add")
    public String add(String treeId, Model model) {
		TestGoodClass parent = testGoodClassService.getById(treeId);
		model.addAttribute("parent", parent);
        return PREFIX + "/testGoodInfoAddForm.html";
    }

    /**
     * 跳转到修改页面
	 */
    @RequestMapping("/index_edit")
    public String edit() {
        return PREFIX + "/testGoodInfoEditForm.html";
    }

    /**
     * 获取主页面数据
     */
    @ResponseBody
    @RequiresPermissions("test:lefttree:testGoodInfo:list")
    @RequestMapping(value = "/list")
    public LayuiPage list(@RequestParam Map<String, Object> params) {
        LayuiPage page = testGoodInfoService.queryPage(params);
        return page;
    }

    /**
     * 新增保存
     *
     * @param testGoodInfo
     */
    @ResponseBody
    @RequiresPermissions("test:lefttree:testGoodInfo:add")
    @RequestMapping(value = "/save")
    public R save(TestGoodInfo testGoodInfo){
        try {
            testGoodInfoService.saveOrupdate(testGoodInfo);
        }catch (Exception e){
            logger.error("保存出错：" + e);
            return R.error("保存出错：" + e);
        }
        return R.ok();
    }

    /**
     * 获取testGoodInfo详情
     */
    @ResponseBody
    @RequiresPermissions("test:lefttree:testGoodInfo:edit")
	@RequestMapping(value = "/edit")
    public R testEdit(@RequestParam String id) {
    	try {
            return testGoodInfoService.getById(id);
        }catch (Exception e){
            logger.error("【获取testGoodInfo详情】出错:" + e.getMessage());
            return R.error(e.getMessage());
        }
    }

    /**
     * 根据ID移除记录
     */
    @ResponseBody
    @RequiresPermissions("test:lefttree:testGoodInfo:remove")
    @RequestMapping(value = "/remove")
    public R remove(@RequestParam String id) {
        try{
            return testGoodInfoService.remove(id);
        }catch (Exception e){
            logger.error("【根据ID移除记录】出错" + e.getMessage());
            return R.error(e.getMessage());
        }
    }

}