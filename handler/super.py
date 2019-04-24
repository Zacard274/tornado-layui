#!/usr/bin/env python
# -*- coding: utf-8 -*-
""" 超级管理员 """
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
import MySQLdb
import sqlite3


class SuperHandler(BaseHandler):
    def get(self, op):
        if op == 'agent':
            ret = {'code': 0, 'data': ''}
            res = ctrl.api.get_all_agent()
            ret['data'] = res
            self.send_json(ret)

        if op == 'sale':
            pass

        if op == 'stop_ktv':
            ret = {'code': 0, 'data': ''}
            res = ctrl.api.get_all_agent()
            ret['data'] = res
            self.send_json(ret)

    def post(self, op):
        if op == 'stop_ktv':
            ret = {'code': 0, 'msg': 'no wrong'}
            ktv_ids = self.get_argument('ktv_ids', '')
            reason = self.get_argument('reason', '')
            res = ctrl.api.stop_ktv(ktv_ids, reason)
            if not res:
                ret = {'code': 1, 'msg': wrong}
            self.send_json(ret)

