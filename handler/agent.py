#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""处理代理商请求"""

import json
import sys
reload(sys)
sys.setdefaultencoding('utf8')
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
from datetime import datetime, timedelta
from urllib import quote, unquote, urlencode
from hashlib import sha1, md5
from tornado import web, gen
from handler.base import BaseHandler
from tornado import httpclient, web
from tornado.gen import coroutine
from control import ctrl
from const import *
from qiniu import put_file


class AgentHandler(BaseHandler):
    """代理商请求：创建项目，总部审核，待我审核，历史记录"""

    def get(self, op):
        if op == 'create':
            uname = self.get_current_user()
            if not uname:
                self.redirect('/login')
                return
            user_name, authority = uname.split('|')
            self.render('create_manage.tpl', user=user_name, module=authority)

        if op == 'business_check':
            #获取agentid
            #res = ctrl.api.get_agent_order('business_check', agent_id)
            uname = self.get_current_user()
            if not uname:
                self.redirect('/login')
                return
            user_name, authority = uname.split('|')
            self.render('business_check.tpl',
                         user=user_name, 
                         module=authority, 
                         items=[{"address": "不接", "ktv_name": "撒的", "store_name": "撒的", "status": "事实上", "id": "0"}],
                         page=1,
                         page_total=10,
                         total=0)

        if op == 'my_check':
            ret = {'code': 0, 'data': ''}
            agent_id = self.get_argument('agent_id', 0)
            res = ctrl.api.get_authority_order('agent_check', agent_id)
            ret['data'] = res
            self.send_json(ret)

        if op == 'history':
            ret = {'code': 0, 'data': ''}
            agent_id = self.get_argument('agent_id', 0)
            res = ctrl.api.get_agent_order(None, agent_id)
            ret['data'] = res
            self.send_json(ret)

    def post(self, op):
        if op == 'create':
            ktv_store, ret = {}, {'code': 0, 'msg': 'no wrong'}
            for key in self.request.arguments:
                ktv_store[key] = self.get_argument(key, '')

            result = ctrl.api.add_ktv_stroe(ktv_store)
            if not result:
                ret = {'code': 1, 'msg': 'wrong'}
            self.send_json(ret)
