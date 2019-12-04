package com.sailei.modules.test.tree.controller;
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

import com.sailei.modules.test.tree.entity.TestGenealogy;
import com.sailei.modules.test.tree.service.TestGenealogyService;

/**
 * 族谱表 控制层
 *
 * @Author admin
 * @Date 2019-10-08 14:20:14
 */
@Controller
@RequestMapping("/test/tree/testGenealogy")
public class TestGenealogyController {

    /**
     * 记录日志
     */
    public static final Logger logger = LoggerFactory.getLogger(TestGenealogyController.class);

    private static String PREFIX = "/modules/test/tree";

    @Autowired
    private TestGenealogyService testGenealogyService;

    /**
	 * 主页面
	 */
    @RequestMapping("/index")
    public String index() {
        return PREFIX + "/testGenealogyList.html";
    }

    /**
     * 跳转到添加页面
	 */
    @RequestMapping("/index_add")
    public String add(String id, Model model) {
    	if(ToolUtils.isNotEmpty(id)){
            TestGenealogy testGenealogy = testGenealogyService.getById(id);
            model.addAttribute("testGenealogy", testGenealogy);
        }
        return PREFIX + "/testGenealogyAddForm.html";
    }

    /**
     * 跳转到修改页面
	 */
    @RequestMapping("/index_edit")
    public String edit() {
        return PREFIX + "/testGenealogyEditForm.html";
    }

    /**
     * 获取tree列表,ztree格式
     *
     * @Author admin
     * @Date 2019-10-08 14:20:14
     */
    @ResponseBody
    @RequestMapping(value = "/tree")
    public List<ZTreeNode> tree() {
        List<ZTreeNode> tree = testGenealogyService.tree();
        tree.add(ZTreeNode.createParent());
        return tree;
    }

	/**
     * 获取树形列表
     *
     * @Author admin
     * @Date 2019-10-08 14:20:14
     */
    @ResponseBody
    @RequiresPermissions("test:tree:testGenealogy:list")
    @RequestMapping(value = "/listTree")
    public Object listTree() {
        List<TestGenealogy> testGenealogys = testGenealogyService.selectTestGenealogyTree();
        LayuiPage result = new LayuiPage(testGenealogys, testGenealogys.size());
        return result;
    }

    /**
     * 查看详情
     *
     * @Author admin
     * @Date 2019-10-08 14:20:14
     */
    @ResponseBody
    @RequestMapping(value = "/detail/{testGenealogyId}")
    @RequiresPermissions("test:tree:testGenealogy:detail")
    public R detail(@PathVariable("testGenealogyId")String testGenealogyId) {
        if (ToolUtils.isEmpty(testGenealogyId)) {
            return R.error("参数错误");
        }

        /** 获取详细信息 */
        TestGenealogy testGenealogy = testGenealogyService.getById(testGenealogyId);

        if(testGenealogy == null || testGenealogy.getParentName() == null){
            testGenealogy.setParentName("顶级");
        }
        return R.ok().put("data", testGenealogy);
    }

    /**
     * 新增记录
     *
     * @Author admin
     * @Date 2019-10-08 14:20:14
     */
    @ResponseBody
    @RequiresPermissions("test:tree:testGenealogy:add")
    @RequestMapping(value = "/save")
    public R save(TestGenealogy testGenealogy){
        try {
            testGenealogyService.save(testGenealogy);
        }catch (Exception e){
            logger.error("保存出错：" + e);
            return R.error("保存出错：" + e);
        }
        return R.ok();
    }

    /**
     * 修改记录
     *
     * @Author admin
     * @Date 2019-10-08 14:20:14
     */
    @ResponseBody
    @RequiresPermissions("test:tree:testGenealogy:edit")
    @RequestMapping(value = "/edit")
    public R updateById(TestGenealogy testGenealogy){
        try {
            testGenealogyService.updateById(testGenealogy);
        }catch (Exception e){
            logger.error("保存出错：" + e);
            return R.error("保存出错：" + e);
        }
        return R.ok();
    }

    /**
     * 根据ID移除记录
     *
     * @Author admin
     * @Date 2019-10-08 14:20:14
     */
    @ResponseBody
    @RequiresPermissions("test:tree:testGenealogy:remove")
    @RequestMapping(value = "/remove")
    public R remove(@RequestParam String id) {
        try{
            return testGenealogyService.remove(id);
        }catch (Exception e){
            logger.error("【根据ID移除记录】出错" + e.getMessage());
            return R.error(e.getMessage());
        }
    }

}