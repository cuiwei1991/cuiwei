/**
 * 详情对话框
 */
var MenuInfoDlg = {
    data: {
        parentId: "",
        parentName: ""
    }
};
var formSelects = layui.formSelects;
layui.use(['layer', 'form', 'admin', 'ax'], function () {
    var $ = layui.jquery;
    var $ax = layui.ax;
    var form = layui.form;
    var admin = layui.admin;
    var layer = layui.layer;

    /** 点击父级菜单 */
    $('#parentName').click(function () {
        var formName = encodeURIComponent("parent.MenuInfoDlg.data.parentName");
        var formId = encodeURIComponent("parent.MenuInfoDlg.data.parentId");
        var treeUrl = encodeURIComponent("/menu/selectMenuTreeList");

        layer.open({
            type: 2,
            title: '父级菜单',
            area: ['300px', '400px'],
            content: Feng.ctxPath + '/system/commonTree?formName=' + formName + "&formId=" + formId + "&treeUrl=" + treeUrl,
            end: function () {
                $("#parentId").val(MenuInfoDlg.data.parentId);
                $("#parentName").val(MenuInfoDlg.data.parentName);
            }
        });
    });

    var id = Feng.getUrlParam('id');
    $("#genTableId").val(id);

    /** 表单提交事件 */
    form.on('submit(btnSubmit)', function (data) {
        var ajax = new $ax(Feng.ctxPath + "/gen/createMenuSave", function (data) {
            if(data.code === 0){
                Feng.success("创建成功!")
                /**传给上个页面，刷新table用 */
                admin.putTempData('formOk', true);
                /** 关掉对话框 */
                admin.closeThisDialog();
            }else{
                Feng.error(data.msg)
            }

        }, function (data) {
            Feng.error(data.msg)
        });
        ajax.set(data.field);
        ajax.start();
    });

    /** 图标选择 */
    var layerIndex = null;
    $('#iconSet').click(function () {
        layerIndex = layer.open({
            type: 1,
            title: '选择图标',
            closeBtn: 0,
            area: ['300px', '400px'],
            content: $('#iconSetContent'),
            end: function () {
                console.log('确定');
            }
        });
    });

    function initIconList() {
        var list = '';
        for (var i = 0; i < $layuiIcons.length; i++) {
            var iconClass = $layuiIcons[i];
            var item;
            if (iconClass == $('input[name=icon]').val()) {
                item = '<i class="layui-icon active '+iconClass+'" src="'+iconClass+'"></i>';
            } else {
                item = '<i class="layui-icon '+iconClass+'" src="'+iconClass+'"></i>';
            }

            list += item;
        }
        return list;
    }
    $('#iconSetList').html(initIconList());
    $('#iconSetList .layui-icon').click(function () {
        $('#iconSetList .active').removeClass('active');
        $(this).addClass('active');
    });
    $('#iconSetCancel').click(function () {
        console.log('取消')
        $('#iconSetList .active').removeClass('active');
        var currentIconClass = $('input[name=icon]').val();
        $('#iconSetList .'+currentIconClass).addClass('active');
        layer.close(layerIndex);
    });
    $('#iconSetSure').click(function () {
        var iconClass = $('#iconSetList .active').attr('src');
        console.log(iconClass);
        $('input[name=icon]').val(iconClass);
        $('#iconSet').attr('class', 'layui-icon '+iconClass);
        layer.close(layerIndex);
    });

});