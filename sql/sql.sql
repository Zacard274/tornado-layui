-- KTV 信息表, 硬件信息在授权后获取
CREATE TABLE `ktv_store` (
  `ktv_id` int primary key auto_increment comment 'KTV ID',
  `hash_id` varchar(32) NOT NULL  DEFAULT '' comment 'KTV ID hash',
  `agent_id` int NOT NULL  DEFAULT 0 comment '代理商 ID',
  `ktv_name` varchar(128) NOT NULL  DEFAULT '' comment 'KTV名称',
  `ktv_subname` varchar(128) NOT NULL DEFAULT '' comment 'KTV分店名称',
  `country` varchar(128) NOT NULL DEFAULT '' comment '国家',
  `province_id` int NOT NULL DEFAULT 0 comment '省',
  `city_id` int NOT NULL DEFAULT 0 comment '市',
  `county_id` int NOT NULL DEFAULT 0 comment '县',
  `tech_name` varchar(32) NOT NULL DEFAULT '' comment '技术姓名',
  `tech_no` varchar(32) NOT NULL DEFAULT '' comment '技术电话',
  `server_count` tinyint NOT NULL DEFAULT 0 comment '服务器个数',
  `ktv_box` tinyint NOT NULL DEFAULT 0 comment 'KTV机顶盒个数',
  `pay_count` tinyint NOT NULL DEFAULT 0 comment '收银点数',
  `meal_type` tinyint NOT NULL  DEFAULT 0 comment '酒水版本',
  `addrees` varchar(512) NOT NULL DEFAULT '' comment '存放经纬度',
  `contacts` varchar(128) NOT NULL DEFAULT '' comment '联系人',
  `mobile_no` varchar(64) NOT NULL DEFAULT '' comment '联系人电话',
  `welcome` varchar(512) NOT NULL DEFAULT '' comment '欢迎词',
  `room_text` varchar(256) NOT NULL DEFAULT '' comment '订房信息',
  `city_status` tinyint(1) NOT NULL DEFAULT 0 comment '城市在项目后面',
  `authority_status` tinyint(1) NOT NULL DEFAULT 0 comment '授权状态信息0未授权成功，1授权成功,2是永久授权',
  `bound_status` tinyint(1) NOT NULL DEFAULT 0 comment 'ktv绑定状态信息0未绑定，1已经绑定',
  `ktv_endtime` datetime NOT NULL DEFAULT  CURRENT_TIMESTAMP comment '授权到期时间',
  `stop_status` tinyint(1) NOT NULL DEFAULT 0 comment '是否停用该ktv',
  `stop_reason` varchar(512) NOT NULL DEFAULT '' comment '要停用ktv，注明原因',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 comment '是否演示',
  `cloud_status` tinyint(1) NOT NULL DEFAULT 0 comment '是否开通90后',
  `cloud_starttime` datetime NOT NULL DEFAULT  CURRENT_TIMESTAMP comment '90后开始时间',
  `cloud_endtime` datetime NOT NULL DEFAULT  CURRENT_TIMESTAMP comment '90后到期时间',
  `cloud_type` tinyint(4) NOT NULL DEFAULT 0 comment '90后授权分类1大陆，2海外，3港澳台，默认0',
  `hardware` text DEFAULT NULL comment '[{"mac":"", "uuid": "", "is_main": ""}........]',
  KEY `idx_agent_id` (`agent_id`),
  KEY `idx_province_id` (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 每次的修改都要记录，技术的授权时间提交信息，现在需求只能修改授权到期时间
-- 提交时进行IP检查，不允许跨区域提交
CREATE TABLE `ktv_authority_order`(
  `order_id` int primary key auto_increment comment '产生的订单 ID',
  `ktv_id` int NOT NULL DEFAULT 0 comment 'KTV ID',
  `ktv_status` tinyint(1) NOT NULL DEFAULT 0 comment '是否申请延长时间',
  `cloud_status` tinyint(1) NOT NULL DEFAULT 0 comment '是否申请延长90后时间',
  `ktv_endtime` datetime NOT NULL DEFAULT  CURRENT_TIMESTAMP comment '授权到期时间',
  `cloud_endtime` datetime NOT NULL DEFAULT  CURRENT_TIMESTAMP comment '授权到期时间',
  `agent_check` tinyint(1) NOT NULL DEFAULT 0 comment '代理商审核 0没有审核|1审核通过|2审核没有通过',
  `agent_fail` varchar(512) NOT NULL DEFAULT '' comment '代理商审核失败原因',
  `business_check` tinyint(1) NOT NULL DEFAULT 0 comment '商务审核 0没有审核|1审核通过|2审核没有通过',
  `business_fail` varchar(512) NOT NULL DEFAULT '' comment '商务审核失败原因',
  `ip` varchar(15) NOT NULL DEFAULT '' comment '设备IP',
   KEY `idx_ktv_id` (`ktv_id`),
   KEY `idx_agent_id` (`agent_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--每次的修改都要记录，代理商修改KTV信息记录
CREATE TABLE `ktv_agent_order`(
  `order_id` int primary key auto_increment comment '产生的订单 ID',
  `ktv_id` int DEFAULT 0 comment 'KTV ID',
  `agent_id` int NOT NULL  DEFAULT 0 comment '代理商 ID',
  `ktv_name` varchar(128) NOT NULL  DEFAULT '' comment 'KTV名称',
  `ktv_subname` varchar(128) NOT NULL DEFAULT '' comment 'KTV分店名称',
  `province_id` int NOT NULL DEFAULT 0 comment '省',
  `city_id` int NOT NULL DEFAULT 0 comment '市',
  `county_id` int NOT NULL DEFAULT 0 comment '县',
  `ktv_count` tinyint NOT NULL DEFAULT 0 comment 'KTV个数',
  `ktv_box` tinyint NOT NULL DEFAULT 0 comment 'KTV机顶盒个数',
  `pay_count` tinyint NOT NULL DEFAULT 0 comment '收银点数',
  `meal_type` tinyint NOT NULL  DEFAULT 0 comment '酒水版本',
  `addrees` varchar(512) NOT NULL DEFAULT '' comment '地址',
  `contacts` varchar(128) NOT NULL DEFAULT '' comment '联系人',
  `mobile_no` varchar(64) NOT NULL DEFAULT '' comment '联系人电话',
  `welcome` varchar(512) NOT NULL DEFAULT '' comment '欢迎词',
  `room_text` varchar(128) NOT NULL DEFAULT '' comment '订房信息',
  `city_status` tinyint NOT NULL DEFAULT 0 comment '城市在项目后面',
  `business_check` tinyint NOT NULL DEFAULT 0 comment '商务审核 0没有审核|1审核通过|2审核没有通过',
  `business_fail` varchar(512) NOT NULL DEFAULT '' comment '商务审核失败原因',
  `create_time` datetime NOT NULL DEFAULT  CURRENT_TIMESTAMP comment '修改订单时间',
  KEY `idx_ktv_id` (`ktv_id`),
  KEY `idx_aid_ctime` (`agent_id`, `create_time`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

--代理商信息表
CREATE TABLE `ktv_agent` (
  `agent_id` int primary key auto_increment comment '代理商 ID',
  `contacts` varchar(64) NOT NULL DEFAULT '' comment '联系人',
  `mobile_no` varchar(128) NOT NULL DEFAULT '' comment '联系电话',
  `mail` varchar(128) NOT NULL DEFAULT '' comment '邮箱',
  `agent_no` varchar(256) NOT NULL  DEFAULT '' comment '代理商协议号',
  `starttime`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP comment '起始日期',
  `endtime`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP comment '截止日期',
  `area` varchar(512) DEFAULT '' comment '{ "province_id": "all", "province_id": [] }',
  `class_user` tinyint NOT NULL DEFAULT 0 comment '0雷石|1雷客|2wow',
  `username` varchar(64) NOT NULL DEFAULT '' comment '用户名',
  `passwd` varchar(64) NOT NULL DEFAULT '' comment '密码',
  `stop_status` tinyint NOT NULL DEFAULT 0 comment '是否停用，0否，1是 2销售申请',
  `stop_reason` varchar(512) NOT NULL DEFAULT '' comment '代理商被停用原因'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--每天的认证信息log
CREATE TABLE `ktv_authority_log` (
  `log_id` int primary key auto_increment comment 'ID',
  `ktv_id` int NOT NULL DEFAULT 0 comment 'ktv id',
  `ip` varchar(15) NOT NULL DEFAULT '' comment '设备IP',
  `hardware` text DEFAULT NULL comment '[{"mac":"", "cpu": "", "is_main": ""}........]',
  `create_time` datetime NOT NULL DEFAULT  CURRENT_TIMESTAMP comment '认证时间',
  INDEX(`ktv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--预警信息log
CREATE TABLE `ktv_warning_log` (
  `log_id` int primary key auto_increment comment 'ID',
  `ktv_id` int NOT NULL DEFAULT 0 comment 'ktv id',
  `warning_type` tinyint NOT NULL DEFAULT 0 comment '预警类型',
  `warning_msg` text DEFAULT NULL comment '预警信息',
  `create_time` datetime NOT NULL DEFAULT  CURRENT_TIMESTAMP comment '创建时间',
  INDEX(`ktv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(64) NOT NULL DEFAULT '',
  `code` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(64) NOT NULL DEFAULT '',
  `code` int(11) NOT NULL DEFAULT '0',
  `zip_code` varchar(64) NOT NULL DEFAULT '',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `parent_code` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`city_id`),
  KEY `idx_province` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8;

CREATE TABLE `district` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(64) NOT NULL DEFAULT '',
  `code` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`district_id`),
  KEY `idx_city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2902 DEFAULT CHARSET=utf8;

CREATE TABLE `china` (
  `Id` int(11) NOT NULL,
  `Name` varchar(40) default NULL,
  `Pid` int(11) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `FK_CHINA_REFERENCE_CHINA` (`Pid`),
  CONSTRAINT `FK_CHINA_REFERENCE_CHINA` FOREIGN KEY (`Pid`) REFERENCES `china` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;  
