package com.sailei.modules.test.user.controller;
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
import com.sailei.modules.test.user.entity.TestUser;
import com.sailei.modules.test.user.service.TestUserService;

/**
 * 用户表 控制层
 *
 * @Author gaojin
 * @Date
 */
@Controller
@RequestMapping("/test/user/testUser")
public class TestUserController {

    /**
     * 记录日志
     */
    public static final Logger logger = LoggerFactory.getLogger(TestUserController.class);

    private static String PREFIX = "/modules/test/user";

    @Autowired
    private TestUserService testUserService;

    /**
	 * 主页面
	 */
    @RequestMapping("/index")
    public String index() {
        return PREFIX + "/testUserList.html";
    }

    /**
     * 跳转到添加页面
	 */
    @RequestMapping("/index_add")
    public String add() {
        return PREFIX + "/testUserForm.html";
    }

    /**
     * 跳转到修改页面
	 */
    @RequestMapping("/index_edit")
    public String edit() {
        return PREFIX + "/testUserForm.html";
    }

    /**
     * 获取主页面数据
     */
    @ResponseBody
    @RequiresPermissions("test:user:testUser:list")
    @RequestMapping(value = "/list")
    public LayuiPage list(@RequestParam Map<String, Object> params) {
        LayuiPage page = testUserService.queryPage(params);
        return page;
    }

    /**
     * 新增保存
     *
     * @param testUser
     */
    @ResponseBody
    @RequiresPermissions("test:user:testUser:add")
    @RequestMapping(value = "/add")
    public R save(TestUser testUser){
        try {
            testUserService.saveOrupdate(testUser);
        }catch (Exception e){
            logger.error("【保存记录】出错：" + e.getMessage());
            return R.error(e.getMessage());
        }
        return R.ok();
    }

    /**
     * 获取testUser详情
     */
    @ResponseBody
    @RequiresPermissions("test:user:testUser:edit")
	@RequestMapping(value = "/edit")
    public R edit(@RequestParam String id) {
    	try {
            return testUserService.getById(id);
        }catch (Exception e){
            logger.error("【获取testUser详情】出错:" + e.getMessage());
            return R.error(e.getMessage());
        }
    }

    /**
     * 根据ID移除记录
     */
    @ResponseBody
    @RequiresPermissions("test:user:testUser:remove")
    @RequestMapping(value = "/remove")
    public R remove(@RequestParam String id) {
        try{
            return testUserService.remove(id);
        }catch (Exception e){
            logger.error("【根据ID移除记录】出错" + e.getMessage());
            return R.error(e.getMessage());
        }
    }

}