package com.sailei.common.base;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 描述:错误处理中心
 *
 * @Author sailei
 * @Date 2019/7/21 15:05
 **/
@Controller
public class SaileiErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleError(){
        return "/404.html";
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }

    /**
     * 跳转到session超时页面
     *
     * @Author sailei
     */
    @RequestMapping(path = "/errorSession")
    public String errorPageInfo(Model model) {
        model.addAttribute("tips", "session超时");
        return "/login.html";
    }

}
