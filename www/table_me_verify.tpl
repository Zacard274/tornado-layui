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

  table .layui-input-date {
    padding: 2px;
    width: 100%;
  }
</style>
{% end%}

{% block headjs %}
<script type="text/html" id="dateTime">
  <input type="text" class="layui-input-date" placeholder="请选择时间" />
</script>
<script type="text/html" id="edit">
  <a class="layui-btn layui-btn-xs" lay-event="detail">通过</a>
  <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">驳回</a>
</script>
{% end %}

{% block body %}
    <div class="layui-body-item">
    <div class="layui-tab">
        <ul class="layui-tab-title">
        <li class="layui-this">认证授权</li>
        <li class="">90后授权</li>
        </ul>
    </div>
    <div class="layui-tab-content">
        <table class="layui-table" lay-data="{url:'/demo/table/user/', page:true, limit: 10, id:'meVerify'}" lay-filter="meVerify">
            <thead>
                <tr>
                <th lay-data="{field: 'address'}">城市</th>
                <th lay-data="{field: 'ktv_name'}">KTV名称</th>
                <th lay-data="{field: 'store_name'}">分店名称</th>
                <th lay-data="{field: 'box_num'}">机顶盒点数</th>
                <th lay-data="{field: 'server_num'}">服务器点数</th>
                <th lay-data="{field: 'status'}">申请时间</th>
                <th lay-data="{fixed: 'right', align: 'center', toolbar: '#dateTime'}">到期时间</th>
                <th lay-data="{fixed: 'right', align: 'center, toolbar: '#edit'}">审核</th>
                </tr>
            </thead>
        </table>
    </div>
    </div>
{% end %}

{% block footjs %}

<script>

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
