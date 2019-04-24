layui.use(['element', 'jquery'], function () {
    var element = layui.element
    element.on('nav', function (data) {
        var item = layui.$(this)
        var a = item.children('a').eq(0)
        var url = a.attr('href') + '?user=' + item.data('user') + '&type=' + item.data('type')
        a.attr('href', url)
    })
})
