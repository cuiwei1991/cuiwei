package com.sailei.modules.sys.service;

import com.sailei.common.base.LayuiPage;
import com.sailei.common.base.SLException;
import com.sailei.common.rebbitmq.RabbitMqUtil;
import com.sailei.common.service.R;
import com.sailei.common.utils.IdUtils;
import com.sailei.common.utils.PageUtils;
import com.sailei.common.utils.StringUtils;
import com.sailei.common.utils.ToolUtils;
import com.sailei.common.utils.excel.ExportExcel;
import com.sailei.common.utils.excel.ImportExcel;
import com.sailei.config.shiro.ShiroKit;
import com.sailei.modules.sys.entity.User;
import com.sailei.modules.sys.mapper.UserMapper;
import com.sailei.modules.sys.utils.RoleUtils;
import com.sailei.modules.sys.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 管理员表 服务实现类
 *
 * @Author sailei
 * @since 2018-12-07
 */
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private SessionService sessionService;

    /**
     * 添加用戶
     *
     * @Author sailei
     * @Date 2018/12/24 22:51
     */
    @Transactional(rollbackFor = Exception.class)
    public void addUser(User user) throws SLException {

        /** 判断账号是否重复 */
        User theUser = UserUtils.getByAccount(user.getAccount());
        if (theUser != null) {
            throw new SLException("账号不能重复!");
        }

        /** 完善账号信息 */
        String salt = ShiroKit.getRandomSalt(5);
        String password = ShiroKit.md5(user.getPassword(), salt);
        user.setCreateTime(new Date());
        user.setPassword(password);
        user.setSalt(salt);
        user.setUserId(IdUtils.getNumberId());
        userMapper.addUser(user);

        /** 记录日志 不能影响正常业务 */
        user.setSalt(null);
        user.setPassword(null);
        RabbitMqUtil.sendLogOption("添加用戶", "1", user);
    }

    /**
     * 修改用户
     *
     * @Author sailei
     * @Date 2018/12/24 22:53
     */
    @Transactional(rollbackFor = Exception.class)
    public void editUser(User user) throws SLException {
        User oldUser = this.getById(user.getUserId());
        if ("admin".equals(oldUser.getAccount())) {
            /** admin的账号不允许修改 */
            user.setAccount("admin");
        }

        /** 账号改动时 判断是否已存在该账号 */
        if (!user.getAccount().equals(oldUser.getAccount())) {
            User otherUser = userMapper.getByAccount(user.getAccount());
            if (otherUser != null && !otherUser.getUserId().equals(user.getUserId())) {
                throw new SLException("该账号已存在!");
            }
        }

        if (ShiroKit.hasRole("1")) {
            userMapper.updateById(user);

            /**清除用户缓存*/
            clearUserCache(user);

        } else {
            this.assertAuth(user.getUserId());
            User shiroUser = ShiroKit.getUserNotNull();
            if (shiroUser.getUserId().equals(user.getUserId())) {
                userMapper.updateById(user);

                /**清除用户缓存*/
                clearUserCache(user);

                /** 记录日志 不能影响正常业务 */
                user.setSalt(null);
                user.setPassword(null);
                RabbitMqUtil.sendLogOption("修改用户", "1", user);
            } else {
                throw new SLException("没有权限!");
            }
        }
    }

    /**
     * 删除用户
     *
     * @Author sailei
     * @Date 2018/12/24 22:54
     */
    @Transactional(rollbackFor = Exception.class)
    public void deleteUser(String userId) throws SLException {
        if (ToolUtils.isEmpty(userId)) {
            throw new SLException("请求参数错误!");
        }
        /** 不能删除超级管理员 */
        if (userId.equals("1")) {
            throw new SLException("不能删除超级管理员");
        }
        /** 清除缓存 */
        User user = getById(userId);

        this.assertAuth(userId);
        userMapper.deleteUser(userId);

        /** 清除缓存 */
        clearUserCache(user);

        /** 记录日志 不能影响正常业务 */
        user.setSalt(null);
        user.setPassword(null);
        RabbitMqUtil.sendLogOption("删除用户", "1", user);
    }

    /**
     * 修改用户状态
     *
     * @Author sailei
     * @Date 2018/12/24 22:45
     */
    @Transactional(rollbackFor = Exception.class)
    public void setStatus(String userId, String status) {
        /**清除缓存*/
        User user = getById(userId);
        clearUserCache(user);

        /** 记录日志 不能影响正常业务 */
        user.setStatus(Integer.valueOf(status));
        user.setSalt(null);
        user.setPassword(null);
        RabbitMqUtil.sendLogOption("修改用户状态", "1", user);

        userMapper.setStatus(userId, status);
    }

    /**
     * 修改密码
     *
     * @Author sailei
     * @Date 2018/12/24 22:45
     */
    @Transactional(rollbackFor = Exception.class)
    public void changePwd(String oldPassword, String newPassword) throws SLException {
        if (ToolUtils.isEmpty(oldPassword) || ToolUtils.isEmpty(newPassword)) {
            throw new SLException("密码不能为空!");
        }

        User userShiro = ShiroKit.getUser();
        User user = UserUtils.getByAccount(userShiro.getAccount());

        String oldMd5 = ShiroKit.md5(oldPassword, user.getSalt());

        if (user.getPassword().equals(oldMd5)) {
            String newMd5 = ShiroKit.md5(newPassword, user.getSalt());
            user.setPassword(newMd5);
            userMapper.updateById(user);

            /**清除用户缓存*/
            clearUserCache(user);

            /** 记录日志 不能影响正常业务 */
            user.setSalt(null);
            user.setPassword(null);
            RabbitMqUtil.sendLogOption("修改密码", "1", user);
        } else {
            throw new SLException("原密码不正确!");
        }
    }

    /**
     * 设置用户的角色
     *
     * @Author sailei
     * @Date 2018/12/24 22:45
     */
    @Transactional(rollbackFor = Exception.class)
    public void setRoles(String userId, String roleIds) {
        userMapper.delAllRoles(userId);
        String[] roleIdList = roleIds.split(",");
        for (String roleId : roleIdList) {
            if (ToolUtils.isNotEmpty(roleId)) {
                userMapper.addUserRole(userId, roleId);
            }
        }

        /**清除缓存*/
        User user = getById(userId);
        clearUserCache(user);
        RoleUtils.deleteAll();

        /** 记录日志 不能影响正常业务 */
        user.setSalt(null);
        user.setPassword(null);
        RabbitMqUtil.sendLogOption("设置用户的角色", "1", user);
    }

    /**
     * 通过账号获取用户
     *
     * @Author sailei
     * @Date 2018/12/24 22:46
     */
    public User getByAccount(String account) {

        /**数据库获取用户信息*/
        User user = userMapper.getByAccount(account);
        /**获取用户角色信息*/
        if (user != null && user.getUserId() != null) {
            initUserRole(user);
        }

        return user;
    }

    /**
     * 添加用户的角色信息
     *
     * @param user
     */
    private void initUserRole(User user) {
        if (user.getRoleIds() != null) {
            String[] ids = user.getRoleIds().split(",");
            /**赋值给user*/
            List<String> roleIds = new ArrayList<>();
            for (String role : ids) {
                roleIds.add(role);
            }
            user.setRoles(roleIds);

        }
    }

    /**
     * 判断当前登录的用户是否有操作这个用户的权限
     *
     * @Author sailei
     * @Date 2018/12/24 22:44
     */
    public void assertAuth(String userId) {
        if (ShiroKit.isAdmin()) {
            return;
        }
        User suser = ShiroKit.getUser();
        List<String> deptDataScope = userMapper.getDeptIds(suser.getDeptId());
        User user = this.getById(userId);
        String deptId = user.getDeptId();
        if (deptDataScope.contains(deptId)) {
            return;
        } else {
            throw new RuntimeException("没有权限!");
        }

    }

    /**
     * 根据用户ID获取用户信息
     *
     * @param userId
     * @return
     */
    public User getById(String userId) {
        /**数据库获取用户信息*/
        User user = userMapper.getByUserId(userId);
        /**获取用户角色信息*/
        if (user != null && user.getUserId() != null) {
            initUserRole(user);
        }

        return user;
    }

    /**
     * 查询用户列表
     *
     * @param params
     * @return
     */
    public LayuiPage queryPage(Map<String, Object> params) {
        /**处理分页参数*/
        PageUtils.changeForMap(params);
        /**获取分页列表*/
        List<User> list = userMapper.queryPage(params);
        /**获取总条数*/
        long count = userMapper.queryCount(params);
        /**初始化LayuiPage*/
        LayuiPage page = new LayuiPage(list, count);

        return page;
    }

    /**
     * 清除用户缓存
     *
     * @param user 要清理的用户
     */
    public void clearUserCache(User user) {
        UserUtils.deleteKey(user.getUserId());
        UserUtils.deleteKey(user.getAccount());
    }

    /**
     * 描述:修改密码
     *
     * @Author sailei
     * @Date 2019/7/18 14:49
     */
    public void changePwd(User user) {
        userMapper.changePwd(user);
    }

    /** 
     * 描述:重置密码
     *  
     * @Author sailei
     * @Date 2019/9/28 17:30
     */
    @Transactional(rollbackFor = Exception.class)
    public void reset(String userId) throws SLException {
        if (ToolUtils.isEmpty(userId)) {
            throw new SLException("请求参数错误!");
        }
        assertAuth(userId);
        User user = UserUtils.getById(userId);
        user.setSalt(ShiroKit.getRandomSalt(5));
        user.setPassword(ShiroKit.md5("111111", user.getSalt()));
        changePwd(user);

        /** 记录日志 不能影响正常业务 */
        user.setSalt(null);
        user.setPassword(null);
        RabbitMqUtil.sendLogOption("重置密码", "1", user);
    }
    
    /** 
     * 描述:冻结用户
     *  
     * @Author sailei
     * @Date 2019/9/28 17:33
     */
    @Transactional(rollbackFor = Exception.class)
    public void freeze(String userId) throws SLException {
        if (ToolUtils.isEmpty(userId)) {
            throw new SLException("请求参数错误!");
        } else {
            /** 不能冻结超级管理员 */
            if (userId.equals("admin")) {
                throw new SLException("不能冻结超级管理员!");
            }
            assertAuth(userId);
            setStatus(userId, "0");

            /** 强制下线 */
            sessionService.forceLogoutUser(userId);
        }
    }

    /**
     * 描述:解冻用户
     *
     * @Author sailei
     * @Date 2019/9/28 17:33
     */
    @Transactional(rollbackFor = Exception.class)
    public void unfreeze(String userId) throws SLException {
        if (ToolUtils.isEmpty(userId)) {
            throw new SLException("请求参数错误!");
        } else {
            assertAuth(userId);
            setStatus(userId, "1");
        }
    }

    /**
     * 描述:解冻用户
     *
     * @Author sailei
     * @Date 2019/9/28 17:33
     */
    @Transactional(rollbackFor = Exception.class)
    public void setRole(String userId, String roleIds) throws SLException {
        if (ToolUtils.isOneEmpty(userId, roleIds)) {
            throw new SLException("请求参数错误!");
        } else {
            /**不能修改超级管理员*/
            if ("1".equals(userId)) {
                throw new SLException("不能修改超级管理员角色!");
            }
            assertAuth(userId);
            setRoles(userId, roleIds);
        }
    }

    /**
     * 描述:导出Excel
     *
     * @Author sailei
     * @Date 2019/7/18 14:50
     */
    public void exportUser(Map<String, Object> params, HttpServletResponse response) throws IOException {
        /**处理分页参数*/
        PageUtils.changeForMap(params);
        /**获取分页列表*/
        List<User> list = userMapper.queryPage(params);
        String fileName = "用户列表" + StringUtils.getDateTime("yyyyMMddHHmmss") + ".xlsx";
        new ExportExcel("用户列表", User.class).setDataList(list).write(response, fileName).dispose();
    }

    /**
     * 描述:下载导入模板
     *
     * @Author sailei
     * @Date 2019/7/18 14:50
     */
    public void importFileTemplate(HttpServletResponse response) throws IOException {
        String fileName = "用户数据导入模板.xlsx";
        List<User> list = new ArrayList<>();
        list.add(UserUtils.getUser());
        new ExportExcel("用户数据", User.class, 2).setDataList(list).write(response, fileName).dispose();
    }

    /**
     * 描述:导入用户数据
     *
     * @Author sailei
     * @Date 2019/7/18 14:54
     */
    @Transactional(rollbackFor = Exception.class)
    public R importFile(MultipartFile file) throws Exception {
        int successNum = 0;
        int failureNum = 0;
        StringBuilder failureMsg = new StringBuilder();
        ImportExcel ei = new ImportExcel(file, 1, 0);
        List<User> list = ei.getDataList(User.class);
        for (User user : list) {
            try {
                User oldUser = getByAccount(user.getAccount());
                if (oldUser == null) {
                    String salt = ShiroKit.getRandomSalt(5);
                    String password = ShiroKit.md5("111111", salt);
                    user.setPassword(password);
                    user.setSalt(salt);
                    user.setUserId(IdUtils.getNumberId());
                    userMapper.addUser(user);
                    successNum++;
                } else {
                    failureMsg.append("<br/>登录名 " + user.getName() + " 已存在; ");
                    failureNum++;
                }
            } catch (ConstraintViolationException ex) {
                failureMsg.append("<br/>登录名 " + user.getName() + " 导入失败：");
            } catch (Exception ex) {
                failureMsg.append("<br/>登录名 " + user.getName() + " 导入失败：" + ex.getMessage());
            }
        }
        if (failureNum > 0) {
            failureMsg.insert(0, "失败 " + failureNum + " 条用户，导入信息如下：");
            return R.error(failureMsg.toString());
        }
        return R.ok().put("msg", successNum + "条数据导入成功!");
    }



}
