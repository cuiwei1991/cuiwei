layui.use(['layer', 'form', 'admin', 'ax', 'table', 'element', 'layedit','upload'], function () {
    var $ = layui.jquery;
    var $ax = layui.ax;
    var form = layui.form;
    var admin = layui.admin;
    var layer = layui.layer;
    var table = layui.table;
    var element = layui.element;

    var paramsId = Feng.getUrlParam('id');

    /** 让当前iframe弹层高度适应 */
    admin.iframeAuto();
        var dataTableTestUserDept = {
        elem: '#dataTableTestUserDept',
        id: 'dataTableTestUserDept',
        title: '子表数据',
        cols: [[
            {type: 'numbers'},
            {type: 'checkbox'},
			{field: 'deptName', sort: true, title: '部门名称', edit: 'text'},
			{field: 'deptCode', sort: true, title: '部门名称', edit: 'text'},
			{field: 'deptJob', sort: true, title: '部门职位', edit: 'text'},
        ]],
        data: [
        ],
        page: false,
        limit:30
    };
    table.render(dataTableTestUserDept);
    admin.iframeAuto();

    /** 增加按钮监听 */
    $('#addBtnTestUserDept').click(function () {
        var row_sort = dataTableTestUserDept.data.length;
			dataTableTestUserDept.data.push({ row_sort: row_sort,
			 name: '',
			 nickName: '',
			 age: '',
			 idNumber: '',
			 mobile: '',
			 createDate: '',
			 updateDate: '',
			 LAY_CHECKED: true});
        table.reload('dataTableTestUserDept', dataTableTestUserDept);
        admin.iframeAuto();
    });
    /** 删除按钮监听 */
    $('#delBtnTestUserDept').click(function () {
        var checkStatus = table.checkStatus('dataTableTestUserDept');
        if (checkStatus.data.length == 0) {
            layer.msg('请选择需要删除的数据');
        } else {
            layer.confirm('真的删除选中的数据么?', function(index){
                layer.close(index);
                delDataForTestUserDept(checkStatus);
                table.reload('dataTableTestUserDept', dataTableTestUserDept);
                admin.iframeAuto();
            });
        }
    });
    /** 删除行 */
    function delDataForTestUserDept(datas) {
        for (var i = 0; i < datas.data.length; i++) {
            var row_sort = datas.data[i].row_sort;
            for (var j = dataTableTestUserDept.data.length -1; j >= 0; j--) {
                if (dataTableTestUserDept.data[j].row_sort == row_sort) {
                    dataTableTestUserDept.data.splice(j, 1)
                }
            }
        }
        /** 重置sort = index */
        for (var k = 0; k < dataTableTestUserDept.data.length; k++) {
            dataTableTestUserDept.data[k].row_sort = k;
        }

    }
    /** 根据sort 获取数据在 data 中的 索引 */
    function getDataIndexTestUserDept(row_sort) {
        for (var i = 0; i < dataTableTestUserDept.data.length; i++) {
            if (dataTableTestUserDept.data[i].row_sort == row_sort) {
                return i;
            }
        }
    }
    /** 监听行选中事件 */
    table.on('checkbox(dataTableTestUserDept)', function(obj){
        if (obj.type == 'all') {
            for (var i = 0; i < dataTableTestUserDept.data.length; i++) {
                dataTableTestUserDept.data[i].LAY_CHECKED = obj.checked;
            }
        } else if (obj.type == 'one') {
            var index = getDataIndexTestUserDept(obj.data.row_sort);
            dataTableTestUserDept.data[index].LAY_CHECKED = obj.checked;
        }
    });
    /** 监听列名、说明 修改事件 */
    table.on('edit(dataTableTestUserDept)', function (obj) {
        var row_sort = obj.data.row_sort;
        var key = obj.field;
        var value = obj.value;
        var index = getDataIndexTestUserDept(row_sort);
        dataTableTestUserDept.data[index][key] = value;
    });
    var dataTableTestUserSchool = {
        elem: '#dataTableTestUserSchool',
        id: 'dataTableTestUserSchool',
        title: '子表数据',
        cols: [[
            {type: 'numbers'},
            {type: 'checkbox'},
			{field: 'schoolName', sort: true, title: '学校名称', edit: 'text'},
			{field: 'type', sort: true, title: '学校类型', edit: 'text'},
			{field: 'year', sort: true, title: '入学年份', edit: 'text'},
			{field: 'address', sort: true, title: '详细地址', edit: 'text'},
        ]],
        data: [
        ],
        page: false,
        limit:30
    };
    table.render(dataTableTestUserSchool);
    admin.iframeAuto();

    /** 增加按钮监听 */
    $('#addBtnTestUserSchool').click(function () {
        var row_sort = dataTableTestUserSchool.data.length;
			dataTableTestUserSchool.data.push({ row_sort: row_sort,
			 name: '',
			 nickName: '',
			 age: '',
			 idNumber: '',
			 mobile: '',
			 createDate: '',
			 updateDate: '',
			 LAY_CHECKED: true});
        table.reload('dataTableTestUserSchool', dataTableTestUserSchool);
        admin.iframeAuto();
    });
    /** 删除按钮监听 */
    $('#delBtnTestUserSchool').click(function () {
        var checkStatus = table.checkStatus('dataTableTestUserSchool');
        if (checkStatus.data.length == 0) {
            layer.msg('请选择需要删除的数据');
        } else {
            layer.confirm('真的删除选中的数据么?', function(index){
                layer.close(index);
                delDataForTestUserSchool(checkStatus);
                table.reload('dataTableTestUserSchool', dataTableTestUserSchool);
                admin.iframeAuto();
            });
        }
    });
    /** 删除行 */
    function delDataForTestUserSchool(datas) {
        for (var i = 0; i < datas.data.length; i++) {
            var row_sort = datas.data[i].row_sort;
            for (var j = dataTableTestUserSchool.data.length -1; j >= 0; j--) {
                if (dataTableTestUserSchool.data[j].row_sort == row_sort) {
                    dataTableTestUserSchool.data.splice(j, 1)
                }
            }
        }
        /** 重置sort = index */
        for (var k = 0; k < dataTableTestUserSchool.data.length; k++) {
            dataTableTestUserSchool.data[k].row_sort = k;
        }

    }
    /** 根据sort 获取数据在 data 中的 索引 */
    function getDataIndexTestUserSchool(row_sort) {
        for (var i = 0; i < dataTableTestUserSchool.data.length; i++) {
            if (dataTableTestUserSchool.data[i].row_sort == row_sort) {
                return i;
            }
        }
    }
    /** 监听行选中事件 */
    table.on('checkbox(dataTableTestUserSchool)', function(obj){
        if (obj.type == 'all') {
            for (var i = 0; i < dataTableTestUserSchool.data.length; i++) {
                dataTableTestUserSchool.data[i].LAY_CHECKED = obj.checked;
            }
        } else if (obj.type == 'one') {
            var index = getDataIndexTestUserSchool(obj.data.row_sort);
            dataTableTestUserSchool.data[index].LAY_CHECKED = obj.checked;
        }
    });
    /** 监听列名、说明 修改事件 */
    table.on('edit(dataTableTestUserSchool)', function (obj) {
        var row_sort = obj.data.row_sort;
        var key = obj.field;
        var value = obj.value;
        var index = getDataIndexTestUserSchool(row_sort);
        dataTableTestUserSchool.data[index][key] = value;
    });
	/** form 提交 */
    form.on('submit(btnSubmit)', function (data) {
        var formData = {
           			id: data.field.id,
			name: data.field.name,
			nickName: data.field.nickName,
			age: data.field.age,
			idNumber: data.field.idNumber,
			mobile: data.field.mobile,
			createDate: data.field.createDate,
			updateDate: data.field.updateDate
        };
        var tableDataTestUserDept = [];
        for (var i = 0; i < dataTableTestUserDept.data.length; i++) {
                var item = {
                    					deptName: dataTableTestUserDept.data[i].deptName,
					deptCode: dataTableTestUserDept.data[i].deptCode,
					deptJob: dataTableTestUserDept.data[i].deptJob,
					createDate: dataTableTestUserDept.data[i].createDate,
					updateDate: dataTableTestUserDept.data[i].updateDate
                };
                tableDataTestUserDept.push(item);
        }
        console.log(tableDataTestUserDept);
        var tableDataTestUserSchool = [];
        for (var i = 0; i < dataTableTestUserSchool.data.length; i++) {
                var item = {
                    					schoolName: dataTableTestUserSchool.data[i].schoolName,
					type: dataTableTestUserSchool.data[i].type,
					year: dataTableTestUserSchool.data[i].year,
					address: dataTableTestUserSchool.data[i].address,
					createDate: dataTableTestUserSchool.data[i].createDate,
					updateDate: dataTableTestUserSchool.data[i].updateDate
                };
                tableDataTestUserSchool.push(item);
        }
        console.log(tableDataTestUserSchool);
        var ajax = new $ax(Feng.ctxPath + "/test/user/testUser/add", function (data) {
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
        ajax.set('testUserDeptMapList', tableDataTestUserDept);
        ajax.set('testUserSchoolMapList', tableDataTestUserSchool);
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
            var ajax = new $ax(Feng.ctxPath + "/test/user/testUser/edit", function (data) {
                var formData = {
           			 			        id: data.testUser.id,
			        name: data.testUser.name,
			        nickName: data.testUser.nickName,
			        age: data.testUser.age,
			        idNumber: data.testUser.idNumber,
			        mobile: data.testUser.mobile,
			        createDate: data.testUser.createDate,
			        updateDate: data.testUser.updateDate
                };
                form.val('dataForm', formData);
                var list = data.testUser.testUserDeptList;
                var arrayTestUserDept = [];
                for (var i = 0; i < list.length; i++) {
                    var item = {
                        row_sort: i,
												id: list[i].id,
						deptName: list[i].deptName,
						deptCode: list[i].deptCode,
						deptJob: list[i].deptJob,
						createDate: list[i].createDate,
						updateDate: list[i].updateDate
                    };
                    arrayTestUserDept.push(item);
                }
                dataTableTestUserDept.data = arrayTestUserDept;
                table.render(dataTableTestUserDept);
                var list = data.testUser.testUserSchoolList;
                var arrayTestUserSchool = [];
                for (var i = 0; i < list.length; i++) {
                    var item = {
                        row_sort: i,
												id: list[i].id,
						schoolName: list[i].schoolName,
						type: list[i].type,
						year: list[i].year,
						address: list[i].address,
						createDate: list[i].createDate,
						updateDate: list[i].updateDate
                    };
                    arrayTestUserSchool.push(item);
                }
                dataTableTestUserSchool.data = arrayTestUserSchool;
                table.render(dataTableTestUserSchool);
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