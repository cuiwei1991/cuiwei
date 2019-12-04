package com.sailei.modules.sys.controller;

import com.sailei.common.base.BaseController;
import com.sailei.common.base.LayuiPage;
import com.sailei.common.base.ZTreeNode;
import com.sailei.common.service.R;
import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.sys.entity.Dept;
import com.sailei.modules.sys.service.DeptService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 部门控制器
 *
 * @Author sailei
 * @Date 2017年2月17日20:27:22
 */
@Controller
@RequestMapping("/dept")
public class DeptController extends BaseController {

    private String PREFIX = "/modules/sys/dept/";

    @Autowired
    private DeptService deptService;
    /**
     * 记录日志
     */
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 跳转到部门管理首页
     *
     * @Author sailei
     * @Date 2018/12/23 4:56 PM
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "dept.html";
    }

    /**
     * 跳转到添加部门
     *
     * @Author sailei
     * @Date 2018/12/23 4:56 PM
     */
    @RequestMapping("/dept_add")
    public String deptAdd() {
        return PREFIX + "dept_add.html";
    }

    /**
     * 跳转到修改部门
     *
     * @Author sailei
     * @Date 2018/12/23 4:56 PM
     */
    @RequiresPermissions("dept:dept_update")
    @RequestMapping("/dept_update")
    public String deptUpdate() {
        return PREFIX + "dept_edit.html";
    }

    /**
     * 获取部门的tree列表，ztree格式
     *
     * @Author sailei
     * @Date 2018/12/23 4:56 PM
     */
    @ResponseBody
    @RequestMapping(value = "/tree")
    public List<ZTreeNode> tree() {
        List<ZTreeNode> tree = this.deptService.tree();
        tree.add(ZTreeNode.createParent());
        return tree;
    }

    /**
     * 新增部门
     *
     * @Author sailei
     * @Date 2018/12/23 4:57 PM
     */
    @ResponseBody
    @RequestMapping(value = "/add")
    @RequiresPermissions("dept:add")
    public R add(Dept dept) {
        try{
            /** 校验参数 */
            String errMsg = beanValidator(dept);
            if (ToolUtils.isNotEmpty(errMsg)){
                return R.error(errMsg);
            }
            deptService.addDept(dept);
            return R.ok();
        }catch(Exception e){
            logger.error("【新增部门】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 部门详情
     *
     * @Author sailei
     * @Date 2018/12/23 4:57 PM
     */
    @ResponseBody
    @RequestMapping(value = "/detail/{deptId}")
    @RequiresPermissions("dept:detail")
    public R detail(@PathVariable("deptId") String deptId) {
        R result = R.ok();
        Dept dept = deptService.getById(deptId);
        result.put("data", dept);
        return result;
    }

    /**
     * 修改部门
     *
     * @Author sailei
     * @Date 2018/12/23 4:57 PM
     */
    @ResponseBody
    @RequestMapping(value = "/update")
    @RequiresPermissions("dept:update")
    public R update(Dept dept) {
        try{
            /** 校验参数 */
            String errMsg = beanValidator(dept);
            if (ToolUtils.isNotEmpty(errMsg)){
                return R.error(errMsg);
            }
            deptService.editDept(dept);
            return R.ok();
        }catch(Exception e){
            logger.error("【修改部门】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 删除部门
     *
     * @Author sailei
     * @Date 2018/12/23 4:57 PM
     */
    @ResponseBody
    @RequestMapping(value = "/delete")
    @RequiresPermissions("dept:delete")
    public R delete(@RequestParam String deptId) {
        try{
            deptService.deleteDept(deptId);
            return R.ok();
        }catch(Exception e){
            logger.error("【删除部门】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 获取菜单列表（s树形）
     *
     * @Author sailei
     * @Date 2019年2月23日22:01:47
     */
    @ResponseBody
    @RequiresPermissions("dept:list")
    @RequestMapping(value = "/listTree")
    public Object listTree(@RequestParam(required = false) String deptName,
                           @RequestParam(required = false) String level) {
        List<Dept> depts = this.deptService.selectDeptTree(deptName, level);

        LayuiPage result = new LayuiPage(depts, depts.size());
        return result;
    }

}
