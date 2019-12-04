layui.use(['form', 'upload', 'element', 'ax', 'laydate'], function () {
    var form = layui.form;
    var $ax = layui.ax;
    var laydate = layui.laydate;

    /** 渲染时间选择框 */
    laydate.render({
        elem: '#birthday'
    });

    /** 获取用户详情 */
    var ajax = new $ax(Feng.ctxPath + "/system/currentUserInfo");
    var result = ajax.start();

    /** 用这个方法必须用在class有layui-form的元素上 */
    form.val('userInfoForm', result.data);

    /** 表单提交事件 */
    form.on('submit(userInfoSubmit)', function (data) {
        var ajax = new $ax(Feng.ctxPath + "/user/edit", function (data) {
            if(data.code === 0){
                Feng.success("修改成功!");
            }else{
                Feng.error("修改失败!" + data.msg);
            }
        }, function (data) {
            Feng.error("修改失败!" + data.msg);
        });
        ajax.set(data.field);
        ajax.start();
    });

});

function imageUploadClick(){
    var $=layui.jquery;
    var fileObj = document.getElementById("userPhotoPath").files[0];
    var formData = new FormData();
    formData.append("file", fileObj);
    formData.append("path", "user");
    $.ajax({
        url: Feng.ctxPath + '/system/uploadPhoto',
        type: 'POST',
        data: formData,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        success: function (r) {
            if(r.code === 0){
                $("#imageUpload").attr("src", r.address);
                window.parent.changeImage(r.address);
                layer.msg("上传成功！");
            }else{
                layer.msg(r.msg);
            }
        },
        error: function (r) {
            layer.msg("上传失败!");
        }
    });
}
