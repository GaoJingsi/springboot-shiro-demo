var employee = {
    search: function (e) {
        var data = $('#searchForm').serializeJSON();
        $('#employeeGrid').datagrid('reload', data);
    },
    edit: function (e) {
        var selected = $('#employeeGrid').datagrid('getSelected');
        if (!selected) {
            $.messager.show({
                title: '我的消息',
                msg: '请您选择一行数据，再进行修改。',
                timeout: 5000,
                showType: 'slide'
            });
            return;
        }
        parent.$('#employeeDlg').dialog({
            onOpen: function () {
                parent.$('#employeeDlg form').find('#id').val(selected.id);
                parent.$('#employeeDlg form').find('#headImage').val(selected.headImage);
                parent.$('#employeeDlg form').find('#username').textbox('setValue', selected.username);
                parent.$('#employeeDlg form').find('#password').textbox('setValue', selected.password);
                parent.$('#employeeDlg form').find('#confirmPassword').textbox('setValue', selected.password);
                parent.$('#employeeDlg form').find('#email').textbox('setValue', selected.email);
                parent.$('#employeeDlg form').find('#age').numberbox('setValue', selected.age);
                parent.$('#employeeDlg form').find('#departmentId').combobox('select', selected.department.id);
                parent.$('#employeeDlg form').form('load', {"departmentId": selected.department.id});
            },
            onBeforeClose: function () {
                parent.$('#employeeDlg form').form('clear');
                $('#employeeGrid').datagrid('reload');
            }
        });
        parent.$('#employeeDlg').dialog('center').dialog('open');
    },
    add: function (e) {
        parent.$('#employeeDlg').dialog({
            onOpen: function () {
                parent.$('#employeeDlg form').form('clear');
            },
            onBeforeClose: function () {
                parent.$('#employeeDlg form').form('clear');
                $('#employeeGrid').datagrid('reload');
            }
        });
        parent.$('#employeeDlg').dialog('center').dialog('open');
    },
    del: function (e) {
        var selected = $('#employeeGrid').datagrid('getSelected');
        if (!selected) {
            $.messager.show({
                title: '我的消息',
                msg: '请您选择一行数据，再进行删除。',
                timeout: 5000,
                showType: 'slide'
            });
            return;
        }
        $.messager.confirm('确认', '您确认想要删除记录吗？', function (r) {
            if (r) {
                $.ajax({
                    url: ctxPath + 'management/employee/delete',
                    data: {id: selected.id},
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        $.messager.show({
                            title: '我的消息',
                            msg: data.msg,
                            timeout: 5000,
                            showType: 'slide'
                        });
                    },
                    error: function (xhr) {
                        $.messager.show({
                            title: '我的消息',
                            msg: xhr.responseText,
                            timeout: 5000,
                            showType: 'slide'
                        });
                    },
                    complete: function (xhr) {
                        $('#employeeGrid').datagrid('reload');
                    }
                });
            }
        });

    }
};

$(function () {
    //查询员工信息，绑定到datagrid。
    $('#employeeGrid').datagrid({
        url: ctxPath + 'management/employee/getemployees',
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
    $('[data-method]').click(function (e) {
        employee[$(this).data('method')](this);
    });
});