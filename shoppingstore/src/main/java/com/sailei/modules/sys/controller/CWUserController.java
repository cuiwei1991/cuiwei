package com.cuiwei.controller;


import com.cuiwei.entity.User;
import com.cuiwei.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/usercuiwei")
public class CWUserController {
    private static String PREFIX = "";
    /*@Autowired
    private UserMapper userMapper;*/

    /*@RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerForm() {

        return "/user/registerForm";
    }*/
    @GetMapping("/ll")
    public String ll() {
        return"/login.html";
    }

    /*@RequestMapping(value = "/pwd", method = RequestMethod.GET)
    public String passwordchange() {

        return "/user/passwordchange";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register( @RequestParam("loginname") String loginname,
                            @RequestParam("username")String username,
                            @RequestParam("password")String password,
                            Model model) {
        User user = userMapper.get(loginname);
        if (user!=null) {
            model.addAttribute("msg", "用户名已存在，请重新输入！");
            return "/user/registererror"; }
        else if (loginname.length() < 7 || loginname.length() > 16) {
            model.addAttribute("msg", "用户名长度不符，应高于6位低于16位！");
            return "/user/registererror";
        }else if(password.length() < 7 || password.length() > 16){
            model.addAttribute("msg", "密码长度不符，应高于6位低于16位！");
            return "/user/registererror";
        } else {
            userMapper.setuser(loginname, password, username);
        }
        *//*User user = new User();
        user.setLoginname(loginname);
        user.setUsername(username);
        user.setPassword(password);
        //存储user信息
        userList.add(user);
        //跳转页面到登录页面
        return "/user/loginForm";*//*
        return "/user/loginForm";
    }


    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam("loginname")String loginname,
                        @RequestParam("password") String password,
                        String checkcode,
                        String code,
                        Model model) {
        //数据库中用户的登录名和密码
        checkcode=checkcode.toUpperCase();
        User user=userMapper.getByLoginname(loginname,password);
        if (user!= null) {
            if(checkcode.length()<=0){
                model.addAttribute("msg", "请输入验证码!");
               }else if(!checkcode.equals(code)){
                model.addAttribute("msg", "验证码输入错误！");
            }else{
                model.addAttribute("msg", "登陆成功！");
                model.addAttribute("user",user);
            }
        } else {
            return "/user/registererror";
    }
        return "/user/welcome";
    }
//    @ResponseBody
    @RequestMapping(value = "/pwd", method = RequestMethod.POST)
   public  String pwd(String loginname, String password, String newpassword, Model model)
    {
        User user=userMapper.getByLoginname(loginname,password);
        if (user != null){
           userMapper.updatepassword(loginname,newpassword);
            model.addAttribute("msg", "修改密码成功！");
        }else{
            model.addAttribute("msg","用户名或原密码错误，请重新输入");
        }

        return "/user/welcome";


    }*/
    }








