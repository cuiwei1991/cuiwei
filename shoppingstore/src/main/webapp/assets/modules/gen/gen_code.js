layui.use(['layer', 'form', 'admin', 'ax'], function () {
    var $ = layui.jquery;
    var $ax = layui.ax;
    var form = layui.form;
    var admin = layui.admin;
    var layer = layui.layer;

    /** 渲染数据 */
    var id = Feng.getUrlParam('id');
    admin.iframeAuto();
    var ajax = new $ax(Feng.ctxPath + "/gen/genCodeForm", function (data) {
        if(data.code === 0){
            data.genScheme.genTableId=id;
            form.val('genCode', data.genScheme);
        }else{
            layer.msg(data.msg);
        }
        form.val('genCode', data.genScheme);
    }, function (data) {
        Feng.error(data.msg);
    });
    ajax.set("id", id);
    ajax.start();

    /** 表单提交事件 */
    form.on('submit(btnSubmit)', function (data) {
        var checked = check(data.field);
        if(checked != '0'){
            layer.msg(checked);
            return false;
        }
        var ajax = new $ax(Feng.ctxPath + "/gen/genCode", function (data) {
            if(data.code === 0){
                top.layer.msg(data.msg, {
                    time: 20000, //20s后自动关闭
                    area: ['880px', '360px'],
                    btnAlign: 'c',
                    btn: ['关闭']
                });
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

    /**
     * 校验参数
     * @param data
     */
    function check(data){
        var pathReg = new RegExp(/^([a-zA-Z]:|\/)[a-zA-Z0-9\/\\]/g);
        var path = data.projectPath;
        if(!pathReg.test(path)){
            return '生成路径格式错误!';
        }
        var category = data.category;
        if(category == '' || category == undefined){
            return '请选择代码模式!';
        }
        var packageName = data.packageName;
        var packageReg = new RegExp(/^([a-z])[a-zA-Z0-9.]/g);
        if(!packageReg.test(packageName)){
            return '包路径格式错误!';
        }
        var moduleName = data.moduleName;
        if(moduleName == '' || moduleName == undefined){
            return '请输入模块名!';
        }
        var functionName = data.functionName;
        if(functionName == '' || functionName == undefined){
            return '请输入功能描述!';
        }
        var functionNameSimple = data.functionNameSimple;
        if(functionNameSimple == '' || functionNameSimple == undefined){
            return '请输入功能名!';
        }
        var functionAuthor = data.functionAuthor;
        if(functionAuthor == '' || functionAuthor == undefined){
            return '请输入作者!';
        }
        return '0';

    }


    // 选择系统目录点击事件
    var layerIndex = null;
    $('#getCatalog').click(function () {
        $('#test').jstree({
            'core' : {
                'data' : {
                    "url" : Feng.ctxPath + "/gen/path",
                    "data" : function (node) {
                        if (node.id === "#") {
                            return false
                        }
                        return { "id" : node.id };
                    }
                }
            }
        });
        layerIndex = layer.open({
            type: 1,
            title: '选择系统目录',
            closeBtn: 0,
            area: ['90%', '90%'],
            content: $('#dirData'),
            end: function () {
                $('#test').jstree({
                    'core' : {
                        'data' : {
                            "url" : Feng.ctxPath + "/gen/path",
                            "data" : function (node) {
                                if (node.id === "#") {
                                    return false
                                }
                                return { "id" : node.id };
                            }
                        }
                    }
                });
            }
        });
    });
    // 取消选择系统目录
    $('#dirSetCancel').click(function () {
        console.log('取消')
        layer.close(layerIndex);
    });
    // 保存选择系统目录
    $('#dirSetSure').click(function () {
        if($('#test').jstree(true).get_selected(true)[0] === undefined) {
            alert("请选择盘符或文件");
        } else {
            var mulu = ''
            mulu = $('#test').jstree(true).get_selected(true)[0].id
            $("input[name='projectPath']").val(mulu)
            layer.close(layerIndex);
        }
    });
});