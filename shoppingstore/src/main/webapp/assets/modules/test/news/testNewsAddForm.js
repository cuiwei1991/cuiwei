layui.use(['layer', 'form', 'admin', 'ax', 'laydate'], function () {
    var $ = layui.jquery;
    var $ax = layui.ax;
    var form = layui.form;
    var admin = layui.admin;
    var layer = layui.layer;
    var laydate = layui.laydate;

 	admin.iframeAuto();

    

    /** 表单提交事件 */
    form.on('submit(btnSubmit)', function (data) {
        var ajax = new $ax(Feng.ctxPath + "/test/news/testNews/save", function (data) {
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








    /** 富文本 */
	layui.use('layedit', function(){
	  var layedit = layui.layedit;
	  layedit.build('contentId'); //建立编辑器
	});

});