#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
app contain all the urls and setting
"""
import os
import sys
import uuid
import base64

from tornado import web
from tornado.options import options
from lib import uimodules, uimethods
from tornado.httpserver import HTTPServer
#from raven.contrib.tornado import AsyncSentryClient
from lib.utils import log_func

URLS = [
    (r'www\.softdog\.90iktv\.com',
        (r'/?', 'handler.index.IndexHandler'),
        (r'/login', 'handler.index.LoginHandler'),
        (r'/logout', 'handler.index.LogoutHandler'),
        (r'/area', 'handler.index.AreaHandler'),
        (r'/agent/?(create|business_check|my_check|history)', 'handler.agent.AgentHandler'),
        (r'/business/?(check|history|sale|agent|user)', 'handler.business.BusinessHandler'),
        (r'/sale', 'handler.sale.SaleHandler'),
        (r'/super/?(sale|agent|stop_ktv)', 'handler.super.SuperHandler'),
        (r'/authority/?(proc_ktvinfo|get_authority)', 'handler.authority.AuthorityHandler'),
        (r'/ktv_info', 'handler.authority.KtvInfoHandler'),
     )
]

class Application(web.Application):
    """Application use to set the web server"""
    def __init__(self):
        settings = {
            'login_url': '/login',
            # 'xsrf_cookies': True,
            'compress_response': True,
            'debug': True,#options.debug,
            'log_function': log_func,
            'ui_modules': uimodules,
            'ui_methods': uimethods,
            'static_path': os.path.join(sys.path[0], 'www/layui'),
            'template_path': os.path.join(sys.path[0], 'www'),
            'cookie_secret': base64.b64encode(uuid.uuid3(uuid.NAMESPACE_DNS, 'softdog').bytes),
            #'sentry_url': 'https://5d87deb2186046dda0db4bf050539dd2:214281f0893c4f8984f247ee38c27f46@sentry.ktvsky.com/7'# if not options.debug else ''
        }
        web.Application.__init__(self, **settings)

        for spec in URLS:
            host = '.*$'
            handlers = spec[1:]
            self.add_handlers(host, handlers)


def run():
    """ start the web server """
    app = Application()
    #app.sentry_client = AsyncSentryClient(app.settings['sentry_url'])
    http_server = HTTPServer(app, xheaders=True)
    http_server.listen(options.port)
    print('Running on port %d' % options.port)
