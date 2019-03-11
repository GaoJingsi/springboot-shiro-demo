#set( $D = '$' )

var ${template} = {
    search: function (e) {
        var data = ${D}('#searchForm').serializeJSON();
        ${D}('#${template}Grid').datagrid('reload', data);
    },
    edit: function (e) {
        var selected = ${D}('#${template}Grid').datagrid('getSelected');
        if (!selected) {
            ${D}.messager.show({
                title: '我的消息',
                msg: '请您选择一行数据，再进行修改。',
                timeout: 5000,
                showType: 'slide'
            });
            return;
        }
        parent.${D}('#${template}Dlg').dialog({
            onOpen: function () {
                parent.${D}('#${template}Dlg form').form('load', selected);
            },
            onBeforeClose: function () {
                parent.${D}('#${template}Dlg form').form('clear');
                ${D}('#${template}Grid').datagrid('reload');
            }
        });
        parent.${D}('#${template}Dlg').dialog('center').dialog('open');
    },
    add: function (e) {
        parent.${D}('#${template}Dlg').dialog({
            onOpen: function () {
                parent.${D}('#${template}Dlg form').form('clear');
            },
            onBeforeClose: function () {
                parent.${D}('#${template}Dlg form').form('clear');
                ${D}('#${template}Grid').datagrid('reload');
            }
        });
        parent.${D}('#${template}Dlg').dialog('center').dialog('open');
    },
    del: function (e) {
        var selected = ${D}('#${template}Grid').datagrid('getSelected');
        if (!selected) {
            ${D}.messager.show({
                title: '我的消息',
                msg: '请您选择一行数据，再进行删除。',
                timeout: 5000,
                showType: 'slide'
            });
            return;
        }
        ${D}.messager.confirm('确认', '您确认想要删除记录吗？', function (r) {
            if (r) {
                ${D}.ajax({
                    url: ctxPath + 'management/${template}/delete',
                    data: {id: selected.id},
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        ${D}.messager.show({
                            title: '我的消息',
                            msg: data.msg,
                            timeout: 5000,
                            showType: 'slide'
                        });
                    },
                    error: function (xhr) {
                        ${D}.messager.show({
                            title: '我的消息',
                            msg: xhr.responseText,
                            timeout: 5000,
                            showType: 'slide'
                        });
                    },
                    complete: function (xhr) {
                        ${D}('#${template}Grid').datagrid('reload');
                    }
                });
            }
        });

    }
};

${D}(function () {
    //查询员工信息，绑定到datagrid。
    ${D}('#${template}Grid').datagrid({
        url: ctxPath + 'management/${template}/get${template}s',
        columns: [[
            {
                field: 'headImage', title: '用户头像', formatter: function (data) {
                    if (data) {
                        return '<img src="' + ctxPath + data.substring(1) + '" width="60"/>';
                    }
                }
            },
            {field: 'username', title: '用户名'},
            {field: 'email', title: '电子邮箱'},
            {field: 'age', title: '年龄'},
            {
                field: 'department', title: '所在部门', formatter: function (data) {
                    if (data) {
                        return data.name;
                    }
                }
            }
        ]],
        method: 'post',
        fit: true,
        fitColumns: true,
        pagination: true,
        pageSize: 40,
        pageList: [40, 80, 120, 160, 200],
        toolbar: '#toolbar',
        fixed: true,
        singleSelect: true
    });

    //点击按钮，调用该按钮data-method里相应的方法
    ${D}('[data-method]').click(function (e) {
        ${template}[${D}(this).data('method')](this);
    });
});