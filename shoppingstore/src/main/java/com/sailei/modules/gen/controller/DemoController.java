package com.sailei.modules.gen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** 
 * 描述:
 *  
 * @Author sailei
 * @Date 2019/9/19 13:27
 */
@Controller
@RequestMapping("/demo")
public class DemoController {

    private static String PREFIX = "/modules/demos";

    /**
     * 多选模块
     *
     * @Author gaojin
     * @Date 2019/06/06 12:00
     */
    @RequestMapping("/select")
    public String index() {
        return PREFIX + "/select/selects.html";
    }

    /**
     * form表单模块
     *
     * @Author gaojin
     * @Date 2019/06/06 12:00
     */
    @RequestMapping("/form")
    public String form() {
        return PREFIX + "/form/form.html";
    }
}
