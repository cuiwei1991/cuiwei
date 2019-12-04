package com.sailei.modules.gen.service;

import com.sailei.common.base.LayuiPage;
import com.sailei.common.base.SLException;
import com.sailei.common.rebbitmq.RabbitMqUtil;
import com.sailei.common.service.R;
import com.sailei.common.utils.IdUtils;
import com.sailei.common.utils.PageUtils;
import com.sailei.common.utils.StringUtils;
import com.sailei.common.utils.ToolUtils;
import com.sailei.config.shiro.ShiroKit;
import com.sailei.modules.gen.entity.GenTable;
import com.sailei.modules.gen.entity.GenTableColumn;
import com.sailei.modules.gen.mapper.GenDataBaseDictMapper;
import com.sailei.modules.gen.mapper.GenTableColumnMapper;
import com.sailei.modules.gen.mapper.GenTableMapper;
import com.sailei.modules.sys.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/** 
 * 描述:代码生成服务类
 *  
 * @Author sailei
 * @Date 2019/10/8 8:53
 */
@Service
public class GenTableService {

    @Autowired
    private GenTableMapper genTableMapper;
    @Autowired
    private GenDataBaseDictMapper genDataBaseDictMapper;
    @Autowired
    private GenTableColumnMapper genTableColumnMapper;
    /**
     * 记录日志
     */
    private static final Logger logger = LoggerFactory.getLogger(GenTableService.class);

    /**
     * 查询列表
     *
     * @param params
     * @return
     */
    public LayuiPage queryPage(Map<String, Object> params) {

        /** 处理分页参数 */
        PageUtils.changeForMap(params);
        /** 获取分页列表 */
        List<GenTable> sets = genTableMapper.queryPage(params);
        /** 获取总条数 */
        long count = genTableMapper.queryCount(params);
        /** 初始化LayuiPage */
        LayuiPage page = new LayuiPage(sets, count);
        return page;
    }

    /**
     * 获取代码生成实体
     */
    public GenTable getById(String id) {
        GenTable genTable = genTableMapper.getById(id);
        return genTable;
    }

    /**
     * 获取代码生成实体列表
     */
    public List<GenTable> findList() {
        List<GenTable> genTables = genTableMapper.findList();
        return genTables;
    }

    /**
     * 检查表名
     */
    public boolean checkTableName(String tableName) {
        if (ToolUtils.isEmpty(tableName)) {
            return true;
        }
        GenTable genTable = new GenTable();
        genTable.setName(tableName);
        List list = genTableMapper.findList(genTable);
        return list.size() == 0;
    }

    /**
     * 检查数据库中的表名
     */
    public boolean checkTableNameFromDB(String tableName) {
        if (ToolUtils.isEmpty(tableName)) {
            return true;
        }
        GenTable genTable = new GenTable();
        genTable.setName(tableName);
        List list = genDataBaseDictMapper.findTableList(genTable);
        return list.size() == 0;
    }

    /**
     * 描述:保存代码生成表
     *
     * @Author sailei
     * @Date 2019/7/4 11:30
     */
    @Transactional(rollbackFor = Exception.class)
    public R saveGenTable(GenTable genTable) throws SLException {
        /**
         * 表中字段数大于零时才保存
         */
        List<Map<String, Object>> maps = genTable.getColumnListMap();
        if (maps == null || maps.size() <= 0) {
            return R.error("请添加字段!");
        }
        logger.info("【保存代码生成表】字段数大于零，开始保存......");

        User user = ShiroKit.getUser();

        boolean isNew = false;

        /** 检查数据库表中是否存在必备字段 */
        List<String> mustColumns = new ArrayList<>();

        /**
         * 定义接收集合
         */
        List<GenTableColumn> columns = new ArrayList<>();
        for (int i = 0; i < maps.size(); i++) {
            Map<String, Object> map = maps.get(i);
            GenTableColumn genTableColumn = new GenTableColumn();

            /** 得到字段列表参数 */
            String jdbcType = map.get("jdbcType") != null ? map.get("jdbcType").toString() : "";
            /** 解决过滤问题 */
            if (jdbcType.contains("& #40")) {
                jdbcType = jdbcType.replace("& #40;", "(");
                jdbcType = jdbcType.replace("& #41;", ")");
            }
            String id = map.get("id") != null ? map.get("id").toString() : IdUtils.uuid();
            String name = map.get("name") != null ? map.get("name").toString() : "";
            mustColumns.add(name);
            String comments = map.get("comments") != null ? map.get("comments").toString() : "";
            String javaType = map.get("javaType") != null ? map.get("javaType").toString() : "";
            String javaField = map.get("javaField") != null ? map.get("javaField").toString() : "";
            String isNull = map.get("isNull") != null ? map.get("isNull").toString() : "";
            String isEdit = map.get("isEdit") != null ? map.get("isEdit").toString() : "";
            String isInsert = map.get("isInsert") != null ? map.get("isInsert").toString() : "";
            String isList = map.get("isList") != null ? map.get("isList").toString() : "";
            String isQuery = map.get("isQuery") != null ? map.get("isQuery").toString() : "";
            String queryType = map.get("queryType") != null ? map.get("queryType").toString() : "";
            String showType = map.get("showType") != null ? map.get("showType").toString() : "";
            String dictType = map.get("dictType") != null ? map.get("dictType").toString() : "";
            String isPk = map.get("isPk") != null ? map.get("isPk").toString() : "";
            Integer sort = map.get("sort") != null ? Integer.valueOf(map.get("sort").toString()) : 0;

            /** 保存到实体中 */
            genTableColumn.setId(id);
            genTableColumn.setName(name);
            genTableColumn.setComments(comments);
            genTableColumn.setJavaType(javaType);
            genTableColumn.setJdbcType(jdbcType);
            genTableColumn.setJavaField(javaField);
            genTableColumn.setIsNull(isNull);
            genTableColumn.setIsEdit(isEdit);
            genTableColumn.setIsInsert(isInsert);
            genTableColumn.setIsList(isList);
            genTableColumn.setIsQuery(isQuery);
            genTableColumn.setQueryType(queryType);
            genTableColumn.setShowType(showType);
            genTableColumn.setDictType(dictType);
            genTableColumn.setSort(sort);

            /**
             * 设置默认值
             */
            if ("1".equals(isQuery) && ToolUtils.isEmpty(queryType)) {
                genTableColumn.setQueryType("=");
            }
            if (ToolUtils.isEmpty(showType)) {
                genTableColumn.setShowType("input");
            }

            /** 设置主键 */
            if ("1".equals(isPk)) {
                genTable.setPk(name);
                genTableColumn.setIsPk("1");
                logger.info("【保存代码生成表】设置主键:" + name);
                /** 主键策略为自动递增时，主键必须是int类型 */
                if ("1".equals(genTable.getGenIdType())) {
                    if (genTableColumn.getJdbcType().indexOf("int") == -1) {
                        throw new SLException("主键策略为自动递增时，主键必须是int类型!");
                    } else {
                        genTableColumn.setJdbcType("int(11)");
                        genTableColumn.setJavaType("Integer");
                    }
                }

            } else {
                genTableColumn.setIsPk("0");
            }
            /** 添加到接收集合 */
            columns.add(genTableColumn);
        }

        if (!mustColumns.contains("del_flag")) {
            throw new SLException("数据表中不存在del_flag字段!");
        }
        if (!mustColumns.contains("create_date")) {
            throw new SLException("数据表中不存在create_date字段!");
        }
        if (!mustColumns.contains("update_date")) {
            throw new SLException("数据表中不存在update_date字段!");
        }
        if ("3".equals(genTable.getTableType()) || "4".equals(genTable.getTableType())) {
            if (!mustColumns.contains("name")) {
                throw new SLException("树结构表中必须存在name字段!");
            }
            if (!mustColumns.contains("parent_id")) {
                throw new SLException("树结构表中必须存在parent_id字段!");
            }
            if (!mustColumns.contains("parent_ids")) {
                throw new SLException("树结构表中必须存在parent_ids字段!");
            }
        }

        /** 添加到表 */
        genTable.setColumnList(columns);

        String tableName = genTable.getName();
        /** 表名记录是否存在 */
        boolean tableNameExit = !checkTableName(tableName);
        logger.info("【保存代码生成表】表名记录是否存在:" + tableNameExit);
        /** 表在数据库中是否存在 */
        boolean tableExit = !checkTableNameFromDB(tableName);
        logger.info("【保存代码生成表】表在数据库中是否存在:" + tableExit);
        /** 定义是否需要同步数据库 默认不需要同步 */
        boolean isSync = false;
        List<GenTableColumn> oldColumns = genTableColumnMapper.queryColumnsByTid(genTable.getId());

        /**
         * 如果是附表，判断是否添加了主表表名以及外键，以及外键是否存在。
         */
        if ("2".equals(genTable.getTableType())) {
            String parentPk = genTable.getParentTableFk();
            if (ToolUtils.isEmpty(genTable.getParentTable()) || ToolUtils.isEmpty(parentPk)) {
                throw new RuntimeException("表类型为附表时主表表名以及外键不能为空!");
            }
            boolean exitPkFlag = false;
            for (GenTableColumn column : columns) {
                if (parentPk.equals(column.getName())) {
                    exitPkFlag = true;
                }
            }
            if (!exitPkFlag) {
                throw new RuntimeException("表类型为附表,字段列表中不存在当前表外键!");
            }
        }

        GenTable genTableOld = genTableMapper.getById(genTable.getId());
        genTableOld.setColumnList(oldColumns);
        /**
         * 判断表名是否可用
         */
        if ((ToolUtils.isEmpty(genTable.getId()))) {
            /** 是新添加的表,创建表时不能与已有表名重复，数据库存在的表不能创建。 */
            if (tableNameExit) {
                logger.error("【保存代码生成表】添加失败:表名" + tableName + "记录已存在!");
                throw new RuntimeException("添加失败:表名" + tableName + " 记录已存在!");
            }
            if (tableExit) {
                logger.error("【保存代码生成表】添加失败:表名" + tableName + "在数据库中已存在,请从数据库导入表单!!");
                throw new RuntimeException("添加失败:表" + tableName + "在数据库中已存在,请从数据库导入表单!");
            }

            /** 新增表,需要同步 */
            isSync = true;
            isNew = true;
            logger.info("【保存代码生成表】新增表,需要同步!");
        } else {
            logger.info("【保存代码生成表】本次操作为修改");
            /** 修改代码生成表并修改表名时，表名不能与其他表名重复，新表名不能与数据库中除原表外的其他表重复。
             * 改表名就说明要新增表 */

            if (!tableName.equals(genTableOld.getName())) {
                /** 表名不能与其他表名重复 */
                if (tableNameExit) {
                    logger.error("【保存代码生成表】修改失败:表名" + tableName + "记录已存在!");
                    throw new RuntimeException("修改失败:表名" + tableName + " 记录已存在!");
                }
                if (tableExit) {
                    logger.error("【保存代码生成表】修改失败:不能修改为数据库已存在的表!");
                    throw new RuntimeException("修改失败:不能修改为数据库已存在的表!");
                }

                /** 表名修改,需要同步 */
                isSync = true;
                logger.info("【保存代码生成表】表名修改,需要同步!");
            }
            if (!genTableOld.getComments().equals(genTable.getComments())) {
                /** 表注释修改,需要同步 */
                isSync = true;
                logger.info("【保存代码生成表】表注释修改,需要同步!");
            }

            if (oldColumns != null && columns.size() != oldColumns.size()) {
                /** 表添加了字段,需要同步 */
                isSync = true;
                logger.info("【保存代码生成表】表添加了字段,需要同步!");
            }
            for (GenTableColumn column : columns) {
                GenTableColumn columnOld = genTableColumnMapper.getByName(column.getName(), genTable.getId());
                if (columnOld == null) {
                    /** 说明表添加了字段,需要同步 */
                    isSync = true;
                    break;
                }
                if (!column.getComments().equals(columnOld.getComments())) {
                    /** 数据库备注修改,需要同步 */
                    isSync = true;
                    logger.info("【保存代码生成表】数据库备注修改,需要同步!");
                    break;
                }
                if (!column.getJdbcType().equals(columnOld.getJdbcType())) {
                    /** 数据库类型修改,需要同步 */
                    isSync = true;
                    logger.info("【保存代码生成表】数据库类型修改,需要同步!");
                    break;
                }
                if (ToolUtils.isEmpty(columnOld.getIsPk()) && "1".equals(column.getIsPk())) {
                    /** 主键变化,需要同步 */
                    isSync = true;
                    logger.info("【保存代码生成表】主键变化,需要同步!");
                    break;
                }
            }
        }

        if (isSync) {
            genTable.setIsSync("0");
            /** 更新同步数据库sql */
            updateSyncSql(isNew, genTableOld, genTable);
        }
        if (ToolUtils.isEmpty(genTable.getId())) {
            genTable.setId(IdUtils.uuid());
            if (null != user) {
                genTable.setCreateBy(String.valueOf(user.getUserId()));
                genTable.setUpdateBy(String.valueOf(user.getUserId()));
            }
            genTable.setCreateDate(new Date());
            genTable.setUpdateDate(genTable.getCreateDate());
            genTable.setDelFlag("0");
            genTableMapper.insert(genTable);
            logger.info("【保存代码生成表】添加表成功!");
        } else {
            if (null != user) {
                genTable.setUpdateBy(String.valueOf(user.getUserId()));
            }
            genTable.setUpdateDate(genTable.getCreateDate());
            genTableMapper.update(genTable);
            logger.info("【保存代码生成表】修改表成功!");
            /**
             * 删除该表以前的栏目列表
             */
            genTableColumnMapper.deleteByGenTable(genTable);
            logger.info("【保存代码生成表】修改先删除该表以前的栏目列表!");
        }

        /**
         * 添加新的栏目列表
         */
        for (GenTableColumn column : columns) {
            column.setId(IdUtils.uuid());
            if (null != user) {
                column.setCreateBy(String.valueOf(user.getUserId()));
                column.setUpdateBy(String.valueOf(user.getUserId()));
            }
            column.setCreateDate(new Date());
            column.setUpdateDate(genTable.getCreateDate());
            column.setDelFlag("0");
            column.setGenTableId(genTable.getId());
            genTableColumnMapper.insert(column);
        }
        logger.info("【保存代码生成表】添加新的栏目列表完成!");

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("保存代码生成表", "1", genTable);

        return R.ok();
    }

    /**
     * 描述:更新同步数据库sql
     *
     * @Author sailei
     * @Date 2019/9/20 16:49
     */
    private void updateSyncSql(boolean isNew, GenTable genTableOld, GenTable genTable) throws SLException {
        StringBuffer sql = new StringBuffer(genTableOld.getSyncSql() != null ? genTableOld.getSyncSql() : "");
        if (isNew) {
            sql = getCreateSql(genTable);
        } else {
            /** 首先判断表名以及表注释是否修改 */
            if (!genTableOld.getName().equals(genTable.getName())) {
                sql.append("alter table ").append(genTableOld.getName())
                        .append(" rename to ").append(genTable.getName()).append(";");
            }
            if (!genTableOld.getComments().equals(genTable.getComments())) {
                sql.append("alter table ").append(genTable.getName())
                        .append(" comment '").append(genTable.getComments()).append("';");
            }

            /** 其次判断表字段是否修改 首先获取旧表注释和字段类型Map，后续使用*/
            Map<String, String> oldCommMap = new HashMap<>();
            Map<String, String> oldJdbcMap = new HashMap<>();
            Map<String, String> oldNameMap = new HashMap<>();
            for (GenTableColumn column : genTableOld.getColumnList()) {
                oldCommMap.put(column.getId(), column.getComments());
                oldJdbcMap.put(column.getId(), column.getJdbcType());
                oldNameMap.put(column.getId(), column.getName());
            }

            /** 获取新表注释和字段类型Map，后续使用;并判断与旧表区别 */
            Map<String, String> newJdbcMap = new HashMap<>();
            Map<String, String> columnNames = new HashMap<>();
            for (GenTableColumn column : genTable.getColumnList()) {
                newJdbcMap.put(column.getId(), column.getJdbcType());
                columnNames.put(column.getName(), column.getName());
            }

            if(columnNames.size() < genTable.getColumnList().size()){
                /** 说明存在重复字段 */
                throw new SLException("存在重复字段，请检查!");
            }

            /** 添加需要删除的字段sql */
            for (GenTableColumn column : genTableOld.getColumnList()) {
                String columnId = column.getId();
                String newJdbc = newJdbcMap.get(columnId);
                if (ToolUtils.isEmpty(newJdbc)) {
                    /** 删除字段sql */
                    sql.append(" alter table ").append(genTable.getName()).append(" drop column ").append(column.getName())
                            .append(" ;");
                }
            }

            /** 添加需要修改的字段sql */
            for (GenTableColumn column : genTable.getColumnList()) {
                String columnId = column.getId();
                String columnName = column.getName();

                String comments = column.getComments();
                String jdbc = column.getJdbcType();
                String oldComments = oldCommMap.get(columnId);
                String oldJdbc = oldJdbcMap.get(columnId);
                String oldName = oldNameMap.get(columnId);

                /** 判断该字段是否为新增 */
                if (oldJdbc == null) {
                    sql.append(" alter table ").append(genTable.getName()).append(" add ").append(columnName)
                            .append(" ").append(jdbc).append(" comment '").append(comments).append("';");
                } else {
                    if (columnName != null && !columnName.equals(oldName)) {
                        /** 修改字段sql */
                        sql.append(" alter table ").append(genTable.getName()).append(" change column ").append(oldName)
                                .append(" ").append(columnName).append(" ").append(jdbc).append(" comment '").append(comments).append("';");
                        continue;
                    }
                    if (comments != null && !comments.equals(oldComments)) {
                        /** 修改注释sql */
                        sql.append(" alter table ").append(genTable.getName()).append(" modify column ").append(columnName)
                                .append(" ").append(jdbc).append(" comment '").append(comments).append("';");
                        continue;
                    }

                    if (jdbc != null && !jdbc.equals(oldJdbc)) {
                        /** 修改字段类型sql */
                        sql.append(" alter table ").append(genTable.getName()).append(" modify column ").append(columnName)
                                .append(" ").append(jdbc).append(" comment '").append(comments).append("' ;");
                    }
                }
            }

        }

        genTable.setSyncSql(sql.toString());
    }

    /**
     * 描述:删除表，从代码生成列表删除记录，同时删除表，添加事务处理。
     *
     * @Author sailei
     * @Date 2019/7/4 11:10
     */
    @Transactional(rollbackFor = Exception.class)
    public R delete(String id) {
        /**
         * 根据ID查询代码生成表记录
         */
        GenTable genTable = genTableMapper.getById(id);
        if (genTable == null) {
            return R.error("参数信息有误！");
        }

        /**
         * 删除表字段列表
         */
        genTableColumnMapper.deleteByGenTable(genTable);

        /**
         * 删除表在代码生成列表中的记录
         */
        genTableMapper.deleteById(genTable);

        /**
         * 删除表
         */
        StringBuffer sql = new StringBuffer();
        sql.append("drop table if exists " + genTable.getName() + " ;");
        genTableMapper.buildTable(sql.toString());

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("删除代码生成表", "1", genTable);

        return R.ok();
    }

    /**
     * 描述:移除表，只从代码生成列表删除记录，不删除表，添加事务处理。
     *
     * @Author sailei
     * @Date 2019/7/3 18:08
     */
    @Transactional(rollbackFor = Exception.class)
    public R genRemove(String id) {
        /**
         * 根据ID查询代码生成表记录
         */
        GenTable genTable = genTableMapper.getById(id);
        if (genTable == null) {
            return R.error("参数信息有误！");
        }

        /**
         * 删除表字段列表
         */
        genTableColumnMapper.deleteByGenTable(genTable);

        /**
         * 删除表在代码生成列表中的记录
         */
        genTableMapper.deleteById(genTable);

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("移除代码生成表", "1", genTable);

        return R.ok();
    }

    /**
     * 描述:同步数据库
     *
     * @Author sailei
     * @Date 2019/7/4 11:48
     */
    @Transactional(rollbackFor = Exception.class)
    public void synchDb(GenTable genTable) throws SLException {

        /** 是否强制同步 */
        boolean isForce = genTable.getTableType() != null && "1".equals(genTable.getTableType());

        /**
         * 根据ID查询genTable所有信息
         */
        genTable = genTableMapper.getById(genTable.getId());

        if (isForce) {
            /**
             * 删除原表
             */
            StringBuffer sql = new StringBuffer();
            sql.append((new StringBuilder("drop table if exists ")).append(genTable.getName()).append(" ;").toString());
            genTableMapper.buildTable(sql.toString());

            /**
             * 组织创建表sql，并重新创建表
             */
            List<GenTableColumn> getTableColumnList = genTableColumnMapper.getByGenTableId(genTable.getId());
            genTable.setColumnList(getTableColumnList);
            sql = getCreateSql(genTable);
            logger.info("【同步数据库】执行sql:" + sql);
            genTableMapper.buildTable(sql.toString());
        } else {
            /**
             * 普通同步执行原sql
             */
            if (genTable.getSyncSql() != null) {
                String[] sqls = genTable.getSyncSql().split(";");
                for (String s : sqls) {
                    if (ToolUtils.isNotEmpty(s)) {
                        genTableMapper.buildTable(s);
                    }
                }
            } else {
                throw new SLException("同步sql不存在，同步失败!");
            }
            /** 修改表同步sql为空 */
            genTable.setSyncSql(null);
        }


        /**
         * 修改生成表同步状态
         */
        genTable.setIsSync("1");
        genTableMapper.update(genTable);

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("同步数据库", "1", genTable);
    }

    /**
     * 描述:创建表sql
     *
     * @Author sailei
     * @Date 2019/9/20 16:57
     */
    private StringBuffer getCreateSql(GenTable genTable) {
        StringBuffer sql = new StringBuffer();
        sql.append((new StringBuilder("create table ")).append(genTable.getName()).append(" (").toString());
        StringBuilder pk = new StringBuilder();
        for (GenTableColumn column : genTable.getColumnList()) {
            String str = (new StringBuilder("  ")).append(column.getName()).append(" ").append(column.getJdbcType()).append(" comment '").append(column.getComments()).append("',").toString();
            if ("1".equals(column.getIsPk())) {
                String auto = "";
                if ("1".equals(genTable.getGenIdType())) {
                    auto = " AUTO_INCREMENT";
                }
                str = (new StringBuilder("  ")).append(column.getName()).append(" ").append(column.getJdbcType()).append(auto + " comment '").append(column.getComments()).append("',").toString();
                pk.append(column.getName()).append(",");
            }

            /** 删除标记添加默认值 */
            if ("del_flag".equals(column.getName())) {
                str = (new StringBuilder("  ")).append(column.getName()).append(" ").append(column.getJdbcType()).append(" DEFAULT 0 comment '").append(column.getComments()).append("',").toString();
            }
            sql.append(str);
        }
        /**
         * 创建主键
         */
        if (pk.length() > 0) {
            pk.deleteCharAt(pk.length() - 1);
            sql.append("primary key (" + pk.toString() + ") ");
        } else {
            /**
             * 没有主键时删掉最后一个,
             */
            sql.deleteCharAt(pk.length() - 1);
        }
        sql.append(" ) COMMENT= '" + genTable.getComments() + "' ROW_FORMAT = Dynamic ;");
        return sql;
    }

    /**
     * 描述:获取可导入的表
     *
     * @Author sailei
     * @Date 2019/7/4 11:48
     */
    public R getImportTables() {
        List<GenTable> tableList = genTableMapper.findTableListFormDb();
        return R.ok().put("data", tableList);
    }

    /**
     * 描述:导入表
     *
     * @Author sailei
     * @Date 2019/7/4 11:48
     */
    @Transactional(rollbackFor = Exception.class)
    public R importTableSave(String tableName) throws SLException {
        List<GenTable> tableList = genTableMapper.findTableListFormDb();
        GenTable genTable = null;
        for (GenTable table : tableList) {
            if (tableName.equals(table.getName())) {
                genTable = table;
                break;
            }
        }
        /** 检验参数 */
        if (genTable == null) {
            return R.error("表：" + tableName + "不存在!");
        }
        /**
         * 开始保存数据
         */
        String id = IdUtils.uuid();
        Date now = new Date();
        genTable.setId(id);
        genTable.setTableType("0");
        genTable.setClassName(StringUtils.toCapitalizeCamelCase(tableName));
        genTable.setIsSync("1");
        genTable.setCreateDate(now);
        genTable.setUpdateDate(now);

        /** 检查数据库表中是否存在必备字段 */
        List<String> mustColumns = new ArrayList<>();

        /** 查询字段集合 */
        List<GenTableColumn> columns = genTableMapper.getGenTableColumn(tableName);
        if (columns != null && columns.size() > 0) {
            for (GenTableColumn column : columns) {
                column.setGenTableId(id);
                column.setId(IdUtils.uuid());
                column.setJavaField(StringUtils.toCamelCase(column.getName()));
                column.setJavaType("String");
                column.setCreateDate(now);
                column.setShowType("input");
                column.setUpdateDate(now);
                column.setIsQuery("0");
                String type = column.getJdbcType();

                /**
                 * 根据数据库了类型设置Java类型
                 */
                if (type.length() >= 7 && "decimal".equals(type.substring(0, 7))) {
                    column.setJavaType("java.math.BigDecimal");
                } else if (type.length() >= 8 && "datetime".equals(type.substring(0, 8))) {
                    column.setJavaType("java.util.Date");
                } else if (type.length() >= 3 && "int".equals(type.substring(0, 3))) {
                    column.setJavaType("Integer");
                }

                /**
                 * 不是主键和删除标记不在列表显示也不能修改
                 */
                if ("del_flag".equals(column.getName())) {
                    column.setIsList("0");
                    column.setIsInsert("0");
                    column.setIsEdit("0");
                } else if (column.getIsPk() != null && "1".equals(column.getIsPk())) {
                    column.setIsList("0");
                    column.setIsEdit("0");
                    column.setIsInsert("1");

                    /** 根据主键类型设置主键策略 */
                    if("Integer".equals(column.getJavaType())){
                        genTable.setGenIdType("1");
                    }else{
                        genTable.setGenIdType("0");
                    }
                } else {
                    column.setIsList("1");
                    column.setIsEdit("1");
                    column.setIsInsert("1");
                }
                mustColumns.add(column.getName());

                genTableColumnMapper.insert(column);

                /** 根据主键类型设置主键策略 */
                if("1".equals(column.getIsPk())){

                }
            }
        }
        if (!mustColumns.contains("del_flag")) {
            throw new SLException("数据表中不存在del_flag字段!");
        }
        if (!mustColumns.contains("create_date")) {
            throw new SLException("数据表中不存在create_date字段!");
        }
        if (!mustColumns.contains("update_date")) {
            throw new SLException("数据表中不存在update_date字段!");
        }

        /** 创建数据库记录 */
        genTableMapper.insert(genTable);

        /** 记录日志 不能影响正常业务 */
        RabbitMqUtil.sendLogOption("导入数据库表", "1", genTable);

        return R.ok();
    }

}
