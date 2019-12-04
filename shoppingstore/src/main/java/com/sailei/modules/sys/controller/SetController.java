package com.sailei.modules.sys.controller;

import com.sailei.common.base.BaseController;
import com.sailei.common.base.LayuiPage;
import com.sailei.common.rebbitmq.RabbitMqUtil;
import com.sailei.common.redis.RedisUtil;
import com.sailei.common.service.R;
import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.sys.entity.Set;
import com.sailei.modules.sys.service.SetService;
import com.sailei.modules.sys.utils.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * 系统配置控制层
 * @Author gaojin
 */
@Controller
@RequestMapping("/set")
public class SetController extends BaseController {

    private static String PREFIX = "/modules/sys/set";

    @Autowired
    private SetService setService;
    /**
     * 记录日志
     */
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 配置列表页
     *
     * @Author gaojin
     * @Date 2019/05/06 12:00
     */
    @RequestMapping("/index")
    public String index() {
        return PREFIX + "/set.html";
    }

    /**
     * 跳转到添加配置
     *
     * @Author gaojin
     * @Date 2019/05/06 12:00
     */
    @RequestMapping("/set_add")
    @RequiresPermissions("set:add")
    public String add() {
        return PREFIX + "/set_add.html";
    }

    /**
     * 跳转到修改配置
     *
     * @Author sailei
     * @Date 2019/05/06 12:00
     */
    @RequestMapping(value = "/set_edit")
    @RequiresPermissions("set:edit")
    public String edit() {
        return PREFIX + "/set_edit.html";
    }

    /**
     * 查看配置
     *
     * @Author gaojin
     * @Date 2019/05/06 12:00
     */
    @ResponseBody
    @RequestMapping(value = "/view/{setId}")
    public R view(@PathVariable Integer setId) {
        if (ToolUtils.isEmpty(setId)) {
            return R.error("参数错误");
        }
        Set set = setService.getById(setId);
        return R.ok().put("data", set);
    }

    /**
     * 获取配置列表
     *
     * @Author gaojin
     * @Date 2019/05/06 12:00
     */
    @ResponseBody
    @RequestMapping(value = "/list")
    public LayuiPage list(@RequestParam Map<String, Object> params) {
        LayuiPage page = setService.queryPage(params);
        return page;
    }

    /**
     * 添加配置
     *
     * @Author gaojin
     * @Date 2019/05/06 12:00
     */
    @ResponseBody
    @RequestMapping(value = "/add")
    @RequiresPermissions("set:add")
    public R save(Set set) {
        try{
            /** 校验参数 */
            String errMsg = beanValidator(set);
            if (ToolUtils.isNotEmpty(errMsg)){
                return R.error(errMsg);
            }
            setService.saveSet(set);
            return R.ok();
        }catch(Exception e){
            logger.error("【添加配置】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 修改配置
     *
     * @Author gaojin
     * @Date 2019/05/06 12:00
     */
    @ResponseBody
    @RequestMapping(value = "/edit")
    @RequiresPermissions("set:edit")
    public R edit(Set set) {
        try{
            /** 校验参数 */
            String errMsg = beanValidator(set);
            if (ToolUtils.isNotEmpty(errMsg)){
                return R.error(errMsg);
            }
            setService.editSet(set);
            return R.ok();
        }catch(Exception e){
            logger.error("【修改配置】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 删除配置
     *
     * @Author gaojin
     * @Date 2019/05/06 12:00
     */
    @ResponseBody
    @RequestMapping(value = "/remove")
    @RequiresPermissions("set:remove")
    public R remove(@RequestParam Integer setId) {
        try{
            setService.remove(setId);
            return R.ok();
        }catch(Exception e){
            logger.error("【删除配置】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 更新配置
     *
     * @Author gaojin
     * @Date 2019/05/06 12:00
     */
    @ResponseBody
    @RequestMapping(value = "/update")
    @RequiresPermissions("set:update")
    public R update(Set set) {
        try{
            setService.update(set);
            return R.ok();
        }catch(Exception e){
            logger.error("【更新配置】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 加解锁配置
     *
     * @Author gaojin
     * @Date 2019/05/06 12:00
     */
    @ResponseBody
    @RequestMapping(value = "/lock")
    @RequiresPermissions("set:lock")
    public R lock(@RequestParam Integer setId) {
        try{
            setService.lock(setId);
            return R.ok();
        }catch(Exception e){
            logger.error("【加解锁配置】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 清理缓存
     *
     * @Author gaojin
     * @Date 2019/05/06 12:00
     */
    @ResponseBody
    @RequestMapping(value = "/clear")
    public R clear(@RequestParam String type) {
        if(ToolUtils.isEmpty(type)){
            return R.error("请求参数错误!");
        }
        String title = "所有缓存";
        if("clearAll".equals(type)){
            RedisUtil.flushAll();
        }else if("clearUser".equals(type)){
            UserUtils.deleteAll();
            title = "用户缓存";
        }else if("clearMenu".equals(type)){
            MenuUtils.deleteAll();
            title = "菜单缓存";
        }else if("clearRole".equals(type)){
            RoleUtils.deleteAll();
            title = "角色缓存";
        }else if("clearSet".equals(type)){
            SetUtils.deleteAll();
            title = "配置缓存";
        }else if("clearDict".equals(type)){
            DictUtils.deleteAll();
            title = "字典缓存";
        }

        /** 记录日志 不能影响正常业务 */
        Map<String,String> map = new HashMap<>();
        map.put("type", type);
        map.put("title", title);
        RabbitMqUtil.sendLogOption("清理缓存", "1", map);
        return R.ok();
    }

}
