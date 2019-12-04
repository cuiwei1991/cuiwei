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
            {field: 'userId', hide: true, sort: true, title: '用户id'},
            {field: 'name', sort: true, title: '姓名'},
            {field: 'account', sort: true, title: '账号'},
            {field: 'sex', sort: true, title: '性别', templet: function (row) {
                return row.sex == 'M' ? '男' : '女';
            }},
            {field: 'roleName', sort: true, title: '角色'},
            {field: 'deptName', sort: true, title: '部门'},
            {field: 'email', sort: true, title: '邮箱'},
            {field: 'phone', sort: true, title: '电话'},
            {field: 'createTime', sort: true, title: '创建时间'},
            {field: 'status', sort: true, templet: '#statusTpl', title: '状态'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 280}
        ]];
    };

    /**
     * 选择部门时
     */
    User.onClickDept = function (e, treeId, treeNode) {
        User.condition.deptId = treeNode.id;
        User.search();
    };

    /**
     * 点击查询按钮
     */
    User.search = function () {
        var queryData = {};
        queryData['deptId'] = User.condition.deptId;
        queryData['name'] = $("#name").val();
        queryData['timeLimit'] = $("#timeLimit").val();
        table.reload(User.tableId, {where: queryData});
    };

    /**
     * 弹出添加用户对话框
     */
    User.openAddUser = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '添加用户',
            content: Feng.ctxPath + '/user/user_add',
            end: function () {
                admin.getTempData('formOk') && table.reload(User.tableId);
            }
        });
    };

    /**
     * 导出excel按钮
     */
    User.exportExcel = function () {
        layer.confirm("确认要导出用户数据吗？",{
            btn:["确认","取消"]
        },function(){
            var url = Feng.ctxPath + "/user/export?1=1";
            url += '&name=' + $("#name").val();
            location.href = url;
            layer.msg("导出成功",{icon:1});
        });
    };
    /**
     * 导入excel按钮
     */
    User.importExcel = function () {
        admin.putTempData('formOk', false);
        var tempUrl = Feng.ctxPath + "/user/import/template";
        var formUrl = Feng.ctxPath + "/user/import";
        top.layui.admin.open({
            type: 2,
            title: '导入数据',
            content: Feng.ctxPath + '/system/commonImport?tempUrl=' + tempUrl + "&formUrl=" + formUrl,
            end: function () {
                admin.getTempData('formOk') && table.reload(User.tableId);
            }
        });
    };

    /**
     * 点击编辑用户按钮时
     *
     * @param data 点击按钮时候的行数据
     */
    User.onEditUser = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '编辑用户',
            content: Feng.ctxPath + '/user/user_edit?userId=' + data.userId,
            end: function () {
                admin.getTempData('formOk') && table.reload(User.tableId);
            }
        });
    };

    /**
     * 点击删除用户按钮
     *
     * @param data 点击按钮时候的行数据
     */
    User.onDeleteUser = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/user/delete", function () {
                table.reload(User.tableId);
                Feng.success("删除成功!");
            }, function (data) {
                Feng.error("删除失败!" + data.msg + "!");
            });
            ajax.set("userId", data.userId);
            ajax.start();
        };
        Feng.confirm("是否删除用户" + data.account + "?", operation);
    };

    /**
     * 分配角色
     *
     * @param data 点击按钮时候的行数据
     */
    User.roleAssign = function (data) {
        layer.open({
            type: 2,
            title: '角色分配',
            area: ['300px', '400px'],
            content: Feng.ctxPath + '/user/role_assign?userId=' + data.userId,
            end: function () {
                table.reload(User.tableId);
            }
        });
    };

    /**
     * 重置密码
     *
     * @param data 点击按钮时候的行数据
     */
    User.resetPassword = function (data) {
        Feng.confirm("是否重置密码为111111 ?", function () {
            var ajax = new $ax(Feng.ctxPath + "/user/reset", function (data) {
                Feng.success("重置密码成功!");
            }, function (data) {
                Feng.error("重置密码失败!");
            });
            ajax.set("userId", data.userId);
            ajax.start();
        });
    };

    /**
     * 修改用户状态
     *
     * @param userId 用户id
     * @param checked 是否选中（true,false），选中就是解锁用户，未选中就是锁定用户
     */
    User.changeUserStatus = function (userId, checked) {
        if (checked) {
            var ajax = new $ax(Feng.ctxPath + "/user/unfreeze", function (data) {
                if(data.code === 0){
                    Feng.success("解除冻结成功!");
                }else{
                    Feng.error("解除冻结失败!" + data.msg);
                }
            }, function (data) {
                Feng.error("解除冻结失败!" + data.msg);
                table.reload(User.tableId);
            });
            ajax.set("userId", userId);
            ajax.start();
        } else {
            var ajax = new $ax(Feng.ctxPath + "/user/freeze", function (data) {
                if(data.code === 0){
                    Feng.success("冻结成功,并已将该用户强制下线!");
                }else{
                    Feng.error("冻结失败!" + data.msg);
                }
            }, function (data) {
                Feng.error("冻结失败!" + data.msg + "!");
                table.reload(User.tableId);
            });
            ajax.set("userId", userId);
            ajax.start();
        }
    };

    // 渲染表格
    var tableResult = table.render({
        elem: '#' + User.tableId,
        url: Feng.ctxPath + '/user/list',
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

    //初始化左侧部门树
    /*var ztree = new $ZTree("deptTree", "/dept/tree");
    ztree.bindOnClick(User.onClickDept);
    ztree.init();*/

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        User.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        User.openAddUser();
    });

    // 导出excel
    $('#btnExp').click(function () {
        User.exportExcel();
    });
    // 导出excel
    $('#btnImp').click(function () {
        User.importExcel();
    });

    // 工具条点击事件
    table.on('tool(' + User.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            User.onEditUser(data);
        } else if (layEvent === 'delete') {
            User.onDeleteUser(data);
        } else if (layEvent === 'roleAssign') {
            User.roleAssign(data);
        } else if (layEvent === 'reset') {
            User.resetPassword(data);
        }
    });

    // 修改user状态
    form.on('switch(status)', function (obj) {

        var userId = obj.elem.value;
        var checked = obj.elem.checked ? true : false;

        User.changeUserStatus(userId, checked);
    });

});