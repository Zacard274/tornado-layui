#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""商务信息"""

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
from qiniu import put_file


class BusinessHandler(BaseHandler):
    def get(self, op):
        if op == 'check':
            ret = {'code': 0, 'data': ''}
            res = ctrl.api.get_all_order_ctl('business_check', None)
            ret['data'] = res
            self.send_json(ret)

        if op == 'history':
            ret = {'code': 0, 'data': ''}
            res = ctrl.api.get_all_order_ctl('history', None)
            ret['data'] = res
            self.send_json(ret)

        if op == 'sale':
            ret = {'code': 0, 'data': ''}
            res = ctrl.api.get_all_agent(2)
            ret['data'] = res
            self.send_json(ret)

        if op == 'agent':
            ret = {'code': 0, 'data': ''}
            res = ctrl.api.get_all_agent_ctl()
            ret['data'] = res
            self.send_json(ret)

        if op == 'user':
            pass

    def post(self, op):
        if op == 'agent':
            agent_info, ret = {}, {'code': 0, 'msg': 'no wrong'}
            for key in self.request.arguments:
                agent_info[key] = self.get_argument(key, '')

            result = ctrl.api.add_agent(ktv_store)
            if not result:
                ret = {'code': 1, 'msg': 'wrong'}
            self.send_json(ret)

