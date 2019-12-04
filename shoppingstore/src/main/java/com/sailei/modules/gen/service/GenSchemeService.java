package com.sailei.modules.gen.service;

import com.sailei.common.rebbitmq.RabbitMqUtil;
import com.sailei.common.service.R;
import com.sailei.common.utils.IdUtils;
import com.sailei.common.utils.StringUtils;
import com.sailei.common.utils.ToolUtils;
import com.sailei.modules.gen.entity.*;
import com.sailei.modules.gen.mapper.GenSchemeMapper;
import com.sailei.modules.gen.mapper.GenTableColumnMapper;
import com.sailei.modules.gen.mapper.GenTableMapper;
import com.sailei.modules.gen.utils.GenUtils;
import com.sailei.modules.sys.entity.Menu;
import com.sailei.modules.sys.entity.User;
import com.sailei.modules.sys.mapper.MenuMapper;
import com.sailei.modules.sys.utils.MenuUtils;
import com.sailei.modules.sys.utils.UserUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.math.BigDecimal;
import java.util.*;

/** 
 * 描述:代码生成服务类
 *  
 * @Author sailei
 * @Date 2019/7/21 10:11
 */
@Service
public class GenSchemeService {
    
    /**
     * 记录日志
     */
    private Logger logger = LoggerFactory.getLogger(GenSchemeService.class);
    @Autowired
    private GenSchemeMapper genSchemeMapper;
    @Autowired
    private GenTableMapper genTableMapper;
    @Autowired
    private GenTableColumnMapper genTableColumnMapper;
    @Autowired
    private MenuMapper menuMapper;

    /**
     * 描述:获取代码生成记录历史
     *
     * @Author sailei
     * @Date 2019/7/8 15:48
     */
    public R genCodeForm(String id) {
        GenScheme genScheme = genSchemeMapper.getByGenTableId(id);
        if (genScheme == null) {
            genScheme = new GenScheme();
            /**
             * 设置默认参数 生成路径以及包名及作者
             */
            genScheme.setProjectPath(System.getProperty("user.dir"));
            File file = new File(this.getClass().getResource("").getPath());
            String path = file.toString();
            if(path.indexOf("\\com\\") != -1 && path.indexOf("\\gen\\") != -1){
                path = path.substring(path.indexOf("\\com\\") + 1, path.indexOf("\\gen\\"));
                path = path.replaceAll("\\\\",".");
                genScheme.setPackageName(path);
            }else{
                genScheme.setPackageName("com.sailei.modules");
            }

            Map<String, String> map = System.getenv();
            String userName = map.get("USERNAME");
            if(ToolUtils.isNotEmpty(userName)){
                genScheme.setFunctionAuthor(userName);
            }
        }

        return R.ok().put("genScheme", genScheme);
    }

    /** 
     * 描述:代码生成功能
     *  
     * @Author sailei
     * @Date 2019/7/9 11:05
     */
    public R genCode(GenScheme genScheme) {
        GenTable genTable = genTableMapper.getById(genScheme.getGenTableId());
        genScheme.setGenTable(genTable);

        /**
         * 获取当前登录用户
         */
        User user = UserUtils.getUser();
        
        /**
         * 判断代码生成模式与表类型是否匹配
         */
        if("0".equals(genTable.getTableType()) && !"curd".equals(genScheme.getCategory())){
            return R.error("单表只能选择单表模式!");
        }else if("1".equals(genTable.getTableType()) && !"curd_many".equals(genScheme.getCategory())){
            return R.error("主表只能选择主附表模式!");
        }else if("3".equals(genTable.getTableType()) && !"tree".equals(genScheme.getCategory())){
            return R.error("树表只能选择树结构模式!");
        }else if("4".equals(genTable.getTableType()) && !"left_tree".equals(genScheme.getCategory())){
            return R.error("左树只能选择左树右表模式!");
        }else if("2".equals(genTable.getTableType()) || "5".equals(genTable.getTableType())){
            return R.error("附表/右表不能代码生成，请选择主表/左树!");
        }
        
        /**
         * 判断主键策略
         */
        if(ToolUtils.isEmpty(genTable.getGenIdType())){
            return R.error("表主键策略为空，无法生成代码!");
        }

        /**
         * 保存代码生成操作记录
         */
        if (ToolUtils.isEmpty(genScheme.getId())) {
            if (user != null) {
                genScheme.setCreateBy(user.getName());
                genScheme.setUpdateBy(user.getName());
            }
            genScheme.setUpdateDate(new Date());
            genScheme.setCreateDate(genScheme.getUpdateDate());
            genScheme.setId(IdUtils.uuid());
            genSchemeMapper.insert(genScheme);
        } else {
            genScheme.setUpdateBy(user.getName());
            genScheme.setUpdateDate(new Date());
            genSchemeMapper.update(genScheme);
        }

        /**
         * 代码生成文件
         */
        try {
            String result = generateCode(genScheme);
            return R.ok().put("msg", result);
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    }
    
    /** 
     * 描述:代码生成文件
     *  
     * @Author sailei
     * @Date 2019/7/9 11:09
     */
    private String generateCode(GenScheme genScheme) {
        /**
         * 定义操作结果信息
         */
        StringBuilder result = new StringBuilder();

        /**
         * 组织代码生成表基础数据
         */
        GenTable genTable = genScheme.getGenTable();
        List<GenTableColumn> genTableColumnList = genTableColumnMapper.getByGenTableId(genTable.getId());
        genTable.setColumnList(genTableColumnList);
        
        GenConfig config = GenUtils.getConfig();
        /**
         * 得到模版
         */
        List<GenTemplate> templateList = GenUtils.getTemplateList(config, genScheme.getCategory(), false);

        /**
         * 判断如果是主附表类型，获得子模版
         */
        if("curd_many".equals(genScheme.getCategory()) || "left_tree".equals(genScheme.getCategory())){
            List<GenTemplate> childTableTemplateList = GenUtils.getTemplateList(config, genScheme.getCategory(), true);
            if (childTableTemplateList.size() > 0) {
                GenTable parentTable = new GenTable();
                parentTable.setParentTable(genTable.getName());
                genTable.setChildList(genTableMapper.findList(parentTable));
            }
            /** 子表可能有几个，遍历并生成代码 */
            for (GenTable childTable : genTable.getChildList()) {
                childTable.setParent(genTable);
                /** 获取子表的字段列表 */
                childTable.setColumnList(genTableColumnMapper.getByGenTableId(childTable.getId()));
                /** 生成代码文件 */
                genScheme.setGenTable(childTable);
                Map childTableModel = GenUtils.getDataModel(genScheme);
                for (GenTemplate tpl : childTableTemplateList) {
                    /** 生成单个文件 */
                    String message = GenUtils.generateToFile(tpl, childTableModel, true);
                    result.append(message);
                }
            }
        }

        /** 生成主表 */
        genScheme.setGenTable(genTable);
        Map model = GenUtils.getDataModel(genScheme);
        for (GenTemplate tpl : templateList) {
            /** 生成单个文件 */
            String message = GenUtils.generateToFile(tpl, model, true);
            result.append(message);
        }
        logger.info("【代码生成文件】结果：" + result.toString());

        /** 记录日志 不能影响正常业务 genTable.setChildList(null)为了避免json转换问题*/
        genTable.setChildList(null);
        RabbitMqUtil.sendLogOption("代码生成", "1", genTable);

        return result.toString();
    }

    /**
     * 描述:创建菜单操作
     *
     * @Author sailei
     * @Date 2019/7/11 16:02
     */
    @Transactional(rollbackFor = Exception.class)
    public R createMenuSave(String genTableId, String parentId, String name, String icon) {
        GenScheme genScheme = genSchemeMapper.getByGenTableId(genTableId);
        if(genScheme == null){
            return R.error("创建菜单前必须先生成代码!");
        }

        /**
         * 获得代码生成的地址和权限
         */
        GenTable genTable = genTableMapper.getById(genScheme.getGenTableId());
        genScheme.setGenTable(genTable);
        Map model = GenUtils.getDataModel(genScheme);
        String permis = model.get("permissionPrefix").toString();
        /**
         * 获取父菜单
         */
        Menu pMenu = menuMapper.getById(parentId);
        Menu menu = new Menu();
        String menuId = IdUtils.getNumberId();
        menu.setMenuId(menuId);
        menu.setParentId(parentId);
        menu.setParentName(pMenu.getName());
        menu.setName(name);
        menu.setIcon(icon);
        menu.setIsShow(1);
        menu.setSort(new BigDecimal(0));
        menu.setMenuType(1);
        menu.setParentIds(pMenu.getParentIds() + parentId + ",");
        menu.setPermission(permis + ":list");
        menu.setUrl(model.get("urlPrefix").toString() + "/index");
        menu.setLevels(pMenu.getLevels() + 1);
        menuMapper.saveMenu(menu);

        /**
         *  创建添加按钮
         */
        menu.setMenuId(IdUtils.getNumberId());
        menu.setParentId(menuId);
        menu.setParentName(name);
        menu.setParentIds(menu.getParentIds() + menuId + ",");
        menu.setMenuType(2);
        menu.setLevels(5);
        menu.setName("添加");
        menu.setPermission(permis + ":add");
        menuMapper.saveMenu(menu);
        
        /**
         * 创建修改按钮
         */
        menu.setMenuId(IdUtils.getNumberId());
        menu.setName("修改");
        menu.setPermission(permis + ":edit");
        menuMapper.saveMenu(menu);
        
        /**
         * 创建移除按钮
         */
        menu.setMenuId(IdUtils.getNumberId());
        menu.setName("移除");
        menu.setPermission(permis + ":remove");
        menuMapper.saveMenu(menu);

        /**
         * 创建查看按钮
         */
        menu.setMenuId(IdUtils.getNumberId());
        menu.setName("查看");
        menu.setPermission(permis + ":detail");
        menuMapper.saveMenu(menu);

        /** 如果是左树右表模式生成代码 */
        if("left_tree".equals(genScheme.getCategory())){
            GenTable parentTable = new GenTable();
            parentTable.setParentTable(genTable.getName());
            List<GenTable> list = genTableMapper.findList(parentTable);
            if(list != null && list.size() > 0){
                for(GenTable table : list){
                    String urlPrefix = permis.substring(0, permis.lastIndexOf(":"));
                    String className = table.getClassName();
                    /** 首字母变小写 */
                    String firstOne = String.valueOf(className.charAt(0));
                    firstOne = firstOne.toLowerCase();
                    className = firstOne + className.substring(1, className.length());
                    /** 组织权限标识 */
                    urlPrefix = urlPrefix + ":" + className;

                    /**  创建子节点列表按钮 */
                    menu.setMenuId(IdUtils.getNumberId());
                    menu.setName("子列表");
                    menu.setPermission(urlPrefix + ":list");
                    menuMapper.saveMenu(menu);
                    /**  创建子节点查看按钮 */
                    menu.setMenuId(IdUtils.getNumberId());
                    menu.setName("子查看");
                    menu.setPermission(urlPrefix + ":detail");
                    menuMapper.saveMenu(menu);
                    /**  创建子节点新增按钮 */
                    menu.setMenuId(IdUtils.getNumberId());
                    menu.setName("子新增");
                    menu.setPermission(urlPrefix + ":add");
                    menuMapper.saveMenu(menu);
                    /**  创建子节点修改按钮 */
                    menu.setMenuId(IdUtils.getNumberId());
                    menu.setName("子修改");
                    menu.setPermission(urlPrefix + ":edit");
                    menuMapper.saveMenu(menu);
                    /**  创建子节点移除按钮 */
                    menu.setMenuId(IdUtils.getNumberId());
                    menu.setName("子移除");
                    menu.setPermission(urlPrefix + ":remove");
                    menuMapper.saveMenu(menu);

                    /** 只获取第一个子表即可 */
                    break;
                }
            }
        }

        /** 刷新缓存 */
        MenuUtils.deleteAll();

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("创建菜单", "1", genScheme);

        return R.ok();
    }
}
