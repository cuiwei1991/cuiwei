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
    var Set = {
        tableId: "setTable",    //表格id
        condition: {
            title: ""
        }
    };

    /**
     * 初始化表格的列
     */
    Set.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'setId', hide: true, sort: true, title: 'ID'},
            {field: 'title', sort: true, title: '标题'},
            {field: 'setKey', sort: true, title: '配置键'},
            {field: 'setValue',title: '配置值', templet: '#setValueTemp'},
            {field: 'remark', title: '更新说明', templet : '#setRemarkTemp'},
            {field: 'isLock', sort: true, title: '锁定 ', templet: function (row) {
                return row.isLock == 1 ? '是' : '否';
            }},
            {field: 'updateTime', sort: true, title: '更新时间 '},
            {align: 'center', toolbar: '#tableBar',width:300, title: '操作'}
        ]];
    };

    /**
     * 点击查询按钮
     */
    Set.search = function () {
        var queryData = {};
        queryData['title'] = $("#title").val();
        table.reload(Set.tableId, {where: queryData});
    };

    /**
     * 弹出添加配置
     */
    Set.openAddSet = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '添加配置',
            content: Feng.ctxPath + '/set/set_add',
            end: function () {
                admin.getTempData('formOk') && table.reload(Set.tableId);
            }
        });
    };

    /**
     * 点击编辑配置
     *
     * @param data 点击按钮时候的行数据
     */
    Set.onEditSet = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '修改角色',
            content: Feng.ctxPath + '/set/set_edit?setId=' + data.setId,
            end: function () {
                admin.getTempData('formOk') && table.reload(Set.tableId);
            }
        });
    };

    /**
     * 点击删除配置
     *
     * @param data 点击按钮时候的行数据
     */
    Set.onDeleteSet = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/set/remove", function () {
                Feng.success("删除成功!");
                table.reload(Set.tableId);
            }, function (data) {
                Feng.error(data.msg);
            });
            ajax.set("setId", data.setId);
            ajax.start();
        };
        Feng.confirm("是否删除选中配置?", operation);
    };

    /**
     * 点击更新配置
     *
     * @param data 点击按钮时候的行数据
     */
    Set.onUpdateSet = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/set/update", function (data) {
                if(data.code === 0){
                    Feng.success("更新成功!");
                    table.reload(Set.tableId);
                }else{
                    Feng.error("更新失败!" + data.msg + "!");
                }
            }, function (data) {
                Feng.error("更新失败!" + data.msg + "!");
            });
            data.setValue = $('#'+ data.setId + '_setValue').val();
            data.remark = $('#'+ data.setId + '_remark').val();
            ajax.set(data);
            ajax.start();
        };
        Feng.confirm("是否更新选中配置?", operation);
    };

    /**
     * 点击加解锁配置
     *
     * @param data 点击按钮时候的行数据
     */
    Set.onLockSet = function (data) {
        var message = "锁定";
        if(data.isLock == 1){
            message = "解锁";
        }
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/set/lock", function (data) {
                if(data.code === 0){
                    Feng.success(message + "成功!");
                    table.reload(Set.tableId);
                }else{
                    Feng.error(message + "失败!" + data.msg + "!");
                }
            }, function (data) {
                Feng.error(message + "失败!" + data.msg + "!");
            });
            ajax.set("setId", data.setId);
            ajax.start();
        };
        Feng.confirm("是否" + message + "选中配置?", operation);
    };


    // 渲染表格
    var tableResult = table.render({
        elem: '#' + Set.tableId,
        url: Feng.ctxPath + '/set/list',
        page: true,
        height: "full-98",
        limits: [10,20,30,50,100],
        cellMinWidth: 100,
        cols: Set.initColumn()
    });

    // 搜索按钮点击事件
    $('#btnSearch').click(function () {
        Set.search();
    });

    // 添加按钮点击事件
    $('#btnAdd').click(function () {
        Set.openAddSet();
    });

    Set.clearData = function (type) {
        var message = "所有";
        if(type == 'clearUser'){
            message = "用户";
        }else if(type == 'clearMenu'){
            message = "菜单";
        }else if(type == 'clearRole'){
            message = "角色";
        }else if(type == 'clearSet'){
            message = "配置";
        }else if(type == 'clearDict'){
            message = "字典";
        }

        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/set/clear", function (data) {
                if(data.code === 0){
                    Feng.success("操作成功!");
                    admin.closeThisDialog();
                }else{
                    Feng.error(data.msg);
                }
            }, function (data) {
                Feng.error(data.msg);
            });
            ajax.set("type", type);
            ajax.start();
        };
        Feng.confirm("确认要清理" + message + "缓存数据吗？", operation);
    };

    /** 清理缓存 */
    $('#clearAll').click(function () {
        Set.clearData("clearAll");
    });
    $('#clearUser').click(function () {
        Set.clearData("clearUser");
    });
    $('#clearMenu').click(function () {
        Set.clearData("clearMenu");
    });
    $('#clearRole').click(function () {
        Set.clearData("clearRole");
    });
    $('#clearSet').click(function () {
        Set.clearData("clearSet");
    });
    $('#clearDict').click(function () {
        Set.clearData("clearDict");
    });


    // 工具条点击事件
    table.on('tool(' + Set.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            Set.onEditSet(data);
        } else if (layEvent === 'delete') {
            Set.onDeleteSet(data);
        } else if (layEvent === 'update') {
            Set.onUpdateSet(data);
        } else if (layEvent === 'lock') {
            Set.onLockSet(data);
        }
    });

    /**如果排序使用后台数据库，添加以下内容*/
    table.on('sort(' + Set.tableId + ')', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        console.log(obj.field); //当前排序的字段名
        console.log(obj.type); //当前排序类型：desc（降序）、asc（升序）、null（空对象，默认排序）
        console.log(this); //当前排序的 th 对象

        //尽管我们的 table 自带排序功能，但并没有请求服务端。
        //有些时候，你可能需要根据当前排序的字段，重新向服务端发送请求，从而实现服务端排序，如：
        table.reload(Set.tableId, {
            initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
            ,where: { //请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
                field: obj.field //排序字段   在接口作为参数字段  field order
                ,order: obj.type //排序方式   在接口作为参数字段  field order
            }
        });
    });
});
