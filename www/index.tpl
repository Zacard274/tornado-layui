<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>雷石软件加密狗管理</title>
  <link rel="stylesheet" href="{{ static_url('css/layui.css') }}">
  {% block headjs %}
  {% end %}
  {% block head %}{% end %}
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">雷石软件加密狗系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          {{ user }}
        </a>
      </li>
      <li class="layui-nav-item"><a href="/logout">退了</a></li>
    </ul>
  </div>

  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        {% if module == 'agent' %}

        {% end %}
        {% if module == 'business' %}

        {% end %}
        {% if module == 'sales' %}

        {% end %}
        {% if module == 'super' %}

        {% end %}
      </ul>
    </div>
  </div>

  <div class="layui-body">
    <!-- 内容主体区域 -->

  </div>

</div>
<script>

</script>
</body>
<script src="{{ static_url('layui.js') }}"></script>
</html>
