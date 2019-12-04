layui.use(['layer', 'form', 'table', 'admin', 'ax'], function () {
    var $ = layui.$;
    var layer = layui.layer;
    var form = layui.form;
    var table = layui.table;
    var $ax = layui.ax;
    var admin = layui.admin;

    /**
     * 系统管理--配置管理
     */
    var GenTable = {
        tableId: "genTable",
        condition: {
            title: ""
        }
    };

    /**
     * 初始化表格的列
     */
    GenTable.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'id', hide: true, sort: true, title: 'ID'},
            {field: 'name', sort: true, title: '表名'},
            {
                field: 'tableType', sort: true, title: '表类型 ', templet: function (row) {
                var value = row.tableType;
                if (value == 0) {
                    return '单表';
                } else if (value == 1) {
                    return '主表';
                } else if (value == 2) {
                    return '附表';
                } else if (value == 3) {
                    return '树表';
                } else if (value == 4) {
                    return '左树';
                } else if (value == 5) {
                    return '右表';
                } else {
                    return '未知';
                }
            }
            },
            {field: 'comments', title: '说明'},
            {field: 'className', sort: true, title: '类名 '},
            {field: 'parentTable', sort: true, title: '主表 '},
            {
                field: 'isSync', sort: true, title: '同步数据库 ', templet: function (row) {
                var flag = row.isSync == 1;
                if (flag) {
                    return '已同步';
                } else {
                    return '<font color="red">未同步</font>';
                }
            }
            },
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 300}
        ]];
    };
    /**
     * 点击查询按钮
     */
    GenTable.search = function () {
        var queryData = {};
        queryData['name'] = $("#name").val();
        table.reload(GenTable.tableId, {where: queryData});
    };

    /**
     * 弹出添加
     */
    GenTable.openAddGenTable = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '添加数据表',
            area: ['80%'],
            content: Feng.ctxPath + '/gen/gen_form?id=',
            end: function () {
                admin.getTempData('formOk') && table.reload(GenTable.tableId);
            }
        });
    };

    GenTable.openGenCode = function () {
        var checkStatus = table.checkStatus('genTable');
        if (checkStatus.data.length != 1) {
            layer.msg('请选择一条记录!');
            return false;
        }
        var id = '';
        if (checkStatus.data[0]) {
            id = checkStatus.data[0].id
        }
        var isSync = checkStatus.data[0].isSync;
        if (isSync != 1) {
            layer.msg('请先同步数据库!');
            return false;
        }
        var tableType = checkStatus.data[0].tableType;
        if (tableType == 2 || tableType == 5) {
            layer.msg('附表不能生成代码，请选择主表!');
            return false;
        }
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '代码生成',
            area: ['50%'],
            content: Feng.ctxPath + '/gen/gen_code?id=' + id,
            end: function () {
                admin.getTempData('formOk') && table.reload(GenTable.tableId);
            }
        });
    };

    /** 创建菜单 */
    GenTable.openCreateMenu = function () {
        var checkStatus = table.checkStatus('genTable');
        if (checkStatus.data.length != 1) {
            layer.msg('请选择一条记录!');
            return false;
        }
        var id = '';
        if (checkStatus.data[0]) {
            id = checkStatus.data[0].id
        }
        var isSync = checkStatus.data[0].isSync;
        if (isSync != 1) {
            layer.msg('请先同步数据库!');
            return false;
        }
        var tableType = checkStatus.data[0].tableType;
        if (tableType == 2 || tableType == 5) {
            layer.msg('附表不能创建菜单，请选择主表!');
            return false;
        }
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '创建菜单',
            area: ['400px', '500px'],
            content: Feng.ctxPath + '/gen/createMenu?id=' + id,
            end: function () {
                admin.getTempData('formOk') && table.reload(GenTable.tableId);
            }
        });
    };

    /** 数据库导入 */
    GenTable.openImportTable = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '数据库导入',
            area: ['50%'],
            content: Feng.ctxPath + '/gen/importTable',
            end: function () {
                admin.getTempData('formOk') && table.reload(GenTable.tableId);
            }
        });
    };

    /**
     * 点击编辑配置
     *
     * @param data 点击按钮时候的行数据
     */
    GenTable.onEditGenTable = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '代码编辑',
            area: ['80%'],
            content: Feng.ctxPath + '/gen/gen_form?id=' + data.id,
            end: function () {
                admin.getTempData('formOk') && table.reload(GenTable.tableId);
            }
        });
    };

    /**
     * 点击删除配置
     *
     * @param data 点击按钮时候的行数据
     */
    GenTable.onDeleteGenTable = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/gen/gen_delete", function () {
                Feng.success("删除成功!");
                table.reload(GenTable.tableId);
            }, function (data) {
                Feng.error("删除失败!" + data.msg + "!");
            });
            ajax.set("id", data.id);
            ajax.start();
        };
        Feng.confirm("是否删除选中配置?", operation);
    };
    /**
     * 点击移除表
     *
     * @param data 点击按钮时候的行数据
     */
    GenTable.onRemoveTable = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/gen/gen_remove", function (data) {
                if (data.code === 0) {
                    Feng.success("移除成功!");
                    table.reload(GenTable.tableId);
                } else {
                    Feng.error("移除失败!" + data.msg + "!");
                }
            }, function (data) {
                Feng.error("移除失败!" + data.msg + "!");
            });
            ajax.set("id", data.id);
            ajax.start();
        };
        Feng.confirm("是否移除选中表?", operation);
    };


    /** 渲染表格 */
    table.render({
        elem: '#' + GenTable.tableId,
        url: Feng.ctxPath + '/gen/list',
        page: true,
        height: "full-98",
        cellMinWidth: 100,
        cols: GenTable.initColumn()
    });

    /** 搜索按钮点击事件 */
    $('#btnSearch').click(function () {
        GenTable.search();
    });

    /** 添加按钮点击事件 */
    $('#btnAdd').click(function () {
        GenTable.openAddGenTable();
    });
    /** 代码生成 */
    $('#genCode').click(function () {
        GenTable.openGenCode();
    });
    /** 创建菜单 */
    $('#createMenu').click(function () {
        GenTable.openCreateMenu();
    });
    /** 数据库导入 */
    $('#btnImport').click(function () {
        GenTable.openImportTable();
    });

    table.on('tool(' + GenTable.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            GenTable.onEditGenTable(data);
        } else if (layEvent === 'delete') {
            GenTable.onDeleteGenTable(data);
        } else if (layEvent === 'remove') {
            GenTable.onRemoveTable(data);
        } else if (layEvent === 'synchDb') {
            GenTable.onSynchDb(data);
        }
    });


    /**
     * 点击代码生成
     *
     * @param data 点击按钮时候的行数据
     */
    GenTable.genCode = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/gen/genCodeForm?id=683ab7a021ba419d8ef61598f0b45170", function () {
                Feng.success("代码生成成功!");
                table.reload(GenTable.tableId);
            }, function (data) {
                Feng.error("代码生成失败!" + data.msg + "!");
            });
            ajax.set("id", data.id);
            ajax.start();
        };
        Feng.confirm("是否生成选中的表?", operation);
    };

    /**
     * 点击同步数据库
     *
     * @param data 点击按钮时候的行数据
     */
    var layerIndex = null;
    GenTable.onSynchDb = function (data) {
        layerIndex = layer.open({
            type: 1,
            title: '选择同步类型',
            closeBtn: 0,
            area: ['392px', '206px'],
            content: $('#synchDbDiv')
        });
        $("#tableId").val(data.id);
    };

    /** 取消 */
    $('#synchDbDivCancel').click(function () {
        console.log(layerIndex);
        layer.close(layerIndex);
    });

    /** 同步 */
    $('#synchDbDivSure').click(function () {
        var type = $('input[name="type"]:checked').val();
        var tableId = $("#tableId").val();
        var ajax = new $ax(Feng.ctxPath + "/gen/synchDb", function (data) {
            if (data.code === 0) {
                Feng.success("同步成功!");
                layer.close(layerIndex);
                table.reload(GenTable.tableId);
            } else {
                layer.close(layerIndex);
                Feng.error("同步失败!" + data.msg + "!");
            }
        }, function (data) {
            layer.close(layerIndex);
            Feng.error("同步失败!" + data.msg + "!");
        });
        ajax.set("id", tableId);
        ajax.set("tableType", type);
        ajax.start();

    });

});
