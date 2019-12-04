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
     * 系统管理--部门管理
     */
    var Dept = {
        tableId: "deptTable",
        condition: {
            deptId: "",
            name: ""
        }
    };

    /**
     * 初始化表格的列
     */
    Dept.initColumn = function () {
        return [[
            {type: 'numbers'},
            {field: 'deptId', hide: true,title: 'id'},
            {field: 'name', title: '部门简称'},
            {field: 'fullName', title: '部门全称'},
            {field: 'sort', title: '排序'},
            {field: 'description', title: '备注'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 200}
        ]];
    };


    /**
     * 选择部门时
     */
    Dept.onClickDept = function (e, treeId, treeNode) {
        Dept.condition.deptId = treeNode.id;
        Dept.search();
    };

    /**
     * 弹出添加
     */
    Dept.openAddDept = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '添加部门',
            area: ['300px', '400px'],
            content: Feng.ctxPath + '/dept/dept_add',
            end: function () {
                admin.getTempData('formOk') && Dept.initTable(Dept.tableId);
            }
        });
    };

    /**
     * 点击编辑部门
     *
     * @param data 点击按钮时候的行数据
     */
    Dept.onEditDept = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '修改部门',
            area: ['300px', '400px'],
            content: Feng.ctxPath + '/dept/dept_update?deptId=' + data.deptId,
            end: function () {
                admin.getTempData('formOk') && Dept.initTable(Dept.tableId);
            }
        });
    };

    /**
     * 点击删除部门
     *
     * @param data 点击按钮时候的行数据
     */
    Dept.onDeleteDept = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/dept/delete", function (data) {
                if(data.code === 0){
                    Feng.success("删除成功!");
                    Dept.initTable(Dept.tableId);
                }else{
                    Feng.error("删除失败！" + data.msg)
                }
            }, function (data) {
                Feng.error("删除失败!" + data.msg + "!");
            });
            ajax.set("deptId", data.deptId);
            ajax.start();
        };
        Feng.confirm("是否删除部门 " + data.name + "?", operation);
    };

    /**
     * 初始化表格
     */
    Dept.initTable = function (deptId, data) {
        return treetable.render({
            elem: '#' + deptId,
            url: Feng.ctxPath + '/dept/listTree',
            where: data,
            page: false,
            height: "full-98",
            cellMinWidth: 100,
            cols: Dept.initColumn(),
            treeColIndex: 2,
            treeSpid: "0",
            treeIdName: 'deptId',
            treePidName: 'parentId',
            treeDefaultClose: true,
            treeLinkage: false
        });
    };

    /** 渲染表格 */
    Dept.initTable(Dept.tableId);


    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        Dept.openAddDept();
    });

    // 工具条点击事件
    table.on('tool(' + Dept.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            Dept.onEditDept(data);
        } else if (layEvent === 'delete') {
            Dept.onDeleteDept(data);
        }
    });
});
