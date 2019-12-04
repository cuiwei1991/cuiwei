package com.sailei.modules.gen.controller;

import com.sailei.common.base.BaseController;
import com.sailei.common.service.R;
import com.sailei.common.base.LayuiPage;
import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.gen.entity.GenScheme;
import com.sailei.modules.gen.entity.GenTable;
import com.sailei.modules.gen.entity.GenTableColumn;
import com.sailei.modules.gen.mapper.GenTableColumnMapper;
import com.sailei.modules.gen.service.GenSchemeService;
import com.sailei.modules.gen.service.GenTableService;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 描述:代码生成控制中心
 *
 * @Author sailei
 * @Date 2019/7/4 18:22
 */
@Controller
@RequestMapping("/gen")
public class GenTableController extends BaseController {

    private static String PREFIX = "/modules/gen";

    @Autowired
    private GenTableService genTableService;
    @Autowired
    private GenSchemeService genSchemeService;
    @Autowired
    private GenTableColumnMapper genTableColumnMapper;

    private static Logger logger = LoggerFactory.getLogger(GenTableController.class);

    /**
     * 配置列表页
     *
     * @Author lss
     * @Date 2019/05/06 12:00
     */
    @RequestMapping("/index")
    public String index() {
        return PREFIX + "/genTableList.html";
    }

    /**
     * 获取配置列表
     *
     * @Author lss
     * @Date 2019/05/06 12:00
     */
    @ResponseBody
    @RequestMapping(value = "/list")
    @RequiresPermissions("gen:list")
    public LayuiPage list(@RequestParam Map<String, Object> params) {
        LayuiPage page = genTableService.queryPage(params);
        return page;
    }

    /**
     * 获取数据库列表
     *
     * @Author lss
     * @Date 2019/05/06 12:00
     */
    @ResponseBody
    @RequestMapping(value = "/getTablelist")
    @RequiresPermissions("gen:import")
    public R getTablelist() {
        List<GenTable> tableList = genTableService.findList();
        return R.ok().put("data", tableList);
    }

    /**
     * 描述:获取代码生成详情
     *
     * @Author sailei
     * @Date 2019/7/4 18:15
     */
    @ResponseBody
    @RequestMapping(value = "/genCodeForm")
    public R genCodeForm(@RequestParam String id) {
        try {
            return genSchemeService.genCodeForm(id);
        } catch (Exception e) {
            return R.error(e.getMessage());
        }
    }

    /**
     * 描述:代码生成
     *
     * @Author sailei
     * @Date 2019/7/4 18:17
     */
    @ResponseBody
    @RequestMapping("/genCode")
    @RequiresPermissions("gen:genCode")
    public R genCode(GenScheme genScheme) {
        try {
            return genSchemeService.genCode(genScheme);
        } catch (Exception e) {
            return R.error(e.getMessage());
        }
    }

    /**
     * 描述:添加或修改 修改时地址后加?id=
     *
     * @Author sailei
     * @Date 2019/7/6 13:18
     */
    @RequestMapping("/gen_form")
    public String add() {
        return PREFIX + "/gen_form.html";
    }

    /**
     * 代码生成页面
     *
     * @Author lss
     * @Date 2019/05/06 12:00
     */
    @RequestMapping("/gen_code")
    public String code() {
        return PREFIX + "/gen_code.html";
    }

    /**
     * 描述:创建菜单
     *
     * @Author sailei
     * @Date 2019/7/11 15:42
     */
    @RequestMapping("/createMenu")
    public String createMenu() {
        return PREFIX + "/createMenu.html";
    }
    /**
     * 描述:数据库导入
     *
     * @Author sailei
     * @Date 2019/7/11 15:42
     */
    @RequestMapping("/importTable")
    @RequiresPermissions("gen:import")
    public String importTable() {
        return PREFIX + "/importTable.html";
    }

    /**
     * 描述:保存代码生成表
     *
     * @Author sailei
     * @Date 2019/7/6 13:17
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions(value = { "gen:add", "gen:edit" }, logical = Logical.OR)
    public R saveGenTable(GenTable genTable) {
        try {
            genTableService.saveGenTable(genTable);
        } catch (Exception e) {
            logger.error("【保存代码生成表】报错:" + e.getMessage());
            return R.error(e.getMessage());
        }
        return R.ok("保存成功");
    }

    /**
     * 描述:同步数据库
     *
     * @Author sailei
     * @Date 2019/7/4 11:42
     */
    @ResponseBody
    @RequestMapping("/synchDb")
    @RequiresPermissions("gen:synchDb")
    public R synchDb(GenTable genTable) {
        try {
            genTableService.synchDb(genTable);
        } catch (Exception e) {
            logger.error("【同步数据库】报错:" + e.getMessage());
            return R.error("同步数据库失败：" + e.getMessage());
        }
        return R.ok();
    }

    /**
     * 描述:获取代码生成表详情
     *
     * @Author sailei
     * @Date 2019/7/11 9:20
     */
    @ResponseBody
    @RequestMapping("/gen_edit")
    public R genEdit(GenScheme genScheme) {
        R r = R.ok();
        try {
            GenTable genTable = genTableService.getById(genScheme.getGenTableId());
            List<GenTableColumn> genTableColumnList = genTableColumnMapper.getByGenTableId(genTable.getId());
            r.put("gen", genTable);
            r.put("genColumn", genTableColumnList);
        } catch (Exception e) {
            logger.error("【获取代码生成表详情】报错:" + e.getMessage());
            return R.error("获取失败：" + e.getMessage());
        }
        return r;
    }

    /**
     * 描述:彻底删除表
     *
     * @Author sailei
     * @Date 2019/7/4 9:27
     */
    @ResponseBody
    @RequestMapping("/gen_delete")
    @RequiresPermissions("gen:delete")
    public R genDel(String id) {
        try {
            genTableService.delete(id);
        } catch (Exception e) {
            logger.error("【彻底删除表】报错:" + e.getMessage());
            return R.error("删除失败：" + e.getMessage());
        }
        return R.ok();
    }

    /**
     * 描述:移除表
     *
     * @Author sailei
     * @Date 2019/7/4 9:25
     */
    @ResponseBody
    @RequestMapping("/gen_remove")
    @RequiresPermissions("gen:remove")
    public R genRemove(String id) {
        try {
            genTableService.genRemove(id);
        } catch (Exception e) {
            logger.error("【移除表】报错:" + e.getMessage());
            return R.error("移除失败：" + e.getMessage());
        }
        return R.ok();
    }

    /**
     * 描述:创建菜单保存
     *
     * @Author sailei
     * @Date 2019/7/4 9:25
     */
    @ResponseBody
    @RequestMapping("/createMenuSave")
    @RequiresPermissions("gen:createMenu")
    public R createMenuSave(@RequestParam Map<String, Object> params) {
        try {
            String genTableId = params.get("genTableId") != null ? params.get("genTableId").toString() : null;
            String parentId = params.get("parentId") != null ? params.get("parentId").toString() : null;
            String name = params.get("name") != null ? params.get("name").toString() : null;
            String icon = params.get("icon") != null ? params.get("icon").toString() : null;
            if(ToolUtils.isEmpty(genTableId) || ToolUtils.isEmpty(parentId) ||
                    ToolUtils.isEmpty(name) || ToolUtils.isEmpty(icon)){
                return R.error("请选择上级菜单并输入名称!");
            }
            return genSchemeService.createMenuSave(genTableId, parentId, name, icon);
        } catch (Exception e) {
            logger.error("【创建菜单】报错:" + e.getMessage());
            return R.error("创建菜单报错:" + e.getMessage());
        }
    }

    /**
     * 描述:获取可导入的表
     *
     * @Author sailei
     * @Date 2019/7/4 9:25
     */
    @ResponseBody
    @RequestMapping("/getImportTables")
    @RequiresPermissions("gen:import")
    public R getImportTables() {
        try {
            return genTableService.getImportTables();
        } catch (Exception e) {
            logger.error("【获取可导入的表】报错:" + e.getMessage());
            return R.error("获取报错:" + e.getMessage());
        }
    }

    /**
     * 描述:导入表
     *
     * @Author sailei
     * @Date 2019/7/4 9:25
     */
    @ResponseBody
    @RequestMapping("/importTableSave")
    @RequiresPermissions("gen:import")
    public R importTableSave(String tableName) {
        try {
            return genTableService.importTableSave(tableName);
        } catch (Exception e) {
            logger.error("【导入表】报错:" + e.getMessage());
            return R.error("导入表报错:" + e.getMessage());
        }
    }

    /**
     * 描述:获取系统目录
     *
     * @Author sailei
     * @Date 2019/7/4 9:25
     */
    @ResponseBody
    @RequestMapping(value = "/path", produces = "application/json;charset=UTF-8")
    public List<Map<String,Object>> genRootpath(String id) {
        List<Map<String,Object>> dirs = new ArrayList<>();

        File[] root = File.listRoots();
        if(ToolUtils.isNotEmpty(id)){
            File file = new File(id);
            if(!file.isDirectory()){
                return dirs;
            }
            root = file.listFiles();
        }
        for(File file : root){
            Map<String,Object> map = new HashMap<>();
            String dir = file.getAbsolutePath();
            if(ToolUtils.isNotEmpty(id) && (file.isHidden() || !file.isDirectory())){
                continue;
            }
            String paths = file.getPath();
            map.put("id", dir);
            map.put("children", true);
            map.put("text", paths);
            dirs.add(map);
        }

        return dirs;
    }

}


