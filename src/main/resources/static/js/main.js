$(function () {
    $('#employeeDlg form').submit(function (e) {
        e.preventDefault();
        var $this = $(this);
        if(!$this.form('validate')){
            $.messager.show({
                title: '我的消息',
                msg: '请输入合法数据在提交。',
                timeout: 5000,
                showType: 'slide'
            });
            return;
        }
        $.ajax({
            url: $this.prop('action'),
            data: $this.serialize(),
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
                $('#employeeDlg').dialog('close');
                $('#employeeDlg form').form('clear');
                $('#mainFrame').contents('#employeeGrid').datagrid('reload');
            }
        });
    });
});