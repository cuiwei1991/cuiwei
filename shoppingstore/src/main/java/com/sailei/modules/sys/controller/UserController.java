package com.sailei.modules.sys.controller;

import com.sailei.common.base.BaseController;
import com.sailei.common.base.LayuiPage;
import com.sailei.common.base.SLException;
import com.sailei.common.rebbitmq.RabbitMqUtil;
import com.sailei.common.service.R;
import com.sailei.common.utils.ToolUtils;
import com.sailei.config.shiro.ShiroKit;
import com.sailei.modules.sys.entity.User;
import com.sailei.modules.sys.service.SessionService;
import com.sailei.modules.sys.service.UserService;
import com.sailei.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Map;

/**
 * 系统管理员控制器
 *
 * @Author sailei
 * @Date 2017年1月11日 下午1:08:17
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    private static String PREFIX = "/modules/sys/user/";
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserService userService;
    @Autowired
    private SessionService sessionService;

    /**
     * 跳转到查看管理员列表的页面
     *
     * @Author sailei
     * @Date 2018/12/24 22:43
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "user.html";
    }

    /**
     * 在线用户
     *
     * @Author sailei
     * @Date 2018/12/24 22:43
     */
    @RequestMapping("/online")
    public String online() {
        return PREFIX + "online.html";
    }

    /**
     * 跳转到查看管理员列表的页面
     *
     * @Author sailei
     * @Date 2018/12/24 22:43
     */
    @RequestMapping("/user_add")
    public String addView() {
        return PREFIX + "user_add.html";
    }

    /**
     * 跳转到角色分配页面
     *
     * @Author sailei
     * @Date 2018/12/24 22:43
     */
    @RequestMapping("/role_assign")
    @RequiresPermissions("user:role_assign")
    public String roleAssign(@RequestParam String userId, Model model) {
        model.addAttribute("userId", userId);
        return PREFIX + "user_roleassign.html";
    }

    /**
     * 跳转到编辑管理员页面
     *
     * @Author sailei
     * @Date 2018/12/24 22:43
     */
    @RequiresPermissions("user:user_edit")
    @RequestMapping("/user_edit")
    public String userEdit() {
        return PREFIX + "user_edit.html";
    }

    /**
     * 获取用户详情
     *
     * @Author sailei
     * @Date 2018/12/24 22:43
     */
    @ResponseBody
    @RequestMapping("/getUserInfo")
    public R getUserInfo(@RequestParam String userId) {
        if (ToolUtils.isEmpty(userId)) {
            return R.error("userId不能为空！");
        }

        R result = R.ok();
        User user = UserUtils.getById(userId);
        result.put("data", user);

        return result;
    }

    /**
     * 修改当前用户的密码
     *
     * @Author sailei
     * @Date 2018/12/24 22:43
     */
    @ResponseBody
    @RequestMapping("/changePwd")
    public R changePwd(@RequestParam("oldPassword") String oldPassword, @RequestParam("newPassword") String newPassword) {
        try{
            userService.changePwd(oldPassword, newPassword);
            return R.ok();
        }catch(Exception e){
            logger.error("【修改当前用户的密码】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 查询管理员列表
     *
     * @Author sailei
     * @Date 2018/12/24 22:43
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("user:list")
    public LayuiPage list(@RequestParam Map<String, Object> params) {
        LayuiPage page = userService.queryPage(params);
        return page;
    }

    /**
     * 在线用户列表
     *
     * @Author sailei
     * @Date 2018/12/24 22:43
     */
    @ResponseBody
    @RequestMapping("/onlineList")
    @RequiresPermissions("user:onlineList")
    public LayuiPage onlineList(@RequestParam Map<String, Object> params) {
        LayuiPage page = sessionService.queryPage(params);
        return page;
    }

    /**
     * 强制下线
     *
     * @Author sailei
     * @Date 2018/12/24 22:44
     */
    @ResponseBody
    @RequestMapping("/logout")
    @RequiresPermissions("user:logout")
    public R logout(String sessionId, String username) {
        try{
            User user = UserUtils.getUser();
            if(username != null && username.equals(user.getAccount())){
                return R.error("不能强制自己下线!");
            }
            sessionService.forceLogout(sessionId);
            return R.ok();
        }catch (Exception e){
            logger.error("【强制下线】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 添加管理员
     *
     * @Author sailei
     * @Date 2018/12/24 22:44
     */
    @ResponseBody
    @RequestMapping("/add")
    @RequiresPermissions("user:add")
    public R add(@Valid User user) {
        try{
            /** 校验参数 */
            String errMsg = beanValidator(user);
            if (ToolUtils.isNotEmpty(errMsg)){
                return R.error(errMsg);
            }
            userService.addUser(user);
            return R.ok();
        }catch(Exception e){
            logger.error("【添加管理员】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 修改管理员
     *
     * @Author sailei
     * @Date 2018/12/24 22:44
     */
    @ResponseBody
    @RequestMapping("/edit")
    @RequiresPermissions("user:edit")
    public R edit(@Valid User user) {
        try {
            /** 校验参数 */
            String errMsg = beanValidator(user);
            if (ToolUtils.isNotEmpty(errMsg)){
                return R.error(errMsg);
            }
            userService.editUser(user);
            return R.ok();
        } catch (Exception e) {
            logger.error("【修改管理员】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 删除管理员（逻辑删除）
     *
     * @Author sailei
     * @Date 2018/12/24 22:44
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("user:delete")
    public R delete(@RequestParam String userId) {
        try {
            userService.deleteUser(userId);
            return R.ok();
        } catch (Exception e) {
            logger.error("【删除管理员】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 查看管理员详情
     *
     * @Author sailei
     * @Date 2018/12/24 22:44
     */
    @ResponseBody
    @RequestMapping("/view/{userId}")
    public User view(@PathVariable String userId) {
        try {
            userService.assertAuth(userId);
            return UserUtils.getById(userId);
        } catch (Exception e) {
            logger.error("【查看管理员详情】报错:", e);
            return null;
        }

    }

    /**
     * 重置管理员的密码
     *
     * @Author sailei
     * @Date 2018/12/24 22:44
     */
    @ResponseBody
    @RequestMapping("/reset")
    @RequiresPermissions("user:reset")
    public R reset(@RequestParam String userId) {
        try {
            userService.reset(userId);
            return R.ok();
        } catch (Exception e) {
            logger.error("【重置管理员的密码】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 冻结用户
     *
     * @Author sailei
     * @Date 2018/12/24 22:44
     */
    @ResponseBody
    @RequestMapping("/freeze")
    @RequiresPermissions("user:freeze")
    public R freeze(@RequestParam String userId) {
        try {
            userService.freeze(userId);
            return R.ok();
        } catch (Exception e) {
            logger.error("【冻结用户】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 解除冻结用户
     *
     * @Author sailei
     * @Date 2018/12/24 22:44
     */
    @ResponseBody
    @RequestMapping("/unfreeze")
    @RequiresPermissions("user:unfreeze")
    public R unfreeze(@RequestParam String userId) {
        try {
            userService.unfreeze(userId);
            return R.ok();
        } catch (Exception e) {
            logger.error("【解冻用户】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 分配角色
     *
     * @Author sailei
     * @Date 2018/12/24 22:44
     */
    @ResponseBody
    @RequestMapping("/setRole")
    @RequiresPermissions("user:setRole")
    public R setRole(@RequestParam("userId") String userId, @RequestParam("roleIds") String roleIds) {
        try {
            userService.setRole(userId, roleIds);
            return R.ok();
        } catch (Exception e) {
            logger.error("【分配角色】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 用户导出
     *
     * @Author sailei
     * @Date 2018/12/24 22:43
     */
    @ResponseBody
    @RequestMapping("/export")
    @RequiresPermissions("user:list:export")
    public void export(@RequestParam Map<String, Object> params, HttpServletResponse response) {
        try {
            userService.exportUser(params, response);
        } catch (Exception e) {
            logger.error("【用户导出】出错:", e);
        }
    }

    /**
     * 下载导入模板
     *
     * @Author sailei
     * @Date 2018/12/24 22:43
     */
    @RequiresPermissions("user:import")
    @RequestMapping(value = "import/template")
    public void importFileTemplate(HttpServletResponse response) {
        try {
            userService.importFileTemplate(response);
        } catch (Exception e) {
            logger.error("【下载导入模板】出错:", e);
        }
    }

    /**
     * 导入用户数据
     *
     * @param file
     * @return
     */
    @ResponseBody
    @RequiresPermissions("user:import")
    @RequestMapping(value = "import", method = RequestMethod.POST)
    public R importFile(MultipartFile file) {
        try {
            return userService.importFile(file);
        } catch (Exception e) {
            logger.error("【导入用户数据】出错:", e);
            return R.error(e.getMessage());
        }

    }

}
