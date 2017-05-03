#添加后台用户表
CREATE TABLE `t_adminuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `real_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` char(11) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#添加提现方式表
CREATE TABLE `t_withdaw_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '名称',
  `position` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='提现方式表';


#商铺图片
DROP TABLE IF EXISTS  `t_shoper_img`;
CREATE TABLE `t_shoper_img` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`shoper_id` INT(11) NOT NULl COMMENT '关联商铺id',
`store_id` INT(11) NOT NULl COMMENT '关联门店id',
`path` VARCHAR(255) NOT NULl COMMENT '保存路径',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商铺图片';

#修改销售人员信息的时间表
ALTER TABLE `t_salesman` DROP `addtime`;
ALTER TABLE `t_salesman` ADD `add_time` int(11) NOT NULL COMMENT '添加时间';

ALTER TABLE t_shoper ADD pay_account varchar(64) not null default '' COMMENT '支付宝或者微信账号';

#创建茶豆币消费记录
CREATE TABLE `t_shoper_tea_ beans_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shoper_id` int(11) NOT NULL COMMENT '商家id',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺id',
  `num` decimal(10,2) NOT NULL DEFAULT '0.00',
  `add_time` int(11) DEFAULT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0收入; 1消费;2提现',
  `method` tinyint(1) DEFAULT '0' COMMENT '0减，1加',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商铺的茶豆币记录，num不能为负值'

CREATE TABLE `t_shoper_tea_ beans_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shoper_id` int(11) NOT NULL COMMENT '商家id',
  `store_id` int(11)  COMMENT '店铺id',
  `num` decimal(10,2) NOT NULL DEFAULT '0.00',
  `add_time` int(11) DEFAULT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0收入; 1消费;2提现',
  `method` tinyint(1) DEFAULT '0' COMMENT '0减，1加',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商铺的茶豆币记录，num不能为负值';

