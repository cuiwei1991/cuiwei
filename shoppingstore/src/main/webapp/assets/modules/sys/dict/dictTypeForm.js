layui.use(['layer', 'form', 'admin', 'ax', 'table', 'laydate'], function () {
    var $ = layui.jquery;
    var $ax = layui.ax;
    var form = layui.form;
    var admin = layui.admin;
    var layer = layui.layer;
    var table = layui.table;
    var laydate = layui.laydate;

    var paramsId = Feng.getUrlParam('id');

    /** 让当前iframe弹层高度适应 */
    admin.iframeAuto();
        var dataTableDict = {
        elem: '#dataTableDict',
        id: 'dataTableDict',
        title: '子表数据',
        cols: [[
            {type: 'numbers'},
            {type: 'checkbox'},
			{field: 'code', sort: true, title: '字典编码', edit: 'text'},
			{field: 'name', sort: true, title: '字典名称', edit: 'text'},
            {field: 'deion', sort: true, title: '字典的描述', edit: 'text'},
            {field: 'sort', sort: true, title: '排序', edit: 'text'}
        ]],
        data: [
        ],
        page: false,
        limit:30
    };
    table.render(dataTableDict);
    admin.iframeAuto();

    /** 增加按钮监听 */
    $('#addBtnDict').click(function () {
        var row_sort = dataTableDict.data.length;
			dataTableDict.data.push({ row_sort: row_sort,
			 code: '',
			 name: '',
			 deion: '',
			 sort: '',
			 LAY_CHECKED: true});
        table.reload('dataTableDict', dataTableDict);
        admin.iframeAuto();
    });
    /** 删除按钮监听 */
    $('#delBtnDict').click(function () {
        var checkStatus = table.checkStatus('dataTableDict');
        if (checkStatus.data.length == 0) {
            layer.msg('请选择需要删除的数据');
        } else {
            layer.confirm('真的删除选中的数据么?', function(index){
                layer.close(index);
                delDataForDict(checkStatus);
                table.reload('dataTableDict', dataTableDict);
                admin.iframeAuto();
            });
        }
    });
    /** 删除行 */
    function delDataForDict(datas) {
        for (var i = 0; i < datas.data.length; i++) {
            var row_sort = datas.data[i].row_sort;
            for (var j = dataTableDict.data.length -1; j >= 0; j--) {
                if (dataTableDict.data[j].row_sort == row_sort) {
                    dataTableDict.data.splice(j, 1)
                }
            }
        }
        /** 重置sort = index */
        for (var k = 0; k < dataTableDict.data.length; k++) {
            dataTableDict.data[k].row_sort = k;
        }

    }
    /** 根据sort 获取数据在 data 中的 索引 */
    function getDataIndexDict(row_sort) {
        for (var i = 0; i < dataTableDict.data.length; i++) {
            if (dataTableDict.data[i].row_sort == row_sort) {
                return i;
            }
        }
    }
    /** 监听行选中事件 */
    table.on('checkbox(dataTableDict)', function(obj){
        if (obj.type == 'all') {
            for (var i = 0; i < dataTableDict.data.length; i++) {
                dataTableDict.data[i].LAY_CHECKED = obj.checked;
            }
        } else if (obj.type == 'one') {
            var index = getDataIndexDict(obj.data.row_sort);
            dataTableDict.data[index].LAY_CHECKED = obj.checked;
        }
    });
    /** 监听列名、说明 修改事件 */
    table.on('edit(dataTableDict)', function (obj) {
        var row_sort = obj.data.row_sort;
        var key = obj.field;
        var value = obj.value;
        var index = getDataIndexDict(row_sort);
        dataTableDict.data[index][key] = value;
    });
	/** form 提交 */
    form.on('submit(btnSubmit)', function (data) {
        var formData = {
           			dictTypeId: data.field.dictTypeId,
			code: data.field.code,
			name: data.field.name,
			deion: data.field.deion,
			sort: data.field.sort
        };
        var tableDataDict = [];
        for (var i = 0; i < dataTableDict.data.length; i++) {
                var item = {
                    					code: dataTableDict.data[i].code,
					name: dataTableDict.data[i].name,
					sort: dataTableDict.data[i].sort,
					deion: dataTableDict.data[i].deion
                };
                tableDataDict.push(item);
        }
        console.log(tableDataDict);
        var ajax = new $ax(Feng.ctxPath + "/sys/dictType/add", function (data) {
        	if(data.code === 0){
        		Feng.success('保存成功');
        		/**传给上个页面，刷新table用 */
                admin.putTempData('formOk', true);
                admin.closeThisDialog();
        	}else{
        		Feng.error(data.msg);
        	}

        }, function (data) {
            Feng.error(data.msg);
        });
        ajax.set('dictMapList', tableDataDict);
        ajax.set('id', paramsId);
        for (var key in formData) {
            ajax.set(key, formData[key]);
        }
        ajax.start();
    });

    /**
     * 设置子表数据
     */
    function setTableData() {
        if (paramsId) {
            console.log('编辑');
            var ajax = new $ax(Feng.ctxPath + "/sys/dictType/edit", function (data) {
                var formData = {
           			 			        dictTypeId: data.dictType.dictTypeId,
			        code: data.dictType.code,
			        name: data.dictType.name,
			        deion: data.dictType.deion,
			        sort: data.dictType.sort
                };
                form.val('dataForm', formData);
                var list = data.dictType.dictList;
                var arrayDict = [];
                for (var i = 0; i < list.length; i++) {
                    var item = {
                        row_sort: i,
												dictId: list[i].dictId,
						code: list[i].code,
						name: list[i].name,
						sort: list[i].sort,
						deion: list[i].deion
                    };
                    arrayDict.push(item);
                }
                dataTableDict.data = arrayDict;
                table.render(dataTableDict);
            }, function (data) {
				Feng.error(data.msg);
            });
            ajax.set('id', paramsId);
            ajax.start();
        } else {
            console.log('添加');
        }
    }
    setTableData();

});