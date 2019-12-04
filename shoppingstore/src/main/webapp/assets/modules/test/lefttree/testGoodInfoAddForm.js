var TestGoodInfoDlg = {
    data: {
        classId: "",
        classIdName: ""
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


    var urlPrefix = "/test/lefttree/testGoodClass";

    /** 点击上级部门时 */
    $('#classIdName').click(function () {
        var formName = encodeURIComponent("parent.TestGoodInfoDlg.data.classIdName");
        var formId = encodeURIComponent("parent.TestGoodInfoDlg.data.classId");
        var treeUrl = encodeURIComponent(urlPrefix + "/tree");

        layer.open({
            type: 2,
            title: '父级节点',
            area: ['300px', '340px'],
            content: Feng.ctxPath + '/system/commonTree?formName=' + formName + "&formId=" + formId + "&treeUrl=" + treeUrl,
            end: function () {
                var parentId = TestGoodInfoDlg.data.classId;
                if(parentId != null && parentId != '' && parentId != undefined){
                    $("#classId").val(parentId);
                    $("#classIdName").val(TestGoodInfoDlg.data.classIdName);
                }
            }
        });
    });


    /** 表单提交事件 */
    form.on('submit(btnSubmit)', function (data) {
        var ajax = new $ax(Feng.ctxPath + "/test/lefttree/testGoodInfo/save", function (data) {
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