/*********sys-service table初始化脚本,程序启动自动执行********************/

CREATE TABLE IF NOT EXISTS `sys_administration` (
  `id` VARCHAR(32) NOT NULL COMMENT '主键',
  `code` VARCHAR(32) DEFAULT NULL COMMENT '编号',
  `name` VARCHAR(20) DEFAULT NULL COMMENT '名称',
  `alias` VARCHAR(20) DEFAULT NULL COMMENT '别名',
  `abbreviation` VARCHAR(20) DEFAULT NULL COMMENT '简称',
  `pinyin` VARCHAR(20) DEFAULT NULL COMMENT '拼音',
  `initials` VARCHAR(1) DEFAULT NULL COMMENT '首字母',
  `location` VARCHAR(20) DEFAULT NULL COMMENT '坐标',
  `pid` VARCHAR(32) DEFAULT NULL COMMENT '父级id',
  `lever` SMALLINT(1) DEFAULT NULL COMMENT '行政等级',
  `rowno` INT(8) DEFAULT NULL COMMENT '行号',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `creatTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sys_button` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `code` VARCHAR(20) DEFAULT NULL COMMENT '按钮代码',
  `name` VARCHAR(40) DEFAULT NULL COMMENT '按钮名称',
  `value` VARCHAR(200) DEFAULT NULL COMMENT '按钮值',
  `rowNo` INT(11) DEFAULT NULL COMMENT '行号',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效标记(1:有效,0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='按钮表';

CREATE TABLE IF NOT EXISTS `sys_button_resource` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `menu_button_id` VARCHAR(32) DEFAULT NULL COMMENT '菜单按钮表ID',
  `path` VARCHAR(300) DEFAULT NULL COMMENT '路径',
  `pattern` VARCHAR(400) DEFAULT NULL COMMENT '表达式路径',
  `method` VARCHAR(10) DEFAULT NULL COMMENT '请求方式',
  `description` VARCHAR(500) DEFAULT NULL COMMENT '资源描述',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_button_id` (`menu_button_id`,`path`,`method`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='按钮类别资源表';

CREATE TABLE IF NOT EXISTS `sys_client` (
  `id` VARCHAR(32) NOT NULL,
  `code` VARCHAR(23) DEFAULT NULL COMMENT '客户端标识',
  `name` VARCHAR(40) DEFAULT NULL COMMENT '客户端名称',
  `keyt` VARCHAR(100) DEFAULT NULL COMMENT '客户端秘钥',
  `refresh` INT(11) DEFAULT NULL COMMENT 'token更新时间(秒)',
  `rowNo` INT(11) DEFAULT NULL COMMENT '行号',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效标记(1:有效,0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_code` (
  `id` VARCHAR(32) NOT NULL,
  `code` VARCHAR(24) DEFAULT NULL COMMENT '唯一代码',
  `name` VARCHAR(40) DEFAULT NULL COMMENT '码表名称(如：性别)',
  `description` VARCHAR(50) DEFAULT NULL COMMENT '使用描述',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效小计(1:有效，0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `rowno` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='系统所有可配置下拉选项';

CREATE TABLE IF NOT EXISTS `sys_doc` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `name` VARCHAR(40) DEFAULT NULL COMMENT '文档名称',
  `code` VARCHAR(32) DEFAULT NULL COMMENT '文档编号',
  `rowno` INT(9) DEFAULT NULL COMMENT '行号',
  `owner` VARCHAR(255) DEFAULT NULL COMMENT '文档拥有者',
  `indexid` VARCHAR(32) DEFAULT NULL COMMENT '文档目录',
  `description` VARCHAR(255) DEFAULT NULL COMMENT '文档备注',
  `coverimg` VARCHAR(255) DEFAULT NULL COMMENT '文档封面',
  `totalfile` INT(5) DEFAULT NULL COMMENT '文档附件总数',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sys_doc_index` (
  `id` VARCHAR(32) NOT NULL COMMENT '文档目录id',
  `pid` VARCHAR(32) DEFAULT NULL COMMENT '父目录id',
  `rowNo` INT(9) DEFAULT NULL COMMENT '行号',
  `index_name` VARCHAR(255) DEFAULT NULL COMMENT '文档目录名称',
  `index_code` VARCHAR(255) DEFAULT NULL COMMENT '文档目录编号',
  `creator` VARCHAR(255) DEFAULT NULL COMMENT '创建者',
  `createTime` DATETIME DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sys_employee` (
  `id` VARCHAR(32) NOT NULL,
  `code` VARCHAR(32) DEFAULT NULL COMMENT '员工编号',
  `name` VARCHAR(40) DEFAULT NULL COMMENT '员工姓名',
  `sex` VARCHAR(10) DEFAULT NULL COMMENT '性别',
  `leaderId` VARCHAR(32) DEFAULT NULL COMMENT '上级领导',
  `positionId` VARCHAR(32) DEFAULT NULL COMMENT '职位',
  `birthday` DATE DEFAULT NULL COMMENT '生日',
  `originPlace` VARCHAR(40) DEFAULT NULL COMMENT '籍贯',
  `inDate` DATE DEFAULT NULL COMMENT '入职日期',
  `outDate` DATE DEFAULT NULL COMMENT '离职日期',
  `certType` VARCHAR(10) DEFAULT NULL COMMENT '证件类别',
  `certNo` VARCHAR(30) DEFAULT NULL COMMENT '证件编号',
  `certAddress` VARCHAR(100) DEFAULT NULL COMMENT '证件地址',
  `liveAddress` VARCHAR(100) DEFAULT NULL COMMENT '居住地址',
  `telephone` VARBINARY(20) DEFAULT NULL COMMENT '固定电话',
  `mobile` VARCHAR(20) DEFAULT NULL COMMENT '移动电话',
  `email` VARCHAR(50) DEFAULT NULL COMMENT '电子邮箱',
  `weixin` VARCHAR(30) DEFAULT NULL COMMENT '微信',
  `qq` VARCHAR(30) DEFAULT NULL COMMENT 'QQ',
  `weibo` VARCHAR(30) DEFAULT NULL COMMENT '新浪微博',
  `rowNo` INT(11) DEFAULT '10' COMMENT '行号',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效标记(1:有效,0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='员工表';

CREATE TABLE IF NOT EXISTS `sys_employee_unit` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `employeeId` VARCHAR(32) DEFAULT NULL COMMENT '员工ID',
  `unitId` VARCHAR(32) DEFAULT NULL COMMENT '机构ID',
  `jobId` VARCHAR(32) DEFAULT NULL COMMENT '岗位ID',
  `mainFlag` SMALLINT(6) DEFAULT NULL COMMENT '主岗位标志(1:主岗位,0:兼职岗位)',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效标记(1:有效,0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='员工单位表(支持身兼多职,多部门兼职)';

CREATE TABLE IF NOT EXISTS `sys_file` (
  `id` VARCHAR(32) NOT NULL COMMENT '附件id',
  `docid` VARCHAR(32) DEFAULT NULL COMMENT '文档id',
  `filegroup` VARCHAR(255) DEFAULT NULL COMMENT '文件存储所在组名',
  `filename` VARCHAR(255) DEFAULT NULL COMMENT '文件名称',
  `filepath` VARCHAR(255) DEFAULT NULL COMMENT '文件存储路径',
  `filesize` VARCHAR(20) DEFAULT NULL COMMENT '文件大小',
  `uploader` VARCHAR(32) DEFAULT NULL COMMENT '上传者',
  `uploadTime` TIMESTAMP NULL DEFAULT NULL COMMENT '上传时间',
  `url` VARCHAR(255) DEFAULT NULL COMMENT '文件访问url',
  `extension` VARCHAR(255) DEFAULT NULL COMMENT '文件扩展名',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sys_job` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `name` VARCHAR(40) DEFAULT NULL COMMENT '岗位名称',
  `code` VARCHAR(40) DEFAULT NULL COMMENT '岗位编码',
  `unitId` VARCHAR(32) DEFAULT NULL COMMENT '机构ID',
  `jobId` VARCHAR(32) DEFAULT NULL COMMENT '上级岗位ID',
  `description` VARCHAR(200) DEFAULT NULL COMMENT '岗位说明',
  `rowNo` INT(11) DEFAULT NULL COMMENT '行号',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效小计(1:有效，0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='岗位表';

CREATE TABLE IF NOT EXISTS `sys_log_record` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `userid` VARCHAR(32) DEFAULT NULL COMMENT '用户账号',
  `name` VARCHAR(32) DEFAULT NULL COMMENT '用户实名',
  `title` VARCHAR(200) DEFAULT NULL COMMENT '日志标题',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `clientName` VARCHAR(32) DEFAULT NULL COMMENT '客户端',
  `url` VARCHAR(500) DEFAULT NULL COMMENT '路径',
  `content` VARCHAR(500) DEFAULT NULL COMMENT '操作内容',
  `IP` VARCHAR(32) DEFAULT NULL COMMENT '用户IP',
  `exception_type` VARCHAR(32) DEFAULT NULL COMMENT '异常类型',
  `exception_trace` TEXT COMMENT '异常跟踪',
  `type` INT(11) DEFAULT NULL COMMENT '日志类型 1:登录日志 2:访问日志 3:操作日志 4:异常日志',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sys_logininfo` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `userId` VARCHAR(32) DEFAULT NULL COMMENT '用户ID',
  `failCount` INT(5) DEFAULT NULL COMMENT '登陆失败次数',
  `validStart` TIMESTAMP NULL DEFAULT NULL COMMENT '密码有效期起',
  `validEnd` TIMESTAMP NULL DEFAULT NULL COMMENT '密码有效期止',
  `resetFlag` SMALLINT(6) DEFAULT NULL COMMENT '是否于鏊重置密码',
  `loginTime` TIMESTAMP NULL DEFAULT NULL COMMENT '最后登录时间',
  `loginIP` VARCHAR(32) DEFAULT NULL COMMENT '最后登录IP',
  `loginType` SMALLINT(6) DEFAULT NULL COMMENT '最后登录终端',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效标记(1:有效,0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='登录信息表';

CREATE TABLE IF NOT EXISTS `sys_menu` (
  `id` VARCHAR(32) NOT NULL,
  `pid` VARCHAR(32) DEFAULT NULL COMMENT '父菜单ID',
  `code` VARCHAR(32) DEFAULT NULL COMMENT '菜单编码(可用于菜单层级排序)',
  `name` VARCHAR(40) DEFAULT NULL COMMENT '菜单名称',
  `ename` VARCHAR(100) DEFAULT NULL COMMENT '菜单英文名称',
  `cname` VARCHAR(40) DEFAULT NULL COMMENT '菜单繁体',
  `link` VARCHAR(100) DEFAULT NULL COMMENT '连接地址',
  `icon` VARCHAR(40) DEFAULT NULL COMMENT '菜单图标',
  `description` VARCHAR(100) DEFAULT NULL COMMENT '备注或描述',
  `genre` VARCHAR(10) DEFAULT NULL COMMENT '菜单类别(PC,APP)',
  `rowNo` INT(11) DEFAULT '10' COMMENT '行号',
  `child_display` INT(11) DEFAULT '1' COMMENT '子级显示 1:树节点式 2:选项卡式',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效小计(1:有效，0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改回见',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='系统菜单';

CREATE TABLE IF NOT EXISTS `sys_menu_button` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `menuId` VARCHAR(32) DEFAULT NULL COMMENT '菜单ID',
  `buttonId` VARCHAR(32) DEFAULT NULL COMMENT '按钮ID',
  `url` VARCHAR(32) DEFAULT NULL COMMENT '请求路径',
  `method` VARCHAR(32) DEFAULT NULL COMMENT '请求方式(POST,GET,DELETE等)',
  `rowNo` INT(11) DEFAULT NULL COMMENT '行号',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效标记(1:有效,0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='菜单按钮表';

CREATE TABLE IF NOT EXISTS `sys_message` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `name` VARCHAR(40) DEFAULT NULL COMMENT '消息名称',
  `code` VARCHAR(20) DEFAULT NULL COMMENT '消息编号',
  `userid` VARCHAR(32) DEFAULT NULL COMMENT '用户userid',
  `type_id` VARCHAR(32) DEFAULT NULL COMMENT '消息类型id',
  `url` VARCHAR(200) DEFAULT NULL COMMENT '消息处理路径',
  `browseUrl` VARCHAR(200) DEFAULT NULL COMMENT '浏览路径',
  `happendDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消息发生日期',
  `recivedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消息接收日期',
  `finishedDate` TIMESTAMP NULL DEFAULT NULL COMMENT '完成日期',
  `state` SMALLINT(1) DEFAULT '1' COMMENT '处理状态（1待处理 2已处理）',
  `dealType_id` VARCHAR(32) DEFAULT NULL COMMENT '处理',
  `valid` SMALLINT(1) DEFAULT '1' COMMENT '有效标记（1有效 0无效）',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者（userid）',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者（userid）',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sys_message_dealtype` (
  `id` VARCHAR(32) NOT NULL COMMENT '消息处理类型id',
  `name` VARCHAR(20) DEFAULT NULL COMMENT '消息处理类型名称',
  `code` VARCHAR(32) DEFAULT NULL COMMENT '消息处理类型code',
  `url` VARCHAR(200) DEFAULT NULL COMMENT '消息处理类型url',
  `rowno` INT(11) DEFAULT '10' COMMENT '消息处理类型行号',
  `msgType` VARCHAR(32) DEFAULT NULL COMMENT '所属消息类型id',
  `valid` SMALLINT(1) DEFAULT '1' COMMENT '有效标记（1有效 0无效）',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sys_message_queue` (
  `id` VARCHAR(32) NOT NULL COMMENT '主键id',
  `content` VARCHAR(300) DEFAULT NULL COMMENT '消息内容',
  `exchange_name` VARCHAR(50) DEFAULT NULL COMMENT '交换机名',
  `queue_name` VARCHAR(50) DEFAULT NULL COMMENT '队列名',
  `model` VARCHAR(20) DEFAULT NULL COMMENT '队列类型',
  `fail_count` INT(2) DEFAULT NULL COMMENT '失败次数',
  `correlation_id` VARCHAR(50) DEFAULT NULL COMMENT '队列标识符',
  `type_id` VARCHAR(32) DEFAULT NULL COMMENT '消息类型',
  `group_type` VARCHAR(32) DEFAULT NULL COMMENT '消息接收者类型',
  `group_id_value` VARCHAR(32) DEFAULT NULL COMMENT '消息接收者id值',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sys_message_record` (
  `id` VARCHAR(32) NOT NULL COMMENT '主键id',
  `title` VARCHAR(40) DEFAULT NULL COMMENT '消息标题',
  `content` VARCHAR(300) DEFAULT NULL COMMENT '消息内容',
  `user_id` VARCHAR(32) DEFAULT NULL COMMENT '消息发送者userid',
  `group_id` VARCHAR(32) DEFAULT NULL COMMENT '消息接收群体id',
  `group_type` SMALLINT(6) DEFAULT NULL COMMENT '消息接收群体种类 1:机构 2:角色 3:个人',
  `message_type` VARCHAR(32) DEFAULT NULL COMMENT '消息类型id',
  `message_dealtype` VARCHAR(32) DEFAULT NULL COMMENT '消息处理路径id',
  `send_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发送日期',
  `url` VARCHAR(50) DEFAULT NULL COMMENT '路径',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `creatTime` TIMESTAMP NULL DEFAULT NULL COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sys_message_type` (
  `id` VARCHAR(32) NOT NULL COMMENT '消息类别id',
  `code` VARCHAR(32) DEFAULT NULL COMMENT '消息类别编码',
  `name` VARCHAR(40) DEFAULT NULL COMMENT '消息类别名称',
  `type` VARCHAR(32) DEFAULT NULL COMMENT '消息类别大类(1:可处理消息  2:通知类消息)',
  `description` VARCHAR(200) DEFAULT NULL COMMENT '消息类别描述',
  `rowno` INT(11) DEFAULT '10' COMMENT '消息类别行号',
  `valid` SMALLINT(1) DEFAULT '1' COMMENT '有效标记（1有效 0无效）',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sys_position` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `code` VARCHAR(40) DEFAULT NULL COMMENT '职位编码',
  `name` VARCHAR(40) DEFAULT NULL COMMENT '职位名称',
  `rankCode` VARCHAR(32) DEFAULT NULL COMMENT '级别编码',
  `description` VARCHAR(40) DEFAULT NULL COMMENT '职位描述',
  `rowNo` INT(11) DEFAULT NULL COMMENT '行号',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效小计(1:有效，0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`,`name`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code_2` (`code`),
  UNIQUE KEY `code_3` (`code`),
  UNIQUE KEY `name_2` (`name`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_position_button` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `positionId` VARCHAR(32) DEFAULT NULL COMMENT '岗位ID',
  `buttonId` VARCHAR(32) DEFAULT NULL COMMENT '按钮ID',
  `menuId` VARCHAR(32) DEFAULT NULL COMMENT '菜单ID',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效小计(1:有效，0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='按钮岗位(职位关联表)';

CREATE TABLE IF NOT EXISTS `sys_position_menu` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `positionId` VARCHAR(32) DEFAULT NULL COMMENT '岗位ID',
  `menuId` VARCHAR(32) DEFAULT NULL COMMENT '菜单ID',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效小计(1:有效，0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='岗位(职位)菜单关联表';

CREATE TABLE IF NOT EXISTS `sys_position_rank` (
  `id` VARCHAR(32) NOT NULL,
  `code` VARCHAR(32) DEFAULT NULL COMMENT '级别编码',
  `name` VARCHAR(40) DEFAULT NULL COMMENT '级别名称',
  `typeCode` VARCHAR(32) DEFAULT NULL COMMENT '职位类别',
  `description` VARCHAR(50) DEFAULT NULL COMMENT '级别描述',
  `rowNo` INT(11) DEFAULT NULL COMMENT '行号',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效小计(1:有效，0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='职位级别表';

CREATE TABLE IF NOT EXISTS `sys_positiontype` (
  `id` VARCHAR(32) NOT NULL,
  `code` VARCHAR(20) DEFAULT NULL COMMENT '类别编码',
  `name` VARCHAR(30) DEFAULT NULL COMMENT '类别名称',
  `description` VARCHAR(200) DEFAULT NULL COMMENT '类别描述',
  `rowNo` INT(11) DEFAULT NULL COMMENT '行号',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效小计(1:有效，0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='职位类别表';

CREATE TABLE IF NOT EXISTS `sys_role` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `rolerank` VARCHAR(32) DEFAULT NULL COMMENT '角色分类(role_rank)',
  `code` VARCHAR(32) DEFAULT NULL,
  `name` VARCHAR(40) DEFAULT NULL COMMENT '角色名称(如管理员)',
  `description` VARCHAR(200) DEFAULT NULL COMMENT '角色描述',
  `rowNo` INT(11) DEFAULT '10' COMMENT '行号',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效小计(1:有效，0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='角色表';

CREATE TABLE IF NOT EXISTS `sys_role_button` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `roleId` VARCHAR(32) DEFAULT NULL COMMENT '角色ID',
  `menuId` VARCHAR(32) DEFAULT NULL COMMENT '菜单ID',
  `buttonId` VARCHAR(32) DEFAULT NULL COMMENT '按钮ID',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效小计(1:有效，0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menuId` (`menuId`,`buttonId`,`roleId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='按钮角色关联表';

CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `roleId` VARCHAR(32) DEFAULT NULL COMMENT '角色ID',
  `menuId` VARCHAR(32) DEFAULT NULL COMMENT '菜单ID',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效小计(1:有效，0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roleId` (`roleId`,`menuId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='角色菜单关联表';

CREATE TABLE IF NOT EXISTS `sys_role_rank` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `CODE` VARCHAR(32) DEFAULT NULL,
  `name` VARCHAR(40) DEFAULT NULL COMMENT '级别或分类名称',
  `description` VARCHAR(200) DEFAULT NULL COMMENT '级别描述',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效小计(1:有效，0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `rowno` INT(11) NOT NULL DEFAULT '10' COMMENT '行号',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='角色分类表(如集团角色,区域角色,地区角色)';

CREATE TABLE IF NOT EXISTS `sys_role_user` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `roleId` VARCHAR(32) DEFAULT NULL COMMENT '角色ID',
  `userId` VARCHAR(32) DEFAULT NULL COMMENT '用户ID',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效小计(1:有效，0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roleId` (`roleId`,`userId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='角色用户关联表';

CREATE TABLE IF NOT EXISTS `sys_security` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `validity` INT(11) DEFAULT NULL COMMENT '密码有效期(天)',
  `intensity` VARCHAR(40) DEFAULT NULL COMMENT '密码强度(正则表达式)',
  `retries` INT(11) DEFAULT NULL COMMENT '密码重试次数',
  `password` VARCHAR(20) DEFAULT NULL COMMENT '默认密码',
  `rowNo` INT(11) DEFAULT NULL COMMENT '行号',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效标记(1:有效,0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `loginLog` INT(11) DEFAULT '1' COMMENT '登录日志开关（1开启2关闭）',
  `accesLog` INT(11) DEFAULT '1' COMMENT '访问日志开关（1开启2关闭）',
  `operLog` INT(11) DEFAULT '1' COMMENT '操作日志开关（1开启2关闭）',
  `exceLog` INT(11) DEFAULT '1' COMMENT '异常日志开关（1开启2关闭）',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='安全策略表';

CREATE TABLE IF NOT EXISTS `sys_unit` (
  `id` VARCHAR(32) NOT NULL,
  `code` VARCHAR(32) DEFAULT NULL COMMENT '机构编码',
  `name` VARCHAR(40) DEFAULT NULL COMMENT '机构名称',
  `fullName` VARCHAR(60) DEFAULT NULL COMMENT '机构全称',
  `pid` VARCHAR(32) DEFAULT NULL COMMENT '父ID',
  `rowNo` INT(11) DEFAULT NULL COMMENT '行号',
  `type` VARCHAR(20) DEFAULT NULL COMMENT '机构类别',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效标记(1:有效,0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='机构表';

CREATE TABLE IF NOT EXISTS `sys_user` (
  `ID` VARCHAR(32) NOT NULL COMMENT 'ID',
  `userid` VARCHAR(32) DEFAULT NULL,
  `password` VARCHAR(200) DEFAULT NULL,
  `name` VARCHAR(20) DEFAULT NULL,
  `mobile` VARCHAR(20) DEFAULT NULL COMMENT '用户联系电话',
  `telephone` VARCHAR(20) DEFAULT NULL COMMENT '固定电话',
  `mobile2` VARCHAR(20) DEFAULT NULL COMMENT '移动电话',
  `email` VARCHAR(50) DEFAULT NULL COMMENT '电子邮箱',
  `weixin` VARCHAR(30) DEFAULT NULL COMMENT '微信',
  `qq` VARCHAR(30) DEFAULT NULL COMMENT 'QQ',
  `weibo` VARCHAR(30) DEFAULT NULL COMMENT '新浪微博',
  `employeeId` VARCHAR(32) DEFAULT NULL COMMENT '关联员工ID',
  `keyt` VARCHAR(200) DEFAULT NULL COMMENT '用户秘钥(签名下发token)',
  `rowNo` INT(11) DEFAULT '10' COMMENT '行号',
  `site_layout` VARCHAR(50) DEFAULT 'default' COMMENT '站点布局 DEFAULT:顶部布局 LEFT-layout:左侧布局 top-LEFT-layout:顶部+左侧布局',
  `valid` SMALLINT(6) UNSIGNED DEFAULT '1' COMMENT '有效标记(1:有效,0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `userId` (`userid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='用户表(登录用户,用户可关联员工)';

CREATE TABLE IF NOT EXISTS `sys_user_button` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `userId` VARCHAR(32) DEFAULT NULL COMMENT '用户ID',
  `menuId` VARCHAR(32) DEFAULT NULL COMMENT '菜单ID',
  `buttonId` VARCHAR(32) DEFAULT NULL COMMENT '按钮ID',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效小计(1:有效，0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='按钮用户关联表';

CREATE TABLE IF NOT EXISTS `sys_user_menu` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `userId` VARCHAR(32) DEFAULT NULL COMMENT '用户ID',
  `menuId` VARCHAR(32) DEFAULT NULL COMMENT '菜单ID',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效小计(1:有效，0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='用户菜单关联表';

CREATE TABLE IF NOT EXISTS `sys_value` (
  `id` VARCHAR(32) NOT NULL,
  `code` VARCHAR(24) DEFAULT NULL COMMENT '唯一代码',
  `value` VARCHAR(32) DEFAULT NULL COMMENT '码值',
  `name` VARCHAR(40) DEFAULT NULL COMMENT '码值显示值',
  `description` VARCHAR(50) DEFAULT NULL COMMENT '使用描述',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效小计(1:有效，0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `rowno` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='系统所有可配置下拉选项';

/*字段调整2019-11-1*/
CREATE TABLE IF NOT EXISTS `sys_access_client` (
  `id` VARCHAR(32) NOT NULL,
  `code` VARCHAR(23) DEFAULT NULL COMMENT '客户端标识',
  `name` VARCHAR(40) DEFAULT NULL COMMENT '客户端名称',
  `keyt` VARCHAR(100) DEFAULT NULL COMMENT '客户端秘钥',
  `access_code` VARCHAR(100) DEFAULT NULL COMMENT '授权码',
  `refresh` INT(11) DEFAULT NULL COMMENT 'token更新时间(秒)',
  `rowNo` INT(11) DEFAULT NULL COMMENT '行号',
  `valid` SMALLINT(6) DEFAULT '1' COMMENT '有效标记(1:有效,0:无效)',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_access_resource` (
  `id` VARCHAR(32) NOT NULL COMMENT 'id',
  `serverCode` VARCHAR(32) DEFAULT NULL COMMENT '服务名称',
  `path` VARCHAR(300) DEFAULT NULL COMMENT '请求路径',
  `pattern` VARCHAR(400) DEFAULT NULL COMMENT '表达式路径',
  `method` VARCHAR(10) DEFAULT NULL COMMENT '请求方式',
  `description` VARCHAR(500) DEFAULT NULL COMMENT '资源描述',
  `creator` VARCHAR(32) DEFAULT NULL COMMENT '创建者',
  `createTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` VARCHAR(32) DEFAULT NULL COMMENT '修改者',
  `editTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`,`method`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='第三方系统资源权限表';

/*2019-10-28*/
ALTER TABLE `sys_access_resource` ADD clientCode VARCHAR(32) DEFAULT NULL COMMENT '客户端标识';

/*2019-10-28 删除冗余的唯一索引*/
ALTER TABLE sys_access_resource DROP INDEX path;

/*2019-10-29 添加唯一索引*/
ALTER TABLE sys_administration ADD UNIQUE INDEX(CODE,NAME);

/*2019-10-29 删除冗余的唯一索引*/
ALTER TABLE `sys_position` DROP INDEX  NAME;
ALTER TABLE `sys_position` DROP INDEX code_2;
ALTER TABLE `sys_position` DROP INDEX code_3;
ALTER TABLE `sys_position` DROP INDEX name_2;

/*2019-10-31 */
ALTER TABLE sys_client ADD COLUMN `access_code` VARCHAR(100) DEFAULT NULL COMMENT '第三方授权码';
/*DROP TABLE sys_access_client;*/

/*2019-11-05 字段长度调整,之前调整未改sql*/
ALTER TABLE sys_administration MODIFY COLUMN NAME VARCHAR(32) DEFAULT NULL COMMENT '名称';
ALTER TABLE sys_administration MODIFY COLUMN pinyin VARCHAR(100) DEFAULT NULL COMMENT '拼音';

/*2019-11-5 新加处理类型code列*/
ALTER TABLE sys_message add column `dealType_code` VARCHAR(32) DEFAULT NULL COMMENT '处理类型code';

/*2019-11-14 修改表字段名称*/
ALTER TABLE `sys_doc_index` CHANGE indexname index_name VARCHAR(255) DEFAULT NULL COMMENT '文档目录名称';
ALTER TABLE `sys_doc_index` CHANGE indexcode index_code VARCHAR(255) DEFAULT NULL COMMENT '文档目录编号';

/*2019-11-14 添加新表*/
CREATE TABLE `sys_role_unit` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `unit_id` varchar(32) DEFAULT NULL COMMENT '机构ID',
  `valid` smallint(6) DEFAULT '1' COMMENT '有效标记(1:有效,0:无效)',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `editor` varchar(32) DEFAULT NULL COMMENT '修改者',
  `edit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构角色表(角色分级)';

/*2019-11-15 表字段修改*/
ALTER TABLE sys_doc ADD COLUMN creator VARCHAR(32) DEFAULT NULL COMMENT '创建者'; 
ALTER TABLE sys_doc ADD COLUMN createTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'; 
ALTER TABLE sys_doc ADD COLUMN editor VARCHAR(32) DEFAULT NULL COMMENT '修改者'; 
ALTER TABLE sys_file MODIFY COLUMN filegroup VARCHAR(255) DEFAULT '' COMMENT '文件存储所在组名'; 

/*2019-11-19 表字段修改*/
UPDATE sys_administration SET creator='admin',editor='admin';
ALTER TABLE sys_administration MODIFY COLUMN location VARCHAR(100) DEFAULT NULL COMMENT '坐标'; 

/*2019-11-25 表字段修改*/
ALTER TABLE sys_role ADD COLUMN type int(11) DEFAULT '0' COMMENT '角色类型区分0是基础角色添加的，1是角色分类自定义的';

/*2019-11-28 表字段调整*/
ALTER TABLE sys_unit ADD COLUMN type_id VARCHAR(32) NOT NULL COMMENT '机构类型id';

COMMIT;