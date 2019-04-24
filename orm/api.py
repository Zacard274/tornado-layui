#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""数据库处理"""

from sqlalchemy.dialects.mysql import INTEGER, VARCHAR, TINYINT, TEXT, DATETIME
from orm.base import NotNullColumn, Base, ModelBase
from lib.decorator import model_to_dict, models_to_list, close_conn
from const import DB_SOFTDOG
from sqlalchemy.sql.expression import func
import datetime
from sqlalchemy import Column
from sqlalchemy.sql.expression import func, desc, asc, or_

class Ktv_Store(ModelBase):
    '''
    KTV info
    '''
    __tablename__ = 'ktv_store'

    ktv_id = Column(INTEGER(11), primary_key=True)
    hash_id = NotNullColumn(VARCHAR(32), default='')
    agent_id = NotNullColumn(INTEGER, default=0)
    ktv_name = NotNullColumn(VARCHAR(128), default='')
    ktv_subname = NotNullColumn(VARCHAR(128), default='')
    country = NotNullColumn(VARCHAR(128), default='')
    province_id = NotNullColumn(INTEGER(11), default=0)
    city_id = NotNullColumn(INTEGER(11), default=0)
    county_id = NotNullColumn(INTEGER, default=0)
    tech_name = NotNullColumn(VARCHAR(32), default='')
    tech_no = NotNullColumn(VARCHAR(32), default='')
    server_count = NotNullColumn(TINYINT, default=0)
    ktv_box = NotNullColumn(TINYINT, default=0)
    pay_count = NotNullColumn(TINYINT, default=0)
    meal_type = NotNullColumn(TINYINT, default=0)
    address = NotNullColumn(VARCHAR(512), default='')
    contacts = NotNullColumn(VARCHAR(128), default='')
    moblie_no = NotNullColumn(VARCHAR(64), default='')
    welcome = NotNullColumn(VARCHAR(512), default='')
    room_text = NotNullColumn(VARCHAR(256), default='')
    city_status = NotNullColumn(TINYINT, default=0)
    authority_status = NotNullColumn(TINYINT, default=0)
    bound_status = NotNullColumn(TINYINT, default=0)
    ktv_endtime = NotNullColumn(DATETIME, default=func.now())
    stop_status = NotNullColumn(TINYINT, default=0)
    stop_reason = NotNullColumn(VARCHAR(512), default='')
    is_show = NotNullColumn(TINYINT(1), default=0)
    cloud_status = NotNullColumn(TINYINT(1), default=0)
    cloud_starttime = NotNullColumn(DATETIME, default=func.now())
    cloud_endtime = NotNullColumn(DATETIME, default=func.now())
    cloud_type = NotNullColumn(TINYINT, default=0)
    hardware = Column(TEXT)


class Agent(ModelBase):
    """用户设备信息"""

    __tablename__ = 'ktv_agent'

    agent_id = Column(INTEGER(11), primary_key=True)
    contacts = NotNullColumn(VARCHAR(64), default='')
    mobile_no = NotNullColumn(VARCHAR(128), default='')
    mail = NotNullColumn(VARCHAR(128), default='')
    agent_no = NotNullColumn(VARCHAR(256), default='')
    starttime = NotNullColumn(DATETIME, default=func.now())
    endtime = NotNullColumn(DATETIME, default=func.now())
    area = NotNullColumn(VARCHAR(512), default='')
    class_user = NotNullColumn(TINYINT, default=0)
    username = NotNullColumn(VARCHAR(64), default='')
    passwd = NotNullColumn(VARCHAR(64), default='')
    stop_status = NotNullColumn(TINYINT, default=0)
    stop_reason = NotNullColumn(VARCHAR(512), default='')


class Authority_Order(ModelBase):
    """每次的修改都要记录，技术的授权时间提交信息，现在需求只能修改授权到期时间"""

    __tablename__ = 'ktv_authority_order'

    order_id = Column(INTEGER(11), primary_key=True)
    ktv_id = NotNullColumn(INTEGER, default=0)
    ktv_status = NotNullColumn(TINYINT, default=0)
    cloud_status = NotNullColumn(TINYINT, default=0)
    ktv_endtime = NotNullColumn(DATETIME, default=func.now())
    cloud_endtime = NotNullColumn(DATETIME, default=func.now())
    agent_check = NotNullColumn(TINYINT, default=0)
    agent_fail = NotNullColumn(VARCHAR(512), default='')
    business_check = NotNullColumn(TINYINT, default=0)
    business_fail = NotNullColumn(VARCHAR(512), default='')
    ip = NotNullColumn(VARCHAR(15), default='')


class Agent_Order(ModelBase):
    """每次的修改都要记录，代理商修改KTV信息记录"""

    __tablename__ = 'ktv_agent_order'

    order_id  = Column(INTEGER(11), primary_key=True)
    ktv_id = NotNullColumn(INTEGER, default=0)
    agent_id = NotNullColumn(INTEGER, default=0)
    ktv_name = NotNullColumn(VARCHAR(128), default='')
    ktv_subname = NotNullColumn(VARCHAR(128), default='')
    province_id = NotNullColumn(INTEGER(11), default=0)
    city_id = NotNullColumn(INTEGER(11), default=0)
    county_id  = NotNullColumn(INTEGER, default=0)
    ktv_count = NotNullColumn(TINYINT, default=0)
    ktv_box = NotNullColumn(TINYINT, default=0)
    pay_count = NotNullColumn(TINYINT, default=0)
    meal_type = NotNullColumn(TINYINT, default=0)
    address = NotNullColumn(VARCHAR(512), default='')
    contacts = NotNullColumn(VARCHAR(128), default='')
    moblie_no = NotNullColumn(VARCHAR(64), default='')
    welcome = NotNullColumn(VARCHAR(512), default='')
    room_text = NotNullColumn(VARCHAR(256), default='')
    city_status = NotNullColumn(TINYINT, default=0)
    business_check = NotNullColumn(TINYINT, default=0)
    business_fail = NotNullColumn(VARCHAR(512), default='')
    create_time = NotNullColumn(DATETIME, default=func.now())


class Authority_Log(ModelBase):
    """每天的认证信息log"""

    __tablename__ = 'ktv_authority_log'

    log_id  = Column(INTEGER(11), primary_key=True)
    ktv_id = NotNullColumn(INTEGER, default=0)
    ip = NotNullColumn(VARCHAR(15), default='')
    hardware = Column(TEXT)
    create_time = NotNullColumn(DATETIME, default=func.now())


class Warning_Log(ModelBase):
    """预警信息log"""

    __tablename__ = 'ktv_warning_log'

    log_id  = Column(INTEGER(11), primary_key=True)
    ktv_id = NotNullColumn(INTEGER, default=0)
    warning_type = NotNullColumn(TINYINT, default=0)
    warning_msg = Column(TEXT)
    create_time = NotNullColumn(DATETIME, default=func.now())


class Province(Base):
    """省份"""

    __tablename__ = 'province'

    province_id  = Column(INTEGER(11), primary_key=True)
    province_name = NotNullColumn(VARCHAR(64), default='')
    code = NotNullColumn(INTEGER, default=0)


class City(Base):
    """城市"""

    __tablename__ = 'city'

    city_id  = Column(INTEGER(11), primary_key=True)
    city_name = NotNullColumn(VARCHAR(64), default='')
    code = NotNullColumn(INTEGER, default=0)
    zip_code = NotNullColumn(VARCHAR(64), default='')
    province_id = NotNullColumn(INTEGER, default=0)
    parent_code = NotNullColumn(INTEGER, default=0)


class District(Base):
    """区县"""

    __tablename__ = 'district'

    district_id  = Column(INTEGER(11), primary_key=True)
    district_name = NotNullColumn(VARCHAR(64), default='')
    code = NotNullColumn(INTEGER, default=0)
    city_id = NotNullColumn(INTEGER, default=0)


class APIModel(object):
    def __init__(self, pdb):
        self.pdb = pdb
        self.master = pdb.get_session(DB_SOFTDOG, master=True)
        self.slave = pdb.get_session(DB_SOFTDOG)

    @close_conn()
    def add_ktv_store(self, **data):
        obj = Ktv_Store(**data)
        self.master.add(obj)
        self.master.commit()
        return True

    @close_conn()
    def add_agent(self, **data):
        obj = Agent(**data)
        self.master.add(obj)
        self.master.commit()
        return True

    @close_conn()
    def add_authority_order(self, **data):
        obj = Authority_Order(**data)
        self.master.add(obj)
        self.master.commit()
        return True

    @close_conn('slave')
    @models_to_list
    def get_agent_order(self, type_check, agent_id):
        if not type_check and agent_id:
            res = self.slave.query(Agent_Order).filter(Agent_Order.agent_id == agent_id).all()
        elif type_check == 'business_check' and agent_id:
            res = self.slave.query(Agent_Order).filter(Agent_Order.business_check == 0, Agent_Order.agent_id == agent_id).all()
        elif type_check == 'business_check' and not agent_id:
            res = self.slave.query(Agent_Order).filter(Agent_Order.business_check == 0).all()
        else:
            res = self.slave.query(Agent_Order).all()
        return res

    @close_conn('slave')
    @models_to_list
    def get_authority_order(self, type_check, agent_id):
        if not type_check and agent_id:
            res = self.slave.query(Authority_Order).filter(Authority_Order.agent_id== agent_id).all()
        elif type_check == 'agent_check' and agent_id:
            res = self.slave.query(Authority_Order).filter(Authority_Order.agent_check == 0, Authority_Order.agent_id == agent_id).all()
        elif type_check == 'business_check' and not agent_id:
            res = self.slave.query(Authority_Order).filter(Authority_Order.agent_check == 1, Authority_Order.business_check == 0).all()
        else:
            res =self.slave.query(Authority_Order).all()
        return res

    @close_conn('slave')
    @models_to_list
    def get_all_agent(self, status=0):
        res =self.slave.query(Agent).filter(Agent.stop_status == status).all()
        return res

    @close_conn()
    def stop_agent(self, agentid, reason):
        data = {'stop_reason': reason, 'stop_status': 2}
        self.master.query(Agent).filter_by(agent_id=agentid).update(data)
        self.master.commit()
        return

    @model_to_dict
    @close_conn('slave')
    def get_ktv_info(self, ktv_id):
        res =self.slave.query(Ktv_Store).filter(Ktv_Store.hash_id == ktv_id).all()
        return res

    @close_conn()
    def update_ktv_info(self, ktv_id, data):
        self.master.query(Ktv_Store).filter_by(hash_id=ktv_id).update(data)
        self.master.commit()
        return

    @close_conn('slave')
    @models_to_list
    def get_area_info(self, areatype, areaid=0):
        if areatype == 'province':
            res = self.slave.query(Province).all()
        if areatype == 'city':
            res = self.slave.query(City).filter(City.province_id==areaid).all()
        if areatype == 'district':
            res = self.slave.query(District).filter(District.city_id==areaid).all()
        return res

    @close_conn('slave')
    @models_to_list
    def get_agentid_byname(self, name):
        res = self.slave.query(Agent).filter(Agent.username==name).all()
        return res
