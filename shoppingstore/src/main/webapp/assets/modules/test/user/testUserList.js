layui.use(['layer', 'form', 'table', 'admin', 'ax', 'laydate'], function () {
    var $ = layui.jquery;
    var layer = layui.layer;
    var form = layui.form;
    var table = layui.table;
    var $ax = layui.ax;
    var admin = layui.admin;
    var laydate = layui.laydate;

    /**
     * 定义全程变量
     */
    var TestUser = {
        tableId: "dataTable",    //表格id
        condition: {
            id: ""
        }
    };

    /**
     * 初始化表格的列
     */
    TestUser.initColumn = function () {
        return [[
            {type: 'checkbox'},
				{field: 'name', sort: true, title: '姓名'},
				{field: 'nickName', sort: true, title: '昵称'},
				{field: 'age', sort: true, title: '年龄'},
				{field: 'idNumber', sort: true, title: '身份证号'},
				{field: 'mobile', sort: true, title: '手机号'},
				{field: 'createDate', sort: true, title: '创建时间'},
				{field: 'updateDate', sort: true, title: '修改时间'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 200}
        ]];
    };

    /**
     * 点击查询按钮
     */
    TestUser.search = function () {
        var queryData = {};
        queryData['name'] = $("#nameId").val();
        queryData['idNumber'] = $("#idNumberId").val();
        table.reload(TestUser.tableId, {where: queryData});
    };

    /**
     * 弹出添加
     */
    TestUser.openAddTestUser = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '添加',
            area: ['80%','80%'],
            content: Feng.ctxPath + '/test/user/testUser/index_add',
            end: function () {
                admin.getTempData('formOk') && table.reload(TestUser.tableId);
            }
        });
    };

    /**
     * 点击编辑
     */
    TestUser.onEditTestUser = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '编辑',
            area: ['80%','80%'],
            content: Feng.ctxPath + '/test/user/testUser/index_edit?id=' + data.id,
            end: function () {
                admin.getTempData('formOk') && table.reload(TestUser.tableId);
            }
        });
    };

    /**
     * 删除
     *
     * @param data 点击按钮时候的行数据
     */
    TestUser.onRemoveTestUser = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/test/user/testUser/remove", function () {
                Feng.success("删除成功!");
                table.reload(TestUser.tableId);
            }, function (data) {
                Feng.error(data.msg);
            });
            ajax.set("id", data.id);
            ajax.start();
        };
        Feng.confirm("是否删除选中的记录?", operation);
    };


    /** 渲染表格 */
    var tableResult = table.render({
        elem: '#' + TestUser.tableId,
        url: Feng.ctxPath + '/test/user/testUser/list',
        page: true,
        height: "full-98",
        limits: [10,20,30,50,100],
        cellMinWidth: 100,
        cols: TestUser.initColumn()
    });

    /** 搜索按钮点击事件 */
    $('#btnSearch').click(function () {
        TestUser.search();
    });

    /** 添加按钮点击事件 */
    $('#btnAdd').click(function () {
        TestUser.openAddTestUser();
    });

    /** 工具条点击事件 */
    table.on('tool(' + TestUser.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            TestUser.onEditTestUser(data);
        } else if (layEvent === 'remove') {
            TestUser.onRemoveTestUser(data);
        }else if (layEvent === 'view') {
            TestUser.onViewTestUser(data);
        }
    });


	/**如果排序使用后台数据库，添加以下内容*/
    table.on('sort(' + TestUser.tableId + ')', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        console.log(obj.field); //当前排序的字段名
        console.log(obj.type); //当前排序类型：desc（降序）、asc（升序）、null（空对象，默认排序）
        console.log(this); //当前排序的 th 对象

        //尽管我们的 table 自带排序功能，但并没有请求服务端。
        //有些时候，你可能需要根据当前排序的字段，重新向服务端发送请求，从而实现服务端排序，如：
        table.reload(TestUser.tableId, {
            initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
            ,where: { //请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
                field: obj.field //排序字段   在接口作为参数字段  field order
                ,order: obj.type //排序方式   在接口作为参数字段  field order
            }
        });
    });
});