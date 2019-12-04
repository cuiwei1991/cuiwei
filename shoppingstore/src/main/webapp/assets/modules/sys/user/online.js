layui.use(['layer', 'form', 'table', 'ztree', 'laydate', 'admin', 'ax'], function () {
    var layer = layui.layer;
    var form = layui.form;
    var table = layui.table;
    var $ZTree = layui.ztree;
    var $ax = layui.ax;
    var laydate = layui.laydate;
    var admin = layui.admin;

    /**
     * 系统管理--用户管理
     */
    var User = {
        tableId: "userTable",    //表格id
        condition: {
            name: "",
            deptId: "",
            timeLimit: ""
        }
    };

    /**
     * 初始化表格的列
     */
    User.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'id', title: 'session编号',width:300},
            {field: 'username', sort: true, title: '账户'},
            {field: 'host',  title: '主机'},
            {field: 'startTimestamp',  title: '登录时间'},
            {field: 'lastAccessTime',  title: '最后访问时间'},
            {field: 'timeoutStr',  title: '超时时间'},
            {field: 'status',  title: '在线状态', templet: function (row) {
                return row.status == '1' ? '在线' : '离线';
            }},
            {align: 'center', toolbar: '#tableBar', title: '操作'}
        ]];
    };

    /**
     * 点击查询按钮
     */
    User.search = function () {
        var queryData = {};
        queryData['username'] = $("#username").val();
        table.reload(User.tableId, {where: queryData});
    };
    $('#btnSearch').click(function () {
        User.search();
    });


    /**
     * 点击剔除用户
     *
     * @param data 点击按钮时候的行数据
     */
    User.onDeleteUser = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/user/logout", function (data) {
                if(data.code === 0){
                    table.reload(User.tableId);
                    Feng.success("强制下线成功!");
                }else{
                    Feng.error(data.msg);
                }
            }, function (data) {
                Feng.error(data.msg);
            });
            ajax.set("sessionId", data.id);
            ajax.set("username", data.username);
            ajax.start();
        };
        Feng.confirm("是否强制下线用户" + data.username + "?", operation);
    };


    // 渲染表格
    var tableResult = table.render({
        elem: '#' + User.tableId,
        url: Feng.ctxPath + '/user/onlineList',
        page: true,
        height: "full-98",
        limits: [10,20,30,50,100],
        cellMinWidth: 100,
        cols: User.initColumn()
    });

    //渲染时间选择框
    laydate.render({
        elem: '#timeLimit',
        range: true,
        max: Feng.currentDate()
    });

    // 工具条点击事件
    table.on('tool(' + User.tableId + ')', function (obj) {
        var data = obj.data;

        User.onDeleteUser(data);
    });


});