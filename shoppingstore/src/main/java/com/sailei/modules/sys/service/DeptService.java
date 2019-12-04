package com.sailei.modules.sys.service;

import com.sailei.common.base.SLException;
import com.sailei.common.base.TreeviewNode;
import com.sailei.common.base.ZTreeNode;
import com.sailei.common.rebbitmq.RabbitMqUtil;
import com.sailei.common.utils.IdUtils;
import com.sailei.common.utils.ToolUtils;
import com.sailei.config.shiro.ShiroKit;
import com.sailei.modules.sys.entity.Dept;
import com.sailei.modules.sys.entity.User;
import com.sailei.modules.sys.mapper.DeptMapper;
import com.xiaoleilu.hutool.util.RandomUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

/**
 * 部门表 服务实现类
 *
 * @Author sailei
 * @since 2018-12-07
 */
@Service
public class DeptService {

    @Resource
    private DeptMapper deptMapper;

    /**
     * 新增部门
     *
     * @Author sailei
     * @Date 2018/12/23 5:00 PM
     */
    @Transactional(rollbackFor = Exception.class)
    public void addDept(Dept dept) throws SLException {
        /** 完善pids,根据pid拿到pid的pids */
        deptSetPids(dept);
        User user = ShiroKit.getUser();
        dept.setDeptId(IdUtils.getNumberId());
        dept.setCreateTime(new Date());
        dept.setUpdateTime(new Date());
        dept.setCreateUser(user.getUserId());
        dept.setUpdateUser(user.getUserId());
        dept.setVersion(1);
        if(dept.getSort() == null){
            dept.setSort(0);
        }
        deptMapper.saveDept(dept);

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("新增部门", "1", dept);
    }

    /**
     * 修改部门
     *
     * @Author sailei
     * @Date 2018/12/23 5:00 PM
     */
    @Transactional(rollbackFor = Exception.class)
    public void editDept(Dept dept) throws SLException {
        /** 完善pids,根据pid拿到pid的pids */
        deptSetPids(dept);
        User user = ShiroKit.getUser();
        dept.setCreateTime(new Date());
        dept.setUpdateTime(new Date());
        dept.setCreateUser(user.getUserId());
        dept.setUpdateUser(user.getUserId());
        dept.setVersion(RandomUtil.randomInt(10));
        deptMapper.updateById(dept);

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("修改部门", "1", dept);
    }

    /**
     * 删除部门
     *
     * @Author sailei
     * @Date 2018/12/23 5:16 PM
     */
    @Transactional(rollbackFor = Exception.class)
    public void deleteDept(String deptId) {
        Dept dept = deptMapper.getById(deptId);
        deptMapper.removeById(deptId);

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("删除部门", "1", dept);
    }

    /**
     * 获取ztree的节点列表
     *
     * @Author sailei
     * @Date 2018/12/23 5:16 PM
     */
    public List<ZTreeNode> tree() {
        return deptMapper.tree();
    }

    /**
     * 获取ztree的节点列表
     *
     * @Author sailei
     * @Date 2018/12/23 5:16 PM
     */
    public List<TreeviewNode> treeviewNodes() {
        return deptMapper.treeviewNodes();
    }

    /**
     * 设置部门的父级ids
     *
     * @Author sailei
     * @Date 2018/12/23 4:58 PM
     */
    private void deptSetPids(Dept dept) {
        if (ToolUtils.isEmpty(dept.getParentId()) || "0".equals(dept.getParentId())) {
            dept.setParentId("0");
            dept.setParentIds("0,");
        } else {
            String pid = dept.getParentId();
            Dept temp = deptMapper.getById(pid);
            String pids = temp.getParentIds();
            dept.setParentName(temp.getName());
            dept.setParentId(pid);
            dept.setParentIds(pids + pid + ",");
        }
    }

    public Dept getById(String deptId) {
        return deptMapper.getById(deptId);
    }

    /**
     * 获取菜单树形列表
     *
     * @Author sailei
     * @Date 2019/2/23 22:02
     */
    public List<Dept> selectDeptTree(String name, String level) {
        Map<String, Object> params = new HashMap<>(2);
        params.put("name", name);
        params.put("level", level);
        List<Dept> maps = deptMapper.queryPage(params);

        if (maps == null) {
            maps = new ArrayList<>();
        }

        //创建根节点
        Dept dept = new Dept();
        dept.setName("根节点");
        dept.setDeptId("0");
        dept.setParentId("-2");

        maps.add(dept);

        return maps;
    }
}
