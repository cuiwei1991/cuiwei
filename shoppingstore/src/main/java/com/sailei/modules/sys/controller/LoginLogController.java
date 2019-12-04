package com.sailei.modules.sys.controller;

import com.sailei.common.base.BaseController;
import com.sailei.common.base.LayuiPage;
import com.sailei.common.service.R;
import com.sailei.modules.sys.service.LoginLogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * 日志管理的控制器
 *
 * @Author sailei
 * @Date 2017年4月5日 19:45:36
 */
@Controller
@RequestMapping("/loginLog")
public class LoginLogController extends BaseController {

    private static String PREFIX = "/modules/sys/log/";

    @Autowired
    private LoginLogService loginLogService;

    /**
     * 跳转到日志管理的首页
     *
     * @Author sailei
     * @Date 2018/12/23 5:51 PM
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "login_log.html";
    }

    /**
     * 查询登录日志列表
     *
     * @Author sailei
     * @Date 2018/12/23 5:51 PM
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("loginLog:list")
    public LayuiPage list(@RequestParam Map<String, Object> params) {
        LayuiPage page = loginLogService.queryPage(params);
        return page;
    }

    /**
     * 清空日志
     *
     * @Author sailei
     * @Date 2018/12/23 5:51 PM
     */
    @ResponseBody
    @RequestMapping("/delLoginLog")
    @RequiresPermissions("loginLog:delLoginLog")
    public R delLog() {
        loginLogService.removeAll();
        return R.ok();
    }
}
