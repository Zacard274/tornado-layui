#!/usr/bin/env python
# -*- coding: utf-8 -*-
""" 加密狗授权 """
import os
import json
import math
import uuid
import base64
import hmac
import time
import logging
import when
import random
import commands
import copy
import shutil
import sys
reload(sys)
sys.setdefaultencoding('utf8')
from datetime import datetime, timedelta
from urllib import quote, unquote, urlencode
from hashlib import sha1, md5
from tornado import web, gen
from handler.base import BaseHandler
from tornado import httpclient, web
from tornado.gen import coroutine
from control import ctrl
from const import *
from lib.encrypt_code import Encrypt


class AuthorityHandler(BaseHandler):

    def verify_time(self, offline_time):
        """ 校验线下时间和线上时间是否一致 """
        timeArray = time.strptime(offline_time, "%Y-%m-%d %H:%M:%S")
        timestamp = time.mktime(timeArray)
        if abs(time.time()-timestamp) > 600:
            return False
        else:
            return True

    def add_handware(self, data):
        data = json.loads(data)
        hardware_all = []
        hardware_info = {'mac': '', 'uuid': '', 'is_main': ''}
        hardware_info['uuid'], hardware_info['mac'] = data['master'].split(':')
        hardware_info['is_main'] = 1
        hardware_all.append(hardware_info)
        for server in data['servers']:
            info = copy.deepcopy(hardware_info)
            info['uuid'], info['mac'] = server.split(':')
            info['is_main'] = 0
            hardware_all.append(info)
        return hardware_all

    def get(self):
        pass

    def post(self, op):
        if op == 'get_authority':
            """ktv认证
            返回码定义：
            返回值 说明 线下处理
            0 绑定成功 回显KTV信息
            1 服务器时间错误（线上误差>10分钟）设置（更新）服务器时间（NTP）
            3 未授权的硬件 提醒联系厂商解决
            5 同样的硬件在其他的KTV注册过 提醒联系代理商处理
            {'code': '', 'msg': '', 'data': ''------data中包含所有授权信息 }
            """
            ret = {'code': 0, 'msg': ''}
            server_encrypt = Encrypt()
            data = self.get_argument('data', '')
            offline_time = self.get_argument('localtime', '')
            server_encrypt.encrypt_rsa_key = self.get_argument('authinfo', '')
            if not self.verify_time(offline_time):
                ret['code'] = 1
                ret['msg'] = '服务器时间错误'
                self.send_json(ret)
                return
            hardware = self.add_handware(server_encrypt.decrypt_msg(data))
            ktv_id = data['ktvid']
            res = ctrl.api.update_ktv_info_ctl(ktv_id, {'hardware': hardware})
            if not res:
                ret['code'], ret['msg'] = 5, '硬件已被注册'
                self.send_json(ret)
                return
            res = ctrl.api.get_ktv_info(ktv_id)
            ret['data'] = server_encrypt.encrypt_msg(`res`)
            self.send_json(ret)
            return

        if op == 'proc_ktvinfo':
            """绑定ktv，申请延长时间，申请90后延长时间"""
            ret = {'code': 0, 'msg': 'ok'}
            ktv_id = self.get_argument('ktvid', 0)
            ktv_status = self.get_argument('ktvstatus', 0)
            cloud_status = self.get_argument('cloudstatus', 0)
            data= {'ktv_id': ktv_id, 'ktv_status': ktv_status, 'cloud_status': cloud_status}
            ctrl.api.add_authority_order(**data)
            self.send_json(ret)


class KtvInfoHandler(BaseHandler):
    """ktv信息管理"""
    def get(self):
        """获取ktv信息"""
        server_encrypt = Encrypt()
        ret = {'code': 1, 'ktvinfo': '', 'msg': ''}
        ktv_id = self.get_argument('ktvid', 0)
        res = ctrl.api.get_ktv_info(ktv_id)
        if not res:
            ret['msg'] = '参数错误'
            self.send_json(ret)
            return
        """
            返回码定义：线下处理
            0成功取得KTV信息回显KTV信息
            1无法查到KTV信息提醒用户错误信息
            3KTVID已经被绑定提醒用户再次确认KTVID信息
            5KTVID被禁用提醒联系代理商处理
        """
        ret['code'] = 3 if res['bound_status'] else 0
        ret['code'] = 5 if res['stop_status'] and not ret['code'] else 0
        if not res['code']:
            ret['ktvinfo'] = res
            ret['msg'] = '成功'
            ret['authinfo'] = server_encrypt.my_pub
        elif ret['code'] == 3:
            ret['msg'] = '已经被绑定'
        else:
            ret['msg'] = 'ktv已经被停用'
        self.send_json(ret)

    def post(self):
        """上传ktv信息"""
        ret = {'code': 0, 'msg': 'ok'}
        data = {}
        ctrl.api.add_ktv_store(**data)
        self.send_json(ret)

