/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : cmt2

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-07-04 09:29:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_action_log
-- ----------------------------
DROP TABLE IF EXISTS `t_action_log`;
CREATE TABLE `t_action_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '平台角色用户id',
  `auth_user_name` varchar(10) NOT NULL DEFAULT '' COMMENT '平台角色用户名',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '行为',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `delete_tag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除，0-未删除，1-删除',
  `delete_time` int(11) DEFAULT NULL COMMENT '逻辑删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台后台人员行为日志表';

-- ----------------------------
-- Records of t_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_active
-- ----------------------------
DROP TABLE IF EXISTS `t_active`;
CREATE TABLE `t_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active_name` varchar(255) DEFAULT NULL COMMENT '活动名称',
  `content` text COMMENT '活动内容',
  `address` varchar(255) DEFAULT NULL COMMENT '活动地址',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否付费活动，0-否，1-是',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `user_num` int(11) NOT NULL DEFAULT '0' COMMENT '参与总人数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '活动状态，1-下架，0-上架',
  `active_start_time` int(11) DEFAULT NULL COMMENT '活动开始时间',
  `active_end_time` int(11) DEFAULT NULL COMMENT '活动结束时间',
  `apply_start_time` int(11) DEFAULT NULL COMMENT '报名开始时间',
  `apply_end_time` int(11) DEFAULT NULL COMMENT '活动结束时间',
  `xiajia_time` int(11) DEFAULT NULL COMMENT '活动下架时间',
  `delete_tag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除，0-未删除，1-删除',
  `delete_time` int(11) DEFAULT NULL COMMENT '逻辑删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动表';

-- ----------------------------
-- Records of t_active
-- ----------------------------

-- ----------------------------
-- Table structure for t_active_user
-- ----------------------------
DROP TABLE IF EXISTS `t_active_user`;
CREATE TABLE `t_active_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `active_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动id',
  `wx_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '报名人id（微信用户id）',
  `user_name` varchar(10) NOT NULL DEFAULT '' COMMENT '报名人姓名',
  `phone` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别，0-男，1-女',
  `add_time` int(11) DEFAULT NULL COMMENT '报名时间',
  `delete_tag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除，0-未删除，1-删除',
  `delete_time` int(11) DEFAULT NULL COMMENT '逻辑删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动报名表';

-- ----------------------------
-- Records of t_active_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_ad
-- ----------------------------
DROP TABLE IF EXISTS `t_ad`;
CREATE TABLE `t_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(255) DEFAULT NULL COMMENT '广告名称',
  `link` varchar(255) DEFAULT NULL COMMENT '广告连接',
  `total_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '广告总金额',
  `remain` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `ad_attach` varchar(255) DEFAULT NULL COMMENT '广告图片名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '广告状态，0-上架，1-下架',
  `watch_time` tinyint(3) unsigned NOT NULL COMMENT '奖励规则-观看停留时间',
  `bonus` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '奖金规则-奖金',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `xiajia_time` int(11) DEFAULT NULL COMMENT '下架时间',
  `delete_tag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除，0-未删除，1-删除',
  `delete_time` int(11) DEFAULT NULL COMMENT '逻辑删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of t_ad
-- ----------------------------
INSERT INTO `t_ad` VALUES ('12', 'ygh', '', '20000.00', '20000.00', 'fsdfjsjfo', '0', '60', '20.00', '1489477745', null, '0', null);
INSERT INTO `t_ad` VALUES ('13', '爱好', '东方闪电', '6000.00', '3000.00', 'fgbfb', '0', '30', '20.00', '1489635878', null, '1', '1489642832');

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `name` varchar(20) NOT NULL COMMENT '真实姓名',
  `password` char(32) NOT NULL COMMENT '密码',
  `phone` varchar(12) NOT NULL COMMENT '电话号码 ',
  `salt` char(6) NOT NULL,
  `last_login_time` int(11) unsigned DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(15) DEFAULT NULL COMMENT '最后登录ip',
  `create_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('2', '小张', '涨涨', 'e10adc3949ba59abbe56e057f20f883e', '14712121212', 'KargmM', '1491440409', '127.0.0.1', '1489542414');

-- ----------------------------
-- Table structure for t_adminuser
-- ----------------------------
DROP TABLE IF EXISTS `t_adminuser`;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_adminuser
-- ----------------------------
INSERT INTO `t_adminuser` VALUES ('1', 'admin', '昂恪网络', '13812345678', 'HLUlrS3KTOEpA8M6r9h3', '$2y$13$K2cDIFZqHWavrmhsXx/Boel143GAmeplbF0KeIbk01yWJnge09IFO', null, 'a@a.com', '10', '0', '1495609898');
INSERT INTO `t_adminuser` VALUES ('3', 'test', 'test', '15982707139', 'UaXfKPGuk9JdT17ZsKlNQFxgfs6MuJdZ', '$2y$13$p5izZRmnOg4zHiKZ9vGMuOj5v7xD3SyDPvdevNmT82MsvFze3Zhbi', null, '1210783098@qq.com', '10', '1495599360', '1495599360');

-- ----------------------------
-- Table structure for t_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role`;
CREATE TABLE `t_admin_role` (
  `admin_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin_role
-- ----------------------------
INSERT INTO `t_admin_role` VALUES ('3', '4');
INSERT INTO `t_admin_role` VALUES ('2', '1');
INSERT INTO `t_admin_role` VALUES ('3', '4');
INSERT INTO `t_admin_role` VALUES ('4', '1');
INSERT INTO `t_admin_role` VALUES ('3', '4');

-- ----------------------------
-- Table structure for t_adv
-- ----------------------------
DROP TABLE IF EXISTS `t_adv`;
CREATE TABLE `t_adv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '广告标题',
  `photo` varchar(255) NOT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_adv
-- ----------------------------
INSERT INTO `t_adv` VALUES ('9', '0421041', '/upload/adv/201706161804351104.png');
INSERT INTO `t_adv` VALUES ('10', '4524', '/upload/adv/201706161804439467.png');

-- ----------------------------
-- Table structure for t_ad_awards
-- ----------------------------
DROP TABLE IF EXISTS `t_ad_awards`;
CREATE TABLE `t_ad_awards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) DEFAULT NULL COMMENT '广告id',
  `wx_user_id` int(11) DEFAULT NULL COMMENT '观看人id（微信用户id）',
  `bonus` decimal(10,2) DEFAULT NULL COMMENT '奖金',
  `start_time` int(11) DEFAULT NULL COMMENT '观看开始时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='广告奖励表';

-- ----------------------------
-- Records of t_ad_awards
-- ----------------------------
INSERT INTO `t_ad_awards` VALUES ('1', '2', '21656', '20.00', '1236498');

-- ----------------------------
-- Table structure for t_after_service
-- ----------------------------
DROP TABLE IF EXISTS `t_after_service`;
CREATE TABLE `t_after_service` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单商品id',
  `type` tinyint(1) DEFAULT NULL COMMENT '售后类型，1-换货，2-退款',
  `num` int(11) DEFAULT NULL COMMENT '换货/退款数量',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '退款总金额',
  `cash_amout` varchar(255) DEFAULT NULL COMMENT '现金退款额度',
  `credtit_amout` decimal(3,2) DEFAULT NULL COMMENT '授信退款额度，优先退到授信账户',
  `beans_amount` decimal(10,2) DEFAULT NULL COMMENT '茶豆币退款数量，授信满了，第二退茶豆币',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='售后表';

-- ----------------------------
-- Records of t_after_service
-- ----------------------------

-- ----------------------------
-- Table structure for t_auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_assignment`;
CREATE TABLE `t_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `t_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `t_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_auth_assignment
-- ----------------------------
INSERT INTO `t_auth_assignment` VALUES ('业务员管理', '1', '1495609934');
INSERT INTO `t_auth_assignment` VALUES ('业务员管理', '3', '1495599394');
INSERT INTO `t_auth_assignment` VALUES ('商城管理', '1', '1495609936');
INSERT INTO `t_auth_assignment` VALUES ('广告管理', '1', '1497443443');
INSERT INTO `t_auth_assignment` VALUES ('提现管理', '1', '1495779458');
INSERT INTO `t_auth_assignment` VALUES ('提现管理', '3', '1495599397');
INSERT INTO `t_auth_assignment` VALUES ('权限管理', '1', '1495609942');
INSERT INTO `t_auth_assignment` VALUES ('权限管理', '3', '1495599400');
INSERT INTO `t_auth_assignment` VALUES ('用户管理', '1', '1497440624');
INSERT INTO `t_auth_assignment` VALUES ('留言管理', '1', '1495609948');
INSERT INTO `t_auth_assignment` VALUES ('统计中心', '1', '1497443421');
INSERT INTO `t_auth_assignment` VALUES ('门店管理', '1', '1495609948');
INSERT INTO `t_auth_assignment` VALUES ('门店管理', '3', '1495599889');

-- ----------------------------
-- Table structure for t_auth_item
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_item`;
CREATE TABLE `t_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `t_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `t_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_auth_item
-- ----------------------------
INSERT INTO `t_auth_item` VALUES ('/admin/*', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/admin/assignment/*', '2', null, null, null, '1495598238', '1495598238');
INSERT INTO `t_auth_item` VALUES ('/admin/assignment/assign', '2', null, null, null, '1495598238', '1495598238');
INSERT INTO `t_auth_item` VALUES ('/admin/assignment/index', '2', null, null, null, '1495598238', '1495598238');
INSERT INTO `t_auth_item` VALUES ('/admin/assignment/revoke', '2', null, null, null, '1495598238', '1495598238');
INSERT INTO `t_auth_item` VALUES ('/admin/assignment/view', '2', null, null, null, '1495598238', '1495598238');
INSERT INTO `t_auth_item` VALUES ('/admin/default/*', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/default/index', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/menu/*', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/menu/create', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/menu/delete', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/menu/index', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/menu/update', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/menu/view', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/permission/*', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/permission/assign', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/permission/create', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/permission/delete', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/permission/index', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/permission/remove', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/permission/update', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/permission/view', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/role/assign', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/role/create', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/role/delete', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/role/index', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/role/remove', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/role/update', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/role/view', '2', null, null, null, '1495598239', '1495598239');
INSERT INTO `t_auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/route/assign', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/route/create', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/route/index', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/route/refresh', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/route/remove', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/rule/*', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/rule/create', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/rule/delete', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/rule/index', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/rule/update', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/rule/view', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/user/*', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/admin/user/activate', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/user/change-password', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/user/delete', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/user/index', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/user/login', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/user/logout', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/user/request-password-reset', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/user/reset-password', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/user/signup', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/admin/user/view', '2', null, null, null, '1495598240', '1495598240');
INSERT INTO `t_auth_item` VALUES ('/adminuser/*', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/adminuser/create', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/adminuser/delete', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/adminuser/index', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/adminuser/update', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/adminuser/view', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/adv/*', '2', null, null, null, '1497440559', '1497440559');
INSERT INTO `t_auth_item` VALUES ('/adv/add', '2', null, null, null, '1497440580', '1497440580');
INSERT INTO `t_auth_item` VALUES ('/adv/del', '2', null, null, null, '1497440602', '1497440602');
INSERT INTO `t_auth_item` VALUES ('/adv/index', '2', null, null, null, '1497440506', '1497440506');
INSERT INTO `t_auth_item` VALUES ('/category/*', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/category/add', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/category/del', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/category/edit', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/category/index', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/credit/*', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/credit/create', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/credit/delete', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/credit/order', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/credit/refund', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/credit/update', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/credit/view', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/debug/*', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/debug/default/*', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/debug/default/db-explain', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/debug/default/download-mail', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/debug/default/index', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/debug/default/toolbar', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/debug/default/view', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/gii/*', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/gii/default/*', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/gii/default/action', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/gii/default/diff', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/gii/default/preview', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/gii/default/view', '2', null, null, null, '1495598242', '1495598242');
INSERT INTO `t_auth_item` VALUES ('/goods/*', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/goods/add', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/goods/del', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/goods/edit', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/goods/index', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/goods/shangjia', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/gridview/*', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/gridview/export/*', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/gridview/export/download', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/message/*', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/message/delete', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/message/index', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/message/update', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/message/view', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/order/*', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/order/excel', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/order/index', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/order/sed', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/redactor/*', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/salesman/*', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/salesman/create', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/salesman/delete', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/salesman/index', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/salesman/update', '2', null, null, null, '1495598243', '1495598243');
INSERT INTO `t_auth_item` VALUES ('/site/*', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/site/error', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/site/index', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/site/login', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/site/logout', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/statistics/*', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/statistics/b2b/*', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/statistics/b2b/goods', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/statistics/b2b/index', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/statistics/b2b/store-buy', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/statistics/cdb/*', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/statistics/cdb/index', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/statistics/default/*', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/statistics/default/index', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/statistics/store/*', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/statistics/store/index', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/statistics/user/*', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/statistics/user/index', '2', null, null, null, '1495598241', '1495598241');
INSERT INTO `t_auth_item` VALUES ('/store/*', '2', '门店管理', null, null, '1495597295', '1495597295');
INSERT INTO `t_auth_item` VALUES ('/store/create', '2', null, null, null, '1495597308', '1495597308');
INSERT INTO `t_auth_item` VALUES ('/store/delete', '2', null, null, null, '1495597310', '1495597310');
INSERT INTO `t_auth_item` VALUES ('/store/index', '2', null, null, null, '1495597306', '1495597306');
INSERT INTO `t_auth_item` VALUES ('/store/shouxinhuankuan', '2', null, null, null, '1495597297', '1495597297');
INSERT INTO `t_auth_item` VALUES ('/store/spstatus', '2', null, null, null, '1495597301', '1495597301');
INSERT INTO `t_auth_item` VALUES ('/store/update', '2', null, null, null, '1495597304', '1495597304');
INSERT INTO `t_auth_item` VALUES ('/tools/*', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/tools/address', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/tools/upload', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/users/*', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/users/userslist', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/users/usersrecharge', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/users/usersreduce', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/withdraw/*', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/withdraw/create', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/withdraw/delete', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/withdraw/index', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/withdraw/note', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/withdraw/refuse', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/withdraw/update', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/withdraw/via', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('/withdraw/view', '2', null, null, null, '1495598244', '1495598244');
INSERT INTO `t_auth_item` VALUES ('业务员管理', '2', '业务员管理', null, null, '1495598427', '1495610448');
INSERT INTO `t_auth_item` VALUES ('商城管理', '2', '商城 管理', null, null, '1495600573', '1495604161');
INSERT INTO `t_auth_item` VALUES ('广告管理', '2', '广告管理', null, null, '1497440662', '1497443469');
INSERT INTO `t_auth_item` VALUES ('提现管理', '2', '提现管理', null, null, '1495598363', '1495598363');
INSERT INTO `t_auth_item` VALUES ('权限管理', '2', '权限管理', null, null, '1495598502', '1495610580');
INSERT INTO `t_auth_item` VALUES ('用户管理', '2', '用户管理', null, null, '1495604270', '1495604365');
INSERT INTO `t_auth_item` VALUES ('留言管理', '2', '留言管理', null, null, '1495598394', '1495598394');
INSERT INTO `t_auth_item` VALUES ('统计中心', '2', '统计中心', null, null, '1495598470', '1495610146');
INSERT INTO `t_auth_item` VALUES ('门店管理', '2', '门店管理', null, null, '1495598287', '1495610623');

-- ----------------------------
-- Table structure for t_auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_item_child`;
CREATE TABLE `t_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `t_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `t_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `t_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_auth_item_child
-- ----------------------------
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/*');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/assignment/*');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/assignment/assign');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/assignment/index');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/assignment/revoke');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/assignment/view');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/default/*');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/default/index');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/menu/*');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/menu/create');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/menu/delete');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/menu/index');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/menu/update');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/menu/view');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/permission/*');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/permission/assign');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/permission/create');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/permission/delete');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/permission/index');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/permission/remove');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/permission/update');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/permission/view');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/role/*');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/role/assign');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/role/create');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/role/delete');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/role/index');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/role/remove');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/role/update');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/role/view');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/route/*');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/route/assign');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/route/create');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/route/index');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/route/refresh');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/route/remove');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/rule/*');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/rule/create');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/rule/delete');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/rule/index');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/rule/update');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/rule/view');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/user/*');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/user/activate');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/user/change-password');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/user/delete');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/user/index');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/user/login');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/user/logout');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/user/request-password-reset');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/user/reset-password');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/user/signup');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/user/view');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/adminuser/*');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/adminuser/create');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/adminuser/delete');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/adminuser/index');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/adminuser/update');
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/adminuser/view');
INSERT INTO `t_auth_item_child` VALUES ('广告管理', '/adv/*');
INSERT INTO `t_auth_item_child` VALUES ('广告管理', '/adv/add');
INSERT INTO `t_auth_item_child` VALUES ('广告管理', '/adv/del');
INSERT INTO `t_auth_item_child` VALUES ('广告管理', '/adv/index');
INSERT INTO `t_auth_item_child` VALUES ('商城管理', '/category/*');
INSERT INTO `t_auth_item_child` VALUES ('商城管理', '/category/add');
INSERT INTO `t_auth_item_child` VALUES ('商城管理', '/category/del');
INSERT INTO `t_auth_item_child` VALUES ('商城管理', '/category/edit');
INSERT INTO `t_auth_item_child` VALUES ('商城管理', '/category/index');
INSERT INTO `t_auth_item_child` VALUES ('商城管理', '/goods/*');
INSERT INTO `t_auth_item_child` VALUES ('商城管理', '/goods/add');
INSERT INTO `t_auth_item_child` VALUES ('商城管理', '/goods/del');
INSERT INTO `t_auth_item_child` VALUES ('商城管理', '/goods/edit');
INSERT INTO `t_auth_item_child` VALUES ('商城管理', '/goods/index');
INSERT INTO `t_auth_item_child` VALUES ('商城管理', '/goods/shangjia');
INSERT INTO `t_auth_item_child` VALUES ('留言管理', '/message/*');
INSERT INTO `t_auth_item_child` VALUES ('留言管理', '/message/delete');
INSERT INTO `t_auth_item_child` VALUES ('留言管理', '/message/index');
INSERT INTO `t_auth_item_child` VALUES ('留言管理', '/message/update');
INSERT INTO `t_auth_item_child` VALUES ('留言管理', '/message/view');
INSERT INTO `t_auth_item_child` VALUES ('商城管理', '/order/*');
INSERT INTO `t_auth_item_child` VALUES ('商城管理', '/order/excel');
INSERT INTO `t_auth_item_child` VALUES ('商城管理', '/order/index');
INSERT INTO `t_auth_item_child` VALUES ('商城管理', '/order/sed');
INSERT INTO `t_auth_item_child` VALUES ('业务员管理', '/salesman/*');
INSERT INTO `t_auth_item_child` VALUES ('业务员管理', '/salesman/create');
INSERT INTO `t_auth_item_child` VALUES ('业务员管理', '/salesman/delete');
INSERT INTO `t_auth_item_child` VALUES ('业务员管理', '/salesman/index');
INSERT INTO `t_auth_item_child` VALUES ('业务员管理', '/salesman/update');
INSERT INTO `t_auth_item_child` VALUES ('统计中心', '/statistics/*');
INSERT INTO `t_auth_item_child` VALUES ('统计中心', '/statistics/b2b/*');
INSERT INTO `t_auth_item_child` VALUES ('统计中心', '/statistics/b2b/goods');
INSERT INTO `t_auth_item_child` VALUES ('统计中心', '/statistics/b2b/index');
INSERT INTO `t_auth_item_child` VALUES ('统计中心', '/statistics/b2b/store-buy');
INSERT INTO `t_auth_item_child` VALUES ('统计中心', '/statistics/cdb/*');
INSERT INTO `t_auth_item_child` VALUES ('统计中心', '/statistics/cdb/index');
INSERT INTO `t_auth_item_child` VALUES ('统计中心', '/statistics/default/*');
INSERT INTO `t_auth_item_child` VALUES ('统计中心', '/statistics/default/index');
INSERT INTO `t_auth_item_child` VALUES ('统计中心', '/statistics/store/*');
INSERT INTO `t_auth_item_child` VALUES ('统计中心', '/statistics/store/index');
INSERT INTO `t_auth_item_child` VALUES ('统计中心', '/statistics/user/*');
INSERT INTO `t_auth_item_child` VALUES ('统计中心', '/statistics/user/index');
INSERT INTO `t_auth_item_child` VALUES ('门店管理', '/store/*');
INSERT INTO `t_auth_item_child` VALUES ('门店管理', '/store/create');
INSERT INTO `t_auth_item_child` VALUES ('门店管理', '/store/delete');
INSERT INTO `t_auth_item_child` VALUES ('门店管理', '/store/index');
INSERT INTO `t_auth_item_child` VALUES ('门店管理', '/store/shouxinhuankuan');
INSERT INTO `t_auth_item_child` VALUES ('门店管理', '/store/spstatus');
INSERT INTO `t_auth_item_child` VALUES ('门店管理', '/store/update');
INSERT INTO `t_auth_item_child` VALUES ('门店管理', '/tools/*');
INSERT INTO `t_auth_item_child` VALUES ('门店管理', '/tools/address');
INSERT INTO `t_auth_item_child` VALUES ('门店管理', '/tools/upload');
INSERT INTO `t_auth_item_child` VALUES ('用户管理', '/users/*');
INSERT INTO `t_auth_item_child` VALUES ('用户管理', '/users/userslist');
INSERT INTO `t_auth_item_child` VALUES ('用户管理', '/users/usersrecharge');
INSERT INTO `t_auth_item_child` VALUES ('用户管理', '/users/usersreduce');
INSERT INTO `t_auth_item_child` VALUES ('提现管理', '/withdraw/*');
INSERT INTO `t_auth_item_child` VALUES ('提现管理', '/withdraw/create');
INSERT INTO `t_auth_item_child` VALUES ('提现管理', '/withdraw/delete');
INSERT INTO `t_auth_item_child` VALUES ('提现管理', '/withdraw/index');
INSERT INTO `t_auth_item_child` VALUES ('提现管理', '/withdraw/note');
INSERT INTO `t_auth_item_child` VALUES ('提现管理', '/withdraw/refuse');
INSERT INTO `t_auth_item_child` VALUES ('提现管理', '/withdraw/update');
INSERT INTO `t_auth_item_child` VALUES ('提现管理', '/withdraw/via');
INSERT INTO `t_auth_item_child` VALUES ('提现管理', '/withdraw/view');

-- ----------------------------
-- Table structure for t_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_rule`;
CREATE TABLE `t_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for t_beans_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_beans_goods`;
CREATE TABLE `t_beans_goods` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `cover` varchar(255) DEFAULT NULL COMMENT '商品封面图片名称',
  `content` text COMMENT '产品详情，图文',
  `store` int(11) DEFAULT NULL COMMENT '商品库存，夺宝总数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '现金价格',
  `beans` decimal(10,2) DEFAULT NULL COMMENT '茶豆币兑换价，数量',
  `address` varchar(255) DEFAULT NULL COMMENT '商品位置（仓库）',
  `spec` varchar(255) DEFAULT NULL COMMENT '产品规格',
  `note` varchar(255) DEFAULT NULL COMMENT '商品备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商品状态，0-上架，1-下架',
  `add_time` int(11) DEFAULT NULL COMMENT '商品添加时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='茶豆币商品';

-- ----------------------------
-- Records of t_beans_goods
-- ----------------------------

-- ----------------------------
-- Table structure for t_express_config
-- ----------------------------
DROP TABLE IF EXISTS `t_express_config`;
CREATE TABLE `t_express_config` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `express_name` varchar(20) DEFAULT NULL COMMENT '快递名称',
  `postage` decimal(10,2) DEFAULT NULL COMMENT '邮费',
  `phone` varchar(15) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='快递配置表';

-- ----------------------------
-- Records of t_express_config
-- ----------------------------

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `cover` varchar(255) DEFAULT NULL COMMENT '商品封面图片名称',
  `content` text COMMENT '产品详情，图文',
  `store` int(11) DEFAULT NULL COMMENT '商品库存',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `address` varchar(255) DEFAULT NULL COMMENT '商品位置（仓库）',
  `spec` varchar(255) DEFAULT NULL COMMENT '产品规格',
  `note` varchar(255) DEFAULT NULL COMMENT '商品备注',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '商品状态，1-上架，2-下架',
  `add_time` int(11) DEFAULT NULL COMMENT '商品添加时间',
  `sum_sell` int(11) DEFAULT '0' COMMENT '销售之和',
  `cat_id` int(11) unsigned DEFAULT NULL COMMENT '商品分类ID',
  `sum_price` decimal(32,2) DEFAULT '0.00' COMMENT '总的销售额',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='平台商品表';

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('1', 'trestle', '/upload/20170613/20170613878.jpg', '<p>是东方四大反倒是噶十多个阿斯达</p><p><img src=\"http://my.cn/upload/1/c1d529319b-chmkjlf8lkwicp-sabcgw2czsd4aawzfqiaxtuaeizz293.jpg\"></p>', '2974', '12.00', null, '特殊', null, '1', '1497340537', '26', '1', '312.00');
INSERT INTO `t_goods` VALUES ('7', '规范', '/upload/20170615/20170615802.jpg', '<p>发更好高</p>', '43', '34.00', null, '45', null, '1', '1497431955', '2', '1', '68.00');
INSERT INTO `t_goods` VALUES ('16', '梵蒂冈的发', '/upload/20170616/20170616779.jpg', '<p>2353烦人的更好的发给水电费</p>', '18', '34.00', null, '234', null, '1', '1497578382', '5', '4', '170.00');

-- ----------------------------
-- Table structure for t_goods_cate
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_cate`;
CREATE TABLE `t_goods_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类id',
  `cate_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='平台商品分类表';

-- ----------------------------
-- Records of t_goods_cate
-- ----------------------------
INSERT INTO `t_goods_cate` VALUES ('1', '0', '茶叶');
INSERT INTO `t_goods_cate` VALUES ('2', '0', '长赤哈耶哦！');
INSERT INTO `t_goods_cate` VALUES ('3', '0', '看锤子');
INSERT INTO `t_goods_cate` VALUES ('4', '0', '我有一句');
INSERT INTO `t_goods_cate` VALUES ('5', '0', 'MMP');
INSERT INTO `t_goods_cate` VALUES ('6', '0', '不知当讲不当讲');
INSERT INTO `t_goods_cate` VALUES ('7', '0', '的是非得失');

-- ----------------------------
-- Table structure for t_goods_img
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_img`;
CREATE TABLE `t_goods_img` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `path` varchar(100) NOT NULL COMMENT '商品图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_img
-- ----------------------------
INSERT INTO `t_goods_img` VALUES ('24', '7', '/upload/20170615/2052522036205236jingxuan022.jpg');
INSERT INTO `t_goods_img` VALUES ('25', '7', '/upload/20170615/2052522036205236ntk-1538-35875.jpg');
INSERT INTO `t_goods_img` VALUES ('26', '16', '/upload/20170616/0159590142015942Chrysanthemum - 副本 (2).jpg');
INSERT INTO `t_goods_img` VALUES ('27', '16', '/upload/20170616/0159590142015942Koala - 副本.jpg');
INSERT INTO `t_goods_img` VALUES ('28', '16', '/upload/20170616/0159590142015942Lighthouse - 副本.jpg');
INSERT INTO `t_goods_img` VALUES ('29', '16', '/upload/20170616/0159590142015942Penguins - 副本.jpg');
INSERT INTO `t_goods_img` VALUES ('30', '1', '/upload/20170616/1234341220123420timg (1).jpeg');
INSERT INTO `t_goods_img` VALUES ('31', '1', '/upload/20170616/1234341220123420timg (2).jpeg');
INSERT INTO `t_goods_img` VALUES ('32', '1', '/upload/20170616/1234341220123420timg (1).jpeg');
INSERT INTO `t_goods_img` VALUES ('33', '1', '/upload/20170616/1234341220123420timg (2).jpeg');

-- ----------------------------
-- Table structure for t_images
-- ----------------------------
DROP TABLE IF EXISTS `t_images`;
CREATE TABLE `t_images` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '照片类型，1-门店照片，2-商品图片',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '类型id（门店id，商品id）',
  `image_name` varchar(255) NOT NULL DEFAULT '' COMMENT '图片名称',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='图片表';

-- ----------------------------
-- Records of t_images
-- ----------------------------

-- ----------------------------
-- Table structure for t_locations
-- ----------------------------
DROP TABLE IF EXISTS `t_locations`;
CREATE TABLE `t_locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `level` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5025 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_locations
-- ----------------------------
INSERT INTO `t_locations` VALUES ('1', '北京市', '0', '1');
INSERT INTO `t_locations` VALUES ('2', '天津市', '0', '1');
INSERT INTO `t_locations` VALUES ('3', '河北省', '0', '1');
INSERT INTO `t_locations` VALUES ('4', '山西省', '0', '1');
INSERT INTO `t_locations` VALUES ('5', '内蒙古自治区', '0', '1');
INSERT INTO `t_locations` VALUES ('6', '辽宁省', '0', '1');
INSERT INTO `t_locations` VALUES ('7', '吉林省', '0', '1');
INSERT INTO `t_locations` VALUES ('8', '黑龙江省', '0', '1');
INSERT INTO `t_locations` VALUES ('9', '上海市', '0', '1');
INSERT INTO `t_locations` VALUES ('10', '江苏省', '0', '1');
INSERT INTO `t_locations` VALUES ('11', '浙江省', '0', '1');
INSERT INTO `t_locations` VALUES ('12', '安徽省', '0', '1');
INSERT INTO `t_locations` VALUES ('13', '福建省', '0', '1');
INSERT INTO `t_locations` VALUES ('14', '江西省', '0', '1');
INSERT INTO `t_locations` VALUES ('15', '山东省', '0', '1');
INSERT INTO `t_locations` VALUES ('16', '河南省', '0', '1');
INSERT INTO `t_locations` VALUES ('17', '湖北省', '0', '1');
INSERT INTO `t_locations` VALUES ('18', '湖南省', '0', '1');
INSERT INTO `t_locations` VALUES ('19', '广东省', '0', '1');
INSERT INTO `t_locations` VALUES ('20', '广西壮族自治区', '0', '1');
INSERT INTO `t_locations` VALUES ('21', '海南省', '0', '1');
INSERT INTO `t_locations` VALUES ('22', '重庆市', '0', '1');
INSERT INTO `t_locations` VALUES ('23', '四川省', '0', '1');
INSERT INTO `t_locations` VALUES ('24', '贵州省', '0', '1');
INSERT INTO `t_locations` VALUES ('25', '云南省', '0', '1');
INSERT INTO `t_locations` VALUES ('26', '西藏自治区', '0', '1');
INSERT INTO `t_locations` VALUES ('27', '陕西省', '0', '1');
INSERT INTO `t_locations` VALUES ('28', '甘肃省', '0', '1');
INSERT INTO `t_locations` VALUES ('29', '青海省', '0', '1');
INSERT INTO `t_locations` VALUES ('30', '宁夏回族自治区', '0', '1');
INSERT INTO `t_locations` VALUES ('31', '新疆维吾尔自治区', '0', '1');
INSERT INTO `t_locations` VALUES ('32', '台湾省', '0', '1');
INSERT INTO `t_locations` VALUES ('33', '香港特别行政区', '0', '1');
INSERT INTO `t_locations` VALUES ('34', '澳门特别行政区', '0', '1');
INSERT INTO `t_locations` VALUES ('35', '海外', '0', '1');
INSERT INTO `t_locations` VALUES ('36', '其他', '0', '1');
INSERT INTO `t_locations` VALUES ('37', '东城区', '1', '2');
INSERT INTO `t_locations` VALUES ('38', '西城区', '1', '2');
INSERT INTO `t_locations` VALUES ('39', '崇文区', '1', '2');
INSERT INTO `t_locations` VALUES ('40', '宣武区', '1', '2');
INSERT INTO `t_locations` VALUES ('41', '朝阳区', '1', '2');
INSERT INTO `t_locations` VALUES ('42', '丰台区', '1', '2');
INSERT INTO `t_locations` VALUES ('43', '石景山区', '1', '2');
INSERT INTO `t_locations` VALUES ('44', '海淀区', '1', '2');
INSERT INTO `t_locations` VALUES ('45', '门头沟区', '1', '2');
INSERT INTO `t_locations` VALUES ('46', '房山区', '1', '2');
INSERT INTO `t_locations` VALUES ('47', '通州区', '1', '2');
INSERT INTO `t_locations` VALUES ('48', '顺义区', '1', '2');
INSERT INTO `t_locations` VALUES ('49', '昌平区', '1', '2');
INSERT INTO `t_locations` VALUES ('50', '大兴区', '1', '2');
INSERT INTO `t_locations` VALUES ('51', '怀柔区', '1', '2');
INSERT INTO `t_locations` VALUES ('52', '平谷区', '1', '2');
INSERT INTO `t_locations` VALUES ('53', '密云县', '1', '2');
INSERT INTO `t_locations` VALUES ('54', '延庆县', '1', '2');
INSERT INTO `t_locations` VALUES ('55', '和平区', '2', '2');
INSERT INTO `t_locations` VALUES ('56', '河东区', '2', '2');
INSERT INTO `t_locations` VALUES ('57', '河西区', '2', '2');
INSERT INTO `t_locations` VALUES ('58', '南开区', '2', '2');
INSERT INTO `t_locations` VALUES ('59', '河北区', '2', '2');
INSERT INTO `t_locations` VALUES ('60', '红桥区', '2', '2');
INSERT INTO `t_locations` VALUES ('61', '塘沽区', '2', '2');
INSERT INTO `t_locations` VALUES ('62', '汉沽区', '2', '2');
INSERT INTO `t_locations` VALUES ('63', '大港区', '2', '2');
INSERT INTO `t_locations` VALUES ('64', '东丽区', '2', '2');
INSERT INTO `t_locations` VALUES ('65', '西青区', '2', '2');
INSERT INTO `t_locations` VALUES ('66', '津南区', '2', '2');
INSERT INTO `t_locations` VALUES ('67', '北辰区', '2', '2');
INSERT INTO `t_locations` VALUES ('68', '武清区', '2', '2');
INSERT INTO `t_locations` VALUES ('69', '宝坻区', '2', '2');
INSERT INTO `t_locations` VALUES ('70', '宁河县', '2', '2');
INSERT INTO `t_locations` VALUES ('71', '静海县', '2', '2');
INSERT INTO `t_locations` VALUES ('72', '蓟县', '2', '2');
INSERT INTO `t_locations` VALUES ('73', '石家庄市', '3', '2');
INSERT INTO `t_locations` VALUES ('74', '唐山市', '3', '2');
INSERT INTO `t_locations` VALUES ('75', '秦皇岛市', '3', '2');
INSERT INTO `t_locations` VALUES ('76', '邯郸市', '3', '2');
INSERT INTO `t_locations` VALUES ('77', '邢台市', '3', '2');
INSERT INTO `t_locations` VALUES ('78', '保定市', '3', '2');
INSERT INTO `t_locations` VALUES ('79', '张家口市', '3', '2');
INSERT INTO `t_locations` VALUES ('80', '承德市', '3', '2');
INSERT INTO `t_locations` VALUES ('81', '衡水市', '3', '2');
INSERT INTO `t_locations` VALUES ('82', '廊坊市', '3', '2');
INSERT INTO `t_locations` VALUES ('83', '沧州市', '3', '2');
INSERT INTO `t_locations` VALUES ('84', '太原市', '4', '2');
INSERT INTO `t_locations` VALUES ('85', '大同市', '4', '2');
INSERT INTO `t_locations` VALUES ('86', '阳泉市', '4', '2');
INSERT INTO `t_locations` VALUES ('87', '长治市', '4', '2');
INSERT INTO `t_locations` VALUES ('88', '晋城市', '4', '2');
INSERT INTO `t_locations` VALUES ('89', '朔州市', '4', '2');
INSERT INTO `t_locations` VALUES ('90', '晋中市', '4', '2');
INSERT INTO `t_locations` VALUES ('91', '运城市', '4', '2');
INSERT INTO `t_locations` VALUES ('92', '忻州市', '4', '2');
INSERT INTO `t_locations` VALUES ('93', '临汾市', '4', '2');
INSERT INTO `t_locations` VALUES ('94', '吕梁市', '4', '2');
INSERT INTO `t_locations` VALUES ('95', '呼和浩特市', '5', '2');
INSERT INTO `t_locations` VALUES ('96', '包头市', '5', '2');
INSERT INTO `t_locations` VALUES ('97', '乌海市', '5', '2');
INSERT INTO `t_locations` VALUES ('98', '赤峰市', '5', '2');
INSERT INTO `t_locations` VALUES ('99', '通辽市', '5', '2');
INSERT INTO `t_locations` VALUES ('100', '鄂尔多斯市', '5', '2');
INSERT INTO `t_locations` VALUES ('101', '呼伦贝尔市', '5', '2');
INSERT INTO `t_locations` VALUES ('102', '巴彦淖尔市', '5', '2');
INSERT INTO `t_locations` VALUES ('103', '乌兰察布市', '5', '2');
INSERT INTO `t_locations` VALUES ('104', '兴安盟', '5', '2');
INSERT INTO `t_locations` VALUES ('105', '锡林郭勒盟', '5', '2');
INSERT INTO `t_locations` VALUES ('106', '阿拉善盟', '5', '2');
INSERT INTO `t_locations` VALUES ('107', '沈阳市', '6', '2');
INSERT INTO `t_locations` VALUES ('108', '大连市', '6', '2');
INSERT INTO `t_locations` VALUES ('109', '鞍山市', '6', '2');
INSERT INTO `t_locations` VALUES ('110', '抚顺市', '6', '2');
INSERT INTO `t_locations` VALUES ('111', '本溪市', '6', '2');
INSERT INTO `t_locations` VALUES ('112', '丹东市', '6', '2');
INSERT INTO `t_locations` VALUES ('113', '锦州市', '6', '2');
INSERT INTO `t_locations` VALUES ('114', '营口市', '6', '2');
INSERT INTO `t_locations` VALUES ('115', '阜新市', '6', '2');
INSERT INTO `t_locations` VALUES ('116', '辽阳市', '6', '2');
INSERT INTO `t_locations` VALUES ('117', '盘锦市', '6', '2');
INSERT INTO `t_locations` VALUES ('118', '铁岭市', '6', '2');
INSERT INTO `t_locations` VALUES ('119', '朝阳市', '6', '2');
INSERT INTO `t_locations` VALUES ('120', '葫芦岛市', '6', '2');
INSERT INTO `t_locations` VALUES ('121', '长春市', '7', '2');
INSERT INTO `t_locations` VALUES ('122', '吉林市', '7', '2');
INSERT INTO `t_locations` VALUES ('123', '四平市', '7', '2');
INSERT INTO `t_locations` VALUES ('124', '辽源市', '7', '2');
INSERT INTO `t_locations` VALUES ('125', '通化市', '7', '2');
INSERT INTO `t_locations` VALUES ('126', '白山市', '7', '2');
INSERT INTO `t_locations` VALUES ('127', '松原市', '7', '2');
INSERT INTO `t_locations` VALUES ('128', '白城市', '7', '2');
INSERT INTO `t_locations` VALUES ('129', '延边朝鲜族自治州', '7', '2');
INSERT INTO `t_locations` VALUES ('130', '哈尔滨市', '8', '2');
INSERT INTO `t_locations` VALUES ('131', '齐齐哈尔市', '8', '2');
INSERT INTO `t_locations` VALUES ('132', '鸡西市', '8', '2');
INSERT INTO `t_locations` VALUES ('133', '鹤岗市', '8', '2');
INSERT INTO `t_locations` VALUES ('134', '双鸭山市', '8', '2');
INSERT INTO `t_locations` VALUES ('135', '大庆市', '8', '2');
INSERT INTO `t_locations` VALUES ('136', '伊春市', '8', '2');
INSERT INTO `t_locations` VALUES ('137', '佳木斯市', '8', '2');
INSERT INTO `t_locations` VALUES ('138', '七台河市', '8', '2');
INSERT INTO `t_locations` VALUES ('139', '牡丹江市', '8', '2');
INSERT INTO `t_locations` VALUES ('140', '黑河市', '8', '2');
INSERT INTO `t_locations` VALUES ('141', '绥化市', '8', '2');
INSERT INTO `t_locations` VALUES ('142', '大兴安岭地区', '8', '2');
INSERT INTO `t_locations` VALUES ('143', '黄浦区', '9', '2');
INSERT INTO `t_locations` VALUES ('144', '卢湾区', '9', '2');
INSERT INTO `t_locations` VALUES ('145', '徐汇区', '9', '2');
INSERT INTO `t_locations` VALUES ('146', '长宁区', '9', '2');
INSERT INTO `t_locations` VALUES ('147', '静安区', '9', '2');
INSERT INTO `t_locations` VALUES ('148', '普陀区', '9', '2');
INSERT INTO `t_locations` VALUES ('149', '闸北区', '9', '2');
INSERT INTO `t_locations` VALUES ('150', '虹口区', '9', '2');
INSERT INTO `t_locations` VALUES ('151', '杨浦区', '9', '2');
INSERT INTO `t_locations` VALUES ('152', '闵行区', '9', '2');
INSERT INTO `t_locations` VALUES ('153', '宝山区', '9', '2');
INSERT INTO `t_locations` VALUES ('154', '嘉定区', '9', '2');
INSERT INTO `t_locations` VALUES ('155', '浦东新区', '9', '2');
INSERT INTO `t_locations` VALUES ('156', '金山区', '9', '2');
INSERT INTO `t_locations` VALUES ('157', '松江区', '9', '2');
INSERT INTO `t_locations` VALUES ('158', '青浦区', '9', '2');
INSERT INTO `t_locations` VALUES ('159', '南汇区', '9', '2');
INSERT INTO `t_locations` VALUES ('160', '奉贤区', '9', '2');
INSERT INTO `t_locations` VALUES ('161', '崇明县', '9', '2');
INSERT INTO `t_locations` VALUES ('162', '南京市', '10', '2');
INSERT INTO `t_locations` VALUES ('163', '无锡市', '10', '2');
INSERT INTO `t_locations` VALUES ('164', '徐州市', '10', '2');
INSERT INTO `t_locations` VALUES ('165', '常州市', '10', '2');
INSERT INTO `t_locations` VALUES ('166', '苏州市', '10', '2');
INSERT INTO `t_locations` VALUES ('167', '南通市', '10', '2');
INSERT INTO `t_locations` VALUES ('168', '连云港市', '10', '2');
INSERT INTO `t_locations` VALUES ('169', '淮安市', '10', '2');
INSERT INTO `t_locations` VALUES ('170', '盐城市', '10', '2');
INSERT INTO `t_locations` VALUES ('171', '扬州市', '10', '2');
INSERT INTO `t_locations` VALUES ('172', '镇江市', '10', '2');
INSERT INTO `t_locations` VALUES ('173', '泰州市', '10', '2');
INSERT INTO `t_locations` VALUES ('174', '宿迁市', '10', '2');
INSERT INTO `t_locations` VALUES ('175', '杭州市', '11', '2');
INSERT INTO `t_locations` VALUES ('176', '宁波市', '11', '2');
INSERT INTO `t_locations` VALUES ('177', '温州市', '11', '2');
INSERT INTO `t_locations` VALUES ('178', '嘉兴市', '11', '2');
INSERT INTO `t_locations` VALUES ('179', '湖州市', '11', '2');
INSERT INTO `t_locations` VALUES ('180', '绍兴市', '11', '2');
INSERT INTO `t_locations` VALUES ('181', '舟山市', '11', '2');
INSERT INTO `t_locations` VALUES ('182', '衢州市', '11', '2');
INSERT INTO `t_locations` VALUES ('183', '金华市', '11', '2');
INSERT INTO `t_locations` VALUES ('184', '台州市', '11', '2');
INSERT INTO `t_locations` VALUES ('185', '丽水市', '11', '2');
INSERT INTO `t_locations` VALUES ('186', '合肥市', '12', '2');
INSERT INTO `t_locations` VALUES ('187', '芜湖市', '12', '2');
INSERT INTO `t_locations` VALUES ('188', '蚌埠市', '12', '2');
INSERT INTO `t_locations` VALUES ('189', '淮南市', '12', '2');
INSERT INTO `t_locations` VALUES ('190', '马鞍山市', '12', '2');
INSERT INTO `t_locations` VALUES ('191', '淮北市', '12', '2');
INSERT INTO `t_locations` VALUES ('192', '铜陵市', '12', '2');
INSERT INTO `t_locations` VALUES ('193', '安庆市', '12', '2');
INSERT INTO `t_locations` VALUES ('194', '黄山市', '12', '2');
INSERT INTO `t_locations` VALUES ('195', '滁州市', '12', '2');
INSERT INTO `t_locations` VALUES ('196', '阜阳市', '12', '2');
INSERT INTO `t_locations` VALUES ('197', '宿州市', '12', '2');
INSERT INTO `t_locations` VALUES ('198', '巢湖市', '12', '2');
INSERT INTO `t_locations` VALUES ('199', '六安市', '12', '2');
INSERT INTO `t_locations` VALUES ('200', '亳州市', '12', '2');
INSERT INTO `t_locations` VALUES ('201', '池州市', '12', '2');
INSERT INTO `t_locations` VALUES ('202', '宣城市', '12', '2');
INSERT INTO `t_locations` VALUES ('203', '福州市', '13', '2');
INSERT INTO `t_locations` VALUES ('204', '厦门市', '13', '2');
INSERT INTO `t_locations` VALUES ('205', '莆田市', '13', '2');
INSERT INTO `t_locations` VALUES ('206', '三明市', '13', '2');
INSERT INTO `t_locations` VALUES ('207', '泉州市', '13', '2');
INSERT INTO `t_locations` VALUES ('208', '漳州市', '13', '2');
INSERT INTO `t_locations` VALUES ('209', '南平市', '13', '2');
INSERT INTO `t_locations` VALUES ('210', '龙岩市', '13', '2');
INSERT INTO `t_locations` VALUES ('211', '宁德市', '13', '2');
INSERT INTO `t_locations` VALUES ('212', '南昌市', '14', '2');
INSERT INTO `t_locations` VALUES ('213', '景德镇市', '14', '2');
INSERT INTO `t_locations` VALUES ('214', '萍乡市', '14', '2');
INSERT INTO `t_locations` VALUES ('215', '九江市', '14', '2');
INSERT INTO `t_locations` VALUES ('216', '新余市', '14', '2');
INSERT INTO `t_locations` VALUES ('217', '鹰潭市', '14', '2');
INSERT INTO `t_locations` VALUES ('218', '赣州市', '14', '2');
INSERT INTO `t_locations` VALUES ('219', '吉安市', '14', '2');
INSERT INTO `t_locations` VALUES ('220', '宜春市', '14', '2');
INSERT INTO `t_locations` VALUES ('221', '抚州市', '14', '2');
INSERT INTO `t_locations` VALUES ('222', '上饶市', '14', '2');
INSERT INTO `t_locations` VALUES ('223', '济南市', '15', '2');
INSERT INTO `t_locations` VALUES ('224', '青岛市', '15', '2');
INSERT INTO `t_locations` VALUES ('225', '淄博市', '15', '2');
INSERT INTO `t_locations` VALUES ('226', '枣庄市', '15', '2');
INSERT INTO `t_locations` VALUES ('227', '东营市', '15', '2');
INSERT INTO `t_locations` VALUES ('228', '烟台市', '15', '2');
INSERT INTO `t_locations` VALUES ('229', '潍坊市', '15', '2');
INSERT INTO `t_locations` VALUES ('230', '济宁市', '15', '2');
INSERT INTO `t_locations` VALUES ('231', '泰安市', '15', '2');
INSERT INTO `t_locations` VALUES ('232', '威海市', '15', '2');
INSERT INTO `t_locations` VALUES ('233', '日照市', '15', '2');
INSERT INTO `t_locations` VALUES ('234', '莱芜市', '15', '2');
INSERT INTO `t_locations` VALUES ('235', '临沂市', '15', '2');
INSERT INTO `t_locations` VALUES ('236', '德州市', '15', '2');
INSERT INTO `t_locations` VALUES ('237', '聊城市', '15', '2');
INSERT INTO `t_locations` VALUES ('238', '滨州市', '15', '2');
INSERT INTO `t_locations` VALUES ('239', '菏泽市', '15', '2');
INSERT INTO `t_locations` VALUES ('240', '郑州市', '16', '2');
INSERT INTO `t_locations` VALUES ('241', '开封市', '16', '2');
INSERT INTO `t_locations` VALUES ('242', '洛阳市', '16', '2');
INSERT INTO `t_locations` VALUES ('243', '平顶山市', '16', '2');
INSERT INTO `t_locations` VALUES ('244', '安阳市', '16', '2');
INSERT INTO `t_locations` VALUES ('245', '鹤壁市', '16', '2');
INSERT INTO `t_locations` VALUES ('246', '新乡市', '16', '2');
INSERT INTO `t_locations` VALUES ('247', '焦作市', '16', '2');
INSERT INTO `t_locations` VALUES ('248', '濮阳市', '16', '2');
INSERT INTO `t_locations` VALUES ('249', '许昌市', '16', '2');
INSERT INTO `t_locations` VALUES ('250', '漯河市', '16', '2');
INSERT INTO `t_locations` VALUES ('251', '三门峡市', '16', '2');
INSERT INTO `t_locations` VALUES ('252', '南阳市', '16', '2');
INSERT INTO `t_locations` VALUES ('253', '商丘市', '16', '2');
INSERT INTO `t_locations` VALUES ('254', '信阳市', '16', '2');
INSERT INTO `t_locations` VALUES ('255', '周口市', '16', '2');
INSERT INTO `t_locations` VALUES ('256', '驻马店市', '16', '2');
INSERT INTO `t_locations` VALUES ('257', '济源市', '16', '2');
INSERT INTO `t_locations` VALUES ('258', '武汉市', '17', '2');
INSERT INTO `t_locations` VALUES ('259', '黄石市', '17', '2');
INSERT INTO `t_locations` VALUES ('260', '十堰市', '17', '2');
INSERT INTO `t_locations` VALUES ('261', '宜昌市', '17', '2');
INSERT INTO `t_locations` VALUES ('262', '襄樊市', '17', '2');
INSERT INTO `t_locations` VALUES ('263', '鄂州市', '17', '2');
INSERT INTO `t_locations` VALUES ('264', '荆门市', '17', '2');
INSERT INTO `t_locations` VALUES ('265', '孝感市', '17', '2');
INSERT INTO `t_locations` VALUES ('266', '荆州市', '17', '2');
INSERT INTO `t_locations` VALUES ('267', '黄冈市', '17', '2');
INSERT INTO `t_locations` VALUES ('268', '咸宁市', '17', '2');
INSERT INTO `t_locations` VALUES ('269', '随州市', '17', '2');
INSERT INTO `t_locations` VALUES ('270', '恩施土家族苗族自治州', '17', '2');
INSERT INTO `t_locations` VALUES ('271', '仙桃市', '17', '2');
INSERT INTO `t_locations` VALUES ('272', '潜江市', '17', '2');
INSERT INTO `t_locations` VALUES ('273', '天门市', '17', '2');
INSERT INTO `t_locations` VALUES ('274', '神农架林区', '17', '2');
INSERT INTO `t_locations` VALUES ('275', '长沙市', '18', '2');
INSERT INTO `t_locations` VALUES ('276', '株洲市', '18', '2');
INSERT INTO `t_locations` VALUES ('277', '湘潭市', '18', '2');
INSERT INTO `t_locations` VALUES ('278', '衡阳市', '18', '2');
INSERT INTO `t_locations` VALUES ('279', '邵阳市', '18', '2');
INSERT INTO `t_locations` VALUES ('280', '岳阳市', '18', '2');
INSERT INTO `t_locations` VALUES ('281', '常德市', '18', '2');
INSERT INTO `t_locations` VALUES ('282', '张家界市', '18', '2');
INSERT INTO `t_locations` VALUES ('283', '益阳市', '18', '2');
INSERT INTO `t_locations` VALUES ('284', '郴州市', '18', '2');
INSERT INTO `t_locations` VALUES ('285', '永州市', '18', '2');
INSERT INTO `t_locations` VALUES ('286', '怀化市', '18', '2');
INSERT INTO `t_locations` VALUES ('287', '娄底市', '18', '2');
INSERT INTO `t_locations` VALUES ('288', '湘西土家族苗族自治州', '18', '2');
INSERT INTO `t_locations` VALUES ('289', '广州市', '19', '2');
INSERT INTO `t_locations` VALUES ('290', '韶关市', '19', '2');
INSERT INTO `t_locations` VALUES ('291', '深圳市', '19', '2');
INSERT INTO `t_locations` VALUES ('292', '珠海市', '19', '2');
INSERT INTO `t_locations` VALUES ('293', '汕头市', '19', '2');
INSERT INTO `t_locations` VALUES ('294', '佛山市', '19', '2');
INSERT INTO `t_locations` VALUES ('295', '江门市', '19', '2');
INSERT INTO `t_locations` VALUES ('296', '湛江市', '19', '2');
INSERT INTO `t_locations` VALUES ('297', '茂名市', '19', '2');
INSERT INTO `t_locations` VALUES ('298', '肇庆市', '19', '2');
INSERT INTO `t_locations` VALUES ('299', '惠州市', '19', '2');
INSERT INTO `t_locations` VALUES ('300', '梅州市', '19', '2');
INSERT INTO `t_locations` VALUES ('301', '汕尾市', '19', '2');
INSERT INTO `t_locations` VALUES ('302', '河源市', '19', '2');
INSERT INTO `t_locations` VALUES ('303', '阳江市', '19', '2');
INSERT INTO `t_locations` VALUES ('304', '清远市', '19', '2');
INSERT INTO `t_locations` VALUES ('305', '东莞市', '19', '2');
INSERT INTO `t_locations` VALUES ('306', '中山市', '19', '2');
INSERT INTO `t_locations` VALUES ('307', '潮州市', '19', '2');
INSERT INTO `t_locations` VALUES ('308', '揭阳市', '19', '2');
INSERT INTO `t_locations` VALUES ('309', '云浮市', '19', '2');
INSERT INTO `t_locations` VALUES ('310', '南宁市', '20', '2');
INSERT INTO `t_locations` VALUES ('311', '柳州市', '20', '2');
INSERT INTO `t_locations` VALUES ('312', '桂林市', '20', '2');
INSERT INTO `t_locations` VALUES ('313', '梧州市', '20', '2');
INSERT INTO `t_locations` VALUES ('314', '北海市', '20', '2');
INSERT INTO `t_locations` VALUES ('315', '防城港市', '20', '2');
INSERT INTO `t_locations` VALUES ('316', '钦州市', '20', '2');
INSERT INTO `t_locations` VALUES ('317', '贵港市', '20', '2');
INSERT INTO `t_locations` VALUES ('318', '玉林市', '20', '2');
INSERT INTO `t_locations` VALUES ('319', '百色市', '20', '2');
INSERT INTO `t_locations` VALUES ('320', '贺州市', '20', '2');
INSERT INTO `t_locations` VALUES ('321', '河池市', '20', '2');
INSERT INTO `t_locations` VALUES ('322', '来宾市', '20', '2');
INSERT INTO `t_locations` VALUES ('323', '崇左市', '20', '2');
INSERT INTO `t_locations` VALUES ('324', '海口市', '21', '2');
INSERT INTO `t_locations` VALUES ('325', '三亚市', '21', '2');
INSERT INTO `t_locations` VALUES ('326', '五指山市', '21', '2');
INSERT INTO `t_locations` VALUES ('327', '琼海市', '21', '2');
INSERT INTO `t_locations` VALUES ('328', '儋州市', '21', '2');
INSERT INTO `t_locations` VALUES ('329', '文昌市', '21', '2');
INSERT INTO `t_locations` VALUES ('330', '万宁市', '21', '2');
INSERT INTO `t_locations` VALUES ('331', '东方市', '21', '2');
INSERT INTO `t_locations` VALUES ('332', '定安县', '21', '2');
INSERT INTO `t_locations` VALUES ('333', '屯昌县', '21', '2');
INSERT INTO `t_locations` VALUES ('334', '澄迈县', '21', '2');
INSERT INTO `t_locations` VALUES ('335', '临高县', '21', '2');
INSERT INTO `t_locations` VALUES ('336', '白沙黎族自治县', '21', '2');
INSERT INTO `t_locations` VALUES ('337', '昌江黎族自治县', '21', '2');
INSERT INTO `t_locations` VALUES ('338', '乐东黎族自治县', '21', '2');
INSERT INTO `t_locations` VALUES ('339', '陵水黎族自治县', '21', '2');
INSERT INTO `t_locations` VALUES ('340', '保亭黎族苗族自治县', '21', '2');
INSERT INTO `t_locations` VALUES ('341', '琼中黎族苗族自治县', '21', '2');
INSERT INTO `t_locations` VALUES ('342', '西沙群岛', '21', '2');
INSERT INTO `t_locations` VALUES ('343', '南沙群岛', '21', '2');
INSERT INTO `t_locations` VALUES ('344', '中沙群岛的岛礁及其海域', '21', '2');
INSERT INTO `t_locations` VALUES ('345', '万州区', '22', '2');
INSERT INTO `t_locations` VALUES ('346', '涪陵区', '22', '2');
INSERT INTO `t_locations` VALUES ('347', '渝中区', '22', '2');
INSERT INTO `t_locations` VALUES ('348', '大渡口区', '22', '2');
INSERT INTO `t_locations` VALUES ('349', '江北区', '22', '2');
INSERT INTO `t_locations` VALUES ('350', '沙坪坝区', '22', '2');
INSERT INTO `t_locations` VALUES ('351', '九龙坡区', '22', '2');
INSERT INTO `t_locations` VALUES ('352', '南岸区', '22', '2');
INSERT INTO `t_locations` VALUES ('353', '北碚区', '22', '2');
INSERT INTO `t_locations` VALUES ('354', '双桥区', '22', '2');
INSERT INTO `t_locations` VALUES ('355', '万盛区', '22', '2');
INSERT INTO `t_locations` VALUES ('356', '渝北区', '22', '2');
INSERT INTO `t_locations` VALUES ('357', '巴南区', '22', '2');
INSERT INTO `t_locations` VALUES ('358', '黔江区', '22', '2');
INSERT INTO `t_locations` VALUES ('359', '长寿区', '22', '2');
INSERT INTO `t_locations` VALUES ('360', '綦江县', '22', '2');
INSERT INTO `t_locations` VALUES ('361', '潼南县', '22', '2');
INSERT INTO `t_locations` VALUES ('362', '铜梁县', '22', '2');
INSERT INTO `t_locations` VALUES ('363', '大足县', '22', '2');
INSERT INTO `t_locations` VALUES ('364', '荣昌县', '22', '2');
INSERT INTO `t_locations` VALUES ('365', '璧山县', '22', '2');
INSERT INTO `t_locations` VALUES ('366', '梁平县', '22', '2');
INSERT INTO `t_locations` VALUES ('367', '城口县', '22', '2');
INSERT INTO `t_locations` VALUES ('368', '丰都县', '22', '2');
INSERT INTO `t_locations` VALUES ('369', '垫江县', '22', '2');
INSERT INTO `t_locations` VALUES ('370', '武隆县', '22', '2');
INSERT INTO `t_locations` VALUES ('371', '忠县', '22', '2');
INSERT INTO `t_locations` VALUES ('372', '开县', '22', '2');
INSERT INTO `t_locations` VALUES ('373', '云阳县', '22', '2');
INSERT INTO `t_locations` VALUES ('374', '奉节县', '22', '2');
INSERT INTO `t_locations` VALUES ('375', '巫山县', '22', '2');
INSERT INTO `t_locations` VALUES ('376', '巫溪县', '22', '2');
INSERT INTO `t_locations` VALUES ('377', '石柱土家族自治县', '22', '2');
INSERT INTO `t_locations` VALUES ('378', '秀山土家族苗族自治县', '22', '2');
INSERT INTO `t_locations` VALUES ('379', '酉阳土家族苗族自治县', '22', '2');
INSERT INTO `t_locations` VALUES ('380', '彭水苗族土家族自治县', '22', '2');
INSERT INTO `t_locations` VALUES ('381', '江津市', '22', '2');
INSERT INTO `t_locations` VALUES ('382', '合川市', '22', '2');
INSERT INTO `t_locations` VALUES ('383', '永川市', '22', '2');
INSERT INTO `t_locations` VALUES ('384', '南川市', '22', '2');
INSERT INTO `t_locations` VALUES ('385', '成都市', '23', '2');
INSERT INTO `t_locations` VALUES ('386', '自贡市', '23', '2');
INSERT INTO `t_locations` VALUES ('387', '攀枝花市', '23', '2');
INSERT INTO `t_locations` VALUES ('388', '泸州市', '23', '2');
INSERT INTO `t_locations` VALUES ('389', '德阳市', '23', '2');
INSERT INTO `t_locations` VALUES ('390', '绵阳市', '23', '2');
INSERT INTO `t_locations` VALUES ('391', '广元市', '23', '2');
INSERT INTO `t_locations` VALUES ('392', '遂宁市', '23', '2');
INSERT INTO `t_locations` VALUES ('393', '内江市', '23', '2');
INSERT INTO `t_locations` VALUES ('394', '乐山市', '23', '2');
INSERT INTO `t_locations` VALUES ('395', '南充市', '23', '2');
INSERT INTO `t_locations` VALUES ('396', '眉山市', '23', '2');
INSERT INTO `t_locations` VALUES ('397', '宜宾市', '23', '2');
INSERT INTO `t_locations` VALUES ('398', '广安市', '23', '2');
INSERT INTO `t_locations` VALUES ('399', '达州市', '23', '2');
INSERT INTO `t_locations` VALUES ('400', '雅安市', '23', '2');
INSERT INTO `t_locations` VALUES ('401', '巴中市', '23', '2');
INSERT INTO `t_locations` VALUES ('402', '资阳市', '23', '2');
INSERT INTO `t_locations` VALUES ('403', '阿坝藏族羌族自治州', '23', '2');
INSERT INTO `t_locations` VALUES ('404', '甘孜藏族自治州', '23', '2');
INSERT INTO `t_locations` VALUES ('405', '凉山彝族自治州', '23', '2');
INSERT INTO `t_locations` VALUES ('406', '贵阳市', '24', '2');
INSERT INTO `t_locations` VALUES ('407', '六盘水市', '24', '2');
INSERT INTO `t_locations` VALUES ('408', '遵义市', '24', '2');
INSERT INTO `t_locations` VALUES ('409', '安顺市', '24', '2');
INSERT INTO `t_locations` VALUES ('410', '铜仁地区', '24', '2');
INSERT INTO `t_locations` VALUES ('411', '黔西南布依族苗族自治州', '24', '2');
INSERT INTO `t_locations` VALUES ('412', '毕节地区', '24', '2');
INSERT INTO `t_locations` VALUES ('413', '黔东南苗族侗族自治州', '24', '2');
INSERT INTO `t_locations` VALUES ('414', '黔南布依族苗族自治州', '24', '2');
INSERT INTO `t_locations` VALUES ('415', '昆明市', '25', '2');
INSERT INTO `t_locations` VALUES ('416', '曲靖市', '25', '2');
INSERT INTO `t_locations` VALUES ('417', '玉溪市', '25', '2');
INSERT INTO `t_locations` VALUES ('418', '保山市', '25', '2');
INSERT INTO `t_locations` VALUES ('419', '昭通市', '25', '2');
INSERT INTO `t_locations` VALUES ('420', '丽江市', '25', '2');
INSERT INTO `t_locations` VALUES ('421', '思茅市', '25', '2');
INSERT INTO `t_locations` VALUES ('422', '临沧市', '25', '2');
INSERT INTO `t_locations` VALUES ('423', '楚雄彝族自治州', '25', '2');
INSERT INTO `t_locations` VALUES ('424', '红河哈尼族彝族自治州', '25', '2');
INSERT INTO `t_locations` VALUES ('425', '文山壮族苗族自治州', '25', '2');
INSERT INTO `t_locations` VALUES ('426', '西双版纳傣族自治州', '25', '2');
INSERT INTO `t_locations` VALUES ('427', '大理白族自治州', '25', '2');
INSERT INTO `t_locations` VALUES ('428', '德宏傣族景颇族自治州', '25', '2');
INSERT INTO `t_locations` VALUES ('429', '怒江傈僳族自治州', '25', '2');
INSERT INTO `t_locations` VALUES ('430', '迪庆藏族自治州', '25', '2');
INSERT INTO `t_locations` VALUES ('431', '拉萨市', '26', '2');
INSERT INTO `t_locations` VALUES ('432', '昌都地区', '26', '2');
INSERT INTO `t_locations` VALUES ('433', '山南地区', '26', '2');
INSERT INTO `t_locations` VALUES ('434', '日喀则地区', '26', '2');
INSERT INTO `t_locations` VALUES ('435', '那曲地区', '26', '2');
INSERT INTO `t_locations` VALUES ('436', '阿里地区', '26', '2');
INSERT INTO `t_locations` VALUES ('437', '林芝地区', '26', '2');
INSERT INTO `t_locations` VALUES ('438', '西安市', '27', '2');
INSERT INTO `t_locations` VALUES ('439', '铜川市', '27', '2');
INSERT INTO `t_locations` VALUES ('440', '宝鸡市', '27', '2');
INSERT INTO `t_locations` VALUES ('441', '咸阳市', '27', '2');
INSERT INTO `t_locations` VALUES ('442', '渭南市', '27', '2');
INSERT INTO `t_locations` VALUES ('443', '延安市', '27', '2');
INSERT INTO `t_locations` VALUES ('444', '汉中市', '27', '2');
INSERT INTO `t_locations` VALUES ('445', '榆林市', '27', '2');
INSERT INTO `t_locations` VALUES ('446', '安康市', '27', '2');
INSERT INTO `t_locations` VALUES ('447', '商洛市', '27', '2');
INSERT INTO `t_locations` VALUES ('448', '兰州市', '28', '2');
INSERT INTO `t_locations` VALUES ('449', '嘉峪关市', '28', '2');
INSERT INTO `t_locations` VALUES ('450', '金昌市', '28', '2');
INSERT INTO `t_locations` VALUES ('451', '白银市', '28', '2');
INSERT INTO `t_locations` VALUES ('452', '天水市', '28', '2');
INSERT INTO `t_locations` VALUES ('453', '武威市', '28', '2');
INSERT INTO `t_locations` VALUES ('454', '张掖市', '28', '2');
INSERT INTO `t_locations` VALUES ('455', '平凉市', '28', '2');
INSERT INTO `t_locations` VALUES ('456', '酒泉市', '28', '2');
INSERT INTO `t_locations` VALUES ('457', '庆阳市', '28', '2');
INSERT INTO `t_locations` VALUES ('458', '定西市', '28', '2');
INSERT INTO `t_locations` VALUES ('459', '陇南市', '28', '2');
INSERT INTO `t_locations` VALUES ('460', '临夏回族自治州', '28', '2');
INSERT INTO `t_locations` VALUES ('461', '甘南藏族自治州', '28', '2');
INSERT INTO `t_locations` VALUES ('462', '西宁市', '29', '2');
INSERT INTO `t_locations` VALUES ('463', '海东地区', '29', '2');
INSERT INTO `t_locations` VALUES ('464', '海北藏族自治州', '29', '2');
INSERT INTO `t_locations` VALUES ('465', '黄南藏族自治州', '29', '2');
INSERT INTO `t_locations` VALUES ('466', '海南藏族自治州', '29', '2');
INSERT INTO `t_locations` VALUES ('467', '果洛藏族自治州', '29', '2');
INSERT INTO `t_locations` VALUES ('468', '玉树藏族自治州', '29', '2');
INSERT INTO `t_locations` VALUES ('469', '海西蒙古族藏族自治州', '29', '2');
INSERT INTO `t_locations` VALUES ('470', '银川市', '30', '2');
INSERT INTO `t_locations` VALUES ('471', '石嘴山市', '30', '2');
INSERT INTO `t_locations` VALUES ('472', '吴忠市', '30', '2');
INSERT INTO `t_locations` VALUES ('473', '固原市', '30', '2');
INSERT INTO `t_locations` VALUES ('474', '中卫市', '30', '2');
INSERT INTO `t_locations` VALUES ('475', '乌鲁木齐市', '31', '2');
INSERT INTO `t_locations` VALUES ('476', '克拉玛依市', '31', '2');
INSERT INTO `t_locations` VALUES ('477', '吐鲁番地区', '31', '2');
INSERT INTO `t_locations` VALUES ('478', '哈密地区', '31', '2');
INSERT INTO `t_locations` VALUES ('479', '昌吉回族自治州', '31', '2');
INSERT INTO `t_locations` VALUES ('480', '博尔塔拉蒙古自治州', '31', '2');
INSERT INTO `t_locations` VALUES ('481', '巴音郭楞蒙古自治州', '31', '2');
INSERT INTO `t_locations` VALUES ('482', '阿克苏地区', '31', '2');
INSERT INTO `t_locations` VALUES ('483', '克孜勒苏柯尔克孜自治州', '31', '2');
INSERT INTO `t_locations` VALUES ('484', '喀什地区', '31', '2');
INSERT INTO `t_locations` VALUES ('485', '和田地区', '31', '2');
INSERT INTO `t_locations` VALUES ('486', '伊犁哈萨克自治州', '31', '2');
INSERT INTO `t_locations` VALUES ('487', '塔城地区', '31', '2');
INSERT INTO `t_locations` VALUES ('488', '阿勒泰地区', '31', '2');
INSERT INTO `t_locations` VALUES ('489', '石河子市', '31', '2');
INSERT INTO `t_locations` VALUES ('490', '阿拉尔市', '31', '2');
INSERT INTO `t_locations` VALUES ('491', '图木舒克市', '31', '2');
INSERT INTO `t_locations` VALUES ('492', '五家渠市', '31', '2');
INSERT INTO `t_locations` VALUES ('493', '台北市', '32', '2');
INSERT INTO `t_locations` VALUES ('494', '高雄市', '32', '2');
INSERT INTO `t_locations` VALUES ('495', '基隆市', '32', '2');
INSERT INTO `t_locations` VALUES ('496', '台中市', '32', '2');
INSERT INTO `t_locations` VALUES ('497', '台南市', '32', '2');
INSERT INTO `t_locations` VALUES ('498', '新竹市', '32', '2');
INSERT INTO `t_locations` VALUES ('499', '嘉义市', '32', '2');
INSERT INTO `t_locations` VALUES ('500', '台北县', '32', '2');
INSERT INTO `t_locations` VALUES ('501', '宜兰县', '32', '2');
INSERT INTO `t_locations` VALUES ('502', '桃园县', '32', '2');
INSERT INTO `t_locations` VALUES ('503', '新竹县', '32', '2');
INSERT INTO `t_locations` VALUES ('504', '苗栗县', '32', '2');
INSERT INTO `t_locations` VALUES ('505', '台中县', '32', '2');
INSERT INTO `t_locations` VALUES ('506', '彰化县', '32', '2');
INSERT INTO `t_locations` VALUES ('507', '南投县', '32', '2');
INSERT INTO `t_locations` VALUES ('508', '云林县', '32', '2');
INSERT INTO `t_locations` VALUES ('509', '嘉义县', '32', '2');
INSERT INTO `t_locations` VALUES ('510', '台南县', '32', '2');
INSERT INTO `t_locations` VALUES ('511', '高雄县', '32', '2');
INSERT INTO `t_locations` VALUES ('512', '屏东县', '32', '2');
INSERT INTO `t_locations` VALUES ('513', '澎湖县', '32', '2');
INSERT INTO `t_locations` VALUES ('514', '台东县', '32', '2');
INSERT INTO `t_locations` VALUES ('515', '花莲县', '32', '2');
INSERT INTO `t_locations` VALUES ('516', '中西区', '33', '2');
INSERT INTO `t_locations` VALUES ('517', '东区', '33', '2');
INSERT INTO `t_locations` VALUES ('518', '九龙城区', '33', '2');
INSERT INTO `t_locations` VALUES ('519', '观塘区', '33', '2');
INSERT INTO `t_locations` VALUES ('520', '南区', '33', '2');
INSERT INTO `t_locations` VALUES ('521', '深水埗区', '33', '2');
INSERT INTO `t_locations` VALUES ('522', '黄大仙区', '33', '2');
INSERT INTO `t_locations` VALUES ('523', '湾仔区', '33', '2');
INSERT INTO `t_locations` VALUES ('524', '油尖旺区', '33', '2');
INSERT INTO `t_locations` VALUES ('525', '离岛区', '33', '2');
INSERT INTO `t_locations` VALUES ('526', '葵青区', '33', '2');
INSERT INTO `t_locations` VALUES ('527', '北区', '33', '2');
INSERT INTO `t_locations` VALUES ('528', '西贡区', '33', '2');
INSERT INTO `t_locations` VALUES ('529', '沙田区', '33', '2');
INSERT INTO `t_locations` VALUES ('530', '屯门区', '33', '2');
INSERT INTO `t_locations` VALUES ('531', '大埔区', '33', '2');
INSERT INTO `t_locations` VALUES ('532', '荃湾区', '33', '2');
INSERT INTO `t_locations` VALUES ('533', '元朗区', '33', '2');
INSERT INTO `t_locations` VALUES ('534', '澳门特别行政区', '34', '2');
INSERT INTO `t_locations` VALUES ('535', '美国', '35', '2');
INSERT INTO `t_locations` VALUES ('536', '加拿大', '35', '2');
INSERT INTO `t_locations` VALUES ('537', '澳大利亚', '35', '2');
INSERT INTO `t_locations` VALUES ('538', '新西兰', '35', '2');
INSERT INTO `t_locations` VALUES ('539', '英国', '35', '2');
INSERT INTO `t_locations` VALUES ('540', '法国', '35', '2');
INSERT INTO `t_locations` VALUES ('541', '德国', '35', '2');
INSERT INTO `t_locations` VALUES ('542', '捷克', '35', '2');
INSERT INTO `t_locations` VALUES ('543', '荷兰', '35', '2');
INSERT INTO `t_locations` VALUES ('544', '瑞士', '35', '2');
INSERT INTO `t_locations` VALUES ('545', '希腊', '35', '2');
INSERT INTO `t_locations` VALUES ('546', '挪威', '35', '2');
INSERT INTO `t_locations` VALUES ('547', '瑞典', '35', '2');
INSERT INTO `t_locations` VALUES ('548', '丹麦', '35', '2');
INSERT INTO `t_locations` VALUES ('549', '芬兰', '35', '2');
INSERT INTO `t_locations` VALUES ('550', '爱尔兰', '35', '2');
INSERT INTO `t_locations` VALUES ('551', '奥地利', '35', '2');
INSERT INTO `t_locations` VALUES ('552', '意大利', '35', '2');
INSERT INTO `t_locations` VALUES ('553', '乌克兰', '35', '2');
INSERT INTO `t_locations` VALUES ('554', '俄罗斯', '35', '2');
INSERT INTO `t_locations` VALUES ('555', '西班牙', '35', '2');
INSERT INTO `t_locations` VALUES ('556', '韩国', '35', '2');
INSERT INTO `t_locations` VALUES ('557', '新加坡', '35', '2');
INSERT INTO `t_locations` VALUES ('558', '马来西亚', '35', '2');
INSERT INTO `t_locations` VALUES ('559', '印度', '35', '2');
INSERT INTO `t_locations` VALUES ('560', '泰国', '35', '2');
INSERT INTO `t_locations` VALUES ('561', '日本', '35', '2');
INSERT INTO `t_locations` VALUES ('562', '巴西', '35', '2');
INSERT INTO `t_locations` VALUES ('563', '阿根廷', '35', '2');
INSERT INTO `t_locations` VALUES ('564', '南非', '35', '2');
INSERT INTO `t_locations` VALUES ('565', '埃及', '35', '2');
INSERT INTO `t_locations` VALUES ('566', '其他', '36', '2');
INSERT INTO `t_locations` VALUES ('567', '东华门街道', '37', '3');
INSERT INTO `t_locations` VALUES ('568', '东四街道', '37', '3');
INSERT INTO `t_locations` VALUES ('569', '东直门街道', '37', '3');
INSERT INTO `t_locations` VALUES ('570', '交道口街道', '37', '3');
INSERT INTO `t_locations` VALUES ('571', '北新桥街道', '37', '3');
INSERT INTO `t_locations` VALUES ('572', '和平里街道', '37', '3');
INSERT INTO `t_locations` VALUES ('573', '安定门街道', '37', '3');
INSERT INTO `t_locations` VALUES ('574', '建国门街道', '37', '3');
INSERT INTO `t_locations` VALUES ('575', '景山街道', '37', '3');
INSERT INTO `t_locations` VALUES ('576', '朝阳门街道', '37', '3');
INSERT INTO `t_locations` VALUES ('577', '什刹海街道', '38', '3');
INSERT INTO `t_locations` VALUES ('578', '展览路街道', '38', '3');
INSERT INTO `t_locations` VALUES ('579', '德胜街道', '38', '3');
INSERT INTO `t_locations` VALUES ('580', '新街口街道', '38', '3');
INSERT INTO `t_locations` VALUES ('581', '月坛街道', '38', '3');
INSERT INTO `t_locations` VALUES ('582', '西长安街街道', '38', '3');
INSERT INTO `t_locations` VALUES ('583', '金融街街道', '38', '3');
INSERT INTO `t_locations` VALUES ('584', '东花市街道', '39', '3');
INSERT INTO `t_locations` VALUES ('585', '体育馆路街道', '39', '3');
INSERT INTO `t_locations` VALUES ('586', '前门街道', '39', '3');
INSERT INTO `t_locations` VALUES ('587', '天坛街道', '39', '3');
INSERT INTO `t_locations` VALUES ('588', '崇文门外街道', '39', '3');
INSERT INTO `t_locations` VALUES ('589', '永定门外街道', '39', '3');
INSERT INTO `t_locations` VALUES ('590', '龙潭街道', '39', '3');
INSERT INTO `t_locations` VALUES ('591', '大栅栏街道', '40', '3');
INSERT INTO `t_locations` VALUES ('592', '天桥街道', '40', '3');
INSERT INTO `t_locations` VALUES ('593', '广安门内街道', '40', '3');
INSERT INTO `t_locations` VALUES ('594', '广安门外街道', '40', '3');
INSERT INTO `t_locations` VALUES ('595', '椿树街道', '40', '3');
INSERT INTO `t_locations` VALUES ('596', '牛街街道', '40', '3');
INSERT INTO `t_locations` VALUES ('597', '白纸坊街道', '40', '3');
INSERT INTO `t_locations` VALUES ('598', '陶然亭街道', '40', '3');
INSERT INTO `t_locations` VALUES ('599', '三里屯街道', '41', '3');
INSERT INTO `t_locations` VALUES ('600', '三间房地区（三间房乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('601', '东坝地区（东坝乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('602', '东风地区（东风乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('603', '亚运村街道', '41', '3');
INSERT INTO `t_locations` VALUES ('604', '八里庄街道', '41', '3');
INSERT INTO `t_locations` VALUES ('605', '六里屯街道', '41', '3');
INSERT INTO `t_locations` VALUES ('606', '劲松街道', '41', '3');
INSERT INTO `t_locations` VALUES ('607', '十八里店地区（十八里店乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('608', '南磨房地区（南磨房乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('609', '双井街道', '41', '3');
INSERT INTO `t_locations` VALUES ('610', '呼家楼街道', '41', '3');
INSERT INTO `t_locations` VALUES ('611', '和平街街道', '41', '3');
INSERT INTO `t_locations` VALUES ('612', '团结湖街道', '41', '3');
INSERT INTO `t_locations` VALUES ('613', '垡头街道', '41', '3');
INSERT INTO `t_locations` VALUES ('614', '大屯街道', '41', '3');
INSERT INTO `t_locations` VALUES ('615', '太阳宫地区（太阳宫乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('616', '奥运村地区（奥运村乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('617', '孙河地区（孙河乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('618', '安贞街道', '41', '3');
INSERT INTO `t_locations` VALUES ('619', '将台地区（将台乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('620', '小关街道', '41', '3');
INSERT INTO `t_locations` VALUES ('621', '小红门地区（小红门乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('622', '崔各庄地区（崔各庄乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('623', '左家庄街道', '41', '3');
INSERT INTO `t_locations` VALUES ('624', '常营回族地区（常营回族乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('625', '平房地区（平房乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('626', '建国门外街道', '41', '3');
INSERT INTO `t_locations` VALUES ('627', '望京开发街道', '41', '3');
INSERT INTO `t_locations` VALUES ('628', '望京街道', '41', '3');
INSERT INTO `t_locations` VALUES ('629', '朝阳门外街道', '41', '3');
INSERT INTO `t_locations` VALUES ('630', '来广营地区（来广营乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('631', '潘家园街道', '41', '3');
INSERT INTO `t_locations` VALUES ('632', '王四营地区（王四营乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('633', '管庄地区（管庄乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('634', '豆各庄地区（豆各庄乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('635', '酒仙桥街道', '41', '3');
INSERT INTO `t_locations` VALUES ('636', '金盏地区（金盏乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('637', '首都机场街道', '41', '3');
INSERT INTO `t_locations` VALUES ('638', '香河园街道', '41', '3');
INSERT INTO `t_locations` VALUES ('639', '高碑店地区（高碑店乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('640', '麦子店街道', '41', '3');
INSERT INTO `t_locations` VALUES ('641', '黑庄户地区（黑庄户乡）', '41', '3');
INSERT INTO `t_locations` VALUES ('642', '东铁匠营街道', '42', '3');
INSERT INTO `t_locations` VALUES ('643', '东高地街道', '42', '3');
INSERT INTO `t_locations` VALUES ('644', '丰台街道', '42', '3');
INSERT INTO `t_locations` VALUES ('645', '云岗街道', '42', '3');
INSERT INTO `t_locations` VALUES ('646', '南苑乡', '42', '3');
INSERT INTO `t_locations` VALUES ('647', '南苑街道', '42', '3');
INSERT INTO `t_locations` VALUES ('648', '卢沟桥乡', '42', '3');
INSERT INTO `t_locations` VALUES ('649', '卢沟桥街道', '42', '3');
INSERT INTO `t_locations` VALUES ('650', '右安门街道', '42', '3');
INSERT INTO `t_locations` VALUES ('651', '和义街道', '42', '3');
INSERT INTO `t_locations` VALUES ('652', '大红门街道', '42', '3');
INSERT INTO `t_locations` VALUES ('653', '太平桥街道', '42', '3');
INSERT INTO `t_locations` VALUES ('654', '宛平城地区', '42', '3');
INSERT INTO `t_locations` VALUES ('655', '新村街道', '42', '3');
INSERT INTO `t_locations` VALUES ('656', '方庄地区', '42', '3');
INSERT INTO `t_locations` VALUES ('657', '王佐镇', '42', '3');
INSERT INTO `t_locations` VALUES ('658', '花乡乡', '42', '3');
INSERT INTO `t_locations` VALUES ('659', '西罗园街道', '42', '3');
INSERT INTO `t_locations` VALUES ('660', '长辛店街道', '42', '3');
INSERT INTO `t_locations` VALUES ('661', '长辛店镇', '42', '3');
INSERT INTO `t_locations` VALUES ('662', '马家堡街道', '42', '3');
INSERT INTO `t_locations` VALUES ('663', '五里坨街道', '43', '3');
INSERT INTO `t_locations` VALUES ('664', '八宝山街道', '43', '3');
INSERT INTO `t_locations` VALUES ('665', '八角街道', '43', '3');
INSERT INTO `t_locations` VALUES ('666', '北辛安街道', '43', '3');
INSERT INTO `t_locations` VALUES ('667', '古城街道', '43', '3');
INSERT INTO `t_locations` VALUES ('668', '广宁街道', '43', '3');
INSERT INTO `t_locations` VALUES ('669', '老山街道', '43', '3');
INSERT INTO `t_locations` VALUES ('670', '苹果园街道', '43', '3');
INSERT INTO `t_locations` VALUES ('671', '金顶街街道', '43', '3');
INSERT INTO `t_locations` VALUES ('672', '鲁谷街道', '43', '3');
INSERT INTO `t_locations` VALUES ('673', '万寿路街道', '44', '3');
INSERT INTO `t_locations` VALUES ('674', '万柳地区（海淀乡）', '44', '3');
INSERT INTO `t_locations` VALUES ('675', '上地街道', '44', '3');
INSERT INTO `t_locations` VALUES ('676', '上庄镇', '44', '3');
INSERT INTO `t_locations` VALUES ('677', '东升地区（东升乡）', '44', '3');
INSERT INTO `t_locations` VALUES ('678', '中关村街道', '44', '3');
INSERT INTO `t_locations` VALUES ('679', '八里庄街道', '44', '3');
INSERT INTO `t_locations` VALUES ('680', '北下关街道', '44', '3');
INSERT INTO `t_locations` VALUES ('681', '北太平庄街道', '44', '3');
INSERT INTO `t_locations` VALUES ('682', '四季青镇', '44', '3');
INSERT INTO `t_locations` VALUES ('683', '学院路街道', '44', '3');
INSERT INTO `t_locations` VALUES ('684', '曙光街道', '44', '3');
INSERT INTO `t_locations` VALUES ('685', '永定路街道', '44', '3');
INSERT INTO `t_locations` VALUES ('686', '海淀街道', '44', '3');
INSERT INTO `t_locations` VALUES ('687', '清华园街道', '44', '3');
INSERT INTO `t_locations` VALUES ('688', '清河街道', '44', '3');
INSERT INTO `t_locations` VALUES ('689', '温泉镇', '44', '3');
INSERT INTO `t_locations` VALUES ('690', '燕园街道', '44', '3');
INSERT INTO `t_locations` VALUES ('691', '甘家口街道', '44', '3');
INSERT INTO `t_locations` VALUES ('692', '田村路街道', '44', '3');
INSERT INTO `t_locations` VALUES ('693', '紫竹院街道', '44', '3');
INSERT INTO `t_locations` VALUES ('694', '羊坊店街道', '44', '3');
INSERT INTO `t_locations` VALUES ('695', '花园路街道', '44', '3');
INSERT INTO `t_locations` VALUES ('696', '苏家坨镇', '44', '3');
INSERT INTO `t_locations` VALUES ('697', '西三旗街道', '44', '3');
INSERT INTO `t_locations` VALUES ('698', '西北旺镇', '44', '3');
INSERT INTO `t_locations` VALUES ('699', '青龙桥街道', '44', '3');
INSERT INTO `t_locations` VALUES ('700', '香山街道', '44', '3');
INSERT INTO `t_locations` VALUES ('701', '马连洼街道', '44', '3');
INSERT INTO `t_locations` VALUES ('702', '东辛房街道', '45', '3');
INSERT INTO `t_locations` VALUES ('703', '军庄镇', '45', '3');
INSERT INTO `t_locations` VALUES ('704', '城子街道', '45', '3');
INSERT INTO `t_locations` VALUES ('705', '大台街道', '45', '3');
INSERT INTO `t_locations` VALUES ('706', '大峪街道', '45', '3');
INSERT INTO `t_locations` VALUES ('707', '妙峰山镇', '45', '3');
INSERT INTO `t_locations` VALUES ('708', '斋堂镇', '45', '3');
INSERT INTO `t_locations` VALUES ('709', '永定镇', '45', '3');
INSERT INTO `t_locations` VALUES ('710', '清水镇', '45', '3');
INSERT INTO `t_locations` VALUES ('711', '潭柘寺镇', '45', '3');
INSERT INTO `t_locations` VALUES ('712', '王平地区', '45', '3');
INSERT INTO `t_locations` VALUES ('713', '雁翅镇', '45', '3');
INSERT INTO `t_locations` VALUES ('714', '龙泉镇', '45', '3');
INSERT INTO `t_locations` VALUES ('715', '东风街道', '46', '3');
INSERT INTO `t_locations` VALUES ('716', '佛子庄乡', '46', '3');
INSERT INTO `t_locations` VALUES ('717', '十渡镇', '46', '3');
INSERT INTO `t_locations` VALUES ('718', '南窖乡', '46', '3');
INSERT INTO `t_locations` VALUES ('719', '史家营乡', '46', '3');
INSERT INTO `t_locations` VALUES ('720', '向阳街道', '46', '3');
INSERT INTO `t_locations` VALUES ('721', '周口店地区', '46', '3');
INSERT INTO `t_locations` VALUES ('722', '城关街道', '46', '3');
INSERT INTO `t_locations` VALUES ('723', '大安山乡', '46', '3');
INSERT INTO `t_locations` VALUES ('724', '大石窝镇', '46', '3');
INSERT INTO `t_locations` VALUES ('725', '张坊镇', '46', '3');
INSERT INTO `t_locations` VALUES ('726', '拱辰街道', '46', '3');
INSERT INTO `t_locations` VALUES ('727', '新镇街道', '46', '3');
INSERT INTO `t_locations` VALUES ('728', '星城街道', '46', '3');
INSERT INTO `t_locations` VALUES ('729', '河北镇', '46', '3');
INSERT INTO `t_locations` VALUES ('730', '琉璃河地区', '46', '3');
INSERT INTO `t_locations` VALUES ('731', '石楼镇', '46', '3');
INSERT INTO `t_locations` VALUES ('732', '窦店镇', '46', '3');
INSERT INTO `t_locations` VALUES ('733', '良乡地区', '46', '3');
INSERT INTO `t_locations` VALUES ('734', '蒲洼乡', '46', '3');
INSERT INTO `t_locations` VALUES ('735', '西潞街道', '46', '3');
INSERT INTO `t_locations` VALUES ('736', '迎风街道', '46', '3');
INSERT INTO `t_locations` VALUES ('737', '长沟镇', '46', '3');
INSERT INTO `t_locations` VALUES ('738', '长阳镇', '46', '3');
INSERT INTO `t_locations` VALUES ('739', '阎村镇', '46', '3');
INSERT INTO `t_locations` VALUES ('740', '霞云岭乡', '46', '3');
INSERT INTO `t_locations` VALUES ('741', '青龙湖镇', '46', '3');
INSERT INTO `t_locations` VALUES ('742', '韩村河镇', '46', '3');
INSERT INTO `t_locations` VALUES ('743', '中仓街道', '47', '3');
INSERT INTO `t_locations` VALUES ('744', '于家务回族乡', '47', '3');
INSERT INTO `t_locations` VALUES ('745', '北苑街道', '47', '3');
INSERT INTO `t_locations` VALUES ('746', '台湖镇', '47', '3');
INSERT INTO `t_locations` VALUES ('747', '宋庄镇', '47', '3');
INSERT INTO `t_locations` VALUES ('748', '张家湾镇', '47', '3');
INSERT INTO `t_locations` VALUES ('749', '新华街道', '47', '3');
INSERT INTO `t_locations` VALUES ('750', '梨园地区', '47', '3');
INSERT INTO `t_locations` VALUES ('751', '永乐店镇', '47', '3');
INSERT INTO `t_locations` VALUES ('752', '永顺地区', '47', '3');
INSERT INTO `t_locations` VALUES ('753', '漷县镇', '47', '3');
INSERT INTO `t_locations` VALUES ('754', '潞城镇', '47', '3');
INSERT INTO `t_locations` VALUES ('755', '玉桥街道', '47', '3');
INSERT INTO `t_locations` VALUES ('756', '西集镇', '47', '3');
INSERT INTO `t_locations` VALUES ('757', '马驹桥镇', '47', '3');
INSERT INTO `t_locations` VALUES ('758', '仁和地区', '48', '3');
INSERT INTO `t_locations` VALUES ('759', '光明街道', '48', '3');
INSERT INTO `t_locations` VALUES ('760', '北务镇', '48', '3');
INSERT INTO `t_locations` VALUES ('761', '北小营镇', '48', '3');
INSERT INTO `t_locations` VALUES ('762', '北石槽镇', '48', '3');
INSERT INTO `t_locations` VALUES ('763', '南彩镇', '48', '3');
INSERT INTO `t_locations` VALUES ('764', '南法信地区', '48', '3');
INSERT INTO `t_locations` VALUES ('765', '后沙峪地区', '48', '3');
INSERT INTO `t_locations` VALUES ('766', '大孙各庄镇', '48', '3');
INSERT INTO `t_locations` VALUES ('767', '天竺地区', '48', '3');
INSERT INTO `t_locations` VALUES ('768', '张镇', '48', '3');
INSERT INTO `t_locations` VALUES ('769', '木林镇', '48', '3');
INSERT INTO `t_locations` VALUES ('770', '李桥镇', '48', '3');
INSERT INTO `t_locations` VALUES ('771', '李遂镇', '48', '3');
INSERT INTO `t_locations` VALUES ('772', '杨镇地区', '48', '3');
INSERT INTO `t_locations` VALUES ('773', '牛栏山地区', '48', '3');
INSERT INTO `t_locations` VALUES ('774', '石园街道', '48', '3');
INSERT INTO `t_locations` VALUES ('775', '胜利街道', '48', '3');
INSERT INTO `t_locations` VALUES ('776', '赵全营镇', '48', '3');
INSERT INTO `t_locations` VALUES ('777', '马坡地区', '48', '3');
INSERT INTO `t_locations` VALUES ('778', '高丽营镇', '48', '3');
INSERT INTO `t_locations` VALUES ('779', '龙湾屯镇', '48', '3');
INSERT INTO `t_locations` VALUES ('780', '东小口地区', '49', '3');
INSERT INTO `t_locations` VALUES ('781', '兴寿镇', '49', '3');
INSERT INTO `t_locations` VALUES ('782', '北七家镇', '49', '3');
INSERT INTO `t_locations` VALUES ('783', '十三陵镇', '49', '3');
INSERT INTO `t_locations` VALUES ('784', '南口地区', '49', '3');
INSERT INTO `t_locations` VALUES ('785', '南邵镇', '49', '3');
INSERT INTO `t_locations` VALUES ('786', '回龙观地区', '49', '3');
INSERT INTO `t_locations` VALUES ('787', '城北街道', '49', '3');
INSERT INTO `t_locations` VALUES ('788', '城南街道', '49', '3');
INSERT INTO `t_locations` VALUES ('789', '小汤山镇', '49', '3');
INSERT INTO `t_locations` VALUES ('790', '崔村镇', '49', '3');
INSERT INTO `t_locations` VALUES ('791', '沙河地区', '49', '3');
INSERT INTO `t_locations` VALUES ('792', '流村镇', '49', '3');
INSERT INTO `t_locations` VALUES ('793', '百善镇', '49', '3');
INSERT INTO `t_locations` VALUES ('794', '长陵镇', '49', '3');
INSERT INTO `t_locations` VALUES ('795', '阳坊镇', '49', '3');
INSERT INTO `t_locations` VALUES ('796', '马池口地区', '49', '3');
INSERT INTO `t_locations` VALUES ('797', '亦庄地区（亦庄镇）', '50', '3');
INSERT INTO `t_locations` VALUES ('798', '兴丰街道', '50', '3');
INSERT INTO `t_locations` VALUES ('799', '北臧村镇', '50', '3');
INSERT INTO `t_locations` VALUES ('800', '安定镇', '50', '3');
INSERT INTO `t_locations` VALUES ('801', '庞各庄镇', '50', '3');
INSERT INTO `t_locations` VALUES ('802', '旧宫地区（旧宫镇）', '50', '3');
INSERT INTO `t_locations` VALUES ('803', '林校路街道', '50', '3');
INSERT INTO `t_locations` VALUES ('804', '榆垡镇', '50', '3');
INSERT INTO `t_locations` VALUES ('805', '清源街道', '50', '3');
INSERT INTO `t_locations` VALUES ('806', '瀛海镇', '50', '3');
INSERT INTO `t_locations` VALUES ('807', '礼贤镇', '50', '3');
INSERT INTO `t_locations` VALUES ('808', '西红门地区（西红门镇）', '50', '3');
INSERT INTO `t_locations` VALUES ('809', '采育镇', '50', '3');
INSERT INTO `t_locations` VALUES ('810', '长子营镇', '50', '3');
INSERT INTO `t_locations` VALUES ('811', '青云店镇', '50', '3');
INSERT INTO `t_locations` VALUES ('812', '魏善庄镇', '50', '3');
INSERT INTO `t_locations` VALUES ('813', '黄村地区（黄村镇）', '50', '3');
INSERT INTO `t_locations` VALUES ('814', '九渡河镇', '51', '3');
INSERT INTO `t_locations` VALUES ('815', '北房镇', '51', '3');
INSERT INTO `t_locations` VALUES ('816', '喇叭沟门满族乡', '51', '3');
INSERT INTO `t_locations` VALUES ('817', '宝山镇', '51', '3');
INSERT INTO `t_locations` VALUES ('818', '庙城地区', '51', '3');
INSERT INTO `t_locations` VALUES ('819', '怀北镇', '51', '3');
INSERT INTO `t_locations` VALUES ('820', '怀柔地区', '51', '3');
INSERT INTO `t_locations` VALUES ('821', '杨宋镇', '51', '3');
INSERT INTO `t_locations` VALUES ('822', '桥梓镇', '51', '3');
INSERT INTO `t_locations` VALUES ('823', '汤河口镇', '51', '3');
INSERT INTO `t_locations` VALUES ('824', '泉河街道', '51', '3');
INSERT INTO `t_locations` VALUES ('825', '渤海镇', '51', '3');
INSERT INTO `t_locations` VALUES ('826', '琉璃庙镇', '51', '3');
INSERT INTO `t_locations` VALUES ('827', '长哨营满族乡', '51', '3');
INSERT INTO `t_locations` VALUES ('828', '雁栖地区', '51', '3');
INSERT INTO `t_locations` VALUES ('829', '龙山街道', '51', '3');
INSERT INTO `t_locations` VALUES ('830', '东高村镇', '52', '3');
INSERT INTO `t_locations` VALUES ('831', '兴谷街道', '52', '3');
INSERT INTO `t_locations` VALUES ('832', '刘家店镇', '52', '3');
INSERT INTO `t_locations` VALUES ('833', '南独乐河镇', '52', '3');
INSERT INTO `t_locations` VALUES ('834', '夏各庄镇', '52', '3');
INSERT INTO `t_locations` VALUES ('835', '大兴庄镇', '52', '3');
INSERT INTO `t_locations` VALUES ('836', '大华山镇', '52', '3');
INSERT INTO `t_locations` VALUES ('837', '山东庄镇', '52', '3');
INSERT INTO `t_locations` VALUES ('838', '峪口地区', '52', '3');
INSERT INTO `t_locations` VALUES ('839', '渔阳地区', '52', '3');
INSERT INTO `t_locations` VALUES ('840', '滨河街道', '52', '3');
INSERT INTO `t_locations` VALUES ('841', '熊儿寨乡', '52', '3');
INSERT INTO `t_locations` VALUES ('842', '王辛庄镇', '52', '3');
INSERT INTO `t_locations` VALUES ('843', '金海湖地区', '52', '3');
INSERT INTO `t_locations` VALUES ('844', '镇罗营镇', '52', '3');
INSERT INTO `t_locations` VALUES ('845', '马坊地区', '52', '3');
INSERT INTO `t_locations` VALUES ('846', '马昌营镇', '52', '3');
INSERT INTO `t_locations` VALUES ('847', '黄松峪乡', '52', '3');
INSERT INTO `t_locations` VALUES ('848', '不老屯镇', '53', '3');
INSERT INTO `t_locations` VALUES ('849', '东邵渠镇', '53', '3');
INSERT INTO `t_locations` VALUES ('850', '冯家峪镇', '53', '3');
INSERT INTO `t_locations` VALUES ('851', '北庄镇', '53', '3');
INSERT INTO `t_locations` VALUES ('852', '十里堡镇', '53', '3');
INSERT INTO `t_locations` VALUES ('853', '古北口镇', '53', '3');
INSERT INTO `t_locations` VALUES ('854', '大城子镇', '53', '3');
INSERT INTO `t_locations` VALUES ('855', '太师屯镇', '53', '3');
INSERT INTO `t_locations` VALUES ('856', '密云镇', '53', '3');
INSERT INTO `t_locations` VALUES ('857', '巨各庄镇', '53', '3');
INSERT INTO `t_locations` VALUES ('858', '新城子镇', '53', '3');
INSERT INTO `t_locations` VALUES ('859', '果园街道', '53', '3');
INSERT INTO `t_locations` VALUES ('860', '檀营地区（檀营满族蒙古族乡）', '53', '3');
INSERT INTO `t_locations` VALUES ('861', '河南寨镇', '53', '3');
INSERT INTO `t_locations` VALUES ('862', '溪翁庄镇', '53', '3');
INSERT INTO `t_locations` VALUES ('863', '石城镇', '53', '3');
INSERT INTO `t_locations` VALUES ('864', '穆家峪镇', '53', '3');
INSERT INTO `t_locations` VALUES ('865', '西田各庄镇', '53', '3');
INSERT INTO `t_locations` VALUES ('866', '高岭镇', '53', '3');
INSERT INTO `t_locations` VALUES ('867', '鼓楼街道', '53', '3');
INSERT INTO `t_locations` VALUES ('868', '井庄镇', '54', '3');
INSERT INTO `t_locations` VALUES ('869', '八达岭镇', '54', '3');
INSERT INTO `t_locations` VALUES ('870', '刘斌堡乡', '54', '3');
INSERT INTO `t_locations` VALUES ('871', '千家店镇', '54', '3');
INSERT INTO `t_locations` VALUES ('872', '四海镇', '54', '3');
INSERT INTO `t_locations` VALUES ('873', '大庄科乡', '54', '3');
INSERT INTO `t_locations` VALUES ('874', '大榆树镇', '54', '3');
INSERT INTO `t_locations` VALUES ('875', '康庄镇', '54', '3');
INSERT INTO `t_locations` VALUES ('876', '延庆镇', '54', '3');
INSERT INTO `t_locations` VALUES ('877', '张山营镇', '54', '3');
INSERT INTO `t_locations` VALUES ('878', '旧县镇', '54', '3');
INSERT INTO `t_locations` VALUES ('879', '永宁镇', '54', '3');
INSERT INTO `t_locations` VALUES ('880', '沈家营镇', '54', '3');
INSERT INTO `t_locations` VALUES ('881', '珍珠泉乡', '54', '3');
INSERT INTO `t_locations` VALUES ('882', '香营乡', '54', '3');
INSERT INTO `t_locations` VALUES ('883', '体育馆街道', '55', '3');
INSERT INTO `t_locations` VALUES ('884', '劝业场街道', '55', '3');
INSERT INTO `t_locations` VALUES ('885', '南市街道', '55', '3');
INSERT INTO `t_locations` VALUES ('886', '南营门街道', '55', '3');
INSERT INTO `t_locations` VALUES ('887', '小白楼街道', '55', '3');
INSERT INTO `t_locations` VALUES ('888', '新兴街道', '55', '3');
INSERT INTO `t_locations` VALUES ('889', '上杭路街道', '56', '3');
INSERT INTO `t_locations` VALUES ('890', '东新街道', '56', '3');
INSERT INTO `t_locations` VALUES ('891', '中山门街道', '56', '3');
INSERT INTO `t_locations` VALUES ('892', '二号桥街道', '56', '3');
INSERT INTO `t_locations` VALUES ('893', '向阳楼街道', '56', '3');
INSERT INTO `t_locations` VALUES ('894', '唐家口街道', '56', '3');
INSERT INTO `t_locations` VALUES ('895', '大王庄街道', '56', '3');
INSERT INTO `t_locations` VALUES ('896', '大直沽街道', '56', '3');
INSERT INTO `t_locations` VALUES ('897', '天津铁厂街道', '56', '3');
INSERT INTO `t_locations` VALUES ('898', '富民路街道', '56', '3');
INSERT INTO `t_locations` VALUES ('899', '常州道街道', '56', '3');
INSERT INTO `t_locations` VALUES ('900', '春华街道', '56', '3');
INSERT INTO `t_locations` VALUES ('901', '鲁山道街道', '56', '3');
INSERT INTO `t_locations` VALUES ('902', '下瓦房街道', '57', '3');
INSERT INTO `t_locations` VALUES ('903', '东海街道', '57', '3');
INSERT INTO `t_locations` VALUES ('904', '友谊路街道', '57', '3');
INSERT INTO `t_locations` VALUES ('905', '大营门街道', '57', '3');
INSERT INTO `t_locations` VALUES ('906', '天塔街道', '57', '3');
INSERT INTO `t_locations` VALUES ('907', '尖山街道', '57', '3');
INSERT INTO `t_locations` VALUES ('908', '挂甲寺街道', '57', '3');
INSERT INTO `t_locations` VALUES ('909', '柳林街道', '57', '3');
INSERT INTO `t_locations` VALUES ('910', '桃园街道', '57', '3');
INSERT INTO `t_locations` VALUES ('911', '梅江街道', '57', '3');
INSERT INTO `t_locations` VALUES ('912', '越秀路街道', '57', '3');
INSERT INTO `t_locations` VALUES ('913', '陈塘庄街道', '57', '3');
INSERT INTO `t_locations` VALUES ('914', '马场街道', '57', '3');
INSERT INTO `t_locations` VALUES ('915', '万兴街道', '58', '3');
INSERT INTO `t_locations` VALUES ('916', '体育中心街道', '58', '3');
INSERT INTO `t_locations` VALUES ('917', '八里台街道', '58', '3');
INSERT INTO `t_locations` VALUES ('918', '兴南街道', '58', '3');
INSERT INTO `t_locations` VALUES ('919', '华苑街道', '58', '3');
INSERT INTO `t_locations` VALUES ('920', '向阳路街道', '58', '3');
INSERT INTO `t_locations` VALUES ('921', '嘉陵道街道', '58', '3');
INSERT INTO `t_locations` VALUES ('922', '学府街道', '58', '3');
INSERT INTO `t_locations` VALUES ('923', '广开街道', '58', '3');
INSERT INTO `t_locations` VALUES ('924', '王顶堤街道', '58', '3');
INSERT INTO `t_locations` VALUES ('925', '长虹街道', '58', '3');
INSERT INTO `t_locations` VALUES ('926', '鼓楼街道', '58', '3');
INSERT INTO `t_locations` VALUES ('927', '光复道街道', '59', '3');
INSERT INTO `t_locations` VALUES ('928', '宁园街道', '59', '3');
INSERT INTO `t_locations` VALUES ('929', '建昌道街道', '59', '3');
INSERT INTO `t_locations` VALUES ('930', '新开河街道', '59', '3');
INSERT INTO `t_locations` VALUES ('931', '月牙河街道', '59', '3');
INSERT INTO `t_locations` VALUES ('932', '望海楼街道', '59', '3');
INSERT INTO `t_locations` VALUES ('933', '江都路街道', '59', '3');
INSERT INTO `t_locations` VALUES ('934', '王串场街道', '59', '3');
INSERT INTO `t_locations` VALUES ('935', '铁东路街道', '59', '3');
INSERT INTO `t_locations` VALUES ('936', '鸿顺里街道', '59', '3');
INSERT INTO `t_locations` VALUES ('937', '丁字沽街道', '60', '3');
INSERT INTO `t_locations` VALUES ('938', '三条石街道', '60', '3');
INSERT INTO `t_locations` VALUES ('939', '双环村街道', '60', '3');
INSERT INTO `t_locations` VALUES ('940', '咸阳北路街道', '60', '3');
INSERT INTO `t_locations` VALUES ('941', '大胡同街道', '60', '3');
INSERT INTO `t_locations` VALUES ('942', '芥园道街道', '60', '3');
INSERT INTO `t_locations` VALUES ('943', '西于庄街道', '60', '3');
INSERT INTO `t_locations` VALUES ('944', '西沽街道', '60', '3');
INSERT INTO `t_locations` VALUES ('945', '邵公庄街道', '60', '3');
INSERT INTO `t_locations` VALUES ('946', '铃铛阁街道', '60', '3');
INSERT INTO `t_locations` VALUES ('947', '三槐路街道', '61', '3');
INSERT INTO `t_locations` VALUES ('948', '北塘街道', '61', '3');
INSERT INTO `t_locations` VALUES ('949', '向阳街道', '61', '3');
INSERT INTO `t_locations` VALUES ('950', '大沽街道', '61', '3');
INSERT INTO `t_locations` VALUES ('951', '新城镇', '61', '3');
INSERT INTO `t_locations` VALUES ('952', '新村街道', '61', '3');
INSERT INTO `t_locations` VALUES ('953', '新河街道', '61', '3');
INSERT INTO `t_locations` VALUES ('954', '新港街道', '61', '3');
INSERT INTO `t_locations` VALUES ('955', '杭州道街道', '61', '3');
INSERT INTO `t_locations` VALUES ('956', '渤海石油街道', '61', '3');
INSERT INTO `t_locations` VALUES ('957', '胡家园街道', '61', '3');
INSERT INTO `t_locations` VALUES ('958', '解放路街道', '61', '3');
INSERT INTO `t_locations` VALUES ('959', '大田镇', '62', '3');
INSERT INTO `t_locations` VALUES ('960', '天化街道', '62', '3');
INSERT INTO `t_locations` VALUES ('961', '寨上街道', '62', '3');
INSERT INTO `t_locations` VALUES ('962', '杨家泊镇', '62', '3');
INSERT INTO `t_locations` VALUES ('963', '汉沽街道', '62', '3');
INSERT INTO `t_locations` VALUES ('964', '河西街道', '62', '3');
INSERT INTO `t_locations` VALUES ('965', '盐场街道', '62', '3');
INSERT INTO `t_locations` VALUES ('966', '茶淀镇', '62', '3');
INSERT INTO `t_locations` VALUES ('967', '营城镇', '62', '3');
INSERT INTO `t_locations` VALUES ('968', '中塘镇', '63', '3');
INSERT INTO `t_locations` VALUES ('969', '古林街道', '63', '3');
INSERT INTO `t_locations` VALUES ('970', '太平镇', '63', '3');
INSERT INTO `t_locations` VALUES ('971', '小王庄镇', '63', '3');
INSERT INTO `t_locations` VALUES ('972', '海滨街道', '63', '3');
INSERT INTO `t_locations` VALUES ('973', '港西街道', '63', '3');
INSERT INTO `t_locations` VALUES ('974', '胜利街道', '63', '3');
INSERT INTO `t_locations` VALUES ('975', '迎宾街道', '63', '3');
INSERT INTO `t_locations` VALUES ('976', '万新街道', '64', '3');
INSERT INTO `t_locations` VALUES ('977', '丰年村街道', '64', '3');
INSERT INTO `t_locations` VALUES ('978', '么六桥乡', '64', '3');
INSERT INTO `t_locations` VALUES ('979', '军粮城镇', '64', '3');
INSERT INTO `t_locations` VALUES ('980', '华明镇', '64', '3');
INSERT INTO `t_locations` VALUES ('981', '大毕庄镇', '64', '3');
INSERT INTO `t_locations` VALUES ('982', '张贵庄街道', '64', '3');
INSERT INTO `t_locations` VALUES ('983', '新立街道', '64', '3');
INSERT INTO `t_locations` VALUES ('984', '无瑕街道', '64', '3');
INSERT INTO `t_locations` VALUES ('985', '中北镇', '65', '3');
INSERT INTO `t_locations` VALUES ('986', '南河镇', '65', '3');
INSERT INTO `t_locations` VALUES ('987', '大寺镇', '65', '3');
INSERT INTO `t_locations` VALUES ('988', '张家窝镇', '65', '3');
INSERT INTO `t_locations` VALUES ('989', '李七庄街道', '65', '3');
INSERT INTO `t_locations` VALUES ('990', '杨柳青镇', '65', '3');
INSERT INTO `t_locations` VALUES ('991', '王稳庄镇', '65', '3');
INSERT INTO `t_locations` VALUES ('992', '西营门街道', '65', '3');
INSERT INTO `t_locations` VALUES ('993', '辛口镇', '65', '3');
INSERT INTO `t_locations` VALUES ('994', '八里台镇', '66', '3');
INSERT INTO `t_locations` VALUES ('995', '北闸口镇', '66', '3');
INSERT INTO `t_locations` VALUES ('996', '双桥河镇', '66', '3');
INSERT INTO `t_locations` VALUES ('997', '双港镇', '66', '3');
INSERT INTO `t_locations` VALUES ('998', '咸水沽镇', '66', '3');
INSERT INTO `t_locations` VALUES ('999', '小站镇', '66', '3');
INSERT INTO `t_locations` VALUES ('1000', '葛沽镇', '66', '3');
INSERT INTO `t_locations` VALUES ('1001', '辛庄镇', '66', '3');
INSERT INTO `t_locations` VALUES ('1002', '长青办事处', '66', '3');
INSERT INTO `t_locations` VALUES ('1003', '北仓镇', '67', '3');
INSERT INTO `t_locations` VALUES ('1004', '双口镇', '67', '3');
INSERT INTO `t_locations` VALUES ('1005', '双街镇', '67', '3');
INSERT INTO `t_locations` VALUES ('1006', '大张庄镇', '67', '3');
INSERT INTO `t_locations` VALUES ('1007', '天穆镇', '67', '3');
INSERT INTO `t_locations` VALUES ('1008', '宜兴埠镇', '67', '3');
INSERT INTO `t_locations` VALUES ('1009', '小淀镇', '67', '3');
INSERT INTO `t_locations` VALUES ('1010', '普东街道', '67', '3');
INSERT INTO `t_locations` VALUES ('1011', '果园新村街道', '67', '3');
INSERT INTO `t_locations` VALUES ('1012', '西堤头镇', '67', '3');
INSERT INTO `t_locations` VALUES ('1013', '集贤里街道', '67', '3');
INSERT INTO `t_locations` VALUES ('1014', '青光镇', '67', '3');
INSERT INTO `t_locations` VALUES ('1015', '上马台镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1016', '下伍旗镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1017', '下朱庄街道', '68', '3');
INSERT INTO `t_locations` VALUES ('1018', '东蒲洼街道', '68', '3');
INSERT INTO `t_locations` VALUES ('1019', '东马圈镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1020', '南蔡村镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1021', '城关镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1022', '大孟庄镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1023', '大王古庄镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1024', '大碱厂镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1025', '大良镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1026', '大黄堡乡', '68', '3');
INSERT INTO `t_locations` VALUES ('1027', '崔黄口镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1028', '徐官屯街道', '68', '3');
INSERT INTO `t_locations` VALUES ('1029', '曹子里乡', '68', '3');
INSERT INTO `t_locations` VALUES ('1030', '杨村街道', '68', '3');
INSERT INTO `t_locations` VALUES ('1031', '梅厂镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1032', '汊沽港镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1033', '河北屯镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1034', '河西务镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1035', '泗村店镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1036', '王庆坨镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1037', '白古屯乡', '68', '3');
INSERT INTO `t_locations` VALUES ('1038', '石各庄镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1039', '豆张庄乡', '68', '3');
INSERT INTO `t_locations` VALUES ('1040', '运河西街道', '68', '3');
INSERT INTO `t_locations` VALUES ('1041', '陈咀镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1042', '高村乡', '68', '3');
INSERT INTO `t_locations` VALUES ('1043', '黄庄街道', '68', '3');
INSERT INTO `t_locations` VALUES ('1044', '黄花店镇', '68', '3');
INSERT INTO `t_locations` VALUES ('1045', '八门城镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1046', '口东镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1047', '史各庄镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1048', '周良庄镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1049', '城关镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1050', '大口屯镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1051', '大唐庄镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1052', '大白庄镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1053', '大钟庄镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1054', '尔王庄乡', '69', '3');
INSERT INTO `t_locations` VALUES ('1055', '新安镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1056', '新开口镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1057', '方家庄镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1058', '林亭口镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1059', '牛家牌乡', '69', '3');
INSERT INTO `t_locations` VALUES ('1060', '牛道口镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1061', '王卜庄镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1062', '郝各庄镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1063', '霍各庄镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1064', '马家店镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1065', '高家庄镇', '69', '3');
INSERT INTO `t_locations` VALUES ('1066', '黄庄乡', '69', '3');
INSERT INTO `t_locations` VALUES ('1067', '七里海镇', '70', '3');
INSERT INTO `t_locations` VALUES ('1068', '东棘坨镇', '70', '3');
INSERT INTO `t_locations` VALUES ('1069', '丰台镇', '70', '3');
INSERT INTO `t_locations` VALUES ('1070', '俵口乡', '70', '3');
INSERT INTO `t_locations` VALUES ('1071', '北淮淀乡', '70', '3');
INSERT INTO `t_locations` VALUES ('1072', '大北涧沽镇', '70', '3');
INSERT INTO `t_locations` VALUES ('1073', '宁河镇', '70', '3');
INSERT INTO `t_locations` VALUES ('1074', '岳龙镇', '70', '3');
INSERT INTO `t_locations` VALUES ('1075', '廉庄子乡', '70', '3');
INSERT INTO `t_locations` VALUES ('1076', '板桥镇', '70', '3');
INSERT INTO `t_locations` VALUES ('1077', '潘庄镇', '70', '3');
INSERT INTO `t_locations` VALUES ('1078', '芦台镇', '70', '3');
INSERT INTO `t_locations` VALUES ('1079', '苗庄镇', '70', '3');
INSERT INTO `t_locations` VALUES ('1080', '造甲城镇', '70', '3');
INSERT INTO `t_locations` VALUES ('1081', '中旺镇', '71', '3');
INSERT INTO `t_locations` VALUES ('1082', '双塘镇', '71', '3');
INSERT INTO `t_locations` VALUES ('1083', '台头镇', '71', '3');
INSERT INTO `t_locations` VALUES ('1084', '唐官屯镇', '71', '3');
INSERT INTO `t_locations` VALUES ('1085', '团泊镇', '71', '3');
INSERT INTO `t_locations` VALUES ('1086', '大丰堆镇', '71', '3');
INSERT INTO `t_locations` VALUES ('1087', '大邱庄镇', '71', '3');
INSERT INTO `t_locations` VALUES ('1088', '子牙镇', '71', '3');
INSERT INTO `t_locations` VALUES ('1089', '杨成庄乡', '71', '3');
INSERT INTO `t_locations` VALUES ('1090', '梁头镇', '71', '3');
INSERT INTO `t_locations` VALUES ('1091', '沿庄镇', '71', '3');
INSERT INTO `t_locations` VALUES ('1092', '独流镇', '71', '3');
INSERT INTO `t_locations` VALUES ('1093', '王口镇', '71', '3');
INSERT INTO `t_locations` VALUES ('1094', '良王庄乡', '71', '3');
INSERT INTO `t_locations` VALUES ('1095', '蔡公庄镇', '71', '3');
INSERT INTO `t_locations` VALUES ('1096', '西翟庄镇', '71', '3');
INSERT INTO `t_locations` VALUES ('1097', '陈官屯镇', '71', '3');
INSERT INTO `t_locations` VALUES ('1098', '静海镇', '71', '3');
INSERT INTO `t_locations` VALUES ('1099', '上仓镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1100', '下仓镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1101', '下窝头镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1102', '下营镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1103', '东二营乡', '72', '3');
INSERT INTO `t_locations` VALUES ('1104', '东施古镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1105', '东赵各庄乡', '72', '3');
INSERT INTO `t_locations` VALUES ('1106', '五百户镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1107', '侯家营镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1108', '出头岭镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1109', '别山镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1110', '城关镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1111', '孙各庄满族乡', '72', '3');
INSERT INTO `t_locations` VALUES ('1112', '官庄镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1113', '尤古庄镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1114', '文昌街道', '72', '3');
INSERT INTO `t_locations` VALUES ('1115', '杨津庄镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1116', '桑梓镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1117', '洇溜镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1118', '白涧镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1119', '礼明庄乡', '72', '3');
INSERT INTO `t_locations` VALUES ('1120', '穿芳峪乡', '72', '3');
INSERT INTO `t_locations` VALUES ('1121', '罗庄子镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1122', '西龙虎峪镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1123', '许家台乡', '72', '3');
INSERT INTO `t_locations` VALUES ('1124', '邦均镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1125', '马伸桥镇', '72', '3');
INSERT INTO `t_locations` VALUES ('1126', '井陉县', '73', '3');
INSERT INTO `t_locations` VALUES ('1127', '井陉矿区', '73', '3');
INSERT INTO `t_locations` VALUES ('1128', '元氏县', '73', '3');
INSERT INTO `t_locations` VALUES ('1129', '平山县', '73', '3');
INSERT INTO `t_locations` VALUES ('1130', '新乐市', '73', '3');
INSERT INTO `t_locations` VALUES ('1131', '新华区', '73', '3');
INSERT INTO `t_locations` VALUES ('1132', '无极县', '73', '3');
INSERT INTO `t_locations` VALUES ('1133', '晋州市', '73', '3');
INSERT INTO `t_locations` VALUES ('1134', '栾城县', '73', '3');
INSERT INTO `t_locations` VALUES ('1135', '桥东区', '73', '3');
INSERT INTO `t_locations` VALUES ('1136', '桥西区', '73', '3');
INSERT INTO `t_locations` VALUES ('1137', '正定县', '73', '3');
INSERT INTO `t_locations` VALUES ('1138', '深泽县', '73', '3');
INSERT INTO `t_locations` VALUES ('1139', '灵寿县', '73', '3');
INSERT INTO `t_locations` VALUES ('1140', '藁城市', '73', '3');
INSERT INTO `t_locations` VALUES ('1141', '行唐县', '73', '3');
INSERT INTO `t_locations` VALUES ('1142', '裕华区', '73', '3');
INSERT INTO `t_locations` VALUES ('1143', '赞皇县', '73', '3');
INSERT INTO `t_locations` VALUES ('1144', '赵县', '73', '3');
INSERT INTO `t_locations` VALUES ('1145', '辛集市', '73', '3');
INSERT INTO `t_locations` VALUES ('1146', '长安区', '73', '3');
INSERT INTO `t_locations` VALUES ('1147', '高邑县', '73', '3');
INSERT INTO `t_locations` VALUES ('1148', '鹿泉市', '73', '3');
INSERT INTO `t_locations` VALUES ('1149', '丰南区', '74', '3');
INSERT INTO `t_locations` VALUES ('1150', '丰润区', '74', '3');
INSERT INTO `t_locations` VALUES ('1151', '乐亭县', '74', '3');
INSERT INTO `t_locations` VALUES ('1152', '古冶区', '74', '3');
INSERT INTO `t_locations` VALUES ('1153', '唐海县', '74', '3');
INSERT INTO `t_locations` VALUES ('1154', '开平区', '74', '3');
INSERT INTO `t_locations` VALUES ('1155', '滦南县', '74', '3');
INSERT INTO `t_locations` VALUES ('1156', '滦县', '74', '3');
INSERT INTO `t_locations` VALUES ('1157', '玉田县', '74', '3');
INSERT INTO `t_locations` VALUES ('1158', '路北区', '74', '3');
INSERT INTO `t_locations` VALUES ('1159', '路南区', '74', '3');
INSERT INTO `t_locations` VALUES ('1160', '迁安市', '74', '3');
INSERT INTO `t_locations` VALUES ('1161', '迁西县', '74', '3');
INSERT INTO `t_locations` VALUES ('1162', '遵化市', '74', '3');
INSERT INTO `t_locations` VALUES ('1163', '北戴河区', '75', '3');
INSERT INTO `t_locations` VALUES ('1164', '卢龙县', '75', '3');
INSERT INTO `t_locations` VALUES ('1165', '山海关区', '75', '3');
INSERT INTO `t_locations` VALUES ('1166', '抚宁县', '75', '3');
INSERT INTO `t_locations` VALUES ('1167', '昌黎县', '75', '3');
INSERT INTO `t_locations` VALUES ('1168', '海港区', '75', '3');
INSERT INTO `t_locations` VALUES ('1169', '青龙满族自治县', '75', '3');
INSERT INTO `t_locations` VALUES ('1170', '丛台区', '76', '3');
INSERT INTO `t_locations` VALUES ('1171', '临漳县', '76', '3');
INSERT INTO `t_locations` VALUES ('1172', '复兴区', '76', '3');
INSERT INTO `t_locations` VALUES ('1173', '大名县', '76', '3');
INSERT INTO `t_locations` VALUES ('1174', '峰峰矿区', '76', '3');
INSERT INTO `t_locations` VALUES ('1175', '广平县', '76', '3');
INSERT INTO `t_locations` VALUES ('1176', '成安县', '76', '3');
INSERT INTO `t_locations` VALUES ('1177', '曲周县', '76', '3');
INSERT INTO `t_locations` VALUES ('1178', '武安市', '76', '3');
INSERT INTO `t_locations` VALUES ('1179', '永年县', '76', '3');
INSERT INTO `t_locations` VALUES ('1180', '涉县', '76', '3');
INSERT INTO `t_locations` VALUES ('1181', '磁县', '76', '3');
INSERT INTO `t_locations` VALUES ('1182', '肥乡县', '76', '3');
INSERT INTO `t_locations` VALUES ('1183', '邯山区', '76', '3');
INSERT INTO `t_locations` VALUES ('1184', '邯郸县', '76', '3');
INSERT INTO `t_locations` VALUES ('1185', '邱县', '76', '3');
INSERT INTO `t_locations` VALUES ('1186', '馆陶县', '76', '3');
INSERT INTO `t_locations` VALUES ('1187', '魏县', '76', '3');
INSERT INTO `t_locations` VALUES ('1188', '鸡泽县', '76', '3');
INSERT INTO `t_locations` VALUES ('1189', '临城县', '77', '3');
INSERT INTO `t_locations` VALUES ('1190', '临西县', '77', '3');
INSERT INTO `t_locations` VALUES ('1191', '任县', '77', '3');
INSERT INTO `t_locations` VALUES ('1192', '内丘县', '77', '3');
INSERT INTO `t_locations` VALUES ('1193', '南和县', '77', '3');
INSERT INTO `t_locations` VALUES ('1194', '南宫市', '77', '3');
INSERT INTO `t_locations` VALUES ('1195', '威县', '77', '3');
INSERT INTO `t_locations` VALUES ('1196', '宁晋县', '77', '3');
INSERT INTO `t_locations` VALUES ('1197', '巨鹿县', '77', '3');
INSERT INTO `t_locations` VALUES ('1198', '平乡县', '77', '3');
INSERT INTO `t_locations` VALUES ('1199', '广宗县', '77', '3');
INSERT INTO `t_locations` VALUES ('1200', '新河县', '77', '3');
INSERT INTO `t_locations` VALUES ('1201', '柏乡县', '77', '3');
INSERT INTO `t_locations` VALUES ('1202', '桥东区', '77', '3');
INSERT INTO `t_locations` VALUES ('1203', '桥西区', '77', '3');
INSERT INTO `t_locations` VALUES ('1204', '沙河市', '77', '3');
INSERT INTO `t_locations` VALUES ('1205', '清河县', '77', '3');
INSERT INTO `t_locations` VALUES ('1206', '邢台县', '77', '3');
INSERT INTO `t_locations` VALUES ('1207', '隆尧县', '77', '3');
INSERT INTO `t_locations` VALUES ('1208', '北市区', '78', '3');
INSERT INTO `t_locations` VALUES ('1209', '南市区', '78', '3');
INSERT INTO `t_locations` VALUES ('1210', '博野县', '78', '3');
INSERT INTO `t_locations` VALUES ('1211', '唐县', '78', '3');
INSERT INTO `t_locations` VALUES ('1212', '安国市', '78', '3');
INSERT INTO `t_locations` VALUES ('1213', '安新县', '78', '3');
INSERT INTO `t_locations` VALUES ('1214', '定兴县', '78', '3');
INSERT INTO `t_locations` VALUES ('1215', '定州市', '78', '3');
INSERT INTO `t_locations` VALUES ('1216', '容城县', '78', '3');
INSERT INTO `t_locations` VALUES ('1217', '徐水县', '78', '3');
INSERT INTO `t_locations` VALUES ('1218', '新市区', '78', '3');
INSERT INTO `t_locations` VALUES ('1219', '易县', '78', '3');
INSERT INTO `t_locations` VALUES ('1220', '曲阳县', '78', '3');
INSERT INTO `t_locations` VALUES ('1221', '望都县', '78', '3');
INSERT INTO `t_locations` VALUES ('1222', '涞水县', '78', '3');
INSERT INTO `t_locations` VALUES ('1223', '涞源县', '78', '3');
INSERT INTO `t_locations` VALUES ('1224', '涿州市', '78', '3');
INSERT INTO `t_locations` VALUES ('1225', '清苑县', '78', '3');
INSERT INTO `t_locations` VALUES ('1226', '满城县', '78', '3');
INSERT INTO `t_locations` VALUES ('1227', '蠡县', '78', '3');
INSERT INTO `t_locations` VALUES ('1228', '阜平县', '78', '3');
INSERT INTO `t_locations` VALUES ('1229', '雄县', '78', '3');
INSERT INTO `t_locations` VALUES ('1230', '顺平县', '78', '3');
INSERT INTO `t_locations` VALUES ('1231', '高碑店市', '78', '3');
INSERT INTO `t_locations` VALUES ('1232', '高阳县', '78', '3');
INSERT INTO `t_locations` VALUES ('1233', '万全县', '79', '3');
INSERT INTO `t_locations` VALUES ('1234', '下花园区', '79', '3');
INSERT INTO `t_locations` VALUES ('1235', '宣化区', '79', '3');
INSERT INTO `t_locations` VALUES ('1236', '宣化县', '79', '3');
INSERT INTO `t_locations` VALUES ('1237', '尚义县', '79', '3');
INSERT INTO `t_locations` VALUES ('1238', '崇礼县', '79', '3');
INSERT INTO `t_locations` VALUES ('1239', '康保县', '79', '3');
INSERT INTO `t_locations` VALUES ('1240', '张北县', '79', '3');
INSERT INTO `t_locations` VALUES ('1241', '怀安县', '79', '3');
INSERT INTO `t_locations` VALUES ('1242', '怀来县', '79', '3');
INSERT INTO `t_locations` VALUES ('1243', '桥东区', '79', '3');
INSERT INTO `t_locations` VALUES ('1244', '桥西区', '79', '3');
INSERT INTO `t_locations` VALUES ('1245', '沽源县', '79', '3');
INSERT INTO `t_locations` VALUES ('1246', '涿鹿县', '79', '3');
INSERT INTO `t_locations` VALUES ('1247', '蔚县', '79', '3');
INSERT INTO `t_locations` VALUES ('1248', '赤城县', '79', '3');
INSERT INTO `t_locations` VALUES ('1249', '阳原县', '79', '3');
INSERT INTO `t_locations` VALUES ('1250', '丰宁满族自治县', '80', '3');
INSERT INTO `t_locations` VALUES ('1251', '兴隆县', '80', '3');
INSERT INTO `t_locations` VALUES ('1252', '双桥区', '80', '3');
INSERT INTO `t_locations` VALUES ('1253', '双滦区', '80', '3');
INSERT INTO `t_locations` VALUES ('1254', '围场满族蒙古族自治县', '80', '3');
INSERT INTO `t_locations` VALUES ('1255', '宽城满族自治县', '80', '3');
INSERT INTO `t_locations` VALUES ('1256', '平泉县', '80', '3');
INSERT INTO `t_locations` VALUES ('1257', '承德县', '80', '3');
INSERT INTO `t_locations` VALUES ('1258', '滦平县', '80', '3');
INSERT INTO `t_locations` VALUES ('1259', '隆化县', '80', '3');
INSERT INTO `t_locations` VALUES ('1260', '鹰手营子矿区', '80', '3');
INSERT INTO `t_locations` VALUES ('1261', '冀州市', '81', '3');
INSERT INTO `t_locations` VALUES ('1262', '安平县', '81', '3');
INSERT INTO `t_locations` VALUES ('1263', '故城县', '81', '3');
INSERT INTO `t_locations` VALUES ('1264', '景县', '81', '3');
INSERT INTO `t_locations` VALUES ('1265', '枣强县', '81', '3');
INSERT INTO `t_locations` VALUES ('1266', '桃城区', '81', '3');
INSERT INTO `t_locations` VALUES ('1267', '武强县', '81', '3');
INSERT INTO `t_locations` VALUES ('1268', '武邑县', '81', '3');
INSERT INTO `t_locations` VALUES ('1269', '深州市', '81', '3');
INSERT INTO `t_locations` VALUES ('1270', '阜城县', '81', '3');
INSERT INTO `t_locations` VALUES ('1271', '饶阳县', '81', '3');
INSERT INTO `t_locations` VALUES ('1272', '三河市', '82', '3');
INSERT INTO `t_locations` VALUES ('1273', '固安县', '82', '3');
INSERT INTO `t_locations` VALUES ('1274', '大厂回族自治县', '82', '3');
INSERT INTO `t_locations` VALUES ('1275', '大城县', '82', '3');
INSERT INTO `t_locations` VALUES ('1276', '安次区', '82', '3');
INSERT INTO `t_locations` VALUES ('1277', '广阳区', '82', '3');
INSERT INTO `t_locations` VALUES ('1278', '文安县', '82', '3');
INSERT INTO `t_locations` VALUES ('1279', '永清县', '82', '3');
INSERT INTO `t_locations` VALUES ('1280', '霸州市', '82', '3');
INSERT INTO `t_locations` VALUES ('1281', '香河县', '82', '3');
INSERT INTO `t_locations` VALUES ('1282', '东光县', '83', '3');
INSERT INTO `t_locations` VALUES ('1283', '任丘市', '83', '3');
INSERT INTO `t_locations` VALUES ('1284', '南皮县', '83', '3');
INSERT INTO `t_locations` VALUES ('1285', '吴桥县', '83', '3');
INSERT INTO `t_locations` VALUES ('1286', '孟村回族自治县', '83', '3');
INSERT INTO `t_locations` VALUES ('1287', '新华区', '83', '3');
INSERT INTO `t_locations` VALUES ('1288', '沧县', '83', '3');
INSERT INTO `t_locations` VALUES ('1289', '河间市', '83', '3');
INSERT INTO `t_locations` VALUES ('1290', '泊头市', '83', '3');
INSERT INTO `t_locations` VALUES ('1291', '海兴县', '83', '3');
INSERT INTO `t_locations` VALUES ('1292', '献县', '83', '3');
INSERT INTO `t_locations` VALUES ('1293', '盐山县', '83', '3');
INSERT INTO `t_locations` VALUES ('1294', '肃宁县', '83', '3');
INSERT INTO `t_locations` VALUES ('1295', '运河区', '83', '3');
INSERT INTO `t_locations` VALUES ('1296', '青县', '83', '3');
INSERT INTO `t_locations` VALUES ('1297', '黄骅市', '83', '3');
INSERT INTO `t_locations` VALUES ('1298', '万柏林区', '84', '3');
INSERT INTO `t_locations` VALUES ('1299', '古交市', '84', '3');
INSERT INTO `t_locations` VALUES ('1300', '娄烦县', '84', '3');
INSERT INTO `t_locations` VALUES ('1301', '小店区', '84', '3');
INSERT INTO `t_locations` VALUES ('1302', '尖草坪区', '84', '3');
INSERT INTO `t_locations` VALUES ('1303', '晋源区', '84', '3');
INSERT INTO `t_locations` VALUES ('1304', '杏花岭区', '84', '3');
INSERT INTO `t_locations` VALUES ('1305', '清徐县', '84', '3');
INSERT INTO `t_locations` VALUES ('1306', '迎泽区', '84', '3');
INSERT INTO `t_locations` VALUES ('1307', '阳曲县', '84', '3');
INSERT INTO `t_locations` VALUES ('1308', '南郊区', '85', '3');
INSERT INTO `t_locations` VALUES ('1309', '城区', '85', '3');
INSERT INTO `t_locations` VALUES ('1310', '大同县', '85', '3');
INSERT INTO `t_locations` VALUES ('1311', '天镇县', '85', '3');
INSERT INTO `t_locations` VALUES ('1312', '左云县', '85', '3');
INSERT INTO `t_locations` VALUES ('1313', '广灵县', '85', '3');
INSERT INTO `t_locations` VALUES ('1314', '新荣区', '85', '3');
INSERT INTO `t_locations` VALUES ('1315', '浑源县', '85', '3');
INSERT INTO `t_locations` VALUES ('1316', '灵丘县', '85', '3');
INSERT INTO `t_locations` VALUES ('1317', '矿区', '85', '3');
INSERT INTO `t_locations` VALUES ('1318', '阳高县', '85', '3');
INSERT INTO `t_locations` VALUES ('1319', '城区', '86', '3');
INSERT INTO `t_locations` VALUES ('1320', '平定县', '86', '3');
INSERT INTO `t_locations` VALUES ('1321', '盂县', '86', '3');
INSERT INTO `t_locations` VALUES ('1322', '矿区', '86', '3');
INSERT INTO `t_locations` VALUES ('1323', '郊区', '86', '3');
INSERT INTO `t_locations` VALUES ('1324', '城区', '87', '3');
INSERT INTO `t_locations` VALUES ('1325', '壶关县', '87', '3');
INSERT INTO `t_locations` VALUES ('1326', '屯留县', '87', '3');
INSERT INTO `t_locations` VALUES ('1327', '平顺县', '87', '3');
INSERT INTO `t_locations` VALUES ('1328', '武乡县', '87', '3');
INSERT INTO `t_locations` VALUES ('1329', '沁县', '87', '3');
INSERT INTO `t_locations` VALUES ('1330', '沁源县', '87', '3');
INSERT INTO `t_locations` VALUES ('1331', '潞城市', '87', '3');
INSERT INTO `t_locations` VALUES ('1332', '襄垣县', '87', '3');
INSERT INTO `t_locations` VALUES ('1333', '郊区', '87', '3');
INSERT INTO `t_locations` VALUES ('1334', '长子县', '87', '3');
INSERT INTO `t_locations` VALUES ('1335', '长治县', '87', '3');
INSERT INTO `t_locations` VALUES ('1336', '黎城县', '87', '3');
INSERT INTO `t_locations` VALUES ('1337', '城区', '88', '3');
INSERT INTO `t_locations` VALUES ('1338', '沁水县', '88', '3');
INSERT INTO `t_locations` VALUES ('1339', '泽州县', '88', '3');
INSERT INTO `t_locations` VALUES ('1340', '阳城县', '88', '3');
INSERT INTO `t_locations` VALUES ('1341', '陵川县', '88', '3');
INSERT INTO `t_locations` VALUES ('1342', '高平市', '88', '3');
INSERT INTO `t_locations` VALUES ('1343', '右玉县', '89', '3');
INSERT INTO `t_locations` VALUES ('1344', '山阴县', '89', '3');
INSERT INTO `t_locations` VALUES ('1345', '平鲁区', '89', '3');
INSERT INTO `t_locations` VALUES ('1346', '应县', '89', '3');
INSERT INTO `t_locations` VALUES ('1347', '怀仁县', '89', '3');
INSERT INTO `t_locations` VALUES ('1348', '朔城区', '89', '3');
INSERT INTO `t_locations` VALUES ('1349', '介休市', '90', '3');
INSERT INTO `t_locations` VALUES ('1350', '和顺县', '90', '3');
INSERT INTO `t_locations` VALUES ('1351', '太谷县', '90', '3');
INSERT INTO `t_locations` VALUES ('1352', '寿阳县', '90', '3');
INSERT INTO `t_locations` VALUES ('1353', '左权县', '90', '3');
INSERT INTO `t_locations` VALUES ('1354', '平遥县', '90', '3');
INSERT INTO `t_locations` VALUES ('1355', '昔阳县', '90', '3');
INSERT INTO `t_locations` VALUES ('1356', '榆次区', '90', '3');
INSERT INTO `t_locations` VALUES ('1357', '榆社县', '90', '3');
INSERT INTO `t_locations` VALUES ('1358', '灵石县', '90', '3');
INSERT INTO `t_locations` VALUES ('1359', '祁县', '90', '3');
INSERT INTO `t_locations` VALUES ('1360', '万荣县', '91', '3');
INSERT INTO `t_locations` VALUES ('1361', '临猗县', '91', '3');
INSERT INTO `t_locations` VALUES ('1362', '垣曲县', '91', '3');
INSERT INTO `t_locations` VALUES ('1363', '夏县', '91', '3');
INSERT INTO `t_locations` VALUES ('1364', '平陆县', '91', '3');
INSERT INTO `t_locations` VALUES ('1365', '新绛县', '91', '3');
INSERT INTO `t_locations` VALUES ('1366', '永济市', '91', '3');
INSERT INTO `t_locations` VALUES ('1367', '河津市', '91', '3');
INSERT INTO `t_locations` VALUES ('1368', '盐湖区', '91', '3');
INSERT INTO `t_locations` VALUES ('1369', '稷山县', '91', '3');
INSERT INTO `t_locations` VALUES ('1370', '绛县', '91', '3');
INSERT INTO `t_locations` VALUES ('1371', '芮城县', '91', '3');
INSERT INTO `t_locations` VALUES ('1372', '闻喜县', '91', '3');
INSERT INTO `t_locations` VALUES ('1373', '五台县', '92', '3');
INSERT INTO `t_locations` VALUES ('1374', '五寨县', '92', '3');
INSERT INTO `t_locations` VALUES ('1375', '代县', '92', '3');
INSERT INTO `t_locations` VALUES ('1376', '保德县', '92', '3');
INSERT INTO `t_locations` VALUES ('1377', '偏关县', '92', '3');
INSERT INTO `t_locations` VALUES ('1378', '原平市', '92', '3');
INSERT INTO `t_locations` VALUES ('1379', '宁武县', '92', '3');
INSERT INTO `t_locations` VALUES ('1380', '定襄县', '92', '3');
INSERT INTO `t_locations` VALUES ('1381', '岢岚县', '92', '3');
INSERT INTO `t_locations` VALUES ('1382', '忻府区', '92', '3');
INSERT INTO `t_locations` VALUES ('1383', '河曲县', '92', '3');
INSERT INTO `t_locations` VALUES ('1384', '神池县', '92', '3');
INSERT INTO `t_locations` VALUES ('1385', '繁峙县', '92', '3');
INSERT INTO `t_locations` VALUES ('1386', '静乐县', '92', '3');
INSERT INTO `t_locations` VALUES ('1387', '乡宁县', '93', '3');
INSERT INTO `t_locations` VALUES ('1388', '侯马市', '93', '3');
INSERT INTO `t_locations` VALUES ('1389', '古县', '93', '3');
INSERT INTO `t_locations` VALUES ('1390', '吉县', '93', '3');
INSERT INTO `t_locations` VALUES ('1391', '大宁县', '93', '3');
INSERT INTO `t_locations` VALUES ('1392', '安泽县', '93', '3');
INSERT INTO `t_locations` VALUES ('1393', '尧都区', '93', '3');
INSERT INTO `t_locations` VALUES ('1394', '曲沃县', '93', '3');
INSERT INTO `t_locations` VALUES ('1395', '永和县', '93', '3');
INSERT INTO `t_locations` VALUES ('1396', '汾西县', '93', '3');
INSERT INTO `t_locations` VALUES ('1397', '洪洞县', '93', '3');
INSERT INTO `t_locations` VALUES ('1398', '浮山县', '93', '3');
INSERT INTO `t_locations` VALUES ('1399', '翼城县', '93', '3');
INSERT INTO `t_locations` VALUES ('1400', '蒲县', '93', '3');
INSERT INTO `t_locations` VALUES ('1401', '襄汾县', '93', '3');
INSERT INTO `t_locations` VALUES ('1402', '隰县', '93', '3');
INSERT INTO `t_locations` VALUES ('1403', '霍州市', '93', '3');
INSERT INTO `t_locations` VALUES ('1404', '中阳县', '94', '3');
INSERT INTO `t_locations` VALUES ('1405', '临县', '94', '3');
INSERT INTO `t_locations` VALUES ('1406', '交口县', '94', '3');
INSERT INTO `t_locations` VALUES ('1407', '交城县', '94', '3');
INSERT INTO `t_locations` VALUES ('1408', '兴县', '94', '3');
INSERT INTO `t_locations` VALUES ('1409', '孝义市', '94', '3');
INSERT INTO `t_locations` VALUES ('1410', '岚县', '94', '3');
INSERT INTO `t_locations` VALUES ('1411', '文水县', '94', '3');
INSERT INTO `t_locations` VALUES ('1412', '方山县', '94', '3');
INSERT INTO `t_locations` VALUES ('1413', '柳林县', '94', '3');
INSERT INTO `t_locations` VALUES ('1414', '汾阳市', '94', '3');
INSERT INTO `t_locations` VALUES ('1415', '石楼县', '94', '3');
INSERT INTO `t_locations` VALUES ('1416', '离石区', '94', '3');
INSERT INTO `t_locations` VALUES ('1417', '和林格尔县', '95', '3');
INSERT INTO `t_locations` VALUES ('1418', '回民区', '95', '3');
INSERT INTO `t_locations` VALUES ('1419', '土默特左旗', '95', '3');
INSERT INTO `t_locations` VALUES ('1420', '托克托县', '95', '3');
INSERT INTO `t_locations` VALUES ('1421', '新城区', '95', '3');
INSERT INTO `t_locations` VALUES ('1422', '武川县', '95', '3');
INSERT INTO `t_locations` VALUES ('1423', '清水河县', '95', '3');
INSERT INTO `t_locations` VALUES ('1424', '玉泉区', '95', '3');
INSERT INTO `t_locations` VALUES ('1425', '赛罕区', '95', '3');
INSERT INTO `t_locations` VALUES ('1426', '东河区', '96', '3');
INSERT INTO `t_locations` VALUES ('1427', '九原区', '96', '3');
INSERT INTO `t_locations` VALUES ('1428', '固阳县', '96', '3');
INSERT INTO `t_locations` VALUES ('1429', '土默特右旗', '96', '3');
INSERT INTO `t_locations` VALUES ('1430', '昆都仑区', '96', '3');
INSERT INTO `t_locations` VALUES ('1431', '白云矿区', '96', '3');
INSERT INTO `t_locations` VALUES ('1432', '石拐区', '96', '3');
INSERT INTO `t_locations` VALUES ('1433', '达尔罕茂明安联合旗', '96', '3');
INSERT INTO `t_locations` VALUES ('1434', '青山区', '96', '3');
INSERT INTO `t_locations` VALUES ('1435', '乌达区', '97', '3');
INSERT INTO `t_locations` VALUES ('1436', '海勃湾区', '97', '3');
INSERT INTO `t_locations` VALUES ('1437', '海南区', '97', '3');
INSERT INTO `t_locations` VALUES ('1438', '元宝山区', '98', '3');
INSERT INTO `t_locations` VALUES ('1439', '克什克腾旗', '98', '3');
INSERT INTO `t_locations` VALUES ('1440', '喀喇沁旗', '98', '3');
INSERT INTO `t_locations` VALUES ('1441', '宁城县', '98', '3');
INSERT INTO `t_locations` VALUES ('1442', '巴林右旗', '98', '3');
INSERT INTO `t_locations` VALUES ('1443', '巴林左旗', '98', '3');
INSERT INTO `t_locations` VALUES ('1444', '敖汉旗', '98', '3');
INSERT INTO `t_locations` VALUES ('1445', '松山区', '98', '3');
INSERT INTO `t_locations` VALUES ('1446', '林西县', '98', '3');
INSERT INTO `t_locations` VALUES ('1447', '红山区', '98', '3');
INSERT INTO `t_locations` VALUES ('1448', '翁牛特旗', '98', '3');
INSERT INTO `t_locations` VALUES ('1449', '阿鲁科尔沁旗', '98', '3');
INSERT INTO `t_locations` VALUES ('1450', '奈曼旗', '99', '3');
INSERT INTO `t_locations` VALUES ('1451', '库伦旗', '99', '3');
INSERT INTO `t_locations` VALUES ('1452', '开鲁县', '99', '3');
INSERT INTO `t_locations` VALUES ('1453', '扎鲁特旗', '99', '3');
INSERT INTO `t_locations` VALUES ('1454', '科尔沁区', '99', '3');
INSERT INTO `t_locations` VALUES ('1455', '科尔沁左翼中旗', '99', '3');
INSERT INTO `t_locations` VALUES ('1456', '科尔沁左翼后旗', '99', '3');
INSERT INTO `t_locations` VALUES ('1457', '霍林郭勒市', '99', '3');
INSERT INTO `t_locations` VALUES ('1458', '东胜区', '100', '3');
INSERT INTO `t_locations` VALUES ('1459', '乌审旗', '100', '3');
INSERT INTO `t_locations` VALUES ('1460', '伊金霍洛旗', '100', '3');
INSERT INTO `t_locations` VALUES ('1461', '准格尔旗', '100', '3');
INSERT INTO `t_locations` VALUES ('1462', '杭锦旗', '100', '3');
INSERT INTO `t_locations` VALUES ('1463', '达拉特旗', '100', '3');
INSERT INTO `t_locations` VALUES ('1464', '鄂东胜区', '100', '3');
INSERT INTO `t_locations` VALUES ('1465', '鄂托克前旗', '100', '3');
INSERT INTO `t_locations` VALUES ('1466', '鄂托克旗', '100', '3');
INSERT INTO `t_locations` VALUES ('1467', '扎兰屯市', '101', '3');
INSERT INTO `t_locations` VALUES ('1468', '新巴尔虎右旗', '101', '3');
INSERT INTO `t_locations` VALUES ('1469', '新巴尔虎左旗', '101', '3');
INSERT INTO `t_locations` VALUES ('1470', '根河市', '101', '3');
INSERT INTO `t_locations` VALUES ('1471', '海拉尔区', '101', '3');
INSERT INTO `t_locations` VALUES ('1472', '满洲里市', '101', '3');
INSERT INTO `t_locations` VALUES ('1473', '牙克石市', '101', '3');
INSERT INTO `t_locations` VALUES ('1474', '莫力达瓦达斡尔族自治旗', '101', '3');
INSERT INTO `t_locations` VALUES ('1475', '鄂伦春自治旗', '101', '3');
INSERT INTO `t_locations` VALUES ('1476', '鄂温克族自治旗', '101', '3');
INSERT INTO `t_locations` VALUES ('1477', '阿荣旗', '101', '3');
INSERT INTO `t_locations` VALUES ('1478', '陈巴尔虎旗', '101', '3');
INSERT INTO `t_locations` VALUES ('1479', '额尔古纳市', '101', '3');
INSERT INTO `t_locations` VALUES ('1480', '临河区', '102', '3');
INSERT INTO `t_locations` VALUES ('1481', '乌拉特中旗', '102', '3');
INSERT INTO `t_locations` VALUES ('1482', '乌拉特前旗', '102', '3');
INSERT INTO `t_locations` VALUES ('1483', '乌拉特后旗', '102', '3');
INSERT INTO `t_locations` VALUES ('1484', '五原县', '102', '3');
INSERT INTO `t_locations` VALUES ('1485', '杭锦后旗', '102', '3');
INSERT INTO `t_locations` VALUES ('1486', '磴口县', '102', '3');
INSERT INTO `t_locations` VALUES ('1487', '丰镇市', '103', '3');
INSERT INTO `t_locations` VALUES ('1488', '兴和县', '103', '3');
INSERT INTO `t_locations` VALUES ('1489', '凉城县', '103', '3');
INSERT INTO `t_locations` VALUES ('1490', '化德县', '103', '3');
INSERT INTO `t_locations` VALUES ('1491', '卓资县', '103', '3');
INSERT INTO `t_locations` VALUES ('1492', '商都县', '103', '3');
INSERT INTO `t_locations` VALUES ('1493', '四子王旗', '103', '3');
INSERT INTO `t_locations` VALUES ('1494', '察哈尔右翼中旗', '103', '3');
INSERT INTO `t_locations` VALUES ('1495', '察哈尔右翼前旗', '103', '3');
INSERT INTO `t_locations` VALUES ('1496', '察哈尔右翼后旗', '103', '3');
INSERT INTO `t_locations` VALUES ('1497', '集宁区', '103', '3');
INSERT INTO `t_locations` VALUES ('1498', '乌兰浩特市', '104', '3');
INSERT INTO `t_locations` VALUES ('1499', '扎赉特旗', '104', '3');
INSERT INTO `t_locations` VALUES ('1500', '科尔沁右翼中旗', '104', '3');
INSERT INTO `t_locations` VALUES ('1501', '科尔沁右翼前旗', '104', '3');
INSERT INTO `t_locations` VALUES ('1502', '突泉县', '104', '3');
INSERT INTO `t_locations` VALUES ('1503', '阿尔山市', '104', '3');
INSERT INTO `t_locations` VALUES ('1504', '东乌珠穆沁旗', '105', '3');
INSERT INTO `t_locations` VALUES ('1505', '二连浩特市', '105', '3');
INSERT INTO `t_locations` VALUES ('1506', '多伦县', '105', '3');
INSERT INTO `t_locations` VALUES ('1507', '太仆寺旗', '105', '3');
INSERT INTO `t_locations` VALUES ('1508', '正蓝旗', '105', '3');
INSERT INTO `t_locations` VALUES ('1509', '正镶白旗', '105', '3');
INSERT INTO `t_locations` VALUES ('1510', '苏尼特右旗', '105', '3');
INSERT INTO `t_locations` VALUES ('1511', '苏尼特左旗', '105', '3');
INSERT INTO `t_locations` VALUES ('1512', '西乌珠穆沁旗', '105', '3');
INSERT INTO `t_locations` VALUES ('1513', '锡林浩特市', '105', '3');
INSERT INTO `t_locations` VALUES ('1514', '镶黄旗', '105', '3');
INSERT INTO `t_locations` VALUES ('1515', '阿巴嘎旗', '105', '3');
INSERT INTO `t_locations` VALUES ('1516', '阿拉善右旗', '106', '3');
INSERT INTO `t_locations` VALUES ('1517', '阿拉善左旗', '106', '3');
INSERT INTO `t_locations` VALUES ('1518', '额济纳旗', '106', '3');
INSERT INTO `t_locations` VALUES ('1519', '东陵区', '107', '3');
INSERT INTO `t_locations` VALUES ('1520', '于洪区', '107', '3');
INSERT INTO `t_locations` VALUES ('1521', '和平区', '107', '3');
INSERT INTO `t_locations` VALUES ('1522', '大东区', '107', '3');
INSERT INTO `t_locations` VALUES ('1523', '康平县', '107', '3');
INSERT INTO `t_locations` VALUES ('1524', '新民市', '107', '3');
INSERT INTO `t_locations` VALUES ('1525', '沈北新区', '107', '3');
INSERT INTO `t_locations` VALUES ('1526', '沈河区', '107', '3');
INSERT INTO `t_locations` VALUES ('1527', '法库县', '107', '3');
INSERT INTO `t_locations` VALUES ('1528', '皇姑区', '107', '3');
INSERT INTO `t_locations` VALUES ('1529', '苏家屯区', '107', '3');
INSERT INTO `t_locations` VALUES ('1530', '辽中县', '107', '3');
INSERT INTO `t_locations` VALUES ('1531', '铁西区', '107', '3');
INSERT INTO `t_locations` VALUES ('1532', '中山区', '108', '3');
INSERT INTO `t_locations` VALUES ('1533', '庄河市', '108', '3');
INSERT INTO `t_locations` VALUES ('1534', '旅顺口区', '108', '3');
INSERT INTO `t_locations` VALUES ('1535', '普兰店市', '108', '3');
INSERT INTO `t_locations` VALUES ('1536', '沙河口区', '108', '3');
INSERT INTO `t_locations` VALUES ('1537', '瓦房店市', '108', '3');
INSERT INTO `t_locations` VALUES ('1538', '甘井子区', '108', '3');
INSERT INTO `t_locations` VALUES ('1539', '西岗区', '108', '3');
INSERT INTO `t_locations` VALUES ('1540', '金州区', '108', '3');
INSERT INTO `t_locations` VALUES ('1541', '长海县', '108', '3');
INSERT INTO `t_locations` VALUES ('1542', '千山区', '109', '3');
INSERT INTO `t_locations` VALUES ('1543', '台安县', '109', '3');
INSERT INTO `t_locations` VALUES ('1544', '岫岩满族自治县', '109', '3');
INSERT INTO `t_locations` VALUES ('1545', '海城市', '109', '3');
INSERT INTO `t_locations` VALUES ('1546', '立山区', '109', '3');
INSERT INTO `t_locations` VALUES ('1547', '铁东区', '109', '3');
INSERT INTO `t_locations` VALUES ('1548', '铁西区', '109', '3');
INSERT INTO `t_locations` VALUES ('1549', '东洲区', '110', '3');
INSERT INTO `t_locations` VALUES ('1550', '抚顺县', '110', '3');
INSERT INTO `t_locations` VALUES ('1551', '新宾满族自治县', '110', '3');
INSERT INTO `t_locations` VALUES ('1552', '新抚区', '110', '3');
INSERT INTO `t_locations` VALUES ('1553', '望花区', '110', '3');
INSERT INTO `t_locations` VALUES ('1554', '清原满族自治县', '110', '3');
INSERT INTO `t_locations` VALUES ('1555', '顺城区', '110', '3');
INSERT INTO `t_locations` VALUES ('1556', '南芬区', '111', '3');
INSERT INTO `t_locations` VALUES ('1557', '平山区', '111', '3');
INSERT INTO `t_locations` VALUES ('1558', '明山区', '111', '3');
INSERT INTO `t_locations` VALUES ('1559', '本溪满族自治县', '111', '3');
INSERT INTO `t_locations` VALUES ('1560', '桓仁满族自治县', '111', '3');
INSERT INTO `t_locations` VALUES ('1561', '溪湖区', '111', '3');
INSERT INTO `t_locations` VALUES ('1562', '东港市', '112', '3');
INSERT INTO `t_locations` VALUES ('1563', '元宝区', '112', '3');
INSERT INTO `t_locations` VALUES ('1564', '凤城市', '112', '3');
INSERT INTO `t_locations` VALUES ('1565', '宽甸满族自治县', '112', '3');
INSERT INTO `t_locations` VALUES ('1566', '振兴区', '112', '3');
INSERT INTO `t_locations` VALUES ('1567', '振安区', '112', '3');
INSERT INTO `t_locations` VALUES ('1568', '义县', '113', '3');
INSERT INTO `t_locations` VALUES ('1569', '凌河区', '113', '3');
INSERT INTO `t_locations` VALUES ('1570', '凌海市', '113', '3');
INSERT INTO `t_locations` VALUES ('1571', '北镇市', '113', '3');
INSERT INTO `t_locations` VALUES ('1572', '古塔区', '113', '3');
INSERT INTO `t_locations` VALUES ('1573', '太和区', '113', '3');
INSERT INTO `t_locations` VALUES ('1574', '黑山县', '113', '3');
INSERT INTO `t_locations` VALUES ('1575', '大石桥市', '114', '3');
INSERT INTO `t_locations` VALUES ('1576', '盖州市', '114', '3');
INSERT INTO `t_locations` VALUES ('1577', '站前区', '114', '3');
INSERT INTO `t_locations` VALUES ('1578', '老边区', '114', '3');
INSERT INTO `t_locations` VALUES ('1579', '西市区', '114', '3');
INSERT INTO `t_locations` VALUES ('1580', '鲅鱼圈区', '114', '3');
INSERT INTO `t_locations` VALUES ('1581', '太平区', '115', '3');
INSERT INTO `t_locations` VALUES ('1582', '彰武县', '115', '3');
INSERT INTO `t_locations` VALUES ('1583', '新邱区', '115', '3');
INSERT INTO `t_locations` VALUES ('1584', '海州区', '115', '3');
INSERT INTO `t_locations` VALUES ('1585', '清河门区', '115', '3');
INSERT INTO `t_locations` VALUES ('1586', '细河区', '115', '3');
INSERT INTO `t_locations` VALUES ('1587', '蒙古族自治县', '115', '3');
INSERT INTO `t_locations` VALUES ('1588', '太子河区', '116', '3');
INSERT INTO `t_locations` VALUES ('1589', '宏伟区', '116', '3');
INSERT INTO `t_locations` VALUES ('1590', '弓长岭区', '116', '3');
INSERT INTO `t_locations` VALUES ('1591', '文圣区', '116', '3');
INSERT INTO `t_locations` VALUES ('1592', '灯塔市', '116', '3');
INSERT INTO `t_locations` VALUES ('1593', '白塔区', '116', '3');
INSERT INTO `t_locations` VALUES ('1594', '辽阳县', '116', '3');
INSERT INTO `t_locations` VALUES ('1595', '兴隆台区', '117', '3');
INSERT INTO `t_locations` VALUES ('1596', '双台子区', '117', '3');
INSERT INTO `t_locations` VALUES ('1597', '大洼县', '117', '3');
INSERT INTO `t_locations` VALUES ('1598', '盘山县', '117', '3');
INSERT INTO `t_locations` VALUES ('1599', '开原市', '118', '3');
INSERT INTO `t_locations` VALUES ('1600', '昌图县', '118', '3');
INSERT INTO `t_locations` VALUES ('1601', '清河区', '118', '3');
INSERT INTO `t_locations` VALUES ('1602', '西丰县', '118', '3');
INSERT INTO `t_locations` VALUES ('1603', '调兵山市', '118', '3');
INSERT INTO `t_locations` VALUES ('1604', '铁岭县', '118', '3');
INSERT INTO `t_locations` VALUES ('1605', '银州区', '118', '3');
INSERT INTO `t_locations` VALUES ('1606', '凌源市', '119', '3');
INSERT INTO `t_locations` VALUES ('1607', '北票市', '119', '3');
INSERT INTO `t_locations` VALUES ('1608', '双塔区', '119', '3');
INSERT INTO `t_locations` VALUES ('1609', '喀喇沁左翼蒙古族自治县', '119', '3');
INSERT INTO `t_locations` VALUES ('1610', '建平县', '119', '3');
INSERT INTO `t_locations` VALUES ('1611', '朝阳县', '119', '3');
INSERT INTO `t_locations` VALUES ('1612', '龙城区', '119', '3');
INSERT INTO `t_locations` VALUES ('1613', '兴城市', '120', '3');
INSERT INTO `t_locations` VALUES ('1614', '南票区', '120', '3');
INSERT INTO `t_locations` VALUES ('1615', '建昌县', '120', '3');
INSERT INTO `t_locations` VALUES ('1616', '绥中县', '120', '3');
INSERT INTO `t_locations` VALUES ('1617', '连山区', '120', '3');
INSERT INTO `t_locations` VALUES ('1618', '龙港区', '120', '3');
INSERT INTO `t_locations` VALUES ('1619', '九台市', '121', '3');
INSERT INTO `t_locations` VALUES ('1620', '二道区', '121', '3');
INSERT INTO `t_locations` VALUES ('1621', '农安县', '121', '3');
INSERT INTO `t_locations` VALUES ('1622', '南关区', '121', '3');
INSERT INTO `t_locations` VALUES ('1623', '双阳区', '121', '3');
INSERT INTO `t_locations` VALUES ('1624', '宽城区', '121', '3');
INSERT INTO `t_locations` VALUES ('1625', '德惠市', '121', '3');
INSERT INTO `t_locations` VALUES ('1626', '朝阳区', '121', '3');
INSERT INTO `t_locations` VALUES ('1627', '榆树市', '121', '3');
INSERT INTO `t_locations` VALUES ('1628', '绿园区', '121', '3');
INSERT INTO `t_locations` VALUES ('1629', '丰满区', '122', '3');
INSERT INTO `t_locations` VALUES ('1630', '昌邑区', '122', '3');
INSERT INTO `t_locations` VALUES ('1631', '桦甸市', '122', '3');
INSERT INTO `t_locations` VALUES ('1632', '永吉县', '122', '3');
INSERT INTO `t_locations` VALUES ('1633', '磐石市', '122', '3');
INSERT INTO `t_locations` VALUES ('1634', '舒兰市', '122', '3');
INSERT INTO `t_locations` VALUES ('1635', '船营区', '122', '3');
INSERT INTO `t_locations` VALUES ('1636', '蛟河市', '122', '3');
INSERT INTO `t_locations` VALUES ('1637', '龙潭区', '122', '3');
INSERT INTO `t_locations` VALUES ('1638', '伊通满族自治县', '123', '3');
INSERT INTO `t_locations` VALUES ('1639', '公主岭市', '123', '3');
INSERT INTO `t_locations` VALUES ('1640', '双辽市', '123', '3');
INSERT INTO `t_locations` VALUES ('1641', '梨树县', '123', '3');
INSERT INTO `t_locations` VALUES ('1642', '铁东区', '123', '3');
INSERT INTO `t_locations` VALUES ('1643', '铁西区', '123', '3');
INSERT INTO `t_locations` VALUES ('1644', '东丰县', '124', '3');
INSERT INTO `t_locations` VALUES ('1645', '东辽县', '124', '3');
INSERT INTO `t_locations` VALUES ('1646', '西安区', '124', '3');
INSERT INTO `t_locations` VALUES ('1647', '龙山区', '124', '3');
INSERT INTO `t_locations` VALUES ('1648', '东昌区', '125', '3');
INSERT INTO `t_locations` VALUES ('1649', '二道江区', '125', '3');
INSERT INTO `t_locations` VALUES ('1650', '柳河县', '125', '3');
INSERT INTO `t_locations` VALUES ('1651', '梅河口市', '125', '3');
INSERT INTO `t_locations` VALUES ('1652', '辉南县', '125', '3');
INSERT INTO `t_locations` VALUES ('1653', '通化县', '125', '3');
INSERT INTO `t_locations` VALUES ('1654', '集安市', '125', '3');
INSERT INTO `t_locations` VALUES ('1655', '临江市', '126', '3');
INSERT INTO `t_locations` VALUES ('1656', '八道江区', '126', '3');
INSERT INTO `t_locations` VALUES ('1657', '抚松县', '126', '3');
INSERT INTO `t_locations` VALUES ('1658', '江源区', '126', '3');
INSERT INTO `t_locations` VALUES ('1659', '长白朝鲜族自治县', '126', '3');
INSERT INTO `t_locations` VALUES ('1660', '靖宇县', '126', '3');
INSERT INTO `t_locations` VALUES ('1661', '干安县', '127', '3');
INSERT INTO `t_locations` VALUES ('1662', '前郭尔罗斯蒙古族自治县', '127', '3');
INSERT INTO `t_locations` VALUES ('1663', '宁江区', '127', '3');
INSERT INTO `t_locations` VALUES ('1664', '扶余县', '127', '3');
INSERT INTO `t_locations` VALUES ('1665', '长岭县', '127', '3');
INSERT INTO `t_locations` VALUES ('1666', '大安市', '128', '3');
INSERT INTO `t_locations` VALUES ('1667', '洮北区', '128', '3');
INSERT INTO `t_locations` VALUES ('1668', '洮南市', '128', '3');
INSERT INTO `t_locations` VALUES ('1669', '通榆县', '128', '3');
INSERT INTO `t_locations` VALUES ('1670', '镇赉县', '128', '3');
INSERT INTO `t_locations` VALUES ('1671', '和龙市', '129', '3');
INSERT INTO `t_locations` VALUES ('1672', '图们市', '129', '3');
INSERT INTO `t_locations` VALUES ('1673', '安图县', '129', '3');
INSERT INTO `t_locations` VALUES ('1674', '延吉市', '129', '3');
INSERT INTO `t_locations` VALUES ('1675', '敦化市', '129', '3');
INSERT INTO `t_locations` VALUES ('1676', '汪清县', '129', '3');
INSERT INTO `t_locations` VALUES ('1677', '珲春市', '129', '3');
INSERT INTO `t_locations` VALUES ('1678', '龙井市', '129', '3');
INSERT INTO `t_locations` VALUES ('1679', '五常市', '130', '3');
INSERT INTO `t_locations` VALUES ('1680', '依兰县', '130', '3');
INSERT INTO `t_locations` VALUES ('1681', '南岗区', '130', '3');
INSERT INTO `t_locations` VALUES ('1682', '双城市', '130', '3');
INSERT INTO `t_locations` VALUES ('1683', '呼兰区', '130', '3');
INSERT INTO `t_locations` VALUES ('1684', '哈尔滨市道里区', '130', '3');
INSERT INTO `t_locations` VALUES ('1685', '宾县', '130', '3');
INSERT INTO `t_locations` VALUES ('1686', '尚志市', '130', '3');
INSERT INTO `t_locations` VALUES ('1687', '巴彦县', '130', '3');
INSERT INTO `t_locations` VALUES ('1688', '平房区', '130', '3');
INSERT INTO `t_locations` VALUES ('1689', '延寿县', '130', '3');
INSERT INTO `t_locations` VALUES ('1690', '方正县', '130', '3');
INSERT INTO `t_locations` VALUES ('1691', '木兰县', '130', '3');
INSERT INTO `t_locations` VALUES ('1692', '松北区', '130', '3');
INSERT INTO `t_locations` VALUES ('1693', '通河县', '130', '3');
INSERT INTO `t_locations` VALUES ('1694', '道外区', '130', '3');
INSERT INTO `t_locations` VALUES ('1695', '阿城区', '130', '3');
INSERT INTO `t_locations` VALUES ('1696', '香坊区', '130', '3');
INSERT INTO `t_locations` VALUES ('1697', '依安县', '131', '3');
INSERT INTO `t_locations` VALUES ('1698', '克东县', '131', '3');
INSERT INTO `t_locations` VALUES ('1699', '克山县', '131', '3');
INSERT INTO `t_locations` VALUES ('1700', '富拉尔基区', '131', '3');
INSERT INTO `t_locations` VALUES ('1701', '富裕县', '131', '3');
INSERT INTO `t_locations` VALUES ('1702', '建华区', '131', '3');
INSERT INTO `t_locations` VALUES ('1703', '拜泉县', '131', '3');
INSERT INTO `t_locations` VALUES ('1704', '昂昂溪区', '131', '3');
INSERT INTO `t_locations` VALUES ('1705', '梅里斯达斡尔族区', '131', '3');
INSERT INTO `t_locations` VALUES ('1706', '泰来县', '131', '3');
INSERT INTO `t_locations` VALUES ('1707', '甘南县', '131', '3');
INSERT INTO `t_locations` VALUES ('1708', '碾子山区', '131', '3');
INSERT INTO `t_locations` VALUES ('1709', '讷河市', '131', '3');
INSERT INTO `t_locations` VALUES ('1710', '铁锋区', '131', '3');
INSERT INTO `t_locations` VALUES ('1711', '龙江县', '131', '3');
INSERT INTO `t_locations` VALUES ('1712', '龙沙区', '131', '3');
INSERT INTO `t_locations` VALUES ('1713', '城子河区', '132', '3');
INSERT INTO `t_locations` VALUES ('1714', '密山市', '132', '3');
INSERT INTO `t_locations` VALUES ('1715', '恒山区', '132', '3');
INSERT INTO `t_locations` VALUES ('1716', '梨树区', '132', '3');
INSERT INTO `t_locations` VALUES ('1717', '滴道区', '132', '3');
INSERT INTO `t_locations` VALUES ('1718', '虎林市', '132', '3');
INSERT INTO `t_locations` VALUES ('1719', '鸡东县', '132', '3');
INSERT INTO `t_locations` VALUES ('1720', '鸡冠区', '132', '3');
INSERT INTO `t_locations` VALUES ('1721', '麻山区', '132', '3');
INSERT INTO `t_locations` VALUES ('1722', '东山区', '133', '3');
INSERT INTO `t_locations` VALUES ('1723', '兴安区', '133', '3');
INSERT INTO `t_locations` VALUES ('1724', '兴山区', '133', '3');
INSERT INTO `t_locations` VALUES ('1725', '南山区', '133', '3');
INSERT INTO `t_locations` VALUES ('1726', '向阳区', '133', '3');
INSERT INTO `t_locations` VALUES ('1727', '工农区', '133', '3');
INSERT INTO `t_locations` VALUES ('1728', '绥滨县', '133', '3');
INSERT INTO `t_locations` VALUES ('1729', '萝北县', '133', '3');
INSERT INTO `t_locations` VALUES ('1730', '友谊县', '134', '3');
INSERT INTO `t_locations` VALUES ('1731', '四方台区', '134', '3');
INSERT INTO `t_locations` VALUES ('1732', '宝山区', '134', '3');
INSERT INTO `t_locations` VALUES ('1733', '宝清县', '134', '3');
INSERT INTO `t_locations` VALUES ('1734', '尖山区', '134', '3');
INSERT INTO `t_locations` VALUES ('1735', '岭东区', '134', '3');
INSERT INTO `t_locations` VALUES ('1736', '集贤县', '134', '3');
INSERT INTO `t_locations` VALUES ('1737', '饶河县', '134', '3');
INSERT INTO `t_locations` VALUES ('1738', '大同区', '135', '3');
INSERT INTO `t_locations` VALUES ('1739', '杜尔伯特蒙古族自治县', '135', '3');
INSERT INTO `t_locations` VALUES ('1740', '林甸县', '135', '3');
INSERT INTO `t_locations` VALUES ('1741', '红岗区', '135', '3');
INSERT INTO `t_locations` VALUES ('1742', '肇州县', '135', '3');
INSERT INTO `t_locations` VALUES ('1743', '肇源县', '135', '3');
INSERT INTO `t_locations` VALUES ('1744', '胡路区', '135', '3');
INSERT INTO `t_locations` VALUES ('1745', '萨尔图区', '135', '3');
INSERT INTO `t_locations` VALUES ('1746', '龙凤区', '135', '3');
INSERT INTO `t_locations` VALUES ('1747', '上甘岭区', '136', '3');
INSERT INTO `t_locations` VALUES ('1748', '乌伊岭区', '136', '3');
INSERT INTO `t_locations` VALUES ('1749', '乌马河区', '136', '3');
INSERT INTO `t_locations` VALUES ('1750', '五营区', '136', '3');
INSERT INTO `t_locations` VALUES ('1751', '伊春区', '136', '3');
INSERT INTO `t_locations` VALUES ('1752', '南岔区', '136', '3');
INSERT INTO `t_locations` VALUES ('1753', '友好区', '136', '3');
INSERT INTO `t_locations` VALUES ('1754', '嘉荫县', '136', '3');
INSERT INTO `t_locations` VALUES ('1755', '带岭区', '136', '3');
INSERT INTO `t_locations` VALUES ('1756', '新青区', '136', '3');
INSERT INTO `t_locations` VALUES ('1757', '汤旺河区', '136', '3');
INSERT INTO `t_locations` VALUES ('1758', '红星区', '136', '3');
INSERT INTO `t_locations` VALUES ('1759', '美溪区', '136', '3');
INSERT INTO `t_locations` VALUES ('1760', '翠峦区', '136', '3');
INSERT INTO `t_locations` VALUES ('1761', '西林区', '136', '3');
INSERT INTO `t_locations` VALUES ('1762', '金山屯区', '136', '3');
INSERT INTO `t_locations` VALUES ('1763', '铁力市', '136', '3');
INSERT INTO `t_locations` VALUES ('1764', '东风区', '137', '3');
INSERT INTO `t_locations` VALUES ('1765', '前进区', '137', '3');
INSERT INTO `t_locations` VALUES ('1766', '同江市', '137', '3');
INSERT INTO `t_locations` VALUES ('1767', '向阳区', '137', '3');
INSERT INTO `t_locations` VALUES ('1768', '富锦市', '137', '3');
INSERT INTO `t_locations` VALUES ('1769', '抚远县', '137', '3');
INSERT INTO `t_locations` VALUES ('1770', '桦南县', '137', '3');
INSERT INTO `t_locations` VALUES ('1771', '桦川县', '137', '3');
INSERT INTO `t_locations` VALUES ('1772', '汤原县', '137', '3');
INSERT INTO `t_locations` VALUES ('1773', '郊区', '137', '3');
INSERT INTO `t_locations` VALUES ('1774', '勃利县', '138', '3');
INSERT INTO `t_locations` VALUES ('1775', '新兴区', '138', '3');
INSERT INTO `t_locations` VALUES ('1776', '桃山区', '138', '3');
INSERT INTO `t_locations` VALUES ('1777', '茄子河区', '138', '3');
INSERT INTO `t_locations` VALUES ('1778', '东宁县', '139', '3');
INSERT INTO `t_locations` VALUES ('1779', '东安区', '139', '3');
INSERT INTO `t_locations` VALUES ('1780', '宁安市', '139', '3');
INSERT INTO `t_locations` VALUES ('1781', '林口县', '139', '3');
INSERT INTO `t_locations` VALUES ('1782', '海林市', '139', '3');
INSERT INTO `t_locations` VALUES ('1783', '爱民区', '139', '3');
INSERT INTO `t_locations` VALUES ('1784', '穆棱市', '139', '3');
INSERT INTO `t_locations` VALUES ('1785', '绥芬河市', '139', '3');
INSERT INTO `t_locations` VALUES ('1786', '西安区', '139', '3');
INSERT INTO `t_locations` VALUES ('1787', '阳明区', '139', '3');
INSERT INTO `t_locations` VALUES ('1788', '五大连池市', '140', '3');
INSERT INTO `t_locations` VALUES ('1789', '北安市', '140', '3');
INSERT INTO `t_locations` VALUES ('1790', '嫩江县', '140', '3');
INSERT INTO `t_locations` VALUES ('1791', '孙吴县', '140', '3');
INSERT INTO `t_locations` VALUES ('1792', '爱辉区', '140', '3');
INSERT INTO `t_locations` VALUES ('1793', '车逊克县', '140', '3');
INSERT INTO `t_locations` VALUES ('1794', '逊克县', '140', '3');
INSERT INTO `t_locations` VALUES ('1795', '兰西县', '141', '3');
INSERT INTO `t_locations` VALUES ('1796', '安达市', '141', '3');
INSERT INTO `t_locations` VALUES ('1797', '庆安县', '141', '3');
INSERT INTO `t_locations` VALUES ('1798', '明水县', '141', '3');
INSERT INTO `t_locations` VALUES ('1799', '望奎县', '141', '3');
INSERT INTO `t_locations` VALUES ('1800', '海伦市', '141', '3');
INSERT INTO `t_locations` VALUES ('1801', '绥化市北林区', '141', '3');
INSERT INTO `t_locations` VALUES ('1802', '绥棱县', '141', '3');
INSERT INTO `t_locations` VALUES ('1803', '肇东市', '141', '3');
INSERT INTO `t_locations` VALUES ('1804', '青冈县', '141', '3');
INSERT INTO `t_locations` VALUES ('1805', '呼玛县', '142', '3');
INSERT INTO `t_locations` VALUES ('1806', '塔河县', '142', '3');
INSERT INTO `t_locations` VALUES ('1807', '大兴安岭地区加格达奇区', '142', '3');
INSERT INTO `t_locations` VALUES ('1808', '大兴安岭地区呼中区', '142', '3');
INSERT INTO `t_locations` VALUES ('1809', '大兴安岭地区新林区', '142', '3');
INSERT INTO `t_locations` VALUES ('1810', '大兴安岭地区松岭区', '142', '3');
INSERT INTO `t_locations` VALUES ('1811', '漠河县', '142', '3');
INSERT INTO `t_locations` VALUES ('1812', '半淞园路街道', '143', '3');
INSERT INTO `t_locations` VALUES ('1813', '南京东路街道', '143', '3');
INSERT INTO `t_locations` VALUES ('1814', '外滩街道', '143', '3');
INSERT INTO `t_locations` VALUES ('1815', '小东门街道', '143', '3');
INSERT INTO `t_locations` VALUES ('1816', '老西门街道', '143', '3');
INSERT INTO `t_locations` VALUES ('1817', '豫园街道', '143', '3');
INSERT INTO `t_locations` VALUES ('1818', '五里桥街道', '144', '3');
INSERT INTO `t_locations` VALUES ('1819', '打浦桥街道', '144', '3');
INSERT INTO `t_locations` VALUES ('1820', '淮海中路街道', '144', '3');
INSERT INTO `t_locations` VALUES ('1821', '瑞金二路街道', '144', '3');
INSERT INTO `t_locations` VALUES ('1822', '凌云路街道', '145', '3');
INSERT INTO `t_locations` VALUES ('1823', '华泾镇', '145', '3');
INSERT INTO `t_locations` VALUES ('1824', '天平路街道', '145', '3');
INSERT INTO `t_locations` VALUES ('1825', '康健新村街道', '145', '3');
INSERT INTO `t_locations` VALUES ('1826', '徐家汇街道', '145', '3');
INSERT INTO `t_locations` VALUES ('1827', '斜土路街道', '145', '3');
INSERT INTO `t_locations` VALUES ('1828', '枫林路街道', '145', '3');
INSERT INTO `t_locations` VALUES ('1829', '湖南路街道', '145', '3');
INSERT INTO `t_locations` VALUES ('1830', '漕河泾街道', '145', '3');
INSERT INTO `t_locations` VALUES ('1831', '田林街道', '145', '3');
INSERT INTO `t_locations` VALUES ('1832', '虹梅路街道', '145', '3');
INSERT INTO `t_locations` VALUES ('1833', '长桥街道', '145', '3');
INSERT INTO `t_locations` VALUES ('1834', '龙华街道', '145', '3');
INSERT INTO `t_locations` VALUES ('1835', '仙霞新村街道', '146', '3');
INSERT INTO `t_locations` VALUES ('1836', '北新泾街道', '146', '3');
INSERT INTO `t_locations` VALUES ('1837', '华阳路街道', '146', '3');
INSERT INTO `t_locations` VALUES ('1838', '周家桥街道', '146', '3');
INSERT INTO `t_locations` VALUES ('1839', '天山路街道', '146', '3');
INSERT INTO `t_locations` VALUES ('1840', '新华路街道', '146', '3');
INSERT INTO `t_locations` VALUES ('1841', '新泾镇', '146', '3');
INSERT INTO `t_locations` VALUES ('1842', '江苏路街道', '146', '3');
INSERT INTO `t_locations` VALUES ('1843', '程家桥街道', '146', '3');
INSERT INTO `t_locations` VALUES ('1844', '虹桥街道', '146', '3');
INSERT INTO `t_locations` VALUES ('1845', '南京西路街道', '147', '3');
INSERT INTO `t_locations` VALUES ('1846', '曹家渡街道', '147', '3');
INSERT INTO `t_locations` VALUES ('1847', '江宁路街道', '147', '3');
INSERT INTO `t_locations` VALUES ('1848', '石门二路街道', '147', '3');
INSERT INTO `t_locations` VALUES ('1849', '静安寺街道', '147', '3');
INSERT INTO `t_locations` VALUES ('1850', '宜川路街道', '148', '3');
INSERT INTO `t_locations` VALUES ('1851', '曹杨新村街道', '148', '3');
INSERT INTO `t_locations` VALUES ('1852', '桃浦镇', '148', '3');
INSERT INTO `t_locations` VALUES ('1853', '甘泉路街道', '148', '3');
INSERT INTO `t_locations` VALUES ('1854', '真如镇', '148', '3');
INSERT INTO `t_locations` VALUES ('1855', '石泉路街道', '148', '3');
INSERT INTO `t_locations` VALUES ('1856', '长寿路街道', '148', '3');
INSERT INTO `t_locations` VALUES ('1857', '长征镇', '148', '3');
INSERT INTO `t_locations` VALUES ('1858', '长风新村街道', '148', '3');
INSERT INTO `t_locations` VALUES ('1859', '临汾路街道', '149', '3');
INSERT INTO `t_locations` VALUES ('1860', '共和新路街道', '149', '3');
INSERT INTO `t_locations` VALUES ('1861', '北站街道', '149', '3');
INSERT INTO `t_locations` VALUES ('1862', '大宁路街道', '149', '3');
INSERT INTO `t_locations` VALUES ('1863', '天目西路街道', '149', '3');
INSERT INTO `t_locations` VALUES ('1864', '宝山路街道', '149', '3');
INSERT INTO `t_locations` VALUES ('1865', '彭浦新村街道', '149', '3');
INSERT INTO `t_locations` VALUES ('1866', '彭浦镇', '149', '3');
INSERT INTO `t_locations` VALUES ('1867', '芷江西路街道', '149', '3');
INSERT INTO `t_locations` VALUES ('1868', '乍浦路街道', '150', '3');
INSERT INTO `t_locations` VALUES ('1869', '凉城新村街道', '150', '3');
INSERT INTO `t_locations` VALUES ('1870', '嘉兴路街道', '150', '3');
INSERT INTO `t_locations` VALUES ('1871', '四川北路街道', '150', '3');
INSERT INTO `t_locations` VALUES ('1872', '广中路街道', '150', '3');
INSERT INTO `t_locations` VALUES ('1873', '提篮桥街道', '150', '3');
INSERT INTO `t_locations` VALUES ('1874', '新港路街道', '150', '3');
INSERT INTO `t_locations` VALUES ('1875', '曲阳路街道', '150', '3');
INSERT INTO `t_locations` VALUES ('1876', '欧阳路街道', '150', '3');
INSERT INTO `t_locations` VALUES ('1877', '江湾镇街道', '150', '3');
INSERT INTO `t_locations` VALUES ('1878', '五角场街道', '151', '3');
INSERT INTO `t_locations` VALUES ('1879', '五角场镇', '151', '3');
INSERT INTO `t_locations` VALUES ('1880', '四平路街道', '151', '3');
INSERT INTO `t_locations` VALUES ('1881', '大桥街道', '151', '3');
INSERT INTO `t_locations` VALUES ('1882', '定海路街道', '151', '3');
INSERT INTO `t_locations` VALUES ('1883', '平凉路街道', '151', '3');
INSERT INTO `t_locations` VALUES ('1884', '延吉新村街道', '151', '3');
INSERT INTO `t_locations` VALUES ('1885', '控江路街道', '151', '3');
INSERT INTO `t_locations` VALUES ('1886', '新江湾城街道', '151', '3');
INSERT INTO `t_locations` VALUES ('1887', '殷行街道', '151', '3');
INSERT INTO `t_locations` VALUES ('1888', '江浦路街道', '151', '3');
INSERT INTO `t_locations` VALUES ('1889', '长白新村街道', '151', '3');
INSERT INTO `t_locations` VALUES ('1890', '七宝镇', '152', '3');
INSERT INTO `t_locations` VALUES ('1891', '华漕镇', '152', '3');
INSERT INTO `t_locations` VALUES ('1892', '古美街道', '152', '3');
INSERT INTO `t_locations` VALUES ('1893', '吴泾镇', '152', '3');
INSERT INTO `t_locations` VALUES ('1894', '梅陇镇', '152', '3');
INSERT INTO `t_locations` VALUES ('1895', '江川路街道', '152', '3');
INSERT INTO `t_locations` VALUES ('1896', '浦江镇', '152', '3');
INSERT INTO `t_locations` VALUES ('1897', '莘庄镇', '152', '3');
INSERT INTO `t_locations` VALUES ('1898', '虹桥镇', '152', '3');
INSERT INTO `t_locations` VALUES ('1899', '颛桥镇', '152', '3');
INSERT INTO `t_locations` VALUES ('1900', '马桥镇', '152', '3');
INSERT INTO `t_locations` VALUES ('1901', '龙柏街道', '152', '3');
INSERT INTO `t_locations` VALUES ('1902', '友谊路街道', '153', '3');
INSERT INTO `t_locations` VALUES ('1903', '吴淞街道', '153', '3');
INSERT INTO `t_locations` VALUES ('1904', '大场镇', '153', '3');
INSERT INTO `t_locations` VALUES ('1905', '庙行镇', '153', '3');
INSERT INTO `t_locations` VALUES ('1906', '张庙街道', '153', '3');
INSERT INTO `t_locations` VALUES ('1907', '月浦镇', '153', '3');
INSERT INTO `t_locations` VALUES ('1908', '杨行镇', '153', '3');
INSERT INTO `t_locations` VALUES ('1909', '淞南镇', '153', '3');
INSERT INTO `t_locations` VALUES ('1910', '罗店镇', '153', '3');
INSERT INTO `t_locations` VALUES ('1911', '罗泾镇', '153', '3');
INSERT INTO `t_locations` VALUES ('1912', '顾村镇', '153', '3');
INSERT INTO `t_locations` VALUES ('1913', '高境镇', '153', '3');
INSERT INTO `t_locations` VALUES ('1914', '华亭镇', '154', '3');
INSERT INTO `t_locations` VALUES ('1915', '南翔镇', '154', '3');
INSERT INTO `t_locations` VALUES ('1916', '嘉定工业区', '154', '3');
INSERT INTO `t_locations` VALUES ('1917', '嘉定镇街道', '154', '3');
INSERT INTO `t_locations` VALUES ('1918', '外冈镇', '154', '3');
INSERT INTO `t_locations` VALUES ('1919', '安亭镇', '154', '3');
INSERT INTO `t_locations` VALUES ('1920', '徐行镇', '154', '3');
INSERT INTO `t_locations` VALUES ('1921', '新成路街道', '154', '3');
INSERT INTO `t_locations` VALUES ('1922', '江桥镇', '154', '3');
INSERT INTO `t_locations` VALUES ('1923', '真新新村街道', '154', '3');
INSERT INTO `t_locations` VALUES ('1924', '菊园新区', '154', '3');
INSERT INTO `t_locations` VALUES ('1925', '马陆镇', '154', '3');
INSERT INTO `t_locations` VALUES ('1926', '黄渡镇', '154', '3');
INSERT INTO `t_locations` VALUES ('1927', '三林镇', '155', '3');
INSERT INTO `t_locations` VALUES ('1928', '上钢新村街道', '155', '3');
INSERT INTO `t_locations` VALUES ('1929', '东明路街道', '155', '3');
INSERT INTO `t_locations` VALUES ('1930', '北蔡镇', '155', '3');
INSERT INTO `t_locations` VALUES ('1931', '南码头路街道', '155', '3');
INSERT INTO `t_locations` VALUES ('1932', '合庆镇', '155', '3');
INSERT INTO `t_locations` VALUES ('1933', '周家渡街道', '155', '3');
INSERT INTO `t_locations` VALUES ('1934', '唐镇', '155', '3');
INSERT INTO `t_locations` VALUES ('1935', '塘桥街道', '155', '3');
INSERT INTO `t_locations` VALUES ('1936', '川沙新镇', '155', '3');
INSERT INTO `t_locations` VALUES ('1937', '张江镇', '155', '3');
INSERT INTO `t_locations` VALUES ('1938', '曹路镇', '155', '3');
INSERT INTO `t_locations` VALUES ('1939', '沪东新村街道', '155', '3');
INSERT INTO `t_locations` VALUES ('1940', '洋泾街道', '155', '3');
INSERT INTO `t_locations` VALUES ('1941', '浦兴路街道', '155', '3');
INSERT INTO `t_locations` VALUES ('1942', '潍坊新村街道', '155', '3');
INSERT INTO `t_locations` VALUES ('1943', '花木街道', '155', '3');
INSERT INTO `t_locations` VALUES ('1944', '金杨新村街道', '155', '3');
INSERT INTO `t_locations` VALUES ('1945', '金桥镇', '155', '3');
INSERT INTO `t_locations` VALUES ('1946', '陆家嘴街道', '155', '3');
INSERT INTO `t_locations` VALUES ('1947', '高东镇', '155', '3');
INSERT INTO `t_locations` VALUES ('1948', '高桥镇', '155', '3');
INSERT INTO `t_locations` VALUES ('1949', '高行镇', '155', '3');
INSERT INTO `t_locations` VALUES ('1950', '亭林镇', '156', '3');
INSERT INTO `t_locations` VALUES ('1951', '吕巷镇', '156', '3');
INSERT INTO `t_locations` VALUES ('1952', '山阳镇', '156', '3');
INSERT INTO `t_locations` VALUES ('1953', '廊下镇', '156', '3');
INSERT INTO `t_locations` VALUES ('1954', '张堰镇', '156', '3');
INSERT INTO `t_locations` VALUES ('1955', '朱泾镇', '156', '3');
INSERT INTO `t_locations` VALUES ('1956', '枫泾镇', '156', '3');
INSERT INTO `t_locations` VALUES ('1957', '漕泾镇', '156', '3');
INSERT INTO `t_locations` VALUES ('1958', '石化街道', '156', '3');
INSERT INTO `t_locations` VALUES ('1959', '金山卫镇', '156', '3');
INSERT INTO `t_locations` VALUES ('1960', '上海松江科技园区', '157', '3');
INSERT INTO `t_locations` VALUES ('1961', '中山街道', '157', '3');
INSERT INTO `t_locations` VALUES ('1962', '九亭镇', '157', '3');
INSERT INTO `t_locations` VALUES ('1963', '五厍农业园区', '157', '3');
INSERT INTO `t_locations` VALUES ('1964', '佘山度假区', '157', '3');
INSERT INTO `t_locations` VALUES ('1965', '佘山镇', '157', '3');
INSERT INTO `t_locations` VALUES ('1966', '叶榭镇', '157', '3');
INSERT INTO `t_locations` VALUES ('1967', '岳阳街道', '157', '3');
INSERT INTO `t_locations` VALUES ('1968', '新桥镇', '157', '3');
INSERT INTO `t_locations` VALUES ('1969', '新浜镇', '157', '3');
INSERT INTO `t_locations` VALUES ('1970', '方松街道', '157', '3');
INSERT INTO `t_locations` VALUES ('1971', '松江工业区', '157', '3');
INSERT INTO `t_locations` VALUES ('1972', '永丰街道', '157', '3');
INSERT INTO `t_locations` VALUES ('1973', '泖港镇', '157', '3');
INSERT INTO `t_locations` VALUES ('1974', '泗泾镇', '157', '3');
INSERT INTO `t_locations` VALUES ('1975', '洞泾镇', '157', '3');
INSERT INTO `t_locations` VALUES ('1976', '石湖荡镇', '157', '3');
INSERT INTO `t_locations` VALUES ('1977', '车墩镇', '157', '3');
INSERT INTO `t_locations` VALUES ('1978', '华新镇', '158', '3');
INSERT INTO `t_locations` VALUES ('1979', '夏阳街道', '158', '3');
INSERT INTO `t_locations` VALUES ('1980', '徐泾镇', '158', '3');
INSERT INTO `t_locations` VALUES ('1981', '朱家角镇', '158', '3');
INSERT INTO `t_locations` VALUES ('1982', '白鹤镇', '158', '3');
INSERT INTO `t_locations` VALUES ('1983', '盈浦街道', '158', '3');
INSERT INTO `t_locations` VALUES ('1984', '练塘镇', '158', '3');
INSERT INTO `t_locations` VALUES ('1985', '赵巷镇', '158', '3');
INSERT INTO `t_locations` VALUES ('1986', '重固镇', '158', '3');
INSERT INTO `t_locations` VALUES ('1987', '金泽镇', '158', '3');
INSERT INTO `t_locations` VALUES ('1988', '香花桥街道', '158', '3');
INSERT INTO `t_locations` VALUES ('1989', '万祥镇', '159', '3');
INSERT INTO `t_locations` VALUES ('1990', '书院镇', '159', '3');
INSERT INTO `t_locations` VALUES ('1991', '六灶镇', '159', '3');
INSERT INTO `t_locations` VALUES ('1992', '周浦镇', '159', '3');
INSERT INTO `t_locations` VALUES ('1993', '大团镇', '159', '3');
INSERT INTO `t_locations` VALUES ('1994', '宣桥镇', '159', '3');
INSERT INTO `t_locations` VALUES ('1995', '康桥镇', '159', '3');
INSERT INTO `t_locations` VALUES ('1996', '惠南镇', '159', '3');
INSERT INTO `t_locations` VALUES ('1997', '新场镇', '159', '3');
INSERT INTO `t_locations` VALUES ('1998', '泥城镇', '159', '3');
INSERT INTO `t_locations` VALUES ('1999', '祝桥镇', '159', '3');
INSERT INTO `t_locations` VALUES ('2000', '老港镇', '159', '3');
INSERT INTO `t_locations` VALUES ('2001', '航头镇', '159', '3');
INSERT INTO `t_locations` VALUES ('2002', '芦潮港镇', '159', '3');
INSERT INTO `t_locations` VALUES ('2003', '南桥镇', '160', '3');
INSERT INTO `t_locations` VALUES ('2004', '四团镇', '160', '3');
INSERT INTO `t_locations` VALUES ('2005', '奉城镇', '160', '3');
INSERT INTO `t_locations` VALUES ('2006', '庄行镇', '160', '3');
INSERT INTO `t_locations` VALUES ('2007', '柘林镇', '160', '3');
INSERT INTO `t_locations` VALUES ('2008', '海湾镇', '160', '3');
INSERT INTO `t_locations` VALUES ('2009', '金汇镇', '160', '3');
INSERT INTO `t_locations` VALUES ('2010', '青村镇', '160', '3');
INSERT INTO `t_locations` VALUES ('2011', '三星镇', '161', '3');
INSERT INTO `t_locations` VALUES ('2012', '中兴镇', '161', '3');
INSERT INTO `t_locations` VALUES ('2013', '向化镇', '161', '3');
INSERT INTO `t_locations` VALUES ('2014', '城桥镇', '161', '3');
INSERT INTO `t_locations` VALUES ('2015', '堡镇', '161', '3');
INSERT INTO `t_locations` VALUES ('2016', '庙镇', '161', '3');
INSERT INTO `t_locations` VALUES ('2017', '建设镇', '161', '3');
INSERT INTO `t_locations` VALUES ('2018', '新村乡', '161', '3');
INSERT INTO `t_locations` VALUES ('2019', '新河镇', '161', '3');
INSERT INTO `t_locations` VALUES ('2020', '横沙乡', '161', '3');
INSERT INTO `t_locations` VALUES ('2021', '港沿镇', '161', '3');
INSERT INTO `t_locations` VALUES ('2022', '港西镇', '161', '3');
INSERT INTO `t_locations` VALUES ('2023', '竖新镇', '161', '3');
INSERT INTO `t_locations` VALUES ('2024', '绿华镇', '161', '3');
INSERT INTO `t_locations` VALUES ('2025', '长兴乡', '161', '3');
INSERT INTO `t_locations` VALUES ('2026', '陈家镇', '161', '3');
INSERT INTO `t_locations` VALUES ('2027', '下关区', '162', '3');
INSERT INTO `t_locations` VALUES ('2028', '六合区', '162', '3');
INSERT INTO `t_locations` VALUES ('2029', '建邺区', '162', '3');
INSERT INTO `t_locations` VALUES ('2030', '栖霞区', '162', '3');
INSERT INTO `t_locations` VALUES ('2031', '江宁区', '162', '3');
INSERT INTO `t_locations` VALUES ('2032', '浦口区', '162', '3');
INSERT INTO `t_locations` VALUES ('2033', '溧水县', '162', '3');
INSERT INTO `t_locations` VALUES ('2034', '玄武区', '162', '3');
INSERT INTO `t_locations` VALUES ('2035', '白下区', '162', '3');
INSERT INTO `t_locations` VALUES ('2036', '秦淮区', '162', '3');
INSERT INTO `t_locations` VALUES ('2037', '雨花台区', '162', '3');
INSERT INTO `t_locations` VALUES ('2038', '高淳县', '162', '3');
INSERT INTO `t_locations` VALUES ('2039', '鼓楼区', '162', '3');
INSERT INTO `t_locations` VALUES ('2040', '北塘区', '163', '3');
INSERT INTO `t_locations` VALUES ('2041', '南长区', '163', '3');
INSERT INTO `t_locations` VALUES ('2042', '宜兴市', '163', '3');
INSERT INTO `t_locations` VALUES ('2043', '崇安区', '163', '3');
INSERT INTO `t_locations` VALUES ('2044', '惠山区', '163', '3');
INSERT INTO `t_locations` VALUES ('2045', '江阴市', '163', '3');
INSERT INTO `t_locations` VALUES ('2046', '滨湖区', '163', '3');
INSERT INTO `t_locations` VALUES ('2047', '锡山区', '163', '3');
INSERT INTO `t_locations` VALUES ('2048', '丰县', '164', '3');
INSERT INTO `t_locations` VALUES ('2049', '九里区', '164', '3');
INSERT INTO `t_locations` VALUES ('2050', '云龙区', '164', '3');
INSERT INTO `t_locations` VALUES ('2051', '新沂市', '164', '3');
INSERT INTO `t_locations` VALUES ('2052', '沛县', '164', '3');
INSERT INTO `t_locations` VALUES ('2053', '泉山区', '164', '3');
INSERT INTO `t_locations` VALUES ('2054', '睢宁县', '164', '3');
INSERT INTO `t_locations` VALUES ('2055', '贾汪区', '164', '3');
INSERT INTO `t_locations` VALUES ('2056', '邳州市', '164', '3');
INSERT INTO `t_locations` VALUES ('2057', '铜山县', '164', '3');
INSERT INTO `t_locations` VALUES ('2058', '鼓楼区', '164', '3');
INSERT INTO `t_locations` VALUES ('2059', '天宁区', '165', '3');
INSERT INTO `t_locations` VALUES ('2060', '戚墅堰区', '165', '3');
INSERT INTO `t_locations` VALUES ('2061', '新北区', '165', '3');
INSERT INTO `t_locations` VALUES ('2062', '武进区', '165', '3');
INSERT INTO `t_locations` VALUES ('2063', '溧阳市', '165', '3');
INSERT INTO `t_locations` VALUES ('2064', '金坛市', '165', '3');
INSERT INTO `t_locations` VALUES ('2065', '钟楼区', '165', '3');
INSERT INTO `t_locations` VALUES ('2066', '吴中区', '166', '3');
INSERT INTO `t_locations` VALUES ('2067', '吴江市', '166', '3');
INSERT INTO `t_locations` VALUES ('2068', '太仓市', '166', '3');
INSERT INTO `t_locations` VALUES ('2069', '常熟市', '166', '3');
INSERT INTO `t_locations` VALUES ('2070', '平江区', '166', '3');
INSERT INTO `t_locations` VALUES ('2071', '张家港市', '166', '3');
INSERT INTO `t_locations` VALUES ('2072', '昆山市', '166', '3');
INSERT INTO `t_locations` VALUES ('2073', '沧浪区', '166', '3');
INSERT INTO `t_locations` VALUES ('2074', '相城区', '166', '3');
INSERT INTO `t_locations` VALUES ('2075', '苏州工业园区', '166', '3');
INSERT INTO `t_locations` VALUES ('2076', '虎丘区', '166', '3');
INSERT INTO `t_locations` VALUES ('2077', '金阊区', '166', '3');
INSERT INTO `t_locations` VALUES ('2078', '启东市', '167', '3');
INSERT INTO `t_locations` VALUES ('2079', '如东县', '167', '3');
INSERT INTO `t_locations` VALUES ('2080', '如皋市', '167', '3');
INSERT INTO `t_locations` VALUES ('2081', '崇川区', '167', '3');
INSERT INTO `t_locations` VALUES ('2082', '海安县', '167', '3');
INSERT INTO `t_locations` VALUES ('2083', '海门市', '167', '3');
INSERT INTO `t_locations` VALUES ('2084', '港闸区', '167', '3');
INSERT INTO `t_locations` VALUES ('2085', '通州市', '167', '3');
INSERT INTO `t_locations` VALUES ('2086', '东海县', '168', '3');
INSERT INTO `t_locations` VALUES ('2087', '新浦区', '168', '3');
INSERT INTO `t_locations` VALUES ('2088', '海州区', '168', '3');
INSERT INTO `t_locations` VALUES ('2089', '灌云县', '168', '3');
INSERT INTO `t_locations` VALUES ('2090', '灌南县', '168', '3');
INSERT INTO `t_locations` VALUES ('2091', '赣榆县', '168', '3');
INSERT INTO `t_locations` VALUES ('2092', '连云区', '168', '3');
INSERT INTO `t_locations` VALUES ('2093', '楚州区', '169', '3');
INSERT INTO `t_locations` VALUES ('2094', '洪泽县', '169', '3');
INSERT INTO `t_locations` VALUES ('2095', '涟水县', '169', '3');
INSERT INTO `t_locations` VALUES ('2096', '淮阴区', '169', '3');
INSERT INTO `t_locations` VALUES ('2097', '清河区', '169', '3');
INSERT INTO `t_locations` VALUES ('2098', '清浦区', '169', '3');
INSERT INTO `t_locations` VALUES ('2099', '盱眙县', '169', '3');
INSERT INTO `t_locations` VALUES ('2100', '金湖县', '169', '3');
INSERT INTO `t_locations` VALUES ('2101', '东台市', '170', '3');
INSERT INTO `t_locations` VALUES ('2102', '亭湖区', '170', '3');
INSERT INTO `t_locations` VALUES ('2103', '响水县', '170', '3');
INSERT INTO `t_locations` VALUES ('2104', '大丰市', '170', '3');
INSERT INTO `t_locations` VALUES ('2105', '射阳县', '170', '3');
INSERT INTO `t_locations` VALUES ('2106', '建湖县', '170', '3');
INSERT INTO `t_locations` VALUES ('2107', '滨海县', '170', '3');
INSERT INTO `t_locations` VALUES ('2108', '盐都区', '170', '3');
INSERT INTO `t_locations` VALUES ('2109', '阜宁县', '170', '3');
INSERT INTO `t_locations` VALUES ('2110', '仪征市', '171', '3');
INSERT INTO `t_locations` VALUES ('2111', '宝应县', '171', '3');
INSERT INTO `t_locations` VALUES ('2112', '广陵区', '171', '3');
INSERT INTO `t_locations` VALUES ('2113', '江都市', '171', '3');
INSERT INTO `t_locations` VALUES ('2114', '维扬区', '171', '3');
INSERT INTO `t_locations` VALUES ('2115', '邗江区', '171', '3');
INSERT INTO `t_locations` VALUES ('2116', '高邮市', '171', '3');
INSERT INTO `t_locations` VALUES ('2117', '丹徒区', '172', '3');
INSERT INTO `t_locations` VALUES ('2118', '丹阳市', '172', '3');
INSERT INTO `t_locations` VALUES ('2119', '京口区', '172', '3');
INSERT INTO `t_locations` VALUES ('2120', '句容市', '172', '3');
INSERT INTO `t_locations` VALUES ('2121', '扬中市', '172', '3');
INSERT INTO `t_locations` VALUES ('2122', '润州区', '172', '3');
INSERT INTO `t_locations` VALUES ('2123', '兴化市', '173', '3');
INSERT INTO `t_locations` VALUES ('2124', '姜堰市', '173', '3');
INSERT INTO `t_locations` VALUES ('2125', '泰兴市', '173', '3');
INSERT INTO `t_locations` VALUES ('2126', '海陵区', '173', '3');
INSERT INTO `t_locations` VALUES ('2127', '靖江市', '173', '3');
INSERT INTO `t_locations` VALUES ('2128', '高港区', '173', '3');
INSERT INTO `t_locations` VALUES ('2129', '宿城区', '174', '3');
INSERT INTO `t_locations` VALUES ('2130', '宿豫区', '174', '3');
INSERT INTO `t_locations` VALUES ('2131', '沭阳县', '174', '3');
INSERT INTO `t_locations` VALUES ('2132', '泗洪县', '174', '3');
INSERT INTO `t_locations` VALUES ('2133', '泗阳县', '174', '3');
INSERT INTO `t_locations` VALUES ('2134', '上城区', '175', '3');
INSERT INTO `t_locations` VALUES ('2135', '下城区', '175', '3');
INSERT INTO `t_locations` VALUES ('2136', '临安市', '175', '3');
INSERT INTO `t_locations` VALUES ('2137', '余杭区', '175', '3');
INSERT INTO `t_locations` VALUES ('2138', '富阳市', '175', '3');
INSERT INTO `t_locations` VALUES ('2139', '建德市', '175', '3');
INSERT INTO `t_locations` VALUES ('2140', '拱墅区', '175', '3');
INSERT INTO `t_locations` VALUES ('2141', '桐庐县', '175', '3');
INSERT INTO `t_locations` VALUES ('2142', '江干区', '175', '3');
INSERT INTO `t_locations` VALUES ('2143', '淳安县', '175', '3');
INSERT INTO `t_locations` VALUES ('2144', '滨江区', '175', '3');
INSERT INTO `t_locations` VALUES ('2145', '萧山区', '175', '3');
INSERT INTO `t_locations` VALUES ('2146', '西湖区', '175', '3');
INSERT INTO `t_locations` VALUES ('2147', '余姚市', '176', '3');
INSERT INTO `t_locations` VALUES ('2148', '北仑区', '176', '3');
INSERT INTO `t_locations` VALUES ('2149', '奉化市', '176', '3');
INSERT INTO `t_locations` VALUES ('2150', '宁海县', '176', '3');
INSERT INTO `t_locations` VALUES ('2151', '慈溪市', '176', '3');
INSERT INTO `t_locations` VALUES ('2152', '江东区', '176', '3');
INSERT INTO `t_locations` VALUES ('2153', '江北区', '176', '3');
INSERT INTO `t_locations` VALUES ('2154', '海曙区', '176', '3');
INSERT INTO `t_locations` VALUES ('2155', '象山县', '176', '3');
INSERT INTO `t_locations` VALUES ('2156', '鄞州区', '176', '3');
INSERT INTO `t_locations` VALUES ('2157', '镇海区', '176', '3');
INSERT INTO `t_locations` VALUES ('2158', '乐清市', '177', '3');
INSERT INTO `t_locations` VALUES ('2159', '平阳县', '177', '3');
INSERT INTO `t_locations` VALUES ('2160', '文成县', '177', '3');
INSERT INTO `t_locations` VALUES ('2161', '永嘉县', '177', '3');
INSERT INTO `t_locations` VALUES ('2162', '泰顺县', '177', '3');
INSERT INTO `t_locations` VALUES ('2163', '洞头县', '177', '3');
INSERT INTO `t_locations` VALUES ('2164', '瑞安市', '177', '3');
INSERT INTO `t_locations` VALUES ('2165', '瓯海区', '177', '3');
INSERT INTO `t_locations` VALUES ('2166', '苍南县', '177', '3');
INSERT INTO `t_locations` VALUES ('2167', '鹿城区', '177', '3');
INSERT INTO `t_locations` VALUES ('2168', '龙湾区', '177', '3');
INSERT INTO `t_locations` VALUES ('2169', '南湖区', '178', '3');
INSERT INTO `t_locations` VALUES ('2170', '嘉善县', '178', '3');
INSERT INTO `t_locations` VALUES ('2171', '平湖市', '178', '3');
INSERT INTO `t_locations` VALUES ('2172', '桐乡市', '178', '3');
INSERT INTO `t_locations` VALUES ('2173', '海宁市', '178', '3');
INSERT INTO `t_locations` VALUES ('2174', '海盐县', '178', '3');
INSERT INTO `t_locations` VALUES ('2175', '秀洲区', '178', '3');
INSERT INTO `t_locations` VALUES ('2176', '南浔区', '179', '3');
INSERT INTO `t_locations` VALUES ('2177', '吴兴区', '179', '3');
INSERT INTO `t_locations` VALUES ('2178', '安吉县', '179', '3');
INSERT INTO `t_locations` VALUES ('2179', '德清县', '179', '3');
INSERT INTO `t_locations` VALUES ('2180', '长兴县', '179', '3');
INSERT INTO `t_locations` VALUES ('2181', '上虞市', '180', '3');
INSERT INTO `t_locations` VALUES ('2182', '嵊州市', '180', '3');
INSERT INTO `t_locations` VALUES ('2183', '新昌县', '180', '3');
INSERT INTO `t_locations` VALUES ('2184', '绍兴县', '180', '3');
INSERT INTO `t_locations` VALUES ('2185', '诸暨市', '180', '3');
INSERT INTO `t_locations` VALUES ('2186', '越城区', '180', '3');
INSERT INTO `t_locations` VALUES ('2187', '定海区', '181', '3');
INSERT INTO `t_locations` VALUES ('2188', '岱山县', '181', '3');
INSERT INTO `t_locations` VALUES ('2189', '嵊泗县', '181', '3');
INSERT INTO `t_locations` VALUES ('2190', '普陀区', '181', '3');
INSERT INTO `t_locations` VALUES ('2191', '常山县', '182', '3');
INSERT INTO `t_locations` VALUES ('2192', '开化县', '182', '3');
INSERT INTO `t_locations` VALUES ('2193', '柯城区', '182', '3');
INSERT INTO `t_locations` VALUES ('2194', '江山市', '182', '3');
INSERT INTO `t_locations` VALUES ('2195', '衢江区', '182', '3');
INSERT INTO `t_locations` VALUES ('2196', '龙游县', '182', '3');
INSERT INTO `t_locations` VALUES ('2197', '东阳市', '183', '3');
INSERT INTO `t_locations` VALUES ('2198', '义乌市', '183', '3');
INSERT INTO `t_locations` VALUES ('2199', '兰溪市', '183', '3');
INSERT INTO `t_locations` VALUES ('2200', '婺城区', '183', '3');
INSERT INTO `t_locations` VALUES ('2201', '武义县', '183', '3');
INSERT INTO `t_locations` VALUES ('2202', '永康市', '183', '3');
INSERT INTO `t_locations` VALUES ('2203', '浦江县', '183', '3');
INSERT INTO `t_locations` VALUES ('2204', '磐安县', '183', '3');
INSERT INTO `t_locations` VALUES ('2205', '金东区', '183', '3');
INSERT INTO `t_locations` VALUES ('2206', '三门县', '184', '3');
INSERT INTO `t_locations` VALUES ('2207', '临海市', '184', '3');
INSERT INTO `t_locations` VALUES ('2208', '仙居县', '184', '3');
INSERT INTO `t_locations` VALUES ('2209', '天台县', '184', '3');
INSERT INTO `t_locations` VALUES ('2210', '椒江区', '184', '3');
INSERT INTO `t_locations` VALUES ('2211', '温岭市', '184', '3');
INSERT INTO `t_locations` VALUES ('2212', '玉环县', '184', '3');
INSERT INTO `t_locations` VALUES ('2213', '路桥区', '184', '3');
INSERT INTO `t_locations` VALUES ('2214', '黄岩区', '184', '3');
INSERT INTO `t_locations` VALUES ('2215', '云和县', '185', '3');
INSERT INTO `t_locations` VALUES ('2216', '庆元县', '185', '3');
INSERT INTO `t_locations` VALUES ('2217', '景宁畲族自治县', '185', '3');
INSERT INTO `t_locations` VALUES ('2218', '松阳县', '185', '3');
INSERT INTO `t_locations` VALUES ('2219', '缙云县', '185', '3');
INSERT INTO `t_locations` VALUES ('2220', '莲都区', '185', '3');
INSERT INTO `t_locations` VALUES ('2221', '遂昌县', '185', '3');
INSERT INTO `t_locations` VALUES ('2222', '青田县', '185', '3');
INSERT INTO `t_locations` VALUES ('2223', '龙泉市', '185', '3');
INSERT INTO `t_locations` VALUES ('2224', '包河区', '186', '3');
INSERT INTO `t_locations` VALUES ('2225', '庐阳区', '186', '3');
INSERT INTO `t_locations` VALUES ('2226', '瑶海区', '186', '3');
INSERT INTO `t_locations` VALUES ('2227', '肥东县', '186', '3');
INSERT INTO `t_locations` VALUES ('2228', '肥西县', '186', '3');
INSERT INTO `t_locations` VALUES ('2229', '蜀山区', '186', '3');
INSERT INTO `t_locations` VALUES ('2230', '长丰县', '186', '3');
INSERT INTO `t_locations` VALUES ('2231', '三山区', '187', '3');
INSERT INTO `t_locations` VALUES ('2232', '南陵县', '187', '3');
INSERT INTO `t_locations` VALUES ('2233', '弋江区', '187', '3');
INSERT INTO `t_locations` VALUES ('2234', '繁昌县', '187', '3');
INSERT INTO `t_locations` VALUES ('2235', '芜湖县', '187', '3');
INSERT INTO `t_locations` VALUES ('2236', '镜湖区', '187', '3');
INSERT INTO `t_locations` VALUES ('2237', '鸠江区', '187', '3');
INSERT INTO `t_locations` VALUES ('2238', '五河县', '188', '3');
INSERT INTO `t_locations` VALUES ('2239', '固镇县', '188', '3');
INSERT INTO `t_locations` VALUES ('2240', '怀远县', '188', '3');
INSERT INTO `t_locations` VALUES ('2241', '淮上区', '188', '3');
INSERT INTO `t_locations` VALUES ('2242', '禹会区', '188', '3');
INSERT INTO `t_locations` VALUES ('2243', '蚌山区', '188', '3');
INSERT INTO `t_locations` VALUES ('2244', '龙子湖区', '188', '3');
INSERT INTO `t_locations` VALUES ('2245', '八公山区', '189', '3');
INSERT INTO `t_locations` VALUES ('2246', '凤台县', '189', '3');
INSERT INTO `t_locations` VALUES ('2247', '大通区', '189', '3');
INSERT INTO `t_locations` VALUES ('2248', '潘集区', '189', '3');
INSERT INTO `t_locations` VALUES ('2249', '田家庵区', '189', '3');
INSERT INTO `t_locations` VALUES ('2250', '谢家集区', '189', '3');
INSERT INTO `t_locations` VALUES ('2251', '当涂县', '190', '3');
INSERT INTO `t_locations` VALUES ('2252', '花山区', '190', '3');
INSERT INTO `t_locations` VALUES ('2253', '金家庄区', '190', '3');
INSERT INTO `t_locations` VALUES ('2254', '雨山区', '190', '3');
INSERT INTO `t_locations` VALUES ('2255', '杜集区', '191', '3');
INSERT INTO `t_locations` VALUES ('2256', '濉溪县', '191', '3');
INSERT INTO `t_locations` VALUES ('2257', '烈山区', '191', '3');
INSERT INTO `t_locations` VALUES ('2258', '相山区', '191', '3');
INSERT INTO `t_locations` VALUES ('2259', '狮子山区', '192', '3');
INSERT INTO `t_locations` VALUES ('2260', '郊区', '192', '3');
INSERT INTO `t_locations` VALUES ('2261', '铜官山区', '192', '3');
INSERT INTO `t_locations` VALUES ('2262', '铜陵县', '192', '3');
INSERT INTO `t_locations` VALUES ('2263', '大观区', '193', '3');
INSERT INTO `t_locations` VALUES ('2264', '太湖县', '193', '3');
INSERT INTO `t_locations` VALUES ('2265', '宜秀区', '193', '3');
INSERT INTO `t_locations` VALUES ('2266', '宿松县', '193', '3');
INSERT INTO `t_locations` VALUES ('2267', '岳西县', '193', '3');
INSERT INTO `t_locations` VALUES ('2268', '怀宁县', '193', '3');
INSERT INTO `t_locations` VALUES ('2269', '望江县', '193', '3');
INSERT INTO `t_locations` VALUES ('2270', '枞阳县', '193', '3');
INSERT INTO `t_locations` VALUES ('2271', '桐城市', '193', '3');
INSERT INTO `t_locations` VALUES ('2272', '潜山县', '193', '3');
INSERT INTO `t_locations` VALUES ('2273', '迎江区', '193', '3');
INSERT INTO `t_locations` VALUES ('2274', '休宁县', '194', '3');
INSERT INTO `t_locations` VALUES ('2275', '屯溪区', '194', '3');
INSERT INTO `t_locations` VALUES ('2276', '徽州区', '194', '3');
INSERT INTO `t_locations` VALUES ('2277', '歙县', '194', '3');
INSERT INTO `t_locations` VALUES ('2278', '祁门县', '194', '3');
INSERT INTO `t_locations` VALUES ('2279', '黄山区', '194', '3');
INSERT INTO `t_locations` VALUES ('2280', '黟县', '194', '3');
INSERT INTO `t_locations` VALUES ('2281', '全椒县', '195', '3');
INSERT INTO `t_locations` VALUES ('2282', '凤阳县', '195', '3');
INSERT INTO `t_locations` VALUES ('2283', '南谯区', '195', '3');
INSERT INTO `t_locations` VALUES ('2284', '天长市', '195', '3');
INSERT INTO `t_locations` VALUES ('2285', '定远县', '195', '3');
INSERT INTO `t_locations` VALUES ('2286', '明光市', '195', '3');
INSERT INTO `t_locations` VALUES ('2287', '来安县', '195', '3');
INSERT INTO `t_locations` VALUES ('2288', '琅玡区', '195', '3');
INSERT INTO `t_locations` VALUES ('2289', '临泉县', '196', '3');
INSERT INTO `t_locations` VALUES ('2290', '太和县', '196', '3');
INSERT INTO `t_locations` VALUES ('2291', '界首市', '196', '3');
INSERT INTO `t_locations` VALUES ('2292', '阜南县', '196', '3');
INSERT INTO `t_locations` VALUES ('2293', '颍东区', '196', '3');
INSERT INTO `t_locations` VALUES ('2294', '颍州区', '196', '3');
INSERT INTO `t_locations` VALUES ('2295', '颍泉区', '196', '3');
INSERT INTO `t_locations` VALUES ('2296', '颖上县', '196', '3');
INSERT INTO `t_locations` VALUES ('2297', '埇桥区', '197', '3');
INSERT INTO `t_locations` VALUES ('2298', '泗县辖', '197', '3');
INSERT INTO `t_locations` VALUES ('2299', '灵璧县', '197', '3');
INSERT INTO `t_locations` VALUES ('2300', '砀山县', '197', '3');
INSERT INTO `t_locations` VALUES ('2301', '萧县', '197', '3');
INSERT INTO `t_locations` VALUES ('2302', '含山县', '198', '3');
INSERT INTO `t_locations` VALUES ('2303', '和县', '198', '3');
INSERT INTO `t_locations` VALUES ('2304', '居巢区', '198', '3');
INSERT INTO `t_locations` VALUES ('2305', '庐江县', '198', '3');
INSERT INTO `t_locations` VALUES ('2306', '无为县', '198', '3');
INSERT INTO `t_locations` VALUES ('2307', '寿县', '199', '3');
INSERT INTO `t_locations` VALUES ('2308', '舒城县', '199', '3');
INSERT INTO `t_locations` VALUES ('2309', '裕安区', '199', '3');
INSERT INTO `t_locations` VALUES ('2310', '金安区', '199', '3');
INSERT INTO `t_locations` VALUES ('2311', '金寨县', '199', '3');
INSERT INTO `t_locations` VALUES ('2312', '霍山县', '199', '3');
INSERT INTO `t_locations` VALUES ('2313', '霍邱县', '199', '3');
INSERT INTO `t_locations` VALUES ('2314', '利辛县', '200', '3');
INSERT INTO `t_locations` VALUES ('2315', '涡阳县', '200', '3');
INSERT INTO `t_locations` VALUES ('2316', '蒙城县', '200', '3');
INSERT INTO `t_locations` VALUES ('2317', '谯城区', '200', '3');
INSERT INTO `t_locations` VALUES ('2318', '东至县', '201', '3');
INSERT INTO `t_locations` VALUES ('2319', '石台县', '201', '3');
INSERT INTO `t_locations` VALUES ('2320', '贵池区', '201', '3');
INSERT INTO `t_locations` VALUES ('2321', '青阳县', '201', '3');
INSERT INTO `t_locations` VALUES ('2322', '宁国市', '202', '3');
INSERT INTO `t_locations` VALUES ('2323', '宣州区', '202', '3');
INSERT INTO `t_locations` VALUES ('2324', '广德县', '202', '3');
INSERT INTO `t_locations` VALUES ('2325', '旌德县', '202', '3');
INSERT INTO `t_locations` VALUES ('2326', '泾县', '202', '3');
INSERT INTO `t_locations` VALUES ('2327', '绩溪县', '202', '3');
INSERT INTO `t_locations` VALUES ('2328', '郎溪县', '202', '3');
INSERT INTO `t_locations` VALUES ('2329', '仓山区', '203', '3');
INSERT INTO `t_locations` VALUES ('2330', '台江区', '203', '3');
INSERT INTO `t_locations` VALUES ('2331', '平潭县', '203', '3');
INSERT INTO `t_locations` VALUES ('2332', '晋安区', '203', '3');
INSERT INTO `t_locations` VALUES ('2333', '永泰县', '203', '3');
INSERT INTO `t_locations` VALUES ('2334', '福清市', '203', '3');
INSERT INTO `t_locations` VALUES ('2335', '罗源县', '203', '3');
INSERT INTO `t_locations` VALUES ('2336', '连江县', '203', '3');
INSERT INTO `t_locations` VALUES ('2337', '长乐市', '203', '3');
INSERT INTO `t_locations` VALUES ('2338', '闽侯县', '203', '3');
INSERT INTO `t_locations` VALUES ('2339', '闽清县', '203', '3');
INSERT INTO `t_locations` VALUES ('2340', '马尾区', '203', '3');
INSERT INTO `t_locations` VALUES ('2341', '鼓楼区', '203', '3');
INSERT INTO `t_locations` VALUES ('2342', '同安区', '204', '3');
INSERT INTO `t_locations` VALUES ('2343', '思明区', '204', '3');
INSERT INTO `t_locations` VALUES ('2344', '海沧区', '204', '3');
INSERT INTO `t_locations` VALUES ('2345', '湖里区', '204', '3');
INSERT INTO `t_locations` VALUES ('2346', '翔安区', '204', '3');
INSERT INTO `t_locations` VALUES ('2347', '集美区', '204', '3');
INSERT INTO `t_locations` VALUES ('2348', '仙游县', '205', '3');
INSERT INTO `t_locations` VALUES ('2349', '城厢区', '205', '3');
INSERT INTO `t_locations` VALUES ('2350', '涵江区', '205', '3');
INSERT INTO `t_locations` VALUES ('2351', '秀屿区', '205', '3');
INSERT INTO `t_locations` VALUES ('2352', '荔城区', '205', '3');
INSERT INTO `t_locations` VALUES ('2353', '三元区', '206', '3');
INSERT INTO `t_locations` VALUES ('2354', '大田县', '206', '3');
INSERT INTO `t_locations` VALUES ('2355', '宁化县', '206', '3');
INSERT INTO `t_locations` VALUES ('2356', '将乐县', '206', '3');
INSERT INTO `t_locations` VALUES ('2357', '尤溪县', '206', '3');
INSERT INTO `t_locations` VALUES ('2358', '建宁县', '206', '3');
INSERT INTO `t_locations` VALUES ('2359', '明溪县', '206', '3');
INSERT INTO `t_locations` VALUES ('2360', '梅列区', '206', '3');
INSERT INTO `t_locations` VALUES ('2361', '永安市', '206', '3');
INSERT INTO `t_locations` VALUES ('2362', '沙县', '206', '3');
INSERT INTO `t_locations` VALUES ('2363', '泰宁县', '206', '3');
INSERT INTO `t_locations` VALUES ('2364', '清流县', '206', '3');
INSERT INTO `t_locations` VALUES ('2365', '丰泽区', '207', '3');
INSERT INTO `t_locations` VALUES ('2366', '南安市', '207', '3');
INSERT INTO `t_locations` VALUES ('2367', '安溪县', '207', '3');
INSERT INTO `t_locations` VALUES ('2368', '德化县', '207', '3');
INSERT INTO `t_locations` VALUES ('2369', '惠安县', '207', '3');
INSERT INTO `t_locations` VALUES ('2370', '晋江市', '207', '3');
INSERT INTO `t_locations` VALUES ('2371', '永春县', '207', '3');
INSERT INTO `t_locations` VALUES ('2372', '泉港区', '207', '3');
INSERT INTO `t_locations` VALUES ('2373', '洛江区', '207', '3');
INSERT INTO `t_locations` VALUES ('2374', '石狮市', '207', '3');
INSERT INTO `t_locations` VALUES ('2375', '金门县', '207', '3');
INSERT INTO `t_locations` VALUES ('2376', '鲤城区', '207', '3');
INSERT INTO `t_locations` VALUES ('2377', '东山县', '208', '3');
INSERT INTO `t_locations` VALUES ('2378', '云霄县', '208', '3');
INSERT INTO `t_locations` VALUES ('2379', '华安县', '208', '3');
INSERT INTO `t_locations` VALUES ('2380', '南靖县', '208', '3');
INSERT INTO `t_locations` VALUES ('2381', '平和县', '208', '3');
INSERT INTO `t_locations` VALUES ('2382', '漳浦县', '208', '3');
INSERT INTO `t_locations` VALUES ('2383', '芗城区', '208', '3');
INSERT INTO `t_locations` VALUES ('2384', '诏安县', '208', '3');
INSERT INTO `t_locations` VALUES ('2385', '长泰县', '208', '3');
INSERT INTO `t_locations` VALUES ('2386', '龙文区', '208', '3');
INSERT INTO `t_locations` VALUES ('2387', '龙海市', '208', '3');
INSERT INTO `t_locations` VALUES ('2388', '光泽县', '209', '3');
INSERT INTO `t_locations` VALUES ('2389', '延平区', '209', '3');
INSERT INTO `t_locations` VALUES ('2390', '建瓯市', '209', '3');
INSERT INTO `t_locations` VALUES ('2391', '建阳市', '209', '3');
INSERT INTO `t_locations` VALUES ('2392', '政和县', '209', '3');
INSERT INTO `t_locations` VALUES ('2393', '松溪县', '209', '3');
INSERT INTO `t_locations` VALUES ('2394', '武夷山市', '209', '3');
INSERT INTO `t_locations` VALUES ('2395', '浦城县', '209', '3');
INSERT INTO `t_locations` VALUES ('2396', '邵武市', '209', '3');
INSERT INTO `t_locations` VALUES ('2397', '顺昌县', '209', '3');
INSERT INTO `t_locations` VALUES ('2398', '上杭县', '210', '3');
INSERT INTO `t_locations` VALUES ('2399', '新罗区', '210', '3');
INSERT INTO `t_locations` VALUES ('2400', '武平县', '210', '3');
INSERT INTO `t_locations` VALUES ('2401', '永定县', '210', '3');
INSERT INTO `t_locations` VALUES ('2402', '漳平市', '210', '3');
INSERT INTO `t_locations` VALUES ('2403', '连城县', '210', '3');
INSERT INTO `t_locations` VALUES ('2404', '长汀县', '210', '3');
INSERT INTO `t_locations` VALUES ('2405', '古田县', '211', '3');
INSERT INTO `t_locations` VALUES ('2406', '周宁县', '211', '3');
INSERT INTO `t_locations` VALUES ('2407', '寿宁县', '211', '3');
INSERT INTO `t_locations` VALUES ('2408', '屏南县', '211', '3');
INSERT INTO `t_locations` VALUES ('2409', '柘荣县', '211', '3');
INSERT INTO `t_locations` VALUES ('2410', '福安市', '211', '3');
INSERT INTO `t_locations` VALUES ('2411', '福鼎市', '211', '3');
INSERT INTO `t_locations` VALUES ('2412', '蕉城区', '211', '3');
INSERT INTO `t_locations` VALUES ('2413', '霞浦县', '211', '3');
INSERT INTO `t_locations` VALUES ('2414', '东湖区', '212', '3');
INSERT INTO `t_locations` VALUES ('2415', '南昌县', '212', '3');
INSERT INTO `t_locations` VALUES ('2416', '安义县', '212', '3');
INSERT INTO `t_locations` VALUES ('2417', '新建县', '212', '3');
INSERT INTO `t_locations` VALUES ('2418', '湾里区', '212', '3');
INSERT INTO `t_locations` VALUES ('2419', '西湖区', '212', '3');
INSERT INTO `t_locations` VALUES ('2420', '进贤县', '212', '3');
INSERT INTO `t_locations` VALUES ('2421', '青云谱区', '212', '3');
INSERT INTO `t_locations` VALUES ('2422', '青山湖区', '212', '3');
INSERT INTO `t_locations` VALUES ('2423', '乐平市', '213', '3');
INSERT INTO `t_locations` VALUES ('2424', '昌江区', '213', '3');
INSERT INTO `t_locations` VALUES ('2425', '浮梁县', '213', '3');
INSERT INTO `t_locations` VALUES ('2426', '珠山区', '213', '3');
INSERT INTO `t_locations` VALUES ('2427', '上栗县', '214', '3');
INSERT INTO `t_locations` VALUES ('2428', '安源区', '214', '3');
INSERT INTO `t_locations` VALUES ('2429', '湘东区', '214', '3');
INSERT INTO `t_locations` VALUES ('2430', '芦溪县', '214', '3');
INSERT INTO `t_locations` VALUES ('2431', '莲花县', '214', '3');
INSERT INTO `t_locations` VALUES ('2432', '九江县', '215', '3');
INSERT INTO `t_locations` VALUES ('2433', '修水县', '215', '3');
INSERT INTO `t_locations` VALUES ('2434', '庐山区', '215', '3');
INSERT INTO `t_locations` VALUES ('2435', '彭泽县', '215', '3');
INSERT INTO `t_locations` VALUES ('2436', '德安县', '215', '3');
INSERT INTO `t_locations` VALUES ('2437', '星子县', '215', '3');
INSERT INTO `t_locations` VALUES ('2438', '武宁县', '215', '3');
INSERT INTO `t_locations` VALUES ('2439', '永修县', '215', '3');
INSERT INTO `t_locations` VALUES ('2440', '浔阳区', '215', '3');
INSERT INTO `t_locations` VALUES ('2441', '湖口县', '215', '3');
INSERT INTO `t_locations` VALUES ('2442', '瑞昌市', '215', '3');
INSERT INTO `t_locations` VALUES ('2443', '都昌县', '215', '3');
INSERT INTO `t_locations` VALUES ('2444', '分宜县', '216', '3');
INSERT INTO `t_locations` VALUES ('2445', '渝水区', '216', '3');
INSERT INTO `t_locations` VALUES ('2446', '余江县', '217', '3');
INSERT INTO `t_locations` VALUES ('2447', '月湖区', '217', '3');
INSERT INTO `t_locations` VALUES ('2448', '贵溪市', '217', '3');
INSERT INTO `t_locations` VALUES ('2449', '上犹县', '218', '3');
INSERT INTO `t_locations` VALUES ('2450', '于都县', '218', '3');
INSERT INTO `t_locations` VALUES ('2451', '会昌县', '218', '3');
INSERT INTO `t_locations` VALUES ('2452', '信丰县', '218', '3');
INSERT INTO `t_locations` VALUES ('2453', '全南县', '218', '3');
INSERT INTO `t_locations` VALUES ('2454', '兴国县', '218', '3');
INSERT INTO `t_locations` VALUES ('2455', '南康市', '218', '3');
INSERT INTO `t_locations` VALUES ('2456', '大余县', '218', '3');
INSERT INTO `t_locations` VALUES ('2457', '宁都县', '218', '3');
INSERT INTO `t_locations` VALUES ('2458', '安远县', '218', '3');
INSERT INTO `t_locations` VALUES ('2459', '定南县', '218', '3');
INSERT INTO `t_locations` VALUES ('2460', '寻乌县', '218', '3');
INSERT INTO `t_locations` VALUES ('2461', '崇义县', '218', '3');
INSERT INTO `t_locations` VALUES ('2462', '瑞金市', '218', '3');
INSERT INTO `t_locations` VALUES ('2463', '石城县', '218', '3');
INSERT INTO `t_locations` VALUES ('2464', '章贡区', '218', '3');
INSERT INTO `t_locations` VALUES ('2465', '赣县', '218', '3');
INSERT INTO `t_locations` VALUES ('2466', '龙南县', '218', '3');
INSERT INTO `t_locations` VALUES ('2467', '万安县', '219', '3');
INSERT INTO `t_locations` VALUES ('2468', '井冈山市', '219', '3');
INSERT INTO `t_locations` VALUES ('2469', '吉安县', '219', '3');
INSERT INTO `t_locations` VALUES ('2470', '吉州区', '219', '3');
INSERT INTO `t_locations` VALUES ('2471', '吉水县', '219', '3');
INSERT INTO `t_locations` VALUES ('2472', '安福县', '219', '3');
INSERT INTO `t_locations` VALUES ('2473', '峡江县', '219', '3');
INSERT INTO `t_locations` VALUES ('2474', '新干县', '219', '3');
INSERT INTO `t_locations` VALUES ('2475', '永丰县', '219', '3');
INSERT INTO `t_locations` VALUES ('2476', '永新县', '219', '3');
INSERT INTO `t_locations` VALUES ('2477', '泰和县', '219', '3');
INSERT INTO `t_locations` VALUES ('2478', '遂川县', '219', '3');
INSERT INTO `t_locations` VALUES ('2479', '青原区', '219', '3');
INSERT INTO `t_locations` VALUES ('2480', '万载县', '220', '3');
INSERT INTO `t_locations` VALUES ('2481', '上高县', '220', '3');
INSERT INTO `t_locations` VALUES ('2482', '丰城市', '220', '3');
INSERT INTO `t_locations` VALUES ('2483', '奉新县', '220', '3');
INSERT INTO `t_locations` VALUES ('2484', '宜丰县', '220', '3');
INSERT INTO `t_locations` VALUES ('2485', '樟树市', '220', '3');
INSERT INTO `t_locations` VALUES ('2486', '袁州区', '220', '3');
INSERT INTO `t_locations` VALUES ('2487', '铜鼓县', '220', '3');
INSERT INTO `t_locations` VALUES ('2488', '靖安县', '220', '3');
INSERT INTO `t_locations` VALUES ('2489', '高安市', '220', '3');
INSERT INTO `t_locations` VALUES ('2490', '东乡县', '221', '3');
INSERT INTO `t_locations` VALUES ('2491', '临川区', '221', '3');
INSERT INTO `t_locations` VALUES ('2492', '乐安县', '221', '3');
INSERT INTO `t_locations` VALUES ('2493', '南丰县', '221', '3');
INSERT INTO `t_locations` VALUES ('2494', '南城县', '221', '3');
INSERT INTO `t_locations` VALUES ('2495', '宜黄县', '221', '3');
INSERT INTO `t_locations` VALUES ('2496', '崇仁县', '221', '3');
INSERT INTO `t_locations` VALUES ('2497', '广昌县', '221', '3');
INSERT INTO `t_locations` VALUES ('2498', '资溪县', '221', '3');
INSERT INTO `t_locations` VALUES ('2499', '金溪县', '221', '3');
INSERT INTO `t_locations` VALUES ('2500', '黎川县', '221', '3');
INSERT INTO `t_locations` VALUES ('2501', '万年县', '222', '3');
INSERT INTO `t_locations` VALUES ('2502', '上饶县', '222', '3');
INSERT INTO `t_locations` VALUES ('2503', '余干县', '222', '3');
INSERT INTO `t_locations` VALUES ('2504', '信州区', '222', '3');
INSERT INTO `t_locations` VALUES ('2505', '婺源县', '222', '3');
INSERT INTO `t_locations` VALUES ('2506', '广丰县', '222', '3');
INSERT INTO `t_locations` VALUES ('2507', '弋阳县', '222', '3');
INSERT INTO `t_locations` VALUES ('2508', '德兴市', '222', '3');
INSERT INTO `t_locations` VALUES ('2509', '横峰县', '222', '3');
INSERT INTO `t_locations` VALUES ('2510', '玉山县', '222', '3');
INSERT INTO `t_locations` VALUES ('2511', '鄱阳县', '222', '3');
INSERT INTO `t_locations` VALUES ('2512', '铅山县', '222', '3');
INSERT INTO `t_locations` VALUES ('2513', '历下区', '223', '3');
INSERT INTO `t_locations` VALUES ('2514', '历城区', '223', '3');
INSERT INTO `t_locations` VALUES ('2515', '商河县', '223', '3');
INSERT INTO `t_locations` VALUES ('2516', '天桥区', '223', '3');
INSERT INTO `t_locations` VALUES ('2517', '市中区', '223', '3');
INSERT INTO `t_locations` VALUES ('2518', '平阴县', '223', '3');
INSERT INTO `t_locations` VALUES ('2519', '槐荫区', '223', '3');
INSERT INTO `t_locations` VALUES ('2520', '济阳县', '223', '3');
INSERT INTO `t_locations` VALUES ('2521', '章丘市', '223', '3');
INSERT INTO `t_locations` VALUES ('2522', '长清区', '223', '3');
INSERT INTO `t_locations` VALUES ('2523', '即墨市', '224', '3');
INSERT INTO `t_locations` VALUES ('2524', '四方区', '224', '3');
INSERT INTO `t_locations` VALUES ('2525', '城阳区', '224', '3');
INSERT INTO `t_locations` VALUES ('2526', '崂山区', '224', '3');
INSERT INTO `t_locations` VALUES ('2527', '市北区', '224', '3');
INSERT INTO `t_locations` VALUES ('2528', '市南区', '224', '3');
INSERT INTO `t_locations` VALUES ('2529', '平度市', '224', '3');
INSERT INTO `t_locations` VALUES ('2530', '李沧区', '224', '3');
INSERT INTO `t_locations` VALUES ('2531', '胶南市', '224', '3');
INSERT INTO `t_locations` VALUES ('2532', '胶州市', '224', '3');
INSERT INTO `t_locations` VALUES ('2533', '莱西市', '224', '3');
INSERT INTO `t_locations` VALUES ('2534', '黄岛区', '224', '3');
INSERT INTO `t_locations` VALUES ('2535', '临淄区', '225', '3');
INSERT INTO `t_locations` VALUES ('2536', '博山区', '225', '3');
INSERT INTO `t_locations` VALUES ('2537', '周村区', '225', '3');
INSERT INTO `t_locations` VALUES ('2538', '张店区', '225', '3');
INSERT INTO `t_locations` VALUES ('2539', '桓台县', '225', '3');
INSERT INTO `t_locations` VALUES ('2540', '沂源县', '225', '3');
INSERT INTO `t_locations` VALUES ('2541', '淄川区', '225', '3');
INSERT INTO `t_locations` VALUES ('2542', '高青县', '225', '3');
INSERT INTO `t_locations` VALUES ('2543', '台儿庄区', '226', '3');
INSERT INTO `t_locations` VALUES ('2544', '山亭区', '226', '3');
INSERT INTO `t_locations` VALUES ('2545', '峄城区', '226', '3');
INSERT INTO `t_locations` VALUES ('2546', '市中区', '226', '3');
INSERT INTO `t_locations` VALUES ('2547', '滕州市', '226', '3');
INSERT INTO `t_locations` VALUES ('2548', '薛城区', '226', '3');
INSERT INTO `t_locations` VALUES ('2549', '东营区', '227', '3');
INSERT INTO `t_locations` VALUES ('2550', '利津县', '227', '3');
INSERT INTO `t_locations` VALUES ('2551', '垦利县', '227', '3');
INSERT INTO `t_locations` VALUES ('2552', '广饶县', '227', '3');
INSERT INTO `t_locations` VALUES ('2553', '河口区', '227', '3');
INSERT INTO `t_locations` VALUES ('2554', '招远市', '228', '3');
INSERT INTO `t_locations` VALUES ('2555', '栖霞市', '228', '3');
INSERT INTO `t_locations` VALUES ('2556', '海阳市', '228', '3');
INSERT INTO `t_locations` VALUES ('2557', '牟平区', '228', '3');
INSERT INTO `t_locations` VALUES ('2558', '福山区', '228', '3');
INSERT INTO `t_locations` VALUES ('2559', '芝罘区', '228', '3');
INSERT INTO `t_locations` VALUES ('2560', '莱山区', '228', '3');
INSERT INTO `t_locations` VALUES ('2561', '莱州市', '228', '3');
INSERT INTO `t_locations` VALUES ('2562', '莱阳市', '228', '3');
INSERT INTO `t_locations` VALUES ('2563', '蓬莱市', '228', '3');
INSERT INTO `t_locations` VALUES ('2564', '长岛县', '228', '3');
INSERT INTO `t_locations` VALUES ('2565', '龙口市', '228', '3');
INSERT INTO `t_locations` VALUES ('2566', '临朐县', '229', '3');
INSERT INTO `t_locations` VALUES ('2567', '坊子区', '229', '3');
INSERT INTO `t_locations` VALUES ('2568', '奎文区', '229', '3');
INSERT INTO `t_locations` VALUES ('2569', '安丘市', '229', '3');
INSERT INTO `t_locations` VALUES ('2570', '寒亭区', '229', '3');
INSERT INTO `t_locations` VALUES ('2571', '寿光市', '229', '3');
INSERT INTO `t_locations` VALUES ('2572', '昌乐县', '229', '3');
INSERT INTO `t_locations` VALUES ('2573', '昌邑市', '229', '3');
INSERT INTO `t_locations` VALUES ('2574', '潍城区', '229', '3');
INSERT INTO `t_locations` VALUES ('2575', '诸城市', '229', '3');
INSERT INTO `t_locations` VALUES ('2576', '青州市', '229', '3');
INSERT INTO `t_locations` VALUES ('2577', '高密市', '229', '3');
INSERT INTO `t_locations` VALUES ('2578', '任城区', '230', '3');
INSERT INTO `t_locations` VALUES ('2579', '兖州市', '230', '3');
INSERT INTO `t_locations` VALUES ('2580', '嘉祥县', '230', '3');
INSERT INTO `t_locations` VALUES ('2581', '市中区', '230', '3');
INSERT INTO `t_locations` VALUES ('2582', '微山县', '230', '3');
INSERT INTO `t_locations` VALUES ('2583', '曲阜市', '230', '3');
INSERT INTO `t_locations` VALUES ('2584', '梁山县', '230', '3');
INSERT INTO `t_locations` VALUES ('2585', '汶上县', '230', '3');
INSERT INTO `t_locations` VALUES ('2586', '泗水县', '230', '3');
INSERT INTO `t_locations` VALUES ('2587', '邹城市', '230', '3');
INSERT INTO `t_locations` VALUES ('2588', '金乡县', '230', '3');
INSERT INTO `t_locations` VALUES ('2589', '鱼台县', '230', '3');
INSERT INTO `t_locations` VALUES ('2590', '东平县', '231', '3');
INSERT INTO `t_locations` VALUES ('2591', '宁阳县', '231', '3');
INSERT INTO `t_locations` VALUES ('2592', '岱岳区', '231', '3');
INSERT INTO `t_locations` VALUES ('2593', '新泰市', '231', '3');
INSERT INTO `t_locations` VALUES ('2594', '泰山区', '231', '3');
INSERT INTO `t_locations` VALUES ('2595', '肥城市', '231', '3');
INSERT INTO `t_locations` VALUES ('2596', '乳山市', '232', '3');
INSERT INTO `t_locations` VALUES ('2597', '文登市', '232', '3');
INSERT INTO `t_locations` VALUES ('2598', '环翠区', '232', '3');
INSERT INTO `t_locations` VALUES ('2599', '荣成市', '232', '3');
INSERT INTO `t_locations` VALUES ('2600', '东港区', '233', '3');
INSERT INTO `t_locations` VALUES ('2601', '五莲县', '233', '3');
INSERT INTO `t_locations` VALUES ('2602', '岚山区', '233', '3');
INSERT INTO `t_locations` VALUES ('2603', '莒县', '233', '3');
INSERT INTO `t_locations` VALUES ('2604', '莱城区', '234', '3');
INSERT INTO `t_locations` VALUES ('2605', '钢城区', '234', '3');
INSERT INTO `t_locations` VALUES ('2606', '临沭县', '235', '3');
INSERT INTO `t_locations` VALUES ('2607', '兰山区', '235', '3');
INSERT INTO `t_locations` VALUES ('2608', '平邑县', '235', '3');
INSERT INTO `t_locations` VALUES ('2609', '沂南县', '235', '3');
INSERT INTO `t_locations` VALUES ('2610', '沂水县', '235', '3');
INSERT INTO `t_locations` VALUES ('2611', '河东区', '235', '3');
INSERT INTO `t_locations` VALUES ('2612', '罗庄区', '235', '3');
INSERT INTO `t_locations` VALUES ('2613', '苍山县', '235', '3');
INSERT INTO `t_locations` VALUES ('2614', '莒南县', '235', '3');
INSERT INTO `t_locations` VALUES ('2615', '蒙阴县', '235', '3');
INSERT INTO `t_locations` VALUES ('2616', '费县', '235', '3');
INSERT INTO `t_locations` VALUES ('2617', '郯城县', '235', '3');
INSERT INTO `t_locations` VALUES ('2618', '临邑县', '236', '3');
INSERT INTO `t_locations` VALUES ('2619', '乐陵市', '236', '3');
INSERT INTO `t_locations` VALUES ('2620', '夏津县', '236', '3');
INSERT INTO `t_locations` VALUES ('2621', '宁津县', '236', '3');
INSERT INTO `t_locations` VALUES ('2622', '平原县', '236', '3');
INSERT INTO `t_locations` VALUES ('2623', '庆云县', '236', '3');
INSERT INTO `t_locations` VALUES ('2624', '德城区', '236', '3');
INSERT INTO `t_locations` VALUES ('2625', '武城县', '236', '3');
INSERT INTO `t_locations` VALUES ('2626', '禹城市', '236', '3');
INSERT INTO `t_locations` VALUES ('2627', '陵县', '236', '3');
INSERT INTO `t_locations` VALUES ('2628', '齐河县', '236', '3');
INSERT INTO `t_locations` VALUES ('2629', '东昌府区', '237', '3');
INSERT INTO `t_locations` VALUES ('2630', '东阿县', '237', '3');
INSERT INTO `t_locations` VALUES ('2631', '临清市', '237', '3');
INSERT INTO `t_locations` VALUES ('2632', '冠县', '237', '3');
INSERT INTO `t_locations` VALUES ('2633', '茌平县', '237', '3');
INSERT INTO `t_locations` VALUES ('2634', '莘县', '237', '3');
INSERT INTO `t_locations` VALUES ('2635', '阳谷县', '237', '3');
INSERT INTO `t_locations` VALUES ('2636', '高唐县', '237', '3');
INSERT INTO `t_locations` VALUES ('2637', '博兴县', '238', '3');
INSERT INTO `t_locations` VALUES ('2638', '惠民县', '238', '3');
INSERT INTO `t_locations` VALUES ('2639', '无棣县', '238', '3');
INSERT INTO `t_locations` VALUES ('2640', '沾化县', '238', '3');
INSERT INTO `t_locations` VALUES ('2641', '滨城区', '238', '3');
INSERT INTO `t_locations` VALUES ('2642', '邹平县', '238', '3');
INSERT INTO `t_locations` VALUES ('2643', '阳信县', '238', '3');
INSERT INTO `t_locations` VALUES ('2644', '东明县', '239', '3');
INSERT INTO `t_locations` VALUES ('2645', '单县', '239', '3');
INSERT INTO `t_locations` VALUES ('2646', '定陶县', '239', '3');
INSERT INTO `t_locations` VALUES ('2647', '巨野县', '239', '3');
INSERT INTO `t_locations` VALUES ('2648', '成武县', '239', '3');
INSERT INTO `t_locations` VALUES ('2649', '曹县', '239', '3');
INSERT INTO `t_locations` VALUES ('2650', '牡丹区', '239', '3');
INSERT INTO `t_locations` VALUES ('2651', '郓城县', '239', '3');
INSERT INTO `t_locations` VALUES ('2652', '鄄城县', '239', '3');
INSERT INTO `t_locations` VALUES ('2653', '上街区', '240', '3');
INSERT INTO `t_locations` VALUES ('2654', '中原区', '240', '3');
INSERT INTO `t_locations` VALUES ('2655', '中牟县', '240', '3');
INSERT INTO `t_locations` VALUES ('2656', '二七区', '240', '3');
INSERT INTO `t_locations` VALUES ('2657', '巩义市', '240', '3');
INSERT INTO `t_locations` VALUES ('2658', '惠济区', '240', '3');
INSERT INTO `t_locations` VALUES ('2659', '新密市', '240', '3');
INSERT INTO `t_locations` VALUES ('2660', '新郑市', '240', '3');
INSERT INTO `t_locations` VALUES ('2661', '登封市', '240', '3');
INSERT INTO `t_locations` VALUES ('2662', '管城回族区', '240', '3');
INSERT INTO `t_locations` VALUES ('2663', '荥阳市', '240', '3');
INSERT INTO `t_locations` VALUES ('2664', '金水区', '240', '3');
INSERT INTO `t_locations` VALUES ('2665', '兰考县', '241', '3');
INSERT INTO `t_locations` VALUES ('2666', '尉氏县', '241', '3');
INSERT INTO `t_locations` VALUES ('2667', '开封县', '241', '3');
INSERT INTO `t_locations` VALUES ('2668', '杞县', '241', '3');
INSERT INTO `t_locations` VALUES ('2669', '禹王台区', '241', '3');
INSERT INTO `t_locations` VALUES ('2670', '通许县', '241', '3');
INSERT INTO `t_locations` VALUES ('2671', '金明区', '241', '3');
INSERT INTO `t_locations` VALUES ('2672', '顺河回族区', '241', '3');
INSERT INTO `t_locations` VALUES ('2673', '鼓楼区', '241', '3');
INSERT INTO `t_locations` VALUES ('2674', '龙亭区', '241', '3');
INSERT INTO `t_locations` VALUES ('2675', '伊川县', '242', '3');
INSERT INTO `t_locations` VALUES ('2676', '偃师市', '242', '3');
INSERT INTO `t_locations` VALUES ('2677', '吉利区', '242', '3');
INSERT INTO `t_locations` VALUES ('2678', '孟津县', '242', '3');
INSERT INTO `t_locations` VALUES ('2679', '宜阳县', '242', '3');
INSERT INTO `t_locations` VALUES ('2680', '嵩县', '242', '3');
INSERT INTO `t_locations` VALUES ('2681', '新安县', '242', '3');
INSERT INTO `t_locations` VALUES ('2682', '栾川县', '242', '3');
INSERT INTO `t_locations` VALUES ('2683', '汝阳县', '242', '3');
INSERT INTO `t_locations` VALUES ('2684', '洛宁县', '242', '3');
INSERT INTO `t_locations` VALUES ('2685', '洛龙区', '242', '3');
INSERT INTO `t_locations` VALUES ('2686', '涧西区', '242', '3');
INSERT INTO `t_locations` VALUES ('2687', '瀍河回族区', '242', '3');
INSERT INTO `t_locations` VALUES ('2688', '老城区', '242', '3');
INSERT INTO `t_locations` VALUES ('2689', '西工区', '242', '3');
INSERT INTO `t_locations` VALUES ('2690', '卫东区', '243', '3');
INSERT INTO `t_locations` VALUES ('2691', '叶县', '243', '3');
INSERT INTO `t_locations` VALUES ('2692', '宝丰县', '243', '3');
INSERT INTO `t_locations` VALUES ('2693', '新华区', '243', '3');
INSERT INTO `t_locations` VALUES ('2694', '汝州市', '243', '3');
INSERT INTO `t_locations` VALUES ('2695', '湛河区', '243', '3');
INSERT INTO `t_locations` VALUES ('2696', '石龙区', '243', '3');
INSERT INTO `t_locations` VALUES ('2697', '舞钢市', '243', '3');
INSERT INTO `t_locations` VALUES ('2698', '郏县', '243', '3');
INSERT INTO `t_locations` VALUES ('2699', '鲁山县', '243', '3');
INSERT INTO `t_locations` VALUES ('2700', '内黄县', '244', '3');
INSERT INTO `t_locations` VALUES ('2701', '北关区', '244', '3');
INSERT INTO `t_locations` VALUES ('2702', '安阳县', '244', '3');
INSERT INTO `t_locations` VALUES ('2703', '文峰区', '244', '3');
INSERT INTO `t_locations` VALUES ('2704', '林州市', '244', '3');
INSERT INTO `t_locations` VALUES ('2705', '殷都区', '244', '3');
INSERT INTO `t_locations` VALUES ('2706', '汤阴县', '244', '3');
INSERT INTO `t_locations` VALUES ('2707', '滑县', '244', '3');
INSERT INTO `t_locations` VALUES ('2708', '龙安区', '244', '3');
INSERT INTO `t_locations` VALUES ('2709', '山城区', '245', '3');
INSERT INTO `t_locations` VALUES ('2710', '浚县', '245', '3');
INSERT INTO `t_locations` VALUES ('2711', '淇县', '245', '3');
INSERT INTO `t_locations` VALUES ('2712', '淇滨区', '245', '3');
INSERT INTO `t_locations` VALUES ('2713', '鹤山区', '245', '3');
INSERT INTO `t_locations` VALUES ('2714', '凤泉区', '246', '3');
INSERT INTO `t_locations` VALUES ('2715', '卫滨区', '246', '3');
INSERT INTO `t_locations` VALUES ('2716', '卫辉市', '246', '3');
INSERT INTO `t_locations` VALUES ('2717', '原阳县', '246', '3');
INSERT INTO `t_locations` VALUES ('2718', '封丘县', '246', '3');
INSERT INTO `t_locations` VALUES ('2719', '延津县', '246', '3');
INSERT INTO `t_locations` VALUES ('2720', '新乡县', '246', '3');
INSERT INTO `t_locations` VALUES ('2721', '牧野区', '246', '3');
INSERT INTO `t_locations` VALUES ('2722', '红旗区', '246', '3');
INSERT INTO `t_locations` VALUES ('2723', '获嘉县', '246', '3');
INSERT INTO `t_locations` VALUES ('2724', '辉县市', '246', '3');
INSERT INTO `t_locations` VALUES ('2725', '长垣县', '246', '3');
INSERT INTO `t_locations` VALUES ('2726', '中站区', '247', '3');
INSERT INTO `t_locations` VALUES ('2727', '修武县', '247', '3');
INSERT INTO `t_locations` VALUES ('2728', '博爱县', '247', '3');
INSERT INTO `t_locations` VALUES ('2729', '孟州市', '247', '3');
INSERT INTO `t_locations` VALUES ('2730', '山阳区', '247', '3');
INSERT INTO `t_locations` VALUES ('2731', '武陟县', '247', '3');
INSERT INTO `t_locations` VALUES ('2732', '沁阳市', '247', '3');
INSERT INTO `t_locations` VALUES ('2733', '温县', '247', '3');
INSERT INTO `t_locations` VALUES ('2734', '解放区', '247', '3');
INSERT INTO `t_locations` VALUES ('2735', '马村区', '247', '3');
INSERT INTO `t_locations` VALUES ('2736', '华龙区', '248', '3');
INSERT INTO `t_locations` VALUES ('2737', '南乐县', '248', '3');
INSERT INTO `t_locations` VALUES ('2738', '台前县', '248', '3');
INSERT INTO `t_locations` VALUES ('2739', '清丰县', '248', '3');
INSERT INTO `t_locations` VALUES ('2740', '濮阳县', '248', '3');
INSERT INTO `t_locations` VALUES ('2741', '范县', '248', '3');
INSERT INTO `t_locations` VALUES ('2742', '禹州市', '249', '3');
INSERT INTO `t_locations` VALUES ('2743', '襄城县', '249', '3');
INSERT INTO `t_locations` VALUES ('2744', '许昌县', '249', '3');
INSERT INTO `t_locations` VALUES ('2745', '鄢陵县', '249', '3');
INSERT INTO `t_locations` VALUES ('2746', '长葛市', '249', '3');
INSERT INTO `t_locations` VALUES ('2747', '魏都区', '249', '3');
INSERT INTO `t_locations` VALUES ('2748', '临颍县', '250', '3');
INSERT INTO `t_locations` VALUES ('2749', '召陵区', '250', '3');
INSERT INTO `t_locations` VALUES ('2750', '源汇区', '250', '3');
INSERT INTO `t_locations` VALUES ('2751', '舞阳县', '250', '3');
INSERT INTO `t_locations` VALUES ('2752', '郾城区', '250', '3');
INSERT INTO `t_locations` VALUES ('2753', '义马市', '251', '3');
INSERT INTO `t_locations` VALUES ('2754', '卢氏县', '251', '3');
INSERT INTO `t_locations` VALUES ('2755', '渑池县', '251', '3');
INSERT INTO `t_locations` VALUES ('2756', '湖滨区', '251', '3');
INSERT INTO `t_locations` VALUES ('2757', '灵宝市', '251', '3');
INSERT INTO `t_locations` VALUES ('2758', '陕县', '251', '3');
INSERT INTO `t_locations` VALUES ('2759', '内乡县', '252', '3');
INSERT INTO `t_locations` VALUES ('2760', '南召县', '252', '3');
INSERT INTO `t_locations` VALUES ('2761', '卧龙区', '252', '3');
INSERT INTO `t_locations` VALUES ('2762', '唐河县', '252', '3');
INSERT INTO `t_locations` VALUES ('2763', '宛城区', '252', '3');
INSERT INTO `t_locations` VALUES ('2764', '新野县', '252', '3');
INSERT INTO `t_locations` VALUES ('2765', '方城县', '252', '3');
INSERT INTO `t_locations` VALUES ('2766', '桐柏县', '252', '3');
INSERT INTO `t_locations` VALUES ('2767', '淅川县', '252', '3');
INSERT INTO `t_locations` VALUES ('2768', '社旗县', '252', '3');
INSERT INTO `t_locations` VALUES ('2769', '西峡县', '252', '3');
INSERT INTO `t_locations` VALUES ('2770', '邓州市', '252', '3');
INSERT INTO `t_locations` VALUES ('2771', '镇平县', '252', '3');
INSERT INTO `t_locations` VALUES ('2772', '夏邑县', '253', '3');
INSERT INTO `t_locations` VALUES ('2773', '宁陵县', '253', '3');
INSERT INTO `t_locations` VALUES ('2774', '柘城县', '253', '3');
INSERT INTO `t_locations` VALUES ('2775', '民权县', '253', '3');
INSERT INTO `t_locations` VALUES ('2776', '永城市', '253', '3');
INSERT INTO `t_locations` VALUES ('2777', '睢县', '253', '3');
INSERT INTO `t_locations` VALUES ('2778', '睢阳区', '253', '3');
INSERT INTO `t_locations` VALUES ('2779', '粱园区', '253', '3');
INSERT INTO `t_locations` VALUES ('2780', '虞城县', '253', '3');
INSERT INTO `t_locations` VALUES ('2781', '光山县', '254', '3');
INSERT INTO `t_locations` VALUES ('2782', '商城县', '254', '3');
INSERT INTO `t_locations` VALUES ('2783', '固始县', '254', '3');
INSERT INTO `t_locations` VALUES ('2784', '平桥区', '254', '3');
INSERT INTO `t_locations` VALUES ('2785', '息县', '254', '3');
INSERT INTO `t_locations` VALUES ('2786', '新县', '254', '3');
INSERT INTO `t_locations` VALUES ('2787', '浉河区', '254', '3');
INSERT INTO `t_locations` VALUES ('2788', '淮滨县', '254', '3');
INSERT INTO `t_locations` VALUES ('2789', '潢川县', '254', '3');
INSERT INTO `t_locations` VALUES ('2790', '罗山县', '254', '3');
INSERT INTO `t_locations` VALUES ('2791', '商水县', '255', '3');
INSERT INTO `t_locations` VALUES ('2792', '太康县', '255', '3');
INSERT INTO `t_locations` VALUES ('2793', '川汇区', '255', '3');
INSERT INTO `t_locations` VALUES ('2794', '扶沟县', '255', '3');
INSERT INTO `t_locations` VALUES ('2795', '沈丘县', '255', '3');
INSERT INTO `t_locations` VALUES ('2796', '淮阳县', '255', '3');
INSERT INTO `t_locations` VALUES ('2797', '西华县', '255', '3');
INSERT INTO `t_locations` VALUES ('2798', '郸城县', '255', '3');
INSERT INTO `t_locations` VALUES ('2799', '项城市', '255', '3');
INSERT INTO `t_locations` VALUES ('2800', '鹿邑县', '255', '3');
INSERT INTO `t_locations` VALUES ('2801', '上蔡县', '256', '3');
INSERT INTO `t_locations` VALUES ('2802', '平舆县', '256', '3');
INSERT INTO `t_locations` VALUES ('2803', '新蔡县', '256', '3');
INSERT INTO `t_locations` VALUES ('2804', '正阳县', '256', '3');
INSERT INTO `t_locations` VALUES ('2805', '汝南县', '256', '3');
INSERT INTO `t_locations` VALUES ('2806', '泌阳县', '256', '3');
INSERT INTO `t_locations` VALUES ('2807', '确山县', '256', '3');
INSERT INTO `t_locations` VALUES ('2808', '西平县', '256', '3');
INSERT INTO `t_locations` VALUES ('2809', '遂平县', '256', '3');
INSERT INTO `t_locations` VALUES ('2810', '驿城区', '256', '3');
INSERT INTO `t_locations` VALUES ('2811', '济源市', '257', '3');
INSERT INTO `t_locations` VALUES ('2812', '东西湖区', '258', '3');
INSERT INTO `t_locations` VALUES ('2813', '新洲区', '258', '3');
INSERT INTO `t_locations` VALUES ('2814', '武昌区', '258', '3');
INSERT INTO `t_locations` VALUES ('2815', '汉南区', '258', '3');
INSERT INTO `t_locations` VALUES ('2816', '汉阳区', '258', '3');
INSERT INTO `t_locations` VALUES ('2817', '江夏区', '258', '3');
INSERT INTO `t_locations` VALUES ('2818', '江岸区', '258', '3');
INSERT INTO `t_locations` VALUES ('2819', '江汉区', '258', '3');
INSERT INTO `t_locations` VALUES ('2820', '洪山区', '258', '3');
INSERT INTO `t_locations` VALUES ('2821', '硚口区', '258', '3');
INSERT INTO `t_locations` VALUES ('2822', '蔡甸区', '258', '3');
INSERT INTO `t_locations` VALUES ('2823', '青山区', '258', '3');
INSERT INTO `t_locations` VALUES ('2824', '黄陂区', '258', '3');
INSERT INTO `t_locations` VALUES ('2825', '下陆区', '259', '3');
INSERT INTO `t_locations` VALUES ('2826', '大冶市', '259', '3');
INSERT INTO `t_locations` VALUES ('2827', '西塞山区', '259', '3');
INSERT INTO `t_locations` VALUES ('2828', '铁山区', '259', '3');
INSERT INTO `t_locations` VALUES ('2829', '阳新县', '259', '3');
INSERT INTO `t_locations` VALUES ('2830', '黄石港区', '259', '3');
INSERT INTO `t_locations` VALUES ('2831', '丹江口市', '260', '3');
INSERT INTO `t_locations` VALUES ('2832', '张湾区', '260', '3');
INSERT INTO `t_locations` VALUES ('2833', '房县', '260', '3');
INSERT INTO `t_locations` VALUES ('2834', '竹山县', '260', '3');
INSERT INTO `t_locations` VALUES ('2835', '竹溪县', '260', '3');
INSERT INTO `t_locations` VALUES ('2836', '茅箭区', '260', '3');
INSERT INTO `t_locations` VALUES ('2837', '郧县', '260', '3');
INSERT INTO `t_locations` VALUES ('2838', '郧西县', '260', '3');
INSERT INTO `t_locations` VALUES ('2839', '五峰土家族自治县', '261', '3');
INSERT INTO `t_locations` VALUES ('2840', '伍家岗区', '261', '3');
INSERT INTO `t_locations` VALUES ('2841', '兴山县', '261', '3');
INSERT INTO `t_locations` VALUES ('2842', '夷陵区', '261', '3');
INSERT INTO `t_locations` VALUES ('2843', '宜都市', '261', '3');
INSERT INTO `t_locations` VALUES ('2844', '当阳市', '261', '3');
INSERT INTO `t_locations` VALUES ('2845', '枝江市', '261', '3');
INSERT INTO `t_locations` VALUES ('2846', '点军区', '261', '3');
INSERT INTO `t_locations` VALUES ('2847', '秭归县', '261', '3');
INSERT INTO `t_locations` VALUES ('2848', '虢亭区', '261', '3');
INSERT INTO `t_locations` VALUES ('2849', '西陵区', '261', '3');
INSERT INTO `t_locations` VALUES ('2850', '远安县', '261', '3');
INSERT INTO `t_locations` VALUES ('2851', '长阳土家族自治县', '261', '3');
INSERT INTO `t_locations` VALUES ('2852', '保康县', '262', '3');
INSERT INTO `t_locations` VALUES ('2853', '南漳县', '262', '3');
INSERT INTO `t_locations` VALUES ('2854', '宜城市', '262', '3');
INSERT INTO `t_locations` VALUES ('2855', '枣阳市', '262', '3');
INSERT INTO `t_locations` VALUES ('2856', '樊城区', '262', '3');
INSERT INTO `t_locations` VALUES ('2857', '老河口市', '262', '3');
INSERT INTO `t_locations` VALUES ('2858', '襄城区', '262', '3');
INSERT INTO `t_locations` VALUES ('2859', '襄阳区', '262', '3');
INSERT INTO `t_locations` VALUES ('2860', '谷城县', '262', '3');
INSERT INTO `t_locations` VALUES ('2861', '华容区', '263', '3');
INSERT INTO `t_locations` VALUES ('2862', '粱子湖', '263', '3');
INSERT INTO `t_locations` VALUES ('2863', '鄂城区', '263', '3');
INSERT INTO `t_locations` VALUES ('2864', '东宝区', '264', '3');
INSERT INTO `t_locations` VALUES ('2865', '京山县', '264', '3');
INSERT INTO `t_locations` VALUES ('2866', '掇刀区', '264', '3');
INSERT INTO `t_locations` VALUES ('2867', '沙洋县', '264', '3');
INSERT INTO `t_locations` VALUES ('2868', '钟祥市', '264', '3');
INSERT INTO `t_locations` VALUES ('2869', '云梦县', '265', '3');
INSERT INTO `t_locations` VALUES ('2870', '大悟县', '265', '3');
INSERT INTO `t_locations` VALUES ('2871', '孝南区', '265', '3');
INSERT INTO `t_locations` VALUES ('2872', '孝昌县', '265', '3');
INSERT INTO `t_locations` VALUES ('2873', '安陆市', '265', '3');
INSERT INTO `t_locations` VALUES ('2874', '应城市', '265', '3');
INSERT INTO `t_locations` VALUES ('2875', '汉川市', '265', '3');
INSERT INTO `t_locations` VALUES ('2876', '公安县', '266', '3');
INSERT INTO `t_locations` VALUES ('2877', '松滋市', '266', '3');
INSERT INTO `t_locations` VALUES ('2878', '江陵县', '266', '3');
INSERT INTO `t_locations` VALUES ('2879', '沙市区', '266', '3');
INSERT INTO `t_locations` VALUES ('2880', '洪湖市', '266', '3');
INSERT INTO `t_locations` VALUES ('2881', '监利县', '266', '3');
INSERT INTO `t_locations` VALUES ('2882', '石首市', '266', '3');
INSERT INTO `t_locations` VALUES ('2883', '荆州区', '266', '3');
INSERT INTO `t_locations` VALUES ('2884', '团风县', '267', '3');
INSERT INTO `t_locations` VALUES ('2885', '武穴市', '267', '3');
INSERT INTO `t_locations` VALUES ('2886', '浠水县', '267', '3');
INSERT INTO `t_locations` VALUES ('2887', '红安县', '267', '3');
INSERT INTO `t_locations` VALUES ('2888', '罗田县', '267', '3');
INSERT INTO `t_locations` VALUES ('2889', '英山县', '267', '3');
INSERT INTO `t_locations` VALUES ('2890', '蕲春县', '267', '3');
INSERT INTO `t_locations` VALUES ('2891', '麻城市', '267', '3');
INSERT INTO `t_locations` VALUES ('2892', '黄州区', '267', '3');
INSERT INTO `t_locations` VALUES ('2893', '黄梅县', '267', '3');
INSERT INTO `t_locations` VALUES ('2894', '咸安区', '268', '3');
INSERT INTO `t_locations` VALUES ('2895', '嘉鱼县', '268', '3');
INSERT INTO `t_locations` VALUES ('2896', '崇阳县', '268', '3');
INSERT INTO `t_locations` VALUES ('2897', '赤壁市', '268', '3');
INSERT INTO `t_locations` VALUES ('2898', '通城县', '268', '3');
INSERT INTO `t_locations` VALUES ('2899', '通山县', '268', '3');
INSERT INTO `t_locations` VALUES ('2900', '广水市', '269', '3');
INSERT INTO `t_locations` VALUES ('2901', '曾都区', '269', '3');
INSERT INTO `t_locations` VALUES ('2902', '利川市', '270', '3');
INSERT INTO `t_locations` VALUES ('2903', '咸丰县', '270', '3');
INSERT INTO `t_locations` VALUES ('2904', '宣恩县', '270', '3');
INSERT INTO `t_locations` VALUES ('2905', '巴东县', '270', '3');
INSERT INTO `t_locations` VALUES ('2906', '建始县', '270', '3');
INSERT INTO `t_locations` VALUES ('2907', '恩施市', '270', '3');
INSERT INTO `t_locations` VALUES ('2908', '来凤县', '270', '3');
INSERT INTO `t_locations` VALUES ('2909', '鹤峰县', '270', '3');
INSERT INTO `t_locations` VALUES ('2910', '仙桃市', '271', '3');
INSERT INTO `t_locations` VALUES ('2911', '潜江市', '272', '3');
INSERT INTO `t_locations` VALUES ('2912', '天门市', '273', '3');
INSERT INTO `t_locations` VALUES ('2913', '神农架林区', '274', '3');
INSERT INTO `t_locations` VALUES ('2914', '天心区', '275', '3');
INSERT INTO `t_locations` VALUES ('2915', '宁乡县', '275', '3');
INSERT INTO `t_locations` VALUES ('2916', '岳麓区', '275', '3');
INSERT INTO `t_locations` VALUES ('2917', '开福区', '275', '3');
INSERT INTO `t_locations` VALUES ('2918', '望城县', '275', '3');
INSERT INTO `t_locations` VALUES ('2919', '浏阳市', '275', '3');
INSERT INTO `t_locations` VALUES ('2920', '芙蓉区', '275', '3');
INSERT INTO `t_locations` VALUES ('2921', '长沙县', '275', '3');
INSERT INTO `t_locations` VALUES ('2922', '雨花区', '275', '3');
INSERT INTO `t_locations` VALUES ('2923', '天元区', '276', '3');
INSERT INTO `t_locations` VALUES ('2924', '攸县', '276', '3');
INSERT INTO `t_locations` VALUES ('2925', '株洲县', '276', '3');
INSERT INTO `t_locations` VALUES ('2926', '炎陵县', '276', '3');
INSERT INTO `t_locations` VALUES ('2927', '石峰区', '276', '3');
INSERT INTO `t_locations` VALUES ('2928', '芦淞区', '276', '3');
INSERT INTO `t_locations` VALUES ('2929', '茶陵县', '276', '3');
INSERT INTO `t_locations` VALUES ('2930', '荷塘区', '276', '3');
INSERT INTO `t_locations` VALUES ('2931', '醴陵市', '276', '3');
INSERT INTO `t_locations` VALUES ('2932', '岳塘区', '277', '3');
INSERT INTO `t_locations` VALUES ('2933', '湘乡市', '277', '3');
INSERT INTO `t_locations` VALUES ('2934', '湘潭县', '277', '3');
INSERT INTO `t_locations` VALUES ('2935', '雨湖区', '277', '3');
INSERT INTO `t_locations` VALUES ('2936', '韶山市', '277', '3');
INSERT INTO `t_locations` VALUES ('2937', '南岳区', '278', '3');
INSERT INTO `t_locations` VALUES ('2938', '常宁市', '278', '3');
INSERT INTO `t_locations` VALUES ('2939', '珠晖区', '278', '3');
INSERT INTO `t_locations` VALUES ('2940', '石鼓区', '278', '3');
INSERT INTO `t_locations` VALUES ('2941', '祁东县', '278', '3');
INSERT INTO `t_locations` VALUES ('2942', '耒阳市', '278', '3');
INSERT INTO `t_locations` VALUES ('2943', '蒸湘区', '278', '3');
INSERT INTO `t_locations` VALUES ('2944', '衡东县', '278', '3');
INSERT INTO `t_locations` VALUES ('2945', '衡南县', '278', '3');
INSERT INTO `t_locations` VALUES ('2946', '衡山县', '278', '3');
INSERT INTO `t_locations` VALUES ('2947', '衡阳县', '278', '3');
INSERT INTO `t_locations` VALUES ('2948', '雁峰区', '278', '3');
INSERT INTO `t_locations` VALUES ('2949', '北塔区', '279', '3');
INSERT INTO `t_locations` VALUES ('2950', '双清区', '279', '3');
INSERT INTO `t_locations` VALUES ('2951', '城步苗族自治县', '279', '3');
INSERT INTO `t_locations` VALUES ('2952', '大祥区', '279', '3');
INSERT INTO `t_locations` VALUES ('2953', '新宁县', '279', '3');
INSERT INTO `t_locations` VALUES ('2954', '新邵县', '279', '3');
INSERT INTO `t_locations` VALUES ('2955', '武冈市', '279', '3');
INSERT INTO `t_locations` VALUES ('2956', '洞口县', '279', '3');
INSERT INTO `t_locations` VALUES ('2957', '绥宁县', '279', '3');
INSERT INTO `t_locations` VALUES ('2958', '邵东县', '279', '3');
INSERT INTO `t_locations` VALUES ('2959', '邵阳县', '279', '3');
INSERT INTO `t_locations` VALUES ('2960', '隆回县', '279', '3');
INSERT INTO `t_locations` VALUES ('2961', '临湘市', '280', '3');
INSERT INTO `t_locations` VALUES ('2962', '云溪区', '280', '3');
INSERT INTO `t_locations` VALUES ('2963', '华容县', '280', '3');
INSERT INTO `t_locations` VALUES ('2964', '君山区', '280', '3');
INSERT INTO `t_locations` VALUES ('2965', '岳阳县', '280', '3');
INSERT INTO `t_locations` VALUES ('2966', '岳阳楼区', '280', '3');
INSERT INTO `t_locations` VALUES ('2967', '平江县', '280', '3');
INSERT INTO `t_locations` VALUES ('2968', '汨罗市', '280', '3');
INSERT INTO `t_locations` VALUES ('2969', '湘阴县', '280', '3');
INSERT INTO `t_locations` VALUES ('2970', '临澧县', '281', '3');
INSERT INTO `t_locations` VALUES ('2971', '安乡县', '281', '3');
INSERT INTO `t_locations` VALUES ('2972', '桃源县', '281', '3');
INSERT INTO `t_locations` VALUES ('2973', '武陵区', '281', '3');
INSERT INTO `t_locations` VALUES ('2974', '汉寿县', '281', '3');
INSERT INTO `t_locations` VALUES ('2975', '津市市', '281', '3');
INSERT INTO `t_locations` VALUES ('2976', '澧县', '281', '3');
INSERT INTO `t_locations` VALUES ('2977', '石门县', '281', '3');
INSERT INTO `t_locations` VALUES ('2978', '鼎城区', '281', '3');
INSERT INTO `t_locations` VALUES ('2979', '慈利县', '282', '3');
INSERT INTO `t_locations` VALUES ('2980', '桑植县', '282', '3');
INSERT INTO `t_locations` VALUES ('2981', '武陵源区', '282', '3');
INSERT INTO `t_locations` VALUES ('2982', '永定区', '282', '3');
INSERT INTO `t_locations` VALUES ('2983', '南县', '283', '3');
INSERT INTO `t_locations` VALUES ('2984', '安化县', '283', '3');
INSERT INTO `t_locations` VALUES ('2985', '桃江县', '283', '3');
INSERT INTO `t_locations` VALUES ('2986', '沅江市', '283', '3');
INSERT INTO `t_locations` VALUES ('2987', '资阳区', '283', '3');
INSERT INTO `t_locations` VALUES ('2988', '赫山区', '283', '3');
INSERT INTO `t_locations` VALUES ('2989', '临武县', '284', '3');
INSERT INTO `t_locations` VALUES ('2990', '北湖区', '284', '3');
INSERT INTO `t_locations` VALUES ('2991', '嘉禾县', '284', '3');
INSERT INTO `t_locations` VALUES ('2992', '安仁县', '284', '3');
INSERT INTO `t_locations` VALUES ('2993', '宜章县', '284', '3');
INSERT INTO `t_locations` VALUES ('2994', '桂东县', '284', '3');
INSERT INTO `t_locations` VALUES ('2995', '桂阳县', '284', '3');
INSERT INTO `t_locations` VALUES ('2996', '永兴县', '284', '3');
INSERT INTO `t_locations` VALUES ('2997', '汝城县', '284', '3');
INSERT INTO `t_locations` VALUES ('2998', '苏仙区', '284', '3');
INSERT INTO `t_locations` VALUES ('2999', '资兴市', '284', '3');
INSERT INTO `t_locations` VALUES ('3000', '东安县', '285', '3');
INSERT INTO `t_locations` VALUES ('3001', '冷水滩区', '285', '3');
INSERT INTO `t_locations` VALUES ('3002', '双牌县', '285', '3');
INSERT INTO `t_locations` VALUES ('3003', '宁远县', '285', '3');
INSERT INTO `t_locations` VALUES ('3004', '新田县', '285', '3');
INSERT INTO `t_locations` VALUES ('3005', '江华瑶族自治县', '285', '3');
INSERT INTO `t_locations` VALUES ('3006', '江永县', '285', '3');
INSERT INTO `t_locations` VALUES ('3007', '祁阳县', '285', '3');
INSERT INTO `t_locations` VALUES ('3008', '蓝山县', '285', '3');
INSERT INTO `t_locations` VALUES ('3009', '道县', '285', '3');
INSERT INTO `t_locations` VALUES ('3010', '零陵区', '285', '3');
INSERT INTO `t_locations` VALUES ('3011', '中方县', '286', '3');
INSERT INTO `t_locations` VALUES ('3012', '会同县', '286', '3');
INSERT INTO `t_locations` VALUES ('3013', '新晃侗族自治县', '286', '3');
INSERT INTO `t_locations` VALUES ('3014', '沅陵县', '286', '3');
INSERT INTO `t_locations` VALUES ('3015', '洪江市/洪江区', '286', '3');
INSERT INTO `t_locations` VALUES ('3016', '溆浦县', '286', '3');
INSERT INTO `t_locations` VALUES ('3017', '芷江侗族自治县', '286', '3');
INSERT INTO `t_locations` VALUES ('3018', '辰溪县', '286', '3');
INSERT INTO `t_locations` VALUES ('3019', '通道侗族自治县', '286', '3');
INSERT INTO `t_locations` VALUES ('3020', '靖州苗族侗族自治县', '286', '3');
INSERT INTO `t_locations` VALUES ('3021', '鹤城区', '286', '3');
INSERT INTO `t_locations` VALUES ('3022', '麻阳苗族自治县', '286', '3');
INSERT INTO `t_locations` VALUES ('3023', '冷水江市', '287', '3');
INSERT INTO `t_locations` VALUES ('3024', '双峰县', '287', '3');
INSERT INTO `t_locations` VALUES ('3025', '娄星区', '287', '3');
INSERT INTO `t_locations` VALUES ('3026', '新化县', '287', '3');
INSERT INTO `t_locations` VALUES ('3027', '涟源市', '287', '3');
INSERT INTO `t_locations` VALUES ('3028', '保靖县', '288', '3');
INSERT INTO `t_locations` VALUES ('3029', '凤凰县', '288', '3');
INSERT INTO `t_locations` VALUES ('3030', '古丈县', '288', '3');
INSERT INTO `t_locations` VALUES ('3031', '吉首市', '288', '3');
INSERT INTO `t_locations` VALUES ('3032', '永顺县', '288', '3');
INSERT INTO `t_locations` VALUES ('3033', '泸溪县', '288', '3');
INSERT INTO `t_locations` VALUES ('3034', '花垣县', '288', '3');
INSERT INTO `t_locations` VALUES ('3035', '龙山县', '288', '3');
INSERT INTO `t_locations` VALUES ('3036', '萝岗区', '289', '3');
INSERT INTO `t_locations` VALUES ('3037', '南沙区', '289', '3');
INSERT INTO `t_locations` VALUES ('3038', '从化市', '289', '3');
INSERT INTO `t_locations` VALUES ('3039', '增城市', '289', '3');
INSERT INTO `t_locations` VALUES ('3040', '天河区', '289', '3');
INSERT INTO `t_locations` VALUES ('3041', '海珠区', '289', '3');
INSERT INTO `t_locations` VALUES ('3042', '番禺区', '289', '3');
INSERT INTO `t_locations` VALUES ('3043', '白云区', '289', '3');
INSERT INTO `t_locations` VALUES ('3044', '花都区', '289', '3');
INSERT INTO `t_locations` VALUES ('3045', '荔湾区', '289', '3');
INSERT INTO `t_locations` VALUES ('3046', '越秀区', '289', '3');
INSERT INTO `t_locations` VALUES ('3047', '黄埔区', '289', '3');
INSERT INTO `t_locations` VALUES ('3048', '乐昌市', '290', '3');
INSERT INTO `t_locations` VALUES ('3049', '乳源瑶族自治县', '290', '3');
INSERT INTO `t_locations` VALUES ('3050', '仁化县', '290', '3');
INSERT INTO `t_locations` VALUES ('3051', '南雄市', '290', '3');
INSERT INTO `t_locations` VALUES ('3052', '始兴县', '290', '3');
INSERT INTO `t_locations` VALUES ('3053', '新丰县', '290', '3');
INSERT INTO `t_locations` VALUES ('3054', '曲江区', '290', '3');
INSERT INTO `t_locations` VALUES ('3055', '武江区', '290', '3');
INSERT INTO `t_locations` VALUES ('3056', '浈江区', '290', '3');
INSERT INTO `t_locations` VALUES ('3057', '翁源县', '290', '3');
INSERT INTO `t_locations` VALUES ('3058', '南山区', '291', '3');
INSERT INTO `t_locations` VALUES ('3059', '宝安区', '291', '3');
INSERT INTO `t_locations` VALUES ('3060', '盐田区', '291', '3');
INSERT INTO `t_locations` VALUES ('3061', '福田区', '291', '3');
INSERT INTO `t_locations` VALUES ('3062', '罗湖区', '291', '3');
INSERT INTO `t_locations` VALUES ('3063', '龙岗区', '291', '3');
INSERT INTO `t_locations` VALUES ('3064', '斗门区', '292', '3');
INSERT INTO `t_locations` VALUES ('3065', '金湾区', '292', '3');
INSERT INTO `t_locations` VALUES ('3066', '香洲区', '292', '3');
INSERT INTO `t_locations` VALUES ('3067', '南澳县', '293', '3');
INSERT INTO `t_locations` VALUES ('3068', '潮南区', '293', '3');
INSERT INTO `t_locations` VALUES ('3069', '潮阳区', '293', '3');
INSERT INTO `t_locations` VALUES ('3070', '澄海区', '293', '3');
INSERT INTO `t_locations` VALUES ('3071', '濠江区', '293', '3');
INSERT INTO `t_locations` VALUES ('3072', '金平区', '293', '3');
INSERT INTO `t_locations` VALUES ('3073', '龙湖区', '293', '3');
INSERT INTO `t_locations` VALUES ('3074', '三水区', '294', '3');
INSERT INTO `t_locations` VALUES ('3075', '南海区', '294', '3');
INSERT INTO `t_locations` VALUES ('3076', '禅城区', '294', '3');
INSERT INTO `t_locations` VALUES ('3077', '顺德区', '294', '3');
INSERT INTO `t_locations` VALUES ('3078', '高明区', '294', '3');
INSERT INTO `t_locations` VALUES ('3079', '台山市', '295', '3');
INSERT INTO `t_locations` VALUES ('3080', '开平市', '295', '3');
INSERT INTO `t_locations` VALUES ('3081', '恩平市', '295', '3');
INSERT INTO `t_locations` VALUES ('3082', '新会区', '295', '3');
INSERT INTO `t_locations` VALUES ('3083', '江海区', '295', '3');
INSERT INTO `t_locations` VALUES ('3084', '蓬江区', '295', '3');
INSERT INTO `t_locations` VALUES ('3085', '鹤山市', '295', '3');
INSERT INTO `t_locations` VALUES ('3086', '吴川市', '296', '3');
INSERT INTO `t_locations` VALUES ('3087', '坡头区', '296', '3');
INSERT INTO `t_locations` VALUES ('3088', '廉江市', '296', '3');
INSERT INTO `t_locations` VALUES ('3089', '徐闻县', '296', '3');
INSERT INTO `t_locations` VALUES ('3090', '赤坎区', '296', '3');
INSERT INTO `t_locations` VALUES ('3091', '遂溪县', '296', '3');
INSERT INTO `t_locations` VALUES ('3092', '雷州市', '296', '3');
INSERT INTO `t_locations` VALUES ('3093', '霞山区', '296', '3');
INSERT INTO `t_locations` VALUES ('3094', '麻章区', '296', '3');
INSERT INTO `t_locations` VALUES ('3095', '信宜市', '297', '3');
INSERT INTO `t_locations` VALUES ('3096', '化州市', '297', '3');
INSERT INTO `t_locations` VALUES ('3097', '电白县', '297', '3');
INSERT INTO `t_locations` VALUES ('3098', '茂南区', '297', '3');
INSERT INTO `t_locations` VALUES ('3099', '茂港区', '297', '3');
INSERT INTO `t_locations` VALUES ('3100', '高州市', '297', '3');
INSERT INTO `t_locations` VALUES ('3101', '四会市', '298', '3');
INSERT INTO `t_locations` VALUES ('3102', '封开县', '298', '3');
INSERT INTO `t_locations` VALUES ('3103', '广宁县', '298', '3');
INSERT INTO `t_locations` VALUES ('3104', '德庆县', '298', '3');
INSERT INTO `t_locations` VALUES ('3105', '怀集县', '298', '3');
INSERT INTO `t_locations` VALUES ('3106', '端州区', '298', '3');
INSERT INTO `t_locations` VALUES ('3107', '高要市', '298', '3');
INSERT INTO `t_locations` VALUES ('3108', '鼎湖区', '298', '3');
INSERT INTO `t_locations` VALUES ('3109', '博罗县', '299', '3');
INSERT INTO `t_locations` VALUES ('3110', '惠东县', '299', '3');
INSERT INTO `t_locations` VALUES ('3111', '惠城区', '299', '3');
INSERT INTO `t_locations` VALUES ('3112', '惠阳区', '299', '3');
INSERT INTO `t_locations` VALUES ('3113', '龙门县', '299', '3');
INSERT INTO `t_locations` VALUES ('3114', '丰顺县', '300', '3');
INSERT INTO `t_locations` VALUES ('3115', '五华县', '300', '3');
INSERT INTO `t_locations` VALUES ('3116', '兴宁市', '300', '3');
INSERT INTO `t_locations` VALUES ('3117', '大埔县', '300', '3');
INSERT INTO `t_locations` VALUES ('3118', '平远县', '300', '3');
INSERT INTO `t_locations` VALUES ('3119', '梅县', '300', '3');
INSERT INTO `t_locations` VALUES ('3120', '梅江区', '300', '3');
INSERT INTO `t_locations` VALUES ('3121', '蕉岭县', '300', '3');
INSERT INTO `t_locations` VALUES ('3122', '城区', '301', '3');
INSERT INTO `t_locations` VALUES ('3123', '海丰县', '301', '3');
INSERT INTO `t_locations` VALUES ('3124', '陆丰市', '301', '3');
INSERT INTO `t_locations` VALUES ('3125', '陆河县', '301', '3');
INSERT INTO `t_locations` VALUES ('3126', '东源县', '302', '3');
INSERT INTO `t_locations` VALUES ('3127', '和平县', '302', '3');
INSERT INTO `t_locations` VALUES ('3128', '源城区', '302', '3');
INSERT INTO `t_locations` VALUES ('3129', '紫金县', '302', '3');
INSERT INTO `t_locations` VALUES ('3130', '连平县', '302', '3');
INSERT INTO `t_locations` VALUES ('3131', '龙川县', '302', '3');
INSERT INTO `t_locations` VALUES ('3132', '江城区', '303', '3');
INSERT INTO `t_locations` VALUES ('3133', '阳东县', '303', '3');
INSERT INTO `t_locations` VALUES ('3134', '阳春市', '303', '3');
INSERT INTO `t_locations` VALUES ('3135', '阳西县', '303', '3');
INSERT INTO `t_locations` VALUES ('3136', '佛冈县', '304', '3');
INSERT INTO `t_locations` VALUES ('3137', '清城区', '304', '3');
INSERT INTO `t_locations` VALUES ('3138', '清新县', '304', '3');
INSERT INTO `t_locations` VALUES ('3139', '英德市', '304', '3');
INSERT INTO `t_locations` VALUES ('3140', '连南瑶族自治县', '304', '3');
INSERT INTO `t_locations` VALUES ('3141', '连山壮族瑶族自治县', '304', '3');
INSERT INTO `t_locations` VALUES ('3142', '连州市', '304', '3');
INSERT INTO `t_locations` VALUES ('3143', '阳山县', '304', '3');
INSERT INTO `t_locations` VALUES ('3144', '东莞市', '305', '3');
INSERT INTO `t_locations` VALUES ('3145', '中山市', '306', '3');
INSERT INTO `t_locations` VALUES ('3146', '湘桥区', '307', '3');
INSERT INTO `t_locations` VALUES ('3147', '潮安县', '307', '3');
INSERT INTO `t_locations` VALUES ('3148', '饶平县', '307', '3');
INSERT INTO `t_locations` VALUES ('3149', '惠来县', '308', '3');
INSERT INTO `t_locations` VALUES ('3150', '揭东县', '308', '3');
INSERT INTO `t_locations` VALUES ('3151', '揭西县', '308', '3');
INSERT INTO `t_locations` VALUES ('3152', '普宁市', '308', '3');
INSERT INTO `t_locations` VALUES ('3153', '榕城区', '308', '3');
INSERT INTO `t_locations` VALUES ('3154', '云城区', '309', '3');
INSERT INTO `t_locations` VALUES ('3155', '云安县', '309', '3');
INSERT INTO `t_locations` VALUES ('3156', '新兴县', '309', '3');
INSERT INTO `t_locations` VALUES ('3157', '罗定市', '309', '3');
INSERT INTO `t_locations` VALUES ('3158', '郁南县', '309', '3');
INSERT INTO `t_locations` VALUES ('3159', '上林县', '310', '3');
INSERT INTO `t_locations` VALUES ('3160', '兴宁区', '310', '3');
INSERT INTO `t_locations` VALUES ('3161', '宾阳县', '310', '3');
INSERT INTO `t_locations` VALUES ('3162', '横县', '310', '3');
INSERT INTO `t_locations` VALUES ('3163', '武鸣县', '310', '3');
INSERT INTO `t_locations` VALUES ('3164', '江南区', '310', '3');
INSERT INTO `t_locations` VALUES ('3165', '良庆区', '310', '3');
INSERT INTO `t_locations` VALUES ('3166', '西乡塘区', '310', '3');
INSERT INTO `t_locations` VALUES ('3167', '邕宁区', '310', '3');
INSERT INTO `t_locations` VALUES ('3168', '隆安县', '310', '3');
INSERT INTO `t_locations` VALUES ('3169', '青秀区', '310', '3');
INSERT INTO `t_locations` VALUES ('3170', '马山县', '310', '3');
INSERT INTO `t_locations` VALUES ('3171', '三江侗族自治县', '311', '3');
INSERT INTO `t_locations` VALUES ('3172', '城中区', '311', '3');
INSERT INTO `t_locations` VALUES ('3173', '柳北区', '311', '3');
INSERT INTO `t_locations` VALUES ('3174', '柳南区', '311', '3');
INSERT INTO `t_locations` VALUES ('3175', '柳城县', '311', '3');
INSERT INTO `t_locations` VALUES ('3176', '柳江县', '311', '3');
INSERT INTO `t_locations` VALUES ('3177', '融安县', '311', '3');
INSERT INTO `t_locations` VALUES ('3178', '融水苗族自治县', '311', '3');
INSERT INTO `t_locations` VALUES ('3179', '鱼峰区', '311', '3');
INSERT INTO `t_locations` VALUES ('3180', '鹿寨县', '311', '3');
INSERT INTO `t_locations` VALUES ('3181', '七星区', '312', '3');
INSERT INTO `t_locations` VALUES ('3182', '临桂县', '312', '3');
INSERT INTO `t_locations` VALUES ('3183', '全州县', '312', '3');
INSERT INTO `t_locations` VALUES ('3184', '兴安县', '312', '3');
INSERT INTO `t_locations` VALUES ('3185', '叠彩区', '312', '3');
INSERT INTO `t_locations` VALUES ('3186', '平乐县', '312', '3');
INSERT INTO `t_locations` VALUES ('3187', '恭城瑶族自治县', '312', '3');
INSERT INTO `t_locations` VALUES ('3188', '永福县', '312', '3');
INSERT INTO `t_locations` VALUES ('3189', '灌阳县', '312', '3');
INSERT INTO `t_locations` VALUES ('3190', '灵川县', '312', '3');
INSERT INTO `t_locations` VALUES ('3191', '秀峰区', '312', '3');
INSERT INTO `t_locations` VALUES ('3192', '荔浦县', '312', '3');
INSERT INTO `t_locations` VALUES ('3193', '象山区', '312', '3');
INSERT INTO `t_locations` VALUES ('3194', '资源县', '312', '3');
INSERT INTO `t_locations` VALUES ('3195', '阳朔县', '312', '3');
INSERT INTO `t_locations` VALUES ('3196', '雁山区', '312', '3');
INSERT INTO `t_locations` VALUES ('3197', '龙胜各族自治县', '312', '3');
INSERT INTO `t_locations` VALUES ('3198', '万秀区', '313', '3');
INSERT INTO `t_locations` VALUES ('3199', '岑溪市', '313', '3');
INSERT INTO `t_locations` VALUES ('3200', '苍梧县', '313', '3');
INSERT INTO `t_locations` VALUES ('3201', '蒙山县', '313', '3');
INSERT INTO `t_locations` VALUES ('3202', '藤县', '313', '3');
INSERT INTO `t_locations` VALUES ('3203', '蝶山区', '313', '3');
INSERT INTO `t_locations` VALUES ('3204', '长洲区', '313', '3');
INSERT INTO `t_locations` VALUES ('3205', '合浦县', '314', '3');
INSERT INTO `t_locations` VALUES ('3206', '海城区', '314', '3');
INSERT INTO `t_locations` VALUES ('3207', '铁山港区', '314', '3');
INSERT INTO `t_locations` VALUES ('3208', '银海区', '314', '3');
INSERT INTO `t_locations` VALUES ('3209', '上思县', '315', '3');
INSERT INTO `t_locations` VALUES ('3210', '东兴市', '315', '3');
INSERT INTO `t_locations` VALUES ('3211', '港口区', '315', '3');
INSERT INTO `t_locations` VALUES ('3212', '防城区', '315', '3');
INSERT INTO `t_locations` VALUES ('3213', '浦北县', '316', '3');
INSERT INTO `t_locations` VALUES ('3214', '灵山县', '316', '3');
INSERT INTO `t_locations` VALUES ('3215', '钦北区', '316', '3');
INSERT INTO `t_locations` VALUES ('3216', '钦南区', '316', '3');
INSERT INTO `t_locations` VALUES ('3217', '平南县', '317', '3');
INSERT INTO `t_locations` VALUES ('3218', '桂平市', '317', '3');
INSERT INTO `t_locations` VALUES ('3219', '港北区', '317', '3');
INSERT INTO `t_locations` VALUES ('3220', '港南区', '317', '3');
INSERT INTO `t_locations` VALUES ('3221', '覃塘区', '317', '3');
INSERT INTO `t_locations` VALUES ('3222', '兴业县', '318', '3');
INSERT INTO `t_locations` VALUES ('3223', '北流市', '318', '3');
INSERT INTO `t_locations` VALUES ('3224', '博白县', '318', '3');
INSERT INTO `t_locations` VALUES ('3225', '容县', '318', '3');
INSERT INTO `t_locations` VALUES ('3226', '玉州区', '318', '3');
INSERT INTO `t_locations` VALUES ('3227', '陆川县', '318', '3');
INSERT INTO `t_locations` VALUES ('3228', '乐业县', '319', '3');
INSERT INTO `t_locations` VALUES ('3229', '凌云县', '319', '3');
INSERT INTO `t_locations` VALUES ('3230', '右江区', '319', '3');
INSERT INTO `t_locations` VALUES ('3231', '平果县', '319', '3');
INSERT INTO `t_locations` VALUES ('3232', '德保县', '319', '3');
INSERT INTO `t_locations` VALUES ('3233', '田东县', '319', '3');
INSERT INTO `t_locations` VALUES ('3234', '田林县', '319', '3');
INSERT INTO `t_locations` VALUES ('3235', '田阳县', '319', '3');
INSERT INTO `t_locations` VALUES ('3236', '西林县', '319', '3');
INSERT INTO `t_locations` VALUES ('3237', '那坡县', '319', '3');
INSERT INTO `t_locations` VALUES ('3238', '隆林各族自治县', '319', '3');
INSERT INTO `t_locations` VALUES ('3239', '靖西县', '319', '3');
INSERT INTO `t_locations` VALUES ('3240', '八步区', '320', '3');
INSERT INTO `t_locations` VALUES ('3241', '富川瑶族自治县', '320', '3');
INSERT INTO `t_locations` VALUES ('3242', '昭平县', '320', '3');
INSERT INTO `t_locations` VALUES ('3243', '钟山县', '320', '3');
INSERT INTO `t_locations` VALUES ('3244', '东兰县', '321', '3');
INSERT INTO `t_locations` VALUES ('3245', '凤山县', '321', '3');
INSERT INTO `t_locations` VALUES ('3246', '南丹县', '321', '3');
INSERT INTO `t_locations` VALUES ('3247', '大化瑶族自治县', '321', '3');
INSERT INTO `t_locations` VALUES ('3248', '天峨县', '321', '3');
INSERT INTO `t_locations` VALUES ('3249', '宜州市', '321', '3');
INSERT INTO `t_locations` VALUES ('3250', '巴马瑶族自治县', '321', '3');
INSERT INTO `t_locations` VALUES ('3251', '环江毛南族自治县', '321', '3');
INSERT INTO `t_locations` VALUES ('3252', '罗城仫佬族自治县', '321', '3');
INSERT INTO `t_locations` VALUES ('3253', '都安瑶族自治县', '321', '3');
INSERT INTO `t_locations` VALUES ('3254', '金城江区', '321', '3');
INSERT INTO `t_locations` VALUES ('3255', '兴宾区', '322', '3');
INSERT INTO `t_locations` VALUES ('3256', '合山市', '322', '3');
INSERT INTO `t_locations` VALUES ('3257', '忻城县', '322', '3');
INSERT INTO `t_locations` VALUES ('3258', '武宣县', '322', '3');
INSERT INTO `t_locations` VALUES ('3259', '象州县', '322', '3');
INSERT INTO `t_locations` VALUES ('3260', '金秀瑶族自治县', '322', '3');
INSERT INTO `t_locations` VALUES ('3261', '凭祥市', '323', '3');
INSERT INTO `t_locations` VALUES ('3262', '大新县', '323', '3');
INSERT INTO `t_locations` VALUES ('3263', '天等县', '323', '3');
INSERT INTO `t_locations` VALUES ('3264', '宁明县', '323', '3');
INSERT INTO `t_locations` VALUES ('3265', '扶绥县', '323', '3');
INSERT INTO `t_locations` VALUES ('3266', '江州区', '323', '3');
INSERT INTO `t_locations` VALUES ('3267', '龙州县', '323', '3');
INSERT INTO `t_locations` VALUES ('3268', '琼山区', '324', '3');
INSERT INTO `t_locations` VALUES ('3269', '秀英区', '324', '3');
INSERT INTO `t_locations` VALUES ('3270', '美兰区', '324', '3');
INSERT INTO `t_locations` VALUES ('3271', '龙华区', '324', '3');
INSERT INTO `t_locations` VALUES ('3272', '三亚市', '325', '3');
INSERT INTO `t_locations` VALUES ('3273', '五指山市', '326', '3');
INSERT INTO `t_locations` VALUES ('3274', '琼海市', '327', '3');
INSERT INTO `t_locations` VALUES ('3275', '儋州市', '328', '3');
INSERT INTO `t_locations` VALUES ('3276', '文昌市', '329', '3');
INSERT INTO `t_locations` VALUES ('3277', '万宁市', '330', '3');
INSERT INTO `t_locations` VALUES ('3278', '东方市', '331', '3');
INSERT INTO `t_locations` VALUES ('3279', '定安县', '332', '3');
INSERT INTO `t_locations` VALUES ('3280', '屯昌县', '333', '3');
INSERT INTO `t_locations` VALUES ('3281', '澄迈县', '334', '3');
INSERT INTO `t_locations` VALUES ('3282', '临高县', '335', '3');
INSERT INTO `t_locations` VALUES ('3283', '白沙黎族自治县', '336', '3');
INSERT INTO `t_locations` VALUES ('3284', '昌江黎族自治县', '337', '3');
INSERT INTO `t_locations` VALUES ('3285', '乐东黎族自治县', '338', '3');
INSERT INTO `t_locations` VALUES ('3286', '陵水黎族自治县', '339', '3');
INSERT INTO `t_locations` VALUES ('3287', '保亭黎族苗族自治县', '340', '3');
INSERT INTO `t_locations` VALUES ('3288', '琼中黎族苗族自治县', '341', '3');
INSERT INTO `t_locations` VALUES ('3289', '九池乡', '345', '3');
INSERT INTO `t_locations` VALUES ('3290', '五桥街道', '345', '3');
INSERT INTO `t_locations` VALUES ('3291', '余家镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3292', '分水镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3293', '双河口街道', '345', '3');
INSERT INTO `t_locations` VALUES ('3294', '后山镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3295', '周家坝街道', '345', '3');
INSERT INTO `t_locations` VALUES ('3296', '响水镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3297', '地宝乡', '345', '3');
INSERT INTO `t_locations` VALUES ('3298', '大周镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3299', '天城镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3300', '太安镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3301', '太白街道', '345', '3');
INSERT INTO `t_locations` VALUES ('3302', '太龙镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3303', '孙家镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3304', '小周镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3305', '弹子镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3306', '恒合土家族乡', '345', '3');
INSERT INTO `t_locations` VALUES ('3307', '新乡镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3308', '新田镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3309', '普子乡', '345', '3');
INSERT INTO `t_locations` VALUES ('3310', '李河镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3311', '柱山乡', '345', '3');
INSERT INTO `t_locations` VALUES ('3312', '梨树乡', '345', '3');
INSERT INTO `t_locations` VALUES ('3313', '武陵镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3314', '沙河街道', '345', '3');
INSERT INTO `t_locations` VALUES ('3315', '溪口乡', '345', '3');
INSERT INTO `t_locations` VALUES ('3316', '瀼渡镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3317', '熊家镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3318', '燕山乡', '345', '3');
INSERT INTO `t_locations` VALUES ('3319', '牌楼街道', '345', '3');
INSERT INTO `t_locations` VALUES ('3320', '甘宁镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3321', '白土镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3322', '白羊镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3323', '百安坝街道', '345', '3');
INSERT INTO `t_locations` VALUES ('3324', '罗田镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3325', '茨竹乡', '345', '3');
INSERT INTO `t_locations` VALUES ('3326', '走马镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3327', '郭村乡', '345', '3');
INSERT INTO `t_locations` VALUES ('3328', '钟鼓楼街道', '345', '3');
INSERT INTO `t_locations` VALUES ('3329', '铁峰乡', '345', '3');
INSERT INTO `t_locations` VALUES ('3330', '长坪乡', '345', '3');
INSERT INTO `t_locations` VALUES ('3331', '长岭镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3332', '长滩镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3333', '陈家坝街道', '345', '3');
INSERT INTO `t_locations` VALUES ('3334', '高峰镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3335', '高梁镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3336', '高笋塘街道', '345', '3');
INSERT INTO `t_locations` VALUES ('3337', '黄柏乡', '345', '3');
INSERT INTO `t_locations` VALUES ('3338', '龙沙镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3339', '龙都街道', '345', '3');
INSERT INTO `t_locations` VALUES ('3340', '龙驹镇', '345', '3');
INSERT INTO `t_locations` VALUES ('3341', '丛林乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3342', '两汇乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3343', '中峰乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3344', '义和镇', '346', '3');
INSERT INTO `t_locations` VALUES ('3345', '仁义乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3346', '南沱镇', '346', '3');
INSERT INTO `t_locations` VALUES ('3347', '卷洞乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3348', '同乐乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3349', '土地坡乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3350', '堡子镇', '346', '3');
INSERT INTO `t_locations` VALUES ('3351', '增福乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3352', '大木乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3353', '天台乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3354', '太和乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3355', '山窝乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3356', '崇义街道', '346', '3');
INSERT INTO `t_locations` VALUES ('3357', '惠民乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3358', '敦仁街道', '346', '3');
INSERT INTO `t_locations` VALUES ('3359', '新妙镇', '346', '3');
INSERT INTO `t_locations` VALUES ('3360', '新村乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3361', '明家乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3362', '李渡镇', '346', '3');
INSERT INTO `t_locations` VALUES ('3363', '梓里乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3364', '武陵山乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3365', '江东街道', '346', '3');
INSERT INTO `t_locations` VALUES ('3366', '江北街道', '346', '3');
INSERT INTO `t_locations` VALUES ('3367', '清溪镇', '346', '3');
INSERT INTO `t_locations` VALUES ('3368', '焦石镇', '346', '3');
INSERT INTO `t_locations` VALUES ('3369', '珍溪镇', '346', '3');
INSERT INTO `t_locations` VALUES ('3370', '白涛镇', '346', '3');
INSERT INTO `t_locations` VALUES ('3371', '百胜镇', '346', '3');
INSERT INTO `t_locations` VALUES ('3372', '石和乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3373', '石沱镇', '346', '3');
INSERT INTO `t_locations` VALUES ('3374', '石龙乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3375', '罗云乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3376', '聚宝乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3377', '致韩镇', '346', '3');
INSERT INTO `t_locations` VALUES ('3378', '荔枝街道', '346', '3');
INSERT INTO `t_locations` VALUES ('3379', '蔺市镇', '346', '3');
INSERT INTO `t_locations` VALUES ('3380', '酒店乡', '346', '3');
INSERT INTO `t_locations` VALUES ('3381', '镇安镇', '346', '3');
INSERT INTO `t_locations` VALUES ('3382', '青羊镇', '346', '3');
INSERT INTO `t_locations` VALUES ('3383', '马武镇', '346', '3');
INSERT INTO `t_locations` VALUES ('3384', '龙桥镇', '346', '3');
INSERT INTO `t_locations` VALUES ('3385', '龙潭镇', '346', '3');
INSERT INTO `t_locations` VALUES ('3386', '七星岗街道', '347', '3');
INSERT INTO `t_locations` VALUES ('3387', '上清寺街道', '347', '3');
INSERT INTO `t_locations` VALUES ('3388', '两路口街道', '347', '3');
INSERT INTO `t_locations` VALUES ('3389', '化龙桥街道', '347', '3');
INSERT INTO `t_locations` VALUES ('3390', '南纪门街道', '347', '3');
INSERT INTO `t_locations` VALUES ('3391', '大坪街道', '347', '3');
INSERT INTO `t_locations` VALUES ('3392', '大溪沟街道', '347', '3');
INSERT INTO `t_locations` VALUES ('3393', '望龙门街道', '347', '3');
INSERT INTO `t_locations` VALUES ('3394', '朝天门街道', '347', '3');
INSERT INTO `t_locations` VALUES ('3395', '石油路街道', '347', '3');
INSERT INTO `t_locations` VALUES ('3396', '菜园坝街道', '347', '3');
INSERT INTO `t_locations` VALUES ('3397', '解放碑街道', '347', '3');
INSERT INTO `t_locations` VALUES ('3398', '九宫庙街道', '348', '3');
INSERT INTO `t_locations` VALUES ('3399', '八桥镇', '348', '3');
INSERT INTO `t_locations` VALUES ('3400', '建胜镇', '348', '3');
INSERT INTO `t_locations` VALUES ('3401', '新山村街道', '348', '3');
INSERT INTO `t_locations` VALUES ('3402', '春晖路街道', '348', '3');
INSERT INTO `t_locations` VALUES ('3403', '茄子溪街道', '348', '3');
INSERT INTO `t_locations` VALUES ('3404', '跃进村街道', '348', '3');
INSERT INTO `t_locations` VALUES ('3405', '跳磴镇', '348', '3');
INSERT INTO `t_locations` VALUES ('3406', '五宝镇', '349', '3');
INSERT INTO `t_locations` VALUES ('3407', '五里店街道', '349', '3');
INSERT INTO `t_locations` VALUES ('3408', '华新街街道', '349', '3');
INSERT INTO `t_locations` VALUES ('3409', '复盛镇', '349', '3');
INSERT INTO `t_locations` VALUES ('3410', '大石坝街道', '349', '3');
INSERT INTO `t_locations` VALUES ('3411', '寸滩街道', '349', '3');
INSERT INTO `t_locations` VALUES ('3412', '江北城街道', '349', '3');
INSERT INTO `t_locations` VALUES ('3413', '石马河街道', '349', '3');
INSERT INTO `t_locations` VALUES ('3414', '观音桥街道', '349', '3');
INSERT INTO `t_locations` VALUES ('3415', '郭家沱街道', '349', '3');
INSERT INTO `t_locations` VALUES ('3416', '铁山坪街道', '349', '3');
INSERT INTO `t_locations` VALUES ('3417', '鱼嘴镇', '349', '3');
INSERT INTO `t_locations` VALUES ('3418', '中梁镇', '350', '3');
INSERT INTO `t_locations` VALUES ('3419', '井口街道', '350', '3');
INSERT INTO `t_locations` VALUES ('3420', '井口镇', '350', '3');
INSERT INTO `t_locations` VALUES ('3421', '凤凰镇', '350', '3');
INSERT INTO `t_locations` VALUES ('3422', '回龙坝镇', '350', '3');
INSERT INTO `t_locations` VALUES ('3423', '土主镇', '350', '3');
INSERT INTO `t_locations` VALUES ('3424', '土湾街道', '350', '3');
INSERT INTO `t_locations` VALUES ('3425', '天星桥街道', '350', '3');
INSERT INTO `t_locations` VALUES ('3426', '小龙坎街道', '350', '3');
INSERT INTO `t_locations` VALUES ('3427', '山洞街道', '350', '3');
INSERT INTO `t_locations` VALUES ('3428', '新桥街道', '350', '3');
INSERT INTO `t_locations` VALUES ('3429', '曾家镇', '350', '3');
INSERT INTO `t_locations` VALUES ('3430', '歌乐山街道', '350', '3');
INSERT INTO `t_locations` VALUES ('3431', '歌乐山镇', '350', '3');
INSERT INTO `t_locations` VALUES ('3432', '沙坪坝街道', '350', '3');
INSERT INTO `t_locations` VALUES ('3433', '渝碚路街道', '350', '3');
INSERT INTO `t_locations` VALUES ('3434', '石井坡街道', '350', '3');
INSERT INTO `t_locations` VALUES ('3435', '磁器口街道', '350', '3');
INSERT INTO `t_locations` VALUES ('3436', '童家桥街道', '350', '3');
INSERT INTO `t_locations` VALUES ('3437', '虎溪镇', '350', '3');
INSERT INTO `t_locations` VALUES ('3438', '西永镇', '350', '3');
INSERT INTO `t_locations` VALUES ('3439', '覃家岗镇', '350', '3');
INSERT INTO `t_locations` VALUES ('3440', '詹家溪街道', '350', '3');
INSERT INTO `t_locations` VALUES ('3441', '陈家桥镇', '350', '3');
INSERT INTO `t_locations` VALUES ('3442', '青木关镇', '350', '3');
INSERT INTO `t_locations` VALUES ('3443', '中梁山街道', '351', '3');
INSERT INTO `t_locations` VALUES ('3444', '九龙镇', '351', '3');
INSERT INTO `t_locations` VALUES ('3445', '华岩镇', '351', '3');
INSERT INTO `t_locations` VALUES ('3446', '含谷镇', '351', '3');
INSERT INTO `t_locations` VALUES ('3447', '巴福镇', '351', '3');
INSERT INTO `t_locations` VALUES ('3448', '杨家坪街道', '351', '3');
INSERT INTO `t_locations` VALUES ('3449', '渝州路街道', '351', '3');
INSERT INTO `t_locations` VALUES ('3450', '白市驿镇', '351', '3');
INSERT INTO `t_locations` VALUES ('3451', '石坪桥街道', '351', '3');
INSERT INTO `t_locations` VALUES ('3452', '石板镇', '351', '3');
INSERT INTO `t_locations` VALUES ('3453', '石桥铺街道', '351', '3');
INSERT INTO `t_locations` VALUES ('3454', '西彭镇', '351', '3');
INSERT INTO `t_locations` VALUES ('3455', '谢家湾街道', '351', '3');
INSERT INTO `t_locations` VALUES ('3456', '走马镇', '351', '3');
INSERT INTO `t_locations` VALUES ('3457', '金凤镇', '351', '3');
INSERT INTO `t_locations` VALUES ('3458', '铜罐驿镇', '351', '3');
INSERT INTO `t_locations` VALUES ('3459', '陶家镇', '351', '3');
INSERT INTO `t_locations` VALUES ('3460', '黄桷坪街道', '351', '3');
INSERT INTO `t_locations` VALUES ('3461', '南坪街道', '352', '3');
INSERT INTO `t_locations` VALUES ('3462', '南坪镇', '352', '3');
INSERT INTO `t_locations` VALUES ('3463', '南山街道', '352', '3');
INSERT INTO `t_locations` VALUES ('3464', '峡口镇', '352', '3');
INSERT INTO `t_locations` VALUES ('3465', '广阳镇', '352', '3');
INSERT INTO `t_locations` VALUES ('3466', '弹子石街道', '352', '3');
INSERT INTO `t_locations` VALUES ('3467', '海棠溪街道', '352', '3');
INSERT INTO `t_locations` VALUES ('3468', '涂山镇', '352', '3');
INSERT INTO `t_locations` VALUES ('3469', '花园路街道', '352', '3');
INSERT INTO `t_locations` VALUES ('3470', '迎龙镇', '352', '3');
INSERT INTO `t_locations` VALUES ('3471', '铜元局街道', '352', '3');
INSERT INTO `t_locations` VALUES ('3472', '长生桥镇', '352', '3');
INSERT INTO `t_locations` VALUES ('3473', '鸡冠石镇', '352', '3');
INSERT INTO `t_locations` VALUES ('3474', '龙门浩街道', '352', '3');
INSERT INTO `t_locations` VALUES ('3475', '三圣镇', '353', '3');
INSERT INTO `t_locations` VALUES ('3476', '东阳街道', '353', '3');
INSERT INTO `t_locations` VALUES ('3477', '北温泉街道', '353', '3');
INSERT INTO `t_locations` VALUES ('3478', '复兴镇', '353', '3');
INSERT INTO `t_locations` VALUES ('3479', '天府镇', '353', '3');
INSERT INTO `t_locations` VALUES ('3480', '天生街道', '353', '3');
INSERT INTO `t_locations` VALUES ('3481', '施家梁镇', '353', '3');
INSERT INTO `t_locations` VALUES ('3482', '朝阳街道', '353', '3');
INSERT INTO `t_locations` VALUES ('3483', '柳荫镇', '353', '3');
INSERT INTO `t_locations` VALUES ('3484', '歇马镇', '353', '3');
INSERT INTO `t_locations` VALUES ('3485', '水土镇', '353', '3');
INSERT INTO `t_locations` VALUES ('3486', '澄江镇', '353', '3');
INSERT INTO `t_locations` VALUES ('3487', '童家溪镇', '353', '3');
INSERT INTO `t_locations` VALUES ('3488', '蔡家岗镇', '353', '3');
INSERT INTO `t_locations` VALUES ('3489', '金刀峡镇', '353', '3');
INSERT INTO `t_locations` VALUES ('3490', '静观镇', '353', '3');
INSERT INTO `t_locations` VALUES ('3491', '龙凤桥街道', '353', '3');
INSERT INTO `t_locations` VALUES ('3492', '双路镇', '354', '3');
INSERT INTO `t_locations` VALUES ('3493', '通桥镇', '354', '3');
INSERT INTO `t_locations` VALUES ('3494', '龙滩子街道', '354', '3');
INSERT INTO `t_locations` VALUES ('3495', '万东镇', '355', '3');
INSERT INTO `t_locations` VALUES ('3496', '万盛街道', '355', '3');
INSERT INTO `t_locations` VALUES ('3497', '丛林镇', '355', '3');
INSERT INTO `t_locations` VALUES ('3498', '东林街道', '355', '3');
INSERT INTO `t_locations` VALUES ('3499', '关坝镇', '355', '3');
INSERT INTO `t_locations` VALUES ('3500', '南桐镇', '355', '3');
INSERT INTO `t_locations` VALUES ('3501', '石林镇', '355', '3');
INSERT INTO `t_locations` VALUES ('3502', '金桥镇', '355', '3');
INSERT INTO `t_locations` VALUES ('3503', '青年镇', '355', '3');
INSERT INTO `t_locations` VALUES ('3504', '黑山镇', '355', '3');
INSERT INTO `t_locations` VALUES ('3505', '人和街道', '356', '3');
INSERT INTO `t_locations` VALUES ('3506', '兴隆镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3507', '华蓥山镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3508', '双凤桥街道', '356', '3');
INSERT INTO `t_locations` VALUES ('3509', '双龙湖街道', '356', '3');
INSERT INTO `t_locations` VALUES ('3510', '古路镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3511', '回兴街道', '356', '3');
INSERT INTO `t_locations` VALUES ('3512', '大塆镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3513', '大盛镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3514', '大竹林街道', '356', '3');
INSERT INTO `t_locations` VALUES ('3515', '天宫殿街道', '356', '3');
INSERT INTO `t_locations` VALUES ('3516', '张关镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3517', '御临镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3518', '悦来镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3519', '明月镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3520', '木耳镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3521', '洛碛镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3522', '玉峰山镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3523', '王家镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3524', '石坪镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3525', '石船镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3526', '礼嘉镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3527', '统景镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3528', '翠云街道', '356', '3');
INSERT INTO `t_locations` VALUES ('3529', '茨竹', '356', '3');
INSERT INTO `t_locations` VALUES ('3530', '高嘴镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3531', '鸳鸯街道', '356', '3');
INSERT INTO `t_locations` VALUES ('3532', '麻柳沱镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3533', '龙兴镇', '356', '3');
INSERT INTO `t_locations` VALUES ('3534', '龙塔街道', '356', '3');
INSERT INTO `t_locations` VALUES ('3535', '龙山街道', '356', '3');
INSERT INTO `t_locations` VALUES ('3536', '龙溪街道', '356', '3');
INSERT INTO `t_locations` VALUES ('3537', '一品镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3538', '东泉镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3539', '丰盛镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3540', '二圣镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3541', '南彭镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3542', '南泉镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3543', '双河口镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3544', '天星寺镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3545', '姜家镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3546', '安澜镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3547', '惠民镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3548', '接龙镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3549', '木洞镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3550', '李家沱街道', '357', '3');
INSERT INTO `t_locations` VALUES ('3551', '界石镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3552', '石滩镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3553', '石龙镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3554', '花溪镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3555', '跳石镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3556', '鱼洞街道', '357', '3');
INSERT INTO `t_locations` VALUES ('3557', '麻柳嘴镇', '357', '3');
INSERT INTO `t_locations` VALUES ('3558', '两河镇', '358', '3');
INSERT INTO `t_locations` VALUES ('3559', '中塘乡', '358', '3');
INSERT INTO `t_locations` VALUES ('3560', '五里乡', '358', '3');
INSERT INTO `t_locations` VALUES ('3561', '冯家镇', '358', '3');
INSERT INTO `t_locations` VALUES ('3562', '城东街道', '358', '3');
INSERT INTO `t_locations` VALUES ('3563', '城南街道', '358', '3');
INSERT INTO `t_locations` VALUES ('3564', '城西街道', '358', '3');
INSERT INTO `t_locations` VALUES ('3565', '太极乡', '358', '3');
INSERT INTO `t_locations` VALUES ('3566', '小南海镇', '358', '3');
INSERT INTO `t_locations` VALUES ('3567', '新华乡', '358', '3');
INSERT INTO `t_locations` VALUES ('3568', '杉岭乡', '358', '3');
INSERT INTO `t_locations` VALUES ('3569', '正阳镇', '358', '3');
INSERT INTO `t_locations` VALUES ('3570', '水市乡', '358', '3');
INSERT INTO `t_locations` VALUES ('3571', '水田乡', '358', '3');
INSERT INTO `t_locations` VALUES ('3572', '沙坝乡', '358', '3');
INSERT INTO `t_locations` VALUES ('3573', '濯水镇', '358', '3');
INSERT INTO `t_locations` VALUES ('3574', '白土乡', '358', '3');
INSERT INTO `t_locations` VALUES ('3575', '白石乡', '358', '3');
INSERT INTO `t_locations` VALUES ('3576', '石会镇', '358', '3');
INSERT INTO `t_locations` VALUES ('3577', '石家镇', '358', '3');
INSERT INTO `t_locations` VALUES ('3578', '舟白镇', '358', '3');
INSERT INTO `t_locations` VALUES ('3579', '蓬东乡', '358', '3');
INSERT INTO `t_locations` VALUES ('3580', '邻鄂镇', '358', '3');
INSERT INTO `t_locations` VALUES ('3581', '金洞乡', '358', '3');
INSERT INTO `t_locations` VALUES ('3582', '金溪镇', '358', '3');
INSERT INTO `t_locations` VALUES ('3583', '马喇镇', '358', '3');
INSERT INTO `t_locations` VALUES ('3584', '鹅池镇', '358', '3');
INSERT INTO `t_locations` VALUES ('3585', '黄溪镇', '358', '3');
INSERT INTO `t_locations` VALUES ('3586', '黎水镇', '358', '3');
INSERT INTO `t_locations` VALUES ('3587', '黑溪镇', '358', '3');
INSERT INTO `t_locations` VALUES ('3588', '万顺镇', '359', '3');
INSERT INTO `t_locations` VALUES ('3589', '云台镇', '359', '3');
INSERT INTO `t_locations` VALUES ('3590', '云集镇', '359', '3');
INSERT INTO `t_locations` VALUES ('3591', '但渡镇', '359', '3');
INSERT INTO `t_locations` VALUES ('3592', '八颗镇', '359', '3');
INSERT INTO `t_locations` VALUES ('3593', '凤城街道', '359', '3');
INSERT INTO `t_locations` VALUES ('3594', '双龙镇', '359', '3');
INSERT INTO `t_locations` VALUES ('3595', '新市镇', '359', '3');
INSERT INTO `t_locations` VALUES ('3596', '晏家街道', '359', '3');
INSERT INTO `t_locations` VALUES ('3597', '江南镇', '359', '3');
INSERT INTO `t_locations` VALUES ('3598', '洪湖镇', '359', '3');
INSERT INTO `t_locations` VALUES ('3599', '海棠镇', '359', '3');
INSERT INTO `t_locations` VALUES ('3600', '渡舟镇', '359', '3');
INSERT INTO `t_locations` VALUES ('3601', '石堰镇', '359', '3');
INSERT INTO `t_locations` VALUES ('3602', '葛兰镇', '359', '3');
INSERT INTO `t_locations` VALUES ('3603', '邻封镇', '359', '3');
INSERT INTO `t_locations` VALUES ('3604', '长寿湖镇', '359', '3');
INSERT INTO `t_locations` VALUES ('3605', '龙河镇', '359', '3');
INSERT INTO `t_locations` VALUES ('3606', '丁山镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3607', '三江镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3608', '三角镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3609', '东溪镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3610', '中峰镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3611', '古南镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3612', '安稳镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3613', '打通镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3614', '扶欢镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3615', '新盛镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3616', '横山镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3617', '永城镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3618', '永新镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3619', '石壕镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3620', '石角镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3621', '篆塘镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3622', '赶水镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3623', '郭扶镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3624', '隆盛镇', '360', '3');
INSERT INTO `t_locations` VALUES ('3625', '上和镇', '361', '3');
INSERT INTO `t_locations` VALUES ('3626', '五桂镇', '361', '3');
INSERT INTO `t_locations` VALUES ('3627', '别口乡', '361', '3');
INSERT INTO `t_locations` VALUES ('3628', '卧佛镇', '361', '3');
INSERT INTO `t_locations` VALUES ('3629', '双江镇', '361', '3');
INSERT INTO `t_locations` VALUES ('3630', '古溪镇', '361', '3');
INSERT INTO `t_locations` VALUES ('3631', '塘坝镇', '361', '3');
INSERT INTO `t_locations` VALUES ('3632', '太安镇', '361', '3');
INSERT INTO `t_locations` VALUES ('3633', '宝龙镇', '361', '3');
INSERT INTO `t_locations` VALUES ('3634', '寿桥乡', '361', '3');
INSERT INTO `t_locations` VALUES ('3635', '小渡镇', '361', '3');
INSERT INTO `t_locations` VALUES ('3636', '崇龛镇', '361', '3');
INSERT INTO `t_locations` VALUES ('3637', '新胜镇', '361', '3');
INSERT INTO `t_locations` VALUES ('3638', '柏梓镇', '361', '3');
INSERT INTO `t_locations` VALUES ('3639', '桂林街道', '361', '3');
INSERT INTO `t_locations` VALUES ('3640', '梓潼街道', '361', '3');
INSERT INTO `t_locations` VALUES ('3641', '玉溪镇', '361', '3');
INSERT INTO `t_locations` VALUES ('3642', '田家乡', '361', '3');
INSERT INTO `t_locations` VALUES ('3643', '米心镇', '361', '3');
INSERT INTO `t_locations` VALUES ('3644', '群力镇', '361', '3');
INSERT INTO `t_locations` VALUES ('3645', '花岩镇', '361', '3');
INSERT INTO `t_locations` VALUES ('3646', '龙形镇', '361', '3');
INSERT INTO `t_locations` VALUES ('3647', '东城街道', '362', '3');
INSERT INTO `t_locations` VALUES ('3648', '二坪镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3649', '侣俸镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3650', '华兴镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3651', '南城街道', '362', '3');
INSERT INTO `t_locations` VALUES ('3652', '双山乡', '362', '3');
INSERT INTO `t_locations` VALUES ('3653', '围龙镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3654', '土桥镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3655', '大庙镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3656', '太平镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3657', '安居镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3658', '安溪镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3659', '小林乡', '362', '3');
INSERT INTO `t_locations` VALUES ('3660', '少云镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3661', '巴川街道', '362', '3');
INSERT INTO `t_locations` VALUES ('3662', '平滩镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3663', '庆隆乡', '362', '3');
INSERT INTO `t_locations` VALUES ('3664', '旧县镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3665', '水口镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3666', '永嘉镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3667', '白羊镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3668', '石鱼镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3669', '福果镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3670', '维新镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3671', '蒲吕镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3672', '虎峰镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3673', '西河镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3674', '高楼镇', '362', '3');
INSERT INTO `t_locations` VALUES ('3675', '万古镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3676', '三驱镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3677', '中敖镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3678', '古龙乡', '363', '3');
INSERT INTO `t_locations` VALUES ('3679', '回龙镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3680', '国梁镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3681', '季家镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3682', '宝兴镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3683', '宝顶镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3684', '拾万镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3685', '智凤镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3686', '棠香街道', '363', '3');
INSERT INTO `t_locations` VALUES ('3687', '玉龙镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3688', '珠溪镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3689', '石马镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3690', '邮亭镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3691', '金山镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3692', '铁山镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3693', '雍溪镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3694', '高升场镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3695', '高坪乡', '363', '3');
INSERT INTO `t_locations` VALUES ('3696', '龙岗街道', '363', '3');
INSERT INTO `t_locations` VALUES ('3697', '龙水镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3698', '龙石镇', '363', '3');
INSERT INTO `t_locations` VALUES ('3699', '仁义镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3700', '双河镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3701', '古昌镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3702', '吴家镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3703', '安富镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3704', '峰高镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3705', '广顺镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3706', '昌元镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3707', '河包镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3708', '清升镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3709', '清江镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3710', '清流镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3711', '盘龙镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3712', '直升镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3713', '荣隆镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3714', '观胜镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3715', '路孔镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3716', '远觉镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3717', '铜鼓镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3718', '龙集镇', '364', '3');
INSERT INTO `t_locations` VALUES ('3719', '丁家镇', '365', '3');
INSERT INTO `t_locations` VALUES ('3720', '七塘镇', '365', '3');
INSERT INTO `t_locations` VALUES ('3721', '三合镇', '365', '3');
INSERT INTO `t_locations` VALUES ('3722', '健龙乡', '365', '3');
INSERT INTO `t_locations` VALUES ('3723', '八塘镇', '365', '3');
INSERT INTO `t_locations` VALUES ('3724', '大兴镇', '365', '3');
INSERT INTO `t_locations` VALUES ('3725', '大路镇', '365', '3');
INSERT INTO `t_locations` VALUES ('3726', '广普镇', '365', '3');
INSERT INTO `t_locations` VALUES ('3727', '正兴镇', '365', '3');
INSERT INTO `t_locations` VALUES ('3728', '河边镇', '365', '3');
INSERT INTO `t_locations` VALUES ('3729', '璧城街道', '365', '3');
INSERT INTO `t_locations` VALUES ('3730', '福禄镇', '365', '3');
INSERT INTO `t_locations` VALUES ('3731', '青杠街道', '365', '3');
INSERT INTO `t_locations` VALUES ('3732', '七星镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3733', '云龙镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3734', '仁贤镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3735', '合兴镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3736', '和林镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3737', '回龙镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3738', '城东乡', '366', '3');
INSERT INTO `t_locations` VALUES ('3739', '城北乡', '366', '3');
INSERT INTO `t_locations` VALUES ('3740', '复平乡', '366', '3');
INSERT INTO `t_locations` VALUES ('3741', '大观镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3742', '安胜乡', '366', '3');
INSERT INTO `t_locations` VALUES ('3743', '屏锦镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3744', '文化镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3745', '新盛镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3746', '明达镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3747', '曲水乡', '366', '3');
INSERT INTO `t_locations` VALUES ('3748', '柏家镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3749', '梁山镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3750', '石安镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3751', '碧山镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3752', '礼让镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3753', '福禄镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3754', '竹山镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3755', '紫照乡', '366', '3');
INSERT INTO `t_locations` VALUES ('3756', '聚奎镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3757', '荫平镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3758', '虎城镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3759', '蟠龙镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3760', '袁驿镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3761', '金带镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3762', '铁门乡', '366', '3');
INSERT INTO `t_locations` VALUES ('3763', '龙胜乡', '366', '3');
INSERT INTO `t_locations` VALUES ('3764', '龙门镇', '366', '3');
INSERT INTO `t_locations` VALUES ('3765', '东安乡', '367', '3');
INSERT INTO `t_locations` VALUES ('3766', '修齐镇', '367', '3');
INSERT INTO `t_locations` VALUES ('3767', '北屏乡', '367', '3');
INSERT INTO `t_locations` VALUES ('3768', '厚坪乡', '367', '3');
INSERT INTO `t_locations` VALUES ('3769', '双河乡', '367', '3');
INSERT INTO `t_locations` VALUES ('3770', '周溪乡', '367', '3');
INSERT INTO `t_locations` VALUES ('3771', '咸宜乡', '367', '3');
INSERT INTO `t_locations` VALUES ('3772', '坪坝镇', '367', '3');
INSERT INTO `t_locations` VALUES ('3773', '岚天乡', '367', '3');
INSERT INTO `t_locations` VALUES ('3774', '左岚乡', '367', '3');
INSERT INTO `t_locations` VALUES ('3775', '巴山镇', '367', '3');
INSERT INTO `t_locations` VALUES ('3776', '庙坝镇', '367', '3');
INSERT INTO `t_locations` VALUES ('3777', '明中乡', '367', '3');
INSERT INTO `t_locations` VALUES ('3778', '明通镇', '367', '3');
INSERT INTO `t_locations` VALUES ('3779', '河鱼乡', '367', '3');
INSERT INTO `t_locations` VALUES ('3780', '治平乡', '367', '3');
INSERT INTO `t_locations` VALUES ('3781', '沿河乡', '367', '3');
INSERT INTO `t_locations` VALUES ('3782', '葛城镇', '367', '3');
INSERT INTO `t_locations` VALUES ('3783', '蓼子乡', '367', '3');
INSERT INTO `t_locations` VALUES ('3784', '高楠乡', '367', '3');
INSERT INTO `t_locations` VALUES ('3785', '高燕乡', '367', '3');
INSERT INTO `t_locations` VALUES ('3786', '高观镇', '367', '3');
INSERT INTO `t_locations` VALUES ('3787', '鸡鸣乡', '367', '3');
INSERT INTO `t_locations` VALUES ('3788', '龙田乡', '367', '3');
INSERT INTO `t_locations` VALUES ('3789', '三元镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3790', '三合镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3791', '三坝乡', '368', '3');
INSERT INTO `t_locations` VALUES ('3792', '三建乡', '368', '3');
INSERT INTO `t_locations` VALUES ('3793', '仁沙乡', '368', '3');
INSERT INTO `t_locations` VALUES ('3794', '保合乡', '368', '3');
INSERT INTO `t_locations` VALUES ('3795', '兴义镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3796', '包鸾镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3797', '十直镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3798', '南天湖镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3799', '双路镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3800', '双龙场乡', '368', '3');
INSERT INTO `t_locations` VALUES ('3801', '名山镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3802', '太平坝乡', '368', '3');
INSERT INTO `t_locations` VALUES ('3803', '崇兴乡', '368', '3');
INSERT INTO `t_locations` VALUES ('3804', '暨龙乡', '368', '3');
INSERT INTO `t_locations` VALUES ('3805', '树人镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3806', '栗子乡', '368', '3');
INSERT INTO `t_locations` VALUES ('3807', '武平镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3808', '江池镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3809', '湛普镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3810', '社坛镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3811', '董家镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3812', '虎威镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3813', '许明寺镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3814', '都督乡', '368', '3');
INSERT INTO `t_locations` VALUES ('3815', '镇江镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3816', '青龙乡', '368', '3');
INSERT INTO `t_locations` VALUES ('3817', '高家镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3818', '龙孔乡', '368', '3');
INSERT INTO `t_locations` VALUES ('3819', '龙河镇', '368', '3');
INSERT INTO `t_locations` VALUES ('3820', '三溪乡', '369', '3');
INSERT INTO `t_locations` VALUES ('3821', '五洞镇', '369', '3');
INSERT INTO `t_locations` VALUES ('3822', '包家乡', '369', '3');
INSERT INTO `t_locations` VALUES ('3823', '周嘉镇', '369', '3');
INSERT INTO `t_locations` VALUES ('3824', '坪山镇', '369', '3');
INSERT INTO `t_locations` VALUES ('3825', '大石乡', '369', '3');
INSERT INTO `t_locations` VALUES ('3826', '太平镇', '369', '3');
INSERT INTO `t_locations` VALUES ('3827', '新民镇', '369', '3');
INSERT INTO `t_locations` VALUES ('3828', '普顺镇', '369', '3');
INSERT INTO `t_locations` VALUES ('3829', '曹回乡', '369', '3');
INSERT INTO `t_locations` VALUES ('3830', '杠家乡', '369', '3');
INSERT INTO `t_locations` VALUES ('3831', '桂溪镇', '369', '3');
INSERT INTO `t_locations` VALUES ('3832', '永安镇', '369', '3');
INSERT INTO `t_locations` VALUES ('3833', '永平乡', '369', '3');
INSERT INTO `t_locations` VALUES ('3834', '沙坪镇', '369', '3');
INSERT INTO `t_locations` VALUES ('3835', '沙河乡', '369', '3');
INSERT INTO `t_locations` VALUES ('3836', '澄溪镇', '369', '3');
INSERT INTO `t_locations` VALUES ('3837', '白家乡', '369', '3');
INSERT INTO `t_locations` VALUES ('3838', '砚台镇', '369', '3');
INSERT INTO `t_locations` VALUES ('3839', '裴兴乡', '369', '3');
INSERT INTO `t_locations` VALUES ('3840', '长龙乡', '369', '3');
INSERT INTO `t_locations` VALUES ('3841', '高安镇', '369', '3');
INSERT INTO `t_locations` VALUES ('3842', '高峰镇', '369', '3');
INSERT INTO `t_locations` VALUES ('3843', '鹤游镇', '369', '3');
INSERT INTO `t_locations` VALUES ('3844', '黄沙乡', '369', '3');
INSERT INTO `t_locations` VALUES ('3845', '仙女山镇', '370', '3');
INSERT INTO `t_locations` VALUES ('3846', '凤来乡', '370', '3');
INSERT INTO `t_locations` VALUES ('3847', '双河乡', '370', '3');
INSERT INTO `t_locations` VALUES ('3848', '后坪乡', '370', '3');
INSERT INTO `t_locations` VALUES ('3849', '和顺乡', '370', '3');
INSERT INTO `t_locations` VALUES ('3850', '土地乡', '370', '3');
INSERT INTO `t_locations` VALUES ('3851', '土坎镇', '370', '3');
INSERT INTO `t_locations` VALUES ('3852', '巷口镇', '370', '3');
INSERT INTO `t_locations` VALUES ('3853', '平桥镇', '370', '3');
INSERT INTO `t_locations` VALUES ('3854', '庙垭乡', '370', '3');
INSERT INTO `t_locations` VALUES ('3855', '接龙乡', '370', '3');
INSERT INTO `t_locations` VALUES ('3856', '文复乡', '370', '3');
INSERT INTO `t_locations` VALUES ('3857', '桐梓镇', '370', '3');
INSERT INTO `t_locations` VALUES ('3858', '江口镇', '370', '3');
INSERT INTO `t_locations` VALUES ('3859', '沧沟乡', '370', '3');
INSERT INTO `t_locations` VALUES ('3860', '浩口乡', '370', '3');
INSERT INTO `t_locations` VALUES ('3861', '火炉镇', '370', '3');
INSERT INTO `t_locations` VALUES ('3862', '白云乡', '370', '3');
INSERT INTO `t_locations` VALUES ('3863', '白马镇', '370', '3');
INSERT INTO `t_locations` VALUES ('3864', '石桥乡', '370', '3');
INSERT INTO `t_locations` VALUES ('3865', '羊角镇', '370', '3');
INSERT INTO `t_locations` VALUES ('3866', '赵家乡', '370', '3');
INSERT INTO `t_locations` VALUES ('3867', '铁矿乡', '370', '3');
INSERT INTO `t_locations` VALUES ('3868', '长坝镇', '370', '3');
INSERT INTO `t_locations` VALUES ('3869', '鸭江镇', '370', '3');
INSERT INTO `t_locations` VALUES ('3870', '黄莺乡', '370', '3');
INSERT INTO `t_locations` VALUES ('3871', '三汇镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3872', '东溪镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3873', '乌杨镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3874', '任家镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3875', '兴峰乡', '371', '3');
INSERT INTO `t_locations` VALUES ('3876', '双桂镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3877', '善广乡', '371', '3');
INSERT INTO `t_locations` VALUES ('3878', '复兴镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3879', '官坝镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3880', '忠州镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3881', '拔山镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3882', '新生镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3883', '新立镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3884', '永丰镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3885', '汝溪镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3886', '洋渡镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3887', '涂井乡', '371', '3');
INSERT INTO `t_locations` VALUES ('3888', '白石镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3889', '石子乡', '371', '3');
INSERT INTO `t_locations` VALUES ('3890', '石宝镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3891', '石黄镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3892', '磨子土家族乡', '371', '3');
INSERT INTO `t_locations` VALUES ('3893', '花桥镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3894', '野鹤镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3895', '金声乡', '371', '3');
INSERT INTO `t_locations` VALUES ('3896', '金鸡镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3897', '马灌镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3898', '黄金镇', '371', '3');
INSERT INTO `t_locations` VALUES ('3899', '三汇口乡', '372', '3');
INSERT INTO `t_locations` VALUES ('3900', '中和镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3901', '丰乐街道', '372', '3');
INSERT INTO `t_locations` VALUES ('3902', '临江镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3903', '义和镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3904', '九龙山镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3905', '五通乡', '372', '3');
INSERT INTO `t_locations` VALUES ('3906', '关面乡', '372', '3');
INSERT INTO `t_locations` VALUES ('3907', '南门镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3908', '南雅镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3909', '厚坝镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3910', '和谦镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3911', '大德乡', '372', '3');
INSERT INTO `t_locations` VALUES ('3912', '大进镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3913', '天和乡', '372', '3');
INSERT INTO `t_locations` VALUES ('3914', '岳溪镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3915', '巫山乡', '372', '3');
INSERT INTO `t_locations` VALUES ('3916', '敦好镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3917', '汉丰街道', '372', '3');
INSERT INTO `t_locations` VALUES ('3918', '河堰镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3919', '渠口镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3920', '温泉镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3921', '满月乡', '372', '3');
INSERT INTO `t_locations` VALUES ('3922', '白桥乡', '372', '3');
INSERT INTO `t_locations` VALUES ('3923', '白泉乡', '372', '3');
INSERT INTO `t_locations` VALUES ('3924', '白鹤街道', '372', '3');
INSERT INTO `t_locations` VALUES ('3925', '竹溪镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3926', '紫水乡', '372', '3');
INSERT INTO `t_locations` VALUES ('3927', '谭家乡', '372', '3');
INSERT INTO `t_locations` VALUES ('3928', '赵家镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3929', '郭家镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3930', '金峰乡', '372', '3');
INSERT INTO `t_locations` VALUES ('3931', '铁桥镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3932', '镇东街道', '372', '3');
INSERT INTO `t_locations` VALUES ('3933', '镇安镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3934', '长沙镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3935', '高桥镇', '372', '3');
INSERT INTO `t_locations` VALUES ('3936', '麻柳乡', '372', '3');
INSERT INTO `t_locations` VALUES ('3937', '上坝乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3938', '云安镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3939', '云硐乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3940', '云阳镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3941', '人和镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3942', '养鹿乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3943', '农坝镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3944', '凤鸣镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3945', '南溪镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3946', '双土镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3947', '双江街道', '373', '3');
INSERT INTO `t_locations` VALUES ('3948', '双龙乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3949', '后叶乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3950', '堰坪乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3951', '外郎乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3952', '大阳乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3953', '宝坪镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3954', '巴阳镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3955', '平安镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3956', '故陵镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3957', '新津乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3958', '普安乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3959', '栖霞乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3960', '桑坪镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3961', '毛坝乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3962', '水口乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3963', '江口镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3964', '沙市镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3965', '泥溪乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3966', '洞鹿乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3967', '清水土家族乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3968', '渠马镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3969', '盘龙镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3970', '石门乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3971', '票草乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3972', '红狮镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3973', '耀灵乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3974', '路阳镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3975', '青龙街道', '373', '3');
INSERT INTO `t_locations` VALUES ('3976', '高阳镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3977', '鱼泉镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3978', '黄石镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3979', '龙洞乡', '373', '3');
INSERT INTO `t_locations` VALUES ('3980', '龙角镇', '373', '3');
INSERT INTO `t_locations` VALUES ('3981', '云雾土家族乡', '374', '3');
INSERT INTO `t_locations` VALUES ('3982', '五马乡', '374', '3');
INSERT INTO `t_locations` VALUES ('3983', '公平镇', '374', '3');
INSERT INTO `t_locations` VALUES ('3984', '兴隆镇', '374', '3');
INSERT INTO `t_locations` VALUES ('3985', '冯坪乡', '374', '3');
INSERT INTO `t_locations` VALUES ('3986', '吐祥镇', '374', '3');
INSERT INTO `t_locations` VALUES ('3987', '大树镇', '374', '3');
INSERT INTO `t_locations` VALUES ('3988', '太和乡', '374', '3');
INSERT INTO `t_locations` VALUES ('3989', '安坪乡', '374', '3');
INSERT INTO `t_locations` VALUES ('3990', '岩湾乡', '374', '3');
INSERT INTO `t_locations` VALUES ('3991', '平安乡', '374', '3');
INSERT INTO `t_locations` VALUES ('3992', '康乐镇', '374', '3');
INSERT INTO `t_locations` VALUES ('3993', '康坪乡', '374', '3');
INSERT INTO `t_locations` VALUES ('3994', '新政乡', '374', '3');
INSERT INTO `t_locations` VALUES ('3995', '新民镇', '374', '3');
INSERT INTO `t_locations` VALUES ('3996', '朱衣镇', '374', '3');
INSERT INTO `t_locations` VALUES ('3997', '永乐镇', '374', '3');
INSERT INTO `t_locations` VALUES ('3998', '永安镇', '374', '3');
INSERT INTO `t_locations` VALUES ('3999', '汾河镇', '374', '3');
INSERT INTO `t_locations` VALUES ('4000', '甲高镇', '374', '3');
INSERT INTO `t_locations` VALUES ('4001', '白帝镇', '374', '3');
INSERT INTO `t_locations` VALUES ('4002', '石岗乡', '374', '3');
INSERT INTO `t_locations` VALUES ('4003', '竹园镇', '374', '3');
INSERT INTO `t_locations` VALUES ('4004', '红土乡', '374', '3');
INSERT INTO `t_locations` VALUES ('4005', '羊市镇', '374', '3');
INSERT INTO `t_locations` VALUES ('4006', '草堂镇', '374', '3');
INSERT INTO `t_locations` VALUES ('4007', '长安土家族乡', '374', '3');
INSERT INTO `t_locations` VALUES ('4008', '青龙镇', '374', '3');
INSERT INTO `t_locations` VALUES ('4009', '鹤峰乡', '374', '3');
INSERT INTO `t_locations` VALUES ('4010', '龙桥土家族乡', '374', '3');
INSERT INTO `t_locations` VALUES ('4011', '三溪乡', '375', '3');
INSERT INTO `t_locations` VALUES ('4012', '两坪乡', '375', '3');
INSERT INTO `t_locations` VALUES ('4013', '双龙镇', '375', '3');
INSERT INTO `t_locations` VALUES ('4014', '培石乡', '375', '3');
INSERT INTO `t_locations` VALUES ('4015', '大昌镇', '375', '3');
INSERT INTO `t_locations` VALUES ('4016', '大溪乡', '375', '3');
INSERT INTO `t_locations` VALUES ('4017', '官渡镇', '375', '3');
INSERT INTO `t_locations` VALUES ('4018', '官阳镇', '375', '3');
INSERT INTO `t_locations` VALUES ('4019', '巫峡镇', '375', '3');
INSERT INTO `t_locations` VALUES ('4020', '平河乡', '375', '3');
INSERT INTO `t_locations` VALUES ('4021', '庙堂乡', '375', '3');
INSERT INTO `t_locations` VALUES ('4022', '庙宇镇', '375', '3');
INSERT INTO `t_locations` VALUES ('4023', '建平乡', '375', '3');
INSERT INTO `t_locations` VALUES ('4024', '当阳乡', '375', '3');
INSERT INTO `t_locations` VALUES ('4025', '抱龙镇', '375', '3');
INSERT INTO `t_locations` VALUES ('4026', '曲尺乡', '375', '3');
INSERT INTO `t_locations` VALUES ('4027', '福田镇', '375', '3');
INSERT INTO `t_locations` VALUES ('4028', '竹贤乡', '375', '3');
INSERT INTO `t_locations` VALUES ('4029', '笃坪乡', '375', '3');
INSERT INTO `t_locations` VALUES ('4030', '红椿土家族乡', '375', '3');
INSERT INTO `t_locations` VALUES ('4031', '邓家土家族乡', '375', '3');
INSERT INTO `t_locations` VALUES ('4032', '金坪乡', '375', '3');
INSERT INTO `t_locations` VALUES ('4033', '铜鼓镇', '375', '3');
INSERT INTO `t_locations` VALUES ('4034', '骡坪镇', '375', '3');
INSERT INTO `t_locations` VALUES ('4035', '龙井乡', '375', '3');
INSERT INTO `t_locations` VALUES ('4036', '龙溪镇', '375', '3');
INSERT INTO `t_locations` VALUES ('4037', '上磺镇', '376', '3');
INSERT INTO `t_locations` VALUES ('4038', '下堡镇', '376', '3');
INSERT INTO `t_locations` VALUES ('4039', '中岗乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4040', '中梁乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4041', '乌龙乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4042', '兰英乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4043', '凤凰镇', '376', '3');
INSERT INTO `t_locations` VALUES ('4044', '双阳乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4045', '古路镇', '376', '3');
INSERT INTO `t_locations` VALUES ('4046', '土城乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4047', '城厢镇', '376', '3');
INSERT INTO `t_locations` VALUES ('4048', '塘坊乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4049', '大河乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4050', '天元乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4051', '天星乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4052', '宁厂镇', '376', '3');
INSERT INTO `t_locations` VALUES ('4053', '尖山镇', '376', '3');
INSERT INTO `t_locations` VALUES ('4054', '峰灵乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4055', '徐家镇', '376', '3');
INSERT INTO `t_locations` VALUES ('4056', '文峰镇', '376', '3');
INSERT INTO `t_locations` VALUES ('4057', '朝阳洞乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4058', '田坝乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4059', '白鹿镇', '376', '3');
INSERT INTO `t_locations` VALUES ('4060', '胜利乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4061', '花台乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4062', '菱角乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4063', '蒲莲乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4064', '通城乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4065', '长桂乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4066', '鱼鳞乡', '376', '3');
INSERT INTO `t_locations` VALUES ('4067', '万朝乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4068', '三星乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4069', '三河乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4070', '三益乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4071', '下路镇', '377', '3');
INSERT INTO `t_locations` VALUES ('4072', '中益乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4073', '临溪镇', '377', '3');
INSERT INTO `t_locations` VALUES ('4074', '六塘乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4075', '冷水乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4076', '南宾镇', '377', '3');
INSERT INTO `t_locations` VALUES ('4077', '大歇乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4078', '悦崃镇', '377', '3');
INSERT INTO `t_locations` VALUES ('4079', '新乐乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4080', '枫木乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4081', '桥头乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4082', '沙子镇', '377', '3');
INSERT INTO `t_locations` VALUES ('4083', '河嘴乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4084', '沿溪镇', '377', '3');
INSERT INTO `t_locations` VALUES ('4085', '洗新乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4086', '渔池镇', '377', '3');
INSERT INTO `t_locations` VALUES ('4087', '王场镇', '377', '3');
INSERT INTO `t_locations` VALUES ('4088', '王家乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4089', '石家乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4090', '西沱镇', '377', '3');
INSERT INTO `t_locations` VALUES ('4091', '金竹乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4092', '金铃乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4093', '马武镇', '377', '3');
INSERT INTO `t_locations` VALUES ('4094', '黄水镇', '377', '3');
INSERT INTO `t_locations` VALUES ('4095', '黄鹤乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4096', '黎场乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4097', '龙沙镇', '377', '3');
INSERT INTO `t_locations` VALUES ('4098', '龙潭乡', '377', '3');
INSERT INTO `t_locations` VALUES ('4099', '中和镇', '378', '3');
INSERT INTO `t_locations` VALUES ('4100', '中平乡', '378', '3');
INSERT INTO `t_locations` VALUES ('4101', '保安乡', '378', '3');
INSERT INTO `t_locations` VALUES ('4102', '兰桥镇', '378', '3');
INSERT INTO `t_locations` VALUES ('4103', '塘坳乡', '378', '3');
INSERT INTO `t_locations` VALUES ('4104', '大溪乡', '378', '3');
INSERT INTO `t_locations` VALUES ('4105', '妙泉乡', '378', '3');
INSERT INTO `t_locations` VALUES ('4106', '孝溪乡', '378', '3');
INSERT INTO `t_locations` VALUES ('4107', '宋农乡', '378', '3');
INSERT INTO `t_locations` VALUES ('4108', '官庄镇', '378', '3');
INSERT INTO `t_locations` VALUES ('4109', '官舟乡', '378', '3');
INSERT INTO `t_locations` VALUES ('4110', '岑溪乡', '378', '3');
INSERT INTO `t_locations` VALUES ('4111', '峨溶镇', '378', '3');
INSERT INTO `t_locations` VALUES ('4112', '巴家乡', '378', '3');
INSERT INTO `t_locations` VALUES ('4113', '干川乡', '378', '3');
INSERT INTO `t_locations` VALUES ('4114', '平凯镇', '378', '3');
INSERT INTO `t_locations` VALUES ('4115', '平马乡', '378', '3');
INSERT INTO `t_locations` VALUES ('4116', '梅江镇', '378', '3');
INSERT INTO `t_locations` VALUES ('4117', '洪安镇', '378', '3');
INSERT INTO `t_locations` VALUES ('4118', '海洋乡', '378', '3');
INSERT INTO `t_locations` VALUES ('4119', '涌洞乡', '378', '3');
INSERT INTO `t_locations` VALUES ('4120', '清溪场镇', '378', '3');
INSERT INTO `t_locations` VALUES ('4121', '溪口乡', '378', '3');
INSERT INTO `t_locations` VALUES ('4122', '溶溪镇', '378', '3');
INSERT INTO `t_locations` VALUES ('4123', '石堤镇', '378', '3');
INSERT INTO `t_locations` VALUES ('4124', '石耶镇', '378', '3');
INSERT INTO `t_locations` VALUES ('4125', '膏田乡', '378', '3');
INSERT INTO `t_locations` VALUES ('4126', '里仁乡', '378', '3');
INSERT INTO `t_locations` VALUES ('4127', '钟灵乡', '378', '3');
INSERT INTO `t_locations` VALUES ('4128', '隘口镇', '378', '3');
INSERT INTO `t_locations` VALUES ('4129', '雅江镇', '378', '3');
INSERT INTO `t_locations` VALUES ('4130', '龙池镇', '378', '3');
INSERT INTO `t_locations` VALUES ('4131', '丁市镇', '379', '3');
INSERT INTO `t_locations` VALUES ('4132', '万木乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4133', '两罾乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4134', '五福乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4135', '偏柏乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4136', '兴隆镇', '379', '3');
INSERT INTO `t_locations` VALUES ('4137', '南腰界乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4138', '双泉乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4139', '可大乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4140', '后坪坝乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4141', '后溪镇', '379', '3');
INSERT INTO `t_locations` VALUES ('4142', '大溪镇', '379', '3');
INSERT INTO `t_locations` VALUES ('4143', '天馆乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4144', '官清乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4145', '宜居乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4146', '小河镇', '379', '3');
INSERT INTO `t_locations` VALUES ('4147', '庙溪乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4148', '木叶乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4149', '李溪镇', '379', '3');
INSERT INTO `t_locations` VALUES ('4150', '板桥乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4151', '板溪乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4152', '楠木乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4153', '毛坝乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4154', '江丰乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4155', '泔溪镇', '379', '3');
INSERT INTO `t_locations` VALUES ('4156', '浪坪乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4157', '涂市乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4158', '清泉乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4159', '腴地乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4160', '花田乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4161', '苍岭镇', '379', '3');
INSERT INTO `t_locations` VALUES ('4162', '车田乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4163', '酉酬镇', '379', '3');
INSERT INTO `t_locations` VALUES ('4164', '钟多镇', '379', '3');
INSERT INTO `t_locations` VALUES ('4165', '铜鼓乡', '379', '3');
INSERT INTO `t_locations` VALUES ('4166', '麻旺镇', '379', '3');
INSERT INTO `t_locations` VALUES ('4167', '黑水镇', '379', '3');
INSERT INTO `t_locations` VALUES ('4168', '龙潭镇', '379', '3');
INSERT INTO `t_locations` VALUES ('4169', '龚滩镇', '379', '3');
INSERT INTO `t_locations` VALUES ('4170', '万足乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4171', '三义乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4172', '乔梓乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4173', '保家镇', '380', '3');
INSERT INTO `t_locations` VALUES ('4174', '双龙乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4175', '善感乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4176', '大垭乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4177', '太原乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4178', '小厂乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4179', '岩东乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4180', '平安乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4181', '新田乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4182', '普子镇', '380', '3');
INSERT INTO `t_locations` VALUES ('4183', '朗溪乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4184', '桐楼乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4185', '桑柘镇', '380', '3');
INSERT INTO `t_locations` VALUES ('4186', '梅子垭乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4187', '棣棠乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4188', '汉葭镇', '380', '3');
INSERT INTO `t_locations` VALUES ('4189', '润溪乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4190', '石柳乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4191', '石盘乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4192', '联合乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4193', '芦塘乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4194', '诸佛乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4195', '走马乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4196', '迁乔乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4197', '连湖镇', '380', '3');
INSERT INTO `t_locations` VALUES ('4198', '郁山镇', '380', '3');
INSERT INTO `t_locations` VALUES ('4199', '长滩乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4200', '靛水乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4201', '鞍子乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4202', '高谷镇', '380', '3');
INSERT INTO `t_locations` VALUES ('4203', '鹿角镇', '380', '3');
INSERT INTO `t_locations` VALUES ('4204', '鹿鸣乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4205', '黄家镇', '380', '3');
INSERT INTO `t_locations` VALUES ('4206', '龙塘乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4207', '龙射镇', '380', '3');
INSERT INTO `t_locations` VALUES ('4208', '龙溪乡', '380', '3');
INSERT INTO `t_locations` VALUES ('4209', '双流县', '385', '3');
INSERT INTO `t_locations` VALUES ('4210', '大邑县', '385', '3');
INSERT INTO `t_locations` VALUES ('4211', '崇州市', '385', '3');
INSERT INTO `t_locations` VALUES ('4212', '彭州市', '385', '3');
INSERT INTO `t_locations` VALUES ('4213', '成华区', '385', '3');
INSERT INTO `t_locations` VALUES ('4214', '新津县', '385', '3');
INSERT INTO `t_locations` VALUES ('4215', '新都区', '385', '3');
INSERT INTO `t_locations` VALUES ('4216', '武侯区', '385', '3');
INSERT INTO `t_locations` VALUES ('4217', '温江区', '385', '3');
INSERT INTO `t_locations` VALUES ('4218', '蒲江县', '385', '3');
INSERT INTO `t_locations` VALUES ('4219', '邛崃市', '385', '3');
INSERT INTO `t_locations` VALUES ('4220', '郫县', '385', '3');
INSERT INTO `t_locations` VALUES ('4221', '都江堰市', '385', '3');
INSERT INTO `t_locations` VALUES ('4222', '金堂县', '385', '3');
INSERT INTO `t_locations` VALUES ('4223', '金牛区', '385', '3');
INSERT INTO `t_locations` VALUES ('4224', '锦江区', '385', '3');
INSERT INTO `t_locations` VALUES ('4225', '青白江区', '385', '3');
INSERT INTO `t_locations` VALUES ('4226', '青羊区', '385', '3');
INSERT INTO `t_locations` VALUES ('4227', '龙泉驿区', '385', '3');
INSERT INTO `t_locations` VALUES ('4228', '大安区', '386', '3');
INSERT INTO `t_locations` VALUES ('4229', '富顺县', '386', '3');
INSERT INTO `t_locations` VALUES ('4230', '沿滩区', '386', '3');
INSERT INTO `t_locations` VALUES ('4231', '自流井区', '386', '3');
INSERT INTO `t_locations` VALUES ('4232', '荣县', '386', '3');
INSERT INTO `t_locations` VALUES ('4233', '贡井区', '386', '3');
INSERT INTO `t_locations` VALUES ('4234', '东区', '387', '3');
INSERT INTO `t_locations` VALUES ('4235', '仁和区', '387', '3');
INSERT INTO `t_locations` VALUES ('4236', '盐边县', '387', '3');
INSERT INTO `t_locations` VALUES ('4237', '米易县', '387', '3');
INSERT INTO `t_locations` VALUES ('4238', '西区', '387', '3');
INSERT INTO `t_locations` VALUES ('4239', '叙永县', '388', '3');
INSERT INTO `t_locations` VALUES ('4240', '古蔺县', '388', '3');
INSERT INTO `t_locations` VALUES ('4241', '合江县', '388', '3');
INSERT INTO `t_locations` VALUES ('4242', '江阳区', '388', '3');
INSERT INTO `t_locations` VALUES ('4243', '泸县', '388', '3');
INSERT INTO `t_locations` VALUES ('4244', '纳溪区', '388', '3');
INSERT INTO `t_locations` VALUES ('4245', '龙马潭区', '388', '3');
INSERT INTO `t_locations` VALUES ('4246', '中江县', '389', '3');
INSERT INTO `t_locations` VALUES ('4247', '什邡市', '389', '3');
INSERT INTO `t_locations` VALUES ('4248', '广汉市', '389', '3');
INSERT INTO `t_locations` VALUES ('4249', '旌阳区', '389', '3');
INSERT INTO `t_locations` VALUES ('4250', '绵竹市', '389', '3');
INSERT INTO `t_locations` VALUES ('4251', '罗江县', '389', '3');
INSERT INTO `t_locations` VALUES ('4252', '三台县', '390', '3');
INSERT INTO `t_locations` VALUES ('4253', '北川羌族自治县', '390', '3');
INSERT INTO `t_locations` VALUES ('4254', '安县', '390', '3');
INSERT INTO `t_locations` VALUES ('4255', '平武县', '390', '3');
INSERT INTO `t_locations` VALUES ('4256', '梓潼县', '390', '3');
INSERT INTO `t_locations` VALUES ('4257', '江油市', '390', '3');
INSERT INTO `t_locations` VALUES ('4258', '涪城区', '390', '3');
INSERT INTO `t_locations` VALUES ('4259', '游仙区', '390', '3');
INSERT INTO `t_locations` VALUES ('4260', '盐亭县', '390', '3');
INSERT INTO `t_locations` VALUES ('4261', '元坝区', '391', '3');
INSERT INTO `t_locations` VALUES ('4262', '利州区', '391', '3');
INSERT INTO `t_locations` VALUES ('4263', '剑阁县', '391', '3');
INSERT INTO `t_locations` VALUES ('4264', '旺苍县', '391', '3');
INSERT INTO `t_locations` VALUES ('4265', '朝天区', '391', '3');
INSERT INTO `t_locations` VALUES ('4266', '苍溪县', '391', '3');
INSERT INTO `t_locations` VALUES ('4267', '青川县', '391', '3');
INSERT INTO `t_locations` VALUES ('4268', '大英县', '392', '3');
INSERT INTO `t_locations` VALUES ('4269', '安居区', '392', '3');
INSERT INTO `t_locations` VALUES ('4270', '射洪县', '392', '3');
INSERT INTO `t_locations` VALUES ('4271', '船山区', '392', '3');
INSERT INTO `t_locations` VALUES ('4272', '蓬溪县', '392', '3');
INSERT INTO `t_locations` VALUES ('4273', '东兴区', '393', '3');
INSERT INTO `t_locations` VALUES ('4274', '威远县', '393', '3');
INSERT INTO `t_locations` VALUES ('4275', '市中区', '393', '3');
INSERT INTO `t_locations` VALUES ('4276', '资中县', '393', '3');
INSERT INTO `t_locations` VALUES ('4277', '隆昌县', '393', '3');
INSERT INTO `t_locations` VALUES ('4278', '五通桥区', '394', '3');
INSERT INTO `t_locations` VALUES ('4279', '井研县', '394', '3');
INSERT INTO `t_locations` VALUES ('4280', '夹江县', '394', '3');
INSERT INTO `t_locations` VALUES ('4281', '峨眉山市', '394', '3');
INSERT INTO `t_locations` VALUES ('4282', '峨边彝族自治县', '394', '3');
INSERT INTO `t_locations` VALUES ('4283', '市中区', '394', '3');
INSERT INTO `t_locations` VALUES ('4284', '沐川县', '394', '3');
INSERT INTO `t_locations` VALUES ('4285', '沙湾区', '394', '3');
INSERT INTO `t_locations` VALUES ('4286', '犍为县', '394', '3');
INSERT INTO `t_locations` VALUES ('4287', '金口河区', '394', '3');
INSERT INTO `t_locations` VALUES ('4288', '马边彝族自治县', '394', '3');
INSERT INTO `t_locations` VALUES ('4289', '仪陇县', '395', '3');
INSERT INTO `t_locations` VALUES ('4290', '南充市嘉陵区', '395', '3');
INSERT INTO `t_locations` VALUES ('4291', '南部县', '395', '3');
INSERT INTO `t_locations` VALUES ('4292', '嘉陵区', '395', '3');
INSERT INTO `t_locations` VALUES ('4293', '营山县', '395', '3');
INSERT INTO `t_locations` VALUES ('4294', '蓬安县', '395', '3');
INSERT INTO `t_locations` VALUES ('4295', '西充县', '395', '3');
INSERT INTO `t_locations` VALUES ('4296', '阆中市', '395', '3');
INSERT INTO `t_locations` VALUES ('4297', '顺庆区', '395', '3');
INSERT INTO `t_locations` VALUES ('4298', '高坪区', '395', '3');
INSERT INTO `t_locations` VALUES ('4299', '东坡区', '396', '3');
INSERT INTO `t_locations` VALUES ('4300', '丹棱县', '396', '3');
INSERT INTO `t_locations` VALUES ('4301', '仁寿县', '396', '3');
INSERT INTO `t_locations` VALUES ('4302', '彭山县', '396', '3');
INSERT INTO `t_locations` VALUES ('4303', '洪雅县', '396', '3');
INSERT INTO `t_locations` VALUES ('4304', '青神县', '396', '3');
INSERT INTO `t_locations` VALUES ('4305', '兴文县', '397', '3');
INSERT INTO `t_locations` VALUES ('4306', '南溪县', '397', '3');
INSERT INTO `t_locations` VALUES ('4307', '宜宾县', '397', '3');
INSERT INTO `t_locations` VALUES ('4308', '屏山县', '397', '3');
INSERT INTO `t_locations` VALUES ('4309', '江安县', '397', '3');
INSERT INTO `t_locations` VALUES ('4310', '珙县', '397', '3');
INSERT INTO `t_locations` VALUES ('4311', '筠连县', '397', '3');
INSERT INTO `t_locations` VALUES ('4312', '翠屏区', '397', '3');
INSERT INTO `t_locations` VALUES ('4313', '长宁县', '397', '3');
INSERT INTO `t_locations` VALUES ('4314', '高县', '397', '3');
INSERT INTO `t_locations` VALUES ('4315', '华蓥市', '398', '3');
INSERT INTO `t_locations` VALUES ('4316', '岳池县', '398', '3');
INSERT INTO `t_locations` VALUES ('4317', '广安区', '398', '3');
INSERT INTO `t_locations` VALUES ('4318', '武胜县', '398', '3');
INSERT INTO `t_locations` VALUES ('4319', '邻水县', '398', '3');
INSERT INTO `t_locations` VALUES ('4320', '万源市', '399', '3');
INSERT INTO `t_locations` VALUES ('4321', '大竹县', '399', '3');
INSERT INTO `t_locations` VALUES ('4322', '宣汉县', '399', '3');
INSERT INTO `t_locations` VALUES ('4323', '开江县', '399', '3');
INSERT INTO `t_locations` VALUES ('4324', '渠县', '399', '3');
INSERT INTO `t_locations` VALUES ('4325', '达县', '399', '3');
INSERT INTO `t_locations` VALUES ('4326', '通川区', '399', '3');
INSERT INTO `t_locations` VALUES ('4327', '名山县', '400', '3');
INSERT INTO `t_locations` VALUES ('4328', '天全县', '400', '3');
INSERT INTO `t_locations` VALUES ('4329', '宝兴县', '400', '3');
INSERT INTO `t_locations` VALUES ('4330', '汉源县', '400', '3');
INSERT INTO `t_locations` VALUES ('4331', '石棉县', '400', '3');
INSERT INTO `t_locations` VALUES ('4332', '芦山县', '400', '3');
INSERT INTO `t_locations` VALUES ('4333', '荥经县', '400', '3');
INSERT INTO `t_locations` VALUES ('4334', '雨城区', '400', '3');
INSERT INTO `t_locations` VALUES ('4335', '南江县', '401', '3');
INSERT INTO `t_locations` VALUES ('4336', '巴州区', '401', '3');
INSERT INTO `t_locations` VALUES ('4337', '平昌县', '401', '3');
INSERT INTO `t_locations` VALUES ('4338', '通江县', '401', '3');
INSERT INTO `t_locations` VALUES ('4339', '乐至县', '402', '3');
INSERT INTO `t_locations` VALUES ('4340', '安岳县', '402', '3');
INSERT INTO `t_locations` VALUES ('4341', '简阳市', '402', '3');
INSERT INTO `t_locations` VALUES ('4342', '雁江区', '402', '3');
INSERT INTO `t_locations` VALUES ('4343', '九寨沟县', '403', '3');
INSERT INTO `t_locations` VALUES ('4344', '壤塘县', '403', '3');
INSERT INTO `t_locations` VALUES ('4345', '小金县', '403', '3');
INSERT INTO `t_locations` VALUES ('4346', '松潘县', '403', '3');
INSERT INTO `t_locations` VALUES ('4347', '汶川县', '403', '3');
INSERT INTO `t_locations` VALUES ('4348', '理县', '403', '3');
INSERT INTO `t_locations` VALUES ('4349', '红原县', '403', '3');
INSERT INTO `t_locations` VALUES ('4350', '若尔盖县', '403', '3');
INSERT INTO `t_locations` VALUES ('4351', '茂县', '403', '3');
INSERT INTO `t_locations` VALUES ('4352', '金川县', '403', '3');
INSERT INTO `t_locations` VALUES ('4353', '阿坝县', '403', '3');
INSERT INTO `t_locations` VALUES ('4354', '马尔康县', '403', '3');
INSERT INTO `t_locations` VALUES ('4355', '黑水县', '403', '3');
INSERT INTO `t_locations` VALUES ('4356', '丹巴县', '404', '3');
INSERT INTO `t_locations` VALUES ('4357', '乡城县', '404', '3');
INSERT INTO `t_locations` VALUES ('4358', '巴塘县', '404', '3');
INSERT INTO `t_locations` VALUES ('4359', '康定县', '404', '3');
INSERT INTO `t_locations` VALUES ('4360', '得荣县', '404', '3');
INSERT INTO `t_locations` VALUES ('4361', '德格县', '404', '3');
INSERT INTO `t_locations` VALUES ('4362', '新龙县', '404', '3');
INSERT INTO `t_locations` VALUES ('4363', '泸定县', '404', '3');
INSERT INTO `t_locations` VALUES ('4364', '炉霍县', '404', '3');
INSERT INTO `t_locations` VALUES ('4365', '理塘县', '404', '3');
INSERT INTO `t_locations` VALUES ('4366', '甘孜县', '404', '3');
INSERT INTO `t_locations` VALUES ('4367', '白玉县', '404', '3');
INSERT INTO `t_locations` VALUES ('4368', '石渠县', '404', '3');
INSERT INTO `t_locations` VALUES ('4369', '稻城县', '404', '3');
INSERT INTO `t_locations` VALUES ('4370', '色达县', '404', '3');
INSERT INTO `t_locations` VALUES ('4371', '道孚县', '404', '3');
INSERT INTO `t_locations` VALUES ('4372', '雅江县', '404', '3');
INSERT INTO `t_locations` VALUES ('4373', '会东县', '405', '3');
INSERT INTO `t_locations` VALUES ('4374', '会理县', '405', '3');
INSERT INTO `t_locations` VALUES ('4375', '冕宁县', '405', '3');
INSERT INTO `t_locations` VALUES ('4376', '喜德县', '405', '3');
INSERT INTO `t_locations` VALUES ('4377', '宁南县', '405', '3');
INSERT INTO `t_locations` VALUES ('4378', '布拖县', '405', '3');
INSERT INTO `t_locations` VALUES ('4379', '德昌县', '405', '3');
INSERT INTO `t_locations` VALUES ('4380', '昭觉县', '405', '3');
INSERT INTO `t_locations` VALUES ('4381', '普格县', '405', '3');
INSERT INTO `t_locations` VALUES ('4382', '木里藏族自治县', '405', '3');
INSERT INTO `t_locations` VALUES ('4383', '甘洛县', '405', '3');
INSERT INTO `t_locations` VALUES ('4384', '盐源县', '405', '3');
INSERT INTO `t_locations` VALUES ('4385', '美姑县', '405', '3');
INSERT INTO `t_locations` VALUES ('4386', '西昌', '405', '3');
INSERT INTO `t_locations` VALUES ('4387', '越西县', '405', '3');
INSERT INTO `t_locations` VALUES ('4388', '金阳县', '405', '3');
INSERT INTO `t_locations` VALUES ('4389', '雷波县', '405', '3');
INSERT INTO `t_locations` VALUES ('4390', '乌当区', '406', '3');
INSERT INTO `t_locations` VALUES ('4391', '云岩区', '406', '3');
INSERT INTO `t_locations` VALUES ('4392', '修文县', '406', '3');
INSERT INTO `t_locations` VALUES ('4393', '南明区', '406', '3');
INSERT INTO `t_locations` VALUES ('4394', '小河区', '406', '3');
INSERT INTO `t_locations` VALUES ('4395', '开阳县', '406', '3');
INSERT INTO `t_locations` VALUES ('4396', '息烽县', '406', '3');
INSERT INTO `t_locations` VALUES ('4397', '清镇市', '406', '3');
INSERT INTO `t_locations` VALUES ('4398', '白云区', '406', '3');
INSERT INTO `t_locations` VALUES ('4399', '花溪区', '406', '3');
INSERT INTO `t_locations` VALUES ('4400', '六枝特区', '407', '3');
INSERT INTO `t_locations` VALUES ('4401', '水城县', '407', '3');
INSERT INTO `t_locations` VALUES ('4402', '盘县', '407', '3');
INSERT INTO `t_locations` VALUES ('4403', '钟山区', '407', '3');
INSERT INTO `t_locations` VALUES ('4404', '习水县', '408', '3');
INSERT INTO `t_locations` VALUES ('4405', '仁怀市', '408', '3');
INSERT INTO `t_locations` VALUES ('4406', '余庆县', '408', '3');
INSERT INTO `t_locations` VALUES ('4407', '凤冈县', '408', '3');
INSERT INTO `t_locations` VALUES ('4408', '务川仡佬族苗族自治县', '408', '3');
INSERT INTO `t_locations` VALUES ('4409', '桐梓县', '408', '3');
INSERT INTO `t_locations` VALUES ('4410', '正安县', '408', '3');
INSERT INTO `t_locations` VALUES ('4411', '汇川区', '408', '3');
INSERT INTO `t_locations` VALUES ('4412', '湄潭县', '408', '3');
INSERT INTO `t_locations` VALUES ('4413', '红花岗区', '408', '3');
INSERT INTO `t_locations` VALUES ('4414', '绥阳县', '408', '3');
INSERT INTO `t_locations` VALUES ('4415', '赤水市', '408', '3');
INSERT INTO `t_locations` VALUES ('4416', '道真仡佬族苗族自治县', '408', '3');
INSERT INTO `t_locations` VALUES ('4417', '遵义县', '408', '3');
INSERT INTO `t_locations` VALUES ('4418', '关岭布依族苗族自治县', '409', '3');
INSERT INTO `t_locations` VALUES ('4419', '平坝县', '409', '3');
INSERT INTO `t_locations` VALUES ('4420', '普定县', '409', '3');
INSERT INTO `t_locations` VALUES ('4421', '紫云苗族布依族自治县', '409', '3');
INSERT INTO `t_locations` VALUES ('4422', '西秀区', '409', '3');
INSERT INTO `t_locations` VALUES ('4423', '镇宁布依族苗族自治县', '409', '3');
INSERT INTO `t_locations` VALUES ('4424', '万山特区', '410', '3');
INSERT INTO `t_locations` VALUES ('4425', '印江土家族苗族自治县', '410', '3');
INSERT INTO `t_locations` VALUES ('4426', '德江县', '410', '3');
INSERT INTO `t_locations` VALUES ('4427', '思南县', '410', '3');
INSERT INTO `t_locations` VALUES ('4428', '松桃苗族自治县', '410', '3');
INSERT INTO `t_locations` VALUES ('4429', '江口县', '410', '3');
INSERT INTO `t_locations` VALUES ('4430', '沿河土家族自治县', '410', '3');
INSERT INTO `t_locations` VALUES ('4431', '玉屏侗族自治县', '410', '3');
INSERT INTO `t_locations` VALUES ('4432', '石阡县', '410', '3');
INSERT INTO `t_locations` VALUES ('4433', '铜仁市', '410', '3');
INSERT INTO `t_locations` VALUES ('4434', '兴义市', '411', '3');
INSERT INTO `t_locations` VALUES ('4435', '兴仁县', '411', '3');
INSERT INTO `t_locations` VALUES ('4436', '册亨县', '411', '3');
INSERT INTO `t_locations` VALUES ('4437', '安龙县', '411', '3');
INSERT INTO `t_locations` VALUES ('4438', '普安县', '411', '3');
INSERT INTO `t_locations` VALUES ('4439', '晴隆县', '411', '3');
INSERT INTO `t_locations` VALUES ('4440', '望谟县', '411', '3');
INSERT INTO `t_locations` VALUES ('4441', '贞丰县', '411', '3');
INSERT INTO `t_locations` VALUES ('4442', '大方县', '412', '3');
INSERT INTO `t_locations` VALUES ('4443', '威宁彝族回族苗族自治县', '412', '3');
INSERT INTO `t_locations` VALUES ('4444', '毕节市', '412', '3');
INSERT INTO `t_locations` VALUES ('4445', '纳雍县', '412', '3');
INSERT INTO `t_locations` VALUES ('4446', '织金县', '412', '3');
INSERT INTO `t_locations` VALUES ('4447', '赫章县', '412', '3');
INSERT INTO `t_locations` VALUES ('4448', '金沙县', '412', '3');
INSERT INTO `t_locations` VALUES ('4449', '黔西县', '412', '3');
INSERT INTO `t_locations` VALUES ('4450', '三穗县', '413', '3');
INSERT INTO `t_locations` VALUES ('4451', '丹寨县', '413', '3');
INSERT INTO `t_locations` VALUES ('4452', '从江县', '413', '3');
INSERT INTO `t_locations` VALUES ('4453', '凯里市', '413', '3');
INSERT INTO `t_locations` VALUES ('4454', '剑河县', '413', '3');
INSERT INTO `t_locations` VALUES ('4455', '台江县', '413', '3');
INSERT INTO `t_locations` VALUES ('4456', '天柱县', '413', '3');
INSERT INTO `t_locations` VALUES ('4457', '岑巩县', '413', '3');
INSERT INTO `t_locations` VALUES ('4458', '施秉县', '413', '3');
INSERT INTO `t_locations` VALUES ('4459', '榕江县', '413', '3');
INSERT INTO `t_locations` VALUES ('4460', '锦屏县', '413', '3');
INSERT INTO `t_locations` VALUES ('4461', '镇远县', '413', '3');
INSERT INTO `t_locations` VALUES ('4462', '雷山县', '413', '3');
INSERT INTO `t_locations` VALUES ('4463', '麻江县', '413', '3');
INSERT INTO `t_locations` VALUES ('4464', '黄平县', '413', '3');
INSERT INTO `t_locations` VALUES ('4465', '黎平县', '413', '3');
INSERT INTO `t_locations` VALUES ('4466', '三都水族自治县', '414', '3');
INSERT INTO `t_locations` VALUES ('4467', '平塘县', '414', '3');
INSERT INTO `t_locations` VALUES ('4468', '惠水县', '414', '3');
INSERT INTO `t_locations` VALUES ('4469', '独山县', '414', '3');
INSERT INTO `t_locations` VALUES ('4470', '瓮安县', '414', '3');
INSERT INTO `t_locations` VALUES ('4471', '福泉市', '414', '3');
INSERT INTO `t_locations` VALUES ('4472', '罗甸县', '414', '3');
INSERT INTO `t_locations` VALUES ('4473', '荔波县', '414', '3');
INSERT INTO `t_locations` VALUES ('4474', '贵定县', '414', '3');
INSERT INTO `t_locations` VALUES ('4475', '都匀市', '414', '3');
INSERT INTO `t_locations` VALUES ('4476', '长顺县', '414', '3');
INSERT INTO `t_locations` VALUES ('4477', '龙里县', '414', '3');
INSERT INTO `t_locations` VALUES ('4478', '东川区', '415', '3');
INSERT INTO `t_locations` VALUES ('4479', '五华区', '415', '3');
INSERT INTO `t_locations` VALUES ('4480', '呈贡县', '415', '3');
INSERT INTO `t_locations` VALUES ('4481', '安宁市', '415', '3');
INSERT INTO `t_locations` VALUES ('4482', '官渡区', '415', '3');
INSERT INTO `t_locations` VALUES ('4483', '宜良县', '415', '3');
INSERT INTO `t_locations` VALUES ('4484', '富民县', '415', '3');
INSERT INTO `t_locations` VALUES ('4485', '寻甸回族彝族自治县', '415', '3');
INSERT INTO `t_locations` VALUES ('4486', '嵩明县', '415', '3');
INSERT INTO `t_locations` VALUES ('4487', '晋宁县', '415', '3');
INSERT INTO `t_locations` VALUES ('4488', '盘龙区', '415', '3');
INSERT INTO `t_locations` VALUES ('4489', '石林彝族自治县', '415', '3');
INSERT INTO `t_locations` VALUES ('4490', '禄劝彝族苗族自治县', '415', '3');
INSERT INTO `t_locations` VALUES ('4491', '西山区', '415', '3');
INSERT INTO `t_locations` VALUES ('4492', '会泽县', '416', '3');
INSERT INTO `t_locations` VALUES ('4493', '宣威市', '416', '3');
INSERT INTO `t_locations` VALUES ('4494', '富源县', '416', '3');
INSERT INTO `t_locations` VALUES ('4495', '师宗县', '416', '3');
INSERT INTO `t_locations` VALUES ('4496', '沾益县', '416', '3');
INSERT INTO `t_locations` VALUES ('4497', '罗平县', '416', '3');
INSERT INTO `t_locations` VALUES ('4498', '陆良县', '416', '3');
INSERT INTO `t_locations` VALUES ('4499', '马龙县', '416', '3');
INSERT INTO `t_locations` VALUES ('4500', '麒麟区', '416', '3');
INSERT INTO `t_locations` VALUES ('4501', '元江哈尼族彝族傣族自治县', '417', '3');
INSERT INTO `t_locations` VALUES ('4502', '华宁县', '417', '3');
INSERT INTO `t_locations` VALUES ('4503', '峨山彝族自治县', '417', '3');
INSERT INTO `t_locations` VALUES ('4504', '新平彝族傣族自治县', '417', '3');
INSERT INTO `t_locations` VALUES ('4505', '易门县', '417', '3');
INSERT INTO `t_locations` VALUES ('4506', '江川县', '417', '3');
INSERT INTO `t_locations` VALUES ('4507', '澄江县', '417', '3');
INSERT INTO `t_locations` VALUES ('4508', '红塔区', '417', '3');
INSERT INTO `t_locations` VALUES ('4509', '通海县', '417', '3');
INSERT INTO `t_locations` VALUES ('4510', '施甸县', '418', '3');
INSERT INTO `t_locations` VALUES ('4511', '昌宁县', '418', '3');
INSERT INTO `t_locations` VALUES ('4512', '腾冲县', '418', '3');
INSERT INTO `t_locations` VALUES ('4513', '隆阳区', '418', '3');
INSERT INTO `t_locations` VALUES ('4514', '龙陵县', '418', '3');
INSERT INTO `t_locations` VALUES ('4515', '大关县', '419', '3');
INSERT INTO `t_locations` VALUES ('4516', '威信县', '419', '3');
INSERT INTO `t_locations` VALUES ('4517', '巧家县', '419', '3');
INSERT INTO `t_locations` VALUES ('4518', '彝良县', '419', '3');
INSERT INTO `t_locations` VALUES ('4519', '昭阳区', '419', '3');
INSERT INTO `t_locations` VALUES ('4520', '水富县', '419', '3');
INSERT INTO `t_locations` VALUES ('4521', '永善县', '419', '3');
INSERT INTO `t_locations` VALUES ('4522', '盐津县', '419', '3');
INSERT INTO `t_locations` VALUES ('4523', '绥江县', '419', '3');
INSERT INTO `t_locations` VALUES ('4524', '镇雄县', '419', '3');
INSERT INTO `t_locations` VALUES ('4525', '鲁甸县', '419', '3');
INSERT INTO `t_locations` VALUES ('4526', '华坪县', '420', '3');
INSERT INTO `t_locations` VALUES ('4527', '古城区', '420', '3');
INSERT INTO `t_locations` VALUES ('4528', '宁蒗彝族自治县', '420', '3');
INSERT INTO `t_locations` VALUES ('4529', '永胜县', '420', '3');
INSERT INTO `t_locations` VALUES ('4530', '玉龙纳西族自治县', '420', '3');
INSERT INTO `t_locations` VALUES ('4531', '临翔区', '422', '3');
INSERT INTO `t_locations` VALUES ('4532', '云县', '422', '3');
INSERT INTO `t_locations` VALUES ('4533', '凤庆县', '422', '3');
INSERT INTO `t_locations` VALUES ('4534', '双江拉祜族佤族布朗族傣族自治县', '422', '3');
INSERT INTO `t_locations` VALUES ('4535', '永德县', '422', '3');
INSERT INTO `t_locations` VALUES ('4536', '沧源佤族自治县', '422', '3');
INSERT INTO `t_locations` VALUES ('4537', '耿马傣族佤族自治县', '422', '3');
INSERT INTO `t_locations` VALUES ('4538', '镇康县', '422', '3');
INSERT INTO `t_locations` VALUES ('4539', '元谋县', '423', '3');
INSERT INTO `t_locations` VALUES ('4540', '南华县', '423', '3');
INSERT INTO `t_locations` VALUES ('4541', '双柏县', '423', '3');
INSERT INTO `t_locations` VALUES ('4542', '大姚县', '423', '3');
INSERT INTO `t_locations` VALUES ('4543', '姚安县', '423', '3');
INSERT INTO `t_locations` VALUES ('4544', '楚雄市', '423', '3');
INSERT INTO `t_locations` VALUES ('4545', '武定县', '423', '3');
INSERT INTO `t_locations` VALUES ('4546', '永仁县', '423', '3');
INSERT INTO `t_locations` VALUES ('4547', '牟定县', '423', '3');
INSERT INTO `t_locations` VALUES ('4548', '禄丰县', '423', '3');
INSERT INTO `t_locations` VALUES ('4549', '个旧市', '424', '3');
INSERT INTO `t_locations` VALUES ('4550', '元阳县', '424', '3');
INSERT INTO `t_locations` VALUES ('4551', '屏边苗族自治县', '424', '3');
INSERT INTO `t_locations` VALUES ('4552', '建水县', '424', '3');
INSERT INTO `t_locations` VALUES ('4553', '开远市', '424', '3');
INSERT INTO `t_locations` VALUES ('4554', '弥勒县', '424', '3');
INSERT INTO `t_locations` VALUES ('4555', '河口瑶族自治县', '424', '3');
INSERT INTO `t_locations` VALUES ('4556', '泸西县', '424', '3');
INSERT INTO `t_locations` VALUES ('4557', '石屏县', '424', '3');
INSERT INTO `t_locations` VALUES ('4558', '红河县', '424', '3');
INSERT INTO `t_locations` VALUES ('4559', '绿春县', '424', '3');
INSERT INTO `t_locations` VALUES ('4560', '蒙自县', '424', '3');
INSERT INTO `t_locations` VALUES ('4561', '金平苗族瑶族傣族自治县', '424', '3');
INSERT INTO `t_locations` VALUES ('4562', '丘北县', '425', '3');
INSERT INTO `t_locations` VALUES ('4563', '富宁县', '425', '3');
INSERT INTO `t_locations` VALUES ('4564', '广南县', '425', '3');
INSERT INTO `t_locations` VALUES ('4565', '文山县', '425', '3');
INSERT INTO `t_locations` VALUES ('4566', '砚山县', '425', '3');
INSERT INTO `t_locations` VALUES ('4567', '西畴县', '425', '3');
INSERT INTO `t_locations` VALUES ('4568', '马关县', '425', '3');
INSERT INTO `t_locations` VALUES ('4569', '麻栗坡县', '425', '3');
INSERT INTO `t_locations` VALUES ('4570', '勐海县', '426', '3');
INSERT INTO `t_locations` VALUES ('4571', '勐腊县', '426', '3');
INSERT INTO `t_locations` VALUES ('4572', '景洪市', '426', '3');
INSERT INTO `t_locations` VALUES ('4573', '云龙县', '427', '3');
INSERT INTO `t_locations` VALUES ('4574', '剑川县', '427', '3');
INSERT INTO `t_locations` VALUES ('4575', '南涧彝族自治县', '427', '3');
INSERT INTO `t_locations` VALUES ('4576', '大理市', '427', '3');
INSERT INTO `t_locations` VALUES ('4577', '宾川县', '427', '3');
INSERT INTO `t_locations` VALUES ('4578', '巍山彝族回族自治县', '427', '3');
INSERT INTO `t_locations` VALUES ('4579', '弥渡县', '427', '3');
INSERT INTO `t_locations` VALUES ('4580', '永平县', '427', '3');
INSERT INTO `t_locations` VALUES ('4581', '洱源县', '427', '3');
INSERT INTO `t_locations` VALUES ('4582', '漾濞彝族自治县', '427', '3');
INSERT INTO `t_locations` VALUES ('4583', '祥云县', '427', '3');
INSERT INTO `t_locations` VALUES ('4584', '鹤庆县', '427', '3');
INSERT INTO `t_locations` VALUES ('4585', '梁河县', '428', '3');
INSERT INTO `t_locations` VALUES ('4586', '潞西市', '428', '3');
INSERT INTO `t_locations` VALUES ('4587', '瑞丽市', '428', '3');
INSERT INTO `t_locations` VALUES ('4588', '盈江县', '428', '3');
INSERT INTO `t_locations` VALUES ('4589', '陇川县', '428', '3');
INSERT INTO `t_locations` VALUES ('4590', '德钦县', '430', '3');
INSERT INTO `t_locations` VALUES ('4591', '维西傈僳族自治县', '430', '3');
INSERT INTO `t_locations` VALUES ('4592', '香格里拉县', '430', '3');
INSERT INTO `t_locations` VALUES ('4593', '城关区', '431', '3');
INSERT INTO `t_locations` VALUES ('4594', '堆龙德庆县', '431', '3');
INSERT INTO `t_locations` VALUES ('4595', '墨竹工卡县', '431', '3');
INSERT INTO `t_locations` VALUES ('4596', '尼木县', '431', '3');
INSERT INTO `t_locations` VALUES ('4597', '当雄县', '431', '3');
INSERT INTO `t_locations` VALUES ('4598', '曲水县', '431', '3');
INSERT INTO `t_locations` VALUES ('4599', '林周县', '431', '3');
INSERT INTO `t_locations` VALUES ('4600', '达孜县', '431', '3');
INSERT INTO `t_locations` VALUES ('4601', '丁青县', '432', '3');
INSERT INTO `t_locations` VALUES ('4602', '八宿县', '432', '3');
INSERT INTO `t_locations` VALUES ('4603', '察雅县', '432', '3');
INSERT INTO `t_locations` VALUES ('4604', '左贡县', '432', '3');
INSERT INTO `t_locations` VALUES ('4605', '昌都县', '432', '3');
INSERT INTO `t_locations` VALUES ('4606', '江达县', '432', '3');
INSERT INTO `t_locations` VALUES ('4607', '洛隆县', '432', '3');
INSERT INTO `t_locations` VALUES ('4608', '类乌齐县', '432', '3');
INSERT INTO `t_locations` VALUES ('4609', '芒康县', '432', '3');
INSERT INTO `t_locations` VALUES ('4610', '贡觉县', '432', '3');
INSERT INTO `t_locations` VALUES ('4611', '边坝县', '432', '3');
INSERT INTO `t_locations` VALUES ('4612', '乃东县', '433', '3');
INSERT INTO `t_locations` VALUES ('4613', '加查县', '433', '3');
INSERT INTO `t_locations` VALUES ('4614', '扎囊县', '433', '3');
INSERT INTO `t_locations` VALUES ('4615', '措美县', '433', '3');
INSERT INTO `t_locations` VALUES ('4616', '曲松县', '433', '3');
INSERT INTO `t_locations` VALUES ('4617', '桑日县', '433', '3');
INSERT INTO `t_locations` VALUES ('4618', '洛扎县', '433', '3');
INSERT INTO `t_locations` VALUES ('4619', '浪卡子县', '433', '3');
INSERT INTO `t_locations` VALUES ('4620', '琼结县', '433', '3');
INSERT INTO `t_locations` VALUES ('4621', '贡嘎县', '433', '3');
INSERT INTO `t_locations` VALUES ('4622', '错那县', '433', '3');
INSERT INTO `t_locations` VALUES ('4623', '隆子县', '433', '3');
INSERT INTO `t_locations` VALUES ('4624', '亚东县', '434', '3');
INSERT INTO `t_locations` VALUES ('4625', '仁布县', '434', '3');
INSERT INTO `t_locations` VALUES ('4626', '仲巴县', '434', '3');
INSERT INTO `t_locations` VALUES ('4627', '南木林县', '434', '3');
INSERT INTO `t_locations` VALUES ('4628', '吉隆县', '434', '3');
INSERT INTO `t_locations` VALUES ('4629', '定日县', '434', '3');
INSERT INTO `t_locations` VALUES ('4630', '定结县', '434', '3');
INSERT INTO `t_locations` VALUES ('4631', '岗巴县', '434', '3');
INSERT INTO `t_locations` VALUES ('4632', '康马县', '434', '3');
INSERT INTO `t_locations` VALUES ('4633', '拉孜县', '434', '3');
INSERT INTO `t_locations` VALUES ('4634', '日喀则市', '434', '3');
INSERT INTO `t_locations` VALUES ('4635', '昂仁县', '434', '3');
INSERT INTO `t_locations` VALUES ('4636', '江孜县', '434', '3');
INSERT INTO `t_locations` VALUES ('4637', '白朗县', '434', '3');
INSERT INTO `t_locations` VALUES ('4638', '聂拉木县', '434', '3');
INSERT INTO `t_locations` VALUES ('4639', '萨嘎县', '434', '3');
INSERT INTO `t_locations` VALUES ('4640', '萨迦县', '434', '3');
INSERT INTO `t_locations` VALUES ('4641', '谢通门县', '434', '3');
INSERT INTO `t_locations` VALUES ('4642', '嘉黎县', '435', '3');
INSERT INTO `t_locations` VALUES ('4643', '安多县', '435', '3');
INSERT INTO `t_locations` VALUES ('4644', '尼玛县', '435', '3');
INSERT INTO `t_locations` VALUES ('4645', '巴青县', '435', '3');
INSERT INTO `t_locations` VALUES ('4646', '比如县', '435', '3');
INSERT INTO `t_locations` VALUES ('4647', '班戈县', '435', '3');
INSERT INTO `t_locations` VALUES ('4648', '申扎县', '435', '3');
INSERT INTO `t_locations` VALUES ('4649', '索县', '435', '3');
INSERT INTO `t_locations` VALUES ('4650', '聂荣县', '435', '3');
INSERT INTO `t_locations` VALUES ('4651', '那曲县', '435', '3');
INSERT INTO `t_locations` VALUES ('4652', '噶尔县', '436', '3');
INSERT INTO `t_locations` VALUES ('4653', '措勤县', '436', '3');
INSERT INTO `t_locations` VALUES ('4654', '改则县', '436', '3');
INSERT INTO `t_locations` VALUES ('4655', '日土县', '436', '3');
INSERT INTO `t_locations` VALUES ('4656', '普兰县', '436', '3');
INSERT INTO `t_locations` VALUES ('4657', '札达县', '436', '3');
INSERT INTO `t_locations` VALUES ('4658', '革吉县', '436', '3');
INSERT INTO `t_locations` VALUES ('4659', '墨脱县', '437', '3');
INSERT INTO `t_locations` VALUES ('4660', '察隅县', '437', '3');
INSERT INTO `t_locations` VALUES ('4661', '工布江达县', '437', '3');
INSERT INTO `t_locations` VALUES ('4662', '朗县', '437', '3');
INSERT INTO `t_locations` VALUES ('4663', '林芝县', '437', '3');
INSERT INTO `t_locations` VALUES ('4664', '波密县', '437', '3');
INSERT INTO `t_locations` VALUES ('4665', '米林县', '437', '3');
INSERT INTO `t_locations` VALUES ('4666', '临潼区', '438', '3');
INSERT INTO `t_locations` VALUES ('4667', '周至县', '438', '3');
INSERT INTO `t_locations` VALUES ('4668', '户县', '438', '3');
INSERT INTO `t_locations` VALUES ('4669', '新城区', '438', '3');
INSERT INTO `t_locations` VALUES ('4670', '未央区', '438', '3');
INSERT INTO `t_locations` VALUES ('4671', '灞桥区', '438', '3');
INSERT INTO `t_locations` VALUES ('4672', '碑林区', '438', '3');
INSERT INTO `t_locations` VALUES ('4673', '莲湖区', '438', '3');
INSERT INTO `t_locations` VALUES ('4674', '蓝田县', '438', '3');
INSERT INTO `t_locations` VALUES ('4675', '长安区', '438', '3');
INSERT INTO `t_locations` VALUES ('4676', '阎良区', '438', '3');
INSERT INTO `t_locations` VALUES ('4677', '雁塔区', '438', '3');
INSERT INTO `t_locations` VALUES ('4678', '高陵县', '438', '3');
INSERT INTO `t_locations` VALUES ('4679', '印台区', '439', '3');
INSERT INTO `t_locations` VALUES ('4680', '宜君县', '439', '3');
INSERT INTO `t_locations` VALUES ('4681', '王益区', '439', '3');
INSERT INTO `t_locations` VALUES ('4682', '耀州区', '439', '3');
INSERT INTO `t_locations` VALUES ('4683', '凤县', '440', '3');
INSERT INTO `t_locations` VALUES ('4684', '凤翔县', '440', '3');
INSERT INTO `t_locations` VALUES ('4685', '千阳县', '440', '3');
INSERT INTO `t_locations` VALUES ('4686', '太白县', '440', '3');
INSERT INTO `t_locations` VALUES ('4687', '岐山县', '440', '3');
INSERT INTO `t_locations` VALUES ('4688', '扶风县', '440', '3');
INSERT INTO `t_locations` VALUES ('4689', '渭滨区', '440', '3');
INSERT INTO `t_locations` VALUES ('4690', '眉县', '440', '3');
INSERT INTO `t_locations` VALUES ('4691', '金台区', '440', '3');
INSERT INTO `t_locations` VALUES ('4692', '陇县', '440', '3');
INSERT INTO `t_locations` VALUES ('4693', '陈仓区', '440', '3');
INSERT INTO `t_locations` VALUES ('4694', '麟游县', '440', '3');
INSERT INTO `t_locations` VALUES ('4695', '三原县', '441', '3');
INSERT INTO `t_locations` VALUES ('4696', '干县', '441', '3');
INSERT INTO `t_locations` VALUES ('4697', '兴平市', '441', '3');
INSERT INTO `t_locations` VALUES ('4698', '彬县', '441', '3');
INSERT INTO `t_locations` VALUES ('4699', '旬邑县', '441', '3');
INSERT INTO `t_locations` VALUES ('4700', '杨陵区', '441', '3');
INSERT INTO `t_locations` VALUES ('4701', '武功县', '441', '3');
INSERT INTO `t_locations` VALUES ('4702', '永寿县', '441', '3');
INSERT INTO `t_locations` VALUES ('4703', '泾阳县', '441', '3');
INSERT INTO `t_locations` VALUES ('4704', '淳化县', '441', '3');
INSERT INTO `t_locations` VALUES ('4705', '渭城区', '441', '3');
INSERT INTO `t_locations` VALUES ('4706', '礼泉县', '441', '3');
INSERT INTO `t_locations` VALUES ('4707', '秦都区', '441', '3');
INSERT INTO `t_locations` VALUES ('4708', '长武县', '441', '3');
INSERT INTO `t_locations` VALUES ('4709', '临渭区', '442', '3');
INSERT INTO `t_locations` VALUES ('4710', '华县', '442', '3');
INSERT INTO `t_locations` VALUES ('4711', '华阴市', '442', '3');
INSERT INTO `t_locations` VALUES ('4712', '合阳县', '442', '3');
INSERT INTO `t_locations` VALUES ('4713', '大荔县', '442', '3');
INSERT INTO `t_locations` VALUES ('4714', '富平县', '442', '3');
INSERT INTO `t_locations` VALUES ('4715', '潼关县', '442', '3');
INSERT INTO `t_locations` VALUES ('4716', '澄城县', '442', '3');
INSERT INTO `t_locations` VALUES ('4717', '白水县', '442', '3');
INSERT INTO `t_locations` VALUES ('4718', '蒲城县', '442', '3');
INSERT INTO `t_locations` VALUES ('4719', '韩城市', '442', '3');
INSERT INTO `t_locations` VALUES ('4720', '吴起县', '443', '3');
INSERT INTO `t_locations` VALUES ('4721', '子长县', '443', '3');
INSERT INTO `t_locations` VALUES ('4722', '安塞县', '443', '3');
INSERT INTO `t_locations` VALUES ('4723', '宜川县', '443', '3');
INSERT INTO `t_locations` VALUES ('4724', '宝塔区', '443', '3');
INSERT INTO `t_locations` VALUES ('4725', '富县', '443', '3');
INSERT INTO `t_locations` VALUES ('4726', '延川县', '443', '3');
INSERT INTO `t_locations` VALUES ('4727', '延长县', '443', '3');
INSERT INTO `t_locations` VALUES ('4728', '志丹县', '443', '3');
INSERT INTO `t_locations` VALUES ('4729', '洛川县', '443', '3');
INSERT INTO `t_locations` VALUES ('4730', '甘泉县', '443', '3');
INSERT INTO `t_locations` VALUES ('4731', '黄陵县', '443', '3');
INSERT INTO `t_locations` VALUES ('4732', '黄龙县', '443', '3');
INSERT INTO `t_locations` VALUES ('4733', '佛坪县', '444', '3');
INSERT INTO `t_locations` VALUES ('4734', '勉县', '444', '3');
INSERT INTO `t_locations` VALUES ('4735', '南郑县', '444', '3');
INSERT INTO `t_locations` VALUES ('4736', '城固县', '444', '3');
INSERT INTO `t_locations` VALUES ('4737', '宁强县', '444', '3');
INSERT INTO `t_locations` VALUES ('4738', '汉台区', '444', '3');
INSERT INTO `t_locations` VALUES ('4739', '洋县', '444', '3');
INSERT INTO `t_locations` VALUES ('4740', '留坝县', '444', '3');
INSERT INTO `t_locations` VALUES ('4741', '略阳县', '444', '3');
INSERT INTO `t_locations` VALUES ('4742', '西乡县', '444', '3');
INSERT INTO `t_locations` VALUES ('4743', '镇巴县', '444', '3');
INSERT INTO `t_locations` VALUES ('4744', '佳县', '445', '3');
INSERT INTO `t_locations` VALUES ('4745', '吴堡县', '445', '3');
INSERT INTO `t_locations` VALUES ('4746', '子洲县', '445', '3');
INSERT INTO `t_locations` VALUES ('4747', '定边县', '445', '3');
INSERT INTO `t_locations` VALUES ('4748', '府谷县', '445', '3');
INSERT INTO `t_locations` VALUES ('4749', '榆林市榆阳区', '445', '3');
INSERT INTO `t_locations` VALUES ('4750', '横山县', '445', '3');
INSERT INTO `t_locations` VALUES ('4751', '清涧县', '445', '3');
INSERT INTO `t_locations` VALUES ('4752', '神木县', '445', '3');
INSERT INTO `t_locations` VALUES ('4753', '米脂县', '445', '3');
INSERT INTO `t_locations` VALUES ('4754', '绥德县', '445', '3');
INSERT INTO `t_locations` VALUES ('4755', '靖边县', '445', '3');
INSERT INTO `t_locations` VALUES ('4756', '宁陕县', '446', '3');
INSERT INTO `t_locations` VALUES ('4757', '岚皋县', '446', '3');
INSERT INTO `t_locations` VALUES ('4758', '平利县', '446', '3');
INSERT INTO `t_locations` VALUES ('4759', '旬阳县', '446', '3');
INSERT INTO `t_locations` VALUES ('4760', '汉滨区', '446', '3');
INSERT INTO `t_locations` VALUES ('4761', '汉阴县', '446', '3');
INSERT INTO `t_locations` VALUES ('4762', '白河县', '446', '3');
INSERT INTO `t_locations` VALUES ('4763', '石泉县', '446', '3');
INSERT INTO `t_locations` VALUES ('4764', '紫阳县', '446', '3');
INSERT INTO `t_locations` VALUES ('4765', '镇坪县', '446', '3');
INSERT INTO `t_locations` VALUES ('4766', '丹凤县', '447', '3');
INSERT INTO `t_locations` VALUES ('4767', '商南县', '447', '3');
INSERT INTO `t_locations` VALUES ('4768', '商州区', '447', '3');
INSERT INTO `t_locations` VALUES ('4769', '山阳县', '447', '3');
INSERT INTO `t_locations` VALUES ('4770', '柞水县', '447', '3');
INSERT INTO `t_locations` VALUES ('4771', '洛南县', '447', '3');
INSERT INTO `t_locations` VALUES ('4772', '镇安县', '447', '3');
INSERT INTO `t_locations` VALUES ('4773', '七里河区', '448', '3');
INSERT INTO `t_locations` VALUES ('4774', '城关区', '448', '3');
INSERT INTO `t_locations` VALUES ('4775', '安宁区', '448', '3');
INSERT INTO `t_locations` VALUES ('4776', '榆中县', '448', '3');
INSERT INTO `t_locations` VALUES ('4777', '永登县', '448', '3');
INSERT INTO `t_locations` VALUES ('4778', '皋兰县', '448', '3');
INSERT INTO `t_locations` VALUES ('4779', '红古区', '448', '3');
INSERT INTO `t_locations` VALUES ('4780', '西固区', '448', '3');
INSERT INTO `t_locations` VALUES ('4781', '嘉峪关市', '449', '3');
INSERT INTO `t_locations` VALUES ('4782', '永昌县', '450', '3');
INSERT INTO `t_locations` VALUES ('4783', '金川区', '450', '3');
INSERT INTO `t_locations` VALUES ('4784', '会宁县', '451', '3');
INSERT INTO `t_locations` VALUES ('4785', '平川区', '451', '3');
INSERT INTO `t_locations` VALUES ('4786', '景泰县', '451', '3');
INSERT INTO `t_locations` VALUES ('4787', '白银区', '451', '3');
INSERT INTO `t_locations` VALUES ('4788', '靖远县', '451', '3');
INSERT INTO `t_locations` VALUES ('4789', '张家川回族自治县', '452', '3');
INSERT INTO `t_locations` VALUES ('4790', '武山县', '452', '3');
INSERT INTO `t_locations` VALUES ('4791', '清水县', '452', '3');
INSERT INTO `t_locations` VALUES ('4792', '甘谷县', '452', '3');
INSERT INTO `t_locations` VALUES ('4793', '秦安县', '452', '3');
INSERT INTO `t_locations` VALUES ('4794', '秦州区', '452', '3');
INSERT INTO `t_locations` VALUES ('4795', '麦积区', '452', '3');
INSERT INTO `t_locations` VALUES ('4796', '凉州区', '453', '3');
INSERT INTO `t_locations` VALUES ('4797', '古浪县', '453', '3');
INSERT INTO `t_locations` VALUES ('4798', '天祝藏族自治县', '453', '3');
INSERT INTO `t_locations` VALUES ('4799', '民勤县', '453', '3');
INSERT INTO `t_locations` VALUES ('4800', '临泽县', '454', '3');
INSERT INTO `t_locations` VALUES ('4801', '山丹县', '454', '3');
INSERT INTO `t_locations` VALUES ('4802', '民乐县', '454', '3');
INSERT INTO `t_locations` VALUES ('4803', '甘州区', '454', '3');
INSERT INTO `t_locations` VALUES ('4804', '肃南裕固族自治县', '454', '3');
INSERT INTO `t_locations` VALUES ('4805', '高台县', '454', '3');
INSERT INTO `t_locations` VALUES ('4806', '华亭县', '455', '3');
INSERT INTO `t_locations` VALUES ('4807', '崆峒区', '455', '3');
INSERT INTO `t_locations` VALUES ('4808', '崇信县', '455', '3');
INSERT INTO `t_locations` VALUES ('4809', '庄浪县', '455', '3');
INSERT INTO `t_locations` VALUES ('4810', '泾川县', '455', '3');
INSERT INTO `t_locations` VALUES ('4811', '灵台县', '455', '3');
INSERT INTO `t_locations` VALUES ('4812', '静宁县', '455', '3');
INSERT INTO `t_locations` VALUES ('4813', '敦煌市', '456', '3');
INSERT INTO `t_locations` VALUES ('4814', '玉门市', '456', '3');
INSERT INTO `t_locations` VALUES ('4815', '瓜州县（原安西县）', '456', '3');
INSERT INTO `t_locations` VALUES ('4816', '肃北蒙古族自治县', '456', '3');
INSERT INTO `t_locations` VALUES ('4817', '肃州区', '456', '3');
INSERT INTO `t_locations` VALUES ('4818', '金塔县', '456', '3');
INSERT INTO `t_locations` VALUES ('4819', '阿克塞哈萨克族自治县', '456', '3');
INSERT INTO `t_locations` VALUES ('4820', '华池县', '457', '3');
INSERT INTO `t_locations` VALUES ('4821', '合水县', '457', '3');
INSERT INTO `t_locations` VALUES ('4822', '宁县', '457', '3');
INSERT INTO `t_locations` VALUES ('4823', '庆城县', '457', '3');
INSERT INTO `t_locations` VALUES ('4824', '正宁县', '457', '3');
INSERT INTO `t_locations` VALUES ('4825', '环县', '457', '3');
INSERT INTO `t_locations` VALUES ('4826', '西峰区', '457', '3');
INSERT INTO `t_locations` VALUES ('4827', '镇原县', '457', '3');
INSERT INTO `t_locations` VALUES ('4828', '临洮县', '458', '3');
INSERT INTO `t_locations` VALUES ('4829', '安定区', '458', '3');
INSERT INTO `t_locations` VALUES ('4830', '岷县', '458', '3');
INSERT INTO `t_locations` VALUES ('4831', '渭源县', '458', '3');
INSERT INTO `t_locations` VALUES ('4832', '漳县', '458', '3');
INSERT INTO `t_locations` VALUES ('4833', '通渭县', '458', '3');
INSERT INTO `t_locations` VALUES ('4834', '陇西县', '458', '3');
INSERT INTO `t_locations` VALUES ('4835', '两当县', '459', '3');
INSERT INTO `t_locations` VALUES ('4836', '宕昌县', '459', '3');
INSERT INTO `t_locations` VALUES ('4837', '康县', '459', '3');
INSERT INTO `t_locations` VALUES ('4838', '徽县', '459', '3');
INSERT INTO `t_locations` VALUES ('4839', '成县', '459', '3');
INSERT INTO `t_locations` VALUES ('4840', '文县', '459', '3');
INSERT INTO `t_locations` VALUES ('4841', '武都区', '459', '3');
INSERT INTO `t_locations` VALUES ('4842', '礼县', '459', '3');
INSERT INTO `t_locations` VALUES ('4843', '西和县', '459', '3');
INSERT INTO `t_locations` VALUES ('4844', '东乡族自治县', '460', '3');
INSERT INTO `t_locations` VALUES ('4845', '临夏县', '460', '3');
INSERT INTO `t_locations` VALUES ('4846', '临夏市', '460', '3');
INSERT INTO `t_locations` VALUES ('4847', '和政县', '460', '3');
INSERT INTO `t_locations` VALUES ('4848', '广河县', '460', '3');
INSERT INTO `t_locations` VALUES ('4849', '康乐县', '460', '3');
INSERT INTO `t_locations` VALUES ('4850', '永靖县', '460', '3');
INSERT INTO `t_locations` VALUES ('4851', '积石山保安族东乡族撒拉族自治县', '460', '3');
INSERT INTO `t_locations` VALUES ('4852', '临潭县', '461', '3');
INSERT INTO `t_locations` VALUES ('4853', '卓尼县', '461', '3');
INSERT INTO `t_locations` VALUES ('4854', '合作市', '461', '3');
INSERT INTO `t_locations` VALUES ('4855', '夏河县', '461', '3');
INSERT INTO `t_locations` VALUES ('4856', '玛曲县', '461', '3');
INSERT INTO `t_locations` VALUES ('4857', '碌曲县', '461', '3');
INSERT INTO `t_locations` VALUES ('4858', '舟曲县', '461', '3');
INSERT INTO `t_locations` VALUES ('4859', '迭部县', '461', '3');
INSERT INTO `t_locations` VALUES ('4860', '城东区', '462', '3');
INSERT INTO `t_locations` VALUES ('4861', '城中区', '462', '3');
INSERT INTO `t_locations` VALUES ('4862', '城北区', '462', '3');
INSERT INTO `t_locations` VALUES ('4863', '城西区', '462', '3');
INSERT INTO `t_locations` VALUES ('4864', '大通回族土族自治县', '462', '3');
INSERT INTO `t_locations` VALUES ('4865', '湟中县', '462', '3');
INSERT INTO `t_locations` VALUES ('4866', '湟源县', '462', '3');
INSERT INTO `t_locations` VALUES ('4867', '乐都县', '463', '3');
INSERT INTO `t_locations` VALUES ('4868', '互助土族自治县', '463', '3');
INSERT INTO `t_locations` VALUES ('4869', '化隆回族自治县', '463', '3');
INSERT INTO `t_locations` VALUES ('4870', '平安县', '463', '3');
INSERT INTO `t_locations` VALUES ('4871', '循化撒拉族自治县', '463', '3');
INSERT INTO `t_locations` VALUES ('4872', '民和回族土族自治县', '463', '3');
INSERT INTO `t_locations` VALUES ('4873', '刚察县', '464', '3');
INSERT INTO `t_locations` VALUES ('4874', '海晏县', '464', '3');
INSERT INTO `t_locations` VALUES ('4875', '祁连县', '464', '3');
INSERT INTO `t_locations` VALUES ('4876', '门源回族自治县', '464', '3');
INSERT INTO `t_locations` VALUES ('4877', '同仁县', '465', '3');
INSERT INTO `t_locations` VALUES ('4878', '尖扎县', '465', '3');
INSERT INTO `t_locations` VALUES ('4879', '河南蒙古族自治县', '465', '3');
INSERT INTO `t_locations` VALUES ('4880', '泽库县', '465', '3');
INSERT INTO `t_locations` VALUES ('4881', '共和县', '466', '3');
INSERT INTO `t_locations` VALUES ('4882', '兴海县', '466', '3');
INSERT INTO `t_locations` VALUES ('4883', '同德县', '466', '3');
INSERT INTO `t_locations` VALUES ('4884', '贵南县', '466', '3');
INSERT INTO `t_locations` VALUES ('4885', '贵德县', '466', '3');
INSERT INTO `t_locations` VALUES ('4886', '久治县', '467', '3');
INSERT INTO `t_locations` VALUES ('4887', '玛多县', '467', '3');
INSERT INTO `t_locations` VALUES ('4888', '玛沁县', '467', '3');
INSERT INTO `t_locations` VALUES ('4889', '班玛县', '467', '3');
INSERT INTO `t_locations` VALUES ('4890', '甘德县', '467', '3');
INSERT INTO `t_locations` VALUES ('4891', '达日县', '467', '3');
INSERT INTO `t_locations` VALUES ('4892', '囊谦县', '468', '3');
INSERT INTO `t_locations` VALUES ('4893', '曲麻莱县', '468', '3');
INSERT INTO `t_locations` VALUES ('4894', '杂多县', '468', '3');
INSERT INTO `t_locations` VALUES ('4895', '治多县', '468', '3');
INSERT INTO `t_locations` VALUES ('4896', '玉树县', '468', '3');
INSERT INTO `t_locations` VALUES ('4897', '称多县', '468', '3');
INSERT INTO `t_locations` VALUES ('4898', '乌兰县', '469', '3');
INSERT INTO `t_locations` VALUES ('4899', '冷湖行委', '469', '3');
INSERT INTO `t_locations` VALUES ('4900', '大柴旦行委', '469', '3');
INSERT INTO `t_locations` VALUES ('4901', '天峻县', '469', '3');
INSERT INTO `t_locations` VALUES ('4902', '德令哈市', '469', '3');
INSERT INTO `t_locations` VALUES ('4903', '格尔木市', '469', '3');
INSERT INTO `t_locations` VALUES ('4904', '茫崖行委', '469', '3');
INSERT INTO `t_locations` VALUES ('4905', '都兰县', '469', '3');
INSERT INTO `t_locations` VALUES ('4906', '兴庆区', '470', '3');
INSERT INTO `t_locations` VALUES ('4907', '永宁县', '470', '3');
INSERT INTO `t_locations` VALUES ('4908', '灵武市', '470', '3');
INSERT INTO `t_locations` VALUES ('4909', '西夏区', '470', '3');
INSERT INTO `t_locations` VALUES ('4910', '贺兰县', '470', '3');
INSERT INTO `t_locations` VALUES ('4911', '金凤区', '470', '3');
INSERT INTO `t_locations` VALUES ('4912', '大武口区', '471', '3');
INSERT INTO `t_locations` VALUES ('4913', '平罗县', '471', '3');
INSERT INTO `t_locations` VALUES ('4914', '惠农区', '471', '3');
INSERT INTO `t_locations` VALUES ('4915', '利通区', '472', '3');
INSERT INTO `t_locations` VALUES ('4916', '同心县', '472', '3');
INSERT INTO `t_locations` VALUES ('4917', '盐池县', '472', '3');
INSERT INTO `t_locations` VALUES ('4918', '青铜峡市', '472', '3');
INSERT INTO `t_locations` VALUES ('4919', '原州区', '473', '3');
INSERT INTO `t_locations` VALUES ('4920', '彭阳县', '473', '3');
INSERT INTO `t_locations` VALUES ('4921', '泾源县', '473', '3');
INSERT INTO `t_locations` VALUES ('4922', '西吉县', '473', '3');
INSERT INTO `t_locations` VALUES ('4923', '隆德县', '473', '3');
INSERT INTO `t_locations` VALUES ('4924', '中宁县', '474', '3');
INSERT INTO `t_locations` VALUES ('4925', '沙坡头区', '474', '3');
INSERT INTO `t_locations` VALUES ('4926', '海原县', '474', '3');
INSERT INTO `t_locations` VALUES ('4927', '东山区', '475', '3');
INSERT INTO `t_locations` VALUES ('4928', '乌鲁木齐县', '475', '3');
INSERT INTO `t_locations` VALUES ('4929', '天山区', '475', '3');
INSERT INTO `t_locations` VALUES ('4930', '头屯河区', '475', '3');
INSERT INTO `t_locations` VALUES ('4931', '新市区', '475', '3');
INSERT INTO `t_locations` VALUES ('4932', '水磨沟区', '475', '3');
INSERT INTO `t_locations` VALUES ('4933', '沙依巴克区', '475', '3');
INSERT INTO `t_locations` VALUES ('4934', '达坂城区', '475', '3');
INSERT INTO `t_locations` VALUES ('4935', '乌尔禾区', '476', '3');
INSERT INTO `t_locations` VALUES ('4936', '克拉玛依区', '476', '3');
INSERT INTO `t_locations` VALUES ('4937', '独山子区', '476', '3');
INSERT INTO `t_locations` VALUES ('4938', '白碱滩区', '476', '3');
INSERT INTO `t_locations` VALUES ('4939', '吐鲁番市', '477', '3');
INSERT INTO `t_locations` VALUES ('4940', '托克逊县', '477', '3');
INSERT INTO `t_locations` VALUES ('4941', '鄯善县', '477', '3');
INSERT INTO `t_locations` VALUES ('4942', '伊吾县', '478', '3');
INSERT INTO `t_locations` VALUES ('4943', '哈密市', '478', '3');
INSERT INTO `t_locations` VALUES ('4944', '巴里坤哈萨克自治县', '478', '3');
INSERT INTO `t_locations` VALUES ('4945', '吉木萨尔县', '479', '3');
INSERT INTO `t_locations` VALUES ('4946', '呼图壁县', '479', '3');
INSERT INTO `t_locations` VALUES ('4947', '奇台县', '479', '3');
INSERT INTO `t_locations` VALUES ('4948', '昌吉市', '479', '3');
INSERT INTO `t_locations` VALUES ('4949', '木垒哈萨克自治县', '479', '3');
INSERT INTO `t_locations` VALUES ('4950', '玛纳斯县', '479', '3');
INSERT INTO `t_locations` VALUES ('4951', '米泉市', '479', '3');
INSERT INTO `t_locations` VALUES ('4952', '阜康市', '479', '3');
INSERT INTO `t_locations` VALUES ('4953', '博乐市', '480', '3');
INSERT INTO `t_locations` VALUES ('4954', '温泉县', '480', '3');
INSERT INTO `t_locations` VALUES ('4955', '精河县', '480', '3');
INSERT INTO `t_locations` VALUES ('4956', '博湖县', '481', '3');
INSERT INTO `t_locations` VALUES ('4957', '和硕县', '481', '3');
INSERT INTO `t_locations` VALUES ('4958', '和静县', '481', '3');
INSERT INTO `t_locations` VALUES ('4959', '尉犁县', '481', '3');
INSERT INTO `t_locations` VALUES ('4960', '库尔勒市', '481', '3');
INSERT INTO `t_locations` VALUES ('4961', '焉耆回族自治县', '481', '3');
INSERT INTO `t_locations` VALUES ('4962', '若羌县', '481', '3');
INSERT INTO `t_locations` VALUES ('4963', '轮台县', '481', '3');
INSERT INTO `t_locations` VALUES ('4964', '乌什县', '482', '3');
INSERT INTO `t_locations` VALUES ('4965', '库车县', '482', '3');
INSERT INTO `t_locations` VALUES ('4966', '拜城县', '482', '3');
INSERT INTO `t_locations` VALUES ('4967', '新和县', '482', '3');
INSERT INTO `t_locations` VALUES ('4968', '柯坪县', '482', '3');
INSERT INTO `t_locations` VALUES ('4969', '沙雅县', '482', '3');
INSERT INTO `t_locations` VALUES ('4970', '温宿县', '482', '3');
INSERT INTO `t_locations` VALUES ('4971', '阿克苏市', '482', '3');
INSERT INTO `t_locations` VALUES ('4972', '阿瓦提县', '482', '3');
INSERT INTO `t_locations` VALUES ('4973', '乌恰县', '483', '3');
INSERT INTO `t_locations` VALUES ('4974', '阿克陶县', '483', '3');
INSERT INTO `t_locations` VALUES ('4975', '阿合奇县', '483', '3');
INSERT INTO `t_locations` VALUES ('4976', '阿图什市', '483', '3');
INSERT INTO `t_locations` VALUES ('4977', '伽师县', '484', '3');
INSERT INTO `t_locations` VALUES ('4978', '叶城县', '484', '3');
INSERT INTO `t_locations` VALUES ('4979', '喀什市', '484', '3');
INSERT INTO `t_locations` VALUES ('4980', '塔什库尔干塔吉克自治县', '484', '3');
INSERT INTO `t_locations` VALUES ('4981', '岳普湖县', '484', '3');
INSERT INTO `t_locations` VALUES ('4982', '巴楚县', '484', '3');
INSERT INTO `t_locations` VALUES ('4983', '泽普县', '484', '3');
INSERT INTO `t_locations` VALUES ('4984', '疏勒县', '484', '3');
INSERT INTO `t_locations` VALUES ('4985', '疏附县', '484', '3');
INSERT INTO `t_locations` VALUES ('4986', '英吉沙县', '484', '3');
INSERT INTO `t_locations` VALUES ('4987', '莎车县', '484', '3');
INSERT INTO `t_locations` VALUES ('4988', '麦盖提县', '484', '3');
INSERT INTO `t_locations` VALUES ('4989', '于田县', '485', '3');
INSERT INTO `t_locations` VALUES ('4990', '和田县', '485', '3');
INSERT INTO `t_locations` VALUES ('4991', '和田市', '485', '3');
INSERT INTO `t_locations` VALUES ('4992', '墨玉县', '485', '3');
INSERT INTO `t_locations` VALUES ('4993', '民丰县', '485', '3');
INSERT INTO `t_locations` VALUES ('4994', '洛浦县', '485', '3');
INSERT INTO `t_locations` VALUES ('4995', '皮山县', '485', '3');
INSERT INTO `t_locations` VALUES ('4996', '策勒县', '485', '3');
INSERT INTO `t_locations` VALUES ('4997', '伊宁县', '486', '3');
INSERT INTO `t_locations` VALUES ('4998', '伊宁市', '486', '3');
INSERT INTO `t_locations` VALUES ('4999', '奎屯市', '486', '3');
INSERT INTO `t_locations` VALUES ('5000', '察布查尔锡伯自治县', '486', '3');
INSERT INTO `t_locations` VALUES ('5001', '尼勒克县', '486', '3');
INSERT INTO `t_locations` VALUES ('5002', '巩留县', '486', '3');
INSERT INTO `t_locations` VALUES ('5003', '新源县', '486', '3');
INSERT INTO `t_locations` VALUES ('5004', '昭苏县', '486', '3');
INSERT INTO `t_locations` VALUES ('5005', '特克斯县', '486', '3');
INSERT INTO `t_locations` VALUES ('5006', '霍城县', '486', '3');
INSERT INTO `t_locations` VALUES ('5007', '乌苏市', '487', '3');
INSERT INTO `t_locations` VALUES ('5008', '和布克赛尔蒙古自治县', '487', '3');
INSERT INTO `t_locations` VALUES ('5009', '塔城市', '487', '3');
INSERT INTO `t_locations` VALUES ('5010', '托里县', '487', '3');
INSERT INTO `t_locations` VALUES ('5011', '沙湾县', '487', '3');
INSERT INTO `t_locations` VALUES ('5012', '裕民县', '487', '3');
INSERT INTO `t_locations` VALUES ('5013', '额敏县', '487', '3');
INSERT INTO `t_locations` VALUES ('5014', '吉木乃县', '488', '3');
INSERT INTO `t_locations` VALUES ('5015', '哈巴河县', '488', '3');
INSERT INTO `t_locations` VALUES ('5016', '富蕴县', '488', '3');
INSERT INTO `t_locations` VALUES ('5017', '布尔津县', '488', '3');
INSERT INTO `t_locations` VALUES ('5018', '福海县', '488', '3');
INSERT INTO `t_locations` VALUES ('5019', '阿勒泰市', '488', '3');
INSERT INTO `t_locations` VALUES ('5020', '青河县', '488', '3');
INSERT INTO `t_locations` VALUES ('5021', '石河子市', '489', '3');
INSERT INTO `t_locations` VALUES ('5022', '阿拉尔市', '490', '3');
INSERT INTO `t_locations` VALUES ('5023', '图木舒克市', '491', '3');
INSERT INTO `t_locations` VALUES ('5024', '五家渠市', '492', '3');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `t_menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `t_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) unsigned DEFAULT NULL COMMENT '商家id',
  `store_id` int(11) unsigned DEFAULT NULL COMMENT '门店ＩＤ',
  `type` tinyint(3) DEFAULT NULL COMMENT '留言类型，1-培训支持，2-活动申请，3-广告设计',
  `content` text NOT NULL COMMENT '留言内容',
  `phone` varchar(15) NOT NULL DEFAULT '' COMMENT '联系电话',
  `username` varchar(10) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态，0-未读，1-已读',
  `delete_tag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除，0-未删除，1-删除',
  `delete_time` int(11) DEFAULT NULL COMMENT '逻辑删除时间',
  `title` varchar(64) DEFAULT NULL COMMENT '留言标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='留言表（表单，培训支持，广告设计，活动申请）';

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('19', '112', '101', '3', '继续广告设计。请派人前来', '13888888888', '就看见', '1495787749', '1', '0', null, '空军航空');
INSERT INTO `t_message` VALUES ('20', '111', '100', '2', '发过几个房间', '13308025470', '点后', '1497853829', '0', '0', null, '453');

-- ----------------------------
-- Table structure for t_migration
-- ----------------------------
DROP TABLE IF EXISTS `t_migration`;
CREATE TABLE `t_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_migration
-- ----------------------------
INSERT INTO `t_migration` VALUES ('m000000_000000_base', '1491359951');
INSERT INTO `t_migration` VALUES ('m140602_111327_create_menu_table', '1495173908');
INSERT INTO `t_migration` VALUES ('m160312_050000_create_user', '1495173908');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned DEFAULT NULL COMMENT '店铺ID',
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `order_no` varchar(32) DEFAULT NULL COMMENT '订单编号',
  `add_time` int(11) DEFAULT NULL COMMENT '订单生成时间',
  `status` tinyint(3) DEFAULT NULL COMMENT '订单状态，1-待付款，2-待发货，3-待收货，4-已完成',
  `username` varchar(10) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '收货地址，详细地址',
  `phone` varchar(15) DEFAULT NULL COMMENT '联系方式',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `send_time` int(11) DEFAULT NULL COMMENT '发货时间',
  `get_time` int(11) DEFAULT NULL COMMENT '收货时间',
  `express_no` varchar(20) DEFAULT NULL COMMENT '快递单号',
  `express_id` int(11) DEFAULT NULL COMMENT '快递方式id',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总价，包含邮费',
  `credtit_amout` decimal(10,2) DEFAULT NULL COMMENT '授信支付额度',
  `cash_amout` decimal(10,2) DEFAULT NULL COMMENT '现金支付额度',
  `beans_amount` decimal(10,2) DEFAULT NULL COMMENT '茶豆币支付数量',
  `pay_type` tinyint(4) DEFAULT NULL COMMENT '1:在线支付 2:授信支付 3:茶豆币',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='平台订单表';

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', '100', '111', 'TEA1497427934430952111', '1497427934', '2', 'ih', '天津市河西区天塔街道654165', '15884841191', '1497427934', null, null, null, null, '36.00', '36.00', '0.00', '0.00', '2');
INSERT INTO `t_order` VALUES ('2', '100', '111', 'TEA1497428251595041111', '1497428251', '2', 'ih', '天津市河西区天塔街道654165', '15884841191', '1497428251', null, null, null, null, '12.00', '12.00', '0.00', '0.00', '2');
INSERT INTO `t_order` VALUES ('3', '100', '111', 'TEA1497428279704233111', '1497428279', '2', 'ih', '天津市河西区天塔街道654165', '15884841191', '1497428279', null, null, null, null, '12.00', '12.00', '0.00', '0.00', '2');
INSERT INTO `t_order` VALUES ('4', '100', '111', 'TEA1497428295367570111', '1497428295', '2', 'ih', '天津市河西区天塔街道654165', '15884841191', '1497428295', null, null, null, null, '12.00', '12.00', '0.00', '0.00', '2');
INSERT INTO `t_order` VALUES ('5', '100', '111', 'TEA1497428318213706111', '1497428318', '2', 'ih', '天津市河西区天塔街道654165', '15884841191', '1497428318', null, null, null, null, '12.00', '12.00', '0.00', '0.00', '2');
INSERT INTO `t_order` VALUES ('6', '100', '111', 'TEA1497428331556962111', '1497428331', '2', 'ih', '天津市河西区天塔街道654165', '15884841191', '1497428331', null, null, null, null, '12.00', '12.00', '0.00', '0.00', '2');
INSERT INTO `t_order` VALUES ('7', '100', '111', 'TEA1497428348777115111', '1497428348', '2', 'ih', '天津市河西区天塔街道654165', '15884841191', '1497428348', null, null, null, null, '12.00', '12.00', '0.00', '0.00', '2');
INSERT INTO `t_order` VALUES ('8', '100', '111', 'TEA1497580843848083111', '1497580843', '2', 'ih', '天津市河西区天塔街道654165', '15884841191', '1497580843', null, null, null, null, '80.00', '80.00', '0.00', '0.00', '2');
INSERT INTO `t_order` VALUES ('9', '100', '111', 'TEA14975808827293111', '1497580882', '2', 'ih', '天津市河西区天塔街道654165', '15884841191', '1497580882', null, null, null, null, '34.00', '34.00', '0.00', '0.00', '2');
INSERT INTO `t_order` VALUES ('10', '100', '111', 'TEA1497925611743164111', '1497925611', '2', 'asd ', '内蒙古自治区赤峰市巴林右旗asda ', '15881841191', '1497925611', null, null, null, null, '144.00', '144.00', '0.00', '0.00', '2');
INSERT INTO `t_order` VALUES ('11', '100', '111', 'TEA1497925933293762111', '1497925933', '2', 'asd ', '内蒙古自治区赤峰市巴林右旗asda ', '15881841191', '1497925933', null, null, null, null, '136.00', '136.00', '0.00', '0.00', '2');
INSERT INTO `t_order` VALUES ('12', '100', '111', 'TEA1497946167903533111', '1497946167', '2', 'ih', '天津市河西区天塔街道654165', '15884841191', '1497946167', null, null, null, null, '48.00', '48.00', '0.00', '0.00', '2');

-- ----------------------------
-- Table structure for t_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_order_goods`;
CREATE TABLE `t_order_goods` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `cover` varchar(255) DEFAULT NULL COMMENT '商品封面图片名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `spec` varchar(255) DEFAULT NULL COMMENT '产品规格',
  `note` varchar(255) DEFAULT NULL COMMENT '商品备注',
  `num` int(11) DEFAULT NULL COMMENT '购买数量',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='订单附属表（订单内购买的商品）';

-- ----------------------------
-- Records of t_order_goods
-- ----------------------------
INSERT INTO `t_order_goods` VALUES ('1', '1', '1', 'trestle', '/upload/20170613/20170613878.jpg', '12.00', '特殊', '', '3');
INSERT INTO `t_order_goods` VALUES ('2', '2', '1', 'trestle', '/upload/20170613/20170613878.jpg', '12.00', '特殊', '', '1');
INSERT INTO `t_order_goods` VALUES ('3', '3', '1', 'trestle', '/upload/20170613/20170613878.jpg', '12.00', '特殊', '', '1');
INSERT INTO `t_order_goods` VALUES ('4', '4', '1', 'trestle', '/upload/20170613/20170613878.jpg', '12.00', '特殊', '', '1');
INSERT INTO `t_order_goods` VALUES ('5', '5', '1', 'trestle', '/upload/20170613/20170613878.jpg', '12.00', '特殊', '', '1');
INSERT INTO `t_order_goods` VALUES ('6', '6', '1', 'trestle', '/upload/20170613/20170613878.jpg', '12.00', '特殊', '', '1');
INSERT INTO `t_order_goods` VALUES ('7', '7', '1', 'trestle', '/upload/20170613/20170613878.jpg', '12.00', '特殊', '', '1');
INSERT INTO `t_order_goods` VALUES ('8', '8', '1', 'trestle', '/upload/20170613/20170613878.jpg', '12.00', '特殊', '', '1');
INSERT INTO `t_order_goods` VALUES ('9', '8', '7', '规范', '/upload/20170615/20170615802.jpg', '34.00', '45', '', '1');
INSERT INTO `t_order_goods` VALUES ('10', '8', '16', '梵蒂冈的发', '/upload/20170616/20170616779.jpg', '34.00', '234', '', '1');
INSERT INTO `t_order_goods` VALUES ('11', '9', '7', '规范', '/upload/20170615/20170615802.jpg', '34.00', '45', '', '1');
INSERT INTO `t_order_goods` VALUES ('12', '10', '1', 'trestle', '/upload/20170613/20170613878.jpg', '12.00', '特殊', '', '12');
INSERT INTO `t_order_goods` VALUES ('13', '11', '16', '梵蒂冈的发', '/upload/20170616/20170616779.jpg', '34.00', '234', '', '4');
INSERT INTO `t_order_goods` VALUES ('14', '12', '1', 'trestle', '/upload/20170613/20170613878.jpg', '12.00', '特殊', '', '4');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(15) NOT NULL COMMENT '角色名',
  `intro` varchar(100) DEFAULT NULL COMMENT '角色简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'boss', '');
INSERT INTO `t_role` VALUES ('3', 'ghr', null);
INSERT INTO `t_role` VALUES ('4', '董事长', '');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限id',
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('1', '1');
INSERT INTO `t_role_permission` VALUES ('1', '2');
INSERT INTO `t_role_permission` VALUES ('1', '3');

-- ----------------------------
-- Table structure for t_salesman
-- ----------------------------
DROP TABLE IF EXISTS `t_salesman`;
CREATE TABLE `t_salesman` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL DEFAULT '' COMMENT '姓名',
  `phone` varchar(15) NOT NULL DEFAULT '' COMMENT '电话',
  `shop_total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分管的商家总数',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='业务员表';

-- ----------------------------
-- Records of t_salesman
-- ----------------------------
INSERT INTO `t_salesman` VALUES ('32', '开发测试业务员', '15914725836', '0', '1495710145');

-- ----------------------------
-- Table structure for t_shoper
-- ----------------------------
DROP TABLE IF EXISTS `t_shoper`;
CREATE TABLE `t_shoper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boss` varchar(10) DEFAULT NULL COMMENT '负责人姓名',
  `phone` varchar(15) DEFAULT NULL COMMENT '负责人联系方式',
  `credit_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '授信余额',
  `contract_no` varchar(255) DEFAULT NULL COMMENT '合同号',
  `withdraw_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '提现方式，1-支付宝，2-微信，3-银行卡',
  `bank` varchar(255) DEFAULT NULL COMMENT '开户行',
  `bank_user` varchar(10) DEFAULT NULL COMMENT '开户名',
  `card_no` varchar(255) NOT NULL DEFAULT '' COMMENT '提现账号',
  `credit_remain` decimal(10,2) DEFAULT '0.00' COMMENT '授信总额',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '商家授信状态，0-正常，1-冻结',
  `salesman_id` int(11) DEFAULT NULL COMMENT '业务员id',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '现金总收入',
  `sp_status` int(10) unsigned DEFAULT '0' COMMENT '商户账号状态  0-正常 1-封停',
  `pay_account` varchar(64) NOT NULL COMMENT '支付宝或者微信账号',
  `b2b_sum_price` decimal(18,2) DEFAULT '0.00' COMMENT 'b2b商城总计购买了多少！',
  `withdraw_total` decimal(10,2) DEFAULT '0.00' COMMENT '茶豆币待提现',
  `beans_incom` decimal(10,2) DEFAULT '0.00' COMMENT '茶豆币使用总额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COMMENT='商家信息表';

-- ----------------------------
-- Records of t_shoper
-- ----------------------------
INSERT INTO `t_shoper` VALUES ('111', '开发测试店铺', '15888888888', '450.00', '10000000000000', '1', '中国银行', '测试', '612346859124687684545', '1000.00', '0', '32', '1495710268', '0.00', '0', '（wx）15982707139（zfb）15982707139', '550.00', '0.00', '0.00');
INSERT INTO `t_shoper` VALUES ('112', '郑小均', '18200124561', '10000.00', '001', '1', '茶码头银行', '郑小均', '9999', '10000.00', '0', '32', '1495736157', '0.00', '0', '9999', '0.00', '0.00', '0.00');
INSERT INTO `t_shoper` VALUES ('113', '余信锴', '13438505154', '99999999.99', '001', '1', '001', '001', '001', '99999999.99', '0', '32', '1495779336', '0.00', '0', '001', '0.00', '0.00', '0.00');
INSERT INTO `t_shoper` VALUES ('122', '女不能发', '18367630931', '300.00', '211541651', '1', 'VB女工', '闺女呢', '651561568', '300.00', '0', '32', '1497434363', '0.00', '0', '321351', '0.00', '0.00', '0.00');
INSERT INTO `t_shoper` VALUES ('123', '看还感觉', '18367630932', '12.00', '1231423', '1', '4532453', '543453', '5434534534', '12.00', '0', '32', '1497577403', '0.00', '0', '452452', '0.00', '0.00', '0.00');

-- ----------------------------
-- Table structure for t_shoper_img
-- ----------------------------
DROP TABLE IF EXISTS `t_shoper_img`;
CREATE TABLE `t_shoper_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) NOT NULL COMMENT '关联商铺id',
  `store_id` int(11) NOT NULL COMMENT '关联门店id',
  `path` varchar(255) NOT NULL COMMENT '保存路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='商铺图片';

-- ----------------------------
-- Records of t_shoper_img
-- ----------------------------
INSERT INTO `t_shoper_img` VALUES ('50', '112', '101', '/uploads/20170526/021515025702155720160319_141139.jpg');
INSERT INTO `t_shoper_img` VALUES ('51', '113', '102', '/uploads/20170526/141515143614153673f06f0fjw1et6usevl1xj20ku0dwq61.jpg');
INSERT INTO `t_shoper_img` VALUES ('52', '113', '102', '/uploads/20170526/1415151436141536530cfc01jw1etvbbg5hhej20ku0fmacz.jpg');
INSERT INTO `t_shoper_img` VALUES ('53', '113', '102', '/uploads/20170526/14151514361415369367b9899b3f74599421d345f3a0df07f164332f1605a2-t51Zel.jpg');
INSERT INTO `t_shoper_img` VALUES ('54', '113', '102', '/uploads/20170526/1415151436141536731019ddjw1eq4xph31fuj20zk0noq9p.jpg');
INSERT INTO `t_shoper_img` VALUES ('55', '113', '102', '/uploads/20170526/1415151436141536e6c8a03ba39899d3433edda14b0603ef.jpg');
INSERT INTO `t_shoper_img` VALUES ('56', '123', '112', '/uploads/20170616/0143430123014323Koala - 副本.jpg');
INSERT INTO `t_shoper_img` VALUES ('57', '123', '112', '/uploads/20170616/0143430123014323Lighthouse - 副本.jpg');
INSERT INTO `t_shoper_img` VALUES ('58', '123', '112', '/uploads/20170616/0143430123014323Penguins - 副本.jpg');
INSERT INTO `t_shoper_img` VALUES ('59', '122', '111', '/uploads/20170616/0144440110014410Hydrangeas - 副本 (2).jpg');
INSERT INTO `t_shoper_img` VALUES ('60', '122', '111', '/uploads/20170616/0144440110014410Lighthouse - 副本.jpg');
INSERT INTO `t_shoper_img` VALUES ('61', '122', '111', '/uploads/20170616/0144440110014410Penguins - 副本.jpg');
INSERT INTO `t_shoper_img` VALUES ('63', '111', '100', '/uploads/20170616/11272711171127172892399_1073447813.png');

-- ----------------------------
-- Table structure for t_shoper_tea_beans_log
-- ----------------------------
DROP TABLE IF EXISTS `t_shoper_tea_beans_log`;
CREATE TABLE `t_shoper_tea_beans_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shoper_id` int(11) NOT NULL COMMENT '商家id',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺id',
  `num` decimal(10,2) NOT NULL DEFAULT '0.00',
  `add_time` int(11) DEFAULT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0收入; 1消费;2提现',
  `method` tinyint(1) DEFAULT '0' COMMENT '0减，1加',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商铺的茶豆币记录，num不能为负值';

-- ----------------------------
-- Records of t_shoper_tea_beans_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_sp_ output
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_ output`;
CREATE TABLE `t_sp_ output` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='进销存出库表';

-- ----------------------------
-- Records of t_sp_ output
-- ----------------------------

-- ----------------------------
-- Table structure for t_sp_action_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_action_log`;
CREATE TABLE `t_sp_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `auth_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家角色用户id',
  `auth_user_name` varchar(10) NOT NULL DEFAULT '' COMMENT '商家角色用户名',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '行为',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `delete_tag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除，0-未删除，1-删除',
  `delete_time` int(11) DEFAULT NULL COMMENT '逻辑删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='茶坊后台人员行为日志表';

-- ----------------------------
-- Records of t_sp_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_sp_address
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_address`;
CREATE TABLE `t_sp_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned DEFAULT NULL COMMENT '商家店铺ID',
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `province` varchar(32) DEFAULT NULL COMMENT '省',
  `city` varchar(32) DEFAULT NULL COMMENT '市',
  `district` varchar(32) DEFAULT NULL COMMENT '区',
  `zip_code` int(11) DEFAULT NULL COMMENT '邮编',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址，详细地址，包括省市区',
  `phone` varchar(15) DEFAULT NULL COMMENT '联系方式',
  `tel` varchar(32) DEFAULT NULL COMMENT '电话号码',
  `username` varchar(10) DEFAULT NULL COMMENT '收货人',
  `default` tinyint(4) DEFAULT NULL COMMENT '是否默认 1:默认 0不默认',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='茶坊收货地址表';

-- ----------------------------
-- Records of t_sp_address
-- ----------------------------
INSERT INTO `t_sp_address` VALUES ('1', '100', '111', '天津市', '河西区', '天塔街道', null, '654165', '15884841191', '', 'ih', '0');
INSERT INTO `t_sp_address` VALUES ('2', '100', '111', '内蒙古自治区', '赤峰市', '巴林右旗', null, 'asda ', '15881841191', '', 'asd ', '0');

-- ----------------------------
-- Table structure for t_sp_auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_auth_assignment`;
CREATE TABLE `t_sp_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `t_sp_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `t_sp_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sp_auth_assignment
-- ----------------------------
INSERT INTO `t_sp_auth_assignment` VALUES ('超级管理员__111', '73', '1497260757');
INSERT INTO `t_sp_auth_assignment` VALUES ('超级管理员__111', '80', '1497853413');

-- ----------------------------
-- Table structure for t_sp_auth_item
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_auth_item`;
CREATE TABLE `t_sp_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `t_sp_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `t_sp_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sp_auth_item
-- ----------------------------
INSERT INTO `t_sp_auth_item` VALUES ('b2b', '2', 'b2b商场权限', null, 0x733A333A22623262223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('business/add-goods', '2', '增加消费', null, 0x733A383A22627573696E657373223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('business/begin-table-order', '2', '开台', null, 0x733A383A22627573696E657373223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('business/book', '2', '预定权限', null, 0x733A383A22627573696E657373223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('business/desktopstatus', '2', '营业桌台显示', null, 0x733A383A22627573696E657373223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('business/goods-close', '2', '商品取消', null, 0x733A383A22627573696E657373223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('business/goods-giv', '2', '商品转配', null, 0x733A383A22627573696E657373223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('business/merge', '2', '合并账单', null, 0x733A383A22627573696E657373223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('business/order', '2', '订单权限', null, 0x733A383A22627573696E657373223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('business/orderInfo', '2', '查看详情', null, 0x733A383A22627573696E657373223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('business/table', '2', '台桌管理', null, 0x733A383A22627573696E657373223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('business/table-goods-turn', '2', '商品转台', null, 0x733A383A22627573696E657373223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('business/table-type', '2', '台桌类型管理', null, 0x733A383A22627573696E657373223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('business/table/table-turn', '2', '更换台座', null, 0x733A383A22627573696E657373223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('charg/add', '2', '收费规则管理', null, 0x733A373A2273657474696E67223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('charg/buffer-time', '2', '缓冲时间', null, 0x733A373A2273657474696E67223B, '1497319880', '1497319880');
INSERT INTO `t_sp_auth_item` VALUES ('discount/config', '2', '优惠添加操作', null, 0x733A373A2273657474696E67223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('dosing/config', '2', '商品原料权限', null, 0x733A373A2273657474696E67223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('draw/index', '2', '奖品领取', null, 0x733A343A2264726177223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('draw/list', '2', '抽奖配置', null, 0x733A373A2273657474696E67223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('erp/excel', '2', '导出Excel', null, 0x733A393A227265706572746F7279223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('erp/goods-list', '2', '库存商品列表', null, 0x733A393A227265706572746F7279223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('erp/pan-dian', '2', '库存盘点记录', null, 0x733A393A227265706572746F7279223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('erp/pop', '2', '库存出库', null, 0x733A393A227265706572746F7279223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('erp/pop-log', '2', '库存出库记录', null, 0x733A393A227265706572746F7279223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('erp/push', '2', '库存入库', null, 0x733A393A227265706572746F7279223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('erp/push-log', '2', '库存入记录', null, 0x733A393A227265706572746F7279223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('goods/config', '2', '商品管理权限', null, 0x733A373A2273657474696E67223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('information', '2', '消息', null, 0x733A363A22636F6D6D6F6E223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('jiaoban', '2', '交班', null, 0x733A363A22636F6D6D6F6E223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('jiaoban/index', '2', '交班预留金额设置', null, 0x733A373A2273657474696E67223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('jiaoban/list', '2', '交班记录', null, 0x733A363A22636F6D6D6F6E223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('message', '2', '留言', null, 0x733A373A226D657373616765223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('order/btxf', '2', '吧台消费', null, 0x733A383A22627573696E657373223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('payment/payment-select', '2', '支付时间', null, 0x733A373A2273657474696E67223B, '1497411744', '1497411744');
INSERT INTO `t_sp_auth_item` VALUES ('qrcode/store', '2', '生成二维码', null, 0x733A373A2273657474696E67223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('role/index', '2', '权限管理', null, 0x733A373A2273657474696E67223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('spending/list', '2', '消费单', null, 0x733A373A22636F6E73756D65223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('statement/actual-data', '2', '报表系统', null, 0x733A393A2273746174656D656E74223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('unit/config', '2', '商品单位权限', null, 0x733A373A2273657474696E67223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('users/config', '2', '员工操作', null, 0x733A373A2273657474696E67223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('vip/consume', '2', '会员消费记录', null, 0x733A363A226D656D626572223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('vip/create', '2', '会员添加', null, 0x733A363A226D656D626572223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('vip/delete', '2', '会员删除', null, 0x733A363A226D656D626572223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('vip/get-all', '2', '会员管理', null, 0x733A373A2273657474696E67223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('vip/list-vip', '2', '查看会员', null, 0x733A363A226D656D626572223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('vip/pay', '2', '会员充值', null, 0x733A363A226D656D626572223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('vip/pay-list', '2', '会员充值记录', null, 0x733A363A226D656D626572223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('withdraw', '2', '提现管理', null, 0x733A383A227769746864726177223B, '1497260757', '1497260757');
INSERT INTO `t_sp_auth_item` VALUES ('员工__111', '1', null, null, null, '1497853428', '1497853428');
INSERT INTO `t_sp_auth_item` VALUES ('超级管理员1__111', '1', null, null, null, '1497853468', '1497853468');
INSERT INTO `t_sp_auth_item` VALUES ('超级管理员__111', '1', null, null, null, '1497260757', '1497260757');

-- ----------------------------
-- Table structure for t_sp_auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_auth_item_child`;
CREATE TABLE `t_sp_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `t_sp_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `t_sp_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_sp_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `t_sp_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sp_auth_item_child
-- ----------------------------
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'b2b');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'business/add-goods');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'business/begin-table-order');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'business/book');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'business/desktopstatus');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'business/goods-close');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'business/goods-giv');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'business/merge');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'business/order');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'business/orderInfo');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'business/table');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'business/table-goods-turn');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'business/table-type');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'business/table/table-turn');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'charg/add');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'charg/buffer-time');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'discount/config');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'dosing/config');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'draw/index');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'draw/list');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'erp/excel');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'erp/goods-list');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'erp/pan-dian');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'erp/pop');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'erp/pop-log');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'erp/push');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'erp/push-log');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'goods/config');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员1__111', 'information');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'information');
INSERT INTO `t_sp_auth_item_child` VALUES ('员工__111', 'jiaoban');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员1__111', 'jiaoban');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'jiaoban');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'jiaoban/index');
INSERT INTO `t_sp_auth_item_child` VALUES ('员工__111', 'jiaoban/list');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员1__111', 'jiaoban/list');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'jiaoban/list');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'message');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'order/btxf');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'payment/payment-select');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'qrcode/store');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'role/index');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'spending/list');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'statement/actual-data');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'unit/config');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'users/config');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'vip/consume');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'vip/create');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'vip/delete');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'vip/get-all');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'vip/list-vip');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'vip/pay');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'vip/pay-list');
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'withdraw');

-- ----------------------------
-- Table structure for t_sp_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_auth_rule`;
CREATE TABLE `t_sp_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sp_auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for t_sp_beans_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_beans_pay`;
CREATE TABLE `t_sp_beans_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `wx_user_id` varchar(255) DEFAULT NULL COMMENT '微信用户id',
  `num` int(11) DEFAULT NULL COMMENT '充值数量',
  `add_time` int(11) DEFAULT NULL COMMENT '充值时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='茶坊币充值记录表';

-- ----------------------------
-- Records of t_sp_beans_pay
-- ----------------------------

-- ----------------------------
-- Table structure for t_sp_book
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_book`;
CREATE TABLE `t_sp_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `wx_user_id` int(11) DEFAULT NULL COMMENT '微信用户id，从微信端下单/预订的',
  `vip_user_id` int(11) DEFAULT NULL COMMENT '会员用户id，从店铺线下下单/预订的',
  `table_id` int(11) DEFAULT NULL COMMENT '台桌id',
  `deposit` decimal(3,2) DEFAULT NULL COMMENT '押金/预订诚意金',
  `add_time` int(11) DEFAULT NULL COMMENT '预订时间',
  `radd_time` int(11) DEFAULT NULL COMMENT '退款时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态，0-预定中，1-预定完成 ，2-预定取消',
  `arrive_time` int(11) NOT NULL DEFAULT '0' COMMENT '预计到达时间',
  `username` varchar(32) DEFAULT NULL COMMENT '会员名称',
  `phone` varchar(15) DEFAULT NULL COMMENT '客户联系电话号码',
  `notes` varchar(120) DEFAULT NULL COMMENT '订单备注',
  `send_time` int(11) DEFAULT NULL COMMENT '订单取消时间',
  `store_id` int(11) DEFAULT NULL COMMENT '店门门店',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='预订表';

-- ----------------------------
-- Records of t_sp_book
-- ----------------------------
INSERT INTO `t_sp_book` VALUES ('48', '112', null, null, '207', null, '1495772394', null, '2', '1495772340', '郑秀晶', '15888888888', '3位客人', '1495772940', '101');
INSERT INTO `t_sp_book` VALUES ('49', '112', null, null, '215', null, '1495773105', null, '2', '1495773060', '111', '18200124561', '', '1495773660', '101');
INSERT INTO `t_sp_book` VALUES ('50', '112', null, null, '209', null, '1495779440', null, '1', '1495792800', '4', '13888888888', '准备好长牌！ 另外联系个打麻将的！', '1495793400', '101');
INSERT INTO `t_sp_book` VALUES ('51', '112', null, null, '210', null, '1495779860', null, '1', '1495779900', '王总', '13777777777', '', '1495780500', '101');
INSERT INTO `t_sp_book` VALUES ('52', '112', null, null, '211', null, '1495781813', null, '2', '1495781760', '4', '13888888888', '准备好长牌！ 另外联系个打麻将的！', '1495782360', '101');
INSERT INTO `t_sp_book` VALUES ('53', '112', null, null, '212', null, '1495786469', null, '1', '1495786380', '毛泽东', '13888888888', '把我的开国元帅叫上', '1495786980', '101');
INSERT INTO `t_sp_book` VALUES ('54', '112', null, null, '213', null, '1495786768', null, '1', '1495786740', '周恩来', '13888888888', '我要打牌', '1495787340', '101');
INSERT INTO `t_sp_book` VALUES ('55', '112', null, null, '213', null, '1495786869', null, '1', '1495786860', '4', '13888888888', '准备好长牌！ 另外联系个打麻将的！', '1495787460', '101');
INSERT INTO `t_sp_book` VALUES ('56', '112', null, null, '213', null, '1495786932', null, '1', '1495786860', '4', '13888888888', '准备好长牌！ 另外联系个打麻将的！', '1495787460', '101');
INSERT INTO `t_sp_book` VALUES ('57', '112', null, null, '221', null, '1495787010', null, '2', '1495786980', '毛泽东', '13888888888', '喝茶', '1495787580', '101');
INSERT INTO `t_sp_book` VALUES ('58', '112', null, null, '211', null, '1495787017', null, '2', '1495786980', '1', '18211111111', '', '1495787580', '101');
INSERT INTO `t_sp_book` VALUES ('59', '112', null, null, '219', null, '1495787166', null, '2', '1495787100', '长', '18200124561', '', '1495787700', '101');
INSERT INTO `t_sp_book` VALUES ('60', '112', null, null, '211', null, '1495788373', null, '2', '1495788360', '毛泽东', '13888888888', '', '1495788960', '101');
INSERT INTO `t_sp_book` VALUES ('61', '111', null, null, '204', null, '1496394641', null, '2', '1496394600', 'asd', '13568451825', 'asd', '1496395200', '100');
INSERT INTO `t_sp_book` VALUES ('62', '111', null, null, '204', null, '1496395273', null, '2', '1496395260', 'asd', '13568451825', 'asd', '1496395860', '100');
INSERT INTO `t_sp_book` VALUES ('63', '111', null, null, '223', null, '1496628483', null, '1', '1496628420', 'as', '13568451825', '', '1496629020', '100');
INSERT INTO `t_sp_book` VALUES ('64', '111', null, null, '203', null, '1496641370', null, '2', '1496641320', '曹双', '15982707139', '11', '1496641920', '100');
INSERT INTO `t_sp_book` VALUES ('65', '111', null, null, '203', null, '1496641962', null, '1', '1496641920', '曹双', '15982707139', '11', '1496642520', '100');
INSERT INTO `t_sp_book` VALUES ('66', '111', null, null, '203', null, '1496642083', null, '2', '1496642040', '000', '15982720713', '', '1496642640', '100');
INSERT INTO `t_sp_book` VALUES ('67', '111', null, null, '203', null, '1496913375', null, '2', '1496913300', 'sasd', '13568451825', '', '1496913900', '100');
INSERT INTO `t_sp_book` VALUES ('68', '111', null, null, '203', null, '1496913493', null, '2', '1496913420', 'sasd', '13568451825', '', '1496914020', '100');
INSERT INTO `t_sp_book` VALUES ('69', '111', null, null, '203', null, '1496913922', null, '2', '1496913840', 'asda', '13568451825', '', '1496913960', '100');
INSERT INTO `t_sp_book` VALUES ('70', '111', null, null, '203', null, '1496914014', null, '2', '1496913960', 'asda', '13568451825', '', '1496914020', '100');
INSERT INTO `t_sp_book` VALUES ('71', '111', null, null, '223', null, '1497321721', null, '2', '1497321660', '13568451825', '13568451825', '', '1497322260', '100');
INSERT INTO `t_sp_book` VALUES ('72', '111', null, null, '223', null, '1497853133', null, '2', '1497853080', '大概', '13308025470', '郭德纲十多个', '1497853680', '100');
INSERT INTO `t_sp_book` VALUES ('73', '111', null, null, '223', null, '1498024811', null, '2', '1498024740', '曹双', '15982707139', '', '1498025340', '100');
INSERT INTO `t_sp_book` VALUES ('74', '111', null, null, '223', null, '1498025019', null, '2', '1498024980', '曹双', '15982707139', '11', '1498025580', '100');
INSERT INTO `t_sp_book` VALUES ('75', '111', null, null, '223', null, '1498442784', null, '2', '1498442760', '曹双', '15982707139', '', '1498443360', '100');

-- ----------------------------
-- Table structure for t_sp_buffer_time
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_buffer_time`;
CREATE TABLE `t_sp_buffer_time` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL COMMENT '缓冲时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='缓冲时间设置';

-- ----------------------------
-- Records of t_sp_buffer_time
-- ----------------------------
INSERT INTO `t_sp_buffer_time` VALUES ('1', '111', '100', '10');

-- ----------------------------
-- Table structure for t_sp_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_cart`;
CREATE TABLE `t_sp_cart` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `store_id` int(10) unsigned DEFAULT NULL COMMENT '商家店门ID',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '平台商品id',
  `goods_num` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '加入购物车时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Records of t_sp_cart
-- ----------------------------
INSERT INTO `t_sp_cart` VALUES ('19', '111', '100', '1', '2', '1497950303');

-- ----------------------------
-- Table structure for t_sp_charg_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_charg_rule`;
CREATE TABLE `t_sp_charg_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺ID',
  `type` tinyint(3) DEFAULT NULL COMMENT '1:计时类型 2:包段类型3:免费类型',
  `name` varchar(120) DEFAULT NULL COMMENT '收费类型名',
  `value` text COMMENT '具体详细参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sp_charg_rule
-- ----------------------------
INSERT INTO `t_sp_charg_rule` VALUES ('2', '111', '100', '1', '小包计时', 'a:1:{s:5:\"price\";s:2:\"30\";}');
INSERT INTO `t_sp_charg_rule` VALUES ('4', '111', '100', '3', '免费计费', 'a:1:{s:5:\"price\";i:0;}');
INSERT INTO `t_sp_charg_rule` VALUES ('7', '111', '100', '1', '大包计时', 'a:1:{s:5:\"price\";s:3:\"150\";}');
INSERT INTO `t_sp_charg_rule` VALUES ('9', '111', '100', '2', '包段计时', 'a:3:{s:5:\"price\";s:3:\"200\";s:2:\"sd\";s:1:\"1\";s:7:\"xsprice\";s:2:\"60\";}');

-- ----------------------------
-- Table structure for t_sp_config
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_config`;
CREATE TABLE `t_sp_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(24) DEFAULT NULL COMMENT '配置名称',
  `value` varchar(255) DEFAULT NULL COMMENT '配置内容',
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家ＩＤ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='茶坊端配置记录';

-- ----------------------------
-- Records of t_sp_config
-- ----------------------------
INSERT INTO `t_sp_config` VALUES ('1', 'wx_play_img', '/updata/2140384i477qrjrtdjiru4.jpg', '1');
INSERT INTO `t_sp_config` VALUES ('2', 'zfb_play_img', '/updata/2140384i477qrjrtdjiru4.jpg', '1');

-- ----------------------------
-- Table structure for t_sp_credit_consume
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_credit_consume`;
CREATE TABLE `t_sp_credit_consume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL COMMENT '平台订单id',
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `add_time` int(11) DEFAULT NULL COMMENT '消费时间',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '消费金额',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态，0-未还，1-已还',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='授信消费表';

-- ----------------------------
-- Records of t_sp_credit_consume
-- ----------------------------

-- ----------------------------
-- Table structure for t_sp_credit_refund
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_credit_refund`;
CREATE TABLE `t_sp_credit_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '还款金额',
  `add_time` int(11) DEFAULT NULL COMMENT '还款时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家授信还款记录表';

-- ----------------------------
-- Records of t_sp_credit_refund
-- ----------------------------

-- ----------------------------
-- Table structure for t_sp_discount
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_discount`;
CREATE TABLE `t_sp_discount` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '手动优惠',
  `shoper_id` int(11) NOT NULL COMMENT '商家ID',
  `store_id` int(11) NOT NULL COMMENT '门店ID',
  `min_money` decimal(10,2) NOT NULL COMMENT '最小金额',
  `max_money` decimal(10,2) NOT NULL COMMENT '最大金额',
  `discount_money` decimal(10,2) NOT NULL COMMENT '优惠金额',
  `time` int(11) DEFAULT NULL COMMENT '添加时间',
  `manage_id` int(11) DEFAULT NULL COMMENT '添加人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='店铺优惠表';

-- ----------------------------
-- Records of t_sp_discount
-- ----------------------------
INSERT INTO `t_sp_discount` VALUES ('1', '111', '100', '0.00', '100.00', '10.00', '1497853727', '73');

-- ----------------------------
-- Table structure for t_sp_dosing
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_dosing`;
CREATE TABLE `t_sp_dosing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '原料名称',
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺ID',
  `number` varchar(32) DEFAULT NULL COMMENT '原料编号',
  `unit` varchar(255) DEFAULT NULL COMMENT '单位名称',
  `time` int(11) unsigned DEFAULT NULL COMMENT '添加时间',
  `stock` int(11) unsigned DEFAULT '0' COMMENT '库存数量',
  `stock_warning` int(11) unsigned DEFAULT '0' COMMENT '库存预计数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='茶坊原料表';

-- ----------------------------
-- Records of t_sp_dosing
-- ----------------------------
INSERT INTO `t_sp_dosing` VALUES ('19', '测试原料', '111', '100', '1', '测试单位', '1495710618', '2', '1');
INSERT INTO `t_sp_dosing` VALUES ('21', '菊花', '112', '101', '01', '克', '1495769799', '500', '50');
INSERT INTO `t_sp_dosing` VALUES ('22', '冰糖', '112', '101', '02', '克', '1495769813', '500', '50');
INSERT INTO `t_sp_dosing` VALUES ('23', '枸杞', '112', '101', '03', '克', '1495769828', '500', '50');
INSERT INTO `t_sp_dosing` VALUES ('24', '花茶', '111', '100', '1', '杯', '1497852868', '10', '10');
INSERT INTO `t_sp_dosing` VALUES ('25', '坨坨茶', '111', '100', '2', '个', '1497852889', '3', '5');

-- ----------------------------
-- Table structure for t_sp_draw
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_draw`;
CREATE TABLE `t_sp_draw` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) NOT NULL COMMENT '商家ID',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺ID',
  `probability` int(11) DEFAULT NULL COMMENT '概率',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `type` tinyint(4) DEFAULT NULL COMMENT '1:茶豆币2：折扣卷 3：优惠券 4:事物5：谢谢惠顾6:其他',
  `number` decimal(10,2) DEFAULT '0.00' COMMENT '中奖后获取的奖品数量',
  `prize_sum_number` int(11) DEFAULT '0' COMMENT '奖品总数',
  `prize_surplus_number` int(11) DEFAULT '0' COMMENT '商品送出数量',
  `day_max_prize_number` int(11) DEFAULT '0' COMMENT '每日出奖数量',
  `winning_phone` varchar(24) DEFAULT NULL COMMENT '指定用户中奖',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='大转盘奖品配置表';

-- ----------------------------
-- Records of t_sp_draw
-- ----------------------------
INSERT INTO `t_sp_draw` VALUES ('3', '111', '100', '1', '优惠券4', '3', '50.00', '0', '4', '0', null);
INSERT INTO `t_sp_draw` VALUES ('6', '111', '100', '2', '测试', '2', '5.00', '0', '14', '0', null);
INSERT INTO `t_sp_draw` VALUES ('7', '111', '100', '30', '香烟', '4', '0.10', '0', '1', '0', null);
INSERT INTO `t_sp_draw` VALUES ('8', '111', '100', '20', '测试2', '2', '1.00', '0', '0', '0', null);
INSERT INTO `t_sp_draw` VALUES ('10', '111', '100', '10', '谢谢惠顾', '5', '0.00', '0', '0', '0', null);
INSERT INTO `t_sp_draw` VALUES ('12', '111', '100', null, '大侠', '4', '2.00', '2', '0', '5', '');
INSERT INTO `t_sp_draw` VALUES ('13', '111', '100', null, '双双', '4', '2.00', '2', '0', '2', '15881841191');

-- ----------------------------
-- Table structure for t_sp_draw_card
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_draw_card`;
CREATE TABLE `t_sp_draw_card` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL COMMENT '店铺ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `draw_id` int(11) DEFAULT NULL COMMENT '奖品ID',
  `type` int(11) DEFAULT NULL COMMENT '1:茶豆币2：折扣卷 3：优惠券 4:事物5：谢谢惠顾6:其他',
  `name` varchar(120) DEFAULT NULL COMMENT '奖品名称',
  `sn` varchar(32) DEFAULT NULL COMMENT '兑换码',
  `status` tinyint(4) DEFAULT '0' COMMENT '0:没兑换 1：已经兑换 2：过期',
  `add_time` int(12) DEFAULT NULL COMMENT '添加时间',
  `end_time` int(11) DEFAULT NULL COMMENT '领取时间',
  `number` decimal(10,2) DEFAULT NULL COMMENT '中间后的数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COMMENT='大转盘领取记录表\r\n';

-- ----------------------------
-- Records of t_sp_draw_card
-- ----------------------------
INSERT INTO `t_sp_draw_card` VALUES ('33', '111', '100', null, null, '2', '测试2数量1.00', '149631854165', '1', '1496318541', null, null);
INSERT INTO `t_sp_draw_card` VALUES ('34', '111', '100', null, null, '3', '测试2数量1.00', '149631874145', '0', '1496318741', null, '3.20');
INSERT INTO `t_sp_draw_card` VALUES ('35', '111', '100', null, null, '3', '测试数量5.00', '149631874954', '0', '1496318749', null, '5.00');
INSERT INTO `t_sp_draw_card` VALUES ('36', '111', '100', null, null, '4', '香烟数量0.10', '149631901223', '1', '1496319012', null, null);
INSERT INTO `t_sp_draw_card` VALUES ('37', '111', '100', null, null, '2', '测试2数量1.00', '149632007824', '0', '1496320078', null, '7.00');
INSERT INTO `t_sp_draw_card` VALUES ('38', '111', '100', null, null, '2', '测试2数量1.00', '149632008875', '0', '1496320088', null, null);
INSERT INTO `t_sp_draw_card` VALUES ('39', '111', '100', null, null, '4', '香烟数量0.10', '149632009566', '1', '1496320095', '1496320108', null);
INSERT INTO `t_sp_draw_card` VALUES ('40', '111', '100', null, null, '4', '香烟数量0.10', '149632014318', '1', '1496320143', '1496320153', null);
INSERT INTO `t_sp_draw_card` VALUES ('41', '111', '100', null, null, '4', '香烟数量0.10', '149632081042', '1', '1496320810', '1496391252', null);
INSERT INTO `t_sp_draw_card` VALUES ('42', '111', '100', null, null, '2', '测试2数量1.00', '149637461712', '0', '1496374617', null, null);
INSERT INTO `t_sp_draw_card` VALUES ('43', '111', '100', null, null, '2', '测试3数量3.00', '14963910231', '0', '1496391023', null, null);
INSERT INTO `t_sp_draw_card` VALUES ('44', '111', '100', null, null, '4', '香烟数量0.10', '149639161932', '0', '1496391619', null, null);
INSERT INTO `t_sp_draw_card` VALUES ('45', '111', '100', null, null, '4', '香烟数量0.10', '149639165918', '0', '1496391659', null, null);
INSERT INTO `t_sp_draw_card` VALUES ('46', '111', '100', null, null, '2', '测试3数量3.00', '149639201634', '0', '1496392016', null, null);
INSERT INTO `t_sp_draw_card` VALUES ('47', '111', '100', null, null, '2', '测试3数量3.00', '14966415104', '0', '1496641510', null, null);
INSERT INTO `t_sp_draw_card` VALUES ('48', '111', '100', null, null, '2', '测试3数量3.00', '149673390640', '0', '1496733906', null, null);
INSERT INTO `t_sp_draw_card` VALUES ('49', '111', '100', null, null, '4', '香烟数量0.10', '149682274430', '0', '1496822744', null, null);
INSERT INTO `t_sp_draw_card` VALUES ('50', '111', '100', null, null, '2', '测试3数量3.00', '149682644858', '0', '1496826448', null, null);
INSERT INTO `t_sp_draw_card` VALUES ('51', '111', '100', null, null, '4', '香烟数量0.10', '149683492211', '0', '1496834922', null, null);
INSERT INTO `t_sp_draw_card` VALUES ('52', '111', '100', null, null, '4', '香烟x0.10', '149871973369', '0', '1498719733', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('53', '111', '100', null, null, '2', '测试--5.00折', '149871973545', '0', '1498719735', null, '5.00');
INSERT INTO `t_sp_draw_card` VALUES ('54', '111', '100', null, null, '4', '香烟x0.10', '149871974854', '0', '1498719748', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('55', '111', '100', null, null, '4', '香烟x0.10', '149872034867', '0', '1498720348', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('56', '111', '100', '1', null, '4', '香烟x0.10', '149872036931', '0', '1498720369', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('57', '111', '100', '1', null, '4', '香烟x0.10', '149872037292', '0', '1498720372', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('58', '111', '100', '9', null, '4', '香烟x0.10', '149872039886', '0', '1498720398', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('59', '111', '100', '9', null, '4', '香烟x0.10', '149872042570', '0', '1498720425', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('60', '111', '100', '9', null, '4', '香烟x0.10', '149872045614', '0', '1498720456', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('61', '111', '100', '9', null, '4', '香烟x0.10', '149872056035', '0', '1498720560', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('62', '111', '100', '9', null, '4', '香烟x0.10', '14987205672', '0', '1498720567', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('63', '111', '100', '9', null, '4', '香烟x0.10', '149872059475', '0', '1498720594', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('64', '111', '100', '9', null, '4', '香烟x0.10', '149872062070', '0', '1498720620', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('65', '111', '100', '9', null, '4', '香烟x0.10', '149872064932', '0', '1498720649', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('66', '111', '100', '9', null, '4', '香烟x0.10', '149872066441', '0', '1498720664', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('67', '111', '100', '9', null, '4', '香烟x0.10', '149872071198', '0', '1498720711', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('68', '111', '100', '9', null, '4', '香烟x0.10', '149872080450', '0', '1498720804', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('69', '111', '100', '9', null, '4', '香烟x0.10', '149872081736', '0', '1498720817', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('70', '111', '100', '9', null, '4', '香烟x0.10', '149872082918', '0', '1498720829', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('71', '111', '100', '9', null, '4', '香烟x0.10', '149872083077', '0', '1498720830', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('72', '111', '100', '9', null, '4', '香烟x0.10', '149872083520', '0', '1498720835', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('73', '111', '100', '9', null, '4', '香烟x0.10', '14987208350', '0', '1498720835', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('74', '111', '100', '9', null, '4', '香烟x0.10', '14987211465', '0', '1498721146', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('75', '111', '100', '9', null, '4', '香烟x0.10', '149872119712', '0', '1498721197', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('76', '111', '100', '9', null, '4', '香烟x0.10', '149872120394', '0', '1498721203', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('77', '111', '100', '9', null, '4', '香烟x0.10', '149872120353', '0', '1498721203', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('78', '111', '100', '9', null, '4', '香烟x0.10', '149872120769', '0', '1498721207', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('79', '111', '100', '9', null, '4', '香烟x0.10', '149872121296', '0', '1498721212', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('80', '111', '100', '9', null, '2', '测试--5.00折', '149872122263', '0', '1498721222', null, '5.00');
INSERT INTO `t_sp_draw_card` VALUES ('81', '111', '100', '9', null, '4', '香烟x0.10', '149872122860', '0', '1498721228', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('82', '111', '100', '9', null, '4', '香烟x0.10', '149872123851', '0', '1498721238', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('83', '111', '100', '9', null, '4', '香烟x0.10', '149872124922', '0', '1498721249', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('84', '111', '100', '9', null, '4', '香烟x0.10', '149872125457', '0', '1498721254', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('85', '111', '100', '9', null, '4', '香烟x0.10', '149872126577', '0', '1498721265', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('86', '111', '100', '9', null, '4', '香烟x0.10', '149872127026', '0', '1498721270', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('87', '111', '100', '9', null, '4', '香烟x0.10', '149872127582', '0', '1498721275', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('88', '111', '100', '9', null, '4', '香烟x0.10', '14987212808', '0', '1498721280', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('89', '111', '100', '9', null, '4', '香烟x0.10', '149872128559', '0', '1498721285', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('90', '111', '100', '9', null, '4', '香烟x0.10', '149872129026', '0', '1498721290', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('91', '111', '100', '9', null, '4', '香烟x0.10', '14987212963', '0', '1498721296', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('92', '111', '100', '9', null, '4', '香烟x0.10', '149872130193', '0', '1498721301', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('93', '111', '100', '9', null, '4', '香烟x0.10', '149872130316', '0', '1498721303', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('94', '111', '100', '9', null, '4', '香烟x0.10', '149872130651', '0', '1498721306', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('95', '111', '100', '9', null, '4', '香烟x0.10', '149872131446', '0', '1498721314', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('96', '111', '100', '9', null, '4', '香烟x0.10', '149872131579', '0', '1498721315', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('97', '111', '100', '9', null, '4', '香烟x0.10', '149872131920', '0', '1498721319', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('98', '111', '100', '9', null, '4', '香烟x0.10', '149872133991', '0', '1498721339', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('99', '111', '100', '9', null, '4', '香烟x0.10', '149872134328', '0', '1498721343', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('100', '111', '100', '9', null, '4', '香烟x0.10', '149872135542', '0', '1498721355', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('101', '111', '100', '9', null, '4', '香烟x0.10', '14987213613', '0', '1498721361', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('102', '111', '100', '9', null, '2', '测试--5.00折', '149872136622', '0', '1498721366', null, '5.00');
INSERT INTO `t_sp_draw_card` VALUES ('103', '111', '100', '9', null, '4', '香烟x0.10', '149872138451', '0', '1498721384', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('104', '111', '100', '9', null, '4', '香烟x0.10', '149872150442', '0', '1498721504', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('105', '111', '100', '9', null, '4', '香烟x0.10', '149872151469', '0', '1498721514', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('106', '111', '100', '9', null, '4', '香烟x0.10', '14987226808', '0', '1498722680', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('107', '111', '100', '9', null, '2', '测试--5.00折', '149872435485', '0', '1498724354', null, '5.00');
INSERT INTO `t_sp_draw_card` VALUES ('108', '111', '100', '9', '6', '2', '测试--5.00折', '149872445119', '0', '1498724451', null, '5.00');
INSERT INTO `t_sp_draw_card` VALUES ('109', '111', '100', '9', '6', '2', '测试--5.00折', '149872454564', '0', '1498724545', null, '5.00');
INSERT INTO `t_sp_draw_card` VALUES ('110', '111', '100', null, '3', '3', '优惠券4--50.00元', '149872457641', '0', '1498724576', null, '50.00');
INSERT INTO `t_sp_draw_card` VALUES ('111', '111', '100', null, '6', '2', '测试--5.00折', '149872457775', '0', '1498724577', null, '5.00');
INSERT INTO `t_sp_draw_card` VALUES ('112', '111', '100', null, '3', '3', '优惠券4--50.00元', '14987245803', '0', '1498724580', null, '50.00');
INSERT INTO `t_sp_draw_card` VALUES ('113', '111', '100', null, '7', '4', '香烟x0.10', '149872458196', '0', '1498724581', null, '0.10');
INSERT INTO `t_sp_draw_card` VALUES ('114', '111', '100', null, '6', '2', '测试--5.00折', '149872458198', '0', '1498724581', null, '5.00');
INSERT INTO `t_sp_draw_card` VALUES ('115', '111', '100', null, '3', '3', '优惠券4--50.00元', '14987245829', '0', '1498724582', null, '50.00');
INSERT INTO `t_sp_draw_card` VALUES ('116', '111', '100', null, '6', '2', '测试--5.00折', '149872458269', '0', '1498724582', null, '5.00');
INSERT INTO `t_sp_draw_card` VALUES ('117', '111', '100', null, '6', '2', '测试--5.00折', '149872458414', '0', '1498724584', null, '5.00');
INSERT INTO `t_sp_draw_card` VALUES ('118', '111', '100', null, '3', '3', '优惠券4--50.00元', '149872458496', '0', '1498724584', null, '50.00');
INSERT INTO `t_sp_draw_card` VALUES ('119', '111', '100', '1', '6', '2', '测试--5.00折', '149872461424', '0', '1498724614', null, '5.00');
INSERT INTO `t_sp_draw_card` VALUES ('120', '111', '100', null, '6', '2', '测试--5.00折', '14987253900', '0', '1498725390', null, '5.00');
INSERT INTO `t_sp_draw_card` VALUES ('121', '111', '100', null, '6', '2', '测试--5.00折', '149872539789', '0', '1498725397', null, '5.00');
INSERT INTO `t_sp_draw_card` VALUES ('122', '111', '100', null, '6', '2', '测试--5.00折', '149872541244', '0', '1498725412', null, '5.00');
INSERT INTO `t_sp_draw_card` VALUES ('123', '111', '100', null, '6', '2', '测试--5.00折', '149872549133', '0', '1498725491', null, '5.00');
INSERT INTO `t_sp_draw_card` VALUES ('124', '111', '100', null, '6', '2', '测试--5.00折', '14987262593', '0', '1498726259', null, '5.00');
INSERT INTO `t_sp_draw_card` VALUES ('125', '111', '100', null, '6', '2', '测试--5.00折', '149872639462', '0', '1498726394', null, '5.00');
INSERT INTO `t_sp_draw_card` VALUES ('126', '111', '100', null, '6', '2', '测试--5.00折', '149872744776', '0', '1498727447', null, '5.00');

-- ----------------------------
-- Table structure for t_sp_draw_conf
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_draw_conf`;
CREATE TABLE `t_sp_draw_conf` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺ID',
  `prize` text COMMENT '奖品',
  `number` int(11) DEFAULT '0' COMMENT '分数',
  `status` tinyint(4) DEFAULT '0' COMMENT '抽奖的状态 0:关闭 1:开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商家大转盘配置表';

-- ----------------------------
-- Records of t_sp_draw_conf
-- ----------------------------
INSERT INTO `t_sp_draw_conf` VALUES ('2', '111', '100', 'a:7:{i:0;a:3:{s:4:\"odds\";s:2:\"10\";s:3:\"key\";s:1:\"3\";s:5:\"lable\";s:1:\"1\";}i:1;a:3:{s:4:\"odds\";s:2:\"50\";s:3:\"key\";s:1:\"6\";s:5:\"lable\";s:1:\"2\";}i:2;a:3:{s:4:\"odds\";s:2:\"10\";s:3:\"key\";s:1:\"7\";s:5:\"lable\";s:1:\"3\";}i:3;a:3:{s:4:\"odds\";s:2:\"10\";s:3:\"key\";s:2:\"10\";s:5:\"lable\";s:1:\"4\";}i:4;a:3:{s:4:\"odds\";s:2:\"10\";s:3:\"key\";s:2:\"10\";s:5:\"lable\";s:1:\"5\";}i:5;a:3:{s:4:\"odds\";s:1:\"5\";s:3:\"key\";s:1:\"6\";s:5:\"lable\";s:1:\"6\";}i:6;a:3:{s:4:\"odds\";s:1:\"5\";s:3:\"key\";s:1:\"3\";s:5:\"lable\";s:1:\"7\";}}', '7', '1');

-- ----------------------------
-- Table structure for t_sp_draw_record
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_draw_record`;
CREATE TABLE `t_sp_draw_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `add_time` int(10) unsigned NOT NULL COMMENT '抽奖日期',
  `shoper_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_id` int(11) unsigned NOT NULL COMMENT '门店ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sp_draw_record
-- ----------------------------
INSERT INTO `t_sp_draw_record` VALUES ('2', '38', '20170612', '114', '103');
INSERT INTO `t_sp_draw_record` VALUES ('3', '38', '20170612', '114', '103');
INSERT INTO `t_sp_draw_record` VALUES ('4', '44', '20170612', '114', '103');
INSERT INTO `t_sp_draw_record` VALUES ('5', '40', '20170613', '114', '103');
INSERT INTO `t_sp_draw_record` VALUES ('6', '57', '20170613', '114', '103');

-- ----------------------------
-- Table structure for t_sp_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_goods`;
CREATE TABLE `t_sp_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `store_id` int(11) unsigned DEFAULT NULL COMMENT '门店ＩＤ',
  `cate_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类ID',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '商品库存',
  `is_stock` tinyint(11) NOT NULL DEFAULT '0' COMMENT '是否启用库存管理 1启用 0关闭',
  `warning_store` int(11) NOT NULL DEFAULT '0' COMMENT '库存预警值',
  `sales_price` decimal(10,2) DEFAULT NULL COMMENT '销售价',
  `buy_price` decimal(10,2) DEFAULT NULL COMMENT '采购价',
  `spec` varchar(255) DEFAULT NULL COMMENT '产品规格',
  `note` varchar(255) DEFAULT NULL COMMENT '商品备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商品状态，0-上架，1-下架',
  `add_time` int(11) DEFAULT NULL COMMENT '商品添加时间',
  `unit` varchar(6) DEFAULT NULL COMMENT '单位',
  `give` tinyint(3) DEFAULT '0' COMMENT '是否能进行转配0：不能 1能转',
  `vip_grade` tinyint(3) DEFAULT '0' COMMENT '0:会员不能打折 1:能打折',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='茶坊商品表';

-- ----------------------------
-- Records of t_sp_goods
-- ----------------------------
INSERT INTO `t_sp_goods` VALUES ('44', '111', '100', '27', '测试参与库存管理的商品', '97', '1', '1', '12.00', '10.00', null, '01', '1', '1495710654', '测试单位', '0', '1');
INSERT INTO `t_sp_goods` VALUES ('45', '111', '100', '27', '测试不参与库存管理的商品', '0', '0', '10', '12.00', '10.00', null, '10', '1', '1495710680', '测试单位', '0', '1');
INSERT INTO `t_sp_goods` VALUES ('46', '111', '100', '27', '测试允许转配的商品', '0', '0', '10', '12.00', '10.00', null, '10', '1', '1495710708', '测试单位', '0', '1');
INSERT INTO `t_sp_goods` VALUES ('47', '111', '100', '27', '测试绑定原料的商品', '0', '0', '12', '12.00', '10.00', null, '10', '1', '1495710734', '测试单位', '0', '1');
INSERT INTO `t_sp_goods` VALUES ('48', '111', '100', '28', '测试分类二商品一', '0', '0', '5', '321.00', '241.00', null, '三德科技发垃圾点开放啦删掉了反馈就是打两份拉萨的弗利萨大姐夫', '1', '1495714466', '测试单位', '0', '0');
INSERT INTO `t_sp_goods` VALUES ('49', '111', '100', '28', '测试分类二商品2', '0', '0', '546', '546.00', '534.00', null, '士大夫撒旦阿萨德收到收到', '1', '1495714511', '测试单位', '0', '0');
INSERT INTO `t_sp_goods` VALUES ('50', '111', '100', '27', '赠送测试', '0', '1', '10', '12.00', '10.00', null, '01', '1', '1495763819', '测试单位', '1', '1');
INSERT INTO `t_sp_goods` VALUES ('51', '111', '100', '41', '冰雕', '0', '0', '10', '60.00', '25.00', null, '分一定要', '1', '1497853643', '杯', '0', '0');

-- ----------------------------
-- Table structure for t_sp_goods_cate
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_goods_cate`;
CREATE TABLE `t_sp_goods_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) unsigned DEFAULT NULL COMMENT '门店ＩＤ',
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类id',
  `cate_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='茶坊商品分类表';

-- ----------------------------
-- Records of t_sp_goods_cate
-- ----------------------------
INSERT INTO `t_sp_goods_cate` VALUES ('27', '100', '111', '0', '测试分类');
INSERT INTO `t_sp_goods_cate` VALUES ('28', '100', '111', '0', '测试第二个分类');
INSERT INTO `t_sp_goods_cate` VALUES ('29', '101', '112', '0', '玉溪香烟');
INSERT INTO `t_sp_goods_cate` VALUES ('30', '101', '112', '0', '恵记瓜子500K');
INSERT INTO `t_sp_goods_cate` VALUES ('31', '101', '112', '0', '打火机');
INSERT INTO `t_sp_goods_cate` VALUES ('32', '101', '112', '0', '好吃嘴');
INSERT INTO `t_sp_goods_cate` VALUES ('33', '101', '112', '0', '冷吃兔');
INSERT INTO `t_sp_goods_cate` VALUES ('34', '101', '112', '0', '冰糖菊花茶');
INSERT INTO `t_sp_goods_cate` VALUES ('35', '101', '112', '0', '竹叶青');
INSERT INTO `t_sp_goods_cate` VALUES ('36', '101', '112', '0', '生态绿毛峰');
INSERT INTO `t_sp_goods_cate` VALUES ('37', '101', '112', '0', '高级花毛峰');
INSERT INTO `t_sp_goods_cate` VALUES ('38', '101', '112', '0', '特观音');
INSERT INTO `t_sp_goods_cate` VALUES ('39', '101', '112', '0', '碧潭飘雪');
INSERT INTO `t_sp_goods_cate` VALUES ('40', '101', '112', '0', '大红袍');
INSERT INTO `t_sp_goods_cate` VALUES ('41', '100', '111', '0', '545');

-- ----------------------------
-- Table structure for t_sp_goods_to_dosing
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_goods_to_dosing`;
CREATE TABLE `t_sp_goods_to_dosing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `dosing_id` int(11) DEFAULT NULL COMMENT '原料ID',
  `number` int(10) unsigned DEFAULT '1' COMMENT '绑定数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='商品与商品原料绑定表';

-- ----------------------------
-- Records of t_sp_goods_to_dosing
-- ----------------------------
INSERT INTO `t_sp_goods_to_dosing` VALUES ('103', '47', '19', '4');
INSERT INTO `t_sp_goods_to_dosing` VALUES ('105', '51', '24', '2');
INSERT INTO `t_sp_goods_to_dosing` VALUES ('106', '51', '25', '2');

-- ----------------------------
-- Table structure for t_sp_information
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_information`;
CREATE TABLE `t_sp_information` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT '0' COMMENT '商家ID',
  `store_id` int(11) DEFAULT '0' COMMENT '店铺ID',
  `content` text COMMENT '内容',
  `reading` tinyint(4) DEFAULT '1' COMMENT '1:未读0:已读',
  `type` tinyint(4) DEFAULT '0' COMMENT '1:系统消息2商品添加3台座预定到期4商品库存预警',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8 COMMENT='消息队列配置表';

-- ----------------------------
-- Records of t_sp_information
-- ----------------------------
INSERT INTO `t_sp_information` VALUES ('538', '112', '101', '02系统将于2017-05-26 12:29:00自动取消该预定！', '0', '3', '1495772659');
INSERT INTO `t_sp_information` VALUES ('539', '112', '101', '02系统自动取消该预定！', '0', '3', '1495772960');
INSERT INTO `t_sp_information` VALUES ('540', '112', '101', '阴阳两界系统将于2017-05-26 12:41:00自动取消该预定！', '0', '3', '1495773385');
INSERT INTO `t_sp_information` VALUES ('541', '112', '101', '阴阳两界系统自动取消该预定！', '0', '3', '1495773661');
INSERT INTO `t_sp_information` VALUES ('542', '112', '101', '06系统将于2017-05-26 14:35:00自动取消该预定！', '0', '3', '1495780217');
INSERT INTO `t_sp_information` VALUES ('543', '112', '101', '07系统将于2017-05-26 15:06:00自动取消该预定！', '0', '3', '1495782061');
INSERT INTO `t_sp_information` VALUES ('544', '112', '101', '07系统自动取消该预定！', '0', '3', '1495782361');
INSERT INTO `t_sp_information` VALUES ('545', '112', '101', '07系统将于2017-05-26 16:33:00自动取消该预定！', '0', '3', '1495787281');
INSERT INTO `t_sp_information` VALUES ('546', '112', '101', '1系统将于2017-05-26 16:35:00自动取消该预定！', '0', '3', '1495787406');
INSERT INTO `t_sp_information` VALUES ('547', '112', '101', '07系统自动取消该预定！', '0', '3', '1495787581');
INSERT INTO `t_sp_information` VALUES ('548', '112', '101', '1系统自动取消该预定！', '0', '3', '1495787706');
INSERT INTO `t_sp_information` VALUES ('549', '112', '101', '07系统将于2017-05-26 16:56:00自动取消该预定！', '0', '3', '1495788678');
INSERT INTO `t_sp_information` VALUES ('550', '112', '101', '07系统自动取消该预定！', '0', '3', '1495788980');
INSERT INTO `t_sp_information` VALUES ('551', '111', '100', '02系统将于2017-06-02 17:20:00自动取消该预定！', '0', '3', '1496394902');
INSERT INTO `t_sp_information` VALUES ('552', '111', '100', '02系统自动取消该预定！', '0', '3', '1496395211');
INSERT INTO `t_sp_information` VALUES ('553', '111', '100', '02系统将于2017-06-02 17:31:00自动取消该预定！', '0', '3', '1496395561');
INSERT INTO `t_sp_information` VALUES ('554', '111', '100', '02系统自动取消该预定！', '0', '3', '1496395861');
INSERT INTO `t_sp_information` VALUES ('555', '111', '100', '测试台座系统将于2017-06-05 13:52:00自动取消该预定！', '0', '3', '1496641622');
INSERT INTO `t_sp_information` VALUES ('556', '111', '100', '【测试台座】系统自动取消该预定！', '0', '3', '1496641922');
INSERT INTO `t_sp_information` VALUES ('557', '111', '100', '【测试台座】系统将于2017-06-05 14:04:00自动取消该预定！', '0', '3', '1496642347');
INSERT INTO `t_sp_information` VALUES ('558', '111', '100', '【测试台座】系统将于2017-06-08 17:26:00自动取消该预定！', '0', '3', '1496913943');
INSERT INTO `t_sp_information` VALUES ('559', '111', '100', '【测试台座】系统自动取消该预定！', '0', '3', '1496913968');
INSERT INTO `t_sp_information` VALUES ('560', '111', '100', '【测试台座】系统自动取消该预定！', '0', '3', '1496914027');
INSERT INTO `t_sp_information` VALUES ('561', '111', '100', '【1】系统将于2017-06-13 10:51:00自动取消该预定！', '0', '3', '1497321961');
INSERT INTO `t_sp_information` VALUES ('562', '111', '100', '【1】系统自动取消该预定！', '0', '3', '1497322261');
INSERT INTO `t_sp_information` VALUES ('563', '111', '100', '【1】系统将于2017-06-19 14:28:00自动取消该预定！', '0', '3', '1497853381');
INSERT INTO `t_sp_information` VALUES ('564', '111', '100', '【1】系统自动取消该预定！', '0', '3', '1497853681');
INSERT INTO `t_sp_information` VALUES ('565', '111', '100', '【1】系统将于2017-06-21 14:13:00自动取消该预定！', '0', '3', '1498025281');
INSERT INTO `t_sp_information` VALUES ('566', '111', '100', '【1】系统自动取消该预定！', '0', '3', '1498025581');
INSERT INTO `t_sp_information` VALUES ('567', '111', '100', '【1】系统将于2017-06-26 10:16:00自动取消该预定！', '0', '3', '1498443062');
INSERT INTO `t_sp_information` VALUES ('568', '111', '100', '【1】系统自动取消该预定！', '0', '3', '1498443362');

-- ----------------------------
-- Table structure for t_sp_jiaoban
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_jiaoban`;
CREATE TABLE `t_sp_jiaoban` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT '0' COMMENT '商家id',
  `store_id` int(11) DEFAULT '0' COMMENT '门店id',
  `start_time` int(11) DEFAULT NULL COMMENT '当班开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '当班结束时间',
  `add_time` int(11) DEFAULT NULL COMMENT '交班时间',
  `auth_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家角色用户id',
  `jieban_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家接班角色用户id',
  `start_amount` decimal(10,2) DEFAULT NULL COMMENT '上班预留现金',
  `end_amount` decimal(10,2) DEFAULT NULL COMMENT '本班现金',
  `up_amount` decimal(10,2) DEFAULT NULL COMMENT '上缴现金',
  `remain_amount` decimal(10,2) DEFAULT NULL COMMENT '留存现金',
  `current_amount` decimal(10,2) DEFAULT NULL COMMENT '本班总额',
  `cash_total` decimal(10,2) DEFAULT NULL COMMENT '营业额现金总额',
  `online_total` decimal(10,2) DEFAULT NULL COMMENT '营业额线上支付总额',
  `beans_total` decimal(10,2) DEFAULT NULL COMMENT '营业额茶豆币总额',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='交班记录表';

-- ----------------------------
-- Records of t_sp_jiaoban
-- ----------------------------
INSERT INTO `t_sp_jiaoban` VALUES ('16', '112', '101', '1495746000', '1495784760', '1495784247', '75', '76', null, null, '0.00', '1000.00', '1000.00', null, null, null, '');

-- ----------------------------
-- Table structure for t_sp_jiaoban_conf
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_jiaoban_conf`;
CREATE TABLE `t_sp_jiaoban_conf` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT '0' COMMENT '商家ID',
  `store_id` int(11) DEFAULT '0' COMMENT '门店ID',
  `value` decimal(10,0) DEFAULT '0' COMMENT '交班余额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='交班配置表';

-- ----------------------------
-- Records of t_sp_jiaoban_conf
-- ----------------------------
INSERT INTO `t_sp_jiaoban_conf` VALUES ('3', '112', '101', '1000');
INSERT INTO `t_sp_jiaoban_conf` VALUES ('4', '111', '100', '100');

-- ----------------------------
-- Table structure for t_sp_order
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_order`;
CREATE TABLE `t_sp_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT '0' COMMENT '商家id',
  `store_id` int(10) unsigned DEFAULT '0' COMMENT '门店id',
  `staff_id` int(11) NOT NULL DEFAULT '0' COMMENT '员工ID',
  `charg_id` int(11) DEFAULT '0' COMMENT '计费规则',
  `wx_user_id` int(11) DEFAULT '0' COMMENT '微信用户id，从微信端下单/预订的',
  `vip_user_id` int(11) DEFAULT '0' COMMENT '会员用户id',
  `user_id` int(11) DEFAULT '0' COMMENT '结账员工',
  `table_id` int(11) DEFAULT '0' COMMENT '台桌id',
  `table_name` varchar(255) DEFAULT '' COMMENT '商家名称',
  `start_time` int(11) DEFAULT '0' COMMENT '消费开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '消费结束时间',
  `status` tinyint(3) DEFAULT NULL COMMENT '订单状态，1-消费中，2-已完成',
  `person` tinyint(3) unsigned DEFAULT '0' COMMENT '客户人数',
  `notes` varchar(120) DEFAULT '0' COMMENT '备注',
  `merge_order_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '合并订单id 主表的ID',
  `table_amount` decimal(10,2) DEFAULT '0.00' COMMENT '包间费',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总计消费金额',
  `pay_amount` decimal(10,2) DEFAULT '0.00' COMMENT '实际付款金额',
  `cash_amout` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '现金支付金额',
  `beans_amount` decimal(10,2) DEFAULT '0.00' COMMENT '茶豆币支付数量',
  `wx_pay` decimal(10,2) DEFAULT '0.00' COMMENT '微信支付多少',
  `ali_pay` decimal(10,2) DEFAULT '0.00' COMMENT '支付宝支付多少',
  `card_pay` decimal(10,2) DEFAULT '0.00' COMMENT '刷卡支付多少',
  `discount` decimal(10,2) DEFAULT '0.00' COMMENT '会员支付',
  `coupon_amount` decimal(10,2) DEFAULT '0.00' COMMENT '手动优惠',
  `is_exempt` tinyint(4) DEFAULT '0' COMMENT '1免单0不免单',
  `vip_preferential` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '会员折扣',
  `coupon` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '优惠券金额',
  `discount_money` decimal(10,2) DEFAULT '0.00' COMMENT '打折卷金额',
  `discount_on` decimal(10,2) DEFAULT NULL COMMENT '打折折扣比如8.9折',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=623 DEFAULT CHARSET=utf8 COMMENT='茶坊订单主表';

-- ----------------------------
-- Records of t_sp_order
-- ----------------------------
INSERT INTO `t_sp_order` VALUES ('592', '111', '100', '73', '2', '0', '0', '73', '204', '测试分类--02', '1497440498', '1497440524', '2', '4', '1111', '0', '0.00', '1437.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1437.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('593', '111', '100', '73', '2', '0', '46', '73', '204', '测试分类--02', '1497440691', '1497499651', '2', '4', '111', '0', '510.00', '1401.00', '0.00', '100.00', '0.00', '101.00', '100.00', '100.00', '1000.00', '0.00', '0', '0.50', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('594', '111', '100', '73', '2', '0', '46', '73', '223', '测试分类--1', '1497446437', '1497446605', '2', '4', '111', '0', '0.00', '12.00', '0.00', '20.00', '0.00', '0.00', '0.00', '0.00', '4.00', '0.00', '0', '0.50', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('595', '111', '100', '73', '2', '0', '46', '73', '223', '测试分类--1', '1497446756', '1497446791', '2', '4', '12321', '0', '0.00', '12.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '12.00', '0.00', '0', '0.50', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('596', '111', '100', '73', '2', '0', '0', '73', '204', '测试分类--02', '1497506401', '1497508906', '2', '4', '', '0', '30.00', '945.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('597', '111', '100', '73', '0', '0', '0', '0', '0', '吧台消费订单', '1497508779', '0', '1', '0', '吧台消费订单', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('598', '111', '100', '73', '0', '0', '0', '0', '0', '吧台消费订单', '1497508783', '0', '1', '0', '吧台消费订单', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('599', '111', '100', '73', '0', '0', '0', '0', '0', '吧台消费订单', '1497508786', '0', '1', '0', '吧台消费订单', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('600', '111', '100', '73', '0', '0', '0', '0', '0', '吧台消费订单', '1497508787', '0', '1', '0', '吧台消费订单', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('601', '111', '100', '73', '0', '0', '0', '0', '0', '吧台消费订单', '1497508788', '0', '1', '0', '吧台消费订单', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('602', '111', '100', '73', '0', '0', '0', '0', '0', '吧台消费订单', '1497508789', '0', '1', '0', '吧台消费订单', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('603', '111', '100', '73', '0', '0', '0', '0', '0', '吧台消费订单', '1497508789', '0', '1', '0', '吧台消费订单', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('604', '111', '100', '73', '0', '0', '0', '0', '0', '吧台消费订单', '1497508790', '0', '1', '0', '吧台消费订单', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('605', '111', '100', '73', '0', '0', '0', '0', '0', '吧台消费订单', '1497508790', '0', '1', '0', '吧台消费订单', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('606', '111', '100', '73', '0', '0', '0', '0', '0', '吧台消费订单', '1497508790', '0', '1', '0', '吧台消费订单', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('607', '111', '100', '73', '0', '0', '0', '0', '0', '吧台消费订单', '1497508791', '0', '1', '0', '吧台消费订单', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('608', '111', '100', '73', '0', '0', '0', '0', '0', '吧台消费订单', '1497508791', '0', '1', '0', '吧台消费订单', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('609', '111', '100', '73', '0', '0', '0', '0', '0', '吧台消费订单', '1497508792', '0', '1', '0', '吧台消费订单', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('610', '111', '100', '73', '0', '0', '0', '0', '0', '吧台消费订单', '1497508793', '0', '1', '0', '吧台消费订单', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('611', '111', '100', '73', '0', '0', '0', '0', '0', '吧台消费订单', '1497508794', '0', '1', '0', '吧台消费订单', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('612', '111', '100', '73', '0', '0', '0', '0', '0', '吧台消费订单', '1497508795', '0', '1', '0', '吧台消费订单', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('613', '111', '100', '73', '0', '0', '0', '0', '0', '吧台消费订单', '1497508873', '0', '1', '0', '吧台消费订单', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('614', '111', '100', '73', '2', '0', '0', '0', '204', '测试分类--02', '1497510578', '0', '1', '4', '', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('615', '111', '100', '73', '2', '0', '0', '73', '223', '测试分类--1', '1497514783', '1497514826', '2', '4', '111', '0', '0.00', '891.00', '879.00', '879.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.50', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('616', '111', '100', '73', '2', '0', '0', '73', '223', '测试分类--1', '1497514910', '1497514973', '2', '4', '11', '0', '0.00', '24.00', '12.00', '12.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.50', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('617', '111', '100', '73', '2', '0', '0', '73', '223', '测试分类--1', '1497515217', '1497515224', '2', '4', '11', '0', '0.00', '24.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('618', '111', '100', '73', '7', '0', '0', '73', '227', '23--3', '1497853170', '1497853754', '2', '4', '', '0', '0.00', '70.00', '50.00', '50.00', '0.00', '0.00', '0.00', '0.00', '0.00', '10.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('619', '111', '100', '73', '9', '0', '0', '73', '228', '23--2', '1497853223', '1497853320', '2', '4', '', '0', '0.00', '3846.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('620', '111', '100', '80', '2', '0', '48', '73', '227', '23--3', '1497855496', '1497856878', '2', '4', '2313', '0', '30.00', '30.00', '30.00', '0.00', '0.00', '0.00', '0.00', '0.00', '30.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('621', '111', '100', '80', '2', '0', '0', '0', '223', '测试分类--1', '1497959961', '0', '1', '4', 'dsd', '614', '0.00', '36.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);
INSERT INTO `t_sp_order` VALUES ('622', '111', '100', '73', '0', '0', '0', '0', '0', '吧台消费订单', '1498017565', '0', '1', '0', '吧台消费订单', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', null);

-- ----------------------------
-- Table structure for t_sp_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_order_goods`;
CREATE TABLE `t_sp_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格',
  `spec` varchar(255) DEFAULT NULL COMMENT '产品规格',
  `note` varchar(255) DEFAULT NULL COMMENT '商品备注',
  `num` int(11) DEFAULT NULL COMMENT '购买数量',
  `give` tinyint(3) NOT NULL DEFAULT '0' COMMENT '1:为赠送0:购买',
  `is_give` tinyint(3) DEFAULT '0' COMMENT '是否能进行转配 1：转配了 0没有转',
  `sum_price` decimal(10,2) DEFAULT '0.00' COMMENT '价格之和',
  `add_time` int(11) unsigned DEFAULT NULL COMMENT '添加时间',
  `is_goods` tinyint(3) unsigned DEFAULT '1' COMMENT '是否是商品',
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺ID',
  `type` tinyint(4) DEFAULT '1' COMMENT '1营业点单 2:C端点单',
  `vip_grade` tinyint(4) DEFAULT '0' COMMENT '0:会员不能打折 1:能打折',
  `discount_money` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '会员折扣享受的优惠价格',
  `discount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '会员的折扣',
  `is_discount` tinyint(3) DEFAULT '0' COMMENT '0：没有进行折扣 1：已经被折扣',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1246 DEFAULT CHARSET=utf8 COMMENT='商家订单附属表（台桌订单中消费的商品）';

-- ----------------------------
-- Records of t_sp_order_goods
-- ----------------------------
INSERT INTO `t_sp_order_goods` VALUES ('1214', '594', '45', '测试不参与库存管理的商品', '12.00', '测试单位', '10', '1', '0', '0', '6.00', '1497446442', '1', '111', '100', '1', '1', '6.00', '0.50', '1');
INSERT INTO `t_sp_order_goods` VALUES ('1215', '594', '46', '测试允许转配的商品', '12.00', '测试单位', '10', '1', '0', '0', '6.00', '1497446442', '1', '111', '100', '1', '1', '6.00', '0.50', '1');
INSERT INTO `t_sp_order_goods` VALUES ('1216', '595', '45', '测试不参与库存管理的商品', '12.00', '测试单位', '10', '1', '0', '0', '6.00', '1497446759', '1', '111', '100', '1', '1', '6.00', '0.50', '1');
INSERT INTO `t_sp_order_goods` VALUES ('1217', '595', '46', '测试允许转配的商品', '12.00', '测试单位', '10', '1', '0', '0', '6.00', '1497446759', '1', '111', '100', '1', '1', '6.00', '0.50', '1');
INSERT INTO `t_sp_order_goods` VALUES ('1218', '593', '45', '测试不参与库存管理的商品', '12.00', '测试单位', '10', '2', '0', '0', '12.00', '1497491814', '1', '111', '100', '1', '1', '12.00', '0.50', '1');
INSERT INTO `t_sp_order_goods` VALUES ('1219', '593', '46', '测试允许转配的商品', '12.00', '测试单位', '10', '2', '0', '0', '12.00', '1497491814', '1', '111', '100', '1', '1', '12.00', '0.50', '1');
INSERT INTO `t_sp_order_goods` VALUES ('1220', '593', '48', '测试分类二商品一', '321.00', '测试单位', '三德科技发垃圾点开放啦删掉了反馈就是打两份拉萨的弗利萨大姐夫', '1', '0', '0', '321.00', '1497491814', '1', '111', '100', '1', '0', '0.00', '0.00', '0');
INSERT INTO `t_sp_order_goods` VALUES ('1221', '593', '49', '测试分类二商品2', '546.00', '测试单位', '士大夫撒旦阿萨德收到收到', '1', '0', '0', '546.00', '1497491814', '1', '111', '100', '1', '0', '0.00', '0.00', '0');
INSERT INTO `t_sp_order_goods` VALUES ('1222', '596', '45', '测试不参与库存管理的商品', '12.00', '测试单位', '10', '1', '0', '0', '12.00', '1497506409', '1', '111', '100', '1', '1', '0.00', '0.00', '0');
INSERT INTO `t_sp_order_goods` VALUES ('1223', '596', '46', '测试允许转配的商品', '12.00', '测试单位', '10', '3', '0', '0', '36.00', '1497506409', '1', '111', '100', '1', '1', '0.00', '0.00', '0');
INSERT INTO `t_sp_order_goods` VALUES ('1224', '596', '48', '测试分类二商品一', '321.00', '测试单位', '三德科技发垃圾点开放啦删掉了反馈就是打两份拉萨的弗利萨大姐夫', '1', '0', '0', '321.00', '1497506409', '1', '111', '100', '1', '0', '0.00', '0.00', '0');
INSERT INTO `t_sp_order_goods` VALUES ('1225', '596', '49', '测试分类二商品2', '546.00', '测试单位', '士大夫撒旦阿萨德收到收到', '1', '0', '0', '546.00', '1497506409', '1', '111', '100', '1', '0', '0.00', '0.00', '0');
INSERT INTO `t_sp_order_goods` VALUES ('1231', '615', '45', '测试不参与库存管理的商品', '12.00', '测试单位', '10', '1', '0', '0', '6.00', '1497514788', '1', '111', '100', '1', '1', '6.00', '0.50', '1');
INSERT INTO `t_sp_order_goods` VALUES ('1232', '615', '46', '测试允许转配的商品', '12.00', '测试单位', '10', '1', '0', '0', '6.00', '1497514788', '1', '111', '100', '1', '1', '6.00', '0.50', '1');
INSERT INTO `t_sp_order_goods` VALUES ('1233', '615', '48', '测试分类二商品一', '321.00', '测试单位', '三德科技发垃圾点开放啦删掉了反馈就是打两份拉萨的弗利萨大姐夫', '1', '0', '0', '321.00', '1497514788', '1', '111', '100', '1', '0', '0.00', '0.00', '0');
INSERT INTO `t_sp_order_goods` VALUES ('1234', '615', '49', '测试分类二商品2', '546.00', '测试单位', '士大夫撒旦阿萨德收到收到', '1', '0', '0', '546.00', '1497514788', '1', '111', '100', '1', '0', '0.00', '0.00', '0');
INSERT INTO `t_sp_order_goods` VALUES ('1235', '616', '45', '测试不参与库存管理的商品', '12.00', '测试单位', '10', '1', '0', '0', '6.00', '1497514913', '1', '111', '100', '1', '1', '6.00', '0.50', '1');
INSERT INTO `t_sp_order_goods` VALUES ('1236', '616', '46', '测试允许转配的商品', '12.00', '测试单位', '10', '1', '0', '0', '6.00', '1497514913', '1', '111', '100', '1', '1', '6.00', '0.50', '1');
INSERT INTO `t_sp_order_goods` VALUES ('1237', '617', '45', '测试不参与库存管理的商品', '12.00', '测试单位', '10', '1', '0', '0', '12.00', '1497515220', '1', '111', '100', '1', '1', '0.00', '0.00', '0');
INSERT INTO `t_sp_order_goods` VALUES ('1238', '617', '46', '测试允许转配的商品', '12.00', '测试单位', '10', '1', '0', '0', '12.00', '1497515220', '1', '111', '100', '1', '1', '0.00', '0.00', '0');
INSERT INTO `t_sp_order_goods` VALUES ('1239', '619', '47', '测试绑定原料的商品', '12.00', '测试单位', '10', '2', '0', '0', '24.00', '1497853249', '1', '111', '100', '1', '1', '0.00', '0.00', '0');
INSERT INTO `t_sp_order_goods` VALUES ('1240', '619', '49', '测试分类二商品2', '546.00', '测试单位', '士大夫撒旦阿萨德收到收到', '7', '0', '0', '3822.00', '1497853249', '1', '111', '100', '1', '0', '0.00', '0.00', '0');
INSERT INTO `t_sp_order_goods` VALUES ('1241', '618', '51', '冰雕', '60.00', '杯', '分一定要', '1', '0', '0', '60.00', '1497853700', '1', '111', '100', '1', '0', '0.00', '0.00', '0');
INSERT INTO `t_sp_order_goods` VALUES ('1242', '621', '44', '测试参与库存管理的商品', '12.00', '测试单位', '01', '1', '0', '0', '12.00', '1497959965', '1', '111', '100', '1', '1', '0.00', '0.00', '0');
INSERT INTO `t_sp_order_goods` VALUES ('1243', '621', '45', '测试不参与库存管理的商品', '12.00', '测试单位', '10', '1', '0', '0', '12.00', '1497959965', '1', '111', '100', '1', '1', '0.00', '0.00', '0');
INSERT INTO `t_sp_order_goods` VALUES ('1244', '621', '46', '测试允许转配的商品', '12.00', '测试单位', '10', '1', '0', '0', '12.00', '1497959965', '1', '111', '100', '1', '1', '0.00', '0.00', '0');
INSERT INTO `t_sp_order_goods` VALUES ('1245', '621', '0', '测试分类--1', '50.00', '小时', null, '0', '0', '0', '0.00', '1497959980', '0', null, null, '1', '0', '0.00', '0.00', '0');

-- ----------------------------
-- Table structure for t_sp_pandian
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_pandian`;
CREATE TABLE `t_sp_pandian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `users_id` int(11) NOT NULL DEFAULT '0' COMMENT '盘点人（商家角色用户id）',
  `store_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `before` int(11) DEFAULT NULL COMMENT '盘点前数量',
  `after` int(11) DEFAULT NULL COMMENT '盘点后数量',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `add_time` int(11) DEFAULT NULL COMMENT '盘点时间',
  `type` tinyint(4) DEFAULT NULL COMMENT '1:商品 0:原料',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='盘点日志表';

-- ----------------------------
-- Records of t_sp_pandian
-- ----------------------------
INSERT INTO `t_sp_pandian` VALUES ('50', '111', '73', '100', '19', '0', '100', '测试', '1495710765', '0');
INSERT INTO `t_sp_pandian` VALUES ('51', '111', '73', '100', '44', '0', '100', '10', '1495710775', '1');
INSERT INTO `t_sp_pandian` VALUES ('52', '111', '73', '100', '19', '89', '12', '盘亏', '1496396414', '0');
INSERT INTO `t_sp_pandian` VALUES ('53', '111', '73', '100', '19', '0', '10', 'jkjhk', '1497852397', '0');

-- ----------------------------
-- Table structure for t_sp_payment_select
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_payment_select`;
CREATE TABLE `t_sp_payment_select` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `type` tinyint(4) DEFAULT '3' COMMENT '3:三选三 2：三选二 1：三选1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='支付选择表';

-- ----------------------------
-- Records of t_sp_payment_select
-- ----------------------------
INSERT INTO `t_sp_payment_select` VALUES ('1', '111', '100', '3');

-- ----------------------------
-- Table structure for t_sp_storage
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_storage`;
CREATE TABLE `t_sp_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `store_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `users_id` int(11) NOT NULL DEFAULT '0' COMMENT '盘点人（商家角色用户id）',
  `number` varchar(32) DEFAULT NULL COMMENT '入库编号',
  `add_time` int(11) DEFAULT NULL COMMENT '入库时间',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(11) DEFAULT NULL COMMENT '1:入库 2：出库',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='进销存入库表';

-- ----------------------------
-- Records of t_sp_storage
-- ----------------------------
INSERT INTO `t_sp_storage` VALUES ('72', '111', '100', '73', '201705260903091495760589', '1495760589', '', '1');
INSERT INTO `t_sp_storage` VALUES ('73', '111', '100', '73', '201706191456371497855397', '1497855397', '', '1');
INSERT INTO `t_sp_storage` VALUES ('74', '111', '100', '73', '201706191456551497855415', '1497855415', '', '2');
INSERT INTO `t_sp_storage` VALUES ('75', '111', '100', '73', '201706191457151497855435', '1497855435', '', '1');

-- ----------------------------
-- Table structure for t_sp_storage_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_storage_info`;
CREATE TABLE `t_sp_storage_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `users_id` int(11) DEFAULT NULL COMMENT '盘点人',
  `num` int(11) DEFAULT NULL COMMENT '入库数量',
  `add_time` int(11) DEFAULT NULL COMMENT '入库时间',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `buy_price` decimal(10,2) DEFAULT NULL COMMENT '采购价格',
  `type` tinyint(4) DEFAULT '0' COMMENT '0:原料 1:商品',
  `storage_number` varchar(32) DEFAULT NULL COMMENT '入库单据号',
  `status` tinyint(4) DEFAULT NULL COMMENT '1.入库 2.出库 3:销售出库4:回退入库',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=518 DEFAULT CHARSET=utf8 COMMENT='进销存入库表商品';

-- ----------------------------
-- Records of t_sp_storage_info
-- ----------------------------
INSERT INTO `t_sp_storage_info` VALUES ('475', '111', '100', '44', '73', '1', '1495710855', '销售出库--系统生成', '12.00', '1', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('476', '111', '100', '19', '73', '4', '1495710855', '销售出库--系统生成', '12.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('477', '111', '100', '19', '73', '2', '1495760589', '', '0.00', '0', '201705260903091495760589', '1');
INSERT INTO `t_sp_storage_info` VALUES ('478', '111', '100', '44', '73', '1', '1495762148', '销售出库--系统生成', '12.00', '1', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('479', '111', '100', '19', '73', '4', '1495762148', '销售出库--系统生成', '12.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('480', '111', '100', '19', '73', '1', '1495763679', '销售出库--系统生成', '12.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('481', '111', '100', '19', '73', '1', '1495763838', '销售回退--系统生成', '12.00', '0', '0', '4');
INSERT INTO `t_sp_storage_info` VALUES ('482', '111', '100', '19', '73', '1', '1495763863', '销售出库--系统生成', '12.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('483', '111', '100', '19', '73', '1', '1495763888', '销售回退--系统生成', '12.00', '0', '0', '4');
INSERT INTO `t_sp_storage_info` VALUES ('484', '111', '100', '20', '73', '200', '1495764349', '11', '10.00', '0', '0', '1');
INSERT INTO `t_sp_storage_info` VALUES ('485', '112', '101', '21', '74', '500', '1495770359', '2017.5.26', '0.10', '0', '0', '1');
INSERT INTO `t_sp_storage_info` VALUES ('486', '112', '101', '22', '74', '500', '1495770386', '2017.5.26', '0.10', '0', '0', '1');
INSERT INTO `t_sp_storage_info` VALUES ('487', '112', '101', '23', '74', '500', '1495770410', '2017.5.26', '0.10', '0', '0', '1');
INSERT INTO `t_sp_storage_info` VALUES ('488', '111', '100', '19', '73', '1', '1495868041', '销售出库--系统生成', '12.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('489', '111', '100', '19', '73', '4', '1495868041', '销售出库--系统生成', '12.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('490', '111', '100', '19', '73', '1', '1496626425', '销售出库--系统生成', '12.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('491', '111', '100', '19', '73', '2', '1496626428', '销售出库--系统生成', '12.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('492', '111', '100', '19', '73', '1', '1496627841', '销售出库--系统生成', '12.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('493', '111', '100', '19', '73', '1', '1496627857', '销售出库--系统生成', '12.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('494', '111', '100', '19', '73', '2', '1496627903', '销售出库--系统生成', '12.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('495', '111', '100', '19', '73', '2', '1496627969', '销售出库--系统生成', '12.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('496', '111', '100', '19', '73', '2', '1496628005', '销售出库--系统生成', '12.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('497', '111', '100', '19', '73', '1', '1496628384', '销售出库--系统生成', '12.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('498', '111', '100', '24', '73', '9', '1497852907', '新时代三', '10.00', '0', '0', '1');
INSERT INTO `t_sp_storage_info` VALUES ('499', '111', '100', '25', '73', '3', '1497852933', '撒打算', '10.00', '0', '0', '1');
INSERT INTO `t_sp_storage_info` VALUES ('500', '111', '100', '19', '73', '8', '1497853249', '销售出库--系统生成', '12.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('501', '111', '100', '24', '73', '2', '1497853700', '销售出库--系统生成', '60.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('502', '111', '100', '25', '73', '2', '1497853700', '销售出库--系统生成', '60.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('503', '111', '100', '24', '73', '1', '1497855397', '', '0.00', '0', '201706191456371497855397', '1');
INSERT INTO `t_sp_storage_info` VALUES ('504', '111', '100', '24', '73', '1', '1497855415', '', '0.00', '0', '201706191456551497855415', '2');
INSERT INTO `t_sp_storage_info` VALUES ('505', '111', '100', '24', '73', '3', '1497855435', '', '0.00', '0', '201706191457151497855435', '1');
INSERT INTO `t_sp_storage_info` VALUES ('506', '111', '100', '25', '73', '2', '1497855536', '尽快', '10.00', '0', '0', '1');
INSERT INTO `t_sp_storage_info` VALUES ('507', '111', '100', '24', '73', '2', '1497855554', '销售出库--系统生成', '60.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('508', '111', '100', '25', '73', '2', '1497855554', '销售出库--系统生成', '60.00', '0', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('509', '111', '100', '24', '73', '2', '1497855575', '销售回退--系统生成', '60.00', '0', '0', '4');
INSERT INTO `t_sp_storage_info` VALUES ('510', '111', '100', '25', '73', '2', '1497855575', '销售回退--系统生成', '60.00', '0', '0', '4');
INSERT INTO `t_sp_storage_info` VALUES ('511', '111', '100', '44', '73', '1', '1497959965', '销售出库--系统生成', '12.00', '1', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('512', '111', '100', '44', '73', '2', '1498542616', '销售出库--系统生成', '12.00', '1', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('513', '111', '100', '44', '73', '2', '1498542618', '销售回退--系统生成', '12.00', '1', '0', '4');
INSERT INTO `t_sp_storage_info` VALUES ('514', '111', '100', '44', '73', '1', '1498542685', '销售出库--系统生成', '12.00', '1', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('515', '111', '100', '44', '73', '1', '1498542691', '销售回退--系统生成', '12.00', '1', '0', '4');
INSERT INTO `t_sp_storage_info` VALUES ('516', '111', '100', '44', '73', '1', '1498542711', '销售出库--系统生成', '12.00', '1', '0', '3');
INSERT INTO `t_sp_storage_info` VALUES ('517', '111', '100', '44', '73', '1', '1498542715', '销售回退--系统生成', '12.00', '1', '0', '4');

-- ----------------------------
-- Table structure for t_sp_store
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_store`;
CREATE TABLE `t_sp_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL,
  `sp_name` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `address` varchar(255) DEFAULT NULL COMMENT '门店地址(包括省市区)',
  `lat` decimal(14,11) DEFAULT NULL COMMENT ' 纬度',
  `lon` decimal(14,11) DEFAULT NULL COMMENT '经度',
  `provinces_id` int(10) unsigned NOT NULL,
  `city_id` int(10) unsigned NOT NULL,
  `area_id` int(11) unsigned NOT NULL COMMENT '区id',
  `add_detail` varchar(100) NOT NULL COMMENT '商家详细地址',
  `sp_phone` varchar(15) DEFAULT NULL COMMENT '门店联系方式',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面图片名称',
  `intro` varchar(255) DEFAULT NULL COMMENT '店铺介绍',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `salesman_id` int(11) DEFAULT NULL COMMENT '销售人员id1版本中未使用！',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='店铺信息表';

-- ----------------------------
-- Records of t_sp_store
-- ----------------------------
INSERT INTO `t_sp_store` VALUES ('100', '111', '你不行！直接pass！', '四川省成都市武侯区环球中心W6 2028', null, null, '23', '385', '4216', '环球中心W6 2028', '0827-8816110', null, '测试店铺的数据！', '1497584518', '32');
INSERT INTO `t_sp_store` VALUES ('101', '112', '茶码头智慧茶楼', '四川省成都市武侯区高新区888号', '30.59262000000', '104.03876600000', '23', '385', '4216', '高新区888号', '18200124561', null, '', '1497584512', '32');
INSERT INTO `t_sp_store` VALUES ('102', '113', '01', '北京市东城区东华门街道01', '40.38988300000', '116.59396900000', '1', '37', '567', '01', '01', null, '', '1495779336', '32');
INSERT INTO `t_sp_store` VALUES ('111', '122', 'VB女被', '天津市河东区东新街道姑获鸟否v规避呢', null, null, '2', '56', '890', '姑获鸟否v规避呢', '12345678', null, '币鱼火火搞不赢 ', '1497577450', '32');
INSERT INTO `t_sp_store` VALUES ('112', '123', '好几款', '天津市河东区东新街道工会经费个', null, null, '2', '56', '890', '工会经费个', '456354', null, '就能看了好久', '1497577403', '32');

-- ----------------------------
-- Table structure for t_sp_table
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_table`;
CREATE TABLE `t_sp_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) unsigned DEFAULT NULL COMMENT '门店ＩＤ',
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `table_name` varchar(20) DEFAULT NULL COMMENT '台桌名称',
  `type_id` int(11) DEFAULT NULL COMMENT '台桌分类id',
  `people_num` int(11) DEFAULT NULL COMMENT '标准人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8 COMMENT='台桌表';

-- ----------------------------
-- Records of t_sp_table
-- ----------------------------
INSERT INTO `t_sp_table` VALUES ('204', '100', '111', '02', '74', '4');
INSERT INTO `t_sp_table` VALUES ('206', '101', '112', '01', '75', '4');
INSERT INTO `t_sp_table` VALUES ('207', '101', '112', '02', '75', '4');
INSERT INTO `t_sp_table` VALUES ('208', '101', '112', '03', '75', '4');
INSERT INTO `t_sp_table` VALUES ('209', '101', '112', '05', '75', '4');
INSERT INTO `t_sp_table` VALUES ('210', '101', '112', '06', '75', '2');
INSERT INTO `t_sp_table` VALUES ('211', '101', '112', '07', '75', '2');
INSERT INTO `t_sp_table` VALUES ('212', '101', '112', '09', '75', '2');
INSERT INTO `t_sp_table` VALUES ('213', '101', '112', '10', '75', '2');
INSERT INTO `t_sp_table` VALUES ('214', '101', '112', '三山四海', '77', '4');
INSERT INTO `t_sp_table` VALUES ('215', '101', '112', '高山流水', '77', '4');
INSERT INTO `t_sp_table` VALUES ('216', '101', '112', '天涯无归', '77', '4');
INSERT INTO `t_sp_table` VALUES ('217', '101', '112', '三尺青峰', '77', '4');
INSERT INTO `t_sp_table` VALUES ('218', '101', '112', '塞外宝驹', '77', '4');
INSERT INTO `t_sp_table` VALUES ('219', '101', '112', '1', '76', '3');
INSERT INTO `t_sp_table` VALUES ('220', '101', '112', '卡1', '79', '4');
INSERT INTO `t_sp_table` VALUES ('221', '101', '112', '2', '76', '3');
INSERT INTO `t_sp_table` VALUES ('222', '101', '112', '11', '75', '3');
INSERT INTO `t_sp_table` VALUES ('223', '100', '111', '1', '74', '1');
INSERT INTO `t_sp_table` VALUES ('224', '100', '111', '12', '74', '12');
INSERT INTO `t_sp_table` VALUES ('225', '100', '111', '11', '74', '111');
INSERT INTO `t_sp_table` VALUES ('226', '100', '111', '34', '74', '12');
INSERT INTO `t_sp_table` VALUES ('227', '100', '111', '3', '81', '2147483647');
INSERT INTO `t_sp_table` VALUES ('228', '100', '111', '2', '81', '45');

-- ----------------------------
-- Table structure for t_sp_table_type
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_table_type`;
CREATE TABLE `t_sp_table_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `store_id` int(11) unsigned DEFAULT NULL COMMENT '门店ＩＤ',
  `cate_name` varchar(20) DEFAULT NULL COMMENT '分类名称',
  `type` tinyint(3) DEFAULT NULL COMMENT '计费类型，1-小时计费，2-包段，3-免费',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `hour` int(11) DEFAULT NULL COMMENT '时段，单位小时',
  `deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预订诚意金',
  `classification` tinyint(3) DEFAULT '0' COMMENT '0:散座 1:包厢',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='台桌类型表';

-- ----------------------------
-- Records of t_sp_table_type
-- ----------------------------
INSERT INTO `t_sp_table_type` VALUES ('74', '111', '100', '测试分类', '1', '50.00', null, '0.00', '0');
INSERT INTO `t_sp_table_type` VALUES ('75', '112', '101', '卡座', '3', '0.00', '0', '0.00', '0');
INSERT INTO `t_sp_table_type` VALUES ('76', '112', '101', '大厅', '3', '0.00', '0', '0.00', '0');
INSERT INTO `t_sp_table_type` VALUES ('77', '112', '101', '包间', '3', '0.00', '0', '0.00', '1');
INSERT INTO `t_sp_table_type` VALUES ('79', '112', '101', '小包间', '2', '20.00', '4', '0.00', '1');
INSERT INTO `t_sp_table_type` VALUES ('80', '111', '100', '12', null, null, null, '0.00', '0');
INSERT INTO `t_sp_table_type` VALUES ('81', '111', '100', '23', null, null, null, '0.00', '1');

-- ----------------------------
-- Table structure for t_sp_unit
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_unit`;
CREATE TABLE `t_sp_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(6) DEFAULT NULL COMMENT '单位',
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺ID',
  `time` int(11) unsigned DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='茶坊单位表';

-- ----------------------------
-- Records of t_sp_unit
-- ----------------------------
INSERT INTO `t_sp_unit` VALUES ('42', '测试单位', '111', '100', '1495710605');
INSERT INTO `t_sp_unit` VALUES ('43', '包', '112', '101', '1495769732');
INSERT INTO `t_sp_unit` VALUES ('44', '克', '112', '101', '1495769741');
INSERT INTO `t_sp_unit` VALUES ('50', '杯', '111', '100', '1497852844');

-- ----------------------------
-- Table structure for t_sp_users
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_users`;
CREATE TABLE `t_sp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) unsigned DEFAULT NULL COMMENT '门店ＩＤ',
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `user` varchar(12) NOT NULL DEFAULT '' COMMENT '茶坊用户名',
  `phone` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号码、登录的唯一标识',
  `add_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0:不是超级管理员 1:是超级管理员',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:正常 1冻结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='茶坊管理系统表';

-- ----------------------------
-- Records of t_sp_users
-- ----------------------------
INSERT INTO `t_sp_users` VALUES ('73', '100', '111', '开发测试店铺', '15888888888', '1495710268', 'e10adc3949ba59abbe56e057f20f883e', '1', '0');
INSERT INTO `t_sp_users` VALUES ('74', '101', '112', '郑小均', '18200124561', '1495736157', 'e10adc3949ba59abbe56e057f20f883e', '1', '0');
INSERT INTO `t_sp_users` VALUES ('75', '101', '112', '周耀进', '18381088838', '1495767897', 'e10adc3949ba59abbe56e057f20f883e', '0', '0');
INSERT INTO `t_sp_users` VALUES ('76', '101', '112', '杨荣政', '13547957072', '1495768118', 'e10adc3949ba59abbe56e057f20f883e', '0', '0');
INSERT INTO `t_sp_users` VALUES ('77', '102', '113', '余信锴', '13438505154', '1495779336', 'e10adc3949ba59abbe56e057f20f883e', '1', '0');
INSERT INTO `t_sp_users` VALUES ('78', '111', '122', '女不能发', '18367630931', '1497434366', 'e10adc3949ba59abbe56e057f20f883e', '1', '0');
INSERT INTO `t_sp_users` VALUES ('79', '112', '123', '看还感觉', '18367630932', '1497577403', 'e10adc3949ba59abbe56e057f20f883e', '1', '0');
INSERT INTO `t_sp_users` VALUES ('80', '100', '111', '双哥', '13308025470', '1497853413', 'e10adc3949ba59abbe56e057f20f883e', '0', '0');

-- ----------------------------
-- Table structure for t_sp_vip
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_vip`;
CREATE TABLE `t_sp_vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户表ID',
  `grade_id` int(10) unsigned DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL COMMENT '手机号，以此来标识会员',
  `card_no` varchar(30) DEFAULT NULL COMMENT '会员卡号',
  `username` varchar(10) DEFAULT NULL COMMENT '会员姓名',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '累计消费总额',
  `vip_amount` decimal(10,2) DEFAULT '0.00' COMMENT '会员卡余额',
  `sex` tinyint(3) NOT NULL DEFAULT '1' COMMENT '性别1:男 2女 3保密',
  `birthday` int(11) DEFAULT NULL COMMENT '时日时间',
  `notes` varchar(120) DEFAULT '' COMMENT '备注',
  `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='茶坊会员表';

-- ----------------------------
-- Records of t_sp_vip
-- ----------------------------
INSERT INTO `t_sp_vip` VALUES ('41', '112', '0', null, '18200124561', '201705261152485558', '郑小均', '0.00', '700.00', '1', '1495728000', '', '');
INSERT INTO `t_sp_vip` VALUES ('42', '112', '0', null, '15800000000', '201705261153487692', '周耀进', '0.00', '3800.00', '1', '1495728000', '', '');
INSERT INTO `t_sp_vip` VALUES ('43', '112', '0', null, '15811111111', '201705261154311944', '杨荣政', '0.00', '99999999.99', '1', '1495728000', '', '');
INSERT INTO `t_sp_vip` VALUES ('44', '112', '0', null, '13844444444', '201705261624528654', '周杰伦', '0.00', '0.00', '1', '1495728000', '这娃唱歌厉害', '一条街');
INSERT INTO `t_sp_vip` VALUES ('46', '111', '73', '3', '13568451825', '201706121437591456', '小张', '0.00', '99004.00', '1', '1497196800', '撒', 'a\'s');
INSERT INTO `t_sp_vip` VALUES ('47', '111', '73', '5', '13568451824', '201706121438366066', '老王', '0.00', '0.00', '1', '1497196800', '阿斯达', '阿斯达');
INSERT INTO `t_sp_vip` VALUES ('48', '111', '73', '5', '13308025470', '201706191518271437', 'j', '0.00', '1470.00', '2', '1497801600', '感觉到', 'jgj都很大方');

-- ----------------------------
-- Table structure for t_sp_vip_copy
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_vip_copy`;
CREATE TABLE `t_sp_vip_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户表ID',
  `grade_id` int(10) unsigned DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL COMMENT '手机号，以此来标识会员',
  `card_no` varchar(30) DEFAULT NULL COMMENT '会员卡号',
  `username` varchar(10) DEFAULT NULL COMMENT '会员姓名',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '累计消费总额',
  `vip_amount` decimal(10,2) DEFAULT '0.00' COMMENT '会员卡余额',
  `sex` tinyint(3) NOT NULL DEFAULT '1' COMMENT '性别1:男 2女 3保密',
  `birthday` int(11) DEFAULT NULL COMMENT '时日时间',
  `notes` varchar(120) DEFAULT '' COMMENT '备注',
  `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='茶坊会员表';

-- ----------------------------
-- Records of t_sp_vip_copy
-- ----------------------------

-- ----------------------------
-- Table structure for t_sp_vip_grade
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_vip_grade`;
CREATE TABLE `t_sp_vip_grade` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL COMMENT '店铺ID',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺ID',
  `name` varchar(64) DEFAULT NULL COMMENT '等级名称',
  `discount` decimal(10,2) DEFAULT NULL COMMENT '折扣',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='会员等级';

-- ----------------------------
-- Records of t_sp_vip_grade
-- ----------------------------
INSERT INTO `t_sp_vip_grade` VALUES ('3', '111', '100', '黄金会员', '8.00');
INSERT INTO `t_sp_vip_grade` VALUES ('5', '111', '100', '砖石VIP', '2.00');

-- ----------------------------
-- Table structure for t_sp_vip_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_vip_pay`;
CREATE TABLE `t_sp_vip_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `vip_id` int(11) DEFAULT NULL COMMENT 'vip用户id',
  `amount` decimal(10,2) DEFAULT '0.00' COMMENT '充值金额',
  `add_time` int(11) DEFAULT NULL COMMENT '充值时间',
  `zs` decimal(10,2) DEFAULT '0.00' COMMENT '赠送',
  `paly_type` tinyint(3) DEFAULT NULL COMMENT '1现金 2:pos 3微信 4支付宝',
  `paly_on` varchar(24) DEFAULT '' COMMENT '会员卡充值编号',
  `pay_up_amount` decimal(10,2) DEFAULT '0.00' COMMENT '充值金额',
  `tea_user_id` int(11) DEFAULT NULL COMMENT '充值人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='会员卡充值记录表';

-- ----------------------------
-- Records of t_sp_vip_pay
-- ----------------------------
INSERT INTO `t_sp_vip_pay` VALUES ('130', '112', '41', '500.00', '1495770784', '200.00', '1', '115304201705269248', '0.00', '74');
INSERT INTO `t_sp_vip_pay` VALUES ('131', '112', '42', '2000.00', '1495770848', '800.00', '1', '11540820170526375', '0.00', '74');
INSERT INTO `t_sp_vip_pay` VALUES ('132', '112', '43', '20.00', '1495770882', '5.00', '1', '115442201705264272', '0.00', '74');
INSERT INTO `t_sp_vip_pay` VALUES ('133', '112', '42', '500.00', '1495779505', '500.00', '3', '141825201705266516', '2800.00', '75');
INSERT INTO `t_sp_vip_pay` VALUES ('134', '112', '43', '99999999.99', '1495781872', '20.00', '1', '145752201705261849', '25.00', '76');
INSERT INTO `t_sp_vip_pay` VALUES ('135', '111', '46', '100000.00', '1497335178', '0.00', '1', '142618201706138972', '0.00', '73');
INSERT INTO `t_sp_vip_pay` VALUES ('136', '111', '48', '1000.00', '1497856730', '500.00', '1', '151850201706191155', '0.00', '73');
INSERT INTO `t_sp_vip_pay` VALUES ('137', '111', '46', '10.00', '1498017726', '10.00', '1', '120206201706214473', '98984.00', '73');

-- ----------------------------
-- Table structure for t_tea_beans_config
-- ----------------------------
DROP TABLE IF EXISTS `t_tea_beans_config`;
CREATE TABLE `t_tea_beans_config` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `scale` int(11) DEFAULT NULL COMMENT '换算比例，1元钱等于多少茶豆币',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='茶豆币配置表，与钱换算比例';

-- ----------------------------
-- Records of t_tea_beans_config
-- ----------------------------
INSERT INTO `t_tea_beans_config` VALUES ('1', '1');

-- ----------------------------
-- Table structure for t_tea_beans_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_tea_beans_pay`;
CREATE TABLE `t_tea_beans_pay` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL COMMENT '充值人id，微信/商家',
  `type` tinyint(1) DEFAULT NULL COMMENT '充值人类型，1-微信用户，2-商家',
  `num` int(11) DEFAULT NULL COMMENT '充值数量',
  `add_time` int(11) DEFAULT NULL COMMENT '充值时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='茶豆币充值记录表';

-- ----------------------------
-- Records of t_tea_beans_pay
-- ----------------------------

-- ----------------------------
-- Table structure for t_unit
-- ----------------------------
DROP TABLE IF EXISTS `t_unit`;
CREATE TABLE `t_unit` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(6) DEFAULT NULL COMMENT '单位',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台单位配置表';

-- ----------------------------
-- Records of t_unit
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_users_beans_log
-- ----------------------------
DROP TABLE IF EXISTS `t_users_beans_log`;
CREATE TABLE `t_users_beans_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `num` decimal(10,2) NOT NULL DEFAULT '0.00',
  `add_time` int(11) DEFAULT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0消费; 1充值',
  `method` tinyint(1) DEFAULT '0' COMMENT '0减，1加',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户茶豆记录表，num不能为负值。';

-- ----------------------------
-- Records of t_users_beans_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_withdaw_type
-- ----------------------------
DROP TABLE IF EXISTS `t_withdaw_type`;
CREATE TABLE `t_withdaw_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '名称',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='提现方式表';

-- ----------------------------
-- Records of t_withdaw_type
-- ----------------------------

-- ----------------------------
-- Table structure for t_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `t_withdraw`;
CREATE TABLE `t_withdraw` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '提现金额',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态，0-待审核，1-已打款，2-拒绝',
  `note` varchar(255) DEFAULT NULL COMMENT '拒绝原因',
  `add_time` int(11) DEFAULT NULL COMMENT '提现时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提现记录表';

-- ----------------------------
-- Records of t_withdraw
-- ----------------------------

-- ----------------------------
-- Table structure for t_wx_user
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_user`;
CREATE TABLE `t_wx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '微信昵称',
  `add_time` int(11) DEFAULT NULL COMMENT '注册时间',
  `openid` varchar(255) DEFAULT NULL COMMENT '微信openid、',
  `beans` decimal(10,2) DEFAULT NULL COMMENT '茶豆币',
  `phone` varchar(15) DEFAULT '' COMMENT '手机号',
  `photo` varchar(255) DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='微信用户表';

-- ----------------------------
-- Records of t_wx_user
-- ----------------------------
INSERT INTO `t_wx_user` VALUES ('21', 'lrdouble', '1495710463', 'oq3EJwZZTdMP-uiJ9WZ6ybQPRtWg', null, '', 'http://wx.qlogo.cn/mmopen/oqn8fm7Qia3AEBY7ib5ia8UUlB2jeugVr4613UeLxjNlrJCr8jy8888J4ZVgRQibg6vuNicRc4LgibrIMXDPjvfwXNTlMTmYHr8res/0');
INSERT INTO `t_wx_user` VALUES ('22', '茶码头丁波', '1495711797', 'oq3EJwb4u-cN14cgTymxXa4MOWGU', null, '', 'http://wx.qlogo.cn/mmopen/Gt6WnA5IAoqklpyGplFksicj8sdKrDm1psfayJ2YiaqwHnKm18mG5ZKMuxto6aXds6ZrZ38H9YelW4BxUtiaUg1A2dBQ5CUyysZ/0');
INSERT INTO `t_wx_user` VALUES ('23', '国王不在家', '1495711967', 'oq3EJwZTUmvNdczoJp-yKf-TY0FE', null, '', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIpS5adG2HfgfKRibRO46mFuGAY7DzPesArf26huicwyuLOj6OByibhGtGuR41AicnyUzbNwucXOJeDTdupXdtibudVyGTcuov8oibT0/0');
INSERT INTO `t_wx_user` VALUES ('24', 'harlen', '1495712448', 'oq3EJwb64nNokPPBoZDB4sQY5_qg', null, '', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAlqOt0ATzCziclcxz3bFicOvjSChBrIZMPR8NFr76zxWfm8CTsry2mgKD9GBj8v2buU2tbN3St3WJA/0');
INSERT INTO `t_wx_user` VALUES ('25', '一叶知秋', '1495712945', 'oq3EJwYjo2ye4S485yv_WF-TCXN8', null, '', 'http://wx.qlogo.cn/mmopen/OJBGqcfLamIHHAsPbsSlE9kvw3xRjnubndYTaWRd7T3WmSnDIOib1MKibUJqPTv0iakhN2aFN0wHmUo2CUEcxZYEXcKQ9ogQX7R/0');
INSERT INTO `t_wx_user` VALUES ('26', 'Dream丶❁҉҉҉҉҉҉҉҉', '1495712962', 'oq3EJwfVA1bAw4c3xO3O_sKQEfOo', null, '', 'http://wx.qlogo.cn/mmopen/oqn8fm7Qia3COS4rINVsT3ZkytFxbTlxNHDHSiaIVKJG93MJeGeI7TWKVvkr4FgibJ60cPqBtacIAUeMTibXs73ndJsvhticbicxw5/0');
INSERT INTO `t_wx_user` VALUES ('27', '唐礼强', '1495730491', 'oq3EJwfaxqcRhWEuX_PY85febKic', null, '', 'http://wx.qlogo.cn/mmopen/C0rWDDnNWzVYn0LGTNUI4VQ09uEgZWibRjHq64ichwjDQb2zQyuGL6dVOoIxxECt9CPaD7uSu3qfyr8D2p5BkkKqXhIJc1Aftz/0');
INSERT INTO `t_wx_user` VALUES ('28', '。。。', '1495759190', 'oq3EJwbqsMKGNVyyAP-6cXpEteSI', null, '', 'http://wx.qlogo.cn/mmopen/Gt6WnA5IAorfFsGM9ichZClJCtg0WTrnico4GgbicDglEeWF5VasEIDxvAicHJSoI1qic6hJa8ozW9LliaMfZqvl2oSfu23kVZoecP/0');
INSERT INTO `t_wx_user` VALUES ('29', null, '1495761430', null, null, '', null);
INSERT INTO `t_wx_user` VALUES ('30', '忙忙碌碌', '1495761430', 'oq3EJwZAz8hTjxNxOqZhVUwB_gX0', null, '', 'http://wx.qlogo.cn/mmopen/C0rWDDnNWzXjUUEH7bydjzm8pemE3fzicNxr8mLLGQDBHlmiaLFIicicXMNcoDcA2icErUVHGDBRjN2Q2blj9gwn6YXJ1qhTDSiabp/0');
INSERT INTO `t_wx_user` VALUES ('31', null, '1495761543', null, null, '', null);

-- ----------------------------
-- Table structure for t_wx_user_address
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_user_address`;
CREATE TABLE `t_wx_user_address` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `wx_user_id` int(11) DEFAULT NULL COMMENT '微信用户id',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址，详细地址，包括省市区',
  `phone` varchar(15) DEFAULT NULL COMMENT '联系方式',
  `username` varchar(10) DEFAULT NULL COMMENT '收货人',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户收货地址表';

-- ----------------------------
-- Records of t_wx_user_address
-- ----------------------------
