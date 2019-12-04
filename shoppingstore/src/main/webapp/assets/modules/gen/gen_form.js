layui.use(['layer', 'form', 'admin', 'ax', 'table', 'element', 'layedit','upload'], function () {
    var $ = layui.jquery;
    var $ax = layui.ax;
    var form = layui.form;
    var admin = layui.admin;
    var layer = layui.layer;
    var table = layui.table;
    var element = layui.element;

    // 让当前iframe弹层高度适应
    admin.iframeAuto();

    var paramsId = Feng.getUrlParam('id');

    //执行一个 table 实例
    var dataTable = {
        elem: '#dataTable',
        id: 'dataTable',
        title: '数据表',
        cols: [[ //表头
            {type: 'numbers'},
            {type: 'checkbox'},
            {field: 'id', title: '编号', hide: true},
            {field: 'colname', title: '列名', edit: 'text', width: 200},
            {field: 'des', title: '说明', edit: 'text'},
            {field: 'type', title: '物理类型', templet: '#dataTable_type', width: 300},
            {field: 'sort', title: '排序', edit: 'text', width: 50},
            {field: 'isPk', title: '主键', templet: '#dataTable_isPk', width: 50},
            {field: 'isNull', title: '可空', templet: '#dataTable_isNull', width: 50},
            {field: 'isInsert', title: '插入', templet: '#dataTable_isInsert', width: 50},
            {field: 'isEdit', title: '编辑', templet: '#dataTable_isEdit', width: 50}
        ]],
        data: [
            {row_sort: 0, colname: 'id', des: 'ID', type: 'varchar(64)', isPk: 1, isNull: 0, isInsert: 1, isEdit: 0,sort:1},
            {row_sort: 1, colname: 'create_date', des: '创建时间', type: 'datetime(0)', isPk: 0, isNull: 1, isInsert: 1, isEdit: 0,sort:101},
            {row_sort: 2, colname: 'update_date', des: '修改时间', type: 'datetime(0)', isPk: 0, isNull: 1, isInsert: 0, isEdit: 1,sort:102},
            {row_sort: 3, colname: 'del_flag', des: '删除标记', type: 'int(1)', isPk: 0, isNull: 0, isInsert: 0, isEdit: 0,sort:103},
        ],
        page: false,
        limit:30
    };

    var columnTable = {
        elem: '#columnTable',
        id: 'columnTable',
        title: '数据表',
        cols: [[
            {type: 'numbers'},
            {type: 'checkbox'},
            {field: 'colname', title: '列名', width: 100},
            {field: 'javaType', title: 'Java类型', templet: '#dataTable_javaType', width: 200},
            {field: 'javaField', title: 'JAVA字段名', edit: 'text'},
            {field: 'isList', title: '列表', templet: '#dataTable_isList', width: 50},
            {field: 'isQuery', title: '查询', templet: '#dataTable_isQuery', width: 50},
            {field: 'queryType', title: '查询匹配方式', templet: '#dataTable_queryType', width: 200},
            {field: 'showType', title: '显示表单类型', templet: '#dataTable_showType', width: 200},
            {field: 'dictType', title: '字典类型', edit: 'text', width: 100}
        ]],
        data: [
            {row_sort: 0, colname: 'id', javaType: 'String', javaField: 'id', isList: 0, isQuery: 0, queryType: '', showType: '',dictType:''},
            {row_sort: 1, colname: 'create_date', javaType: 'java.util.Date', javaField: 'createDate', isList: 1, isQuery: 0, queryType: '', showType: '',dictType:''},
            {row_sort: 2, colname: 'update_date', javaType: 'java.util.Date', javaField: 'updateDate', isList: 1, isQuery: 0, queryType: '', showType: '',dictType:''},
            {row_sort: 3, colname: 'del_flag', javaType: 'Integer', javaField: 'delFlag', isList: 0, isQuery: 0, queryType: '', showType: '',dictType:'DEL_FLAG'},
        ],
        page: false,
        limit:30
    };

    table.render(dataTable);
    table.render(columnTable);
    admin.iframeAuto();

    // 增加按钮监听
    $('#addBtn').click(function () {
        var row_sort = dataTable.data.length;
        dataTable.data.push({ row_sort: row_sort, colname: '', des: '', type: 'varchar(64)', isPk: 0, isNull: 0,sort:0, isInsert: 1, isEdit: 1, LAY_CHECKED: true});
        columnTable.data.push({ row_sort: row_sort, colname: '', javaType: 'String', javaField: '', isList: 1, isQuery: 0, queryType: '', showType: '', dictType: '', LAY_CHECKED: true});
        table.reload('dataTable', dataTable);
        table.reload('columnTable', columnTable);
        admin.iframeAuto();
    });
    // 删除按钮监听
    $('#delBtn').click(function () {
        var checkStatus = table.checkStatus('dataTable');
        if (checkStatus.data.length == 0) {
            layer.msg('请选择需要删除的数据');
        } else {
            layer.confirm('真的删除选中的数据么?', function(index){
                layer.close(index);
                delDataForCheckDatas(checkStatus);
                table.reload('dataTable', dataTable);
                table.reload('columnTable', columnTable);
                admin.iframeAuto();
            });
        }
    });
    // 删除行
    function delDataForCheckDatas(datas) {
        for (var i = 0; i < datas.data.length; i++) {
            var row_sort = datas.data[i].row_sort;
            for (var j = dataTable.data.length -1; j >= 0; j--) {
                if (dataTable.data[j].row_sort == row_sort) {
                    dataTable.data.splice(j, 1)
                }
            }
            for (var j = columnTable.data.length -1; j >= 0; j--) {
                if (columnTable.data[j].row_sort == row_sort) {
                    columnTable.data.splice(j, 1)
                }
            }
        }
        // 重置sort = index
        for (var k = 0; k < dataTable.data.length; k++) {
            dataTable.data[k].row_sort = k;
        }

    }
    /**
     * 根据sort 获取数据在 data 中的 索引
     * @param sort
     * @returns {number}
     */
    function getDataIndex(row_sort) {
        for (var i = 0; i < dataTable.data.length; i++) {
            if (dataTable.data[i].row_sort == row_sort) {
                return i;
            }
        }
    }
    // 监听行选中事件
    table.on('checkbox(dataTable)', function(obj){
        if (obj.type == 'all') {
            for (var i = 0; i < dataTable.data.length; i++) {
                dataTable.data[i].LAY_CHECKED = obj.checked;
            }
        } else if (obj.type == 'one') {
            var index = getDataIndex(obj.data.row_sort);
            dataTable.data[index].LAY_CHECKED = obj.checked;
        }
    });
    // 监听列名 / 说明 修改事件
    var dataTableName = ''
    table.on('edit(dataTable)', function (obj) {
        var row_sort = obj.data.row_sort;
        var key = obj.field;
        var value = obj.value;
        var index = getDataIndex(row_sort);
        dataTable.data[index][key] = value;
        if(key == 'colname'){
            dataTableName = value;
            columnTable.data[index][key] = dataTableName; // 页面属性--列名
            columnTable.data[index].javaField = camelCase(dataTableName); // 页面属性--JAVA字段名
            table.reload('columnTable', columnTable);
        }
    });
    // 监听列名 / 说明 修改事件
    table.on('edit(columnTable)', function (obj) {
       var row_sort = obj.data.row_sort;
       var key = obj.field;
       var value = obj.value;
       var index = getDataIndex(row_sort);
       columnTable.data[index][key] = value;
    });

    // 监听主键选中事件
    form.on('checkbox(dataTable_isPk)', function (obj) {
        var row_sort = obj.elem.name;
        var index = getDataIndex(row_sort);
        var value = obj.elem.checked ? 1 : 0;
        dataTable.data[index].isPk = value;
    });
    // 监听可空选中事件
    form.on('checkbox(dataTable_isNull)', function (obj) {
        var row_sort = obj.elem.name;
        var index = getDataIndex(row_sort);
        var value = obj.elem.checked ? 1 : 0;
        dataTable.data[index].isNull = value;
    });
    // 监听插入选中事件
    form.on('checkbox(dataTable_isInsert)', function (obj) {
        var row_sort = obj.elem.name;
        var index = getDataIndex(row_sort);
        var value = obj.elem.checked ? 1 : 0;
        dataTable.data[index].isInsert = value;
    });
    // 监听编辑选中事件
    form.on('checkbox(dataTable_isEdit)', function (obj) {
        var row_sort = obj.elem.name;
        var index = getDataIndex(row_sort);
        var value = obj.elem.checked ? 1 : 0;
        dataTable.data[index].isEdit = value;
    });

    // 监听Java类型选中事件
    form.on('select(dataTable_javaType)', function (obj) {
        var value = obj.value;
        var row_sort = obj.elem.name;
        var index = getDataIndex(row_sort);
        columnTable.data[index].javaType = value;
        console.log(columnTable.data[index].javaType)
    });
    // 监听列表选中事件
    form.on('checkbox(dataTable_isList)', function (obj) {
        var row_sort = obj.elem.name;
        var index = getDataIndex(row_sort);
        var value = obj.elem.checked ? 1 : 0;
        columnTable.data[index].isList = value;
    });
    // 监听列表选中事件
    form.on('checkbox(dataTable_isQuery)', function (obj) {
        var row_sort = obj.elem.name;
        var index = getDataIndex(row_sort);
        var value = obj.elem.checked ? 1 : 0;
        columnTable.data[index].isQuery = value;
    });
    // 监听查询匹配方式选中事件
    form.on('select(dataTable_queryType)', function (obj) {
        var value = obj.value;
        var row_sort = obj.elem.name;
        var index = getDataIndex(row_sort);
        columnTable.data[index].queryType = value;
        console.log(columnTable.data[index].queryType)
    });
    // 监听显示表单类型选中事件
    form.on('select(dataTable_showType)', function (obj) {
        var value = obj.value;
        var row_sort = obj.elem.name;
        var index = getDataIndex(row_sort);
        columnTable.data[index].showType = value;
        console.log(columnTable.data[index].showType)
    });
    // 监听字典类型选中事件
    form.on('select(dataTable_dictType)', function (obj) {
        var value = obj.value;
        var row_sort = obj.elem.name;
        var index = getDataIndex(row_sort);
        columnTable.data[index].dictType = value;
        console.log(columnTable.data[index].dictType)
    });

    /**
     * 保存
     */
    form.on('submit(dataForm)', function (data) {
        var checked = check(data);
        if(checked != '0'){
            layer.msg(checked);
            return false;
        }else{
            var formData = {
                className: data.field.className,
                comments: data.field.comments,
                name: data.field.name,
                parentTableFk: data.field.parentTableFk,
                tableType: data.field.tableType,
                genIdType: data.field.genIdType,
                parentTable: data.field.mainTableName
            };
            // 获取物理类型input的value存入数组
            var inputValue = document.getElementsByClassName('HandoverCompany');
            var valInputValue = []
            for (var j = 0; j < inputValue.length; j++) {
                valInputValue.push($(inputValue[j]).val());
            }
            var tableData = [];
            for (var i = 0; i < dataTable.data.length; i++) {
                dataTable.data[i].type = valInputValue[i];
                var item = {
                    id: dataTable.data[i].id,
                    sort: dataTable.data[i].sort,
                    name: dataTable.data[i].colname,
                    comments: dataTable.data[i].des,
                    jdbcType: dataTable.data[i].type,
                    javaType: columnTable.data[i].javaType,
                    javaField: columnTable.data[i].javaField,
                    isList: columnTable.data[i].isList,
                    isQuery: columnTable.data[i].isQuery,
                    queryType: columnTable.data[i].queryType,
                    showType: columnTable.data[i].showType,
                    dictType: columnTable.data[i].dictType,
                    isNull: dataTable.data[i].isNull,
                    isInsert: dataTable.data[i].isInsert,
                    isPk: dataTable.data[i].isPk,
                    isEdit: dataTable.data[i].isEdit
                };
                tableData.push(item);
            }
            var ajax = new $ax(Feng.ctxPath + "/gen/save", function (data) {
                if(data.code === 0){
                    Feng.success('保存成功!');
                    /**传给上个页面，刷新table用 */
                    admin.putTempData('formOk', true);
                    admin.closeThisDialog();
                }else{
                    Feng.error(data.msg);
                }
            }, function (data) {
                Feng.error(data.msg);
            });
            ajax.set('columnListMap', tableData);
            ajax.set('id', paramsId);
            for (var key in formData) {
                ajax.set(key, formData[key]);
            }
            ajax.start();
        }
    });

    /**
     * 校验参数
     * @param data
     */
    function check(data){
        var reg = new RegExp(/^[a-zA-Z][a-zA-Z0-9_]/g);
        var name = data.field.name;
        var tableType = data.field.tableType;
        var comments = data.field.comments;
        if(!reg.test(name)){
            return '表名格式错误!';
        }
        if(name != '' && name != undefined && name.length > 64){
            return '表名长度不能超过64个字符!';
        }
        if(tableType == '' || tableType == undefined){
            return '表类型不能为空!';
        }
        if(comments == '' || comments == undefined){
            return '表说明不能为空!';
        }
        var typeReg = new RegExp(/^[A-Z][a-zA-Z0-9]/g)
        if(!typeReg.test(data.field.className)){
            return '类名格式错误!';
        }
        var genIdType = data.field.genIdType;
        if(genIdType == '' || genIdType == undefined){
            return '主键类型不能为空!';
        }
        var hasPk = false;
        for (var i = 0; i < dataTable.data.length; i++) {
            var name = dataTable.data[i].colname;
            var regName = new RegExp(/^[a-z][a-zA-Z0-9_]/g);
            if(!regName.test(name)){
                return '列名' + name + '格式错误!';
            }
            /** 判断是否存在主键 */
            if(dataTable.data[i].isPk == '1'){
                hasPk = true;
            }
            /** 判断物理类型是否为空 */
            var jdbcType = dataTable.data[i].type;
            if(jdbcType == '' || jdbcType == undefined){
                return '列名：' + name + '，请选择物理类型!';
            }
            /** 判断Java类型是否为空 */
            var javaType = columnTable.data[i].javaType;
            if(javaType == '' || javaType == undefined){
                return '列名：' + name + '，请选择Java类型!';
            }
            /** 判断Java字段名是否为空 */
            var javaField = columnTable.data[i].javaField;
            var javaFieldReg = new RegExp(/^[a-z][a-zA-Z0-9]/g);
            if(javaField == '' || javaField == undefined){
                return '列名：' + name + '，请输入Java字段名!';
            }
            if(!javaFieldReg.test(javaField)){
                return '列名' + name + 'Java字段名格式错误!';
            }
        }
        /** 必须设置主键 */
        if(!hasPk){
            return '请设置主键!';
        }
        return '0';
    }

    /**
     * 设置主表表名下拉选项，并填充修改时的数据
     */
    function setMainTableNameData() {
        var ajax = new $ax(Feng.ctxPath + "/gen/getTablelist", function (res) {
            for (var i = 0; i < res.data.length; i++) {
                var name = res.data[i].name;
                $('select[name=mainTableName]').append('<option value="'+name+'">'+name+'</option>');
            }
            form.render('select', 'dataForm')
            if (paramsId) {
                console.log('编辑');
                var ajax = new $ax(Feng.ctxPath + "/gen/gen_edit", function (r) {
                    var gen = r.gen;
                    var formData = {
                        className: gen.className,
                        comments: gen.comments,
                        name: gen.name,
                        parentTableFk: gen.parentTableFk,
                        tableType: gen.tableType,
                        genIdType: gen.genIdType,
                        mainTableName: gen.parentTable
                    };
                    form.val('dataForm', formData);
                    var genColumn = r.genColumn;
                    var array = [];
                    var array2 = [];
                    for (var i = 0; i < genColumn.length; i++) {
                        var item = {
                            row_sort: i,
                            id: genColumn[i].id,
                            colname: genColumn[i].name,
                            des: genColumn[i].comments,
                            type: genColumn[i].jdbcType,
                            isNull: genColumn[i].isNull,
                            isInsert: genColumn[i].isInsert,
                            isPk: genColumn[i].isPk,
                            sort: genColumn[i].sort,
                            isEdit: genColumn[i].isEdit
                        };
                        var item2 = {
                            row_sort: i,
                            colname: genColumn[i].name,
                            javaType: genColumn[i].javaType,
                            javaField: genColumn[i].javaField,
                            isList: genColumn[i].isList,
                            queryType: genColumn[i].queryType,
                            isQuery: genColumn[i].isQuery,
                            showType: genColumn[i].showType,
                            dictType: genColumn[i].dictType
                        };
                        array.push(item);
                        array2.push(item2);
                    }
                    console.log(array2);
                    dataTable.data = array;
                    table.render(dataTable);
                    columnTable.data = array2;
                    table.render(columnTable);
                }, function (data) {
                    Feng.error("获取数据失败!" + data.msg + "!");
                });
                ajax.set('genTableId', paramsId);
                ajax.start();
            } else {
                console.log('添加');
            }
        }, function (data) {
        });
        ajax.start();
    }

    setMainTableNameData();

    /**
     * 下划线转驼峰
     */
    function camelCase(string){
        return string.replace( /_([a-z])/g, function( all, letter ) {
            return letter.toUpperCase();
        });
    }
    window.typeChange = function(id){
        console.log(id);
        var value = $('#type_' + id).val();
        dataTable.data[id].type = value;
        console.log(dataTable.data[id].type)
    }

    // 监听物理类型选中事件
    form.on('select(dataTable_type)', function (obj) {
        var value = obj.value;
        var row_sort = obj.elem.name;
        var index = getDataIndex(row_sort);
        dataTable.data[index].type = value;
        $("#type_" + index).val(value);
        var inputData = document.getElementsByClassName('HandoverCompany');
        for (var i = 0; i < inputData.length; i++) {
            inputData[i].index = i;
            if (inputData[i].index == row_sort) {
                var valData = inputData[i]
                $(valData).val(dataTable.data[index].type)
            } else {}
        }
        console.log(dataTable.data[index].type)
    });
});
