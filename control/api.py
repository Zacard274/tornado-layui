#!/usr/bin/env python
# -*- coding: utf-8 -*-
""" handle all proc before orm"""

from datetime import datetime
from copy import deepcopy

class APICtrl(object):

    def __init__(self, ctrl):
        self.ctrl = ctrl
        self.api = ctrl.pdb.api

    def __getattr__(self, name):
        return getattr(self.api, name)

    def get_agentid_byname(self, name):
        res = ctrl.api.get_agentid_byname(name)
        return res[0]['agent_id']

    def get_all_order(self, type_check, agent_id):
        res, info = [], {'city_id': '', 'ktv_name': '', 'ktv_subname': '', 'ktv_endtime': '', 'agent_id': ''}
        agent_order_res = self.api.get_agent_order(type_check, agent_id)
        authority_order_res = self.api.get_authority_order(type_check, agent_id)
        def proc_res(res_tmp, data):
            for item in data:
                info_tmp = deepcopy(info)
                for key in item.keys():
                    if key in info_tmp.keys():
                        info_tmp[key] = item[key]
                res_tmp.append(info_tmp)
        proc_res(res, agent_order_res)
        proc_res(res, authority_order_res)
        return res

    def update_ktv_info(ktv_id, hardware):
        old = self.api.get_ktv_info(ktv_id)
        if not old['authority_status']:
            self.api.update_ktv_info(ktv_id, hardware)
            return True
        else:
            return False
