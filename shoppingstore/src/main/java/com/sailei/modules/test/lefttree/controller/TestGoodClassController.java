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
import com.sailei.common.base.ZTreeNode;
import org.springframework.ui.Model;
import com.sailei.common.utils.ToolUtils;
import java.util.List;
import org.springframework.web.bind.annotation.PathVariable;

import com.sailei.modules.test.lefttree.entity.TestGoodClass;
import com.sailei.modules.test.lefttree.service.TestGoodClassService;
import com.sailei.modules.test.lefttree.entity.TestGoodInfo;

/**
 * 商品分类 控制层
 *
 * @Author gaojin
 * @Date 2019-10-08 14:20:22
 */
@Controller
@RequestMapping("/test/lefttree/testGoodClass")
public class TestGoodClassController {

    /**
     * 记录日志
     */
    public static final Logger logger = LoggerFactory.getLogger(TestGoodClassController.class);

    private static String PREFIX = "/modules/test/lefttree";

    @Autowired
    private TestGoodClassService testGoodClassService;

    /**
	 * 主页面
	 */
    @RequestMapping("/index")
    public String index() {
        return PREFIX + "/testGoodClassList.html";
    }

    /**
     * 跳转到添加页面
	 */
    @RequestMapping("/index_add")
    public String add(String id, Model model) {
    	if(ToolUtils.isNotEmpty(id)){
            TestGoodClass testGoodClass = testGoodClassService.getById(id);
            if(testGoodClass == null){
            	testGoodClass = new TestGoodClass();
            	testGoodClass.setId("0");
            	testGoodClass.setName("顶级");
            }
            model.addAttribute("testGoodClass", testGoodClass);
        }
        return PREFIX + "/testGoodClassAddForm.html";
    }

    /**
     * 跳转到修改页面
	 */
    @RequestMapping("/index_edit")
    public String edit() {
        return PREFIX + "/testGoodClassEditForm.html";
    }

    /**
     * 获取tree列表,ztree格式
     *
     * @Author gaojin
     * @Date 2019-10-08 14:20:22
     */
    @ResponseBody
    @RequestMapping(value = "/tree")
    public List<ZTreeNode> tree() {
        List<ZTreeNode> tree = testGoodClassService.tree();
        tree.add(ZTreeNode.createParent());
        return tree;
    }

	/**
     * 获取树形列表
     *
     * @Author gaojin
     * @Date 2019-10-08 14:20:22
     */
    @ResponseBody
    @RequiresPermissions("test:lefttree:testGoodClass:list")
    @RequestMapping(value = "/listTree")
    public Object listTree() {
        List<TestGoodClass> testGoodClasss = testGoodClassService.selectTestGoodClassTree();
        LayuiPage result = new LayuiPage(testGoodClasss, testGoodClasss.size());
        return result;
    }

    /**
     * 查看详情
     *
     * @Author gaojin
     * @Date 2019-10-08 14:20:22
     */
    @ResponseBody
    @RequestMapping(value = "/detail/{testGoodClassId}")
    @RequiresPermissions("test:lefttree:testGoodClass:detail")
    public R detail(@PathVariable("testGoodClassId")String testGoodClassId) {
        if (ToolUtils.isEmpty(testGoodClassId)) {
            return R.error("参数错误!");
        }

        /** 获取详细信息 */
        TestGoodClass testGoodClass = testGoodClassService.getById(testGoodClassId);

        if(testGoodClass == null || testGoodClass.getParentName() == null){
            testGoodClass.setParentName("顶级");
        }
        return R.ok().put("data", testGoodClass);
    }

    /**
     * 新增记录
     *
     * @Author gaojin
     * @Date 2019-10-08 14:20:22
     */
    @ResponseBody
    @RequiresPermissions("test:lefttree:testGoodClass:add")
    @RequestMapping(value = "/save")
    public R save(TestGoodClass testGoodClass){
        try {
            testGoodClassService.save(testGoodClass);
        }catch (Exception e){
            logger.error("保存出错:", e);
            return R.error("保存出错:" + e.getMessage());
        }
        return R.ok();
    }

    /**
     * 修改记录
     *
     * @Author gaojin
     * @Date 2019-10-08 14:20:22
     */
    @ResponseBody
    @RequiresPermissions("test:lefttree:testGoodClass:edit")
    @RequestMapping(value = "/edit")
    public R updateById(TestGoodClass testGoodClass){
        try {
            testGoodClassService.updateById(testGoodClass);
        }catch (Exception e){
            logger.error("保存出错:", e);
            return R.error("保存出错:" + e.getMessage());
        }
        return R.ok();
    }

    /**
     * 根据ID移除记录
     *
     * @Author gaojin
     * @Date 2019-10-08 14:20:22
     */
    @ResponseBody
    @RequiresPermissions("test:lefttree:testGoodClass:remove")
    @RequestMapping(value = "/remove")
    public R remove(@RequestParam String id) {
        try{
            return testGoodClassService.remove(id);
        }catch (Exception e){
            logger.error("【根据ID移除记录】出错:", e);
            return R.error(e.getMessage());
        }
    }
}