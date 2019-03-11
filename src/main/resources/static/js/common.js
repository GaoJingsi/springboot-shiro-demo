// extend the 'equals' rule
$.extend($.fn.validatebox.defaults.rules, {
    equals: {
        validator: function (value, param) {
            return value == $(param[0]).val();
        },
        message: '两次输入不一致。'
    },
    isUsernameUnique: {
        validator: function (value, param) {
            if($('#employeeDlg form #id').val()){
                return true;
            }
            var isUnique = false;
            $.ajax({
                url: ctxPath + 'management/employee/isusernameunique',
                data: {username: value},
                type: 'post',
                dataType: 'json',
                async: false,
                success: function (data) {
                    if (data.success === true) {
                        isUnique = data.msg;
                    } else {
                        $.messager.show({
                            title: '我的消息',
                            msg: data.msg,
                            timeout: 5000,
                            showType: 'slide'
                        });
                    }
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

                }
            });
            return isUnique;
        },
        message: '用户名重复。'
    }
});