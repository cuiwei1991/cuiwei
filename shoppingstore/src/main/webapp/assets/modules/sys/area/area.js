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
     * 系统管理--地区管理
     */
    var Area = {
        tableId: "areaTable",
        condition: {
            areaId: "",
            name: ""
        }
    };

    /**
     * 初始化表格的列
     */
    Area.initColumn = function () {
        return [[
            {type: 'numbers'},
            {field: 'id', hide:true, title: 'id'},
            {field: 'name', title: '名称'},
            {field: 'id', title: '区域编码'},
            {field: 'level', title: '区域类型',templet: function (row) {
                var value = row.level;
                if(value == 0){
                    return '国家';
                }else if(value == 1){
                    return '省/直辖市';
                }else if(value == 2){
                    return '市';
                }else if(value == 3){
                    return '区';
                }
             }},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 200}
        ]];
    };


    /**
     * 选择地区时
     */
    Area.onClickArea = function (e, treeId, treeNode) {
        Area.condition.areaId = treeNode.id;
        Area.search();
    };

    /**
     * 弹出添加
     */
    Area.openAddArea = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '添加地区',
            area: ['300px', '400px'],
            content: Feng.ctxPath + '/area/area_add',
            end: function () {
                admin.getTempData('formOk') && Area.initTable(Area.tableId);
            }
        });
    };

    /**
     * 点击编辑地区
     *
     * @param data 点击按钮时候的行数据
     */
    Area.onEditArea = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '修改地区',
            area: ['300px', '400px'],
            content: Feng.ctxPath + '/area/area_update?areaId=' + data.id,
            end: function () {
                admin.getTempData('formOk') && Area.initTable(Area.tableId);
            }
        });
    };

    /**
     * 点击添加子地区
     *
     * @param data 点击按钮时候的行数据
     */
    Area.onAddAreaSub = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '添加子地区',
            content: Feng.ctxPath + '/area/area_add?areaId=' + data.id,
            end: function () {
                admin.getTempData('formOk') && Area.initTable(Area.tableId);
            }
        });
    };

    /**
     * 点击删除地区
     *
     * @param data 点击按钮时候的行数据
     */
    Area.onDeleteArea = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/area/delete", function (data) {
                if(data.code === 0){
                    Feng.success("删除成功!");
                    Area.initTable(Area.tableId);
                }else{
                    Feng.error("删除失败！" + data.msg)
                }
            }, function (data) {
                Feng.error("删除失败!" + data.msg + "!");
            });
            ajax.set("id", data.id);
            ajax.start();
        };
        Feng.confirm("是否删除地区 " + data.name + "?", operation);
    };


    /**
     * 初始化表格
     */
    Area.initTable = function (id, data) {
        return treetable.render({
            elem: '#' + id,
            url: Feng.ctxPath + '/area/listTree',
            where: data,
            height: "full-98",
            cellMinWidth: 100,
            cols: Area.initColumn(),
            treeColIndex: 2,
            treeSpid: "0",
            treeIdName: 'id',
            treePidName: 'parentId',
            treeDefaultClose: true,
            treeLinkage: false
        });
    };

    /** 渲染表格 */
    Area.initTable(Area.tableId);

    /** 添加按钮点击事件 */
    $('#btnAdd').click(function () {
        Area.openAddArea();
    });

    /** 工具条点击事件 */
    table.on('tool(' + Area.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            Area.onEditArea(data);
        } else if (layEvent === 'delete') {
            Area.onDeleteArea(data);
        } else if (layEvent === 'addSub') {
            Area.onAddAreaSub(data);
        }
    });

});
