$(function () {
    /**
     * 绑定左侧菜单的数据
     */
    $('#menu').tree({
        url: ctxPath + 'management/getmenudata',
        method: 'post',
        onClick: function (node) {
            if (node.url) {
                if ($('#mainTabs').tabs('exists', node.text)) {
                    $('#mainTabs').tabs('select', node.text);
                } else {
                    $('#mainTabs').tabs('add', {
                        title: node.text,
                        selected: true,
                        content: '<iframe frameborder="0" scrolling="no" src="' + node.url + '" style="width: 100%;height: 100%;" id="mainFrame"></iframe>',
                        closable: true
                    });
                }
            }
        }
    });
});