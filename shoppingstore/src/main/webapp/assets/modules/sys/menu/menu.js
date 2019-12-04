layui.use(['layer', 'form', 'ztree', 'laydate', 'admin', 'ax', 'table', 'treetable'], function () {
    var layer = layui.layer;
    var form = layui.form;
    var $ZTree = layui.ztree;
    var $ax = layui.ax;
    var laydate = layui.laydate;
    var admin = layui.admin;
    var table = layui.table;
    var treetable = layui.treetable;

    /**
     * 系统管理--菜单管理
     */
    var Menu = {
        tableId: "menuTable",    //表格id
        condition: {
            menuId: "",
            name: ""
        }
    };

    /**
     * 初始化表格的列
     */
    Menu.initColumn = function () {
        return [[
            {type: 'numbers'},
            {field: 'menuId', hide: true, title: 'id'},
            {field: 'name', title: '菜单名称'},
            {field: 'url', title: '链接'},
            {field: 'permission', title: '权限'},
            {field: 'sort', title: '排序',templet: function (row) {
                return row.sort;
            }},
            {field: 'menuType', title: '类型',templet: function (row) {
                var value = row.menuType;
                if(value == 0){
                    return '目录';
                }else if(value == 1){
                    return '菜单';
                }else if(value == 2){
                    return '按钮';
                }else if(value == 3){
                    return '数据权限';
                }
            }},
            {field: 'isShow', title: '显示', align: 'center', templet: function (row) {
                return row.isShow == 1 ? '<i class="layui-badge-dot layui-bg-blue"></i>' : '<i class="layui-badge-dot layui-bg-gray"></i>';
            }},
            {align: 'center', toolbar: '#tableBar', title: '操作'}
        ]];
    };

    /**
     * 点击菜单树时
     */
    Menu.onClickMenu = function (e, treeId, treeNode) {
        Menu.condition.menuId = treeNode.id;
        Menu.search();
    };

    /**
     * 点击查询按钮
     */
    Menu.search = function () {
        var queryData = {};
        queryData['name'] = $("#name").val();
        Menu.initTable(Menu.tableId, queryData);
    };

    /**
     * 弹出添加菜单对话框
     */
    Menu.openAddMenu = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '添加菜单',
            content: Feng.ctxPath + '/menu/menu_add',
            end: function () {
                admin.getTempData('formOk') && Menu.initTable(Menu.tableId);
            }
        });
    };

    /**
     * 导出excel按钮
     */
    Menu.exportExcel = function () {
        var checkRows = table.checkStatus(Menu.tableId);
        if (checkRows.data.length === 0) {
            Feng.error("请选择要导出的数据");
        } else {
            table.exportFile(tableResult.config.id, checkRows.data, 'xls');
        }
    };

    /**
     * 点击编辑菜单按钮时
     *
     * @param data 点击按钮时候的行数据
     */
    Menu.onEditMenu = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '编辑菜单',
            content: Feng.ctxPath + '/menu/menu_edit?menuId=' + data.menuId,
            end: function () {
                admin.getTempData('formOk') && Menu.initTable(Menu.tableId);
            }
        });
    };

    /**
     * 点击删除菜单按钮
     *
     * @param data 点击按钮时候的行数据
     */
    Menu.onDeleteMenu = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/menu/remove", function (data) {
                if(data.code === 0){
                    Feng.success("删除成功!");
                    Menu.condition.menuId = "";
                    Menu.initTable(Menu.tableId);
                }else{
                    Feng.error("删除失败!" + data.msg + "!");
                }
            }, function (data) {
                Feng.error("删除失败!" + data.msg + "!");
            });
            ajax.set("menuId", data.menuId);
            ajax.start();
        };
        Feng.confirm("是否删除菜单" + data.name + "?", operation);
    };

    /**
     * 初始化表格
     */
    Menu.initTable = function (menuId, data) {
        return treetable.render({
            elem: '#' + menuId,
            url: Feng.ctxPath + '/menu/listTree',
            where: data,
            page: false,
            height: "full-98",
            limits: [10,20,30,50,100],
            cellMinWidth: 100,
            cols: Menu.initColumn(),
            treeColIndex: 2,
            treeSpid: "0",
            treeIdName: 'menuId',
            treePidName: 'parentId',
            treeDefaultClose: true,
            treeLinkage: false
        });
    };

    // 渲染表格
    var tableResult = Menu.initTable(Menu.tableId);
    $('#expandAll').click(function () {
        treetable.expandAll('#' + Menu.tableId);
    });
    $('#foldAll').click(function () {
        treetable.foldAll('#' + Menu.tableId);
    });

    //渲染时间选择框
    laydate.render({
        elem: '#timeLimit',
        range: true,
        max: Feng.currentDate()
    });

    //初始化左侧部门树
    var ztree = new $ZTree("menuTree", "/menu/selectMenuTreeList");
    ztree.bindOnClick(Menu.onClickMenu);
    ztree.init();

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        Menu.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        Menu.openAddMenu();
    });

    // 工具条点击事件
    table.on('tool(' + Menu.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            Menu.onEditMenu(data);
        } else if (layEvent === 'delete') {
            Menu.onDeleteMenu(data);
        } else if (layEvent === 'roleAssign') {
            Menu.roleAssign(data);
        } else if (layEvent === 'reset') {
            Menu.resetPassword(data);
        }
    });

    // 修改user状态
    form.on('switch(status)', function (obj) {

        var userId = obj.elem.value;
        var checked = obj.elem.checked ? true : false;

        Menu.changeUserStatus(userId, checked);
    });

});
