<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>雷石软件加密狗管理</title>
  <link rel="stylesheet" href="{{ static_url('css/layui.css') }}">
  <link rel="stylesheet" href="{{ static_url('css/style.css') }}">
  {% block headcss %}{% end %}
  {% block headjs %}{% end %}
</head>
  <body class="layui-layout-body">
    {% block body %}
    {% end %}
  </body>
    <script src="{{ static_url('layui.js') }}"></script>
    <script src="{{ static_url('city.js') }}"></script>
{% block footjs %}
{% end %}
</html>
