layui.use(['layer', 'form', 'admin', 'ax', 'laydate', 'table', 'treetable'], function () {
    var $ = layui.jquery;
    var layer = layui.layer;
    var form = layui.form;
    var $ax = layui.ax;
    var admin = layui.admin;
    var laydate = layui.laydate;
    var table = layui.table;
    var treetable = layui.treetable;

    /**
     * 定义全程变量
     */
    var TestGenealogy = {
        tableId: "dataTable",    //表格id
        condition: {
            id: ""
        }
    };

    /**
     * 初始化表格的列
     */
    TestGenealogy.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'id', hide:true, title: 'id'},
				{field: 'name', sort: true, title: '姓名'},
				{field: 'seniority', sort: true, title: '辈分'},
				{field: 'callName', sort: true, title: '称呼'},
				{field: 'updateDate', sort: true, title: '修改时间'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 200}
        ]];
    };


    /**
     * 弹出添加
     */
    TestGenealogy.openAddTestGenealogy = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '添加',
            content: Feng.ctxPath + '/test/tree/testGenealogy/index_add',
            end: function () {
                admin.getTempData('formOk') && TestGenealogy.initTable(TestGenealogy.tableId);
            }
        });
    };

    /**
     * 点击编辑
     */
    TestGenealogy.onEditTestGenealogy = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '编辑',
            content: Feng.ctxPath + '/test/tree/testGenealogy/index_edit?id=' + data.id,
            end: function () {
                admin.getTempData('formOk') && TestGenealogy.initTable(TestGenealogy.tableId);
            }
        });
    };

    /**
     * 删除
     *
     * @param data 点击按钮时候的行数据
     */
    TestGenealogy.onRemoveTestGenealogy = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/test/tree/testGenealogy/remove", function () {
                Feng.success("删除成功!");
                TestGenealogy.initTable(TestGenealogy.tableId);
            }, function (data) {
                Feng.error(data.msg);
            });
            ajax.set("id", data.id);
            ajax.start();
        };
        Feng.confirm("是否删除选中的记录?", operation);
    };

    /**
     * 点击添加子地区
     *
     * @param data 点击按钮时候的行数据
     */
    TestGenealogy.onAddTestGenealogySub = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '添加子节点',
            content: Feng.ctxPath + '/test/tree/testGenealogy/index_add?id=' + data.id,
            end: function () {
                admin.getTempData('formOk') && TestGenealogy.initTable(TestGenealogy.tableId);
            }
        });
    };

    /**
     * 初始化表格
     */
    TestGenealogy.initTable = function (id, data) {
        return treetable.render({
            elem: '#' + id,
            url: Feng.ctxPath + '/test/tree/testGenealogy/listTree',
            where: data,
            height: "full-98",
            cellMinWidth: 100,
            cols: TestGenealogy.initColumn(),
            treeColIndex: 2,
            treeSpid: "0",
            treeIdName: 'id',
            treePidName: 'parentId',
            treeDefaultClose: true,
            treeLinkage: false
        });
    };

    /** 渲染表格 */
    TestGenealogy.initTable(TestGenealogy.tableId);

    /** 添加按钮点击事件 */
    $('#btnAdd').click(function () {
        TestGenealogy.openAddTestGenealogy();
    });

    /** 工具条点击事件 */
    table.on('tool(' + TestGenealogy.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            TestGenealogy.onEditTestGenealogy(data);
        } else if (layEvent === 'remove') {
            TestGenealogy.onRemoveTestGenealogy(data);
        } else if (layEvent === 'addSub') {
            TestGenealogy.onAddTestGenealogySub(data);
        }
    });


});