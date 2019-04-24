#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""登陆页面设置"""

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
from datetime import datetime, timedelta
from urllib import quote, unquote, urlencode
from hashlib import sha1, md5
from tornado import web, gen
from handler.base import BaseHandler
from tornado import httpclient, web
from tornado.gen import coroutine
from const import USERS
from control import ctrl

class IndexHandler(BaseHandler):
    def get(self):
        uname = self.get_current_user()
        if not uname:
            self.redirect('/login')
            return
        user_name, authority = uname.split('|')
        self.render('index2.tpl', user=user_name, module=authority)

    def post(self):
        pass


class LoginHandler(BaseHandler):
    def get(self):
        self.render('login.tpl', errmsg='')
        return
    def post(self):
        _res = {}
        _res['code'] = 1
        _res['msg'] = "登录失败！"

        uname = self.get_argument('uname', '')
        passwd = self.get_argument('passwd', '')

        for module, user in USERS.items():
            if uname in user.keys() and passwd == user.get(uname, ''):
                self._login(uname+'|'+module)
                _res['code'] = 0
                _res['msg'] = '登陆成功'
                self.send_json(_res)
                self.redirect('/')
                break
        else:
            self.send_json(_res)
        return


class LogoutHandler(BaseHandler):
    def get(self):
        self.redirect('/login')
        return
    def post(self):
        pass


class AreaHandler(BaseHandler):
    def get(self):
        ret = {'code':0, 'data': ''}
        area_id = self.get_argument('areaid', 0)
        area_type = self.get_argument('areatype', 'province')
        res = ctrl.api.get_area_info(area_type, area_id)
        ret['data'] = res
        self.send_json(ret)
        return

    def post(self):
        pass
