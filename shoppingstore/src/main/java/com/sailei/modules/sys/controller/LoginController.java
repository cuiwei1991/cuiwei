package com.sailei.modules.sys.controller;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.sailei.common.base.BaseController;
import com.sailei.common.rebbitmq.RabbitMqUtil;
import com.sailei.common.redis.RedisUtil;
import com.sailei.common.service.R;
import com.sailei.common.utils.ToolUtils;
import com.sailei.config.shiro.ShiroKit;
import com.sailei.modules.sys.entity.User;
import com.sailei.modules.sys.utils.UserUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 登录控制器
 *
 * @Author sailei
 * @Date 2017年1月10日 下午8:25:24
 */
@Controller
public class LoginController extends BaseController {

    @Autowired
    private Producer producer;

    static Map<String, Integer> loginFailMap = new HashMap<>();
    /**
     * 记录日志
     */
    public static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    /**
     * 跳转到主页
     *
     * @Author sailei
     * @Date 2018/12/23 5:41 PM
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) {
        User user = UserUtils.getUser();
        model.addAttribute("photo", user.getPhoto());
        model.addAttribute("name", user.getName());
        return "/index.html";
    }

    /**
     * 跳转到登录页面
     *
     * @Author sailei
     * @Date 2018/12/23 5:41 PM
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        if (UserUtils.getUser() != null) {
            return REDIRECT + "/";
        } else {
            return "/login.html";
        }
    }

    /**
     * 点击登录执行的动作
     *
     * @Author sailei
     * @Date 2018/12/23 5:42 PM
     */
    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public R loginValidate(HttpServletRequest request) {
        R result = R.ok();

        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String remember = request.getParameter("remember");
        String code = request.getParameter("code");

        /**当登录失败超过3次时，验证验证码*/
        boolean codeFlag = isValidateCodeLogin(username, false, false);
        if (codeFlag) {
            String kaptcha = (String) ShiroKit.getSession().getAttribute("KAPTCHA_SESSION_KEY");
            if (ToolUtils.isEmpty(kaptcha)) {
                result = result.error(501, "验证码已失效");
                result.put("isValidateCodeLogin", isValidateCodeLogin(username, true, false));
                return result;
            }

            if (ToolUtils.isEmpty(code) || !code.equalsIgnoreCase(kaptcha)) {
                ShiroKit.getSession().removeAttribute("KAPTCHA_SESSION_KEY");
                result = result.error(502, "验证码不正确");
                result.put("isValidateCodeLogin", isValidateCodeLogin(username, true, false));
                return result;
            }
        }
        Subject currentUser = ShiroKit.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password.toCharArray());

        /** 如果开启了记住我功能 */
        if ("on".equals(remember)) {
            token.setRememberMe(true);
        } else {
            token.setRememberMe(false);
        }

        try {
            /**执行shiro登录操作*/
            currentUser.login(token);

            ShiroKit.getSession().setAttribute("sessionFlag", true);

            /**登录成功，验证码清除*/
            isValidateCodeLogin(username, false, true);
            logger.info("【用户登录】登录账号：" + username);

            /** 记录日志 不能影响正常业务 */
            RabbitMqUtil.sendLogLogin("登录日志","", getIpAddr(request));
        } catch (Exception e) {
            result = R.error(e.getMessage());
            result.put("isValidateCodeLogin", isValidateCodeLogin(username, true, false));
        }

        return result;
    }

    /**
     * 退出登录
     *
     * @Author sailei
     * @Date 2018/12/23 5:42 PM
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logOut(HttpServletRequest request, HttpServletResponse response) {
        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogLogin("退出登录","", getIpAddr(request));

        ShiroKit.getSubject().logout();
        deleteAllCookie(request, response);

        return REDIRECT + "/login";
    }

    /**
     * 描述:删除所有Cookie
     *
     * @Author sailei
     * @Date 2019/7/16 11:39
     */
    protected void deleteAllCookie(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        Cookie[] var2 = cookies;
        int var3 = cookies.length;

        for (int var4 = 0; var4 < var3; ++var4) {
            Cookie cookie = var2[var4];
            Cookie temp = new Cookie(cookie.getName(), "");
            temp.setMaxAge(0);
            response.addCookie(temp);
        }

    }

    /**
     * 是否是验证码登录
     *
     * @param useruame 用户名
     * @param isFail   计数加1
     * @param clean    计数清零
     * @return true 添加验证码 false不需要验证码
     */
    public static boolean isValidateCodeLogin(String useruame, boolean isFail, boolean clean) {
        Integer loginFailNum = loginFailMap.get(useruame);
        if (loginFailNum == null) {
            loginFailNum = 0;
        }
        if (isFail) {
            loginFailNum++;
            loginFailMap.put(useruame, loginFailNum);
        }
        if (clean) {
            loginFailMap.remove(useruame);
        }
        return loginFailNum >= 3;
    }

    /**
     * 生成图片验证码
     *
     * @param
     * @return
     */
    @RequestMapping("/kaptcha")
    public void captcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setHeader("Cache-Control", "no-store, no-cache");
        response.setContentType("image/jpeg");
        /** 生成文字验证码 */
        String text = producer.createText();
        /** 生成图片验证码 */
        BufferedImage image = producer.createImage(text);

        /** 保存到session */
        request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, text);

        ServletOutputStream out = response.getOutputStream();
        ImageIO.write(image, "jpg", out);
    }

}
