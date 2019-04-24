/**
 *  创建项目
 */
var baseURL = 'http://www.softdog.90iktv.com/area'
layui.use(['form', 'jquery'], function () {
    var form = layui.form
    var $countryNode = layui.$('select[name="country"]')
    var $provinceNode = layui.$('select[name="province"]')
    var $cityNode = layui.$('select[name="city"]')
    var $areaNode = layui.$('select[name="area"]')
    var $option = $countryNode.children('option').eq(0).clone()
    var countryVal = 0
    var provinceVal = 0
    var cityVal = 0
    var provinceList = []
    var cityList = []
    var areaList = []
    var countryList = [{country_id: 1, country_name: '中国'}]
    loadDOM(countryList, $countryNode, $option, $countryNode.children('option'), 'country')
    getData('?areatype=province', function (res) {
        provinceList = res
        form.render('select')
    })
    form.render('select')
    // TODO 组件提取
    form.on('select', function (data) {
        var $elem = layui.$(data.elem)
        var name = $elem.attr('name')
        var count = +data.value

        if (name === 'country') {
            if (countryVal === count) {
                return
            }
            countryVal = count
            if (countryVal !== 0 && countryVal !== 1) {
                layui.$('select.option').removeAttr('lay-verify').removeClass('layui-form-danger')
            }
            if (countryVal && countryVal === 1) {
                loadDOM(provinceList, $provinceNode, $option, $provinceNode.children('option'), 'province')
                layui.$('select.option').attr('lay-verify', 'required')
                form.render('select')
            } else {
                loadDOM([], $provinceNode, $option, $provinceNode.children('option'))
                loadDOM([], $cityNode, $option, $cityNode.children('option'))
                loadDOM([], $areaNode, $option, $areaNode.children('option'))
                provinceVal = cityVal = areaVal = 0
                form.render('select')
            }
        } else if (name === 'province') {
            if (provinceVal === count) {
                return
            }
            provinceVal = count
            provinceVal && getData('?areatype=city&areaid=' + provinceVal, function (res) {
                cityList = res
                loadDOM(cityList, $cityNode, $option, $cityNode.children('option'), 'city')
                form.render('select')
            })
            if (!provinceVal) {
                loadDOM([], $cityNode, $option, $cityNode.children('option'))
                loadDOM([], $areaNode, $option, $areaNode.children('option'))
                cityVal = 0
                form.render('select')
            }
        } else if (name === 'city') {
            if (cityVal === count) {
                return
            }
            cityVal = count
            cityVal && getData('?areatype=district&areaid=' + cityVal, function (res) {
                areaList = res
                loadDOM(areaList, $areaNode, $option, $areaNode.children('option'), 'district')
                form.render('select')
            })
            if (!cityVal) {
                loadDOM([], $areaNode, $option, $areaNode.children('option'))
                form.render('select')
            }
        }
    })

    form.on('submit', function (data) {
        console.log('data is : ', data.field, 'form is : ', data.form, arguments)
        layui.open({
            type: 1,
            content: '撒大科技时代改的就覆盖撒娇'
        })
        return false
    })

    // checkbox
    form.on('checkbox', function (data) {
        var checked = data.elem.checked
        layui.$(this).val(checked ? 1 : 0)
        if (data.elem.name === 'isOpenNine') {
            var $nine = layui.$('input.layui-input-date')
            if (checked) {
                $nine.removeAttr('disabled')
            } else {
                $nine.attr('disabled', 'disabled')
            }
        }
    })

    function loadDOM (arr, $parent, $elem, $elems, name) {
        var count = 1
        var id = name + '_id'
        var name = name + '_name'
        // $parent 默认有一个多余的option 所以赋值跟clone都要从第二个开始
        if (!arr.length && $elems.length > count) {
            $elems.each(function (index) {
                index >= count && layui.$(this).remove()
            })
            return
        }
        if (!arr.length) {
            return
        }
        for (var i = 0; i < arr.length; i++) {
            if ($elems.length > count && $elems.length > arr.length) {
                $elems.eq(count).val(arr[i][id]).text(arr[i][name])
            } else if (count >= $elems.length && $elems.length <= arr.length) {
                var $option = $elem.clone().val(arr[i][id]).text(arr[i][name])
                $parent.append($option)
            }
            if (i === arr.length - 1 && $elems.length > count) {
                $elems.each(function (index) {
                    index > count && layui.$(this).remove()
                })
            }
            count++
        }
    }
})

function getData (params, cb) {
    layui.$.get(baseURL + params, function (res) {
        cb(res.data)
    })
}
