/**
 * 角色详情对话框
 */
var AreaInfoDlg = {
    data: {
        parentId: "",
        parentName: ""
    }
};

layui.use(['layer', 'form', 'admin', 'ax'], function () {
    var $ = layui.jquery;
    var $ax = layui.ax;
    var form = layui.form;
    var admin = layui.admin;
    var layer = layui.layer;

    // 让当前iframe弹层高度适应
    // admin.iframeAuto();

    // 点击上级部门时
    $('#parentName').click(function () {
        var formName = encodeURIComponent("parent.AreaInfoDlg.data.parentName");
        var formId = encodeURIComponent("parent.AreaInfoDlg.data.parentId");
        var treeUrl = encodeURIComponent("/area/tree");

        layer.open({
            type: 2,
            title: '父级部门',
            area: ['300px', '340px'],
            content: Feng.ctxPath + '/system/commonTree?formName=' + formName + "&formId=" + formId + "&treeUrl=" + treeUrl,
            end: function () {
                var parentId = AreaInfoDlg.data.parentId;
                if(parentId != null && parentId != '' && parentId != undefined){
                    $("#parentId").val(parentId);
                    $("#parentName").val(AreaInfoDlg.data.parentName);
                }
            }
        });
    });

    // 表单提交事件
    form.on('submit(btnSubmit)', function (data) {
        var ajax = new $ax(Feng.ctxPath + "/area/add", function (data) {
            if(data.code === 0){
                Feng.success("添加成功!");
                /** 传给上个页面，刷新table用 */
                admin.putTempData('formOk', true);
            }else{
                Feng.error("添加失败！" + data.msg)
            }
            /** 关掉对话框 */
            admin.closeThisDialog();
        }, function (data) {
            Feng.error("添加失败！" + data.msg)
        });
        ajax.set(data.field);
        ajax.start();
    });
});