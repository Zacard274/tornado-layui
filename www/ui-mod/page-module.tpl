{% if page_total > 1 %}
    {% if page > page_total %}
    <p class="msg error">超出查询范围</p>
    {% else %}
    <div class="page-mod">
        {% if page_total < max_display %}
            {% set page_range = range(1, page) %}
        {% else %}
            {% if page > 1 %}
            <a class="prev" href="{{ base_url + str(1) }}">首页</a>
            <a class="prev" href="{{ base_url + str(page-1) }}">上一页</a>
            {% end %}
            {% if page < (max_display>>1) +1  %}
                {% set page_range = range(1, page) %}
            {% elif (page_total - page) < max_display>>1  %}
                {% set page_range = range(page_total-max_display+1, page) %}
            {% else %}
                {% set page_range = range(page-(max_display>>1), page) %}
            {% end %}
        {% end %}
        {% for p in page_range %}
        <a href="{{ base_url + str(p) }}">{{ p }}</a>
        {% end %}
        <span class="on">{{ page }}</span>
        {% if page_total < max_display %}
            {% set page_range = range(page+1, page_total+1) %}
        {% else %}
            {% if (page_total - page) < max_display>>1  %}
                {% set page_range = range(page+1, page_total+1) %}
            {% elif page < (max_display/2+1)  %}
                {% set page_range = range(page+1, max_display+1) %}
            {% else %}
                {% set page_range = range(page+1, page+(max_display>>1)) %}
            {% end %}
        {% end %}
        {% for p in page_range %}
        <a href="{{ base_url + str(p) }}">{{ p }}</a>
        {% end %}
        {% if page < page_total and page_total > max_display %}
        <a class="next" href="{{ base_url + str(page+1) }}">下一页</a>
        <a class="prev" href="{{ base_url + str(page_total) }}">末页</a>
        {% end %}
    </div>
    {% end %}
{% end %}
