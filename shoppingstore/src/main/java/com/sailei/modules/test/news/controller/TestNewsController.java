package com.sailei.modules.test.news.controller;
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
import com.sailei.modules.test.news.entity.TestNews;
import com.sailei.modules.test.news.service.TestNewsService;

/**
 * 新闻表 控制层
 *
 * @Author 高进
 * @Date 2019-10-08 14:21:02
 */
@Controller
@RequestMapping("/test/news/testNews")
public class TestNewsController {

    /**
     * 记录日志
     */
    public static final Logger logger = LoggerFactory.getLogger(TestNewsController.class);

    private static String PREFIX = "/modules/test/news";

    @Autowired
    private TestNewsService testNewsService;

    /**
	 * 主页面
	 */
    @RequestMapping("/index")
    public String index() {
        return PREFIX + "/testNewsList.html";
    }

    /**
     * 跳转到添加页面
	 */
    @RequestMapping("/index_add")
    public String add() {
        return PREFIX + "/testNewsAddForm.html";
    }

    /**
     * 跳转到修改页面
	 */
    @RequestMapping("/index_edit")
    public String edit() {
        return PREFIX + "/testNewsEditForm.html";
    }

    /**
     * 获取主页面数据
     */
    @ResponseBody
    @RequiresPermissions("test:news:testNews:list")
    @RequestMapping(value = "/list")
    public LayuiPage list(@RequestParam Map<String, Object> params) {
        LayuiPage page = testNewsService.queryPage(params);
        return page;
    }

    /**
     * 新增保存
     *
     * @param testNews
     */
    @ResponseBody
    @RequiresPermissions("test:news:testNews:add")
    @RequestMapping(value = "/save")
    public R save(TestNews testNews){
        try {
            testNewsService.saveOrupdate(testNews);
        }catch (Exception e){
            logger.error("保存出错:", e);
            return R.error("保存出错:" + e.getMessage());
        }
        return R.ok();
    }

    /**
     * 获取testNews详情
     */
    @ResponseBody
    @RequiresPermissions("test:news:testNews:edit")
	@RequestMapping(value = "/edit")
    public R testEdit(@RequestParam String id) {
    	try {
            return testNewsService.getById(id);
        }catch (Exception e){
            logger.error("【获取testNews详情】出错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 根据ID移除记录
     */
    @ResponseBody
    @RequiresPermissions("test:news:testNews:remove")
    @RequestMapping(value = "/remove")
    public R remove(@RequestParam String id) {
        try{
            return testNewsService.remove(id);
        }catch (Exception e){
            logger.error("【根据ID移除记录】出错:", e);
            return R.error(e.getMessage());
        }
    }

}