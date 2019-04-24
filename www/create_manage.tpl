 {% extends 'base.tpl' %}

{% block body %}
    <form class="layui-form">
        <div class="layui-form-box">
            <div class="layui-form-item">
                <label class="layui-form-label">国家:</label>
                <div class="layui-input-block">
                    <select name="country" data-pid=0 lay-verify="required" lay-filter="country">
                    <option value="">请选择一个国家</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">省:</label>
            <div class="layui-input-block">
                <select name="province" data-pid=0 lay-verify="required" lay-filter="province">
                <option value="">请选择一个省份</option>
                </select>
            </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">市:</label>
            <div class="layui-input-block">
                <select name="city" lay-verify="required" lay-filter="city">
                <option value="">请选择一个城市</option>
                </select>
            </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">县区:</label>
            <div class="layui-input-block">
                <select name="area" lay-verify="required" lay-filter="area">
                <option value="">请选择一个县区</option>
                </select>
            </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">KTV名称:</label>
            <div class="layui-input-block">
                <input type="text" name="title" required  lay-verify="required" placeholder="请输入KTV名称" autocomplete="off" class="layui-input">
            </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">分店名称:</label>
            <div class="layui-input-block">
                <input type="text" name="title" required  lay-verify="required" placeholder="请输入分店名称" autocomplete="off" class="layui-input">
            </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">机顶盒点数:</label>
            <div class="layui-input-block">
                <input type="text" name="title" required  lay-verify="required|number" placeholder="请输入机顶盒点数" autocomplete="off" class="layui-input">
            </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">服务器台数:</label>
            <div class="layui-input-block">
                <input type="text" name="server" required  lay-verify="required|number" placeholder="请输入服务器台数" autocomplete="off" class="layui-input">
            </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">收银点数:</label>
            <div class="layui-input-block">
                <input type="text" name="title" required  lay-verify="required|number" placeholder="请输入收银点数" autocomplete="off" class="layui-input">
            </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">酒水版本:</label>
            <div class="layui-input-block">
                <select name="wine" lay-verify="required">
                <option value=""></option>
                <option value="123">五粮液</option>
                <option value="321">茅台</option>
                </select>
            </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="checkbox" name="show" title="演示" lay-skin="primary">
                </div>
            </div>
        </div>
        <div class="layui-form-box">
            <div class="layui-form-item">
            <label class="layui-form-label">地址:</label>
            <div class="layui-input-block">
                <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">联系人:</label>
            <div class="layui-input-block">
                <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">联系人电话:</label>
            <div class="layui-input-block">
                <input type="text" name="title" required  lay-verify="required|phone" placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">订房电话:</label>
                <div class="layui-input-block">
                    <input type="text" name="title" required  lay-verify="required|phone" placeholder="请输入标题" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">联系人电话:</label>
            <div class="layui-input-block">
                <input type="text" name="title" required  lay-verify="required|phone" placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">技术姓名:</label>
                <div class="layui-input-block">
                    <input type="text" name="title" required  lay-verify="required|phone" placeholder="请输入标题" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">技术手机:</label>
                <div class="layui-input-block">
                    <input type="text" name="title" required  lay-verify="required|phone" placeholder="请输入标题" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">备注:</label>
            <div class="layui-input-block layui-input-msg">
                市和县可二选一,便于组合欢迎词
            </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">欢迎词:</label>
            <div class="layui-input-block">
                <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">订房信息:</label>
            <div class="layui-input-block">
                <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>
            </div>
            <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="checkbox" name="" title="城市在项目后面" lay-skin="primary">
            </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">显示欢迎词:</label>
            <div class="layui-input-block layui-input-msg">
            </div>
            </div>
        </div>
        <div class="layui-form-center">
            <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="checkbox" name="" title="开通90后" lay-skin="primary">
                <input type="text" class="layui-input-date" placeholder="开始"/>
                <input type="text" class="layui-input-date" placeholder="结束"/>
            </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">歌曲授权分类</label>
            <div class="layui-input-block layui-input-radio">
                <input type="radio" name="authorize_diff" value="大陆" title="大陆"/>
                <input type="radio" name="authorize_diff" value="海外"  title="海外"/>
                <input type="radio" name="authorize_diff" value="港澳台" title="港澳台"/>
            </div>
            </div>
            <p class="remark">备注: 如果国家选择是外国, 可以不选下面的省市县区等。如果是中国则必须选, 台湾是中国不可分割的一部分。</p>
            <div class="layui-form-item">
            <div class="layui-input-block layui-div-center">
                <button class="layui-btn" lay-submit lay-filter="formDemo">创建新项目</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
            </div>
        </div>
    </form>
{% end %}

{% block footjs %}
<script src="{{ static_url('create_manage.js') }}"></script>
{% end %}