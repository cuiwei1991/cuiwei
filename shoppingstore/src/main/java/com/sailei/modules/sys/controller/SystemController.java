package com.sailei.modules.sys.controller;

import com.sailei.common.base.SLException;
import com.sailei.common.utils.MultipartFileUtil;
import com.sailei.config.shiro.ShiroKit;
import com.sailei.common.service.R;
import com.sailei.modules.sys.entity.Menu;
import com.sailei.modules.sys.entity.User;
import com.sailei.modules.sys.service.MenuService;
import com.sailei.modules.sys.service.UserService;
import com.sailei.common.base.BaseController;
import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.sys.utils.MenuUtils;
import com.sailei.modules.sys.utils.UserUtils;
import com.xiaoleilu.hutool.util.BeanUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 通用控制器
 *
 * @Author sailei
 * @Date 2017年2月17日20:27:22
 */
@Controller
@RequestMapping("/system")
@Slf4j
public class SystemController extends BaseController {

    @Autowired
    private UserService userService;
    @Autowired
    private MenuService menuService;

    /**
     * 控制台页面
     *
     * @Author sailei
     * @Date 2018/12/24 22:43
     */
    @RequestMapping("/console")
    public String console() {
        return "/modules/frame/console.html";
    }

    /**
     * 主题页面
     *
     * @Author sailei
     * @Date 2019/1/24 3:38 PM
     */
    @RequestMapping("/theme")
    public String theme() {
        return "/modules/frame/theme.html";
    }

    /**
     * 跳转到修改密码界面
     *
     * @Author sailei
     * @Date 2018/12/24 22:43
     */
    @RequestMapping("/user_chpwd")
    public String chPwd() {
        return "/modules/frame/password.html";
    }

    /**
     * 跳转到查看用户详情页面
     *
     * @Author sailei
     * @Date 2018/12/24 22:43
     */
    @RequestMapping("/user_info")
    public String userInfo(Model model) {
        String userId = ShiroKit.getUserNotNull().getUserId();
        User user = UserUtils.getById(userId);
        model.addAllAttributes(BeanUtil.beanToMap(user));
        return "/modules/frame/user_info.html";
    }

    /**
     * 描述:跳转到设置快捷方式详情页面
     *
     * @Author sailei
     * @Date 2019/8/13 15:33
     */
    @RequestMapping("/menu_list")
    public String menuList(String iconId, Model model) {
        model.addAttribute("iconId", iconId);
        return "/modules/frame/menu_list.html";
    }

    /**
     * 通用的树列表选择器
     *
     * @Author sailei
     * @Date 2018/12/23 6:59 PM
     */
    @RequestMapping("/commonTree")
    public String deptTreeList(@RequestParam("formName") String formName,
                               @RequestParam("formId") String formId,
                               @RequestParam("treeUrl") String treeUrl, Model model) {

        if (ToolUtils.isOneEmpty(formName, formId, treeUrl)) {
            throw new RuntimeException("请求数据不完整！");
        }

        try {
            model.addAttribute("formName", URLDecoder.decode(formName, "UTF-8"));
            model.addAttribute("formId", URLDecoder.decode(formId, "UTF-8"));
            model.addAttribute("treeUrl", URLDecoder.decode(treeUrl, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("请求数据不完整！");
        }

        return "/common/tree_dlg.html";
    }

    /**
     * 通用的导入页面
     *
     * @Author sailei
     * @Date 2018/12/23 6:59 PM
     */
    @RequestMapping("/commonImport")
    public String commonImport(@RequestParam("tempUrl") String tempUrl, @RequestParam("formUrl") String formUrl, Model model) {

        if (ToolUtils.isOneEmpty(tempUrl, formUrl)) {
            throw new RuntimeException("请求数据不完整！");
        }

        try {
            model.addAttribute("tempUrl", URLDecoder.decode(tempUrl, "UTF-8"));
            model.addAttribute("formUrl", URLDecoder.decode(formUrl, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("请求数据不完整！");
        }

        return "/common/import.html";
    }

    /**
     * 上传头像
     *
     * @Author sailei
     * @Date 2018/11/9 12:45 PM
     */
    @ResponseBody
    @RequestMapping("/uploadPhoto")
    public R uploadPhoto(MultipartFile file, String path) {
        R result = R.ok();
        if(file != null){
            String address = MultipartFileUtil.uploadMultipartFileLocal(file, path);
            if(address != null){
                /**替换用户头像*/
                User user = ShiroKit.getUser();
                user.setPhoto(address);
                try {
                    userService.editUser(user);
                } catch (SLException e) {
                    return R.error(e.getMessage());
                }

                /**清除用户缓存*/
                userService.clearUserCache(user);
                result.put("address",address);
            }
        }
        return result;
    }

    /**
     * 获取当前用户详情
     *
     * @Author sailei
     * @Date 2018/12/23 6:59 PM
     */
    @ResponseBody
    @RequestMapping("/currentUserInfo")
    public R getUserInfo() {

        User currentUser = ShiroKit.getUser();
        if (currentUser == null) {
            throw new RuntimeException("用户为空!");
        }

        User user = UserUtils.getById(currentUser.getUserId());
        user.setPassword("");
        user.setSalt("");
        return R.ok().put("data", user);
    }

    /**
     * layui上传组件 通用文件上传接口
     *
     * @Author sailei
     * @Date 2019-2-23 10:48:29
     */
    @ResponseBody
    @RequestMapping(method = RequestMethod.POST, path = "/upload")
    public R layuiUpload(@RequestPart("file") MultipartFile file, String path) {
        if(file.getSize() > 2048){
            return R.error("文件过大,请不要超过2M");
        }
        String address = MultipartFileUtil.uploadMultipartFileLocal(file, path);
        /**
         * 适应layui上传组件
         */
        Map<String,String> map = new HashMap<>();
        map.put("src", address);
        map.put("title", "图片");

        if(address != null){
            return R.ok().put("msg", "上传成功").put("data", map);
        }else{
            return R.error().put("msg", "上传失败");
        }
    }

    /**
     * 首页快捷方式
     *
     * @Author sailei
     * @Date 2019-2-23 10:48:29
     */
    @ResponseBody
    @RequestMapping(method = RequestMethod.POST, path = "/lnk")
    public R ink() {
        return R.ok().put("data", MenuUtils.getInkList());
    }

    /**
     * 设置快捷方式
     *
     * @Author sailei
     * @Date 2019-2-23 10:48:29
     */
    @ResponseBody
    @RequestMapping(method = RequestMethod.POST, path = "/setLnk")
    public R setLnk(String menuId, String id) {
        Menu menu = menuService.getById(menuId);
        if(menu == null){
            return R.error("参数错误，设置失败!");
        }
        menu.setMenuId(id);
        MenuUtils.setUserMenuLnk(menu);
        return R.ok();
    }


}
