{% extends 'base.tpl' %}

{% block headcss %}
    <link rel="stylesheet" href="{{ static_url('css/style.css') }}">
{% end %}

{% block headjs %}
{% end %}


{% block body %}
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">雷石软件加密狗系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right" lay-filter="navBar">
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
          <li class="layui-nav-item layui-this layui-nav-itemed" data-user=module data-type="new">
            <a href="/agent/create" target="iframe_a">创建新项目</a>
          </li>
          <li class="layui-nav-item" data-user=module data-type="boss">
            <a href="/agent/business_check" target="iframe_a">待总部审核项目</a>
          </li>
          <li class="layui-nav-item" data-user=module data-type="me">
            <a href="javascript:;" target="iframe_a">待我审核项目</a>
          </li>
          <li class="layui-nav-item" data-user=module data-type="history">
            <a href="javascript:;" target="iframe_a">历史项目</a>
          </li>
        {% end %}
        {% if module == 'business' %}
          <li class="layui-nav-item layui-this layui-nav-itemed" data-user=module data-type="new">
            <a href="javascript:;" target="iframe_a">创建新项目</a>
          </li>
          <li class="layui-nav-item" data-user=module data-type="boss">
            <a href="javascript:;" target="iframe_a">待总部审核项目</a>
          </li>
          <li class="layui-nav-item" data-user=module data-type="me">
            <a href="javascript:;" target="iframe_a">待我审核项目</a>
          </li>
          <li class="layui-nav-item" data-user=module data-type="history">
            <a href="javascript:;" target="iframe_a">历史项目</a>
          </li>
        {% end %}
        {% if module == 'sales' %}
          <li class="layui-nav-item layui-this layui-nav-itemed" data-user=module data-type="new">
            <a href="javascript:;" target="iframe_a">创建新项目</a>
          </li>
          <li class="layui-nav-item" data-user=module data-type="boss">
            <a href="javascript:;" target="iframe_a">待总部审核项目</a>
          </li>
          <li class="layui-nav-item" data-user=module data-type="me">
            <a href="javascript:;" target="iframe_a">待我审核项目</a>
          </li>
          <li class="layui-nav-item" data-user=module data-type="history">
            <a href="javascript:;" target="iframe_a">历史项目</a>
          </li>
        {% end %}
        {% if module == 'super' %}
          <li class="layui-nav-item layui-this layui-nav-itemed" data-user=module data-type="new">
            <a href="javascript:;" target="iframe_a">创建新项目</a>
          </li>
          <li class="layui-nav-item" data-user=module data-type="boss">
            <a href="javascript:;" target="iframe_a">待总部审核项目</a>
          </li>
          <li class="layui-nav-item" data-user=module data-type="me">
            <a href="javascript:;" target="iframe_a">待我审核项目</a>
          </li>
          <li class="layui-nav-item" data-user=module data-type="history">
            <a href="javascript:;" target="iframe_a">历史项目</a>
          </li>
        {% end %}
      </ul>
    </div>
  </div>

  <div class="layui-body">
    <!-- 内容主体区域 -->
    {% if module == 'agent' %}
      <iframe src="/agent/create" name="iframe_a" frameborder="0" width="100%" height="100%">
      </iframe>
    {% end %}
  </div>
</div>
{% end %}


{% block footjs %}
<script src="{{ static_url('index.js') }}"></script>
{% end %}
