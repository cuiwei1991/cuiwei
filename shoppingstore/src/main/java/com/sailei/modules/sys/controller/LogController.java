package com.sailei.modules.sys.controller;

import com.sailei.common.base.LayuiPage;
import com.sailei.common.service.R;
import com.sailei.modules.sys.entity.OperationLog;
import com.sailei.modules.sys.service.OperationLogService;
import com.sailei.common.base.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
@RequestMapping("/log")
public class LogController extends BaseController {

    private static String PREFIX = "/modules/sys/log/";

    @Autowired
    private OperationLogService operationLogService;

    /**
     * 跳转到日志管理的首页
     *
     * @Author sailei
     * @Date 2018/12/23 5:34 PM
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "log.html";
    }

    /**
     * 查询操作日志列表
     *
     * @Author sailei
     * @Date 2018/12/23 5:34 PM
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("log:list")
    public LayuiPage list(@RequestParam Map<String, Object> params) {
        LayuiPage page = operationLogService.queryPage(params);
        return page;
    }

    /**
     * 桌面显示日志
     *
     * @Author sailei
     * @Date 2018/12/23 5:34 PM
     */
    @ResponseBody
    @RequestMapping("/listForHome")
    public LayuiPage listForHome(@RequestParam Map<String, Object> params) {
        LayuiPage page = operationLogService.queryPage(params);
        return page;
    }

    /**
     * 查询操作日志详情
     *
     * @Author sailei
     * @Date 2018/12/23 5:34 PM
     */
    @ResponseBody
    @RequestMapping("/detail/{id}")
    @RequiresPermissions("log:detail")
    public R detail(@PathVariable String id) {
        R result = R.ok();
        OperationLog operationLog = operationLogService.getById(id);
        result.put("operationLog", operationLog);
        return result;
    }

    /**
     * 清空日志
     *
     * @Author sailei
     * @Date 2018/12/23 5:34 PM
     */
    @ResponseBody
    @RequestMapping("/delLog")
    @RequiresPermissions("log:delLog")
    public R delLog() {
        operationLogService.removeAll();
        return R.ok();
    }
}
