# -*- coding: utf-8 -*-
"""
const 里面包含所有的常用配置信息
USERS 用户权限管理（包括用户密码和权限）
MYSQL 数据库信息
"""
COOKIES = 'softdog'
ERR_MSG = {
    0: '服务正常',
    -1: '参数错误',
    -2: '请求的资源不存在',
    404: '无数据',
    20001: '手机号码格式有误,请检查!',
    20002: '手机号已经被注册过，请查询后重新发送！',
    20003: '注册成功',
    30001: '频繁结算，请稍后再试',
    30002: '无效日期，无法生成理财策略模型方案',

    40000: '数据操作失败',
    40001: '无权限'
}

USERS = {
    'super': {
        'yangguang': 'Super@yangguang',
        'tanguobin': 'Super@tanguobin'
    },
    'business': {
        'business_test': 'Business@test'
    },
    'sales': {
        'sales_test': 'Sales@test'
    },
    'agent': {
        'agent_test': 'Agent@test'
    }
}

DB_SOFTDOG = 'test'
MYSQL_KTV = {
    DB_SOFTDOG: {
        'master': {
            'host': '10.9.36.50',
            'user': 'root',
            'pass': 'SkyrockerUdb0',
            'port': 3306
        },
        'slaves': [
            {
                'host': '10.9.61.98',
                'user': 'root',
                'pass': 'SkyrockerUdb0',
                'port': 3306
            }
        ]
    }
}

#用于RSA生成私钥公钥对
SECRET_KEY = 'AoGAY7jBl78zB+bvQjJ8LiNeTi4gLXRuNb+NQwHCpVc5jzRmNb3F74iPO3x7QcTv'

#高德地图获取经纬度url
GEO_URL = 'http://restapi.amap.com/v3/geocode/geo?address={}&key=cb649a25c1f81c1451adbeca73623251'
