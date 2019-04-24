#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""销售信息处理：可以申请停用某个代理商"""
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


class SaleHandler(BaseHandler):
    def get(self):
        ret = {'code': '', 'data': ''}
        res = ctrl.api.get_all_agent()
        ret['data'] = res
        self.send_json(ret)

    def post(self):
        ret = {'code': 0, 'msg': 'no wrong'}
        agent_id = self.get_argument('agent_id', '')
        reason = self.get_argument('reason', '')
        ctrl.api.stop_agent(agent_id, reason)
        self.send_json(ret)
