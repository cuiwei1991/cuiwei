var TestGenealogyDlg = {
	data: {
		parentId: "",
		parentName: ""
	}
};

layui.use(['layer', 'form', 'admin', 'ax', 'laydate'], function () {
    var $ = layui.jquery;
    var $ax = layui.ax;
    var form = layui.form;
    var admin = layui.admin;
    var layer = layui.layer;
    var laydate = layui.laydate;

    admin.iframeAuto();












    /** 点击上级部门时 */
    $('#parentName').click(function () {
        var formName = encodeURIComponent("parent.TestGenealogyDlg.data.parentName");
        var formId = encodeURIComponent("parent.TestGenealogyDlg.data.parentId");
        var treeUrl = encodeURIComponent("/test/tree/testGenealogy/tree");

        layer.open({
            type: 2,
            title: '父级节点',
            area: ['300px', '340px'],
            content: Feng.ctxPath + '/system/commonTree?formName=' + formName + "&formId=" + formId + "&treeUrl=" + treeUrl,
            end: function () {
                var parentId = TestGenealogyDlg.data.parentId;
                if(parentId != null && parentId != '' && parentId != undefined){
                    $("#parentId").val(parentId);
                    $("#parentName").val(TestGenealogyDlg.data.parentName);
                }
            }
        });
    });

    /** 初始化详情数据 */
    var ajax = new $ax(Feng.ctxPath + "/test/tree/testGenealogy/detail/" + Feng.getUrlParam("id"));
    var result = ajax.start();
    form.val('testGenealogyForm',result.data);

    /** 表单提交事件 */
    form.on('submit(btnSubmit)', function (data) {
        var ajax = new $ax(Feng.ctxPath + "/test/tree/testGenealogy/edit", function (data) {
            if(data.code === 0){
                Feng.success("更新成功!");

                /** 传给上个页面，刷新table用 */
                admin.putTempData('formOk', true);
                /** 关掉对话框 */
            	admin.closeThisDialog();
            }else{
                Feng.error(data.msg)
            }
        }, function (data) {
            Feng.error("添加失败！" + data.msg)
        });
        ajax.set(data.field);
        ajax.start();
    });


});