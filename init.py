#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
init 初始化设置启动服务
"""
import tornado.ioloop
from concurrent.futures import ThreadPoolExecutor
from tornado.options import define, options
from sched_task.check_warning import task_check

define('port', default=8088, help='run on this port', type=int)
define('debug', default=True, help='enable debug mode')
options.logging = 'debug' if options.debug else 'info'

options.parse_command_line()

import app


def runserver():
    """ run the server and ioloop"""
    app.run()
    loop = tornado.ioloop.IOLoop.instance()
    loop.start()


if __name__ == '__main__':
    with ThreadPoolExecutor(max_workers=2) as executor:
        executor.submit(task_check.do_check)
        executor.submit(runserver())

