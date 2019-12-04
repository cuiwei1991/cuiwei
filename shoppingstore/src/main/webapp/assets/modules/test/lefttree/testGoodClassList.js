layui.use(['layer', 'form', 'admin', 'ax', 'ztree', 'laydate', 'table'], function () {
    var $ = layui.jquery;
    var layer = layui.layer;
    var form = layui.form;
    var $ax = layui.ax;
    var $ZTree = layui.ztree;
    var admin = layui.admin;
    var laydate = layui.laydate;
    var table = layui.table;

    /**
     * 定义全程变量
     */
    var TestGoodClass = {
        tableId: "dataTable",    //表格id
        treeId: "dataTree",    //树id
        condition: {
            id: "",
			title:"",
            relationTreeId: ""
        }
    };

	var urlPrefix = "/test/lefttree/testGoodInfo";

	/**
     * 选择树枝时
     */
    TestGoodClass.onClickTestGoodClass = function (e, treeId, treeNode) {
        TestGoodClass.condition.relationTreeId = treeNode.id;
        TestGoodClass.search();
    };

    /**
     * 初始化表格的列
     */
    TestGoodClass.initColumn = function () {
        return [[
            {type: 'checkbox'},
            {field: 'id', hide:true, title: 'id'},
				{field: 'goodCode', sort: true, title: '商品编码'},
				{field: 'title', sort: true, title: '商品名称'},
				{field: 'deion', sort: true, title: '商品描述'},
				{field: 'image', sort: true, title: '商品图片'},
				{field: 'isRecommend', sort: true, title: '是否热门'},
				{field: 'price', sort: true, title: '价格'},
            	{field: 'classIdName', sort: true, title: '分类'},
				{field: 'createDate', sort: true, title: '创建时间'},
				{field: 'updateDate', sort: true, title: '修改时间'},
				{field: 'delFlag', sort: true, title: '删除标记'},
            {align: 'center', toolbar: '#tableBar', title: '操作', minWidth: 200}
        ]];
    };

    /**
     * 点击查询按钮
     */
    TestGoodClass.search = function () {
        var queryData = {};
        queryData['title'] = $("#titleId").val();
		queryData['relationTreeId'] = TestGoodClass.condition.relationTreeId;
        table.reload(TestGoodClass.tableId, {where: queryData});
    };

    /** 初始化左侧部门树 */
    var zTree = new $ZTree("dataTree", "/test/lefttree/testGoodClass/tree");
    var rMenu = $("#rMenu");
    var selectedNode = "";
    /** 初始化左侧部门树 */
    var setting = {
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            onRightClick: OnRightClick,
            onClick: TestGoodClass.onClickTestGoodClass
        }
    };
    function OnRightClick(event, treeId, treeNode) {
        if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) {
            showRMenu("root", event.clientX, event.clientY);
        } else if (treeNode) {
            selectedNode = treeNode;
            showRMenu("node", event.clientX, event.clientY);
        }
    }
    //显示右键菜单
    function showRMenu(type, x, y) {
        $("#rMenu ul").show();
        rMenu.css({"top":y+"px", "left":x+"px", "visibility":"visible"}); //设置右键菜单的位置、可见
        $("body").bind("mousedown", onBodyMouseDown);
    }
    //隐藏右键菜单
    function hideRMenu() {
        if (rMenu) rMenu.css({"visibility": "hidden"}); //设置右键菜单不可见
        $("body").unbind("mousedown", onBodyMouseDown);
    }
    //鼠标按下事件
    function onBodyMouseDown(event){
        if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {
            rMenu.css({"visibility" : "hidden"});
        }
    }

    TestGoodClass.addTreeNode = function(){
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '添加',
            content: Feng.ctxPath + '/test/lefttree/testGoodClass/index_add?id=' + selectedNode.id,
            end: function () {
                zTree.init();
            }
        });
    }
    TestGoodClass.editTreeNode = function(){
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '编辑',
            content: Feng.ctxPath + '/test/lefttree/testGoodClass/index_edit?id=' + selectedNode.id,
            end: function () {
                zTree.init();
            }
        });
    }
    TestGoodClass.removeTreeNode = function(){
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + "/test/lefttree/testGoodClass/remove", function () {
                Feng.success("删除成功!");
                zTree.init();
            }, function (data) {
                Feng.error(data.msg);
            });
            ajax.set("id", selectedNode.id);
            ajax.start();
        };
        Feng.confirm("是否删除选中的记录?", operation);
    }

    $('#m_add').click(function () {
        hideRMenu();
        TestGoodClass.addTreeNode();
    });
    $('#m_edit').click(function () {
        hideRMenu();
        TestGoodClass.editTreeNode();
    });
    $('#m_remove').click(function () {
        hideRMenu();
        TestGoodClass.removeTreeNode();
    });

    zTree.bindOnClick(TestGoodClass.onClickTestGoodClass);
    zTree.setSettings(setting);
    zTree.init();

    /**
     * 添加子节点数据
     */
    TestGoodClass.onAddSub = function () {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '添加',
            content: Feng.ctxPath + urlPrefix + '/index_add?treeId=' + TestGoodClass.condition.relationTreeId,
            end: function () {
                admin.getTempData('formOk') && table.reload(TestGoodClass.tableId);
            }
        });
    };

    /**
     * 编辑子节点数据
     */
    TestGoodClass.onEditSub = function (data) {
        admin.putTempData('formOk', false);
        top.layui.admin.open({
            type: 2,
            title: '编辑',
            content: Feng.ctxPath + urlPrefix + '/index_edit?id=' + data.id,
            end: function () {
                admin.getTempData('formOk') && table.reload(TestGoodClass.tableId);
            }
        });
    };

    /**
     * 删除子节点数据
     *
     * @param data 点击按钮时候的行数据
     */
    TestGoodClass.onRemoveSub = function (data) {
        var operation = function () {
            var ajax = new $ax(Feng.ctxPath + urlPrefix + "/remove", function () {
                Feng.success("删除成功!");
                table.reload(TestGoodClass.tableId);
            }, function (data) {
                Feng.error(data.msg);
            });
            ajax.set("id", data.id);
            ajax.start();
        };
        Feng.confirm("是否删除选中的记录?", operation);
    };

    // 渲染表格
    var tableResult = table.render({
        elem: '#' + TestGoodClass.tableId,
        url: Feng.ctxPath + urlPrefix + '/list',
        page: true,
        height: "full-98",
        cellMinWidth: 100,
        cols: TestGoodClass.initColumn()
    });


    /** 搜索按钮点击事件 */
    $('#btnSearch').click(function () {
        TestGoodClass.search();
    });

    /** 添加按钮点击事件 */
    $('#btnAdd').click(function () {
        TestGoodClass.openAddTestGoodClass();
    });

    /** 添加按钮点击事件 */
    $('#btnAddSub').click(function () {
        TestGoodClass.onAddSub();
    });

    /** 工具条点击事件 */
    table.on('tool(' + TestGoodClass.tableId + ')', function (obj) {
        var data = obj.data;
        var layEvent = obj.event;

        if (layEvent === 'edit') {
            TestGoodClass.onEditTestGoodClass(data);
        } else if (layEvent === 'remove') {
            TestGoodClass.onRemoveTestGoodClass(data);
        } else if (layEvent === 'editSub') {
            TestGoodClass.onEditSub(data);
        } else if (layEvent === 'removeSub') {
            TestGoodClass.onRemoveSub(data);
        }
    });


});