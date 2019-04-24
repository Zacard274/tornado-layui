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
</style>
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
            <table class="layui-table">
                <thead>
                    <tr>
                    <th>城市</th>
                    <th>KTV名称</th>
                    <th>分店名称</th>
                    <th>审核状态</th>
                    <th>到期时间</th>
                    </tr>
                </thead>
                <tbody>
                    {% for item in items %}
                    <tr>
                    <td>{{ item['address'] }}</td>
                    <td>{{ item['ktv_name'] }}</td>
                    <td>{{ item['store_name'] }}</td>
                    <td>{{ item['status'] }}</td>
                    <td><input type="text" class="layui-input-date" id={{ 'date' + item['id'] }} data-id={{ item['id'] }} placeholder="请选择时间" /></td>
                    </tr>
                    {% end%}
                </tbody>
            </table>
            {% module PageModule(page, page_total, base_url='/agent/business_check?page=') %}
            结果共: {{ total }}条
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

// <table class="layui-table" lay-data="{url:'/demo/table/user/', page:true, limit: 10, id:'bossVerify'}" lay-filter="bossVerify">
// <th lay-data="{field: 'address'}">城市</th>
// <th lay-data="{field: 'ktv_name'}">KTV名称</th>
// <th lay-data="{field: 'store_name'}">分店名称</th>
// <th lay-data="{field: 'status'}">审核状态</th>
</script>
{% end %}
