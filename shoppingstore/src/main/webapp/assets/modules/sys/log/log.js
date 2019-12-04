layui.use(['layer', 'table', 'ax', 'laydate'], function () {
    var $ = layui.$;
    var $ax = layui.ax;
    var layer = layui.layer;
    var table = layui.table;
    var laydate = layui.laydate;

    /**
     * 系统管理--操作日志
     */
    var LoginLog = {
        tableId: "logTable"   //表格id
    };

    /**
     * 初始化表格的列
     */
    LoginLog.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'operationLogId', hide: true, title: 'id'},
            {field: 'logName', title: '日志名称'},
            {field: 'userName', title: '用户名称'},
            {field: 'logType', title: '日志类型', templet: function (row) {
                return row.logType == 1 ? '业务日志' : '异常日志';
            }},
            {field: 'createTime', sort: true, title: '时间'},
            {field: 'message', title: '具体消息'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 100}
        ]];
    };

    /**
     * 点击查询按钮
     */
    LoginLog.search = function () {
        var queryData = {};
        queryData['beginTime'] = $("#beginTime").val();
        queryData['endTime'] = $("#endTime").val();
        queryData['logName'] = $("#logName").val();
        queryData['logType'] = $("#logType").val();
        table.reload(LoginLog.tableId, {where: queryData});
    };

    /**
     * 导出excel按钮
     */
    LoginLog.exportExcel = function () {
        var checkRows = table.checkStatus(LoginLog.tableId);
        if (checkRows.data.length === 0) {
            Feng.error("请选择要导出的数据");
        } else {
            table.exportFile(tableResult.config.id, checkRows.data, 'xls');
        }
    };

    /**
     * 日志详情
     */
    LoginLog.logDetail = function (data) {
        var tempStr = data.message
        var result = JSON.stringify(JSON.parse(tempStr), null, 5)
        var trmpArr = result.replace(/\s/g, '');
        var tempArr2 = trmpArr.replace(/,"/g,"<br/>");
        console.log(tempArr2)
        top.layui.admin.open({
            type: 1,
            skin: 'layui-layer-rim', //加上边框
            area: ['800px', '600px'], //宽高
            title: '日志详情',
            content: '<div style="padding: 20px;font-size: 16px;">' + tempArr2 + '</div>'
        });
    };

    /**
     * 清空日志
     */
    LoginLog.cleanLog = function () {
        Feng.confirm("是否清空所有日志?", function () {
            var ajax = new $ax(Feng.ctxPath + "/log/delLog", function (data) {
                Feng.success("清空日志成功!");
                LoginLog.search();
            }, function (data) {
                Feng.error("清空日志失败!");
            });
            ajax.start();
        });
    };

    //渲染时间选择框
    laydate.render({
        elem: '#beginTime'
    });

    //渲染时间选择框
    laydate.render({
        elem: '#endTime'
    });

    // 渲染表格
    var tableResult = table.render({
        elem: '#' + LoginLog.tableId,
        url: Feng.ctxPath + '/log/list',
        page: true,
        height: "full-98",
        limits: [10,20,30,50,100],
        cellMinWidth: 100,
        cols: LoginLog.initColumn()
    });

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        LoginLog.search();
    });

    // 搜索按钮点击事件
    $('#btnClean').click(function () {
        LoginLog.cleanLog();
    });

    // 工具条点击事件
    table.on('tool(' + LoginLog.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'detail') {
            LoginLog.logDetail(data);
        }
    });

    /**如果排序使用后台数据库，添加以下内容*/
    table.on('sort(' + LoginLog.tableId + ')', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        console.log(obj.field); //当前排序的字段名
        console.log(obj.type); //当前排序类型：desc（降序）、asc（升序）、null（空对象，默认排序）
        console.log(this); //当前排序的 th 对象

        //尽管我们的 table 自带排序功能，但并没有请求服务端。
        //有些时候，你可能需要根据当前排序的字段，重新向服务端发送请求，从而实现服务端排序，如：
        table.reload(LoginLog.tableId, {
            initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
            ,where: { //请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
                field: obj.field //排序字段   在接口作为参数字段  field order
                ,order: obj.type //排序方式   在接口作为参数字段  field order
            }
        });
    });
});
