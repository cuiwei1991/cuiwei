var TestGoodClassDlg = {
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
        var formName = encodeURIComponent("parent.TestGoodClassDlg.data.parentName");
        var formId = encodeURIComponent("parent.TestGoodClassDlg.data.parentId");
        var treeUrl = encodeURIComponent("/test/lefttree/testGoodClass/tree");

        layer.open({
            type: 2,
            title: '父级节点',
            area: ['300px', '340px'],
            content: Feng.ctxPath + '/system/commonTree?formName=' + formName + "&formId=" + formId + "&treeUrl=" + treeUrl,
            end: function () {
                var parentId = TestGoodClassDlg.data.parentId;
                if(parentId != null && parentId != '' && parentId != undefined){
                    $("#parentId").val(parentId);
                    $("#parentName").val(TestGoodClassDlg.data.parentName);
                }
            }
        });
    });

    /** 表单提交事件 */
    form.on('submit(btnSubmit)', function (data) {
        var ajax = new $ax(Feng.ctxPath + "/test/lefttree/testGoodClass/save", function (data) {
            if(data.code === 0){
                Feng.success("添加成功!");

                /** 传给上个页面,刷新table用 */
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









});