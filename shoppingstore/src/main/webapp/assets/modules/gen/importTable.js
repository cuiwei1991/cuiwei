layui.use(['layer', 'form', 'admin', 'ax'], function () {
    var $ = layui.jquery;
    var $ax = layui.ax;
    var form = layui.form;
    var admin = layui.admin;
    var layer = layui.layer;

    admin.iframeAuto();
    /** 渲染数据 */
    var ajax = new $ax(Feng.ctxPath + "/gen/getImportTables");
    var result = ajax.start();
    if(result.code === 0){
        for (var i = 0; i < result.data.length; i++) {
            var name = result.data[i].name;
            var comments = result.data[i].comments;
            $('select[name=tableName]').append('<option value="' + name + '">' + name + '~'  + comments + '</option>');
        }
    }
    form.render('select', 'importTable');
    /** 表单提交事件 */
    form.on('submit(btnSubmit)', function (data) {
        var tableName = $("#tableName").val();
        if(tableName == '' || tableName == undefined){
            layer.msg("请选择表");
            return false;
        }
        var ajax = new $ax(Feng.ctxPath + "/gen/importTableSave", function (data) {
            if(data.code === 0){
                Feng.success("导入成功!");
                /**传给上个页面，刷新table用 */
                admin.putTempData('formOk', true);
                /** 关掉对话框 */
                admin.closeThisDialog();
            }else{
                Feng.error(data.msg);
            }

        }, function (data) {
            Feng.error(data.msg);
        });
        ajax.set(data.field);
        ajax.start();
    });

});