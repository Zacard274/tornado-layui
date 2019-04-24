{% extends 'base.tpl' %}


{% block headcss %}
<style>
  .layui-tab-title {
    border-bottom: 0;
    padding: 10px;
    box-sizing: border-box;
    width: 100%;
  }

  .layui-tab-title li {
    width: 50%;
    padding: 0;
    background: #eee;
    color: #000;
  }

  .layui-tab-title .layui-this {
    background: #009688;
    color: #fff;
  }

  .layui-div-search {
    width: 60%;
    margin: 0 auto;
    text-align: center;
    font-size: 16px;
  }

  .layui-div-search label {
    display: inline-block;
    vertical-align: middle;
  }

  .layui-div-search::after {
    display: inline-block;
    content: "";
    height: 100%;
    width: 0;
    vertical-align: middle;
  }

  .layui-div-search input {
    width: 50%;
    margin: 0 20px;
    padding: 4px 0;
    min-width: 150px;
    vertical-align: middle;
  }
</style>
{% end %}


{% block body %}
     <div class="layui-div-search">
        <label for="">KTVID</label>
        <input type="text" placeholder="请输入KTVID"/>
        <a class="layui-btn layui-btn-sm">搜索</a>
    </div>
    <div class="layui-tab">
        <ul class="layui-tab-title">
        <li class="layui-this">认证授权</li>
        <li class="">90后授权</li>
        </ul>
    </div>
    <div class="layui-tab-content">
        <table id="history" lay-filter="history-manage">
        </table>
    </div>
{% end %}


{% block footjs %}

<script>
// table 表格
layui.use('table', function () {
    var table = layui.table
    // 我审核
    table.render({
        elem: '#meVerify',
        data: listData,
        page: true,
        limit: 10,
        cols: [[
            {field: 'address', title: '城市'},
            {field: 'ktv_name', title: 'KTV名称'},
            {field: 'store_name', title: '分店名称'},
            {field: 'box_num', title: '机顶盒点数'},
            {field: 'server_num', title: '服务器点数'},
            {field: 'status', title: '申请时间'},
            {fixed: 'right', align: 'center', title: '到期时间', toolbar: '#dateTime'},
            {fixed: 'right', align: 'center', title: '审核', toolbar: '#edit'}
        ]]
    })
})

layui.use(['laydate', 'jquery'], function (e) {
    var laydate = layui.laydate
    var min = getToday()

    layui.$('.layui-input-date').each(function (e) {
        laydate.render({
            elem: '#' + layui.$(this).attr('id'),
            format: 'yyyy.MM.dd',
            calendar: true,
            min: min,
            done: function (val, date, endDate) {
                layui.$(this).val(val)
            }
        })
    })
})

function getToday () {
    var now = new Date()
    var y = now.getFullYear()
    var m = now.getMonth() + 1
    var d = now.getDate()
    return y + '-' + m + '-' + d
}
</script>

{% end %}
