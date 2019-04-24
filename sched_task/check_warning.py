#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""启动定时任务，每天凌晨5点检查昨天的上报认证信息，有无报警"""
from concurrent.futures import ThreadPoolExecutor
from datetime import datetime
import time


class task_check(object):
    """定时任务"""
    is_check = None

    @classmethod
    def run(cls):
        if datetime.now().hour != 5 or cls.is_check == datetime.now().date():
            time.sleep(10)
            return

    @classmethod
    def do_check(cls):
        while True:
            try:
                cls.run()
            except:
                pass

