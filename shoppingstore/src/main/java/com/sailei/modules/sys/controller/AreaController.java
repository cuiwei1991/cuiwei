package com.sailei.modules.sys.controller;

import com.sailei.common.base.BaseController;
import com.sailei.common.base.LayuiPage;
import com.sailei.common.base.ZTreeNode;
import com.sailei.common.service.R;
import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.sys.entity.Area;
import com.sailei.modules.sys.service.AreaService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/** 
 * 描述:地区控制器
 *  
 * @Author sailei
 * @Date 2019/7/21 11:00
 */
@Controller
@RequestMapping("/area")
public class AreaController  extends BaseController {
    private String PREFIX = "/modules/sys/area/";

    @Autowired
    private AreaService areaService;
    /**
     * 记录日志
     */
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 地区列表页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "area.html";
    }

    /**
     * 跳转到添加地区
     *
     * @Author sailei
     * @Date 2018/12/23 4:56 PM
     */
    @RequestMapping("/area_add")
    public String areaAdd(String areaId, Model model) {
        if(ToolUtils.isNotEmpty(areaId)){
            Area area = areaService.getAreaById(areaId);
            model.addAttribute("area", area);
        }
        return PREFIX + "area_add.html";
    }

    /**
     * 跳转到修改地区
     *
     * @Author sailei
     * @Date 2018/12/23 4:56 PM
     */
    @RequiresPermissions("area:area_update")
    @RequestMapping("/area_update")
    public String areaUpdate() {
        return PREFIX + "area_edit.html";
    }

    /**
     * 获取地区的tree列表，ztree格式
     *
     * @Author sailei
     * @Date 2018/12/23 4:56 PM
     */
    @ResponseBody
    @RequestMapping(value = "/tree")
    public List<ZTreeNode> tree() {
        List<ZTreeNode> tree = areaService.tree();
        tree.add(ZTreeNode.createParent());
        return tree;
    }


    /**
     * 获取菜单列表（s树形）
     *
     * @Author sailei
     * @Date 2019年2月23日22:01:47
     */
    @ResponseBody
    @RequiresPermissions("area:list")
    @RequestMapping(value = "/listTree")
    public Object listTree() {
        List<Area> areas = areaService.selectAreaTree();
        LayuiPage result = new LayuiPage(areas, areas.size());
        return result;
    }

    /**
     * 查看详情
     *
     * @Author sailei
     * @Date 2018/12/23 4:57 PM
     */
    @ResponseBody
    @RequestMapping(value = "/detail/{areaId}")
    @RequiresPermissions("area:area_update")
    public R detail(@PathVariable("areaId")String areaId) {
        if (ToolUtils.isEmpty(areaId)) {
            return R.error("参数错误");
        }

        /** 缓存地区修改前详细信息 */
        Area area = areaService.getAreaById(areaId);
        return R.ok().put("data", area);
    }
    /**
     * 新增地区
     *
     * @Author sailei
     * @Date 2018/12/23 4:57 PM
     */
    @ResponseBody
    @RequestMapping(value = "/add")
    @RequiresPermissions("area:add")
    public R add(Area area) {
        try{
            /** 校验参数 */
            String errMsg = beanValidator(area);
            if (ToolUtils.isNotEmpty(errMsg)){
                return R.error(errMsg);
            }
            areaService.addArea(area);
            return R.ok();
        }catch(Exception e){
            logger.error("【新增地区】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 修改地区
     *
     * @Author sailei
     * @Date 2018/12/23 4:57 PM
     */
    @ResponseBody
    @RequestMapping(value = "/update")
    @RequiresPermissions("area:update")
    public R update(Area area) {
        try{
            /** 校验参数 */
            String errMsg = beanValidator(area);
            if (ToolUtils.isNotEmpty(errMsg)){
                return R.error(errMsg);
            }
            areaService.updateById(area);
            return R.ok();
        }catch(Exception e){
            logger.error("【修改地区】报错:", e);
            return R.error(e.getMessage());
        }
    }

    /**
     * 删除地区
     *
     * @Author sailei
     * @Date 2018/12/23 4:57 PM
     */
    @ResponseBody
    @RequestMapping(value = "/delete")
    @RequiresPermissions("area:delete")
    public R delete(@RequestParam String id) {
        try{
            areaService.deleteArea(id);
            return R.ok();
        }catch(Exception e){
            logger.error("【删除地区】报错:", e);
            return R.error(e.getMessage());
        }
    }

}
