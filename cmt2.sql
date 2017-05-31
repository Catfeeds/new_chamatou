/*
 Navicat Premium Data Transfer

 Source Server         : 39.108.61.70
 Source Server Type    : MySQL
 Source Server Version : 50554
 Source Host           : 39.108.61.70
 Source Database       : cmt2

 Target Server Type    : MySQL
 Target Server Version : 50554
 File Encoding         : utf-8

 Date: 05/27/2017 09:40:27 AM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_action_log`
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
--  Table structure for `t_active`
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
--  Table structure for `t_active_user`
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
--  Table structure for `t_ad`
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
--  Records of `t_ad`
-- ----------------------------
BEGIN;
INSERT INTO `t_ad` VALUES ('12', 'ygh', '', '20000.00', '20000.00', 'fsdfjsjfo', '0', '60', '20.00', '1489477745', null, '0', null), ('13', '爱好', '东方闪电', '6000.00', '3000.00', 'fgbfb', '0', '30', '20.00', '1489635878', null, '1', '1489642832');
COMMIT;

-- ----------------------------
--  Table structure for `t_ad_awards`
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
--  Records of `t_ad_awards`
-- ----------------------------
BEGIN;
INSERT INTO `t_ad_awards` VALUES ('1', '2', '21656', '20.00', '1236498');
COMMIT;

-- ----------------------------
--  Table structure for `t_admin`
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
--  Records of `t_admin`
-- ----------------------------
BEGIN;
INSERT INTO `t_admin` VALUES ('2', '小张', '涨涨', 'e10adc3949ba59abbe56e057f20f883e', '14712121212', 'KargmM', '1491440409', '127.0.0.1', '1489542414');
COMMIT;

-- ----------------------------
--  Table structure for `t_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role`;
CREATE TABLE `t_admin_role` (
  `admin_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_admin_role`
-- ----------------------------
BEGIN;
INSERT INTO `t_admin_role` VALUES ('3', '4'), ('2', '1'), ('3', '4'), ('4', '1'), ('3', '4');
COMMIT;

-- ----------------------------
--  Table structure for `t_adminuser`
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
--  Records of `t_adminuser`
-- ----------------------------
BEGIN;
INSERT INTO `t_adminuser` VALUES ('1', 'admin', '昂恪网络', '13812345678', 'HLUlrS3KTOEpA8M6r9h3', '$2y$13$K2cDIFZqHWavrmhsXx/Boel143GAmeplbF0KeIbk01yWJnge09IFO', null, 'a@a.com', '10', '0', '1495609898'), ('3', 'test', 'test', '15982707139', 'UaXfKPGuk9JdT17ZsKlNQFxgfs6MuJdZ', '$2y$13$p5izZRmnOg4zHiKZ9vGMuOj5v7xD3SyDPvdevNmT82MsvFze3Zhbi', null, '1210783098@qq.com', '10', '1495599360', '1495599360');
COMMIT;

-- ----------------------------
--  Table structure for `t_after_service`
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
--  Table structure for `t_auth_assignment`
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
--  Records of `t_auth_assignment`
-- ----------------------------
BEGIN;
INSERT INTO `t_auth_assignment` VALUES ('业务员管理', '1', '1495609934'), ('业务员管理', '3', '1495599394'), ('商城管理', '1', '1495609936'), ('提现管理', '1', '1495779458'), ('提现管理', '3', '1495599397'), ('权限管理', '1', '1495609942'), ('权限管理', '3', '1495599400'), ('用户管理', '1', '1495609944'), ('留言管理', '1', '1495609948'), ('统计中心', '1', '1495609948'), ('门店管理', '1', '1495609948'), ('门店管理', '3', '1495599889');
COMMIT;

-- ----------------------------
--  Table structure for `t_auth_item`
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
--  Records of `t_auth_item`
-- ----------------------------
BEGIN;
INSERT INTO `t_auth_item` VALUES ('/admin/*', '2', null, null, null, '1495598241', '1495598241'), ('/admin/assignment/*', '2', null, null, null, '1495598238', '1495598238'), ('/admin/assignment/assign', '2', null, null, null, '1495598238', '1495598238'), ('/admin/assignment/index', '2', null, null, null, '1495598238', '1495598238'), ('/admin/assignment/revoke', '2', null, null, null, '1495598238', '1495598238'), ('/admin/assignment/view', '2', null, null, null, '1495598238', '1495598238'), ('/admin/default/*', '2', null, null, null, '1495598239', '1495598239'), ('/admin/default/index', '2', null, null, null, '1495598239', '1495598239'), ('/admin/menu/*', '2', null, null, null, '1495598239', '1495598239'), ('/admin/menu/create', '2', null, null, null, '1495598239', '1495598239'), ('/admin/menu/delete', '2', null, null, null, '1495598239', '1495598239'), ('/admin/menu/index', '2', null, null, null, '1495598239', '1495598239'), ('/admin/menu/update', '2', null, null, null, '1495598239', '1495598239'), ('/admin/menu/view', '2', null, null, null, '1495598239', '1495598239'), ('/admin/permission/*', '2', null, null, null, '1495598239', '1495598239'), ('/admin/permission/assign', '2', null, null, null, '1495598239', '1495598239'), ('/admin/permission/create', '2', null, null, null, '1495598239', '1495598239'), ('/admin/permission/delete', '2', null, null, null, '1495598239', '1495598239'), ('/admin/permission/index', '2', null, null, null, '1495598239', '1495598239'), ('/admin/permission/remove', '2', null, null, null, '1495598239', '1495598239'), ('/admin/permission/update', '2', null, null, null, '1495598239', '1495598239'), ('/admin/permission/view', '2', null, null, null, '1495598239', '1495598239'), ('/admin/role/*', '2', null, null, null, '1495598240', '1495598240'), ('/admin/role/assign', '2', null, null, null, '1495598239', '1495598239'), ('/admin/role/create', '2', null, null, null, '1495598239', '1495598239'), ('/admin/role/delete', '2', null, null, null, '1495598239', '1495598239'), ('/admin/role/index', '2', null, null, null, '1495598239', '1495598239'), ('/admin/role/remove', '2', null, null, null, '1495598240', '1495598240'), ('/admin/role/update', '2', null, null, null, '1495598239', '1495598239'), ('/admin/role/view', '2', null, null, null, '1495598239', '1495598239'), ('/admin/route/*', '2', null, null, null, '1495598240', '1495598240'), ('/admin/route/assign', '2', null, null, null, '1495598240', '1495598240'), ('/admin/route/create', '2', null, null, null, '1495598240', '1495598240'), ('/admin/route/index', '2', null, null, null, '1495598240', '1495598240'), ('/admin/route/refresh', '2', null, null, null, '1495598240', '1495598240'), ('/admin/route/remove', '2', null, null, null, '1495598240', '1495598240'), ('/admin/rule/*', '2', null, null, null, '1495598240', '1495598240'), ('/admin/rule/create', '2', null, null, null, '1495598240', '1495598240'), ('/admin/rule/delete', '2', null, null, null, '1495598240', '1495598240'), ('/admin/rule/index', '2', null, null, null, '1495598240', '1495598240'), ('/admin/rule/update', '2', null, null, null, '1495598240', '1495598240'), ('/admin/rule/view', '2', null, null, null, '1495598240', '1495598240'), ('/admin/user/*', '2', null, null, null, '1495598241', '1495598241'), ('/admin/user/activate', '2', null, null, null, '1495598240', '1495598240'), ('/admin/user/change-password', '2', null, null, null, '1495598240', '1495598240'), ('/admin/user/delete', '2', null, null, null, '1495598240', '1495598240'), ('/admin/user/index', '2', null, null, null, '1495598240', '1495598240'), ('/admin/user/login', '2', null, null, null, '1495598240', '1495598240'), ('/admin/user/logout', '2', null, null, null, '1495598240', '1495598240'), ('/admin/user/request-password-reset', '2', null, null, null, '1495598240', '1495598240'), ('/admin/user/reset-password', '2', null, null, null, '1495598240', '1495598240'), ('/admin/user/signup', '2', null, null, null, '1495598240', '1495598240'), ('/admin/user/view', '2', null, null, null, '1495598240', '1495598240'), ('/adminuser/*', '2', null, null, null, '1495598242', '1495598242'), ('/adminuser/create', '2', null, null, null, '1495598242', '1495598242'), ('/adminuser/delete', '2', null, null, null, '1495598242', '1495598242'), ('/adminuser/index', '2', null, null, null, '1495598242', '1495598242'), ('/adminuser/update', '2', null, null, null, '1495598242', '1495598242'), ('/adminuser/view', '2', null, null, null, '1495598242', '1495598242'), ('/category/*', '2', null, null, null, '1495598242', '1495598242'), ('/category/add', '2', null, null, null, '1495598242', '1495598242'), ('/category/del', '2', null, null, null, '1495598242', '1495598242'), ('/category/edit', '2', null, null, null, '1495598242', '1495598242'), ('/category/index', '2', null, null, null, '1495598242', '1495598242'), ('/credit/*', '2', null, null, null, '1495598243', '1495598243'), ('/credit/create', '2', null, null, null, '1495598243', '1495598243'), ('/credit/delete', '2', null, null, null, '1495598243', '1495598243'), ('/credit/order', '2', null, null, null, '1495598242', '1495598242'), ('/credit/refund', '2', null, null, null, '1495598243', '1495598243'), ('/credit/update', '2', null, null, null, '1495598243', '1495598243'), ('/credit/view', '2', null, null, null, '1495598242', '1495598242'), ('/debug/*', '2', null, null, null, '1495598242', '1495598242'), ('/debug/default/*', '2', null, null, null, '1495598242', '1495598242'), ('/debug/default/db-explain', '2', null, null, null, '1495598241', '1495598241'), ('/debug/default/download-mail', '2', null, null, null, '1495598242', '1495598242'), ('/debug/default/index', '2', null, null, null, '1495598241', '1495598241'), ('/debug/default/toolbar', '2', null, null, null, '1495598241', '1495598241'), ('/debug/default/view', '2', null, null, null, '1495598241', '1495598241'), ('/gii/*', '2', null, null, null, '1495598242', '1495598242'), ('/gii/default/*', '2', null, null, null, '1495598242', '1495598242'), ('/gii/default/action', '2', null, null, null, '1495598242', '1495598242'), ('/gii/default/diff', '2', null, null, null, '1495598242', '1495598242'), ('/gii/default/index', '2', null, null, null, '1495598242', '1495598242'), ('/gii/default/preview', '2', null, null, null, '1495598242', '1495598242'), ('/gii/default/view', '2', null, null, null, '1495598242', '1495598242'), ('/goods/*', '2', null, null, null, '1495598243', '1495598243'), ('/goods/add', '2', null, null, null, '1495598243', '1495598243'), ('/goods/del', '2', null, null, null, '1495598243', '1495598243'), ('/goods/edit', '2', null, null, null, '1495598243', '1495598243'), ('/goods/index', '2', null, null, null, '1495598243', '1495598243'), ('/goods/shangjia', '2', null, null, null, '1495598243', '1495598243'), ('/gridview/*', '2', null, null, null, '1495598241', '1495598241'), ('/gridview/export/*', '2', null, null, null, '1495598241', '1495598241'), ('/gridview/export/download', '2', null, null, null, '1495598241', '1495598241'), ('/message/*', '2', null, null, null, '1495598243', '1495598243'), ('/message/delete', '2', null, null, null, '1495598243', '1495598243'), ('/message/index', '2', null, null, null, '1495598243', '1495598243'), ('/message/update', '2', null, null, null, '1495598243', '1495598243'), ('/message/view', '2', null, null, null, '1495598243', '1495598243'), ('/order/*', '2', null, null, null, '1495598243', '1495598243'), ('/order/excel', '2', null, null, null, '1495598243', '1495598243'), ('/order/index', '2', null, null, null, '1495598243', '1495598243'), ('/order/sed', '2', null, null, null, '1495598243', '1495598243'), ('/redactor/*', '2', null, null, null, '1495598241', '1495598241'), ('/salesman/*', '2', null, null, null, '1495598244', '1495598244'), ('/salesman/create', '2', null, null, null, '1495598243', '1495598243'), ('/salesman/delete', '2', null, null, null, '1495598243', '1495598243'), ('/salesman/index', '2', null, null, null, '1495598243', '1495598243'), ('/salesman/update', '2', null, null, null, '1495598243', '1495598243'), ('/site/*', '2', null, null, null, '1495598244', '1495598244'), ('/site/error', '2', null, null, null, '1495598244', '1495598244'), ('/site/index', '2', null, null, null, '1495598244', '1495598244'), ('/site/login', '2', null, null, null, '1495598244', '1495598244'), ('/site/logout', '2', null, null, null, '1495598244', '1495598244'), ('/statistics/*', '2', null, null, null, '1495598241', '1495598241'), ('/statistics/b2b/*', '2', null, null, null, '1495598241', '1495598241'), ('/statistics/b2b/goods', '2', null, null, null, '1495598241', '1495598241'), ('/statistics/b2b/index', '2', null, null, null, '1495598241', '1495598241'), ('/statistics/b2b/store-buy', '2', null, null, null, '1495598241', '1495598241'), ('/statistics/cdb/*', '2', null, null, null, '1495598241', '1495598241'), ('/statistics/cdb/index', '2', null, null, null, '1495598241', '1495598241'), ('/statistics/default/*', '2', null, null, null, '1495598241', '1495598241'), ('/statistics/default/index', '2', null, null, null, '1495598241', '1495598241'), ('/statistics/store/*', '2', null, null, null, '1495598241', '1495598241'), ('/statistics/store/index', '2', null, null, null, '1495598241', '1495598241'), ('/statistics/user/*', '2', null, null, null, '1495598241', '1495598241'), ('/statistics/user/index', '2', null, null, null, '1495598241', '1495598241'), ('/store/*', '2', '门店管理', null, null, '1495597295', '1495597295'), ('/store/create', '2', null, null, null, '1495597308', '1495597308'), ('/store/delete', '2', null, null, null, '1495597310', '1495597310'), ('/store/index', '2', null, null, null, '1495597306', '1495597306'), ('/store/shouxinhuankuan', '2', null, null, null, '1495597297', '1495597297'), ('/store/spstatus', '2', null, null, null, '1495597301', '1495597301'), ('/store/update', '2', null, null, null, '1495597304', '1495597304'), ('/tools/*', '2', null, null, null, '1495598244', '1495598244'), ('/tools/address', '2', null, null, null, '1495598244', '1495598244'), ('/tools/upload', '2', null, null, null, '1495598244', '1495598244'), ('/users/*', '2', null, null, null, '1495598244', '1495598244'), ('/users/userslist', '2', null, null, null, '1495598244', '1495598244'), ('/users/usersrecharge', '2', null, null, null, '1495598244', '1495598244'), ('/users/usersreduce', '2', null, null, null, '1495598244', '1495598244'), ('/withdraw/*', '2', null, null, null, '1495598244', '1495598244'), ('/withdraw/create', '2', null, null, null, '1495598244', '1495598244'), ('/withdraw/delete', '2', null, null, null, '1495598244', '1495598244'), ('/withdraw/index', '2', null, null, null, '1495598244', '1495598244'), ('/withdraw/note', '2', null, null, null, '1495598244', '1495598244'), ('/withdraw/refuse', '2', null, null, null, '1495598244', '1495598244'), ('/withdraw/update', '2', null, null, null, '1495598244', '1495598244'), ('/withdraw/via', '2', null, null, null, '1495598244', '1495598244'), ('/withdraw/view', '2', null, null, null, '1495598244', '1495598244'), ('业务员管理', '2', '业务员管理', null, null, '1495598427', '1495610448'), ('商城管理', '2', '商城 管理', null, null, '1495600573', '1495604161'), ('提现管理', '2', '提现管理', null, null, '1495598363', '1495598363'), ('权限管理', '2', '权限管理', null, null, '1495598502', '1495610580'), ('用户管理', '2', '用户管理', null, null, '1495604270', '1495604365'), ('留言管理', '2', '留言管理', null, null, '1495598394', '1495598394'), ('统计中心', '2', '统计中心', null, null, '1495598470', '1495610146'), ('门店管理', '2', '门店管理', null, null, '1495598287', '1495610623');
COMMIT;

-- ----------------------------
--  Table structure for `t_auth_item_child`
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
--  Records of `t_auth_item_child`
-- ----------------------------
BEGIN;
INSERT INTO `t_auth_item_child` VALUES ('权限管理', '/admin/*'), ('权限管理', '/admin/assignment/*'), ('权限管理', '/admin/assignment/assign'), ('权限管理', '/admin/assignment/index'), ('权限管理', '/admin/assignment/revoke'), ('权限管理', '/admin/assignment/view'), ('权限管理', '/admin/default/*'), ('权限管理', '/admin/default/index'), ('权限管理', '/admin/menu/*'), ('权限管理', '/admin/menu/create'), ('权限管理', '/admin/menu/delete'), ('权限管理', '/admin/menu/index'), ('权限管理', '/admin/menu/update'), ('权限管理', '/admin/menu/view'), ('权限管理', '/admin/permission/*'), ('权限管理', '/admin/permission/assign'), ('权限管理', '/admin/permission/create'), ('权限管理', '/admin/permission/delete'), ('权限管理', '/admin/permission/index'), ('权限管理', '/admin/permission/remove'), ('权限管理', '/admin/permission/update'), ('权限管理', '/admin/permission/view'), ('权限管理', '/admin/role/*'), ('权限管理', '/admin/role/assign'), ('权限管理', '/admin/role/create'), ('权限管理', '/admin/role/delete'), ('权限管理', '/admin/role/index'), ('权限管理', '/admin/role/remove'), ('权限管理', '/admin/role/update'), ('权限管理', '/admin/role/view'), ('权限管理', '/admin/route/*'), ('权限管理', '/admin/route/assign'), ('权限管理', '/admin/route/create'), ('权限管理', '/admin/route/index'), ('权限管理', '/admin/route/refresh'), ('权限管理', '/admin/route/remove'), ('权限管理', '/admin/rule/*'), ('权限管理', '/admin/rule/create'), ('权限管理', '/admin/rule/delete'), ('权限管理', '/admin/rule/index'), ('权限管理', '/admin/rule/update'), ('权限管理', '/admin/rule/view'), ('权限管理', '/admin/user/*'), ('权限管理', '/admin/user/activate'), ('权限管理', '/admin/user/change-password'), ('权限管理', '/admin/user/delete'), ('权限管理', '/admin/user/index'), ('权限管理', '/admin/user/login'), ('权限管理', '/admin/user/logout'), ('权限管理', '/admin/user/request-password-reset'), ('权限管理', '/admin/user/reset-password'), ('权限管理', '/admin/user/signup'), ('权限管理', '/admin/user/view'), ('权限管理', '/adminuser/*'), ('权限管理', '/adminuser/create'), ('权限管理', '/adminuser/delete'), ('权限管理', '/adminuser/index'), ('权限管理', '/adminuser/update'), ('权限管理', '/adminuser/view'), ('商城管理', '/category/*'), ('商城管理', '/category/add'), ('商城管理', '/category/del'), ('商城管理', '/category/edit'), ('商城管理', '/category/index'), ('商城管理', '/goods/*'), ('商城管理', '/goods/add'), ('商城管理', '/goods/del'), ('商城管理', '/goods/edit'), ('商城管理', '/goods/index'), ('商城管理', '/goods/shangjia'), ('留言管理', '/message/*'), ('留言管理', '/message/delete'), ('留言管理', '/message/index'), ('留言管理', '/message/update'), ('留言管理', '/message/view'), ('商城管理', '/order/*'), ('商城管理', '/order/excel'), ('商城管理', '/order/index'), ('商城管理', '/order/sed'), ('业务员管理', '/salesman/*'), ('业务员管理', '/salesman/create'), ('业务员管理', '/salesman/delete'), ('业务员管理', '/salesman/index'), ('业务员管理', '/salesman/update'), ('统计中心', '/statistics/*'), ('统计中心', '/statistics/b2b/*'), ('统计中心', '/statistics/b2b/goods'), ('统计中心', '/statistics/b2b/index'), ('统计中心', '/statistics/b2b/store-buy'), ('统计中心', '/statistics/cdb/*'), ('统计中心', '/statistics/cdb/index'), ('统计中心', '/statistics/default/*'), ('统计中心', '/statistics/default/index'), ('统计中心', '/statistics/store/*'), ('统计中心', '/statistics/store/index'), ('统计中心', '/statistics/user/*'), ('统计中心', '/statistics/user/index'), ('门店管理', '/store/*'), ('门店管理', '/store/create'), ('门店管理', '/store/delete'), ('门店管理', '/store/index'), ('门店管理', '/store/shouxinhuankuan'), ('门店管理', '/store/spstatus'), ('门店管理', '/store/update'), ('门店管理', '/tools/*'), ('门店管理', '/tools/address'), ('门店管理', '/tools/upload'), ('用户管理', '/users/*'), ('用户管理', '/users/userslist'), ('用户管理', '/users/usersrecharge'), ('用户管理', '/users/usersreduce'), ('提现管理', '/withdraw/*'), ('提现管理', '/withdraw/create'), ('提现管理', '/withdraw/delete'), ('提现管理', '/withdraw/index'), ('提现管理', '/withdraw/note'), ('提现管理', '/withdraw/refuse'), ('提现管理', '/withdraw/update'), ('提现管理', '/withdraw/via'), ('提现管理', '/withdraw/view');
COMMIT;

-- ----------------------------
--  Table structure for `t_auth_rule`
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
--  Table structure for `t_beans_goods`
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
--  Table structure for `t_express_config`
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
--  Table structure for `t_goods`
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='平台商品表';

-- ----------------------------
--  Table structure for `t_goods_cate`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_cate`;
CREATE TABLE `t_goods_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类id',
  `cate_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='平台商品分类表';

-- ----------------------------
--  Table structure for `t_images`
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
--  Table structure for `t_locations`
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
--  Records of `t_locations`
-- ----------------------------
BEGIN;
INSERT INTO `t_locations` VALUES ('1', '北京市', '0', '1'), ('2', '天津市', '0', '1'), ('3', '河北省', '0', '1'), ('4', '山西省', '0', '1'), ('5', '内蒙古自治区', '0', '1'), ('6', '辽宁省', '0', '1'), ('7', '吉林省', '0', '1'), ('8', '黑龙江省', '0', '1'), ('9', '上海市', '0', '1'), ('10', '江苏省', '0', '1'), ('11', '浙江省', '0', '1'), ('12', '安徽省', '0', '1'), ('13', '福建省', '0', '1'), ('14', '江西省', '0', '1'), ('15', '山东省', '0', '1'), ('16', '河南省', '0', '1'), ('17', '湖北省', '0', '1'), ('18', '湖南省', '0', '1'), ('19', '广东省', '0', '1'), ('20', '广西壮族自治区', '0', '1'), ('21', '海南省', '0', '1'), ('22', '重庆市', '0', '1'), ('23', '四川省', '0', '1'), ('24', '贵州省', '0', '1'), ('25', '云南省', '0', '1'), ('26', '西藏自治区', '0', '1'), ('27', '陕西省', '0', '1'), ('28', '甘肃省', '0', '1'), ('29', '青海省', '0', '1'), ('30', '宁夏回族自治区', '0', '1'), ('31', '新疆维吾尔自治区', '0', '1'), ('32', '台湾省', '0', '1'), ('33', '香港特别行政区', '0', '1'), ('34', '澳门特别行政区', '0', '1'), ('35', '海外', '0', '1'), ('36', '其他', '0', '1'), ('37', '东城区', '1', '2'), ('38', '西城区', '1', '2'), ('39', '崇文区', '1', '2'), ('40', '宣武区', '1', '2'), ('41', '朝阳区', '1', '2'), ('42', '丰台区', '1', '2'), ('43', '石景山区', '1', '2'), ('44', '海淀区', '1', '2'), ('45', '门头沟区', '1', '2'), ('46', '房山区', '1', '2'), ('47', '通州区', '1', '2'), ('48', '顺义区', '1', '2'), ('49', '昌平区', '1', '2'), ('50', '大兴区', '1', '2'), ('51', '怀柔区', '1', '2'), ('52', '平谷区', '1', '2'), ('53', '密云县', '1', '2'), ('54', '延庆县', '1', '2'), ('55', '和平区', '2', '2'), ('56', '河东区', '2', '2'), ('57', '河西区', '2', '2'), ('58', '南开区', '2', '2'), ('59', '河北区', '2', '2'), ('60', '红桥区', '2', '2'), ('61', '塘沽区', '2', '2'), ('62', '汉沽区', '2', '2'), ('63', '大港区', '2', '2'), ('64', '东丽区', '2', '2'), ('65', '西青区', '2', '2'), ('66', '津南区', '2', '2'), ('67', '北辰区', '2', '2'), ('68', '武清区', '2', '2'), ('69', '宝坻区', '2', '2'), ('70', '宁河县', '2', '2'), ('71', '静海县', '2', '2'), ('72', '蓟县', '2', '2'), ('73', '石家庄市', '3', '2'), ('74', '唐山市', '3', '2'), ('75', '秦皇岛市', '3', '2'), ('76', '邯郸市', '3', '2'), ('77', '邢台市', '3', '2'), ('78', '保定市', '3', '2'), ('79', '张家口市', '3', '2'), ('80', '承德市', '3', '2'), ('81', '衡水市', '3', '2'), ('82', '廊坊市', '3', '2'), ('83', '沧州市', '3', '2'), ('84', '太原市', '4', '2'), ('85', '大同市', '4', '2'), ('86', '阳泉市', '4', '2'), ('87', '长治市', '4', '2'), ('88', '晋城市', '4', '2'), ('89', '朔州市', '4', '2'), ('90', '晋中市', '4', '2'), ('91', '运城市', '4', '2'), ('92', '忻州市', '4', '2'), ('93', '临汾市', '4', '2'), ('94', '吕梁市', '4', '2'), ('95', '呼和浩特市', '5', '2'), ('96', '包头市', '5', '2'), ('97', '乌海市', '5', '2'), ('98', '赤峰市', '5', '2'), ('99', '通辽市', '5', '2'), ('100', '鄂尔多斯市', '5', '2'), ('101', '呼伦贝尔市', '5', '2'), ('102', '巴彦淖尔市', '5', '2'), ('103', '乌兰察布市', '5', '2'), ('104', '兴安盟', '5', '2'), ('105', '锡林郭勒盟', '5', '2'), ('106', '阿拉善盟', '5', '2'), ('107', '沈阳市', '6', '2'), ('108', '大连市', '6', '2'), ('109', '鞍山市', '6', '2'), ('110', '抚顺市', '6', '2'), ('111', '本溪市', '6', '2'), ('112', '丹东市', '6', '2'), ('113', '锦州市', '6', '2'), ('114', '营口市', '6', '2'), ('115', '阜新市', '6', '2'), ('116', '辽阳市', '6', '2'), ('117', '盘锦市', '6', '2'), ('118', '铁岭市', '6', '2'), ('119', '朝阳市', '6', '2'), ('120', '葫芦岛市', '6', '2'), ('121', '长春市', '7', '2'), ('122', '吉林市', '7', '2'), ('123', '四平市', '7', '2'), ('124', '辽源市', '7', '2'), ('125', '通化市', '7', '2'), ('126', '白山市', '7', '2'), ('127', '松原市', '7', '2'), ('128', '白城市', '7', '2'), ('129', '延边朝鲜族自治州', '7', '2'), ('130', '哈尔滨市', '8', '2'), ('131', '齐齐哈尔市', '8', '2'), ('132', '鸡西市', '8', '2'), ('133', '鹤岗市', '8', '2'), ('134', '双鸭山市', '8', '2'), ('135', '大庆市', '8', '2'), ('136', '伊春市', '8', '2'), ('137', '佳木斯市', '8', '2'), ('138', '七台河市', '8', '2'), ('139', '牡丹江市', '8', '2'), ('140', '黑河市', '8', '2'), ('141', '绥化市', '8', '2'), ('142', '大兴安岭地区', '8', '2'), ('143', '黄浦区', '9', '2'), ('144', '卢湾区', '9', '2'), ('145', '徐汇区', '9', '2'), ('146', '长宁区', '9', '2'), ('147', '静安区', '9', '2'), ('148', '普陀区', '9', '2'), ('149', '闸北区', '9', '2'), ('150', '虹口区', '9', '2'), ('151', '杨浦区', '9', '2'), ('152', '闵行区', '9', '2'), ('153', '宝山区', '9', '2'), ('154', '嘉定区', '9', '2'), ('155', '浦东新区', '9', '2'), ('156', '金山区', '9', '2'), ('157', '松江区', '9', '2'), ('158', '青浦区', '9', '2'), ('159', '南汇区', '9', '2'), ('160', '奉贤区', '9', '2'), ('161', '崇明县', '9', '2'), ('162', '南京市', '10', '2'), ('163', '无锡市', '10', '2'), ('164', '徐州市', '10', '2'), ('165', '常州市', '10', '2'), ('166', '苏州市', '10', '2'), ('167', '南通市', '10', '2'), ('168', '连云港市', '10', '2'), ('169', '淮安市', '10', '2'), ('170', '盐城市', '10', '2'), ('171', '扬州市', '10', '2'), ('172', '镇江市', '10', '2'), ('173', '泰州市', '10', '2'), ('174', '宿迁市', '10', '2'), ('175', '杭州市', '11', '2'), ('176', '宁波市', '11', '2'), ('177', '温州市', '11', '2'), ('178', '嘉兴市', '11', '2'), ('179', '湖州市', '11', '2'), ('180', '绍兴市', '11', '2'), ('181', '舟山市', '11', '2'), ('182', '衢州市', '11', '2'), ('183', '金华市', '11', '2'), ('184', '台州市', '11', '2'), ('185', '丽水市', '11', '2'), ('186', '合肥市', '12', '2'), ('187', '芜湖市', '12', '2'), ('188', '蚌埠市', '12', '2'), ('189', '淮南市', '12', '2'), ('190', '马鞍山市', '12', '2'), ('191', '淮北市', '12', '2'), ('192', '铜陵市', '12', '2'), ('193', '安庆市', '12', '2'), ('194', '黄山市', '12', '2'), ('195', '滁州市', '12', '2'), ('196', '阜阳市', '12', '2'), ('197', '宿州市', '12', '2'), ('198', '巢湖市', '12', '2'), ('199', '六安市', '12', '2'), ('200', '亳州市', '12', '2'), ('201', '池州市', '12', '2'), ('202', '宣城市', '12', '2'), ('203', '福州市', '13', '2'), ('204', '厦门市', '13', '2'), ('205', '莆田市', '13', '2'), ('206', '三明市', '13', '2'), ('207', '泉州市', '13', '2'), ('208', '漳州市', '13', '2'), ('209', '南平市', '13', '2'), ('210', '龙岩市', '13', '2'), ('211', '宁德市', '13', '2'), ('212', '南昌市', '14', '2'), ('213', '景德镇市', '14', '2'), ('214', '萍乡市', '14', '2'), ('215', '九江市', '14', '2'), ('216', '新余市', '14', '2'), ('217', '鹰潭市', '14', '2'), ('218', '赣州市', '14', '2'), ('219', '吉安市', '14', '2'), ('220', '宜春市', '14', '2'), ('221', '抚州市', '14', '2'), ('222', '上饶市', '14', '2'), ('223', '济南市', '15', '2'), ('224', '青岛市', '15', '2'), ('225', '淄博市', '15', '2'), ('226', '枣庄市', '15', '2'), ('227', '东营市', '15', '2'), ('228', '烟台市', '15', '2'), ('229', '潍坊市', '15', '2'), ('230', '济宁市', '15', '2'), ('231', '泰安市', '15', '2'), ('232', '威海市', '15', '2'), ('233', '日照市', '15', '2'), ('234', '莱芜市', '15', '2'), ('235', '临沂市', '15', '2'), ('236', '德州市', '15', '2'), ('237', '聊城市', '15', '2'), ('238', '滨州市', '15', '2'), ('239', '菏泽市', '15', '2'), ('240', '郑州市', '16', '2'), ('241', '开封市', '16', '2'), ('242', '洛阳市', '16', '2'), ('243', '平顶山市', '16', '2'), ('244', '安阳市', '16', '2'), ('245', '鹤壁市', '16', '2'), ('246', '新乡市', '16', '2'), ('247', '焦作市', '16', '2'), ('248', '濮阳市', '16', '2'), ('249', '许昌市', '16', '2'), ('250', '漯河市', '16', '2'), ('251', '三门峡市', '16', '2'), ('252', '南阳市', '16', '2'), ('253', '商丘市', '16', '2'), ('254', '信阳市', '16', '2'), ('255', '周口市', '16', '2'), ('256', '驻马店市', '16', '2'), ('257', '济源市', '16', '2'), ('258', '武汉市', '17', '2'), ('259', '黄石市', '17', '2'), ('260', '十堰市', '17', '2'), ('261', '宜昌市', '17', '2'), ('262', '襄樊市', '17', '2'), ('263', '鄂州市', '17', '2'), ('264', '荆门市', '17', '2'), ('265', '孝感市', '17', '2'), ('266', '荆州市', '17', '2'), ('267', '黄冈市', '17', '2'), ('268', '咸宁市', '17', '2'), ('269', '随州市', '17', '2'), ('270', '恩施土家族苗族自治州', '17', '2'), ('271', '仙桃市', '17', '2'), ('272', '潜江市', '17', '2'), ('273', '天门市', '17', '2'), ('274', '神农架林区', '17', '2'), ('275', '长沙市', '18', '2'), ('276', '株洲市', '18', '2'), ('277', '湘潭市', '18', '2'), ('278', '衡阳市', '18', '2'), ('279', '邵阳市', '18', '2'), ('280', '岳阳市', '18', '2'), ('281', '常德市', '18', '2'), ('282', '张家界市', '18', '2'), ('283', '益阳市', '18', '2'), ('284', '郴州市', '18', '2'), ('285', '永州市', '18', '2'), ('286', '怀化市', '18', '2'), ('287', '娄底市', '18', '2'), ('288', '湘西土家族苗族自治州', '18', '2'), ('289', '广州市', '19', '2'), ('290', '韶关市', '19', '2'), ('291', '深圳市', '19', '2'), ('292', '珠海市', '19', '2'), ('293', '汕头市', '19', '2'), ('294', '佛山市', '19', '2'), ('295', '江门市', '19', '2'), ('296', '湛江市', '19', '2'), ('297', '茂名市', '19', '2'), ('298', '肇庆市', '19', '2'), ('299', '惠州市', '19', '2'), ('300', '梅州市', '19', '2'), ('301', '汕尾市', '19', '2'), ('302', '河源市', '19', '2'), ('303', '阳江市', '19', '2'), ('304', '清远市', '19', '2'), ('305', '东莞市', '19', '2'), ('306', '中山市', '19', '2'), ('307', '潮州市', '19', '2'), ('308', '揭阳市', '19', '2'), ('309', '云浮市', '19', '2'), ('310', '南宁市', '20', '2'), ('311', '柳州市', '20', '2'), ('312', '桂林市', '20', '2'), ('313', '梧州市', '20', '2'), ('314', '北海市', '20', '2'), ('315', '防城港市', '20', '2'), ('316', '钦州市', '20', '2'), ('317', '贵港市', '20', '2'), ('318', '玉林市', '20', '2'), ('319', '百色市', '20', '2'), ('320', '贺州市', '20', '2'), ('321', '河池市', '20', '2'), ('322', '来宾市', '20', '2'), ('323', '崇左市', '20', '2'), ('324', '海口市', '21', '2'), ('325', '三亚市', '21', '2'), ('326', '五指山市', '21', '2'), ('327', '琼海市', '21', '2'), ('328', '儋州市', '21', '2'), ('329', '文昌市', '21', '2'), ('330', '万宁市', '21', '2'), ('331', '东方市', '21', '2'), ('332', '定安县', '21', '2'), ('333', '屯昌县', '21', '2'), ('334', '澄迈县', '21', '2'), ('335', '临高县', '21', '2'), ('336', '白沙黎族自治县', '21', '2'), ('337', '昌江黎族自治县', '21', '2'), ('338', '乐东黎族自治县', '21', '2'), ('339', '陵水黎族自治县', '21', '2'), ('340', '保亭黎族苗族自治县', '21', '2'), ('341', '琼中黎族苗族自治县', '21', '2'), ('342', '西沙群岛', '21', '2'), ('343', '南沙群岛', '21', '2'), ('344', '中沙群岛的岛礁及其海域', '21', '2'), ('345', '万州区', '22', '2'), ('346', '涪陵区', '22', '2'), ('347', '渝中区', '22', '2'), ('348', '大渡口区', '22', '2'), ('349', '江北区', '22', '2'), ('350', '沙坪坝区', '22', '2'), ('351', '九龙坡区', '22', '2'), ('352', '南岸区', '22', '2'), ('353', '北碚区', '22', '2'), ('354', '双桥区', '22', '2'), ('355', '万盛区', '22', '2'), ('356', '渝北区', '22', '2'), ('357', '巴南区', '22', '2'), ('358', '黔江区', '22', '2'), ('359', '长寿区', '22', '2'), ('360', '綦江县', '22', '2'), ('361', '潼南县', '22', '2'), ('362', '铜梁县', '22', '2'), ('363', '大足县', '22', '2'), ('364', '荣昌县', '22', '2'), ('365', '璧山县', '22', '2'), ('366', '梁平县', '22', '2'), ('367', '城口县', '22', '2'), ('368', '丰都县', '22', '2'), ('369', '垫江县', '22', '2'), ('370', '武隆县', '22', '2'), ('371', '忠县', '22', '2'), ('372', '开县', '22', '2'), ('373', '云阳县', '22', '2'), ('374', '奉节县', '22', '2'), ('375', '巫山县', '22', '2'), ('376', '巫溪县', '22', '2'), ('377', '石柱土家族自治县', '22', '2'), ('378', '秀山土家族苗族自治县', '22', '2'), ('379', '酉阳土家族苗族自治县', '22', '2'), ('380', '彭水苗族土家族自治县', '22', '2'), ('381', '江津市', '22', '2'), ('382', '合川市', '22', '2'), ('383', '永川市', '22', '2'), ('384', '南川市', '22', '2'), ('385', '成都市', '23', '2'), ('386', '自贡市', '23', '2'), ('387', '攀枝花市', '23', '2'), ('388', '泸州市', '23', '2'), ('389', '德阳市', '23', '2'), ('390', '绵阳市', '23', '2'), ('391', '广元市', '23', '2'), ('392', '遂宁市', '23', '2'), ('393', '内江市', '23', '2'), ('394', '乐山市', '23', '2'), ('395', '南充市', '23', '2'), ('396', '眉山市', '23', '2'), ('397', '宜宾市', '23', '2'), ('398', '广安市', '23', '2'), ('399', '达州市', '23', '2'), ('400', '雅安市', '23', '2'), ('401', '巴中市', '23', '2'), ('402', '资阳市', '23', '2'), ('403', '阿坝藏族羌族自治州', '23', '2'), ('404', '甘孜藏族自治州', '23', '2'), ('405', '凉山彝族自治州', '23', '2'), ('406', '贵阳市', '24', '2'), ('407', '六盘水市', '24', '2'), ('408', '遵义市', '24', '2'), ('409', '安顺市', '24', '2'), ('410', '铜仁地区', '24', '2'), ('411', '黔西南布依族苗族自治州', '24', '2'), ('412', '毕节地区', '24', '2'), ('413', '黔东南苗族侗族自治州', '24', '2'), ('414', '黔南布依族苗族自治州', '24', '2'), ('415', '昆明市', '25', '2'), ('416', '曲靖市', '25', '2'), ('417', '玉溪市', '25', '2'), ('418', '保山市', '25', '2'), ('419', '昭通市', '25', '2'), ('420', '丽江市', '25', '2'), ('421', '思茅市', '25', '2'), ('422', '临沧市', '25', '2'), ('423', '楚雄彝族自治州', '25', '2'), ('424', '红河哈尼族彝族自治州', '25', '2'), ('425', '文山壮族苗族自治州', '25', '2'), ('426', '西双版纳傣族自治州', '25', '2'), ('427', '大理白族自治州', '25', '2'), ('428', '德宏傣族景颇族自治州', '25', '2'), ('429', '怒江傈僳族自治州', '25', '2'), ('430', '迪庆藏族自治州', '25', '2'), ('431', '拉萨市', '26', '2'), ('432', '昌都地区', '26', '2'), ('433', '山南地区', '26', '2'), ('434', '日喀则地区', '26', '2'), ('435', '那曲地区', '26', '2'), ('436', '阿里地区', '26', '2'), ('437', '林芝地区', '26', '2'), ('438', '西安市', '27', '2'), ('439', '铜川市', '27', '2'), ('440', '宝鸡市', '27', '2'), ('441', '咸阳市', '27', '2'), ('442', '渭南市', '27', '2'), ('443', '延安市', '27', '2'), ('444', '汉中市', '27', '2'), ('445', '榆林市', '27', '2'), ('446', '安康市', '27', '2'), ('447', '商洛市', '27', '2'), ('448', '兰州市', '28', '2'), ('449', '嘉峪关市', '28', '2'), ('450', '金昌市', '28', '2'), ('451', '白银市', '28', '2'), ('452', '天水市', '28', '2'), ('453', '武威市', '28', '2'), ('454', '张掖市', '28', '2'), ('455', '平凉市', '28', '2'), ('456', '酒泉市', '28', '2'), ('457', '庆阳市', '28', '2'), ('458', '定西市', '28', '2'), ('459', '陇南市', '28', '2'), ('460', '临夏回族自治州', '28', '2'), ('461', '甘南藏族自治州', '28', '2'), ('462', '西宁市', '29', '2'), ('463', '海东地区', '29', '2'), ('464', '海北藏族自治州', '29', '2'), ('465', '黄南藏族自治州', '29', '2'), ('466', '海南藏族自治州', '29', '2'), ('467', '果洛藏族自治州', '29', '2'), ('468', '玉树藏族自治州', '29', '2'), ('469', '海西蒙古族藏族自治州', '29', '2'), ('470', '银川市', '30', '2'), ('471', '石嘴山市', '30', '2'), ('472', '吴忠市', '30', '2'), ('473', '固原市', '30', '2'), ('474', '中卫市', '30', '2'), ('475', '乌鲁木齐市', '31', '2'), ('476', '克拉玛依市', '31', '2'), ('477', '吐鲁番地区', '31', '2'), ('478', '哈密地区', '31', '2'), ('479', '昌吉回族自治州', '31', '2'), ('480', '博尔塔拉蒙古自治州', '31', '2'), ('481', '巴音郭楞蒙古自治州', '31', '2'), ('482', '阿克苏地区', '31', '2'), ('483', '克孜勒苏柯尔克孜自治州', '31', '2'), ('484', '喀什地区', '31', '2'), ('485', '和田地区', '31', '2'), ('486', '伊犁哈萨克自治州', '31', '2'), ('487', '塔城地区', '31', '2'), ('488', '阿勒泰地区', '31', '2'), ('489', '石河子市', '31', '2'), ('490', '阿拉尔市', '31', '2'), ('491', '图木舒克市', '31', '2'), ('492', '五家渠市', '31', '2'), ('493', '台北市', '32', '2'), ('494', '高雄市', '32', '2'), ('495', '基隆市', '32', '2'), ('496', '台中市', '32', '2'), ('497', '台南市', '32', '2'), ('498', '新竹市', '32', '2'), ('499', '嘉义市', '32', '2'), ('500', '台北县', '32', '2'), ('501', '宜兰县', '32', '2'), ('502', '桃园县', '32', '2'), ('503', '新竹县', '32', '2'), ('504', '苗栗县', '32', '2'), ('505', '台中县', '32', '2'), ('506', '彰化县', '32', '2'), ('507', '南投县', '32', '2'), ('508', '云林县', '32', '2'), ('509', '嘉义县', '32', '2'), ('510', '台南县', '32', '2'), ('511', '高雄县', '32', '2'), ('512', '屏东县', '32', '2'), ('513', '澎湖县', '32', '2'), ('514', '台东县', '32', '2'), ('515', '花莲县', '32', '2'), ('516', '中西区', '33', '2'), ('517', '东区', '33', '2'), ('518', '九龙城区', '33', '2'), ('519', '观塘区', '33', '2'), ('520', '南区', '33', '2'), ('521', '深水埗区', '33', '2'), ('522', '黄大仙区', '33', '2'), ('523', '湾仔区', '33', '2'), ('524', '油尖旺区', '33', '2'), ('525', '离岛区', '33', '2'), ('526', '葵青区', '33', '2'), ('527', '北区', '33', '2'), ('528', '西贡区', '33', '2'), ('529', '沙田区', '33', '2'), ('530', '屯门区', '33', '2'), ('531', '大埔区', '33', '2'), ('532', '荃湾区', '33', '2'), ('533', '元朗区', '33', '2'), ('534', '澳门特别行政区', '34', '2'), ('535', '美国', '35', '2'), ('536', '加拿大', '35', '2'), ('537', '澳大利亚', '35', '2'), ('538', '新西兰', '35', '2'), ('539', '英国', '35', '2'), ('540', '法国', '35', '2'), ('541', '德国', '35', '2'), ('542', '捷克', '35', '2'), ('543', '荷兰', '35', '2'), ('544', '瑞士', '35', '2'), ('545', '希腊', '35', '2'), ('546', '挪威', '35', '2'), ('547', '瑞典', '35', '2'), ('548', '丹麦', '35', '2'), ('549', '芬兰', '35', '2'), ('550', '爱尔兰', '35', '2'), ('551', '奥地利', '35', '2'), ('552', '意大利', '35', '2'), ('553', '乌克兰', '35', '2'), ('554', '俄罗斯', '35', '2'), ('555', '西班牙', '35', '2'), ('556', '韩国', '35', '2'), ('557', '新加坡', '35', '2'), ('558', '马来西亚', '35', '2'), ('559', '印度', '35', '2'), ('560', '泰国', '35', '2'), ('561', '日本', '35', '2'), ('562', '巴西', '35', '2'), ('563', '阿根廷', '35', '2'), ('564', '南非', '35', '2'), ('565', '埃及', '35', '2'), ('566', '其他', '36', '2'), ('567', '东华门街道', '37', '3'), ('568', '东四街道', '37', '3'), ('569', '东直门街道', '37', '3'), ('570', '交道口街道', '37', '3'), ('571', '北新桥街道', '37', '3'), ('572', '和平里街道', '37', '3'), ('573', '安定门街道', '37', '3'), ('574', '建国门街道', '37', '3'), ('575', '景山街道', '37', '3'), ('576', '朝阳门街道', '37', '3'), ('577', '什刹海街道', '38', '3'), ('578', '展览路街道', '38', '3'), ('579', '德胜街道', '38', '3'), ('580', '新街口街道', '38', '3'), ('581', '月坛街道', '38', '3'), ('582', '西长安街街道', '38', '3'), ('583', '金融街街道', '38', '3'), ('584', '东花市街道', '39', '3'), ('585', '体育馆路街道', '39', '3'), ('586', '前门街道', '39', '3'), ('587', '天坛街道', '39', '3'), ('588', '崇文门外街道', '39', '3'), ('589', '永定门外街道', '39', '3'), ('590', '龙潭街道', '39', '3'), ('591', '大栅栏街道', '40', '3'), ('592', '天桥街道', '40', '3'), ('593', '广安门内街道', '40', '3'), ('594', '广安门外街道', '40', '3'), ('595', '椿树街道', '40', '3'), ('596', '牛街街道', '40', '3'), ('597', '白纸坊街道', '40', '3'), ('598', '陶然亭街道', '40', '3'), ('599', '三里屯街道', '41', '3'), ('600', '三间房地区（三间房乡）', '41', '3'), ('601', '东坝地区（东坝乡）', '41', '3'), ('602', '东风地区（东风乡）', '41', '3'), ('603', '亚运村街道', '41', '3'), ('604', '八里庄街道', '41', '3'), ('605', '六里屯街道', '41', '3'), ('606', '劲松街道', '41', '3'), ('607', '十八里店地区（十八里店乡）', '41', '3'), ('608', '南磨房地区（南磨房乡）', '41', '3'), ('609', '双井街道', '41', '3'), ('610', '呼家楼街道', '41', '3'), ('611', '和平街街道', '41', '3'), ('612', '团结湖街道', '41', '3'), ('613', '垡头街道', '41', '3'), ('614', '大屯街道', '41', '3'), ('615', '太阳宫地区（太阳宫乡）', '41', '3'), ('616', '奥运村地区（奥运村乡）', '41', '3'), ('617', '孙河地区（孙河乡）', '41', '3'), ('618', '安贞街道', '41', '3'), ('619', '将台地区（将台乡）', '41', '3'), ('620', '小关街道', '41', '3'), ('621', '小红门地区（小红门乡）', '41', '3'), ('622', '崔各庄地区（崔各庄乡）', '41', '3'), ('623', '左家庄街道', '41', '3'), ('624', '常营回族地区（常营回族乡）', '41', '3'), ('625', '平房地区（平房乡）', '41', '3'), ('626', '建国门外街道', '41', '3'), ('627', '望京开发街道', '41', '3'), ('628', '望京街道', '41', '3'), ('629', '朝阳门外街道', '41', '3'), ('630', '来广营地区（来广营乡）', '41', '3'), ('631', '潘家园街道', '41', '3'), ('632', '王四营地区（王四营乡）', '41', '3'), ('633', '管庄地区（管庄乡）', '41', '3'), ('634', '豆各庄地区（豆各庄乡）', '41', '3'), ('635', '酒仙桥街道', '41', '3'), ('636', '金盏地区（金盏乡）', '41', '3'), ('637', '首都机场街道', '41', '3'), ('638', '香河园街道', '41', '3'), ('639', '高碑店地区（高碑店乡）', '41', '3'), ('640', '麦子店街道', '41', '3'), ('641', '黑庄户地区（黑庄户乡）', '41', '3'), ('642', '东铁匠营街道', '42', '3'), ('643', '东高地街道', '42', '3'), ('644', '丰台街道', '42', '3'), ('645', '云岗街道', '42', '3'), ('646', '南苑乡', '42', '3'), ('647', '南苑街道', '42', '3'), ('648', '卢沟桥乡', '42', '3'), ('649', '卢沟桥街道', '42', '3'), ('650', '右安门街道', '42', '3'), ('651', '和义街道', '42', '3'), ('652', '大红门街道', '42', '3'), ('653', '太平桥街道', '42', '3'), ('654', '宛平城地区', '42', '3'), ('655', '新村街道', '42', '3'), ('656', '方庄地区', '42', '3'), ('657', '王佐镇', '42', '3'), ('658', '花乡乡', '42', '3'), ('659', '西罗园街道', '42', '3'), ('660', '长辛店街道', '42', '3'), ('661', '长辛店镇', '42', '3'), ('662', '马家堡街道', '42', '3'), ('663', '五里坨街道', '43', '3'), ('664', '八宝山街道', '43', '3'), ('665', '八角街道', '43', '3'), ('666', '北辛安街道', '43', '3'), ('667', '古城街道', '43', '3'), ('668', '广宁街道', '43', '3'), ('669', '老山街道', '43', '3'), ('670', '苹果园街道', '43', '3'), ('671', '金顶街街道', '43', '3'), ('672', '鲁谷街道', '43', '3'), ('673', '万寿路街道', '44', '3'), ('674', '万柳地区（海淀乡）', '44', '3'), ('675', '上地街道', '44', '3'), ('676', '上庄镇', '44', '3'), ('677', '东升地区（东升乡）', '44', '3'), ('678', '中关村街道', '44', '3'), ('679', '八里庄街道', '44', '3'), ('680', '北下关街道', '44', '3'), ('681', '北太平庄街道', '44', '3'), ('682', '四季青镇', '44', '3'), ('683', '学院路街道', '44', '3'), ('684', '曙光街道', '44', '3'), ('685', '永定路街道', '44', '3'), ('686', '海淀街道', '44', '3'), ('687', '清华园街道', '44', '3'), ('688', '清河街道', '44', '3'), ('689', '温泉镇', '44', '3'), ('690', '燕园街道', '44', '3'), ('691', '甘家口街道', '44', '3'), ('692', '田村路街道', '44', '3'), ('693', '紫竹院街道', '44', '3'), ('694', '羊坊店街道', '44', '3'), ('695', '花园路街道', '44', '3'), ('696', '苏家坨镇', '44', '3'), ('697', '西三旗街道', '44', '3'), ('698', '西北旺镇', '44', '3'), ('699', '青龙桥街道', '44', '3'), ('700', '香山街道', '44', '3'), ('701', '马连洼街道', '44', '3'), ('702', '东辛房街道', '45', '3'), ('703', '军庄镇', '45', '3'), ('704', '城子街道', '45', '3'), ('705', '大台街道', '45', '3'), ('706', '大峪街道', '45', '3'), ('707', '妙峰山镇', '45', '3'), ('708', '斋堂镇', '45', '3'), ('709', '永定镇', '45', '3'), ('710', '清水镇', '45', '3'), ('711', '潭柘寺镇', '45', '3'), ('712', '王平地区', '45', '3'), ('713', '雁翅镇', '45', '3'), ('714', '龙泉镇', '45', '3'), ('715', '东风街道', '46', '3'), ('716', '佛子庄乡', '46', '3'), ('717', '十渡镇', '46', '3'), ('718', '南窖乡', '46', '3'), ('719', '史家营乡', '46', '3'), ('720', '向阳街道', '46', '3'), ('721', '周口店地区', '46', '3'), ('722', '城关街道', '46', '3'), ('723', '大安山乡', '46', '3'), ('724', '大石窝镇', '46', '3'), ('725', '张坊镇', '46', '3'), ('726', '拱辰街道', '46', '3'), ('727', '新镇街道', '46', '3'), ('728', '星城街道', '46', '3'), ('729', '河北镇', '46', '3'), ('730', '琉璃河地区', '46', '3'), ('731', '石楼镇', '46', '3'), ('732', '窦店镇', '46', '3'), ('733', '良乡地区', '46', '3'), ('734', '蒲洼乡', '46', '3'), ('735', '西潞街道', '46', '3'), ('736', '迎风街道', '46', '3'), ('737', '长沟镇', '46', '3'), ('738', '长阳镇', '46', '3'), ('739', '阎村镇', '46', '3'), ('740', '霞云岭乡', '46', '3'), ('741', '青龙湖镇', '46', '3'), ('742', '韩村河镇', '46', '3'), ('743', '中仓街道', '47', '3'), ('744', '于家务回族乡', '47', '3'), ('745', '北苑街道', '47', '3'), ('746', '台湖镇', '47', '3'), ('747', '宋庄镇', '47', '3'), ('748', '张家湾镇', '47', '3'), ('749', '新华街道', '47', '3'), ('750', '梨园地区', '47', '3'), ('751', '永乐店镇', '47', '3'), ('752', '永顺地区', '47', '3'), ('753', '漷县镇', '47', '3'), ('754', '潞城镇', '47', '3'), ('755', '玉桥街道', '47', '3'), ('756', '西集镇', '47', '3'), ('757', '马驹桥镇', '47', '3'), ('758', '仁和地区', '48', '3'), ('759', '光明街道', '48', '3'), ('760', '北务镇', '48', '3'), ('761', '北小营镇', '48', '3'), ('762', '北石槽镇', '48', '3'), ('763', '南彩镇', '48', '3'), ('764', '南法信地区', '48', '3'), ('765', '后沙峪地区', '48', '3'), ('766', '大孙各庄镇', '48', '3'), ('767', '天竺地区', '48', '3'), ('768', '张镇', '48', '3'), ('769', '木林镇', '48', '3'), ('770', '李桥镇', '48', '3'), ('771', '李遂镇', '48', '3'), ('772', '杨镇地区', '48', '3'), ('773', '牛栏山地区', '48', '3'), ('774', '石园街道', '48', '3'), ('775', '胜利街道', '48', '3'), ('776', '赵全营镇', '48', '3'), ('777', '马坡地区', '48', '3'), ('778', '高丽营镇', '48', '3'), ('779', '龙湾屯镇', '48', '3'), ('780', '东小口地区', '49', '3'), ('781', '兴寿镇', '49', '3'), ('782', '北七家镇', '49', '3'), ('783', '十三陵镇', '49', '3'), ('784', '南口地区', '49', '3'), ('785', '南邵镇', '49', '3'), ('786', '回龙观地区', '49', '3'), ('787', '城北街道', '49', '3'), ('788', '城南街道', '49', '3'), ('789', '小汤山镇', '49', '3'), ('790', '崔村镇', '49', '3'), ('791', '沙河地区', '49', '3'), ('792', '流村镇', '49', '3'), ('793', '百善镇', '49', '3'), ('794', '长陵镇', '49', '3'), ('795', '阳坊镇', '49', '3'), ('796', '马池口地区', '49', '3'), ('797', '亦庄地区（亦庄镇）', '50', '3'), ('798', '兴丰街道', '50', '3'), ('799', '北臧村镇', '50', '3'), ('800', '安定镇', '50', '3'), ('801', '庞各庄镇', '50', '3'), ('802', '旧宫地区（旧宫镇）', '50', '3'), ('803', '林校路街道', '50', '3'), ('804', '榆垡镇', '50', '3'), ('805', '清源街道', '50', '3'), ('806', '瀛海镇', '50', '3'), ('807', '礼贤镇', '50', '3'), ('808', '西红门地区（西红门镇）', '50', '3'), ('809', '采育镇', '50', '3'), ('810', '长子营镇', '50', '3'), ('811', '青云店镇', '50', '3'), ('812', '魏善庄镇', '50', '3'), ('813', '黄村地区（黄村镇）', '50', '3'), ('814', '九渡河镇', '51', '3'), ('815', '北房镇', '51', '3'), ('816', '喇叭沟门满族乡', '51', '3'), ('817', '宝山镇', '51', '3'), ('818', '庙城地区', '51', '3'), ('819', '怀北镇', '51', '3'), ('820', '怀柔地区', '51', '3'), ('821', '杨宋镇', '51', '3'), ('822', '桥梓镇', '51', '3'), ('823', '汤河口镇', '51', '3'), ('824', '泉河街道', '51', '3'), ('825', '渤海镇', '51', '3'), ('826', '琉璃庙镇', '51', '3'), ('827', '长哨营满族乡', '51', '3'), ('828', '雁栖地区', '51', '3'), ('829', '龙山街道', '51', '3'), ('830', '东高村镇', '52', '3'), ('831', '兴谷街道', '52', '3'), ('832', '刘家店镇', '52', '3'), ('833', '南独乐河镇', '52', '3'), ('834', '夏各庄镇', '52', '3'), ('835', '大兴庄镇', '52', '3'), ('836', '大华山镇', '52', '3'), ('837', '山东庄镇', '52', '3'), ('838', '峪口地区', '52', '3'), ('839', '渔阳地区', '52', '3'), ('840', '滨河街道', '52', '3'), ('841', '熊儿寨乡', '52', '3'), ('842', '王辛庄镇', '52', '3'), ('843', '金海湖地区', '52', '3'), ('844', '镇罗营镇', '52', '3'), ('845', '马坊地区', '52', '3'), ('846', '马昌营镇', '52', '3'), ('847', '黄松峪乡', '52', '3'), ('848', '不老屯镇', '53', '3'), ('849', '东邵渠镇', '53', '3'), ('850', '冯家峪镇', '53', '3'), ('851', '北庄镇', '53', '3'), ('852', '十里堡镇', '53', '3'), ('853', '古北口镇', '53', '3'), ('854', '大城子镇', '53', '3'), ('855', '太师屯镇', '53', '3'), ('856', '密云镇', '53', '3'), ('857', '巨各庄镇', '53', '3'), ('858', '新城子镇', '53', '3'), ('859', '果园街道', '53', '3'), ('860', '檀营地区（檀营满族蒙古族乡）', '53', '3'), ('861', '河南寨镇', '53', '3'), ('862', '溪翁庄镇', '53', '3'), ('863', '石城镇', '53', '3'), ('864', '穆家峪镇', '53', '3'), ('865', '西田各庄镇', '53', '3'), ('866', '高岭镇', '53', '3'), ('867', '鼓楼街道', '53', '3'), ('868', '井庄镇', '54', '3'), ('869', '八达岭镇', '54', '3'), ('870', '刘斌堡乡', '54', '3'), ('871', '千家店镇', '54', '3'), ('872', '四海镇', '54', '3'), ('873', '大庄科乡', '54', '3'), ('874', '大榆树镇', '54', '3'), ('875', '康庄镇', '54', '3'), ('876', '延庆镇', '54', '3'), ('877', '张山营镇', '54', '3'), ('878', '旧县镇', '54', '3'), ('879', '永宁镇', '54', '3'), ('880', '沈家营镇', '54', '3'), ('881', '珍珠泉乡', '54', '3'), ('882', '香营乡', '54', '3'), ('883', '体育馆街道', '55', '3'), ('884', '劝业场街道', '55', '3'), ('885', '南市街道', '55', '3'), ('886', '南营门街道', '55', '3'), ('887', '小白楼街道', '55', '3'), ('888', '新兴街道', '55', '3'), ('889', '上杭路街道', '56', '3'), ('890', '东新街道', '56', '3'), ('891', '中山门街道', '56', '3'), ('892', '二号桥街道', '56', '3'), ('893', '向阳楼街道', '56', '3'), ('894', '唐家口街道', '56', '3'), ('895', '大王庄街道', '56', '3'), ('896', '大直沽街道', '56', '3'), ('897', '天津铁厂街道', '56', '3'), ('898', '富民路街道', '56', '3'), ('899', '常州道街道', '56', '3'), ('900', '春华街道', '56', '3'), ('901', '鲁山道街道', '56', '3'), ('902', '下瓦房街道', '57', '3'), ('903', '东海街道', '57', '3'), ('904', '友谊路街道', '57', '3'), ('905', '大营门街道', '57', '3'), ('906', '天塔街道', '57', '3'), ('907', '尖山街道', '57', '3'), ('908', '挂甲寺街道', '57', '3'), ('909', '柳林街道', '57', '3'), ('910', '桃园街道', '57', '3'), ('911', '梅江街道', '57', '3'), ('912', '越秀路街道', '57', '3'), ('913', '陈塘庄街道', '57', '3'), ('914', '马场街道', '57', '3'), ('915', '万兴街道', '58', '3'), ('916', '体育中心街道', '58', '3'), ('917', '八里台街道', '58', '3'), ('918', '兴南街道', '58', '3'), ('919', '华苑街道', '58', '3'), ('920', '向阳路街道', '58', '3'), ('921', '嘉陵道街道', '58', '3'), ('922', '学府街道', '58', '3'), ('923', '广开街道', '58', '3'), ('924', '王顶堤街道', '58', '3'), ('925', '长虹街道', '58', '3'), ('926', '鼓楼街道', '58', '3'), ('927', '光复道街道', '59', '3'), ('928', '宁园街道', '59', '3'), ('929', '建昌道街道', '59', '3'), ('930', '新开河街道', '59', '3'), ('931', '月牙河街道', '59', '3'), ('932', '望海楼街道', '59', '3'), ('933', '江都路街道', '59', '3'), ('934', '王串场街道', '59', '3'), ('935', '铁东路街道', '59', '3'), ('936', '鸿顺里街道', '59', '3'), ('937', '丁字沽街道', '60', '3'), ('938', '三条石街道', '60', '3'), ('939', '双环村街道', '60', '3'), ('940', '咸阳北路街道', '60', '3'), ('941', '大胡同街道', '60', '3'), ('942', '芥园道街道', '60', '3'), ('943', '西于庄街道', '60', '3'), ('944', '西沽街道', '60', '3'), ('945', '邵公庄街道', '60', '3'), ('946', '铃铛阁街道', '60', '3'), ('947', '三槐路街道', '61', '3'), ('948', '北塘街道', '61', '3'), ('949', '向阳街道', '61', '3'), ('950', '大沽街道', '61', '3'), ('951', '新城镇', '61', '3'), ('952', '新村街道', '61', '3'), ('953', '新河街道', '61', '3'), ('954', '新港街道', '61', '3'), ('955', '杭州道街道', '61', '3'), ('956', '渤海石油街道', '61', '3'), ('957', '胡家园街道', '61', '3'), ('958', '解放路街道', '61', '3'), ('959', '大田镇', '62', '3'), ('960', '天化街道', '62', '3'), ('961', '寨上街道', '62', '3'), ('962', '杨家泊镇', '62', '3'), ('963', '汉沽街道', '62', '3'), ('964', '河西街道', '62', '3'), ('965', '盐场街道', '62', '3'), ('966', '茶淀镇', '62', '3'), ('967', '营城镇', '62', '3'), ('968', '中塘镇', '63', '3'), ('969', '古林街道', '63', '3'), ('970', '太平镇', '63', '3'), ('971', '小王庄镇', '63', '3'), ('972', '海滨街道', '63', '3'), ('973', '港西街道', '63', '3'), ('974', '胜利街道', '63', '3'), ('975', '迎宾街道', '63', '3'), ('976', '万新街道', '64', '3'), ('977', '丰年村街道', '64', '3'), ('978', '么六桥乡', '64', '3'), ('979', '军粮城镇', '64', '3'), ('980', '华明镇', '64', '3'), ('981', '大毕庄镇', '64', '3'), ('982', '张贵庄街道', '64', '3'), ('983', '新立街道', '64', '3'), ('984', '无瑕街道', '64', '3'), ('985', '中北镇', '65', '3'), ('986', '南河镇', '65', '3'), ('987', '大寺镇', '65', '3'), ('988', '张家窝镇', '65', '3'), ('989', '李七庄街道', '65', '3'), ('990', '杨柳青镇', '65', '3'), ('991', '王稳庄镇', '65', '3'), ('992', '西营门街道', '65', '3'), ('993', '辛口镇', '65', '3'), ('994', '八里台镇', '66', '3'), ('995', '北闸口镇', '66', '3'), ('996', '双桥河镇', '66', '3'), ('997', '双港镇', '66', '3'), ('998', '咸水沽镇', '66', '3'), ('999', '小站镇', '66', '3'), ('1000', '葛沽镇', '66', '3'), ('1001', '辛庄镇', '66', '3'), ('1002', '长青办事处', '66', '3'), ('1003', '北仓镇', '67', '3'), ('1004', '双口镇', '67', '3'), ('1005', '双街镇', '67', '3'), ('1006', '大张庄镇', '67', '3'), ('1007', '天穆镇', '67', '3'), ('1008', '宜兴埠镇', '67', '3'), ('1009', '小淀镇', '67', '3'), ('1010', '普东街道', '67', '3'), ('1011', '果园新村街道', '67', '3'), ('1012', '西堤头镇', '67', '3'), ('1013', '集贤里街道', '67', '3'), ('1014', '青光镇', '67', '3'), ('1015', '上马台镇', '68', '3'), ('1016', '下伍旗镇', '68', '3'), ('1017', '下朱庄街道', '68', '3'), ('1018', '东蒲洼街道', '68', '3'), ('1019', '东马圈镇', '68', '3'), ('1020', '南蔡村镇', '68', '3'), ('1021', '城关镇', '68', '3'), ('1022', '大孟庄镇', '68', '3'), ('1023', '大王古庄镇', '68', '3'), ('1024', '大碱厂镇', '68', '3'), ('1025', '大良镇', '68', '3'), ('1026', '大黄堡乡', '68', '3'), ('1027', '崔黄口镇', '68', '3'), ('1028', '徐官屯街道', '68', '3'), ('1029', '曹子里乡', '68', '3'), ('1030', '杨村街道', '68', '3'), ('1031', '梅厂镇', '68', '3'), ('1032', '汊沽港镇', '68', '3'), ('1033', '河北屯镇', '68', '3'), ('1034', '河西务镇', '68', '3'), ('1035', '泗村店镇', '68', '3'), ('1036', '王庆坨镇', '68', '3'), ('1037', '白古屯乡', '68', '3'), ('1038', '石各庄镇', '68', '3'), ('1039', '豆张庄乡', '68', '3'), ('1040', '运河西街道', '68', '3'), ('1041', '陈咀镇', '68', '3'), ('1042', '高村乡', '68', '3'), ('1043', '黄庄街道', '68', '3'), ('1044', '黄花店镇', '68', '3'), ('1045', '八门城镇', '69', '3'), ('1046', '口东镇', '69', '3'), ('1047', '史各庄镇', '69', '3'), ('1048', '周良庄镇', '69', '3'), ('1049', '城关镇', '69', '3'), ('1050', '大口屯镇', '69', '3'), ('1051', '大唐庄镇', '69', '3'), ('1052', '大白庄镇', '69', '3'), ('1053', '大钟庄镇', '69', '3'), ('1054', '尔王庄乡', '69', '3'), ('1055', '新安镇', '69', '3'), ('1056', '新开口镇', '69', '3'), ('1057', '方家庄镇', '69', '3'), ('1058', '林亭口镇', '69', '3'), ('1059', '牛家牌乡', '69', '3'), ('1060', '牛道口镇', '69', '3'), ('1061', '王卜庄镇', '69', '3'), ('1062', '郝各庄镇', '69', '3'), ('1063', '霍各庄镇', '69', '3'), ('1064', '马家店镇', '69', '3'), ('1065', '高家庄镇', '69', '3'), ('1066', '黄庄乡', '69', '3'), ('1067', '七里海镇', '70', '3'), ('1068', '东棘坨镇', '70', '3'), ('1069', '丰台镇', '70', '3'), ('1070', '俵口乡', '70', '3'), ('1071', '北淮淀乡', '70', '3'), ('1072', '大北涧沽镇', '70', '3'), ('1073', '宁河镇', '70', '3'), ('1074', '岳龙镇', '70', '3'), ('1075', '廉庄子乡', '70', '3'), ('1076', '板桥镇', '70', '3'), ('1077', '潘庄镇', '70', '3'), ('1078', '芦台镇', '70', '3'), ('1079', '苗庄镇', '70', '3'), ('1080', '造甲城镇', '70', '3'), ('1081', '中旺镇', '71', '3'), ('1082', '双塘镇', '71', '3'), ('1083', '台头镇', '71', '3'), ('1084', '唐官屯镇', '71', '3'), ('1085', '团泊镇', '71', '3'), ('1086', '大丰堆镇', '71', '3'), ('1087', '大邱庄镇', '71', '3'), ('1088', '子牙镇', '71', '3'), ('1089', '杨成庄乡', '71', '3'), ('1090', '梁头镇', '71', '3'), ('1091', '沿庄镇', '71', '3'), ('1092', '独流镇', '71', '3'), ('1093', '王口镇', '71', '3'), ('1094', '良王庄乡', '71', '3'), ('1095', '蔡公庄镇', '71', '3'), ('1096', '西翟庄镇', '71', '3'), ('1097', '陈官屯镇', '71', '3'), ('1098', '静海镇', '71', '3'), ('1099', '上仓镇', '72', '3'), ('1100', '下仓镇', '72', '3'), ('1101', '下窝头镇', '72', '3'), ('1102', '下营镇', '72', '3'), ('1103', '东二营乡', '72', '3'), ('1104', '东施古镇', '72', '3'), ('1105', '东赵各庄乡', '72', '3'), ('1106', '五百户镇', '72', '3'), ('1107', '侯家营镇', '72', '3'), ('1108', '出头岭镇', '72', '3'), ('1109', '别山镇', '72', '3'), ('1110', '城关镇', '72', '3'), ('1111', '孙各庄满族乡', '72', '3'), ('1112', '官庄镇', '72', '3'), ('1113', '尤古庄镇', '72', '3'), ('1114', '文昌街道', '72', '3'), ('1115', '杨津庄镇', '72', '3'), ('1116', '桑梓镇', '72', '3'), ('1117', '洇溜镇', '72', '3'), ('1118', '白涧镇', '72', '3'), ('1119', '礼明庄乡', '72', '3'), ('1120', '穿芳峪乡', '72', '3'), ('1121', '罗庄子镇', '72', '3'), ('1122', '西龙虎峪镇', '72', '3'), ('1123', '许家台乡', '72', '3'), ('1124', '邦均镇', '72', '3'), ('1125', '马伸桥镇', '72', '3'), ('1126', '井陉县', '73', '3'), ('1127', '井陉矿区', '73', '3'), ('1128', '元氏县', '73', '3'), ('1129', '平山县', '73', '3'), ('1130', '新乐市', '73', '3'), ('1131', '新华区', '73', '3'), ('1132', '无极县', '73', '3'), ('1133', '晋州市', '73', '3'), ('1134', '栾城县', '73', '3'), ('1135', '桥东区', '73', '3'), ('1136', '桥西区', '73', '3'), ('1137', '正定县', '73', '3'), ('1138', '深泽县', '73', '3'), ('1139', '灵寿县', '73', '3'), ('1140', '藁城市', '73', '3'), ('1141', '行唐县', '73', '3'), ('1142', '裕华区', '73', '3'), ('1143', '赞皇县', '73', '3'), ('1144', '赵县', '73', '3'), ('1145', '辛集市', '73', '3'), ('1146', '长安区', '73', '3'), ('1147', '高邑县', '73', '3'), ('1148', '鹿泉市', '73', '3'), ('1149', '丰南区', '74', '3'), ('1150', '丰润区', '74', '3'), ('1151', '乐亭县', '74', '3'), ('1152', '古冶区', '74', '3'), ('1153', '唐海县', '74', '3'), ('1154', '开平区', '74', '3'), ('1155', '滦南县', '74', '3'), ('1156', '滦县', '74', '3'), ('1157', '玉田县', '74', '3'), ('1158', '路北区', '74', '3'), ('1159', '路南区', '74', '3'), ('1160', '迁安市', '74', '3'), ('1161', '迁西县', '74', '3'), ('1162', '遵化市', '74', '3'), ('1163', '北戴河区', '75', '3'), ('1164', '卢龙县', '75', '3'), ('1165', '山海关区', '75', '3'), ('1166', '抚宁县', '75', '3'), ('1167', '昌黎县', '75', '3'), ('1168', '海港区', '75', '3'), ('1169', '青龙满族自治县', '75', '3'), ('1170', '丛台区', '76', '3'), ('1171', '临漳县', '76', '3'), ('1172', '复兴区', '76', '3'), ('1173', '大名县', '76', '3'), ('1174', '峰峰矿区', '76', '3'), ('1175', '广平县', '76', '3'), ('1176', '成安县', '76', '3'), ('1177', '曲周县', '76', '3'), ('1178', '武安市', '76', '3'), ('1179', '永年县', '76', '3'), ('1180', '涉县', '76', '3'), ('1181', '磁县', '76', '3'), ('1182', '肥乡县', '76', '3'), ('1183', '邯山区', '76', '3'), ('1184', '邯郸县', '76', '3'), ('1185', '邱县', '76', '3'), ('1186', '馆陶县', '76', '3'), ('1187', '魏县', '76', '3'), ('1188', '鸡泽县', '76', '3'), ('1189', '临城县', '77', '3'), ('1190', '临西县', '77', '3'), ('1191', '任县', '77', '3'), ('1192', '内丘县', '77', '3'), ('1193', '南和县', '77', '3'), ('1194', '南宫市', '77', '3'), ('1195', '威县', '77', '3'), ('1196', '宁晋县', '77', '3'), ('1197', '巨鹿县', '77', '3'), ('1198', '平乡县', '77', '3'), ('1199', '广宗县', '77', '3'), ('1200', '新河县', '77', '3'), ('1201', '柏乡县', '77', '3'), ('1202', '桥东区', '77', '3'), ('1203', '桥西区', '77', '3'), ('1204', '沙河市', '77', '3'), ('1205', '清河县', '77', '3'), ('1206', '邢台县', '77', '3'), ('1207', '隆尧县', '77', '3'), ('1208', '北市区', '78', '3'), ('1209', '南市区', '78', '3'), ('1210', '博野县', '78', '3'), ('1211', '唐县', '78', '3'), ('1212', '安国市', '78', '3'), ('1213', '安新县', '78', '3'), ('1214', '定兴县', '78', '3'), ('1215', '定州市', '78', '3'), ('1216', '容城县', '78', '3'), ('1217', '徐水县', '78', '3'), ('1218', '新市区', '78', '3'), ('1219', '易县', '78', '3'), ('1220', '曲阳县', '78', '3'), ('1221', '望都县', '78', '3'), ('1222', '涞水县', '78', '3'), ('1223', '涞源县', '78', '3'), ('1224', '涿州市', '78', '3'), ('1225', '清苑县', '78', '3'), ('1226', '满城县', '78', '3'), ('1227', '蠡县', '78', '3'), ('1228', '阜平县', '78', '3'), ('1229', '雄县', '78', '3'), ('1230', '顺平县', '78', '3'), ('1231', '高碑店市', '78', '3'), ('1232', '高阳县', '78', '3'), ('1233', '万全县', '79', '3'), ('1234', '下花园区', '79', '3'), ('1235', '宣化区', '79', '3'), ('1236', '宣化县', '79', '3'), ('1237', '尚义县', '79', '3'), ('1238', '崇礼县', '79', '3'), ('1239', '康保县', '79', '3'), ('1240', '张北县', '79', '3'), ('1241', '怀安县', '79', '3'), ('1242', '怀来县', '79', '3'), ('1243', '桥东区', '79', '3'), ('1244', '桥西区', '79', '3'), ('1245', '沽源县', '79', '3'), ('1246', '涿鹿县', '79', '3'), ('1247', '蔚县', '79', '3'), ('1248', '赤城县', '79', '3'), ('1249', '阳原县', '79', '3'), ('1250', '丰宁满族自治县', '80', '3'), ('1251', '兴隆县', '80', '3'), ('1252', '双桥区', '80', '3'), ('1253', '双滦区', '80', '3'), ('1254', '围场满族蒙古族自治县', '80', '3'), ('1255', '宽城满族自治县', '80', '3'), ('1256', '平泉县', '80', '3'), ('1257', '承德县', '80', '3'), ('1258', '滦平县', '80', '3'), ('1259', '隆化县', '80', '3'), ('1260', '鹰手营子矿区', '80', '3'), ('1261', '冀州市', '81', '3'), ('1262', '安平县', '81', '3'), ('1263', '故城县', '81', '3'), ('1264', '景县', '81', '3'), ('1265', '枣强县', '81', '3'), ('1266', '桃城区', '81', '3'), ('1267', '武强县', '81', '3'), ('1268', '武邑县', '81', '3'), ('1269', '深州市', '81', '3'), ('1270', '阜城县', '81', '3'), ('1271', '饶阳县', '81', '3'), ('1272', '三河市', '82', '3'), ('1273', '固安县', '82', '3'), ('1274', '大厂回族自治县', '82', '3'), ('1275', '大城县', '82', '3'), ('1276', '安次区', '82', '3'), ('1277', '广阳区', '82', '3'), ('1278', '文安县', '82', '3'), ('1279', '永清县', '82', '3'), ('1280', '霸州市', '82', '3'), ('1281', '香河县', '82', '3'), ('1282', '东光县', '83', '3'), ('1283', '任丘市', '83', '3'), ('1284', '南皮县', '83', '3'), ('1285', '吴桥县', '83', '3'), ('1286', '孟村回族自治县', '83', '3'), ('1287', '新华区', '83', '3'), ('1288', '沧县', '83', '3'), ('1289', '河间市', '83', '3'), ('1290', '泊头市', '83', '3'), ('1291', '海兴县', '83', '3'), ('1292', '献县', '83', '3'), ('1293', '盐山县', '83', '3'), ('1294', '肃宁县', '83', '3'), ('1295', '运河区', '83', '3'), ('1296', '青县', '83', '3'), ('1297', '黄骅市', '83', '3'), ('1298', '万柏林区', '84', '3'), ('1299', '古交市', '84', '3'), ('1300', '娄烦县', '84', '3'), ('1301', '小店区', '84', '3'), ('1302', '尖草坪区', '84', '3'), ('1303', '晋源区', '84', '3'), ('1304', '杏花岭区', '84', '3'), ('1305', '清徐县', '84', '3'), ('1306', '迎泽区', '84', '3'), ('1307', '阳曲县', '84', '3'), ('1308', '南郊区', '85', '3'), ('1309', '城区', '85', '3'), ('1310', '大同县', '85', '3'), ('1311', '天镇县', '85', '3'), ('1312', '左云县', '85', '3'), ('1313', '广灵县', '85', '3'), ('1314', '新荣区', '85', '3'), ('1315', '浑源县', '85', '3'), ('1316', '灵丘县', '85', '3'), ('1317', '矿区', '85', '3'), ('1318', '阳高县', '85', '3'), ('1319', '城区', '86', '3'), ('1320', '平定县', '86', '3'), ('1321', '盂县', '86', '3'), ('1322', '矿区', '86', '3'), ('1323', '郊区', '86', '3'), ('1324', '城区', '87', '3'), ('1325', '壶关县', '87', '3'), ('1326', '屯留县', '87', '3'), ('1327', '平顺县', '87', '3'), ('1328', '武乡县', '87', '3'), ('1329', '沁县', '87', '3'), ('1330', '沁源县', '87', '3'), ('1331', '潞城市', '87', '3'), ('1332', '襄垣县', '87', '3'), ('1333', '郊区', '87', '3'), ('1334', '长子县', '87', '3'), ('1335', '长治县', '87', '3'), ('1336', '黎城县', '87', '3'), ('1337', '城区', '88', '3'), ('1338', '沁水县', '88', '3'), ('1339', '泽州县', '88', '3'), ('1340', '阳城县', '88', '3'), ('1341', '陵川县', '88', '3'), ('1342', '高平市', '88', '3'), ('1343', '右玉县', '89', '3'), ('1344', '山阴县', '89', '3'), ('1345', '平鲁区', '89', '3'), ('1346', '应县', '89', '3'), ('1347', '怀仁县', '89', '3'), ('1348', '朔城区', '89', '3'), ('1349', '介休市', '90', '3'), ('1350', '和顺县', '90', '3'), ('1351', '太谷县', '90', '3'), ('1352', '寿阳县', '90', '3'), ('1353', '左权县', '90', '3'), ('1354', '平遥县', '90', '3'), ('1355', '昔阳县', '90', '3'), ('1356', '榆次区', '90', '3'), ('1357', '榆社县', '90', '3'), ('1358', '灵石县', '90', '3'), ('1359', '祁县', '90', '3'), ('1360', '万荣县', '91', '3'), ('1361', '临猗县', '91', '3'), ('1362', '垣曲县', '91', '3'), ('1363', '夏县', '91', '3'), ('1364', '平陆县', '91', '3'), ('1365', '新绛县', '91', '3'), ('1366', '永济市', '91', '3'), ('1367', '河津市', '91', '3'), ('1368', '盐湖区', '91', '3'), ('1369', '稷山县', '91', '3'), ('1370', '绛县', '91', '3'), ('1371', '芮城县', '91', '3'), ('1372', '闻喜县', '91', '3'), ('1373', '五台县', '92', '3'), ('1374', '五寨县', '92', '3'), ('1375', '代县', '92', '3'), ('1376', '保德县', '92', '3'), ('1377', '偏关县', '92', '3'), ('1378', '原平市', '92', '3'), ('1379', '宁武县', '92', '3'), ('1380', '定襄县', '92', '3'), ('1381', '岢岚县', '92', '3'), ('1382', '忻府区', '92', '3'), ('1383', '河曲县', '92', '3'), ('1384', '神池县', '92', '3'), ('1385', '繁峙县', '92', '3'), ('1386', '静乐县', '92', '3'), ('1387', '乡宁县', '93', '3'), ('1388', '侯马市', '93', '3'), ('1389', '古县', '93', '3'), ('1390', '吉县', '93', '3'), ('1391', '大宁县', '93', '3'), ('1392', '安泽县', '93', '3'), ('1393', '尧都区', '93', '3'), ('1394', '曲沃县', '93', '3'), ('1395', '永和县', '93', '3'), ('1396', '汾西县', '93', '3'), ('1397', '洪洞县', '93', '3'), ('1398', '浮山县', '93', '3'), ('1399', '翼城县', '93', '3'), ('1400', '蒲县', '93', '3'), ('1401', '襄汾县', '93', '3'), ('1402', '隰县', '93', '3'), ('1403', '霍州市', '93', '3'), ('1404', '中阳县', '94', '3'), ('1405', '临县', '94', '3'), ('1406', '交口县', '94', '3'), ('1407', '交城县', '94', '3'), ('1408', '兴县', '94', '3'), ('1409', '孝义市', '94', '3'), ('1410', '岚县', '94', '3'), ('1411', '文水县', '94', '3'), ('1412', '方山县', '94', '3'), ('1413', '柳林县', '94', '3'), ('1414', '汾阳市', '94', '3'), ('1415', '石楼县', '94', '3'), ('1416', '离石区', '94', '3'), ('1417', '和林格尔县', '95', '3'), ('1418', '回民区', '95', '3'), ('1419', '土默特左旗', '95', '3'), ('1420', '托克托县', '95', '3'), ('1421', '新城区', '95', '3'), ('1422', '武川县', '95', '3'), ('1423', '清水河县', '95', '3'), ('1424', '玉泉区', '95', '3'), ('1425', '赛罕区', '95', '3'), ('1426', '东河区', '96', '3'), ('1427', '九原区', '96', '3'), ('1428', '固阳县', '96', '3'), ('1429', '土默特右旗', '96', '3'), ('1430', '昆都仑区', '96', '3'), ('1431', '白云矿区', '96', '3'), ('1432', '石拐区', '96', '3'), ('1433', '达尔罕茂明安联合旗', '96', '3'), ('1434', '青山区', '96', '3'), ('1435', '乌达区', '97', '3'), ('1436', '海勃湾区', '97', '3'), ('1437', '海南区', '97', '3'), ('1438', '元宝山区', '98', '3'), ('1439', '克什克腾旗', '98', '3'), ('1440', '喀喇沁旗', '98', '3'), ('1441', '宁城县', '98', '3'), ('1442', '巴林右旗', '98', '3'), ('1443', '巴林左旗', '98', '3'), ('1444', '敖汉旗', '98', '3'), ('1445', '松山区', '98', '3'), ('1446', '林西县', '98', '3'), ('1447', '红山区', '98', '3'), ('1448', '翁牛特旗', '98', '3'), ('1449', '阿鲁科尔沁旗', '98', '3'), ('1450', '奈曼旗', '99', '3'), ('1451', '库伦旗', '99', '3'), ('1452', '开鲁县', '99', '3'), ('1453', '扎鲁特旗', '99', '3'), ('1454', '科尔沁区', '99', '3'), ('1455', '科尔沁左翼中旗', '99', '3'), ('1456', '科尔沁左翼后旗', '99', '3'), ('1457', '霍林郭勒市', '99', '3'), ('1458', '东胜区', '100', '3'), ('1459', '乌审旗', '100', '3'), ('1460', '伊金霍洛旗', '100', '3'), ('1461', '准格尔旗', '100', '3'), ('1462', '杭锦旗', '100', '3'), ('1463', '达拉特旗', '100', '3'), ('1464', '鄂东胜区', '100', '3'), ('1465', '鄂托克前旗', '100', '3'), ('1466', '鄂托克旗', '100', '3'), ('1467', '扎兰屯市', '101', '3'), ('1468', '新巴尔虎右旗', '101', '3'), ('1469', '新巴尔虎左旗', '101', '3'), ('1470', '根河市', '101', '3'), ('1471', '海拉尔区', '101', '3'), ('1472', '满洲里市', '101', '3'), ('1473', '牙克石市', '101', '3'), ('1474', '莫力达瓦达斡尔族自治旗', '101', '3'), ('1475', '鄂伦春自治旗', '101', '3'), ('1476', '鄂温克族自治旗', '101', '3'), ('1477', '阿荣旗', '101', '3'), ('1478', '陈巴尔虎旗', '101', '3'), ('1479', '额尔古纳市', '101', '3'), ('1480', '临河区', '102', '3'), ('1481', '乌拉特中旗', '102', '3'), ('1482', '乌拉特前旗', '102', '3'), ('1483', '乌拉特后旗', '102', '3'), ('1484', '五原县', '102', '3'), ('1485', '杭锦后旗', '102', '3'), ('1486', '磴口县', '102', '3'), ('1487', '丰镇市', '103', '3'), ('1488', '兴和县', '103', '3'), ('1489', '凉城县', '103', '3'), ('1490', '化德县', '103', '3'), ('1491', '卓资县', '103', '3'), ('1492', '商都县', '103', '3'), ('1493', '四子王旗', '103', '3'), ('1494', '察哈尔右翼中旗', '103', '3'), ('1495', '察哈尔右翼前旗', '103', '3'), ('1496', '察哈尔右翼后旗', '103', '3'), ('1497', '集宁区', '103', '3'), ('1498', '乌兰浩特市', '104', '3'), ('1499', '扎赉特旗', '104', '3'), ('1500', '科尔沁右翼中旗', '104', '3'), ('1501', '科尔沁右翼前旗', '104', '3'), ('1502', '突泉县', '104', '3'), ('1503', '阿尔山市', '104', '3'), ('1504', '东乌珠穆沁旗', '105', '3'), ('1505', '二连浩特市', '105', '3'), ('1506', '多伦县', '105', '3'), ('1507', '太仆寺旗', '105', '3'), ('1508', '正蓝旗', '105', '3'), ('1509', '正镶白旗', '105', '3'), ('1510', '苏尼特右旗', '105', '3'), ('1511', '苏尼特左旗', '105', '3'), ('1512', '西乌珠穆沁旗', '105', '3'), ('1513', '锡林浩特市', '105', '3'), ('1514', '镶黄旗', '105', '3'), ('1515', '阿巴嘎旗', '105', '3'), ('1516', '阿拉善右旗', '106', '3'), ('1517', '阿拉善左旗', '106', '3'), ('1518', '额济纳旗', '106', '3'), ('1519', '东陵区', '107', '3'), ('1520', '于洪区', '107', '3'), ('1521', '和平区', '107', '3'), ('1522', '大东区', '107', '3'), ('1523', '康平县', '107', '3'), ('1524', '新民市', '107', '3'), ('1525', '沈北新区', '107', '3'), ('1526', '沈河区', '107', '3'), ('1527', '法库县', '107', '3'), ('1528', '皇姑区', '107', '3'), ('1529', '苏家屯区', '107', '3'), ('1530', '辽中县', '107', '3'), ('1531', '铁西区', '107', '3'), ('1532', '中山区', '108', '3'), ('1533', '庄河市', '108', '3'), ('1534', '旅顺口区', '108', '3'), ('1535', '普兰店市', '108', '3'), ('1536', '沙河口区', '108', '3'), ('1537', '瓦房店市', '108', '3'), ('1538', '甘井子区', '108', '3'), ('1539', '西岗区', '108', '3'), ('1540', '金州区', '108', '3'), ('1541', '长海县', '108', '3'), ('1542', '千山区', '109', '3'), ('1543', '台安县', '109', '3'), ('1544', '岫岩满族自治县', '109', '3'), ('1545', '海城市', '109', '3'), ('1546', '立山区', '109', '3'), ('1547', '铁东区', '109', '3'), ('1548', '铁西区', '109', '3'), ('1549', '东洲区', '110', '3'), ('1550', '抚顺县', '110', '3'), ('1551', '新宾满族自治县', '110', '3'), ('1552', '新抚区', '110', '3'), ('1553', '望花区', '110', '3'), ('1554', '清原满族自治县', '110', '3'), ('1555', '顺城区', '110', '3'), ('1556', '南芬区', '111', '3'), ('1557', '平山区', '111', '3'), ('1558', '明山区', '111', '3'), ('1559', '本溪满族自治县', '111', '3'), ('1560', '桓仁满族自治县', '111', '3'), ('1561', '溪湖区', '111', '3'), ('1562', '东港市', '112', '3'), ('1563', '元宝区', '112', '3'), ('1564', '凤城市', '112', '3'), ('1565', '宽甸满族自治县', '112', '3'), ('1566', '振兴区', '112', '3'), ('1567', '振安区', '112', '3'), ('1568', '义县', '113', '3'), ('1569', '凌河区', '113', '3'), ('1570', '凌海市', '113', '3'), ('1571', '北镇市', '113', '3'), ('1572', '古塔区', '113', '3'), ('1573', '太和区', '113', '3'), ('1574', '黑山县', '113', '3'), ('1575', '大石桥市', '114', '3'), ('1576', '盖州市', '114', '3'), ('1577', '站前区', '114', '3'), ('1578', '老边区', '114', '3'), ('1579', '西市区', '114', '3'), ('1580', '鲅鱼圈区', '114', '3'), ('1581', '太平区', '115', '3'), ('1582', '彰武县', '115', '3'), ('1583', '新邱区', '115', '3'), ('1584', '海州区', '115', '3'), ('1585', '清河门区', '115', '3'), ('1586', '细河区', '115', '3'), ('1587', '蒙古族自治县', '115', '3'), ('1588', '太子河区', '116', '3'), ('1589', '宏伟区', '116', '3'), ('1590', '弓长岭区', '116', '3'), ('1591', '文圣区', '116', '3'), ('1592', '灯塔市', '116', '3'), ('1593', '白塔区', '116', '3'), ('1594', '辽阳县', '116', '3'), ('1595', '兴隆台区', '117', '3'), ('1596', '双台子区', '117', '3'), ('1597', '大洼县', '117', '3'), ('1598', '盘山县', '117', '3'), ('1599', '开原市', '118', '3'), ('1600', '昌图县', '118', '3'), ('1601', '清河区', '118', '3'), ('1602', '西丰县', '118', '3'), ('1603', '调兵山市', '118', '3'), ('1604', '铁岭县', '118', '3'), ('1605', '银州区', '118', '3'), ('1606', '凌源市', '119', '3'), ('1607', '北票市', '119', '3'), ('1608', '双塔区', '119', '3'), ('1609', '喀喇沁左翼蒙古族自治县', '119', '3'), ('1610', '建平县', '119', '3'), ('1611', '朝阳县', '119', '3'), ('1612', '龙城区', '119', '3'), ('1613', '兴城市', '120', '3'), ('1614', '南票区', '120', '3'), ('1615', '建昌县', '120', '3'), ('1616', '绥中县', '120', '3'), ('1617', '连山区', '120', '3'), ('1618', '龙港区', '120', '3'), ('1619', '九台市', '121', '3'), ('1620', '二道区', '121', '3'), ('1621', '农安县', '121', '3'), ('1622', '南关区', '121', '3'), ('1623', '双阳区', '121', '3'), ('1624', '宽城区', '121', '3'), ('1625', '德惠市', '121', '3'), ('1626', '朝阳区', '121', '3'), ('1627', '榆树市', '121', '3'), ('1628', '绿园区', '121', '3'), ('1629', '丰满区', '122', '3'), ('1630', '昌邑区', '122', '3'), ('1631', '桦甸市', '122', '3'), ('1632', '永吉县', '122', '3'), ('1633', '磐石市', '122', '3'), ('1634', '舒兰市', '122', '3'), ('1635', '船营区', '122', '3'), ('1636', '蛟河市', '122', '3'), ('1637', '龙潭区', '122', '3'), ('1638', '伊通满族自治县', '123', '3'), ('1639', '公主岭市', '123', '3'), ('1640', '双辽市', '123', '3'), ('1641', '梨树县', '123', '3'), ('1642', '铁东区', '123', '3'), ('1643', '铁西区', '123', '3'), ('1644', '东丰县', '124', '3'), ('1645', '东辽县', '124', '3'), ('1646', '西安区', '124', '3'), ('1647', '龙山区', '124', '3'), ('1648', '东昌区', '125', '3'), ('1649', '二道江区', '125', '3'), ('1650', '柳河县', '125', '3'), ('1651', '梅河口市', '125', '3'), ('1652', '辉南县', '125', '3'), ('1653', '通化县', '125', '3'), ('1654', '集安市', '125', '3'), ('1655', '临江市', '126', '3'), ('1656', '八道江区', '126', '3'), ('1657', '抚松县', '126', '3'), ('1658', '江源区', '126', '3'), ('1659', '长白朝鲜族自治县', '126', '3'), ('1660', '靖宇县', '126', '3'), ('1661', '干安县', '127', '3'), ('1662', '前郭尔罗斯蒙古族自治县', '127', '3'), ('1663', '宁江区', '127', '3'), ('1664', '扶余县', '127', '3'), ('1665', '长岭县', '127', '3'), ('1666', '大安市', '128', '3'), ('1667', '洮北区', '128', '3'), ('1668', '洮南市', '128', '3'), ('1669', '通榆县', '128', '3'), ('1670', '镇赉县', '128', '3'), ('1671', '和龙市', '129', '3'), ('1672', '图们市', '129', '3'), ('1673', '安图县', '129', '3'), ('1674', '延吉市', '129', '3'), ('1675', '敦化市', '129', '3'), ('1676', '汪清县', '129', '3'), ('1677', '珲春市', '129', '3'), ('1678', '龙井市', '129', '3'), ('1679', '五常市', '130', '3'), ('1680', '依兰县', '130', '3'), ('1681', '南岗区', '130', '3'), ('1682', '双城市', '130', '3'), ('1683', '呼兰区', '130', '3'), ('1684', '哈尔滨市道里区', '130', '3'), ('1685', '宾县', '130', '3'), ('1686', '尚志市', '130', '3'), ('1687', '巴彦县', '130', '3'), ('1688', '平房区', '130', '3'), ('1689', '延寿县', '130', '3'), ('1690', '方正县', '130', '3'), ('1691', '木兰县', '130', '3'), ('1692', '松北区', '130', '3'), ('1693', '通河县', '130', '3'), ('1694', '道外区', '130', '3'), ('1695', '阿城区', '130', '3'), ('1696', '香坊区', '130', '3'), ('1697', '依安县', '131', '3'), ('1698', '克东县', '131', '3'), ('1699', '克山县', '131', '3'), ('1700', '富拉尔基区', '131', '3'), ('1701', '富裕县', '131', '3'), ('1702', '建华区', '131', '3'), ('1703', '拜泉县', '131', '3'), ('1704', '昂昂溪区', '131', '3'), ('1705', '梅里斯达斡尔族区', '131', '3'), ('1706', '泰来县', '131', '3'), ('1707', '甘南县', '131', '3'), ('1708', '碾子山区', '131', '3'), ('1709', '讷河市', '131', '3'), ('1710', '铁锋区', '131', '3'), ('1711', '龙江县', '131', '3'), ('1712', '龙沙区', '131', '3'), ('1713', '城子河区', '132', '3'), ('1714', '密山市', '132', '3'), ('1715', '恒山区', '132', '3'), ('1716', '梨树区', '132', '3'), ('1717', '滴道区', '132', '3'), ('1718', '虎林市', '132', '3'), ('1719', '鸡东县', '132', '3'), ('1720', '鸡冠区', '132', '3'), ('1721', '麻山区', '132', '3'), ('1722', '东山区', '133', '3'), ('1723', '兴安区', '133', '3'), ('1724', '兴山区', '133', '3'), ('1725', '南山区', '133', '3'), ('1726', '向阳区', '133', '3'), ('1727', '工农区', '133', '3'), ('1728', '绥滨县', '133', '3'), ('1729', '萝北县', '133', '3'), ('1730', '友谊县', '134', '3'), ('1731', '四方台区', '134', '3'), ('1732', '宝山区', '134', '3'), ('1733', '宝清县', '134', '3'), ('1734', '尖山区', '134', '3'), ('1735', '岭东区', '134', '3'), ('1736', '集贤县', '134', '3'), ('1737', '饶河县', '134', '3'), ('1738', '大同区', '135', '3'), ('1739', '杜尔伯特蒙古族自治县', '135', '3'), ('1740', '林甸县', '135', '3'), ('1741', '红岗区', '135', '3'), ('1742', '肇州县', '135', '3'), ('1743', '肇源县', '135', '3'), ('1744', '胡路区', '135', '3'), ('1745', '萨尔图区', '135', '3'), ('1746', '龙凤区', '135', '3'), ('1747', '上甘岭区', '136', '3'), ('1748', '乌伊岭区', '136', '3'), ('1749', '乌马河区', '136', '3'), ('1750', '五营区', '136', '3'), ('1751', '伊春区', '136', '3'), ('1752', '南岔区', '136', '3'), ('1753', '友好区', '136', '3'), ('1754', '嘉荫县', '136', '3'), ('1755', '带岭区', '136', '3'), ('1756', '新青区', '136', '3'), ('1757', '汤旺河区', '136', '3'), ('1758', '红星区', '136', '3'), ('1759', '美溪区', '136', '3'), ('1760', '翠峦区', '136', '3'), ('1761', '西林区', '136', '3'), ('1762', '金山屯区', '136', '3'), ('1763', '铁力市', '136', '3'), ('1764', '东风区', '137', '3'), ('1765', '前进区', '137', '3'), ('1766', '同江市', '137', '3'), ('1767', '向阳区', '137', '3'), ('1768', '富锦市', '137', '3'), ('1769', '抚远县', '137', '3'), ('1770', '桦南县', '137', '3'), ('1771', '桦川县', '137', '3'), ('1772', '汤原县', '137', '3'), ('1773', '郊区', '137', '3'), ('1774', '勃利县', '138', '3'), ('1775', '新兴区', '138', '3'), ('1776', '桃山区', '138', '3'), ('1777', '茄子河区', '138', '3'), ('1778', '东宁县', '139', '3'), ('1779', '东安区', '139', '3'), ('1780', '宁安市', '139', '3'), ('1781', '林口县', '139', '3'), ('1782', '海林市', '139', '3'), ('1783', '爱民区', '139', '3'), ('1784', '穆棱市', '139', '3'), ('1785', '绥芬河市', '139', '3'), ('1786', '西安区', '139', '3'), ('1787', '阳明区', '139', '3'), ('1788', '五大连池市', '140', '3'), ('1789', '北安市', '140', '3'), ('1790', '嫩江县', '140', '3'), ('1791', '孙吴县', '140', '3'), ('1792', '爱辉区', '140', '3'), ('1793', '车逊克县', '140', '3'), ('1794', '逊克县', '140', '3'), ('1795', '兰西县', '141', '3'), ('1796', '安达市', '141', '3'), ('1797', '庆安县', '141', '3'), ('1798', '明水县', '141', '3'), ('1799', '望奎县', '141', '3'), ('1800', '海伦市', '141', '3'), ('1801', '绥化市北林区', '141', '3'), ('1802', '绥棱县', '141', '3'), ('1803', '肇东市', '141', '3'), ('1804', '青冈县', '141', '3'), ('1805', '呼玛县', '142', '3'), ('1806', '塔河县', '142', '3'), ('1807', '大兴安岭地区加格达奇区', '142', '3'), ('1808', '大兴安岭地区呼中区', '142', '3'), ('1809', '大兴安岭地区新林区', '142', '3'), ('1810', '大兴安岭地区松岭区', '142', '3'), ('1811', '漠河县', '142', '3'), ('1812', '半淞园路街道', '143', '3'), ('1813', '南京东路街道', '143', '3'), ('1814', '外滩街道', '143', '3'), ('1815', '小东门街道', '143', '3'), ('1816', '老西门街道', '143', '3'), ('1817', '豫园街道', '143', '3'), ('1818', '五里桥街道', '144', '3'), ('1819', '打浦桥街道', '144', '3'), ('1820', '淮海中路街道', '144', '3'), ('1821', '瑞金二路街道', '144', '3'), ('1822', '凌云路街道', '145', '3'), ('1823', '华泾镇', '145', '3'), ('1824', '天平路街道', '145', '3'), ('1825', '康健新村街道', '145', '3'), ('1826', '徐家汇街道', '145', '3'), ('1827', '斜土路街道', '145', '3'), ('1828', '枫林路街道', '145', '3'), ('1829', '湖南路街道', '145', '3'), ('1830', '漕河泾街道', '145', '3'), ('1831', '田林街道', '145', '3'), ('1832', '虹梅路街道', '145', '3'), ('1833', '长桥街道', '145', '3'), ('1834', '龙华街道', '145', '3'), ('1835', '仙霞新村街道', '146', '3'), ('1836', '北新泾街道', '146', '3'), ('1837', '华阳路街道', '146', '3'), ('1838', '周家桥街道', '146', '3'), ('1839', '天山路街道', '146', '3'), ('1840', '新华路街道', '146', '3'), ('1841', '新泾镇', '146', '3'), ('1842', '江苏路街道', '146', '3'), ('1843', '程家桥街道', '146', '3'), ('1844', '虹桥街道', '146', '3'), ('1845', '南京西路街道', '147', '3'), ('1846', '曹家渡街道', '147', '3'), ('1847', '江宁路街道', '147', '3'), ('1848', '石门二路街道', '147', '3'), ('1849', '静安寺街道', '147', '3'), ('1850', '宜川路街道', '148', '3'), ('1851', '曹杨新村街道', '148', '3'), ('1852', '桃浦镇', '148', '3'), ('1853', '甘泉路街道', '148', '3'), ('1854', '真如镇', '148', '3'), ('1855', '石泉路街道', '148', '3'), ('1856', '长寿路街道', '148', '3'), ('1857', '长征镇', '148', '3'), ('1858', '长风新村街道', '148', '3'), ('1859', '临汾路街道', '149', '3'), ('1860', '共和新路街道', '149', '3'), ('1861', '北站街道', '149', '3'), ('1862', '大宁路街道', '149', '3'), ('1863', '天目西路街道', '149', '3'), ('1864', '宝山路街道', '149', '3'), ('1865', '彭浦新村街道', '149', '3'), ('1866', '彭浦镇', '149', '3'), ('1867', '芷江西路街道', '149', '3'), ('1868', '乍浦路街道', '150', '3'), ('1869', '凉城新村街道', '150', '3'), ('1870', '嘉兴路街道', '150', '3'), ('1871', '四川北路街道', '150', '3'), ('1872', '广中路街道', '150', '3'), ('1873', '提篮桥街道', '150', '3'), ('1874', '新港路街道', '150', '3'), ('1875', '曲阳路街道', '150', '3'), ('1876', '欧阳路街道', '150', '3'), ('1877', '江湾镇街道', '150', '3'), ('1878', '五角场街道', '151', '3'), ('1879', '五角场镇', '151', '3'), ('1880', '四平路街道', '151', '3'), ('1881', '大桥街道', '151', '3'), ('1882', '定海路街道', '151', '3'), ('1883', '平凉路街道', '151', '3'), ('1884', '延吉新村街道', '151', '3'), ('1885', '控江路街道', '151', '3'), ('1886', '新江湾城街道', '151', '3'), ('1887', '殷行街道', '151', '3'), ('1888', '江浦路街道', '151', '3'), ('1889', '长白新村街道', '151', '3'), ('1890', '七宝镇', '152', '3'), ('1891', '华漕镇', '152', '3'), ('1892', '古美街道', '152', '3'), ('1893', '吴泾镇', '152', '3'), ('1894', '梅陇镇', '152', '3'), ('1895', '江川路街道', '152', '3'), ('1896', '浦江镇', '152', '3'), ('1897', '莘庄镇', '152', '3'), ('1898', '虹桥镇', '152', '3'), ('1899', '颛桥镇', '152', '3'), ('1900', '马桥镇', '152', '3'), ('1901', '龙柏街道', '152', '3'), ('1902', '友谊路街道', '153', '3'), ('1903', '吴淞街道', '153', '3'), ('1904', '大场镇', '153', '3'), ('1905', '庙行镇', '153', '3'), ('1906', '张庙街道', '153', '3'), ('1907', '月浦镇', '153', '3'), ('1908', '杨行镇', '153', '3'), ('1909', '淞南镇', '153', '3'), ('1910', '罗店镇', '153', '3'), ('1911', '罗泾镇', '153', '3'), ('1912', '顾村镇', '153', '3'), ('1913', '高境镇', '153', '3'), ('1914', '华亭镇', '154', '3'), ('1915', '南翔镇', '154', '3'), ('1916', '嘉定工业区', '154', '3'), ('1917', '嘉定镇街道', '154', '3'), ('1918', '外冈镇', '154', '3'), ('1919', '安亭镇', '154', '3'), ('1920', '徐行镇', '154', '3'), ('1921', '新成路街道', '154', '3'), ('1922', '江桥镇', '154', '3'), ('1923', '真新新村街道', '154', '3'), ('1924', '菊园新区', '154', '3'), ('1925', '马陆镇', '154', '3'), ('1926', '黄渡镇', '154', '3'), ('1927', '三林镇', '155', '3'), ('1928', '上钢新村街道', '155', '3'), ('1929', '东明路街道', '155', '3'), ('1930', '北蔡镇', '155', '3'), ('1931', '南码头路街道', '155', '3'), ('1932', '合庆镇', '155', '3'), ('1933', '周家渡街道', '155', '3'), ('1934', '唐镇', '155', '3'), ('1935', '塘桥街道', '155', '3'), ('1936', '川沙新镇', '155', '3'), ('1937', '张江镇', '155', '3'), ('1938', '曹路镇', '155', '3'), ('1939', '沪东新村街道', '155', '3'), ('1940', '洋泾街道', '155', '3'), ('1941', '浦兴路街道', '155', '3'), ('1942', '潍坊新村街道', '155', '3'), ('1943', '花木街道', '155', '3'), ('1944', '金杨新村街道', '155', '3'), ('1945', '金桥镇', '155', '3'), ('1946', '陆家嘴街道', '155', '3'), ('1947', '高东镇', '155', '3'), ('1948', '高桥镇', '155', '3'), ('1949', '高行镇', '155', '3'), ('1950', '亭林镇', '156', '3'), ('1951', '吕巷镇', '156', '3'), ('1952', '山阳镇', '156', '3'), ('1953', '廊下镇', '156', '3'), ('1954', '张堰镇', '156', '3'), ('1955', '朱泾镇', '156', '3'), ('1956', '枫泾镇', '156', '3'), ('1957', '漕泾镇', '156', '3'), ('1958', '石化街道', '156', '3'), ('1959', '金山卫镇', '156', '3'), ('1960', '上海松江科技园区', '157', '3'), ('1961', '中山街道', '157', '3'), ('1962', '九亭镇', '157', '3'), ('1963', '五厍农业园区', '157', '3'), ('1964', '佘山度假区', '157', '3'), ('1965', '佘山镇', '157', '3'), ('1966', '叶榭镇', '157', '3'), ('1967', '岳阳街道', '157', '3'), ('1968', '新桥镇', '157', '3'), ('1969', '新浜镇', '157', '3'), ('1970', '方松街道', '157', '3'), ('1971', '松江工业区', '157', '3'), ('1972', '永丰街道', '157', '3'), ('1973', '泖港镇', '157', '3'), ('1974', '泗泾镇', '157', '3'), ('1975', '洞泾镇', '157', '3'), ('1976', '石湖荡镇', '157', '3'), ('1977', '车墩镇', '157', '3'), ('1978', '华新镇', '158', '3'), ('1979', '夏阳街道', '158', '3'), ('1980', '徐泾镇', '158', '3'), ('1981', '朱家角镇', '158', '3'), ('1982', '白鹤镇', '158', '3'), ('1983', '盈浦街道', '158', '3'), ('1984', '练塘镇', '158', '3'), ('1985', '赵巷镇', '158', '3'), ('1986', '重固镇', '158', '3'), ('1987', '金泽镇', '158', '3'), ('1988', '香花桥街道', '158', '3'), ('1989', '万祥镇', '159', '3'), ('1990', '书院镇', '159', '3'), ('1991', '六灶镇', '159', '3'), ('1992', '周浦镇', '159', '3'), ('1993', '大团镇', '159', '3'), ('1994', '宣桥镇', '159', '3'), ('1995', '康桥镇', '159', '3'), ('1996', '惠南镇', '159', '3'), ('1997', '新场镇', '159', '3'), ('1998', '泥城镇', '159', '3'), ('1999', '祝桥镇', '159', '3'), ('2000', '老港镇', '159', '3'), ('2001', '航头镇', '159', '3'), ('2002', '芦潮港镇', '159', '3'), ('2003', '南桥镇', '160', '3'), ('2004', '四团镇', '160', '3'), ('2005', '奉城镇', '160', '3'), ('2006', '庄行镇', '160', '3'), ('2007', '柘林镇', '160', '3'), ('2008', '海湾镇', '160', '3'), ('2009', '金汇镇', '160', '3'), ('2010', '青村镇', '160', '3'), ('2011', '三星镇', '161', '3'), ('2012', '中兴镇', '161', '3'), ('2013', '向化镇', '161', '3'), ('2014', '城桥镇', '161', '3'), ('2015', '堡镇', '161', '3'), ('2016', '庙镇', '161', '3'), ('2017', '建设镇', '161', '3'), ('2018', '新村乡', '161', '3'), ('2019', '新河镇', '161', '3'), ('2020', '横沙乡', '161', '3'), ('2021', '港沿镇', '161', '3'), ('2022', '港西镇', '161', '3'), ('2023', '竖新镇', '161', '3'), ('2024', '绿华镇', '161', '3'), ('2025', '长兴乡', '161', '3'), ('2026', '陈家镇', '161', '3'), ('2027', '下关区', '162', '3'), ('2028', '六合区', '162', '3'), ('2029', '建邺区', '162', '3'), ('2030', '栖霞区', '162', '3'), ('2031', '江宁区', '162', '3'), ('2032', '浦口区', '162', '3'), ('2033', '溧水县', '162', '3'), ('2034', '玄武区', '162', '3'), ('2035', '白下区', '162', '3'), ('2036', '秦淮区', '162', '3'), ('2037', '雨花台区', '162', '3'), ('2038', '高淳县', '162', '3'), ('2039', '鼓楼区', '162', '3'), ('2040', '北塘区', '163', '3'), ('2041', '南长区', '163', '3'), ('2042', '宜兴市', '163', '3'), ('2043', '崇安区', '163', '3'), ('2044', '惠山区', '163', '3'), ('2045', '江阴市', '163', '3'), ('2046', '滨湖区', '163', '3'), ('2047', '锡山区', '163', '3'), ('2048', '丰县', '164', '3'), ('2049', '九里区', '164', '3'), ('2050', '云龙区', '164', '3'), ('2051', '新沂市', '164', '3'), ('2052', '沛县', '164', '3'), ('2053', '泉山区', '164', '3'), ('2054', '睢宁县', '164', '3'), ('2055', '贾汪区', '164', '3'), ('2056', '邳州市', '164', '3'), ('2057', '铜山县', '164', '3'), ('2058', '鼓楼区', '164', '3'), ('2059', '天宁区', '165', '3'), ('2060', '戚墅堰区', '165', '3'), ('2061', '新北区', '165', '3'), ('2062', '武进区', '165', '3'), ('2063', '溧阳市', '165', '3'), ('2064', '金坛市', '165', '3'), ('2065', '钟楼区', '165', '3'), ('2066', '吴中区', '166', '3'), ('2067', '吴江市', '166', '3'), ('2068', '太仓市', '166', '3'), ('2069', '常熟市', '166', '3'), ('2070', '平江区', '166', '3'), ('2071', '张家港市', '166', '3'), ('2072', '昆山市', '166', '3'), ('2073', '沧浪区', '166', '3'), ('2074', '相城区', '166', '3'), ('2075', '苏州工业园区', '166', '3'), ('2076', '虎丘区', '166', '3'), ('2077', '金阊区', '166', '3'), ('2078', '启东市', '167', '3'), ('2079', '如东县', '167', '3'), ('2080', '如皋市', '167', '3'), ('2081', '崇川区', '167', '3'), ('2082', '海安县', '167', '3'), ('2083', '海门市', '167', '3'), ('2084', '港闸区', '167', '3'), ('2085', '通州市', '167', '3'), ('2086', '东海县', '168', '3'), ('2087', '新浦区', '168', '3'), ('2088', '海州区', '168', '3'), ('2089', '灌云县', '168', '3'), ('2090', '灌南县', '168', '3'), ('2091', '赣榆县', '168', '3'), ('2092', '连云区', '168', '3'), ('2093', '楚州区', '169', '3'), ('2094', '洪泽县', '169', '3'), ('2095', '涟水县', '169', '3'), ('2096', '淮阴区', '169', '3'), ('2097', '清河区', '169', '3'), ('2098', '清浦区', '169', '3'), ('2099', '盱眙县', '169', '3'), ('2100', '金湖县', '169', '3'), ('2101', '东台市', '170', '3'), ('2102', '亭湖区', '170', '3'), ('2103', '响水县', '170', '3'), ('2104', '大丰市', '170', '3'), ('2105', '射阳县', '170', '3'), ('2106', '建湖县', '170', '3'), ('2107', '滨海县', '170', '3'), ('2108', '盐都区', '170', '3'), ('2109', '阜宁县', '170', '3'), ('2110', '仪征市', '171', '3'), ('2111', '宝应县', '171', '3'), ('2112', '广陵区', '171', '3'), ('2113', '江都市', '171', '3'), ('2114', '维扬区', '171', '3'), ('2115', '邗江区', '171', '3'), ('2116', '高邮市', '171', '3'), ('2117', '丹徒区', '172', '3'), ('2118', '丹阳市', '172', '3'), ('2119', '京口区', '172', '3'), ('2120', '句容市', '172', '3'), ('2121', '扬中市', '172', '3'), ('2122', '润州区', '172', '3'), ('2123', '兴化市', '173', '3'), ('2124', '姜堰市', '173', '3'), ('2125', '泰兴市', '173', '3'), ('2126', '海陵区', '173', '3'), ('2127', '靖江市', '173', '3'), ('2128', '高港区', '173', '3'), ('2129', '宿城区', '174', '3'), ('2130', '宿豫区', '174', '3'), ('2131', '沭阳县', '174', '3'), ('2132', '泗洪县', '174', '3'), ('2133', '泗阳县', '174', '3'), ('2134', '上城区', '175', '3'), ('2135', '下城区', '175', '3'), ('2136', '临安市', '175', '3'), ('2137', '余杭区', '175', '3'), ('2138', '富阳市', '175', '3'), ('2139', '建德市', '175', '3'), ('2140', '拱墅区', '175', '3'), ('2141', '桐庐县', '175', '3'), ('2142', '江干区', '175', '3'), ('2143', '淳安县', '175', '3'), ('2144', '滨江区', '175', '3'), ('2145', '萧山区', '175', '3'), ('2146', '西湖区', '175', '3'), ('2147', '余姚市', '176', '3'), ('2148', '北仑区', '176', '3'), ('2149', '奉化市', '176', '3'), ('2150', '宁海县', '176', '3'), ('2151', '慈溪市', '176', '3'), ('2152', '江东区', '176', '3'), ('2153', '江北区', '176', '3'), ('2154', '海曙区', '176', '3'), ('2155', '象山县', '176', '3'), ('2156', '鄞州区', '176', '3'), ('2157', '镇海区', '176', '3'), ('2158', '乐清市', '177', '3'), ('2159', '平阳县', '177', '3'), ('2160', '文成县', '177', '3'), ('2161', '永嘉县', '177', '3'), ('2162', '泰顺县', '177', '3'), ('2163', '洞头县', '177', '3'), ('2164', '瑞安市', '177', '3'), ('2165', '瓯海区', '177', '3'), ('2166', '苍南县', '177', '3'), ('2167', '鹿城区', '177', '3'), ('2168', '龙湾区', '177', '3'), ('2169', '南湖区', '178', '3'), ('2170', '嘉善县', '178', '3'), ('2171', '平湖市', '178', '3'), ('2172', '桐乡市', '178', '3'), ('2173', '海宁市', '178', '3'), ('2174', '海盐县', '178', '3'), ('2175', '秀洲区', '178', '3'), ('2176', '南浔区', '179', '3'), ('2177', '吴兴区', '179', '3'), ('2178', '安吉县', '179', '3'), ('2179', '德清县', '179', '3'), ('2180', '长兴县', '179', '3'), ('2181', '上虞市', '180', '3'), ('2182', '嵊州市', '180', '3'), ('2183', '新昌县', '180', '3'), ('2184', '绍兴县', '180', '3'), ('2185', '诸暨市', '180', '3'), ('2186', '越城区', '180', '3'), ('2187', '定海区', '181', '3'), ('2188', '岱山县', '181', '3'), ('2189', '嵊泗县', '181', '3'), ('2190', '普陀区', '181', '3'), ('2191', '常山县', '182', '3'), ('2192', '开化县', '182', '3'), ('2193', '柯城区', '182', '3'), ('2194', '江山市', '182', '3'), ('2195', '衢江区', '182', '3'), ('2196', '龙游县', '182', '3'), ('2197', '东阳市', '183', '3'), ('2198', '义乌市', '183', '3'), ('2199', '兰溪市', '183', '3'), ('2200', '婺城区', '183', '3'), ('2201', '武义县', '183', '3'), ('2202', '永康市', '183', '3'), ('2203', '浦江县', '183', '3'), ('2204', '磐安县', '183', '3'), ('2205', '金东区', '183', '3'), ('2206', '三门县', '184', '3'), ('2207', '临海市', '184', '3'), ('2208', '仙居县', '184', '3'), ('2209', '天台县', '184', '3'), ('2210', '椒江区', '184', '3'), ('2211', '温岭市', '184', '3'), ('2212', '玉环县', '184', '3'), ('2213', '路桥区', '184', '3'), ('2214', '黄岩区', '184', '3'), ('2215', '云和县', '185', '3'), ('2216', '庆元县', '185', '3'), ('2217', '景宁畲族自治县', '185', '3'), ('2218', '松阳县', '185', '3'), ('2219', '缙云县', '185', '3'), ('2220', '莲都区', '185', '3'), ('2221', '遂昌县', '185', '3'), ('2222', '青田县', '185', '3'), ('2223', '龙泉市', '185', '3'), ('2224', '包河区', '186', '3'), ('2225', '庐阳区', '186', '3'), ('2226', '瑶海区', '186', '3'), ('2227', '肥东县', '186', '3'), ('2228', '肥西县', '186', '3'), ('2229', '蜀山区', '186', '3'), ('2230', '长丰县', '186', '3'), ('2231', '三山区', '187', '3'), ('2232', '南陵县', '187', '3'), ('2233', '弋江区', '187', '3'), ('2234', '繁昌县', '187', '3'), ('2235', '芜湖县', '187', '3'), ('2236', '镜湖区', '187', '3'), ('2237', '鸠江区', '187', '3'), ('2238', '五河县', '188', '3'), ('2239', '固镇县', '188', '3'), ('2240', '怀远县', '188', '3'), ('2241', '淮上区', '188', '3'), ('2242', '禹会区', '188', '3'), ('2243', '蚌山区', '188', '3'), ('2244', '龙子湖区', '188', '3'), ('2245', '八公山区', '189', '3'), ('2246', '凤台县', '189', '3'), ('2247', '大通区', '189', '3'), ('2248', '潘集区', '189', '3'), ('2249', '田家庵区', '189', '3'), ('2250', '谢家集区', '189', '3'), ('2251', '当涂县', '190', '3'), ('2252', '花山区', '190', '3'), ('2253', '金家庄区', '190', '3'), ('2254', '雨山区', '190', '3'), ('2255', '杜集区', '191', '3'), ('2256', '濉溪县', '191', '3'), ('2257', '烈山区', '191', '3'), ('2258', '相山区', '191', '3'), ('2259', '狮子山区', '192', '3'), ('2260', '郊区', '192', '3'), ('2261', '铜官山区', '192', '3'), ('2262', '铜陵县', '192', '3'), ('2263', '大观区', '193', '3'), ('2264', '太湖县', '193', '3'), ('2265', '宜秀区', '193', '3'), ('2266', '宿松县', '193', '3'), ('2267', '岳西县', '193', '3'), ('2268', '怀宁县', '193', '3'), ('2269', '望江县', '193', '3'), ('2270', '枞阳县', '193', '3'), ('2271', '桐城市', '193', '3'), ('2272', '潜山县', '193', '3'), ('2273', '迎江区', '193', '3'), ('2274', '休宁县', '194', '3'), ('2275', '屯溪区', '194', '3'), ('2276', '徽州区', '194', '3'), ('2277', '歙县', '194', '3'), ('2278', '祁门县', '194', '3'), ('2279', '黄山区', '194', '3'), ('2280', '黟县', '194', '3'), ('2281', '全椒县', '195', '3'), ('2282', '凤阳县', '195', '3'), ('2283', '南谯区', '195', '3'), ('2284', '天长市', '195', '3'), ('2285', '定远县', '195', '3'), ('2286', '明光市', '195', '3'), ('2287', '来安县', '195', '3'), ('2288', '琅玡区', '195', '3'), ('2289', '临泉县', '196', '3'), ('2290', '太和县', '196', '3'), ('2291', '界首市', '196', '3'), ('2292', '阜南县', '196', '3'), ('2293', '颍东区', '196', '3'), ('2294', '颍州区', '196', '3'), ('2295', '颍泉区', '196', '3'), ('2296', '颖上县', '196', '3'), ('2297', '埇桥区', '197', '3'), ('2298', '泗县辖', '197', '3'), ('2299', '灵璧县', '197', '3'), ('2300', '砀山县', '197', '3');
INSERT INTO `t_locations` VALUES ('2301', '萧县', '197', '3'), ('2302', '含山县', '198', '3'), ('2303', '和县', '198', '3'), ('2304', '居巢区', '198', '3'), ('2305', '庐江县', '198', '3'), ('2306', '无为县', '198', '3'), ('2307', '寿县', '199', '3'), ('2308', '舒城县', '199', '3'), ('2309', '裕安区', '199', '3'), ('2310', '金安区', '199', '3'), ('2311', '金寨县', '199', '3'), ('2312', '霍山县', '199', '3'), ('2313', '霍邱县', '199', '3'), ('2314', '利辛县', '200', '3'), ('2315', '涡阳县', '200', '3'), ('2316', '蒙城县', '200', '3'), ('2317', '谯城区', '200', '3'), ('2318', '东至县', '201', '3'), ('2319', '石台县', '201', '3'), ('2320', '贵池区', '201', '3'), ('2321', '青阳县', '201', '3'), ('2322', '宁国市', '202', '3'), ('2323', '宣州区', '202', '3'), ('2324', '广德县', '202', '3'), ('2325', '旌德县', '202', '3'), ('2326', '泾县', '202', '3'), ('2327', '绩溪县', '202', '3'), ('2328', '郎溪县', '202', '3'), ('2329', '仓山区', '203', '3'), ('2330', '台江区', '203', '3'), ('2331', '平潭县', '203', '3'), ('2332', '晋安区', '203', '3'), ('2333', '永泰县', '203', '3'), ('2334', '福清市', '203', '3'), ('2335', '罗源县', '203', '3'), ('2336', '连江县', '203', '3'), ('2337', '长乐市', '203', '3'), ('2338', '闽侯县', '203', '3'), ('2339', '闽清县', '203', '3'), ('2340', '马尾区', '203', '3'), ('2341', '鼓楼区', '203', '3'), ('2342', '同安区', '204', '3'), ('2343', '思明区', '204', '3'), ('2344', '海沧区', '204', '3'), ('2345', '湖里区', '204', '3'), ('2346', '翔安区', '204', '3'), ('2347', '集美区', '204', '3'), ('2348', '仙游县', '205', '3'), ('2349', '城厢区', '205', '3'), ('2350', '涵江区', '205', '3'), ('2351', '秀屿区', '205', '3'), ('2352', '荔城区', '205', '3'), ('2353', '三元区', '206', '3'), ('2354', '大田县', '206', '3'), ('2355', '宁化县', '206', '3'), ('2356', '将乐县', '206', '3'), ('2357', '尤溪县', '206', '3'), ('2358', '建宁县', '206', '3'), ('2359', '明溪县', '206', '3'), ('2360', '梅列区', '206', '3'), ('2361', '永安市', '206', '3'), ('2362', '沙县', '206', '3'), ('2363', '泰宁县', '206', '3'), ('2364', '清流县', '206', '3'), ('2365', '丰泽区', '207', '3'), ('2366', '南安市', '207', '3'), ('2367', '安溪县', '207', '3'), ('2368', '德化县', '207', '3'), ('2369', '惠安县', '207', '3'), ('2370', '晋江市', '207', '3'), ('2371', '永春县', '207', '3'), ('2372', '泉港区', '207', '3'), ('2373', '洛江区', '207', '3'), ('2374', '石狮市', '207', '3'), ('2375', '金门县', '207', '3'), ('2376', '鲤城区', '207', '3'), ('2377', '东山县', '208', '3'), ('2378', '云霄县', '208', '3'), ('2379', '华安县', '208', '3'), ('2380', '南靖县', '208', '3'), ('2381', '平和县', '208', '3'), ('2382', '漳浦县', '208', '3'), ('2383', '芗城区', '208', '3'), ('2384', '诏安县', '208', '3'), ('2385', '长泰县', '208', '3'), ('2386', '龙文区', '208', '3'), ('2387', '龙海市', '208', '3'), ('2388', '光泽县', '209', '3'), ('2389', '延平区', '209', '3'), ('2390', '建瓯市', '209', '3'), ('2391', '建阳市', '209', '3'), ('2392', '政和县', '209', '3'), ('2393', '松溪县', '209', '3'), ('2394', '武夷山市', '209', '3'), ('2395', '浦城县', '209', '3'), ('2396', '邵武市', '209', '3'), ('2397', '顺昌县', '209', '3'), ('2398', '上杭县', '210', '3'), ('2399', '新罗区', '210', '3'), ('2400', '武平县', '210', '3'), ('2401', '永定县', '210', '3'), ('2402', '漳平市', '210', '3'), ('2403', '连城县', '210', '3'), ('2404', '长汀县', '210', '3'), ('2405', '古田县', '211', '3'), ('2406', '周宁县', '211', '3'), ('2407', '寿宁县', '211', '3'), ('2408', '屏南县', '211', '3'), ('2409', '柘荣县', '211', '3'), ('2410', '福安市', '211', '3'), ('2411', '福鼎市', '211', '3'), ('2412', '蕉城区', '211', '3'), ('2413', '霞浦县', '211', '3'), ('2414', '东湖区', '212', '3'), ('2415', '南昌县', '212', '3'), ('2416', '安义县', '212', '3'), ('2417', '新建县', '212', '3'), ('2418', '湾里区', '212', '3'), ('2419', '西湖区', '212', '3'), ('2420', '进贤县', '212', '3'), ('2421', '青云谱区', '212', '3'), ('2422', '青山湖区', '212', '3'), ('2423', '乐平市', '213', '3'), ('2424', '昌江区', '213', '3'), ('2425', '浮梁县', '213', '3'), ('2426', '珠山区', '213', '3'), ('2427', '上栗县', '214', '3'), ('2428', '安源区', '214', '3'), ('2429', '湘东区', '214', '3'), ('2430', '芦溪县', '214', '3'), ('2431', '莲花县', '214', '3'), ('2432', '九江县', '215', '3'), ('2433', '修水县', '215', '3'), ('2434', '庐山区', '215', '3'), ('2435', '彭泽县', '215', '3'), ('2436', '德安县', '215', '3'), ('2437', '星子县', '215', '3'), ('2438', '武宁县', '215', '3'), ('2439', '永修县', '215', '3'), ('2440', '浔阳区', '215', '3'), ('2441', '湖口县', '215', '3'), ('2442', '瑞昌市', '215', '3'), ('2443', '都昌县', '215', '3'), ('2444', '分宜县', '216', '3'), ('2445', '渝水区', '216', '3'), ('2446', '余江县', '217', '3'), ('2447', '月湖区', '217', '3'), ('2448', '贵溪市', '217', '3'), ('2449', '上犹县', '218', '3'), ('2450', '于都县', '218', '3'), ('2451', '会昌县', '218', '3'), ('2452', '信丰县', '218', '3'), ('2453', '全南县', '218', '3'), ('2454', '兴国县', '218', '3'), ('2455', '南康市', '218', '3'), ('2456', '大余县', '218', '3'), ('2457', '宁都县', '218', '3'), ('2458', '安远县', '218', '3'), ('2459', '定南县', '218', '3'), ('2460', '寻乌县', '218', '3'), ('2461', '崇义县', '218', '3'), ('2462', '瑞金市', '218', '3'), ('2463', '石城县', '218', '3'), ('2464', '章贡区', '218', '3'), ('2465', '赣县', '218', '3'), ('2466', '龙南县', '218', '3'), ('2467', '万安县', '219', '3'), ('2468', '井冈山市', '219', '3'), ('2469', '吉安县', '219', '3'), ('2470', '吉州区', '219', '3'), ('2471', '吉水县', '219', '3'), ('2472', '安福县', '219', '3'), ('2473', '峡江县', '219', '3'), ('2474', '新干县', '219', '3'), ('2475', '永丰县', '219', '3'), ('2476', '永新县', '219', '3'), ('2477', '泰和县', '219', '3'), ('2478', '遂川县', '219', '3'), ('2479', '青原区', '219', '3'), ('2480', '万载县', '220', '3'), ('2481', '上高县', '220', '3'), ('2482', '丰城市', '220', '3'), ('2483', '奉新县', '220', '3'), ('2484', '宜丰县', '220', '3'), ('2485', '樟树市', '220', '3'), ('2486', '袁州区', '220', '3'), ('2487', '铜鼓县', '220', '3'), ('2488', '靖安县', '220', '3'), ('2489', '高安市', '220', '3'), ('2490', '东乡县', '221', '3'), ('2491', '临川区', '221', '3'), ('2492', '乐安县', '221', '3'), ('2493', '南丰县', '221', '3'), ('2494', '南城县', '221', '3'), ('2495', '宜黄县', '221', '3'), ('2496', '崇仁县', '221', '3'), ('2497', '广昌县', '221', '3'), ('2498', '资溪县', '221', '3'), ('2499', '金溪县', '221', '3'), ('2500', '黎川县', '221', '3'), ('2501', '万年县', '222', '3'), ('2502', '上饶县', '222', '3'), ('2503', '余干县', '222', '3'), ('2504', '信州区', '222', '3'), ('2505', '婺源县', '222', '3'), ('2506', '广丰县', '222', '3'), ('2507', '弋阳县', '222', '3'), ('2508', '德兴市', '222', '3'), ('2509', '横峰县', '222', '3'), ('2510', '玉山县', '222', '3'), ('2511', '鄱阳县', '222', '3'), ('2512', '铅山县', '222', '3'), ('2513', '历下区', '223', '3'), ('2514', '历城区', '223', '3'), ('2515', '商河县', '223', '3'), ('2516', '天桥区', '223', '3'), ('2517', '市中区', '223', '3'), ('2518', '平阴县', '223', '3'), ('2519', '槐荫区', '223', '3'), ('2520', '济阳县', '223', '3'), ('2521', '章丘市', '223', '3'), ('2522', '长清区', '223', '3'), ('2523', '即墨市', '224', '3'), ('2524', '四方区', '224', '3'), ('2525', '城阳区', '224', '3'), ('2526', '崂山区', '224', '3'), ('2527', '市北区', '224', '3'), ('2528', '市南区', '224', '3'), ('2529', '平度市', '224', '3'), ('2530', '李沧区', '224', '3'), ('2531', '胶南市', '224', '3'), ('2532', '胶州市', '224', '3'), ('2533', '莱西市', '224', '3'), ('2534', '黄岛区', '224', '3'), ('2535', '临淄区', '225', '3'), ('2536', '博山区', '225', '3'), ('2537', '周村区', '225', '3'), ('2538', '张店区', '225', '3'), ('2539', '桓台县', '225', '3'), ('2540', '沂源县', '225', '3'), ('2541', '淄川区', '225', '3'), ('2542', '高青县', '225', '3'), ('2543', '台儿庄区', '226', '3'), ('2544', '山亭区', '226', '3'), ('2545', '峄城区', '226', '3'), ('2546', '市中区', '226', '3'), ('2547', '滕州市', '226', '3'), ('2548', '薛城区', '226', '3'), ('2549', '东营区', '227', '3'), ('2550', '利津县', '227', '3'), ('2551', '垦利县', '227', '3'), ('2552', '广饶县', '227', '3'), ('2553', '河口区', '227', '3'), ('2554', '招远市', '228', '3'), ('2555', '栖霞市', '228', '3'), ('2556', '海阳市', '228', '3'), ('2557', '牟平区', '228', '3'), ('2558', '福山区', '228', '3'), ('2559', '芝罘区', '228', '3'), ('2560', '莱山区', '228', '3'), ('2561', '莱州市', '228', '3'), ('2562', '莱阳市', '228', '3'), ('2563', '蓬莱市', '228', '3'), ('2564', '长岛县', '228', '3'), ('2565', '龙口市', '228', '3'), ('2566', '临朐县', '229', '3'), ('2567', '坊子区', '229', '3'), ('2568', '奎文区', '229', '3'), ('2569', '安丘市', '229', '3'), ('2570', '寒亭区', '229', '3'), ('2571', '寿光市', '229', '3'), ('2572', '昌乐县', '229', '3'), ('2573', '昌邑市', '229', '3'), ('2574', '潍城区', '229', '3'), ('2575', '诸城市', '229', '3'), ('2576', '青州市', '229', '3'), ('2577', '高密市', '229', '3'), ('2578', '任城区', '230', '3'), ('2579', '兖州市', '230', '3'), ('2580', '嘉祥县', '230', '3'), ('2581', '市中区', '230', '3'), ('2582', '微山县', '230', '3'), ('2583', '曲阜市', '230', '3'), ('2584', '梁山县', '230', '3'), ('2585', '汶上县', '230', '3'), ('2586', '泗水县', '230', '3'), ('2587', '邹城市', '230', '3'), ('2588', '金乡县', '230', '3'), ('2589', '鱼台县', '230', '3'), ('2590', '东平县', '231', '3'), ('2591', '宁阳县', '231', '3'), ('2592', '岱岳区', '231', '3'), ('2593', '新泰市', '231', '3'), ('2594', '泰山区', '231', '3'), ('2595', '肥城市', '231', '3'), ('2596', '乳山市', '232', '3'), ('2597', '文登市', '232', '3'), ('2598', '环翠区', '232', '3'), ('2599', '荣成市', '232', '3'), ('2600', '东港区', '233', '3'), ('2601', '五莲县', '233', '3'), ('2602', '岚山区', '233', '3'), ('2603', '莒县', '233', '3'), ('2604', '莱城区', '234', '3'), ('2605', '钢城区', '234', '3'), ('2606', '临沭县', '235', '3'), ('2607', '兰山区', '235', '3'), ('2608', '平邑县', '235', '3'), ('2609', '沂南县', '235', '3'), ('2610', '沂水县', '235', '3'), ('2611', '河东区', '235', '3'), ('2612', '罗庄区', '235', '3'), ('2613', '苍山县', '235', '3'), ('2614', '莒南县', '235', '3'), ('2615', '蒙阴县', '235', '3'), ('2616', '费县', '235', '3'), ('2617', '郯城县', '235', '3'), ('2618', '临邑县', '236', '3'), ('2619', '乐陵市', '236', '3'), ('2620', '夏津县', '236', '3'), ('2621', '宁津县', '236', '3'), ('2622', '平原县', '236', '3'), ('2623', '庆云县', '236', '3'), ('2624', '德城区', '236', '3'), ('2625', '武城县', '236', '3'), ('2626', '禹城市', '236', '3'), ('2627', '陵县', '236', '3'), ('2628', '齐河县', '236', '3'), ('2629', '东昌府区', '237', '3'), ('2630', '东阿县', '237', '3'), ('2631', '临清市', '237', '3'), ('2632', '冠县', '237', '3'), ('2633', '茌平县', '237', '3'), ('2634', '莘县', '237', '3'), ('2635', '阳谷县', '237', '3'), ('2636', '高唐县', '237', '3'), ('2637', '博兴县', '238', '3'), ('2638', '惠民县', '238', '3'), ('2639', '无棣县', '238', '3'), ('2640', '沾化县', '238', '3'), ('2641', '滨城区', '238', '3'), ('2642', '邹平县', '238', '3'), ('2643', '阳信县', '238', '3'), ('2644', '东明县', '239', '3'), ('2645', '单县', '239', '3'), ('2646', '定陶县', '239', '3'), ('2647', '巨野县', '239', '3'), ('2648', '成武县', '239', '3'), ('2649', '曹县', '239', '3'), ('2650', '牡丹区', '239', '3'), ('2651', '郓城县', '239', '3'), ('2652', '鄄城县', '239', '3'), ('2653', '上街区', '240', '3'), ('2654', '中原区', '240', '3'), ('2655', '中牟县', '240', '3'), ('2656', '二七区', '240', '3'), ('2657', '巩义市', '240', '3'), ('2658', '惠济区', '240', '3'), ('2659', '新密市', '240', '3'), ('2660', '新郑市', '240', '3'), ('2661', '登封市', '240', '3'), ('2662', '管城回族区', '240', '3'), ('2663', '荥阳市', '240', '3'), ('2664', '金水区', '240', '3'), ('2665', '兰考县', '241', '3'), ('2666', '尉氏县', '241', '3'), ('2667', '开封县', '241', '3'), ('2668', '杞县', '241', '3'), ('2669', '禹王台区', '241', '3'), ('2670', '通许县', '241', '3'), ('2671', '金明区', '241', '3'), ('2672', '顺河回族区', '241', '3'), ('2673', '鼓楼区', '241', '3'), ('2674', '龙亭区', '241', '3'), ('2675', '伊川县', '242', '3'), ('2676', '偃师市', '242', '3'), ('2677', '吉利区', '242', '3'), ('2678', '孟津县', '242', '3'), ('2679', '宜阳县', '242', '3'), ('2680', '嵩县', '242', '3'), ('2681', '新安县', '242', '3'), ('2682', '栾川县', '242', '3'), ('2683', '汝阳县', '242', '3'), ('2684', '洛宁县', '242', '3'), ('2685', '洛龙区', '242', '3'), ('2686', '涧西区', '242', '3'), ('2687', '瀍河回族区', '242', '3'), ('2688', '老城区', '242', '3'), ('2689', '西工区', '242', '3'), ('2690', '卫东区', '243', '3'), ('2691', '叶县', '243', '3'), ('2692', '宝丰县', '243', '3'), ('2693', '新华区', '243', '3'), ('2694', '汝州市', '243', '3'), ('2695', '湛河区', '243', '3'), ('2696', '石龙区', '243', '3'), ('2697', '舞钢市', '243', '3'), ('2698', '郏县', '243', '3'), ('2699', '鲁山县', '243', '3'), ('2700', '内黄县', '244', '3'), ('2701', '北关区', '244', '3'), ('2702', '安阳县', '244', '3'), ('2703', '文峰区', '244', '3'), ('2704', '林州市', '244', '3'), ('2705', '殷都区', '244', '3'), ('2706', '汤阴县', '244', '3'), ('2707', '滑县', '244', '3'), ('2708', '龙安区', '244', '3'), ('2709', '山城区', '245', '3'), ('2710', '浚县', '245', '3'), ('2711', '淇县', '245', '3'), ('2712', '淇滨区', '245', '3'), ('2713', '鹤山区', '245', '3'), ('2714', '凤泉区', '246', '3'), ('2715', '卫滨区', '246', '3'), ('2716', '卫辉市', '246', '3'), ('2717', '原阳县', '246', '3'), ('2718', '封丘县', '246', '3'), ('2719', '延津县', '246', '3'), ('2720', '新乡县', '246', '3'), ('2721', '牧野区', '246', '3'), ('2722', '红旗区', '246', '3'), ('2723', '获嘉县', '246', '3'), ('2724', '辉县市', '246', '3'), ('2725', '长垣县', '246', '3'), ('2726', '中站区', '247', '3'), ('2727', '修武县', '247', '3'), ('2728', '博爱县', '247', '3'), ('2729', '孟州市', '247', '3'), ('2730', '山阳区', '247', '3'), ('2731', '武陟县', '247', '3'), ('2732', '沁阳市', '247', '3'), ('2733', '温县', '247', '3'), ('2734', '解放区', '247', '3'), ('2735', '马村区', '247', '3'), ('2736', '华龙区', '248', '3'), ('2737', '南乐县', '248', '3'), ('2738', '台前县', '248', '3'), ('2739', '清丰县', '248', '3'), ('2740', '濮阳县', '248', '3'), ('2741', '范县', '248', '3'), ('2742', '禹州市', '249', '3'), ('2743', '襄城县', '249', '3'), ('2744', '许昌县', '249', '3'), ('2745', '鄢陵县', '249', '3'), ('2746', '长葛市', '249', '3'), ('2747', '魏都区', '249', '3'), ('2748', '临颍县', '250', '3'), ('2749', '召陵区', '250', '3'), ('2750', '源汇区', '250', '3'), ('2751', '舞阳县', '250', '3'), ('2752', '郾城区', '250', '3'), ('2753', '义马市', '251', '3'), ('2754', '卢氏县', '251', '3'), ('2755', '渑池县', '251', '3'), ('2756', '湖滨区', '251', '3'), ('2757', '灵宝市', '251', '3'), ('2758', '陕县', '251', '3'), ('2759', '内乡县', '252', '3'), ('2760', '南召县', '252', '3'), ('2761', '卧龙区', '252', '3'), ('2762', '唐河县', '252', '3'), ('2763', '宛城区', '252', '3'), ('2764', '新野县', '252', '3'), ('2765', '方城县', '252', '3'), ('2766', '桐柏县', '252', '3'), ('2767', '淅川县', '252', '3'), ('2768', '社旗县', '252', '3'), ('2769', '西峡县', '252', '3'), ('2770', '邓州市', '252', '3'), ('2771', '镇平县', '252', '3'), ('2772', '夏邑县', '253', '3'), ('2773', '宁陵县', '253', '3'), ('2774', '柘城县', '253', '3'), ('2775', '民权县', '253', '3'), ('2776', '永城市', '253', '3'), ('2777', '睢县', '253', '3'), ('2778', '睢阳区', '253', '3'), ('2779', '粱园区', '253', '3'), ('2780', '虞城县', '253', '3'), ('2781', '光山县', '254', '3'), ('2782', '商城县', '254', '3'), ('2783', '固始县', '254', '3'), ('2784', '平桥区', '254', '3'), ('2785', '息县', '254', '3'), ('2786', '新县', '254', '3'), ('2787', '浉河区', '254', '3'), ('2788', '淮滨县', '254', '3'), ('2789', '潢川县', '254', '3'), ('2790', '罗山县', '254', '3'), ('2791', '商水县', '255', '3'), ('2792', '太康县', '255', '3'), ('2793', '川汇区', '255', '3'), ('2794', '扶沟县', '255', '3'), ('2795', '沈丘县', '255', '3'), ('2796', '淮阳县', '255', '3'), ('2797', '西华县', '255', '3'), ('2798', '郸城县', '255', '3'), ('2799', '项城市', '255', '3'), ('2800', '鹿邑县', '255', '3'), ('2801', '上蔡县', '256', '3'), ('2802', '平舆县', '256', '3'), ('2803', '新蔡县', '256', '3'), ('2804', '正阳县', '256', '3'), ('2805', '汝南县', '256', '3'), ('2806', '泌阳县', '256', '3'), ('2807', '确山县', '256', '3'), ('2808', '西平县', '256', '3'), ('2809', '遂平县', '256', '3'), ('2810', '驿城区', '256', '3'), ('2811', '济源市', '257', '3'), ('2812', '东西湖区', '258', '3'), ('2813', '新洲区', '258', '3'), ('2814', '武昌区', '258', '3'), ('2815', '汉南区', '258', '3'), ('2816', '汉阳区', '258', '3'), ('2817', '江夏区', '258', '3'), ('2818', '江岸区', '258', '3'), ('2819', '江汉区', '258', '3'), ('2820', '洪山区', '258', '3'), ('2821', '硚口区', '258', '3'), ('2822', '蔡甸区', '258', '3'), ('2823', '青山区', '258', '3'), ('2824', '黄陂区', '258', '3'), ('2825', '下陆区', '259', '3'), ('2826', '大冶市', '259', '3'), ('2827', '西塞山区', '259', '3'), ('2828', '铁山区', '259', '3'), ('2829', '阳新县', '259', '3'), ('2830', '黄石港区', '259', '3'), ('2831', '丹江口市', '260', '3'), ('2832', '张湾区', '260', '3'), ('2833', '房县', '260', '3'), ('2834', '竹山县', '260', '3'), ('2835', '竹溪县', '260', '3'), ('2836', '茅箭区', '260', '3'), ('2837', '郧县', '260', '3'), ('2838', '郧西县', '260', '3'), ('2839', '五峰土家族自治县', '261', '3'), ('2840', '伍家岗区', '261', '3'), ('2841', '兴山县', '261', '3'), ('2842', '夷陵区', '261', '3'), ('2843', '宜都市', '261', '3'), ('2844', '当阳市', '261', '3'), ('2845', '枝江市', '261', '3'), ('2846', '点军区', '261', '3'), ('2847', '秭归县', '261', '3'), ('2848', '虢亭区', '261', '3'), ('2849', '西陵区', '261', '3'), ('2850', '远安县', '261', '3'), ('2851', '长阳土家族自治县', '261', '3'), ('2852', '保康县', '262', '3'), ('2853', '南漳县', '262', '3'), ('2854', '宜城市', '262', '3'), ('2855', '枣阳市', '262', '3'), ('2856', '樊城区', '262', '3'), ('2857', '老河口市', '262', '3'), ('2858', '襄城区', '262', '3'), ('2859', '襄阳区', '262', '3'), ('2860', '谷城县', '262', '3'), ('2861', '华容区', '263', '3'), ('2862', '粱子湖', '263', '3'), ('2863', '鄂城区', '263', '3'), ('2864', '东宝区', '264', '3'), ('2865', '京山县', '264', '3'), ('2866', '掇刀区', '264', '3'), ('2867', '沙洋县', '264', '3'), ('2868', '钟祥市', '264', '3'), ('2869', '云梦县', '265', '3'), ('2870', '大悟县', '265', '3'), ('2871', '孝南区', '265', '3'), ('2872', '孝昌县', '265', '3'), ('2873', '安陆市', '265', '3'), ('2874', '应城市', '265', '3'), ('2875', '汉川市', '265', '3'), ('2876', '公安县', '266', '3'), ('2877', '松滋市', '266', '3'), ('2878', '江陵县', '266', '3'), ('2879', '沙市区', '266', '3'), ('2880', '洪湖市', '266', '3'), ('2881', '监利县', '266', '3'), ('2882', '石首市', '266', '3'), ('2883', '荆州区', '266', '3'), ('2884', '团风县', '267', '3'), ('2885', '武穴市', '267', '3'), ('2886', '浠水县', '267', '3'), ('2887', '红安县', '267', '3'), ('2888', '罗田县', '267', '3'), ('2889', '英山县', '267', '3'), ('2890', '蕲春县', '267', '3'), ('2891', '麻城市', '267', '3'), ('2892', '黄州区', '267', '3'), ('2893', '黄梅县', '267', '3'), ('2894', '咸安区', '268', '3'), ('2895', '嘉鱼县', '268', '3'), ('2896', '崇阳县', '268', '3'), ('2897', '赤壁市', '268', '3'), ('2898', '通城县', '268', '3'), ('2899', '通山县', '268', '3'), ('2900', '广水市', '269', '3'), ('2901', '曾都区', '269', '3'), ('2902', '利川市', '270', '3'), ('2903', '咸丰县', '270', '3'), ('2904', '宣恩县', '270', '3'), ('2905', '巴东县', '270', '3'), ('2906', '建始县', '270', '3'), ('2907', '恩施市', '270', '3'), ('2908', '来凤县', '270', '3'), ('2909', '鹤峰县', '270', '3'), ('2910', '仙桃市', '271', '3'), ('2911', '潜江市', '272', '3'), ('2912', '天门市', '273', '3'), ('2913', '神农架林区', '274', '3'), ('2914', '天心区', '275', '3'), ('2915', '宁乡县', '275', '3'), ('2916', '岳麓区', '275', '3'), ('2917', '开福区', '275', '3'), ('2918', '望城县', '275', '3'), ('2919', '浏阳市', '275', '3'), ('2920', '芙蓉区', '275', '3'), ('2921', '长沙县', '275', '3'), ('2922', '雨花区', '275', '3'), ('2923', '天元区', '276', '3'), ('2924', '攸县', '276', '3'), ('2925', '株洲县', '276', '3'), ('2926', '炎陵县', '276', '3'), ('2927', '石峰区', '276', '3'), ('2928', '芦淞区', '276', '3'), ('2929', '茶陵县', '276', '3'), ('2930', '荷塘区', '276', '3'), ('2931', '醴陵市', '276', '3'), ('2932', '岳塘区', '277', '3'), ('2933', '湘乡市', '277', '3'), ('2934', '湘潭县', '277', '3'), ('2935', '雨湖区', '277', '3'), ('2936', '韶山市', '277', '3'), ('2937', '南岳区', '278', '3'), ('2938', '常宁市', '278', '3'), ('2939', '珠晖区', '278', '3'), ('2940', '石鼓区', '278', '3'), ('2941', '祁东县', '278', '3'), ('2942', '耒阳市', '278', '3'), ('2943', '蒸湘区', '278', '3'), ('2944', '衡东县', '278', '3'), ('2945', '衡南县', '278', '3'), ('2946', '衡山县', '278', '3'), ('2947', '衡阳县', '278', '3'), ('2948', '雁峰区', '278', '3'), ('2949', '北塔区', '279', '3'), ('2950', '双清区', '279', '3'), ('2951', '城步苗族自治县', '279', '3'), ('2952', '大祥区', '279', '3'), ('2953', '新宁县', '279', '3'), ('2954', '新邵县', '279', '3'), ('2955', '武冈市', '279', '3'), ('2956', '洞口县', '279', '3'), ('2957', '绥宁县', '279', '3'), ('2958', '邵东县', '279', '3'), ('2959', '邵阳县', '279', '3'), ('2960', '隆回县', '279', '3'), ('2961', '临湘市', '280', '3'), ('2962', '云溪区', '280', '3'), ('2963', '华容县', '280', '3'), ('2964', '君山区', '280', '3'), ('2965', '岳阳县', '280', '3'), ('2966', '岳阳楼区', '280', '3'), ('2967', '平江县', '280', '3'), ('2968', '汨罗市', '280', '3'), ('2969', '湘阴县', '280', '3'), ('2970', '临澧县', '281', '3'), ('2971', '安乡县', '281', '3'), ('2972', '桃源县', '281', '3'), ('2973', '武陵区', '281', '3'), ('2974', '汉寿县', '281', '3'), ('2975', '津市市', '281', '3'), ('2976', '澧县', '281', '3'), ('2977', '石门县', '281', '3'), ('2978', '鼎城区', '281', '3'), ('2979', '慈利县', '282', '3'), ('2980', '桑植县', '282', '3'), ('2981', '武陵源区', '282', '3'), ('2982', '永定区', '282', '3'), ('2983', '南县', '283', '3'), ('2984', '安化县', '283', '3'), ('2985', '桃江县', '283', '3'), ('2986', '沅江市', '283', '3'), ('2987', '资阳区', '283', '3'), ('2988', '赫山区', '283', '3'), ('2989', '临武县', '284', '3'), ('2990', '北湖区', '284', '3'), ('2991', '嘉禾县', '284', '3'), ('2992', '安仁县', '284', '3'), ('2993', '宜章县', '284', '3'), ('2994', '桂东县', '284', '3'), ('2995', '桂阳县', '284', '3'), ('2996', '永兴县', '284', '3'), ('2997', '汝城县', '284', '3'), ('2998', '苏仙区', '284', '3'), ('2999', '资兴市', '284', '3'), ('3000', '东安县', '285', '3'), ('3001', '冷水滩区', '285', '3'), ('3002', '双牌县', '285', '3'), ('3003', '宁远县', '285', '3'), ('3004', '新田县', '285', '3'), ('3005', '江华瑶族自治县', '285', '3'), ('3006', '江永县', '285', '3'), ('3007', '祁阳县', '285', '3'), ('3008', '蓝山县', '285', '3'), ('3009', '道县', '285', '3'), ('3010', '零陵区', '285', '3'), ('3011', '中方县', '286', '3'), ('3012', '会同县', '286', '3'), ('3013', '新晃侗族自治县', '286', '3'), ('3014', '沅陵县', '286', '3'), ('3015', '洪江市/洪江区', '286', '3'), ('3016', '溆浦县', '286', '3'), ('3017', '芷江侗族自治县', '286', '3'), ('3018', '辰溪县', '286', '3'), ('3019', '通道侗族自治县', '286', '3'), ('3020', '靖州苗族侗族自治县', '286', '3'), ('3021', '鹤城区', '286', '3'), ('3022', '麻阳苗族自治县', '286', '3'), ('3023', '冷水江市', '287', '3'), ('3024', '双峰县', '287', '3'), ('3025', '娄星区', '287', '3'), ('3026', '新化县', '287', '3'), ('3027', '涟源市', '287', '3'), ('3028', '保靖县', '288', '3'), ('3029', '凤凰县', '288', '3'), ('3030', '古丈县', '288', '3'), ('3031', '吉首市', '288', '3'), ('3032', '永顺县', '288', '3'), ('3033', '泸溪县', '288', '3'), ('3034', '花垣县', '288', '3'), ('3035', '龙山县', '288', '3'), ('3036', '萝岗区', '289', '3'), ('3037', '南沙区', '289', '3'), ('3038', '从化市', '289', '3'), ('3039', '增城市', '289', '3'), ('3040', '天河区', '289', '3'), ('3041', '海珠区', '289', '3'), ('3042', '番禺区', '289', '3'), ('3043', '白云区', '289', '3'), ('3044', '花都区', '289', '3'), ('3045', '荔湾区', '289', '3'), ('3046', '越秀区', '289', '3'), ('3047', '黄埔区', '289', '3'), ('3048', '乐昌市', '290', '3'), ('3049', '乳源瑶族自治县', '290', '3'), ('3050', '仁化县', '290', '3'), ('3051', '南雄市', '290', '3'), ('3052', '始兴县', '290', '3'), ('3053', '新丰县', '290', '3'), ('3054', '曲江区', '290', '3'), ('3055', '武江区', '290', '3'), ('3056', '浈江区', '290', '3'), ('3057', '翁源县', '290', '3'), ('3058', '南山区', '291', '3'), ('3059', '宝安区', '291', '3'), ('3060', '盐田区', '291', '3'), ('3061', '福田区', '291', '3'), ('3062', '罗湖区', '291', '3'), ('3063', '龙岗区', '291', '3'), ('3064', '斗门区', '292', '3'), ('3065', '金湾区', '292', '3'), ('3066', '香洲区', '292', '3'), ('3067', '南澳县', '293', '3'), ('3068', '潮南区', '293', '3'), ('3069', '潮阳区', '293', '3'), ('3070', '澄海区', '293', '3'), ('3071', '濠江区', '293', '3'), ('3072', '金平区', '293', '3'), ('3073', '龙湖区', '293', '3'), ('3074', '三水区', '294', '3'), ('3075', '南海区', '294', '3'), ('3076', '禅城区', '294', '3'), ('3077', '顺德区', '294', '3'), ('3078', '高明区', '294', '3'), ('3079', '台山市', '295', '3'), ('3080', '开平市', '295', '3'), ('3081', '恩平市', '295', '3'), ('3082', '新会区', '295', '3'), ('3083', '江海区', '295', '3'), ('3084', '蓬江区', '295', '3'), ('3085', '鹤山市', '295', '3'), ('3086', '吴川市', '296', '3'), ('3087', '坡头区', '296', '3'), ('3088', '廉江市', '296', '3'), ('3089', '徐闻县', '296', '3'), ('3090', '赤坎区', '296', '3'), ('3091', '遂溪县', '296', '3'), ('3092', '雷州市', '296', '3'), ('3093', '霞山区', '296', '3'), ('3094', '麻章区', '296', '3'), ('3095', '信宜市', '297', '3'), ('3096', '化州市', '297', '3'), ('3097', '电白县', '297', '3'), ('3098', '茂南区', '297', '3'), ('3099', '茂港区', '297', '3'), ('3100', '高州市', '297', '3'), ('3101', '四会市', '298', '3'), ('3102', '封开县', '298', '3'), ('3103', '广宁县', '298', '3'), ('3104', '德庆县', '298', '3'), ('3105', '怀集县', '298', '3'), ('3106', '端州区', '298', '3'), ('3107', '高要市', '298', '3'), ('3108', '鼎湖区', '298', '3'), ('3109', '博罗县', '299', '3'), ('3110', '惠东县', '299', '3'), ('3111', '惠城区', '299', '3'), ('3112', '惠阳区', '299', '3'), ('3113', '龙门县', '299', '3'), ('3114', '丰顺县', '300', '3'), ('3115', '五华县', '300', '3'), ('3116', '兴宁市', '300', '3'), ('3117', '大埔县', '300', '3'), ('3118', '平远县', '300', '3'), ('3119', '梅县', '300', '3'), ('3120', '梅江区', '300', '3'), ('3121', '蕉岭县', '300', '3'), ('3122', '城区', '301', '3'), ('3123', '海丰县', '301', '3'), ('3124', '陆丰市', '301', '3'), ('3125', '陆河县', '301', '3'), ('3126', '东源县', '302', '3'), ('3127', '和平县', '302', '3'), ('3128', '源城区', '302', '3'), ('3129', '紫金县', '302', '3'), ('3130', '连平县', '302', '3'), ('3131', '龙川县', '302', '3'), ('3132', '江城区', '303', '3'), ('3133', '阳东县', '303', '3'), ('3134', '阳春市', '303', '3'), ('3135', '阳西县', '303', '3'), ('3136', '佛冈县', '304', '3'), ('3137', '清城区', '304', '3'), ('3138', '清新县', '304', '3'), ('3139', '英德市', '304', '3'), ('3140', '连南瑶族自治县', '304', '3'), ('3141', '连山壮族瑶族自治县', '304', '3'), ('3142', '连州市', '304', '3'), ('3143', '阳山县', '304', '3'), ('3144', '东莞市', '305', '3'), ('3145', '中山市', '306', '3'), ('3146', '湘桥区', '307', '3'), ('3147', '潮安县', '307', '3'), ('3148', '饶平县', '307', '3'), ('3149', '惠来县', '308', '3'), ('3150', '揭东县', '308', '3'), ('3151', '揭西县', '308', '3'), ('3152', '普宁市', '308', '3'), ('3153', '榕城区', '308', '3'), ('3154', '云城区', '309', '3'), ('3155', '云安县', '309', '3'), ('3156', '新兴县', '309', '3'), ('3157', '罗定市', '309', '3'), ('3158', '郁南县', '309', '3'), ('3159', '上林县', '310', '3'), ('3160', '兴宁区', '310', '3'), ('3161', '宾阳县', '310', '3'), ('3162', '横县', '310', '3'), ('3163', '武鸣县', '310', '3'), ('3164', '江南区', '310', '3'), ('3165', '良庆区', '310', '3'), ('3166', '西乡塘区', '310', '3'), ('3167', '邕宁区', '310', '3'), ('3168', '隆安县', '310', '3'), ('3169', '青秀区', '310', '3'), ('3170', '马山县', '310', '3'), ('3171', '三江侗族自治县', '311', '3'), ('3172', '城中区', '311', '3'), ('3173', '柳北区', '311', '3'), ('3174', '柳南区', '311', '3'), ('3175', '柳城县', '311', '3'), ('3176', '柳江县', '311', '3'), ('3177', '融安县', '311', '3'), ('3178', '融水苗族自治县', '311', '3'), ('3179', '鱼峰区', '311', '3'), ('3180', '鹿寨县', '311', '3'), ('3181', '七星区', '312', '3'), ('3182', '临桂县', '312', '3'), ('3183', '全州县', '312', '3'), ('3184', '兴安县', '312', '3'), ('3185', '叠彩区', '312', '3'), ('3186', '平乐县', '312', '3'), ('3187', '恭城瑶族自治县', '312', '3'), ('3188', '永福县', '312', '3'), ('3189', '灌阳县', '312', '3'), ('3190', '灵川县', '312', '3'), ('3191', '秀峰区', '312', '3'), ('3192', '荔浦县', '312', '3'), ('3193', '象山区', '312', '3'), ('3194', '资源县', '312', '3'), ('3195', '阳朔县', '312', '3'), ('3196', '雁山区', '312', '3'), ('3197', '龙胜各族自治县', '312', '3'), ('3198', '万秀区', '313', '3'), ('3199', '岑溪市', '313', '3'), ('3200', '苍梧县', '313', '3'), ('3201', '蒙山县', '313', '3'), ('3202', '藤县', '313', '3'), ('3203', '蝶山区', '313', '3'), ('3204', '长洲区', '313', '3'), ('3205', '合浦县', '314', '3'), ('3206', '海城区', '314', '3'), ('3207', '铁山港区', '314', '3'), ('3208', '银海区', '314', '3'), ('3209', '上思县', '315', '3'), ('3210', '东兴市', '315', '3'), ('3211', '港口区', '315', '3'), ('3212', '防城区', '315', '3'), ('3213', '浦北县', '316', '3'), ('3214', '灵山县', '316', '3'), ('3215', '钦北区', '316', '3'), ('3216', '钦南区', '316', '3'), ('3217', '平南县', '317', '3'), ('3218', '桂平市', '317', '3'), ('3219', '港北区', '317', '3'), ('3220', '港南区', '317', '3'), ('3221', '覃塘区', '317', '3'), ('3222', '兴业县', '318', '3'), ('3223', '北流市', '318', '3'), ('3224', '博白县', '318', '3'), ('3225', '容县', '318', '3'), ('3226', '玉州区', '318', '3'), ('3227', '陆川县', '318', '3'), ('3228', '乐业县', '319', '3'), ('3229', '凌云县', '319', '3'), ('3230', '右江区', '319', '3'), ('3231', '平果县', '319', '3'), ('3232', '德保县', '319', '3'), ('3233', '田东县', '319', '3'), ('3234', '田林县', '319', '3'), ('3235', '田阳县', '319', '3'), ('3236', '西林县', '319', '3'), ('3237', '那坡县', '319', '3'), ('3238', '隆林各族自治县', '319', '3'), ('3239', '靖西县', '319', '3'), ('3240', '八步区', '320', '3'), ('3241', '富川瑶族自治县', '320', '3'), ('3242', '昭平县', '320', '3'), ('3243', '钟山县', '320', '3'), ('3244', '东兰县', '321', '3'), ('3245', '凤山县', '321', '3'), ('3246', '南丹县', '321', '3'), ('3247', '大化瑶族自治县', '321', '3'), ('3248', '天峨县', '321', '3'), ('3249', '宜州市', '321', '3'), ('3250', '巴马瑶族自治县', '321', '3'), ('3251', '环江毛南族自治县', '321', '3'), ('3252', '罗城仫佬族自治县', '321', '3'), ('3253', '都安瑶族自治县', '321', '3'), ('3254', '金城江区', '321', '3'), ('3255', '兴宾区', '322', '3'), ('3256', '合山市', '322', '3'), ('3257', '忻城县', '322', '3'), ('3258', '武宣县', '322', '3'), ('3259', '象州县', '322', '3'), ('3260', '金秀瑶族自治县', '322', '3'), ('3261', '凭祥市', '323', '3'), ('3262', '大新县', '323', '3'), ('3263', '天等县', '323', '3'), ('3264', '宁明县', '323', '3'), ('3265', '扶绥县', '323', '3'), ('3266', '江州区', '323', '3'), ('3267', '龙州县', '323', '3'), ('3268', '琼山区', '324', '3'), ('3269', '秀英区', '324', '3'), ('3270', '美兰区', '324', '3'), ('3271', '龙华区', '324', '3'), ('3272', '三亚市', '325', '3'), ('3273', '五指山市', '326', '3'), ('3274', '琼海市', '327', '3'), ('3275', '儋州市', '328', '3'), ('3276', '文昌市', '329', '3'), ('3277', '万宁市', '330', '3'), ('3278', '东方市', '331', '3'), ('3279', '定安县', '332', '3'), ('3280', '屯昌县', '333', '3'), ('3281', '澄迈县', '334', '3'), ('3282', '临高县', '335', '3'), ('3283', '白沙黎族自治县', '336', '3'), ('3284', '昌江黎族自治县', '337', '3'), ('3285', '乐东黎族自治县', '338', '3'), ('3286', '陵水黎族自治县', '339', '3'), ('3287', '保亭黎族苗族自治县', '340', '3'), ('3288', '琼中黎族苗族自治县', '341', '3'), ('3289', '九池乡', '345', '3'), ('3290', '五桥街道', '345', '3'), ('3291', '余家镇', '345', '3'), ('3292', '分水镇', '345', '3'), ('3293', '双河口街道', '345', '3'), ('3294', '后山镇', '345', '3'), ('3295', '周家坝街道', '345', '3'), ('3296', '响水镇', '345', '3'), ('3297', '地宝乡', '345', '3'), ('3298', '大周镇', '345', '3'), ('3299', '天城镇', '345', '3'), ('3300', '太安镇', '345', '3'), ('3301', '太白街道', '345', '3'), ('3302', '太龙镇', '345', '3'), ('3303', '孙家镇', '345', '3'), ('3304', '小周镇', '345', '3'), ('3305', '弹子镇', '345', '3'), ('3306', '恒合土家族乡', '345', '3'), ('3307', '新乡镇', '345', '3'), ('3308', '新田镇', '345', '3'), ('3309', '普子乡', '345', '3'), ('3310', '李河镇', '345', '3'), ('3311', '柱山乡', '345', '3'), ('3312', '梨树乡', '345', '3'), ('3313', '武陵镇', '345', '3'), ('3314', '沙河街道', '345', '3'), ('3315', '溪口乡', '345', '3'), ('3316', '瀼渡镇', '345', '3'), ('3317', '熊家镇', '345', '3'), ('3318', '燕山乡', '345', '3'), ('3319', '牌楼街道', '345', '3'), ('3320', '甘宁镇', '345', '3'), ('3321', '白土镇', '345', '3'), ('3322', '白羊镇', '345', '3'), ('3323', '百安坝街道', '345', '3'), ('3324', '罗田镇', '345', '3'), ('3325', '茨竹乡', '345', '3'), ('3326', '走马镇', '345', '3'), ('3327', '郭村乡', '345', '3'), ('3328', '钟鼓楼街道', '345', '3'), ('3329', '铁峰乡', '345', '3'), ('3330', '长坪乡', '345', '3'), ('3331', '长岭镇', '345', '3'), ('3332', '长滩镇', '345', '3'), ('3333', '陈家坝街道', '345', '3'), ('3334', '高峰镇', '345', '3'), ('3335', '高梁镇', '345', '3'), ('3336', '高笋塘街道', '345', '3'), ('3337', '黄柏乡', '345', '3'), ('3338', '龙沙镇', '345', '3'), ('3339', '龙都街道', '345', '3'), ('3340', '龙驹镇', '345', '3'), ('3341', '丛林乡', '346', '3'), ('3342', '两汇乡', '346', '3'), ('3343', '中峰乡', '346', '3'), ('3344', '义和镇', '346', '3'), ('3345', '仁义乡', '346', '3'), ('3346', '南沱镇', '346', '3'), ('3347', '卷洞乡', '346', '3'), ('3348', '同乐乡', '346', '3'), ('3349', '土地坡乡', '346', '3'), ('3350', '堡子镇', '346', '3'), ('3351', '增福乡', '346', '3'), ('3352', '大木乡', '346', '3'), ('3353', '天台乡', '346', '3'), ('3354', '太和乡', '346', '3'), ('3355', '山窝乡', '346', '3'), ('3356', '崇义街道', '346', '3'), ('3357', '惠民乡', '346', '3'), ('3358', '敦仁街道', '346', '3'), ('3359', '新妙镇', '346', '3'), ('3360', '新村乡', '346', '3'), ('3361', '明家乡', '346', '3'), ('3362', '李渡镇', '346', '3'), ('3363', '梓里乡', '346', '3'), ('3364', '武陵山乡', '346', '3'), ('3365', '江东街道', '346', '3'), ('3366', '江北街道', '346', '3'), ('3367', '清溪镇', '346', '3'), ('3368', '焦石镇', '346', '3'), ('3369', '珍溪镇', '346', '3'), ('3370', '白涛镇', '346', '3'), ('3371', '百胜镇', '346', '3'), ('3372', '石和乡', '346', '3'), ('3373', '石沱镇', '346', '3'), ('3374', '石龙乡', '346', '3'), ('3375', '罗云乡', '346', '3'), ('3376', '聚宝乡', '346', '3'), ('3377', '致韩镇', '346', '3'), ('3378', '荔枝街道', '346', '3'), ('3379', '蔺市镇', '346', '3'), ('3380', '酒店乡', '346', '3'), ('3381', '镇安镇', '346', '3'), ('3382', '青羊镇', '346', '3'), ('3383', '马武镇', '346', '3'), ('3384', '龙桥镇', '346', '3'), ('3385', '龙潭镇', '346', '3'), ('3386', '七星岗街道', '347', '3'), ('3387', '上清寺街道', '347', '3'), ('3388', '两路口街道', '347', '3'), ('3389', '化龙桥街道', '347', '3'), ('3390', '南纪门街道', '347', '3'), ('3391', '大坪街道', '347', '3'), ('3392', '大溪沟街道', '347', '3'), ('3393', '望龙门街道', '347', '3'), ('3394', '朝天门街道', '347', '3'), ('3395', '石油路街道', '347', '3'), ('3396', '菜园坝街道', '347', '3'), ('3397', '解放碑街道', '347', '3'), ('3398', '九宫庙街道', '348', '3'), ('3399', '八桥镇', '348', '3'), ('3400', '建胜镇', '348', '3'), ('3401', '新山村街道', '348', '3'), ('3402', '春晖路街道', '348', '3'), ('3403', '茄子溪街道', '348', '3'), ('3404', '跃进村街道', '348', '3'), ('3405', '跳磴镇', '348', '3'), ('3406', '五宝镇', '349', '3'), ('3407', '五里店街道', '349', '3'), ('3408', '华新街街道', '349', '3'), ('3409', '复盛镇', '349', '3'), ('3410', '大石坝街道', '349', '3'), ('3411', '寸滩街道', '349', '3'), ('3412', '江北城街道', '349', '3'), ('3413', '石马河街道', '349', '3'), ('3414', '观音桥街道', '349', '3'), ('3415', '郭家沱街道', '349', '3'), ('3416', '铁山坪街道', '349', '3'), ('3417', '鱼嘴镇', '349', '3'), ('3418', '中梁镇', '350', '3'), ('3419', '井口街道', '350', '3'), ('3420', '井口镇', '350', '3'), ('3421', '凤凰镇', '350', '3'), ('3422', '回龙坝镇', '350', '3'), ('3423', '土主镇', '350', '3'), ('3424', '土湾街道', '350', '3'), ('3425', '天星桥街道', '350', '3'), ('3426', '小龙坎街道', '350', '3'), ('3427', '山洞街道', '350', '3'), ('3428', '新桥街道', '350', '3'), ('3429', '曾家镇', '350', '3'), ('3430', '歌乐山街道', '350', '3'), ('3431', '歌乐山镇', '350', '3'), ('3432', '沙坪坝街道', '350', '3'), ('3433', '渝碚路街道', '350', '3'), ('3434', '石井坡街道', '350', '3'), ('3435', '磁器口街道', '350', '3'), ('3436', '童家桥街道', '350', '3'), ('3437', '虎溪镇', '350', '3'), ('3438', '西永镇', '350', '3'), ('3439', '覃家岗镇', '350', '3'), ('3440', '詹家溪街道', '350', '3'), ('3441', '陈家桥镇', '350', '3'), ('3442', '青木关镇', '350', '3'), ('3443', '中梁山街道', '351', '3'), ('3444', '九龙镇', '351', '3'), ('3445', '华岩镇', '351', '3'), ('3446', '含谷镇', '351', '3'), ('3447', '巴福镇', '351', '3'), ('3448', '杨家坪街道', '351', '3'), ('3449', '渝州路街道', '351', '3'), ('3450', '白市驿镇', '351', '3'), ('3451', '石坪桥街道', '351', '3'), ('3452', '石板镇', '351', '3'), ('3453', '石桥铺街道', '351', '3'), ('3454', '西彭镇', '351', '3'), ('3455', '谢家湾街道', '351', '3'), ('3456', '走马镇', '351', '3'), ('3457', '金凤镇', '351', '3'), ('3458', '铜罐驿镇', '351', '3'), ('3459', '陶家镇', '351', '3'), ('3460', '黄桷坪街道', '351', '3'), ('3461', '南坪街道', '352', '3'), ('3462', '南坪镇', '352', '3'), ('3463', '南山街道', '352', '3'), ('3464', '峡口镇', '352', '3'), ('3465', '广阳镇', '352', '3'), ('3466', '弹子石街道', '352', '3'), ('3467', '海棠溪街道', '352', '3'), ('3468', '涂山镇', '352', '3'), ('3469', '花园路街道', '352', '3'), ('3470', '迎龙镇', '352', '3'), ('3471', '铜元局街道', '352', '3'), ('3472', '长生桥镇', '352', '3'), ('3473', '鸡冠石镇', '352', '3'), ('3474', '龙门浩街道', '352', '3'), ('3475', '三圣镇', '353', '3'), ('3476', '东阳街道', '353', '3'), ('3477', '北温泉街道', '353', '3'), ('3478', '复兴镇', '353', '3'), ('3479', '天府镇', '353', '3'), ('3480', '天生街道', '353', '3'), ('3481', '施家梁镇', '353', '3'), ('3482', '朝阳街道', '353', '3'), ('3483', '柳荫镇', '353', '3'), ('3484', '歇马镇', '353', '3'), ('3485', '水土镇', '353', '3'), ('3486', '澄江镇', '353', '3'), ('3487', '童家溪镇', '353', '3'), ('3488', '蔡家岗镇', '353', '3'), ('3489', '金刀峡镇', '353', '3'), ('3490', '静观镇', '353', '3'), ('3491', '龙凤桥街道', '353', '3'), ('3492', '双路镇', '354', '3'), ('3493', '通桥镇', '354', '3'), ('3494', '龙滩子街道', '354', '3'), ('3495', '万东镇', '355', '3'), ('3496', '万盛街道', '355', '3'), ('3497', '丛林镇', '355', '3'), ('3498', '东林街道', '355', '3'), ('3499', '关坝镇', '355', '3'), ('3500', '南桐镇', '355', '3'), ('3501', '石林镇', '355', '3'), ('3502', '金桥镇', '355', '3'), ('3503', '青年镇', '355', '3'), ('3504', '黑山镇', '355', '3'), ('3505', '人和街道', '356', '3'), ('3506', '兴隆镇', '356', '3'), ('3507', '华蓥山镇', '356', '3'), ('3508', '双凤桥街道', '356', '3'), ('3509', '双龙湖街道', '356', '3'), ('3510', '古路镇', '356', '3'), ('3511', '回兴街道', '356', '3'), ('3512', '大塆镇', '356', '3'), ('3513', '大盛镇', '356', '3'), ('3514', '大竹林街道', '356', '3'), ('3515', '天宫殿街道', '356', '3'), ('3516', '张关镇', '356', '3'), ('3517', '御临镇', '356', '3'), ('3518', '悦来镇', '356', '3'), ('3519', '明月镇', '356', '3'), ('3520', '木耳镇', '356', '3'), ('3521', '洛碛镇', '356', '3'), ('3522', '玉峰山镇', '356', '3'), ('3523', '王家镇', '356', '3'), ('3524', '石坪镇', '356', '3'), ('3525', '石船镇', '356', '3'), ('3526', '礼嘉镇', '356', '3'), ('3527', '统景镇', '356', '3'), ('3528', '翠云街道', '356', '3'), ('3529', '茨竹', '356', '3'), ('3530', '高嘴镇', '356', '3'), ('3531', '鸳鸯街道', '356', '3'), ('3532', '麻柳沱镇', '356', '3'), ('3533', '龙兴镇', '356', '3'), ('3534', '龙塔街道', '356', '3'), ('3535', '龙山街道', '356', '3'), ('3536', '龙溪街道', '356', '3'), ('3537', '一品镇', '357', '3'), ('3538', '东泉镇', '357', '3'), ('3539', '丰盛镇', '357', '3'), ('3540', '二圣镇', '357', '3'), ('3541', '南彭镇', '357', '3'), ('3542', '南泉镇', '357', '3'), ('3543', '双河口镇', '357', '3'), ('3544', '天星寺镇', '357', '3'), ('3545', '姜家镇', '357', '3'), ('3546', '安澜镇', '357', '3'), ('3547', '惠民镇', '357', '3'), ('3548', '接龙镇', '357', '3'), ('3549', '木洞镇', '357', '3'), ('3550', '李家沱街道', '357', '3'), ('3551', '界石镇', '357', '3'), ('3552', '石滩镇', '357', '3'), ('3553', '石龙镇', '357', '3'), ('3554', '花溪镇', '357', '3'), ('3555', '跳石镇', '357', '3'), ('3556', '鱼洞街道', '357', '3'), ('3557', '麻柳嘴镇', '357', '3'), ('3558', '两河镇', '358', '3'), ('3559', '中塘乡', '358', '3'), ('3560', '五里乡', '358', '3'), ('3561', '冯家镇', '358', '3'), ('3562', '城东街道', '358', '3'), ('3563', '城南街道', '358', '3'), ('3564', '城西街道', '358', '3'), ('3565', '太极乡', '358', '3'), ('3566', '小南海镇', '358', '3'), ('3567', '新华乡', '358', '3'), ('3568', '杉岭乡', '358', '3'), ('3569', '正阳镇', '358', '3'), ('3570', '水市乡', '358', '3'), ('3571', '水田乡', '358', '3'), ('3572', '沙坝乡', '358', '3'), ('3573', '濯水镇', '358', '3'), ('3574', '白土乡', '358', '3'), ('3575', '白石乡', '358', '3'), ('3576', '石会镇', '358', '3'), ('3577', '石家镇', '358', '3'), ('3578', '舟白镇', '358', '3'), ('3579', '蓬东乡', '358', '3'), ('3580', '邻鄂镇', '358', '3'), ('3581', '金洞乡', '358', '3'), ('3582', '金溪镇', '358', '3'), ('3583', '马喇镇', '358', '3'), ('3584', '鹅池镇', '358', '3'), ('3585', '黄溪镇', '358', '3'), ('3586', '黎水镇', '358', '3'), ('3587', '黑溪镇', '358', '3'), ('3588', '万顺镇', '359', '3'), ('3589', '云台镇', '359', '3'), ('3590', '云集镇', '359', '3'), ('3591', '但渡镇', '359', '3'), ('3592', '八颗镇', '359', '3'), ('3593', '凤城街道', '359', '3'), ('3594', '双龙镇', '359', '3'), ('3595', '新市镇', '359', '3'), ('3596', '晏家街道', '359', '3'), ('3597', '江南镇', '359', '3'), ('3598', '洪湖镇', '359', '3'), ('3599', '海棠镇', '359', '3'), ('3600', '渡舟镇', '359', '3'), ('3601', '石堰镇', '359', '3'), ('3602', '葛兰镇', '359', '3'), ('3603', '邻封镇', '359', '3'), ('3604', '长寿湖镇', '359', '3'), ('3605', '龙河镇', '359', '3'), ('3606', '丁山镇', '360', '3'), ('3607', '三江镇', '360', '3'), ('3608', '三角镇', '360', '3'), ('3609', '东溪镇', '360', '3'), ('3610', '中峰镇', '360', '3'), ('3611', '古南镇', '360', '3'), ('3612', '安稳镇', '360', '3'), ('3613', '打通镇', '360', '3'), ('3614', '扶欢镇', '360', '3'), ('3615', '新盛镇', '360', '3'), ('3616', '横山镇', '360', '3'), ('3617', '永城镇', '360', '3'), ('3618', '永新镇', '360', '3'), ('3619', '石壕镇', '360', '3'), ('3620', '石角镇', '360', '3'), ('3621', '篆塘镇', '360', '3'), ('3622', '赶水镇', '360', '3'), ('3623', '郭扶镇', '360', '3'), ('3624', '隆盛镇', '360', '3'), ('3625', '上和镇', '361', '3'), ('3626', '五桂镇', '361', '3'), ('3627', '别口乡', '361', '3'), ('3628', '卧佛镇', '361', '3'), ('3629', '双江镇', '361', '3'), ('3630', '古溪镇', '361', '3'), ('3631', '塘坝镇', '361', '3'), ('3632', '太安镇', '361', '3'), ('3633', '宝龙镇', '361', '3'), ('3634', '寿桥乡', '361', '3'), ('3635', '小渡镇', '361', '3'), ('3636', '崇龛镇', '361', '3'), ('3637', '新胜镇', '361', '3'), ('3638', '柏梓镇', '361', '3'), ('3639', '桂林街道', '361', '3'), ('3640', '梓潼街道', '361', '3'), ('3641', '玉溪镇', '361', '3'), ('3642', '田家乡', '361', '3'), ('3643', '米心镇', '361', '3'), ('3644', '群力镇', '361', '3'), ('3645', '花岩镇', '361', '3'), ('3646', '龙形镇', '361', '3'), ('3647', '东城街道', '362', '3'), ('3648', '二坪镇', '362', '3'), ('3649', '侣俸镇', '362', '3'), ('3650', '华兴镇', '362', '3'), ('3651', '南城街道', '362', '3'), ('3652', '双山乡', '362', '3'), ('3653', '围龙镇', '362', '3'), ('3654', '土桥镇', '362', '3'), ('3655', '大庙镇', '362', '3'), ('3656', '太平镇', '362', '3'), ('3657', '安居镇', '362', '3'), ('3658', '安溪镇', '362', '3'), ('3659', '小林乡', '362', '3'), ('3660', '少云镇', '362', '3'), ('3661', '巴川街道', '362', '3'), ('3662', '平滩镇', '362', '3'), ('3663', '庆隆乡', '362', '3'), ('3664', '旧县镇', '362', '3'), ('3665', '水口镇', '362', '3'), ('3666', '永嘉镇', '362', '3'), ('3667', '白羊镇', '362', '3'), ('3668', '石鱼镇', '362', '3'), ('3669', '福果镇', '362', '3'), ('3670', '维新镇', '362', '3'), ('3671', '蒲吕镇', '362', '3'), ('3672', '虎峰镇', '362', '3'), ('3673', '西河镇', '362', '3'), ('3674', '高楼镇', '362', '3'), ('3675', '万古镇', '363', '3'), ('3676', '三驱镇', '363', '3'), ('3677', '中敖镇', '363', '3'), ('3678', '古龙乡', '363', '3'), ('3679', '回龙镇', '363', '3'), ('3680', '国梁镇', '363', '3'), ('3681', '季家镇', '363', '3'), ('3682', '宝兴镇', '363', '3'), ('3683', '宝顶镇', '363', '3'), ('3684', '拾万镇', '363', '3'), ('3685', '智凤镇', '363', '3'), ('3686', '棠香街道', '363', '3'), ('3687', '玉龙镇', '363', '3'), ('3688', '珠溪镇', '363', '3'), ('3689', '石马镇', '363', '3'), ('3690', '邮亭镇', '363', '3'), ('3691', '金山镇', '363', '3'), ('3692', '铁山镇', '363', '3'), ('3693', '雍溪镇', '363', '3'), ('3694', '高升场镇', '363', '3'), ('3695', '高坪乡', '363', '3'), ('3696', '龙岗街道', '363', '3'), ('3697', '龙水镇', '363', '3'), ('3698', '龙石镇', '363', '3'), ('3699', '仁义镇', '364', '3'), ('3700', '双河镇', '364', '3'), ('3701', '古昌镇', '364', '3'), ('3702', '吴家镇', '364', '3'), ('3703', '安富镇', '364', '3'), ('3704', '峰高镇', '364', '3'), ('3705', '广顺镇', '364', '3'), ('3706', '昌元镇', '364', '3'), ('3707', '河包镇', '364', '3'), ('3708', '清升镇', '364', '3'), ('3709', '清江镇', '364', '3'), ('3710', '清流镇', '364', '3'), ('3711', '盘龙镇', '364', '3'), ('3712', '直升镇', '364', '3'), ('3713', '荣隆镇', '364', '3'), ('3714', '观胜镇', '364', '3'), ('3715', '路孔镇', '364', '3'), ('3716', '远觉镇', '364', '3'), ('3717', '铜鼓镇', '364', '3'), ('3718', '龙集镇', '364', '3'), ('3719', '丁家镇', '365', '3'), ('3720', '七塘镇', '365', '3'), ('3721', '三合镇', '365', '3'), ('3722', '健龙乡', '365', '3'), ('3723', '八塘镇', '365', '3'), ('3724', '大兴镇', '365', '3'), ('3725', '大路镇', '365', '3'), ('3726', '广普镇', '365', '3'), ('3727', '正兴镇', '365', '3'), ('3728', '河边镇', '365', '3'), ('3729', '璧城街道', '365', '3'), ('3730', '福禄镇', '365', '3'), ('3731', '青杠街道', '365', '3'), ('3732', '七星镇', '366', '3'), ('3733', '云龙镇', '366', '3'), ('3734', '仁贤镇', '366', '3'), ('3735', '合兴镇', '366', '3'), ('3736', '和林镇', '366', '3'), ('3737', '回龙镇', '366', '3'), ('3738', '城东乡', '366', '3'), ('3739', '城北乡', '366', '3'), ('3740', '复平乡', '366', '3'), ('3741', '大观镇', '366', '3'), ('3742', '安胜乡', '366', '3'), ('3743', '屏锦镇', '366', '3'), ('3744', '文化镇', '366', '3'), ('3745', '新盛镇', '366', '3'), ('3746', '明达镇', '366', '3'), ('3747', '曲水乡', '366', '3'), ('3748', '柏家镇', '366', '3'), ('3749', '梁山镇', '366', '3'), ('3750', '石安镇', '366', '3'), ('3751', '碧山镇', '366', '3'), ('3752', '礼让镇', '366', '3'), ('3753', '福禄镇', '366', '3'), ('3754', '竹山镇', '366', '3'), ('3755', '紫照乡', '366', '3'), ('3756', '聚奎镇', '366', '3'), ('3757', '荫平镇', '366', '3'), ('3758', '虎城镇', '366', '3'), ('3759', '蟠龙镇', '366', '3'), ('3760', '袁驿镇', '366', '3'), ('3761', '金带镇', '366', '3'), ('3762', '铁门乡', '366', '3'), ('3763', '龙胜乡', '366', '3'), ('3764', '龙门镇', '366', '3'), ('3765', '东安乡', '367', '3'), ('3766', '修齐镇', '367', '3'), ('3767', '北屏乡', '367', '3'), ('3768', '厚坪乡', '367', '3'), ('3769', '双河乡', '367', '3'), ('3770', '周溪乡', '367', '3'), ('3771', '咸宜乡', '367', '3'), ('3772', '坪坝镇', '367', '3'), ('3773', '岚天乡', '367', '3'), ('3774', '左岚乡', '367', '3'), ('3775', '巴山镇', '367', '3'), ('3776', '庙坝镇', '367', '3'), ('3777', '明中乡', '367', '3'), ('3778', '明通镇', '367', '3'), ('3779', '河鱼乡', '367', '3'), ('3780', '治平乡', '367', '3'), ('3781', '沿河乡', '367', '3'), ('3782', '葛城镇', '367', '3'), ('3783', '蓼子乡', '367', '3'), ('3784', '高楠乡', '367', '3'), ('3785', '高燕乡', '367', '3'), ('3786', '高观镇', '367', '3'), ('3787', '鸡鸣乡', '367', '3'), ('3788', '龙田乡', '367', '3'), ('3789', '三元镇', '368', '3'), ('3790', '三合镇', '368', '3'), ('3791', '三坝乡', '368', '3'), ('3792', '三建乡', '368', '3'), ('3793', '仁沙乡', '368', '3'), ('3794', '保合乡', '368', '3'), ('3795', '兴义镇', '368', '3'), ('3796', '包鸾镇', '368', '3'), ('3797', '十直镇', '368', '3'), ('3798', '南天湖镇', '368', '3'), ('3799', '双路镇', '368', '3'), ('3800', '双龙场乡', '368', '3'), ('3801', '名山镇', '368', '3'), ('3802', '太平坝乡', '368', '3'), ('3803', '崇兴乡', '368', '3'), ('3804', '暨龙乡', '368', '3'), ('3805', '树人镇', '368', '3'), ('3806', '栗子乡', '368', '3'), ('3807', '武平镇', '368', '3'), ('3808', '江池镇', '368', '3'), ('3809', '湛普镇', '368', '3'), ('3810', '社坛镇', '368', '3'), ('3811', '董家镇', '368', '3'), ('3812', '虎威镇', '368', '3'), ('3813', '许明寺镇', '368', '3'), ('3814', '都督乡', '368', '3'), ('3815', '镇江镇', '368', '3'), ('3816', '青龙乡', '368', '3'), ('3817', '高家镇', '368', '3'), ('3818', '龙孔乡', '368', '3'), ('3819', '龙河镇', '368', '3'), ('3820', '三溪乡', '369', '3'), ('3821', '五洞镇', '369', '3'), ('3822', '包家乡', '369', '3'), ('3823', '周嘉镇', '369', '3'), ('3824', '坪山镇', '369', '3'), ('3825', '大石乡', '369', '3'), ('3826', '太平镇', '369', '3'), ('3827', '新民镇', '369', '3'), ('3828', '普顺镇', '369', '3'), ('3829', '曹回乡', '369', '3'), ('3830', '杠家乡', '369', '3'), ('3831', '桂溪镇', '369', '3'), ('3832', '永安镇', '369', '3'), ('3833', '永平乡', '369', '3'), ('3834', '沙坪镇', '369', '3'), ('3835', '沙河乡', '369', '3'), ('3836', '澄溪镇', '369', '3'), ('3837', '白家乡', '369', '3'), ('3838', '砚台镇', '369', '3'), ('3839', '裴兴乡', '369', '3'), ('3840', '长龙乡', '369', '3'), ('3841', '高安镇', '369', '3'), ('3842', '高峰镇', '369', '3'), ('3843', '鹤游镇', '369', '3'), ('3844', '黄沙乡', '369', '3'), ('3845', '仙女山镇', '370', '3'), ('3846', '凤来乡', '370', '3'), ('3847', '双河乡', '370', '3'), ('3848', '后坪乡', '370', '3'), ('3849', '和顺乡', '370', '3'), ('3850', '土地乡', '370', '3'), ('3851', '土坎镇', '370', '3'), ('3852', '巷口镇', '370', '3'), ('3853', '平桥镇', '370', '3'), ('3854', '庙垭乡', '370', '3'), ('3855', '接龙乡', '370', '3'), ('3856', '文复乡', '370', '3'), ('3857', '桐梓镇', '370', '3'), ('3858', '江口镇', '370', '3'), ('3859', '沧沟乡', '370', '3'), ('3860', '浩口乡', '370', '3'), ('3861', '火炉镇', '370', '3'), ('3862', '白云乡', '370', '3'), ('3863', '白马镇', '370', '3'), ('3864', '石桥乡', '370', '3'), ('3865', '羊角镇', '370', '3'), ('3866', '赵家乡', '370', '3'), ('3867', '铁矿乡', '370', '3'), ('3868', '长坝镇', '370', '3'), ('3869', '鸭江镇', '370', '3'), ('3870', '黄莺乡', '370', '3'), ('3871', '三汇镇', '371', '3'), ('3872', '东溪镇', '371', '3'), ('3873', '乌杨镇', '371', '3'), ('3874', '任家镇', '371', '3'), ('3875', '兴峰乡', '371', '3'), ('3876', '双桂镇', '371', '3'), ('3877', '善广乡', '371', '3'), ('3878', '复兴镇', '371', '3'), ('3879', '官坝镇', '371', '3'), ('3880', '忠州镇', '371', '3'), ('3881', '拔山镇', '371', '3'), ('3882', '新生镇', '371', '3'), ('3883', '新立镇', '371', '3'), ('3884', '永丰镇', '371', '3'), ('3885', '汝溪镇', '371', '3'), ('3886', '洋渡镇', '371', '3'), ('3887', '涂井乡', '371', '3'), ('3888', '白石镇', '371', '3'), ('3889', '石子乡', '371', '3'), ('3890', '石宝镇', '371', '3'), ('3891', '石黄镇', '371', '3'), ('3892', '磨子土家族乡', '371', '3'), ('3893', '花桥镇', '371', '3'), ('3894', '野鹤镇', '371', '3'), ('3895', '金声乡', '371', '3'), ('3896', '金鸡镇', '371', '3'), ('3897', '马灌镇', '371', '3'), ('3898', '黄金镇', '371', '3'), ('3899', '三汇口乡', '372', '3'), ('3900', '中和镇', '372', '3'), ('3901', '丰乐街道', '372', '3'), ('3902', '临江镇', '372', '3'), ('3903', '义和镇', '372', '3'), ('3904', '九龙山镇', '372', '3'), ('3905', '五通乡', '372', '3'), ('3906', '关面乡', '372', '3'), ('3907', '南门镇', '372', '3'), ('3908', '南雅镇', '372', '3'), ('3909', '厚坝镇', '372', '3'), ('3910', '和谦镇', '372', '3'), ('3911', '大德乡', '372', '3'), ('3912', '大进镇', '372', '3'), ('3913', '天和乡', '372', '3'), ('3914', '岳溪镇', '372', '3'), ('3915', '巫山乡', '372', '3'), ('3916', '敦好镇', '372', '3'), ('3917', '汉丰街道', '372', '3'), ('3918', '河堰镇', '372', '3'), ('3919', '渠口镇', '372', '3'), ('3920', '温泉镇', '372', '3'), ('3921', '满月乡', '372', '3'), ('3922', '白桥乡', '372', '3'), ('3923', '白泉乡', '372', '3'), ('3924', '白鹤街道', '372', '3'), ('3925', '竹溪镇', '372', '3'), ('3926', '紫水乡', '372', '3'), ('3927', '谭家乡', '372', '3'), ('3928', '赵家镇', '372', '3'), ('3929', '郭家镇', '372', '3'), ('3930', '金峰乡', '372', '3'), ('3931', '铁桥镇', '372', '3'), ('3932', '镇东街道', '372', '3'), ('3933', '镇安镇', '372', '3'), ('3934', '长沙镇', '372', '3'), ('3935', '高桥镇', '372', '3'), ('3936', '麻柳乡', '372', '3'), ('3937', '上坝乡', '373', '3'), ('3938', '云安镇', '373', '3'), ('3939', '云硐乡', '373', '3'), ('3940', '云阳镇', '373', '3'), ('3941', '人和镇', '373', '3'), ('3942', '养鹿乡', '373', '3'), ('3943', '农坝镇', '373', '3'), ('3944', '凤鸣镇', '373', '3'), ('3945', '南溪镇', '373', '3'), ('3946', '双土镇', '373', '3'), ('3947', '双江街道', '373', '3'), ('3948', '双龙乡', '373', '3'), ('3949', '后叶乡', '373', '3'), ('3950', '堰坪乡', '373', '3'), ('3951', '外郎乡', '373', '3'), ('3952', '大阳乡', '373', '3'), ('3953', '宝坪镇', '373', '3'), ('3954', '巴阳镇', '373', '3'), ('3955', '平安镇', '373', '3'), ('3956', '故陵镇', '373', '3'), ('3957', '新津乡', '373', '3'), ('3958', '普安乡', '373', '3'), ('3959', '栖霞乡', '373', '3'), ('3960', '桑坪镇', '373', '3'), ('3961', '毛坝乡', '373', '3'), ('3962', '水口乡', '373', '3'), ('3963', '江口镇', '373', '3'), ('3964', '沙市镇', '373', '3'), ('3965', '泥溪乡', '373', '3'), ('3966', '洞鹿乡', '373', '3'), ('3967', '清水土家族乡', '373', '3'), ('3968', '渠马镇', '373', '3'), ('3969', '盘龙镇', '373', '3'), ('3970', '石门乡', '373', '3'), ('3971', '票草乡', '373', '3'), ('3972', '红狮镇', '373', '3'), ('3973', '耀灵乡', '373', '3'), ('3974', '路阳镇', '373', '3'), ('3975', '青龙街道', '373', '3'), ('3976', '高阳镇', '373', '3'), ('3977', '鱼泉镇', '373', '3'), ('3978', '黄石镇', '373', '3'), ('3979', '龙洞乡', '373', '3'), ('3980', '龙角镇', '373', '3'), ('3981', '云雾土家族乡', '374', '3'), ('3982', '五马乡', '374', '3'), ('3983', '公平镇', '374', '3'), ('3984', '兴隆镇', '374', '3'), ('3985', '冯坪乡', '374', '3'), ('3986', '吐祥镇', '374', '3'), ('3987', '大树镇', '374', '3'), ('3988', '太和乡', '374', '3'), ('3989', '安坪乡', '374', '3'), ('3990', '岩湾乡', '374', '3'), ('3991', '平安乡', '374', '3'), ('3992', '康乐镇', '374', '3'), ('3993', '康坪乡', '374', '3'), ('3994', '新政乡', '374', '3'), ('3995', '新民镇', '374', '3'), ('3996', '朱衣镇', '374', '3'), ('3997', '永乐镇', '374', '3'), ('3998', '永安镇', '374', '3'), ('3999', '汾河镇', '374', '3'), ('4000', '甲高镇', '374', '3'), ('4001', '白帝镇', '374', '3'), ('4002', '石岗乡', '374', '3'), ('4003', '竹园镇', '374', '3'), ('4004', '红土乡', '374', '3'), ('4005', '羊市镇', '374', '3'), ('4006', '草堂镇', '374', '3'), ('4007', '长安土家族乡', '374', '3'), ('4008', '青龙镇', '374', '3'), ('4009', '鹤峰乡', '374', '3'), ('4010', '龙桥土家族乡', '374', '3'), ('4011', '三溪乡', '375', '3'), ('4012', '两坪乡', '375', '3'), ('4013', '双龙镇', '375', '3'), ('4014', '培石乡', '375', '3'), ('4015', '大昌镇', '375', '3'), ('4016', '大溪乡', '375', '3'), ('4017', '官渡镇', '375', '3'), ('4018', '官阳镇', '375', '3'), ('4019', '巫峡镇', '375', '3'), ('4020', '平河乡', '375', '3'), ('4021', '庙堂乡', '375', '3'), ('4022', '庙宇镇', '375', '3'), ('4023', '建平乡', '375', '3'), ('4024', '当阳乡', '375', '3'), ('4025', '抱龙镇', '375', '3'), ('4026', '曲尺乡', '375', '3'), ('4027', '福田镇', '375', '3'), ('4028', '竹贤乡', '375', '3'), ('4029', '笃坪乡', '375', '3'), ('4030', '红椿土家族乡', '375', '3'), ('4031', '邓家土家族乡', '375', '3'), ('4032', '金坪乡', '375', '3'), ('4033', '铜鼓镇', '375', '3'), ('4034', '骡坪镇', '375', '3'), ('4035', '龙井乡', '375', '3'), ('4036', '龙溪镇', '375', '3'), ('4037', '上磺镇', '376', '3'), ('4038', '下堡镇', '376', '3'), ('4039', '中岗乡', '376', '3'), ('4040', '中梁乡', '376', '3'), ('4041', '乌龙乡', '376', '3'), ('4042', '兰英乡', '376', '3'), ('4043', '凤凰镇', '376', '3'), ('4044', '双阳乡', '376', '3'), ('4045', '古路镇', '376', '3'), ('4046', '土城乡', '376', '3'), ('4047', '城厢镇', '376', '3'), ('4048', '塘坊乡', '376', '3'), ('4049', '大河乡', '376', '3'), ('4050', '天元乡', '376', '3'), ('4051', '天星乡', '376', '3'), ('4052', '宁厂镇', '376', '3'), ('4053', '尖山镇', '376', '3'), ('4054', '峰灵乡', '376', '3'), ('4055', '徐家镇', '376', '3'), ('4056', '文峰镇', '376', '3'), ('4057', '朝阳洞乡', '376', '3'), ('4058', '田坝乡', '376', '3'), ('4059', '白鹿镇', '376', '3'), ('4060', '胜利乡', '376', '3'), ('4061', '花台乡', '376', '3'), ('4062', '菱角乡', '376', '3'), ('4063', '蒲莲乡', '376', '3'), ('4064', '通城乡', '376', '3'), ('4065', '长桂乡', '376', '3'), ('4066', '鱼鳞乡', '376', '3'), ('4067', '万朝乡', '377', '3'), ('4068', '三星乡', '377', '3'), ('4069', '三河乡', '377', '3'), ('4070', '三益乡', '377', '3'), ('4071', '下路镇', '377', '3'), ('4072', '中益乡', '377', '3'), ('4073', '临溪镇', '377', '3'), ('4074', '六塘乡', '377', '3'), ('4075', '冷水乡', '377', '3'), ('4076', '南宾镇', '377', '3'), ('4077', '大歇乡', '377', '3'), ('4078', '悦崃镇', '377', '3'), ('4079', '新乐乡', '377', '3'), ('4080', '枫木乡', '377', '3'), ('4081', '桥头乡', '377', '3'), ('4082', '沙子镇', '377', '3'), ('4083', '河嘴乡', '377', '3'), ('4084', '沿溪镇', '377', '3'), ('4085', '洗新乡', '377', '3'), ('4086', '渔池镇', '377', '3'), ('4087', '王场镇', '377', '3'), ('4088', '王家乡', '377', '3'), ('4089', '石家乡', '377', '3'), ('4090', '西沱镇', '377', '3'), ('4091', '金竹乡', '377', '3'), ('4092', '金铃乡', '377', '3'), ('4093', '马武镇', '377', '3'), ('4094', '黄水镇', '377', '3'), ('4095', '黄鹤乡', '377', '3'), ('4096', '黎场乡', '377', '3'), ('4097', '龙沙镇', '377', '3'), ('4098', '龙潭乡', '377', '3'), ('4099', '中和镇', '378', '3'), ('4100', '中平乡', '378', '3'), ('4101', '保安乡', '378', '3'), ('4102', '兰桥镇', '378', '3'), ('4103', '塘坳乡', '378', '3'), ('4104', '大溪乡', '378', '3'), ('4105', '妙泉乡', '378', '3'), ('4106', '孝溪乡', '378', '3'), ('4107', '宋农乡', '378', '3'), ('4108', '官庄镇', '378', '3'), ('4109', '官舟乡', '378', '3'), ('4110', '岑溪乡', '378', '3'), ('4111', '峨溶镇', '378', '3'), ('4112', '巴家乡', '378', '3'), ('4113', '干川乡', '378', '3'), ('4114', '平凯镇', '378', '3'), ('4115', '平马乡', '378', '3'), ('4116', '梅江镇', '378', '3'), ('4117', '洪安镇', '378', '3'), ('4118', '海洋乡', '378', '3'), ('4119', '涌洞乡', '378', '3'), ('4120', '清溪场镇', '378', '3'), ('4121', '溪口乡', '378', '3'), ('4122', '溶溪镇', '378', '3'), ('4123', '石堤镇', '378', '3'), ('4124', '石耶镇', '378', '3'), ('4125', '膏田乡', '378', '3'), ('4126', '里仁乡', '378', '3'), ('4127', '钟灵乡', '378', '3'), ('4128', '隘口镇', '378', '3'), ('4129', '雅江镇', '378', '3'), ('4130', '龙池镇', '378', '3'), ('4131', '丁市镇', '379', '3'), ('4132', '万木乡', '379', '3'), ('4133', '两罾乡', '379', '3'), ('4134', '五福乡', '379', '3'), ('4135', '偏柏乡', '379', '3'), ('4136', '兴隆镇', '379', '3'), ('4137', '南腰界乡', '379', '3'), ('4138', '双泉乡', '379', '3'), ('4139', '可大乡', '379', '3'), ('4140', '后坪坝乡', '379', '3'), ('4141', '后溪镇', '379', '3'), ('4142', '大溪镇', '379', '3'), ('4143', '天馆乡', '379', '3'), ('4144', '官清乡', '379', '3'), ('4145', '宜居乡', '379', '3'), ('4146', '小河镇', '379', '3'), ('4147', '庙溪乡', '379', '3'), ('4148', '木叶乡', '379', '3'), ('4149', '李溪镇', '379', '3'), ('4150', '板桥乡', '379', '3'), ('4151', '板溪乡', '379', '3'), ('4152', '楠木乡', '379', '3'), ('4153', '毛坝乡', '379', '3'), ('4154', '江丰乡', '379', '3'), ('4155', '泔溪镇', '379', '3'), ('4156', '浪坪乡', '379', '3'), ('4157', '涂市乡', '379', '3'), ('4158', '清泉乡', '379', '3'), ('4159', '腴地乡', '379', '3'), ('4160', '花田乡', '379', '3'), ('4161', '苍岭镇', '379', '3'), ('4162', '车田乡', '379', '3'), ('4163', '酉酬镇', '379', '3'), ('4164', '钟多镇', '379', '3'), ('4165', '铜鼓乡', '379', '3'), ('4166', '麻旺镇', '379', '3'), ('4167', '黑水镇', '379', '3'), ('4168', '龙潭镇', '379', '3'), ('4169', '龚滩镇', '379', '3'), ('4170', '万足乡', '380', '3'), ('4171', '三义乡', '380', '3'), ('4172', '乔梓乡', '380', '3'), ('4173', '保家镇', '380', '3'), ('4174', '双龙乡', '380', '3'), ('4175', '善感乡', '380', '3'), ('4176', '大垭乡', '380', '3'), ('4177', '太原乡', '380', '3'), ('4178', '小厂乡', '380', '3'), ('4179', '岩东乡', '380', '3'), ('4180', '平安乡', '380', '3'), ('4181', '新田乡', '380', '3'), ('4182', '普子镇', '380', '3'), ('4183', '朗溪乡', '380', '3'), ('4184', '桐楼乡', '380', '3'), ('4185', '桑柘镇', '380', '3'), ('4186', '梅子垭乡', '380', '3'), ('4187', '棣棠乡', '380', '3'), ('4188', '汉葭镇', '380', '3'), ('4189', '润溪乡', '380', '3'), ('4190', '石柳乡', '380', '3'), ('4191', '石盘乡', '380', '3'), ('4192', '联合乡', '380', '3'), ('4193', '芦塘乡', '380', '3'), ('4194', '诸佛乡', '380', '3'), ('4195', '走马乡', '380', '3'), ('4196', '迁乔乡', '380', '3'), ('4197', '连湖镇', '380', '3'), ('4198', '郁山镇', '380', '3'), ('4199', '长滩乡', '380', '3'), ('4200', '靛水乡', '380', '3'), ('4201', '鞍子乡', '380', '3'), ('4202', '高谷镇', '380', '3'), ('4203', '鹿角镇', '380', '3'), ('4204', '鹿鸣乡', '380', '3'), ('4205', '黄家镇', '380', '3'), ('4206', '龙塘乡', '380', '3'), ('4207', '龙射镇', '380', '3'), ('4208', '龙溪乡', '380', '3'), ('4209', '双流县', '385', '3'), ('4210', '大邑县', '385', '3'), ('4211', '崇州市', '385', '3'), ('4212', '彭州市', '385', '3'), ('4213', '成华区', '385', '3'), ('4214', '新津县', '385', '3'), ('4215', '新都区', '385', '3'), ('4216', '武侯区', '385', '3'), ('4217', '温江区', '385', '3'), ('4218', '蒲江县', '385', '3'), ('4219', '邛崃市', '385', '3'), ('4220', '郫县', '385', '3'), ('4221', '都江堰市', '385', '3'), ('4222', '金堂县', '385', '3'), ('4223', '金牛区', '385', '3'), ('4224', '锦江区', '385', '3'), ('4225', '青白江区', '385', '3'), ('4226', '青羊区', '385', '3'), ('4227', '龙泉驿区', '385', '3'), ('4228', '大安区', '386', '3'), ('4229', '富顺县', '386', '3'), ('4230', '沿滩区', '386', '3'), ('4231', '自流井区', '386', '3'), ('4232', '荣县', '386', '3'), ('4233', '贡井区', '386', '3'), ('4234', '东区', '387', '3'), ('4235', '仁和区', '387', '3'), ('4236', '盐边县', '387', '3'), ('4237', '米易县', '387', '3'), ('4238', '西区', '387', '3'), ('4239', '叙永县', '388', '3'), ('4240', '古蔺县', '388', '3'), ('4241', '合江县', '388', '3'), ('4242', '江阳区', '388', '3'), ('4243', '泸县', '388', '3'), ('4244', '纳溪区', '388', '3'), ('4245', '龙马潭区', '388', '3'), ('4246', '中江县', '389', '3'), ('4247', '什邡市', '389', '3'), ('4248', '广汉市', '389', '3'), ('4249', '旌阳区', '389', '3'), ('4250', '绵竹市', '389', '3'), ('4251', '罗江县', '389', '3'), ('4252', '三台县', '390', '3'), ('4253', '北川羌族自治县', '390', '3'), ('4254', '安县', '390', '3'), ('4255', '平武县', '390', '3'), ('4256', '梓潼县', '390', '3'), ('4257', '江油市', '390', '3'), ('4258', '涪城区', '390', '3'), ('4259', '游仙区', '390', '3'), ('4260', '盐亭县', '390', '3'), ('4261', '元坝区', '391', '3'), ('4262', '利州区', '391', '3'), ('4263', '剑阁县', '391', '3'), ('4264', '旺苍县', '391', '3'), ('4265', '朝天区', '391', '3'), ('4266', '苍溪县', '391', '3'), ('4267', '青川县', '391', '3'), ('4268', '大英县', '392', '3'), ('4269', '安居区', '392', '3'), ('4270', '射洪县', '392', '3'), ('4271', '船山区', '392', '3'), ('4272', '蓬溪县', '392', '3'), ('4273', '东兴区', '393', '3'), ('4274', '威远县', '393', '3'), ('4275', '市中区', '393', '3'), ('4276', '资中县', '393', '3'), ('4277', '隆昌县', '393', '3'), ('4278', '五通桥区', '394', '3'), ('4279', '井研县', '394', '3'), ('4280', '夹江县', '394', '3'), ('4281', '峨眉山市', '394', '3'), ('4282', '峨边彝族自治县', '394', '3'), ('4283', '市中区', '394', '3'), ('4284', '沐川县', '394', '3'), ('4285', '沙湾区', '394', '3'), ('4286', '犍为县', '394', '3'), ('4287', '金口河区', '394', '3'), ('4288', '马边彝族自治县', '394', '3'), ('4289', '仪陇县', '395', '3'), ('4290', '南充市嘉陵区', '395', '3'), ('4291', '南部县', '395', '3'), ('4292', '嘉陵区', '395', '3'), ('4293', '营山县', '395', '3'), ('4294', '蓬安县', '395', '3'), ('4295', '西充县', '395', '3'), ('4296', '阆中市', '395', '3'), ('4297', '顺庆区', '395', '3'), ('4298', '高坪区', '395', '3'), ('4299', '东坡区', '396', '3'), ('4300', '丹棱县', '396', '3'), ('4301', '仁寿县', '396', '3'), ('4302', '彭山县', '396', '3'), ('4303', '洪雅县', '396', '3'), ('4304', '青神县', '396', '3'), ('4305', '兴文县', '397', '3'), ('4306', '南溪县', '397', '3'), ('4307', '宜宾县', '397', '3'), ('4308', '屏山县', '397', '3'), ('4309', '江安县', '397', '3'), ('4310', '珙县', '397', '3'), ('4311', '筠连县', '397', '3'), ('4312', '翠屏区', '397', '3'), ('4313', '长宁县', '397', '3'), ('4314', '高县', '397', '3'), ('4315', '华蓥市', '398', '3'), ('4316', '岳池县', '398', '3'), ('4317', '广安区', '398', '3'), ('4318', '武胜县', '398', '3'), ('4319', '邻水县', '398', '3'), ('4320', '万源市', '399', '3'), ('4321', '大竹县', '399', '3'), ('4322', '宣汉县', '399', '3'), ('4323', '开江县', '399', '3'), ('4324', '渠县', '399', '3'), ('4325', '达县', '399', '3'), ('4326', '通川区', '399', '3'), ('4327', '名山县', '400', '3'), ('4328', '天全县', '400', '3'), ('4329', '宝兴县', '400', '3'), ('4330', '汉源县', '400', '3'), ('4331', '石棉县', '400', '3'), ('4332', '芦山县', '400', '3'), ('4333', '荥经县', '400', '3'), ('4334', '雨城区', '400', '3'), ('4335', '南江县', '401', '3'), ('4336', '巴州区', '401', '3'), ('4337', '平昌县', '401', '3'), ('4338', '通江县', '401', '3'), ('4339', '乐至县', '402', '3'), ('4340', '安岳县', '402', '3'), ('4341', '简阳市', '402', '3'), ('4342', '雁江区', '402', '3'), ('4343', '九寨沟县', '403', '3'), ('4344', '壤塘县', '403', '3'), ('4345', '小金县', '403', '3'), ('4346', '松潘县', '403', '3'), ('4347', '汶川县', '403', '3'), ('4348', '理县', '403', '3'), ('4349', '红原县', '403', '3'), ('4350', '若尔盖县', '403', '3'), ('4351', '茂县', '403', '3'), ('4352', '金川县', '403', '3'), ('4353', '阿坝县', '403', '3'), ('4354', '马尔康县', '403', '3'), ('4355', '黑水县', '403', '3'), ('4356', '丹巴县', '404', '3'), ('4357', '乡城县', '404', '3'), ('4358', '巴塘县', '404', '3'), ('4359', '康定县', '404', '3'), ('4360', '得荣县', '404', '3'), ('4361', '德格县', '404', '3'), ('4362', '新龙县', '404', '3'), ('4363', '泸定县', '404', '3'), ('4364', '炉霍县', '404', '3'), ('4365', '理塘县', '404', '3'), ('4366', '甘孜县', '404', '3'), ('4367', '白玉县', '404', '3'), ('4368', '石渠县', '404', '3'), ('4369', '稻城县', '404', '3'), ('4370', '色达县', '404', '3'), ('4371', '道孚县', '404', '3'), ('4372', '雅江县', '404', '3'), ('4373', '会东县', '405', '3'), ('4374', '会理县', '405', '3'), ('4375', '冕宁县', '405', '3'), ('4376', '喜德县', '405', '3'), ('4377', '宁南县', '405', '3'), ('4378', '布拖县', '405', '3'), ('4379', '德昌县', '405', '3'), ('4380', '昭觉县', '405', '3'), ('4381', '普格县', '405', '3'), ('4382', '木里藏族自治县', '405', '3'), ('4383', '甘洛县', '405', '3'), ('4384', '盐源县', '405', '3'), ('4385', '美姑县', '405', '3'), ('4386', '西昌', '405', '3'), ('4387', '越西县', '405', '3'), ('4388', '金阳县', '405', '3'), ('4389', '雷波县', '405', '3'), ('4390', '乌当区', '406', '3'), ('4391', '云岩区', '406', '3'), ('4392', '修文县', '406', '3'), ('4393', '南明区', '406', '3'), ('4394', '小河区', '406', '3'), ('4395', '开阳县', '406', '3'), ('4396', '息烽县', '406', '3'), ('4397', '清镇市', '406', '3'), ('4398', '白云区', '406', '3'), ('4399', '花溪区', '406', '3'), ('4400', '六枝特区', '407', '3'), ('4401', '水城县', '407', '3'), ('4402', '盘县', '407', '3'), ('4403', '钟山区', '407', '3'), ('4404', '习水县', '408', '3'), ('4405', '仁怀市', '408', '3'), ('4406', '余庆县', '408', '3'), ('4407', '凤冈县', '408', '3'), ('4408', '务川仡佬族苗族自治县', '408', '3'), ('4409', '桐梓县', '408', '3'), ('4410', '正安县', '408', '3'), ('4411', '汇川区', '408', '3'), ('4412', '湄潭县', '408', '3'), ('4413', '红花岗区', '408', '3'), ('4414', '绥阳县', '408', '3'), ('4415', '赤水市', '408', '3'), ('4416', '道真仡佬族苗族自治县', '408', '3'), ('4417', '遵义县', '408', '3'), ('4418', '关岭布依族苗族自治县', '409', '3'), ('4419', '平坝县', '409', '3'), ('4420', '普定县', '409', '3'), ('4421', '紫云苗族布依族自治县', '409', '3'), ('4422', '西秀区', '409', '3'), ('4423', '镇宁布依族苗族自治县', '409', '3'), ('4424', '万山特区', '410', '3'), ('4425', '印江土家族苗族自治县', '410', '3'), ('4426', '德江县', '410', '3'), ('4427', '思南县', '410', '3'), ('4428', '松桃苗族自治县', '410', '3'), ('4429', '江口县', '410', '3'), ('4430', '沿河土家族自治县', '410', '3'), ('4431', '玉屏侗族自治县', '410', '3'), ('4432', '石阡县', '410', '3'), ('4433', '铜仁市', '410', '3'), ('4434', '兴义市', '411', '3'), ('4435', '兴仁县', '411', '3'), ('4436', '册亨县', '411', '3'), ('4437', '安龙县', '411', '3'), ('4438', '普安县', '411', '3'), ('4439', '晴隆县', '411', '3'), ('4440', '望谟县', '411', '3'), ('4441', '贞丰县', '411', '3'), ('4442', '大方县', '412', '3'), ('4443', '威宁彝族回族苗族自治县', '412', '3'), ('4444', '毕节市', '412', '3'), ('4445', '纳雍县', '412', '3'), ('4446', '织金县', '412', '3'), ('4447', '赫章县', '412', '3'), ('4448', '金沙县', '412', '3'), ('4449', '黔西县', '412', '3'), ('4450', '三穗县', '413', '3'), ('4451', '丹寨县', '413', '3'), ('4452', '从江县', '413', '3'), ('4453', '凯里市', '413', '3'), ('4454', '剑河县', '413', '3'), ('4455', '台江县', '413', '3'), ('4456', '天柱县', '413', '3'), ('4457', '岑巩县', '413', '3'), ('4458', '施秉县', '413', '3'), ('4459', '榕江县', '413', '3'), ('4460', '锦屏县', '413', '3'), ('4461', '镇远县', '413', '3'), ('4462', '雷山县', '413', '3'), ('4463', '麻江县', '413', '3'), ('4464', '黄平县', '413', '3'), ('4465', '黎平县', '413', '3'), ('4466', '三都水族自治县', '414', '3'), ('4467', '平塘县', '414', '3'), ('4468', '惠水县', '414', '3'), ('4469', '独山县', '414', '3'), ('4470', '瓮安县', '414', '3'), ('4471', '福泉市', '414', '3'), ('4472', '罗甸县', '414', '3'), ('4473', '荔波县', '414', '3'), ('4474', '贵定县', '414', '3'), ('4475', '都匀市', '414', '3'), ('4476', '长顺县', '414', '3'), ('4477', '龙里县', '414', '3'), ('4478', '东川区', '415', '3'), ('4479', '五华区', '415', '3'), ('4480', '呈贡县', '415', '3'), ('4481', '安宁市', '415', '3'), ('4482', '官渡区', '415', '3'), ('4483', '宜良县', '415', '3'), ('4484', '富民县', '415', '3'), ('4485', '寻甸回族彝族自治县', '415', '3'), ('4486', '嵩明县', '415', '3'), ('4487', '晋宁县', '415', '3'), ('4488', '盘龙区', '415', '3'), ('4489', '石林彝族自治县', '415', '3'), ('4490', '禄劝彝族苗族自治县', '415', '3'), ('4491', '西山区', '415', '3'), ('4492', '会泽县', '416', '3'), ('4493', '宣威市', '416', '3'), ('4494', '富源县', '416', '3'), ('4495', '师宗县', '416', '3'), ('4496', '沾益县', '416', '3'), ('4497', '罗平县', '416', '3'), ('4498', '陆良县', '416', '3'), ('4499', '马龙县', '416', '3'), ('4500', '麒麟区', '416', '3'), ('4501', '元江哈尼族彝族傣族自治县', '417', '3'), ('4502', '华宁县', '417', '3'), ('4503', '峨山彝族自治县', '417', '3'), ('4504', '新平彝族傣族自治县', '417', '3'), ('4505', '易门县', '417', '3'), ('4506', '江川县', '417', '3'), ('4507', '澄江县', '417', '3'), ('4508', '红塔区', '417', '3'), ('4509', '通海县', '417', '3'), ('4510', '施甸县', '418', '3'), ('4511', '昌宁县', '418', '3'), ('4512', '腾冲县', '418', '3'), ('4513', '隆阳区', '418', '3'), ('4514', '龙陵县', '418', '3'), ('4515', '大关县', '419', '3'), ('4516', '威信县', '419', '3'), ('4517', '巧家县', '419', '3'), ('4518', '彝良县', '419', '3'), ('4519', '昭阳区', '419', '3'), ('4520', '水富县', '419', '3'), ('4521', '永善县', '419', '3'), ('4522', '盐津县', '419', '3'), ('4523', '绥江县', '419', '3'), ('4524', '镇雄县', '419', '3'), ('4525', '鲁甸县', '419', '3'), ('4526', '华坪县', '420', '3'), ('4527', '古城区', '420', '3'), ('4528', '宁蒗彝族自治县', '420', '3'), ('4529', '永胜县', '420', '3'), ('4530', '玉龙纳西族自治县', '420', '3'), ('4531', '临翔区', '422', '3'), ('4532', '云县', '422', '3'), ('4533', '凤庆县', '422', '3'), ('4534', '双江拉祜族佤族布朗族傣族自治县', '422', '3'), ('4535', '永德县', '422', '3'), ('4536', '沧源佤族自治县', '422', '3'), ('4537', '耿马傣族佤族自治县', '422', '3'), ('4538', '镇康县', '422', '3'), ('4539', '元谋县', '423', '3'), ('4540', '南华县', '423', '3'), ('4541', '双柏县', '423', '3'), ('4542', '大姚县', '423', '3'), ('4543', '姚安县', '423', '3');
INSERT INTO `t_locations` VALUES ('4544', '楚雄市', '423', '3'), ('4545', '武定县', '423', '3'), ('4546', '永仁县', '423', '3'), ('4547', '牟定县', '423', '3'), ('4548', '禄丰县', '423', '3'), ('4549', '个旧市', '424', '3'), ('4550', '元阳县', '424', '3'), ('4551', '屏边苗族自治县', '424', '3'), ('4552', '建水县', '424', '3'), ('4553', '开远市', '424', '3'), ('4554', '弥勒县', '424', '3'), ('4555', '河口瑶族自治县', '424', '3'), ('4556', '泸西县', '424', '3'), ('4557', '石屏县', '424', '3'), ('4558', '红河县', '424', '3'), ('4559', '绿春县', '424', '3'), ('4560', '蒙自县', '424', '3'), ('4561', '金平苗族瑶族傣族自治县', '424', '3'), ('4562', '丘北县', '425', '3'), ('4563', '富宁县', '425', '3'), ('4564', '广南县', '425', '3'), ('4565', '文山县', '425', '3'), ('4566', '砚山县', '425', '3'), ('4567', '西畴县', '425', '3'), ('4568', '马关县', '425', '3'), ('4569', '麻栗坡县', '425', '3'), ('4570', '勐海县', '426', '3'), ('4571', '勐腊县', '426', '3'), ('4572', '景洪市', '426', '3'), ('4573', '云龙县', '427', '3'), ('4574', '剑川县', '427', '3'), ('4575', '南涧彝族自治县', '427', '3'), ('4576', '大理市', '427', '3'), ('4577', '宾川县', '427', '3'), ('4578', '巍山彝族回族自治县', '427', '3'), ('4579', '弥渡县', '427', '3'), ('4580', '永平县', '427', '3'), ('4581', '洱源县', '427', '3'), ('4582', '漾濞彝族自治县', '427', '3'), ('4583', '祥云县', '427', '3'), ('4584', '鹤庆县', '427', '3'), ('4585', '梁河县', '428', '3'), ('4586', '潞西市', '428', '3'), ('4587', '瑞丽市', '428', '3'), ('4588', '盈江县', '428', '3'), ('4589', '陇川县', '428', '3'), ('4590', '德钦县', '430', '3'), ('4591', '维西傈僳族自治县', '430', '3'), ('4592', '香格里拉县', '430', '3'), ('4593', '城关区', '431', '3'), ('4594', '堆龙德庆县', '431', '3'), ('4595', '墨竹工卡县', '431', '3'), ('4596', '尼木县', '431', '3'), ('4597', '当雄县', '431', '3'), ('4598', '曲水县', '431', '3'), ('4599', '林周县', '431', '3'), ('4600', '达孜县', '431', '3'), ('4601', '丁青县', '432', '3'), ('4602', '八宿县', '432', '3'), ('4603', '察雅县', '432', '3'), ('4604', '左贡县', '432', '3'), ('4605', '昌都县', '432', '3'), ('4606', '江达县', '432', '3'), ('4607', '洛隆县', '432', '3'), ('4608', '类乌齐县', '432', '3'), ('4609', '芒康县', '432', '3'), ('4610', '贡觉县', '432', '3'), ('4611', '边坝县', '432', '3'), ('4612', '乃东县', '433', '3'), ('4613', '加查县', '433', '3'), ('4614', '扎囊县', '433', '3'), ('4615', '措美县', '433', '3'), ('4616', '曲松县', '433', '3'), ('4617', '桑日县', '433', '3'), ('4618', '洛扎县', '433', '3'), ('4619', '浪卡子县', '433', '3'), ('4620', '琼结县', '433', '3'), ('4621', '贡嘎县', '433', '3'), ('4622', '错那县', '433', '3'), ('4623', '隆子县', '433', '3'), ('4624', '亚东县', '434', '3'), ('4625', '仁布县', '434', '3'), ('4626', '仲巴县', '434', '3'), ('4627', '南木林县', '434', '3'), ('4628', '吉隆县', '434', '3'), ('4629', '定日县', '434', '3'), ('4630', '定结县', '434', '3'), ('4631', '岗巴县', '434', '3'), ('4632', '康马县', '434', '3'), ('4633', '拉孜县', '434', '3'), ('4634', '日喀则市', '434', '3'), ('4635', '昂仁县', '434', '3'), ('4636', '江孜县', '434', '3'), ('4637', '白朗县', '434', '3'), ('4638', '聂拉木县', '434', '3'), ('4639', '萨嘎县', '434', '3'), ('4640', '萨迦县', '434', '3'), ('4641', '谢通门县', '434', '3'), ('4642', '嘉黎县', '435', '3'), ('4643', '安多县', '435', '3'), ('4644', '尼玛县', '435', '3'), ('4645', '巴青县', '435', '3'), ('4646', '比如县', '435', '3'), ('4647', '班戈县', '435', '3'), ('4648', '申扎县', '435', '3'), ('4649', '索县', '435', '3'), ('4650', '聂荣县', '435', '3'), ('4651', '那曲县', '435', '3'), ('4652', '噶尔县', '436', '3'), ('4653', '措勤县', '436', '3'), ('4654', '改则县', '436', '3'), ('4655', '日土县', '436', '3'), ('4656', '普兰县', '436', '3'), ('4657', '札达县', '436', '3'), ('4658', '革吉县', '436', '3'), ('4659', '墨脱县', '437', '3'), ('4660', '察隅县', '437', '3'), ('4661', '工布江达县', '437', '3'), ('4662', '朗县', '437', '3'), ('4663', '林芝县', '437', '3'), ('4664', '波密县', '437', '3'), ('4665', '米林县', '437', '3'), ('4666', '临潼区', '438', '3'), ('4667', '周至县', '438', '3'), ('4668', '户县', '438', '3'), ('4669', '新城区', '438', '3'), ('4670', '未央区', '438', '3'), ('4671', '灞桥区', '438', '3'), ('4672', '碑林区', '438', '3'), ('4673', '莲湖区', '438', '3'), ('4674', '蓝田县', '438', '3'), ('4675', '长安区', '438', '3'), ('4676', '阎良区', '438', '3'), ('4677', '雁塔区', '438', '3'), ('4678', '高陵县', '438', '3'), ('4679', '印台区', '439', '3'), ('4680', '宜君县', '439', '3'), ('4681', '王益区', '439', '3'), ('4682', '耀州区', '439', '3'), ('4683', '凤县', '440', '3'), ('4684', '凤翔县', '440', '3'), ('4685', '千阳县', '440', '3'), ('4686', '太白县', '440', '3'), ('4687', '岐山县', '440', '3'), ('4688', '扶风县', '440', '3'), ('4689', '渭滨区', '440', '3'), ('4690', '眉县', '440', '3'), ('4691', '金台区', '440', '3'), ('4692', '陇县', '440', '3'), ('4693', '陈仓区', '440', '3'), ('4694', '麟游县', '440', '3'), ('4695', '三原县', '441', '3'), ('4696', '干县', '441', '3'), ('4697', '兴平市', '441', '3'), ('4698', '彬县', '441', '3'), ('4699', '旬邑县', '441', '3'), ('4700', '杨陵区', '441', '3'), ('4701', '武功县', '441', '3'), ('4702', '永寿县', '441', '3'), ('4703', '泾阳县', '441', '3'), ('4704', '淳化县', '441', '3'), ('4705', '渭城区', '441', '3'), ('4706', '礼泉县', '441', '3'), ('4707', '秦都区', '441', '3'), ('4708', '长武县', '441', '3'), ('4709', '临渭区', '442', '3'), ('4710', '华县', '442', '3'), ('4711', '华阴市', '442', '3'), ('4712', '合阳县', '442', '3'), ('4713', '大荔县', '442', '3'), ('4714', '富平县', '442', '3'), ('4715', '潼关县', '442', '3'), ('4716', '澄城县', '442', '3'), ('4717', '白水县', '442', '3'), ('4718', '蒲城县', '442', '3'), ('4719', '韩城市', '442', '3'), ('4720', '吴起县', '443', '3'), ('4721', '子长县', '443', '3'), ('4722', '安塞县', '443', '3'), ('4723', '宜川县', '443', '3'), ('4724', '宝塔区', '443', '3'), ('4725', '富县', '443', '3'), ('4726', '延川县', '443', '3'), ('4727', '延长县', '443', '3'), ('4728', '志丹县', '443', '3'), ('4729', '洛川县', '443', '3'), ('4730', '甘泉县', '443', '3'), ('4731', '黄陵县', '443', '3'), ('4732', '黄龙县', '443', '3'), ('4733', '佛坪县', '444', '3'), ('4734', '勉县', '444', '3'), ('4735', '南郑县', '444', '3'), ('4736', '城固县', '444', '3'), ('4737', '宁强县', '444', '3'), ('4738', '汉台区', '444', '3'), ('4739', '洋县', '444', '3'), ('4740', '留坝县', '444', '3'), ('4741', '略阳县', '444', '3'), ('4742', '西乡县', '444', '3'), ('4743', '镇巴县', '444', '3'), ('4744', '佳县', '445', '3'), ('4745', '吴堡县', '445', '3'), ('4746', '子洲县', '445', '3'), ('4747', '定边县', '445', '3'), ('4748', '府谷县', '445', '3'), ('4749', '榆林市榆阳区', '445', '3'), ('4750', '横山县', '445', '3'), ('4751', '清涧县', '445', '3'), ('4752', '神木县', '445', '3'), ('4753', '米脂县', '445', '3'), ('4754', '绥德县', '445', '3'), ('4755', '靖边县', '445', '3'), ('4756', '宁陕县', '446', '3'), ('4757', '岚皋县', '446', '3'), ('4758', '平利县', '446', '3'), ('4759', '旬阳县', '446', '3'), ('4760', '汉滨区', '446', '3'), ('4761', '汉阴县', '446', '3'), ('4762', '白河县', '446', '3'), ('4763', '石泉县', '446', '3'), ('4764', '紫阳县', '446', '3'), ('4765', '镇坪县', '446', '3'), ('4766', '丹凤县', '447', '3'), ('4767', '商南县', '447', '3'), ('4768', '商州区', '447', '3'), ('4769', '山阳县', '447', '3'), ('4770', '柞水县', '447', '3'), ('4771', '洛南县', '447', '3'), ('4772', '镇安县', '447', '3'), ('4773', '七里河区', '448', '3'), ('4774', '城关区', '448', '3'), ('4775', '安宁区', '448', '3'), ('4776', '榆中县', '448', '3'), ('4777', '永登县', '448', '3'), ('4778', '皋兰县', '448', '3'), ('4779', '红古区', '448', '3'), ('4780', '西固区', '448', '3'), ('4781', '嘉峪关市', '449', '3'), ('4782', '永昌县', '450', '3'), ('4783', '金川区', '450', '3'), ('4784', '会宁县', '451', '3'), ('4785', '平川区', '451', '3'), ('4786', '景泰县', '451', '3'), ('4787', '白银区', '451', '3'), ('4788', '靖远县', '451', '3'), ('4789', '张家川回族自治县', '452', '3'), ('4790', '武山县', '452', '3'), ('4791', '清水县', '452', '3'), ('4792', '甘谷县', '452', '3'), ('4793', '秦安县', '452', '3'), ('4794', '秦州区', '452', '3'), ('4795', '麦积区', '452', '3'), ('4796', '凉州区', '453', '3'), ('4797', '古浪县', '453', '3'), ('4798', '天祝藏族自治县', '453', '3'), ('4799', '民勤县', '453', '3'), ('4800', '临泽县', '454', '3'), ('4801', '山丹县', '454', '3'), ('4802', '民乐县', '454', '3'), ('4803', '甘州区', '454', '3'), ('4804', '肃南裕固族自治县', '454', '3'), ('4805', '高台县', '454', '3'), ('4806', '华亭县', '455', '3'), ('4807', '崆峒区', '455', '3'), ('4808', '崇信县', '455', '3'), ('4809', '庄浪县', '455', '3'), ('4810', '泾川县', '455', '3'), ('4811', '灵台县', '455', '3'), ('4812', '静宁县', '455', '3'), ('4813', '敦煌市', '456', '3'), ('4814', '玉门市', '456', '3'), ('4815', '瓜州县（原安西县）', '456', '3'), ('4816', '肃北蒙古族自治县', '456', '3'), ('4817', '肃州区', '456', '3'), ('4818', '金塔县', '456', '3'), ('4819', '阿克塞哈萨克族自治县', '456', '3'), ('4820', '华池县', '457', '3'), ('4821', '合水县', '457', '3'), ('4822', '宁县', '457', '3'), ('4823', '庆城县', '457', '3'), ('4824', '正宁县', '457', '3'), ('4825', '环县', '457', '3'), ('4826', '西峰区', '457', '3'), ('4827', '镇原县', '457', '3'), ('4828', '临洮县', '458', '3'), ('4829', '安定区', '458', '3'), ('4830', '岷县', '458', '3'), ('4831', '渭源县', '458', '3'), ('4832', '漳县', '458', '3'), ('4833', '通渭县', '458', '3'), ('4834', '陇西县', '458', '3'), ('4835', '两当县', '459', '3'), ('4836', '宕昌县', '459', '3'), ('4837', '康县', '459', '3'), ('4838', '徽县', '459', '3'), ('4839', '成县', '459', '3'), ('4840', '文县', '459', '3'), ('4841', '武都区', '459', '3'), ('4842', '礼县', '459', '3'), ('4843', '西和县', '459', '3'), ('4844', '东乡族自治县', '460', '3'), ('4845', '临夏县', '460', '3'), ('4846', '临夏市', '460', '3'), ('4847', '和政县', '460', '3'), ('4848', '广河县', '460', '3'), ('4849', '康乐县', '460', '3'), ('4850', '永靖县', '460', '3'), ('4851', '积石山保安族东乡族撒拉族自治县', '460', '3'), ('4852', '临潭县', '461', '3'), ('4853', '卓尼县', '461', '3'), ('4854', '合作市', '461', '3'), ('4855', '夏河县', '461', '3'), ('4856', '玛曲县', '461', '3'), ('4857', '碌曲县', '461', '3'), ('4858', '舟曲县', '461', '3'), ('4859', '迭部县', '461', '3'), ('4860', '城东区', '462', '3'), ('4861', '城中区', '462', '3'), ('4862', '城北区', '462', '3'), ('4863', '城西区', '462', '3'), ('4864', '大通回族土族自治县', '462', '3'), ('4865', '湟中县', '462', '3'), ('4866', '湟源县', '462', '3'), ('4867', '乐都县', '463', '3'), ('4868', '互助土族自治县', '463', '3'), ('4869', '化隆回族自治县', '463', '3'), ('4870', '平安县', '463', '3'), ('4871', '循化撒拉族自治县', '463', '3'), ('4872', '民和回族土族自治县', '463', '3'), ('4873', '刚察县', '464', '3'), ('4874', '海晏县', '464', '3'), ('4875', '祁连县', '464', '3'), ('4876', '门源回族自治县', '464', '3'), ('4877', '同仁县', '465', '3'), ('4878', '尖扎县', '465', '3'), ('4879', '河南蒙古族自治县', '465', '3'), ('4880', '泽库县', '465', '3'), ('4881', '共和县', '466', '3'), ('4882', '兴海县', '466', '3'), ('4883', '同德县', '466', '3'), ('4884', '贵南县', '466', '3'), ('4885', '贵德县', '466', '3'), ('4886', '久治县', '467', '3'), ('4887', '玛多县', '467', '3'), ('4888', '玛沁县', '467', '3'), ('4889', '班玛县', '467', '3'), ('4890', '甘德县', '467', '3'), ('4891', '达日县', '467', '3'), ('4892', '囊谦县', '468', '3'), ('4893', '曲麻莱县', '468', '3'), ('4894', '杂多县', '468', '3'), ('4895', '治多县', '468', '3'), ('4896', '玉树县', '468', '3'), ('4897', '称多县', '468', '3'), ('4898', '乌兰县', '469', '3'), ('4899', '冷湖行委', '469', '3'), ('4900', '大柴旦行委', '469', '3'), ('4901', '天峻县', '469', '3'), ('4902', '德令哈市', '469', '3'), ('4903', '格尔木市', '469', '3'), ('4904', '茫崖行委', '469', '3'), ('4905', '都兰县', '469', '3'), ('4906', '兴庆区', '470', '3'), ('4907', '永宁县', '470', '3'), ('4908', '灵武市', '470', '3'), ('4909', '西夏区', '470', '3'), ('4910', '贺兰县', '470', '3'), ('4911', '金凤区', '470', '3'), ('4912', '大武口区', '471', '3'), ('4913', '平罗县', '471', '3'), ('4914', '惠农区', '471', '3'), ('4915', '利通区', '472', '3'), ('4916', '同心县', '472', '3'), ('4917', '盐池县', '472', '3'), ('4918', '青铜峡市', '472', '3'), ('4919', '原州区', '473', '3'), ('4920', '彭阳县', '473', '3'), ('4921', '泾源县', '473', '3'), ('4922', '西吉县', '473', '3'), ('4923', '隆德县', '473', '3'), ('4924', '中宁县', '474', '3'), ('4925', '沙坡头区', '474', '3'), ('4926', '海原县', '474', '3'), ('4927', '东山区', '475', '3'), ('4928', '乌鲁木齐县', '475', '3'), ('4929', '天山区', '475', '3'), ('4930', '头屯河区', '475', '3'), ('4931', '新市区', '475', '3'), ('4932', '水磨沟区', '475', '3'), ('4933', '沙依巴克区', '475', '3'), ('4934', '达坂城区', '475', '3'), ('4935', '乌尔禾区', '476', '3'), ('4936', '克拉玛依区', '476', '3'), ('4937', '独山子区', '476', '3'), ('4938', '白碱滩区', '476', '3'), ('4939', '吐鲁番市', '477', '3'), ('4940', '托克逊县', '477', '3'), ('4941', '鄯善县', '477', '3'), ('4942', '伊吾县', '478', '3'), ('4943', '哈密市', '478', '3'), ('4944', '巴里坤哈萨克自治县', '478', '3'), ('4945', '吉木萨尔县', '479', '3'), ('4946', '呼图壁县', '479', '3'), ('4947', '奇台县', '479', '3'), ('4948', '昌吉市', '479', '3'), ('4949', '木垒哈萨克自治县', '479', '3'), ('4950', '玛纳斯县', '479', '3'), ('4951', '米泉市', '479', '3'), ('4952', '阜康市', '479', '3'), ('4953', '博乐市', '480', '3'), ('4954', '温泉县', '480', '3'), ('4955', '精河县', '480', '3'), ('4956', '博湖县', '481', '3'), ('4957', '和硕县', '481', '3'), ('4958', '和静县', '481', '3'), ('4959', '尉犁县', '481', '3'), ('4960', '库尔勒市', '481', '3'), ('4961', '焉耆回族自治县', '481', '3'), ('4962', '若羌县', '481', '3'), ('4963', '轮台县', '481', '3'), ('4964', '乌什县', '482', '3'), ('4965', '库车县', '482', '3'), ('4966', '拜城县', '482', '3'), ('4967', '新和县', '482', '3'), ('4968', '柯坪县', '482', '3'), ('4969', '沙雅县', '482', '3'), ('4970', '温宿县', '482', '3'), ('4971', '阿克苏市', '482', '3'), ('4972', '阿瓦提县', '482', '3'), ('4973', '乌恰县', '483', '3'), ('4974', '阿克陶县', '483', '3'), ('4975', '阿合奇县', '483', '3'), ('4976', '阿图什市', '483', '3'), ('4977', '伽师县', '484', '3'), ('4978', '叶城县', '484', '3'), ('4979', '喀什市', '484', '3'), ('4980', '塔什库尔干塔吉克自治县', '484', '3'), ('4981', '岳普湖县', '484', '3'), ('4982', '巴楚县', '484', '3'), ('4983', '泽普县', '484', '3'), ('4984', '疏勒县', '484', '3'), ('4985', '疏附县', '484', '3'), ('4986', '英吉沙县', '484', '3'), ('4987', '莎车县', '484', '3'), ('4988', '麦盖提县', '484', '3'), ('4989', '于田县', '485', '3'), ('4990', '和田县', '485', '3'), ('4991', '和田市', '485', '3'), ('4992', '墨玉县', '485', '3'), ('4993', '民丰县', '485', '3'), ('4994', '洛浦县', '485', '3'), ('4995', '皮山县', '485', '3'), ('4996', '策勒县', '485', '3'), ('4997', '伊宁县', '486', '3'), ('4998', '伊宁市', '486', '3'), ('4999', '奎屯市', '486', '3'), ('5000', '察布查尔锡伯自治县', '486', '3'), ('5001', '尼勒克县', '486', '3'), ('5002', '巩留县', '486', '3'), ('5003', '新源县', '486', '3'), ('5004', '昭苏县', '486', '3'), ('5005', '特克斯县', '486', '3'), ('5006', '霍城县', '486', '3'), ('5007', '乌苏市', '487', '3'), ('5008', '和布克赛尔蒙古自治县', '487', '3'), ('5009', '塔城市', '487', '3'), ('5010', '托里县', '487', '3'), ('5011', '沙湾县', '487', '3'), ('5012', '裕民县', '487', '3'), ('5013', '额敏县', '487', '3'), ('5014', '吉木乃县', '488', '3'), ('5015', '哈巴河县', '488', '3'), ('5016', '富蕴县', '488', '3'), ('5017', '布尔津县', '488', '3'), ('5018', '福海县', '488', '3'), ('5019', '阿勒泰市', '488', '3'), ('5020', '青河县', '488', '3'), ('5021', '石河子市', '489', '3'), ('5022', '阿拉尔市', '490', '3'), ('5023', '图木舒克市', '491', '3'), ('5024', '五家渠市', '492', '3');
COMMIT;

-- ----------------------------
--  Table structure for `t_menu`
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
--  Table structure for `t_message`
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='留言表（表单，培训支持，广告设计，活动申请）';

-- ----------------------------
--  Records of `t_message`
-- ----------------------------
BEGIN;
INSERT INTO `t_message` VALUES ('19', '112', '101', '3', '继续广告设计。请派人前来', '13888888888', '就看见', '1495787749', '0', '0', null, '空军航空');
COMMIT;

-- ----------------------------
--  Table structure for `t_migration`
-- ----------------------------
DROP TABLE IF EXISTS `t_migration`;
CREATE TABLE `t_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_migration`
-- ----------------------------
BEGIN;
INSERT INTO `t_migration` VALUES ('m000000_000000_base', '1491359951'), ('m140602_111327_create_menu_table', '1495173908'), ('m160312_050000_create_user', '1495173908');
COMMIT;

-- ----------------------------
--  Table structure for `t_order`
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
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COMMENT='平台订单表';

-- ----------------------------
--  Table structure for `t_order_goods`
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
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COMMENT='订单附属表（订单内购买的商品）';

-- ----------------------------
--  Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(15) NOT NULL COMMENT '角色名',
  `intro` varchar(100) DEFAULT NULL COMMENT '角色简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_role`
-- ----------------------------
BEGIN;
INSERT INTO `t_role` VALUES ('1', 'boss', ''), ('3', 'ghr', null), ('4', '董事长', '');
COMMIT;

-- ----------------------------
--  Table structure for `t_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限id',
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_role_permission`
-- ----------------------------
BEGIN;
INSERT INTO `t_role_permission` VALUES ('1', '1'), ('1', '2'), ('1', '3');
COMMIT;

-- ----------------------------
--  Table structure for `t_salesman`
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
--  Records of `t_salesman`
-- ----------------------------
BEGIN;
INSERT INTO `t_salesman` VALUES ('32', '开发测试业务员', '15914725836', '0', '1495710145');
COMMIT;

-- ----------------------------
--  Table structure for `t_shoper`
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
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='商家信息表';

-- ----------------------------
--  Records of `t_shoper`
-- ----------------------------
BEGIN;
INSERT INTO `t_shoper` VALUES ('111', '开发测试店铺', '15888888888', '1000.00', '10000000000000', '1', '中国银行', '测试', '612346859124687684545', '1000.00', '0', '32', '1495710268', '0.00', '0', '（wx）15982707139（zfb）15982707139', '0.00', '0.00', '0.00'), ('112', '郑小均', '18200124561', '10000.00', '001', '1', '茶码头银行', '郑小均', '9999', '10000.00', '0', '32', '1495736157', '0.00', '0', '9999', '0.00', '0.00', '0.00'), ('113', '余信锴', '13438505154', '99999999.99', '001', '1', '001', '001', '001', '99999999.99', '0', '32', '1495779336', '0.00', '0', '001', '0.00', '0.00', '0.00');
COMMIT;

-- ----------------------------
--  Table structure for `t_shoper_img`
-- ----------------------------
DROP TABLE IF EXISTS `t_shoper_img`;
CREATE TABLE `t_shoper_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) NOT NULL COMMENT '关联商铺id',
  `store_id` int(11) NOT NULL COMMENT '关联门店id',
  `path` varchar(255) NOT NULL COMMENT '保存路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='商铺图片';

-- ----------------------------
--  Records of `t_shoper_img`
-- ----------------------------
BEGIN;
INSERT INTO `t_shoper_img` VALUES ('48', '111', '100', '/uploads/20170525/1904041928190428ChMkJlf8lkWICp-SABCGW2CZsd4AAWzfQIAxTUAEIZz293.jpg'), ('49', '111', '100', '/uploads/20170525/1904041928190428jingxuan022.jpg'), ('50', '112', '101', '/uploads/20170526/021515025702155720160319_141139.jpg'), ('51', '113', '102', '/uploads/20170526/141515143614153673f06f0fjw1et6usevl1xj20ku0dwq61.jpg'), ('52', '113', '102', '/uploads/20170526/1415151436141536530cfc01jw1etvbbg5hhej20ku0fmacz.jpg'), ('53', '113', '102', '/uploads/20170526/14151514361415369367b9899b3f74599421d345f3a0df07f164332f1605a2-t51Zel.jpg'), ('54', '113', '102', '/uploads/20170526/1415151436141536731019ddjw1eq4xph31fuj20zk0noq9p.jpg'), ('55', '113', '102', '/uploads/20170526/1415151436141536e6c8a03ba39899d3433edda14b0603ef.jpg');
COMMIT;

-- ----------------------------
--  Table structure for `t_shoper_tea_beans_log`
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='商铺的茶豆币记录，num不能为负值';

-- ----------------------------
--  Table structure for `t_sp_ output`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_ output`;
CREATE TABLE `t_sp_ output` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='进销存出库表';

-- ----------------------------
--  Table structure for `t_sp_action_log`
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
) ENGINE=InnoDB AUTO_INCREMENT=15750 DEFAULT CHARSET=utf8 COMMENT='茶坊后台人员行为日志表';

-- ----------------------------
--  Table structure for `t_sp_address`
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='茶坊收货地址表';

-- ----------------------------
--  Table structure for `t_sp_auth_assignment`
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
--  Records of `t_sp_auth_assignment`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_auth_assignment` VALUES ('超级管理员__111', '73', '1495710287'), ('超级管理员__112', '74', '1495736204'), ('超级管理员__112', '75', '1495767897'), ('超级管理员__112', '76', '1495768118');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_auth_item`
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
--  Records of `t_sp_auth_item`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_auth_item` VALUES ('01__111', '1', null, null, null, '1495783305', '1495783305'), ('b2b', '2', 'b2b商场权限', null, 0x733a333a22623262223b, '1494579396', '1494579396'), ('business/add-goods', '2', '增加消费', null, 0x733a383a22627573696e657373223b, '1494579396', '1494579396'), ('business/begin-table-order', '2', '开台', null, 0x733a383a22627573696e657373223b, '1494579396', '1494579396'), ('business/book', '2', '预定权限', null, 0x733a383a22627573696e657373223b, '1494579396', '1494579396'), ('business/desktopstatus', '2', '营业桌台显示', null, 0x733a383a22627573696e657373223b, '1494579396', '1494579396'), ('business/goods-close', '2', '商品取消', null, 0x733a383a22627573696e657373223b, '1494579396', '1494579396'), ('business/goods-giv', '2', '商品转配', null, 0x733a383a22627573696e657373223b, '1494579396', '1494579396'), ('business/merge', '2', '合并账单', null, 0x733a383a22627573696e657373223b, '1494579396', '1494579396'), ('business/order', '2', '订单权限', null, 0x733a383a22627573696e657373223b, '1494579396', '1494579396'), ('business/orderInfo', '2', '查看详情', null, 0x733a383a22627573696e657373223b, '1494579396', '1494579396'), ('business/table', '2', '台桌管理', null, 0x733a383a22627573696e657373223b, '1494579396', '1494579396'), ('business/table-goods-turn', '2', '商品转台', null, 0x733a383a22627573696e657373223b, '1494579396', '1494579396'), ('business/table-type', '2', '台桌类型管理', null, 0x733a383a22627573696e657373223b, '1494579396', '1494579396'), ('business/table/table-turn', '2', '更换台座', null, 0x733a383a22627573696e657373223b, '1494579396', '1494579396'), ('discount/config', '2', '优惠添加操作', null, 0x733a373a2273657474696e67223b, '1494579396', '1494579396'), ('dosing/config', '2', '商品原料权限', null, 0x733a373a2273657474696e67223b, '1494579396', '1494579396'), ('erp/excel', '2', '导出Excel', null, 0x733a393a227265706572746f7279223b, '1494579396', '1494579396'), ('erp/goods-list', '2', '库存商品列表', null, 0x733a393a227265706572746f7279223b, '1494579396', '1494579396'), ('erp/pan-dian', '2', '库存盘点记录', null, 0x733a393a227265706572746f7279223b, '1494579396', '1494579396'), ('erp/pop', '2', '库存出库', null, 0x733a393a227265706572746f7279223b, '1494579396', '1494579396'), ('erp/pop-log', '2', '库存出库记录', null, 0x733a393a227265706572746f7279223b, '1494579396', '1494579396'), ('erp/push', '2', '库存入库', null, 0x733a393a227265706572746f7279223b, '1494579396', '1494579396'), ('erp/push-log', '2', '库存入记录', null, 0x733a393a227265706572746f7279223b, '1494579396', '1494579396'), ('goods/config', '2', '商品管理权限', null, 0x733a373a2273657474696e67223b, '1494579396', '1494579396'), ('information', '2', '消息', null, 0x733a363a22636f6d6d6f6e223b, '1494579396', '1494579396'), ('jiaoban', '2', '交班', null, 0x733a363a22636f6d6d6f6e223b, '1494579396', '1494579396'), ('jiaoban/index', '2', '交班预留金额设置', null, 0x733a373a2273657474696e67223b, '1494579396', '1494579396'), ('jiaoban/list', '2', '交班记录', null, 0x733a363a22636f6d6d6f6e223b, '1494579396', '1494579396'), ('message', '2', '留言', null, 0x733a373a226d657373616765223b, '1494579396', '1494579396'), ('order/btxf', '2', '吧台消费', null, 0x733a383a22627573696e657373223b, '1494579396', '1494579396'), ('qrcode/store', '2', '生成二维码', null, 0x733a373a2273657474696e67223b, '1494579396', '1494579396'), ('role/index', '2', '权限管理', null, 0x733a373a2273657474696e67223b, '1494579396', '1494579396'), ('spending/list', '2', '消费单', null, 0x733a373a22636f6e73756d65223b, '1494579396', '1494579396'), ('statement/actual-data', '2', '报表系统', null, 0x733a393a2273746174656d656e74223b, '1494579396', '1494579396'), ('unit/config', '2', '商品单位权限', null, 0x733a373a2273657474696e67223b, '1494579396', '1494579396'), ('users/config', '2', '员工操作', null, 0x733a373a2273657474696e67223b, '1494579396', '1494579396'), ('vip/consume', '2', '会员消费记录', null, 0x733a363a226d656d626572223b, '1494579396', '1494579396'), ('vip/create', '2', '会员添加', null, 0x733a363a226d656d626572223b, '1494579396', '1494579396'), ('vip/delete', '2', '会员添加', null, 0x733a363a226d656d626572223b, '1494813567', '1494813567'), ('vip/list-vip', '2', '查看会员', null, 0x733a363a226d656d626572223b, '1494579396', '1494579396'), ('vip/pay', '2', '会员充值', null, 0x733a363a226d656d626572223b, '1494579396', '1494579396'), ('vip/pay-list', '2', '会员充值记录', null, 0x733a363a226d656d626572223b, '1494579396', '1494579396'), ('withdraw', '2', '提现管理', null, 0x733a383a227769746864726177223b, '1494579396', '1494579396'), ('经理__112', '1', null, null, null, '1495786002', '1495786002'), ('超级管理员__111', '1', null, null, null, '1495710287', '1495710287'), ('超级管理员__112', '1', null, null, null, '1495736204', '1495736204');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_auth_item_child`
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
--  Records of `t_sp_auth_item_child`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_auth_item_child` VALUES ('超级管理员__111', 'b2b'), ('超级管理员__112', 'b2b'), ('经理__112', 'business/add-goods'), ('超级管理员__111', 'business/add-goods'), ('超级管理员__112', 'business/add-goods'), ('经理__112', 'business/begin-table-order'), ('超级管理员__111', 'business/begin-table-order'), ('超级管理员__112', 'business/begin-table-order'), ('经理__112', 'business/book'), ('超级管理员__111', 'business/book'), ('超级管理员__112', 'business/book'), ('经理__112', 'business/desktopstatus'), ('超级管理员__111', 'business/desktopstatus'), ('超级管理员__112', 'business/desktopstatus'), ('经理__112', 'business/goods-close'), ('超级管理员__111', 'business/goods-close'), ('超级管理员__112', 'business/goods-close'), ('经理__112', 'business/goods-giv'), ('超级管理员__111', 'business/goods-giv'), ('超级管理员__112', 'business/goods-giv'), ('经理__112', 'business/merge'), ('超级管理员__111', 'business/merge'), ('超级管理员__112', 'business/merge'), ('经理__112', 'business/order'), ('超级管理员__111', 'business/order'), ('超级管理员__112', 'business/order'), ('经理__112', 'business/orderInfo'), ('超级管理员__111', 'business/orderInfo'), ('超级管理员__112', 'business/orderInfo'), ('经理__112', 'business/table'), ('超级管理员__111', 'business/table'), ('超级管理员__112', 'business/table'), ('经理__112', 'business/table-goods-turn'), ('超级管理员__111', 'business/table-goods-turn'), ('超级管理员__112', 'business/table-goods-turn'), ('经理__112', 'business/table-type'), ('超级管理员__111', 'business/table-type'), ('超级管理员__112', 'business/table-type'), ('经理__112', 'business/table/table-turn'), ('超级管理员__111', 'business/table/table-turn'), ('超级管理员__112', 'business/table/table-turn'), ('超级管理员__111', 'discount/config'), ('超级管理员__112', 'discount/config'), ('超级管理员__111', 'dosing/config'), ('超级管理员__112', 'dosing/config'), ('超级管理员__111', 'erp/excel'), ('超级管理员__112', 'erp/excel'), ('01__111', 'erp/goods-list'), ('超级管理员__111', 'erp/goods-list'), ('超级管理员__112', 'erp/goods-list'), ('01__111', 'erp/pan-dian'), ('超级管理员__111', 'erp/pan-dian'), ('超级管理员__112', 'erp/pan-dian'), ('01__111', 'erp/pop'), ('超级管理员__111', 'erp/pop'), ('超级管理员__112', 'erp/pop'), ('01__111', 'erp/pop-log'), ('超级管理员__111', 'erp/pop-log'), ('超级管理员__112', 'erp/pop-log'), ('01__111', 'erp/push'), ('超级管理员__111', 'erp/push'), ('超级管理员__112', 'erp/push'), ('01__111', 'erp/push-log'), ('超级管理员__111', 'erp/push-log'), ('超级管理员__112', 'erp/push-log'), ('超级管理员__111', 'goods/config'), ('超级管理员__112', 'goods/config'), ('超级管理员__111', 'information'), ('超级管理员__112', 'information'), ('经理__112', 'jiaoban'), ('超级管理员__111', 'jiaoban'), ('超级管理员__112', 'jiaoban'), ('超级管理员__111', 'jiaoban/index'), ('超级管理员__112', 'jiaoban/index'), ('经理__112', 'jiaoban/list'), ('超级管理员__111', 'jiaoban/list'), ('超级管理员__112', 'jiaoban/list'), ('超级管理员__111', 'message'), ('超级管理员__112', 'message'), ('经理__112', 'order/btxf'), ('超级管理员__111', 'order/btxf'), ('超级管理员__112', 'order/btxf'), ('超级管理员__111', 'qrcode/store'), ('超级管理员__112', 'qrcode/store'), ('超级管理员__111', 'role/index'), ('超级管理员__112', 'role/index'), ('超级管理员__111', 'spending/list'), ('超级管理员__112', 'spending/list'), ('超级管理员__111', 'statement/actual-data'), ('超级管理员__112', 'statement/actual-data'), ('超级管理员__111', 'unit/config'), ('超级管理员__112', 'unit/config'), ('超级管理员__111', 'users/config'), ('超级管理员__112', 'users/config'), ('超级管理员__111', 'vip/consume'), ('超级管理员__112', 'vip/consume'), ('超级管理员__111', 'vip/create'), ('超级管理员__112', 'vip/create'), ('超级管理员__111', 'vip/delete'), ('超级管理员__112', 'vip/delete'), ('超级管理员__111', 'vip/list-vip'), ('超级管理员__112', 'vip/list-vip'), ('超级管理员__111', 'vip/pay'), ('超级管理员__112', 'vip/pay'), ('超级管理员__111', 'vip/pay-list'), ('超级管理员__112', 'vip/pay-list'), ('超级管理员__111', 'withdraw'), ('超级管理员__112', 'withdraw');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_auth_rule`
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
--  Table structure for `t_sp_beans_pay`
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
--  Table structure for `t_sp_book`
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='预订表';

-- ----------------------------
--  Records of `t_sp_book`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_book` VALUES ('48', '112', null, null, '207', null, '1495772394', null, '2', '1495772340', '郑秀晶', '15888888888', '3位客人', '1495772940', '101'), ('49', '112', null, null, '215', null, '1495773105', null, '2', '1495773060', '111', '18200124561', '', '1495773660', '101'), ('50', '112', null, null, '209', null, '1495779440', null, '1', '1495792800', '4', '13888888888', '准备好长牌！ 另外联系个打麻将的！', '1495793400', '101'), ('51', '112', null, null, '210', null, '1495779860', null, '1', '1495779900', '王总', '13777777777', '', '1495780500', '101'), ('52', '112', null, null, '211', null, '1495781813', null, '2', '1495781760', '4', '13888888888', '准备好长牌！ 另外联系个打麻将的！', '1495782360', '101'), ('53', '112', null, null, '212', null, '1495786469', null, '1', '1495786380', '毛泽东', '13888888888', '把我的开国元帅叫上', '1495786980', '101'), ('54', '112', null, null, '213', null, '1495786768', null, '1', '1495786740', '周恩来', '13888888888', '我要打牌', '1495787340', '101'), ('55', '112', null, null, '213', null, '1495786869', null, '1', '1495786860', '4', '13888888888', '准备好长牌！ 另外联系个打麻将的！', '1495787460', '101'), ('56', '112', null, null, '213', null, '1495786932', null, '1', '1495786860', '4', '13888888888', '准备好长牌！ 另外联系个打麻将的！', '1495787460', '101'), ('57', '112', null, null, '221', null, '1495787010', null, '2', '1495786980', '毛泽东', '13888888888', '喝茶', '1495787580', '101'), ('58', '112', null, null, '211', null, '1495787017', null, '2', '1495786980', '1', '18211111111', '', '1495787580', '101'), ('59', '112', null, null, '219', null, '1495787166', null, '2', '1495787100', '长', '18200124561', '', '1495787700', '101'), ('60', '112', null, null, '211', null, '1495788373', null, '2', '1495788360', '毛泽东', '13888888888', '', '1495788960', '101');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_cart`
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
--  Table structure for `t_sp_config`
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
--  Records of `t_sp_config`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_config` VALUES ('1', 'wx_play_img', '/updata/2140384i477qrjrtdjiru4.jpg', '1'), ('2', 'zfb_play_img', '/updata/2140384i477qrjrtdjiru4.jpg', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_credit_consume`
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='授信消费表';

-- ----------------------------
--  Table structure for `t_sp_credit_refund`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_credit_refund`;
CREATE TABLE `t_sp_credit_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '还款金额',
  `add_time` int(11) DEFAULT NULL COMMENT '还款时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商家授信还款记录表';

-- ----------------------------
--  Table structure for `t_sp_discount`
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='店铺优惠表';

-- ----------------------------
--  Table structure for `t_sp_dosing`
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='茶坊原料表';

-- ----------------------------
--  Records of `t_sp_dosing`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_dosing` VALUES ('19', '测试原料', '111', '100', '1', '测试单位', '1495710618', '94', '1'), ('20', '原料2', '111', '100', '11', '测试单位', '1495764305', '200', '100'), ('21', '菊花', '112', '101', '01', '克', '1495769799', '500', '50'), ('22', '冰糖', '112', '101', '02', '克', '1495769813', '500', '50'), ('23', '枸杞', '112', '101', '03', '克', '1495769828', '500', '50');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_goods`
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='茶坊商品表';

-- ----------------------------
--  Records of `t_sp_goods`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_goods` VALUES ('44', '111', '100', '27', '测试参与库存管理的商品', '98', '0', '1', '12.00', '10.00', null, '01', '1', '1495710654', '测试单位', '0'), ('45', '111', '100', '27', '测试不参与库存管理的商品', '0', '0', '10', '12.00', '10.00', null, '10', '1', '1495710680', '测试单位', '0'), ('46', '111', '100', '27', '测试允许转配的商品', '0', '0', '10', '12.00', '10.00', null, '10', '1', '1495710708', '测试单位', '0'), ('47', '111', '100', '27', '测试绑定原料的商品', '0', '0', '12', '12.00', '10.00', null, '10', '1', '1495710734', '测试单位', '0'), ('48', '111', '100', '28', '测试分类二商品一', '0', '0', '5', '321.00', '241.00', null, '三德科技发垃圾点开放啦删掉了反馈就是打两份拉萨的弗利萨大姐夫', '1', '1495714466', '测试单位', '0'), ('49', '111', '100', '28', '测试分类二商品2', '0', '0', '546', '546.00', '534.00', null, '士大夫撒旦阿萨德收到收到', '1', '1495714511', '测试单位', '0'), ('50', '111', '100', '27', '赠送测试', '0', '0', '10', '12.00', '10.00', null, '01', '1', '1495763819', '测试单位', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_goods_cate`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_goods_cate`;
CREATE TABLE `t_sp_goods_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) unsigned DEFAULT NULL COMMENT '门店ＩＤ',
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类id',
  `cate_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='茶坊商品分类表';

-- ----------------------------
--  Records of `t_sp_goods_cate`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_goods_cate` VALUES ('27', '100', '111', '0', '测试分类'), ('28', '100', '111', '0', '测试第二个分类'), ('29', '101', '112', '0', '玉溪香烟'), ('30', '101', '112', '0', '恵记瓜子500K'), ('31', '101', '112', '0', '打火机'), ('32', '101', '112', '0', '好吃嘴'), ('33', '101', '112', '0', '冷吃兔'), ('34', '101', '112', '0', '冰糖菊花茶'), ('35', '101', '112', '0', '竹叶青'), ('36', '101', '112', '0', '生态绿毛峰'), ('37', '101', '112', '0', '高级花毛峰'), ('38', '101', '112', '0', '特观音'), ('39', '101', '112', '0', '碧潭飘雪'), ('40', '101', '112', '0', '大红袍');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_goods_to_dosing`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_goods_to_dosing`;
CREATE TABLE `t_sp_goods_to_dosing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `dosing_id` int(11) DEFAULT NULL COMMENT '原料ID',
  `number` int(10) unsigned DEFAULT '1' COMMENT '绑定数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='商品与商品原料绑定表';

-- ----------------------------
--  Records of `t_sp_goods_to_dosing`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_goods_to_dosing` VALUES ('91', '47', '19', '4'), ('93', '44', '19', '1'), ('94', '50', '19', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_information`
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
) ENGINE=InnoDB AUTO_INCREMENT=551 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_sp_information`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_information` VALUES ('538', '112', '101', '02系统将于2017-05-26 12:29:00自动取消该预定！', '0', '3', '1495772659'), ('539', '112', '101', '02系统自动取消该预定！', '0', '3', '1495772960'), ('540', '112', '101', '阴阳两界系统将于2017-05-26 12:41:00自动取消该预定！', '0', '3', '1495773385'), ('541', '112', '101', '阴阳两界系统自动取消该预定！', '0', '3', '1495773661'), ('542', '112', '101', '06系统将于2017-05-26 14:35:00自动取消该预定！', '0', '3', '1495780217'), ('543', '112', '101', '07系统将于2017-05-26 15:06:00自动取消该预定！', '0', '3', '1495782061'), ('544', '112', '101', '07系统自动取消该预定！', '0', '3', '1495782361'), ('545', '112', '101', '07系统将于2017-05-26 16:33:00自动取消该预定！', '0', '3', '1495787281'), ('546', '112', '101', '1系统将于2017-05-26 16:35:00自动取消该预定！', '0', '3', '1495787406'), ('547', '112', '101', '07系统自动取消该预定！', '0', '3', '1495787581'), ('548', '112', '101', '1系统自动取消该预定！', '0', '3', '1495787706'), ('549', '112', '101', '07系统将于2017-05-26 16:56:00自动取消该预定！', '0', '3', '1495788678'), ('550', '112', '101', '07系统自动取消该预定！', '0', '3', '1495788980');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_jiaoban`
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
--  Records of `t_sp_jiaoban`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_jiaoban` VALUES ('16', '112', '101', '1495746000', '1495784760', '1495784247', '75', '76', null, null, '0.00', '1000.00', '1000.00', null, null, null, '');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_jiaoban_conf`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_jiaoban_conf`;
CREATE TABLE `t_sp_jiaoban_conf` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT '0' COMMENT '商家ID',
  `store_id` int(11) DEFAULT '0' COMMENT '门店ID',
  `value` decimal(10,0) DEFAULT '0' COMMENT '交班余额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_sp_jiaoban_conf`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_jiaoban_conf` VALUES ('3', '112', '101', '1000');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_order`;
CREATE TABLE `t_sp_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT '0' COMMENT '商家id',
  `wx_user_id` int(11) DEFAULT '0' COMMENT '微信用户id，从微信端下单/预订的',
  `vip_user_id` int(11) DEFAULT '0' COMMENT '会员用户id，从店铺线下下单/预订的',
  `table_id` int(11) DEFAULT '0' COMMENT '台桌id',
  `table_name` varchar(255) DEFAULT '' COMMENT '商家名称',
  `status` tinyint(3) DEFAULT NULL COMMENT '订单状态，1-消费中，2-已完成',
  `table_amount` decimal(10,2) DEFAULT '0.00' COMMENT '包间费',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总价',
  `cash_amout` decimal(10,2) DEFAULT '0.00' COMMENT '现金支付金额',
  `beans_amount` decimal(10,2) DEFAULT '0.00' COMMENT '茶豆币支付数量',
  `start_time` int(11) DEFAULT '0' COMMENT '消费开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '消费结束时间',
  `discount` decimal(10,2) DEFAULT '0.00' COMMENT '会员折扣',
  `coupon_amount` decimal(10,2) DEFAULT '0.00' COMMENT '手动优惠',
  `merge_order_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '合并订单id 主表的ID',
  `person` tinyint(3) unsigned DEFAULT '0' COMMENT '客户人数',
  `notes` varchar(120) DEFAULT '0' COMMENT '备注',
  `staff_id` int(11) DEFAULT '0' COMMENT '员工ID',
  `store_id` int(10) unsigned DEFAULT '0' COMMENT '门店id',
  `wx_pay` decimal(10,2) DEFAULT '0.00' COMMENT '微信支付多少',
  `ali_pay` decimal(10,2) DEFAULT '0.00' COMMENT '支付宝支付多少',
  `card_pay` decimal(10,2) DEFAULT '0.00' COMMENT '刷卡支付多少',
  `is_exempt` tinyint(4) DEFAULT '0' COMMENT '1免单0不免单',
  `user_id` int(11) DEFAULT '0' COMMENT '结账员工',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=524 DEFAULT CHARSET=utf8 COMMENT='茶坊订单主表';

-- ----------------------------
--  Records of `t_sp_order`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_order` VALUES ('502', '111', '0', '0', '203', '测试分类--测试台座', '2', '750.00', '774.00', '0.00', '0.00', '1495710802', '1495761998', '0.00', '0.00', '0', '4', '4', '73', '100', '0.00', '0.00', '0.00', '1', '73'), ('503', '111', '0', '0', '204', '测试分类--02', '2', '700.00', '712.00', '0.00', '0.00', '1495712460', '1495762264', '0.00', '0.00', '505', '4', '', '73', '100', '0.00', '0.00', '0.00', '0', '0'), ('504', '111', '0', '0', '205', '测试分类--87', '2', '800.00', '800.00', '0.00', '0.00', '1495761974', '1495817163', '0.00', '0.00', '0', '4', '', '73', '100', '0.00', '0.00', '800.00', '0', '73'), ('505', '111', '0', '0', '203', '测试分类--测试台座', '2', '50.00', '1665.00', '5.00', '0.00', '1495762095', '1495762264', '0.00', '0.00', '0', '4', '', '73', '100', '1660.00', '0.00', '0.00', '0', '73'), ('506', '112', '0', '0', '206', '卡座--01', '2', '0.00', '0.00', '0.00', '0.00', '1495771389', '1495787066', '0.00', '0.00', '0', '4', '', '74', '101', '0.00', '0.00', '0.00', '0', '74'), ('507', '112', '0', '0', '208', '卡座--03', '1', '0.00', '0.00', '0.00', '0.00', '1495772408', '0', '0.00', '0.00', '0', '2', '', '74', '101', '0.00', '0.00', '0.00', '0', '0'), ('508', '112', '0', '0', '214', '包间--三山四海', '1', '0.00', '0.00', '0.00', '0.00', '1495786349', '0', '0.00', '0.00', '0', '4', '', '74', '101', '0.00', '0.00', '0.00', '0', '0'), ('509', '112', '0', '0', '207', '卡座--02', '1', '0.00', '0.00', '0.00', '0.00', '1495778986', '0', '0.00', '0.00', '0', '2', '', '75', '101', '0.00', '0.00', '0.00', '0', '0'), ('510', '112', '0', '0', '210', '卡座--06', '1', '0.00', '0.00', '0.00', '0.00', '1495780322', '0', '0.00', '0.00', '0', '4', '', '75', '101', '0.00', '0.00', '0.00', '0', '0'), ('511', '112', '0', '0', '212', '卡座--09', '1', '0.00', '0.00', '0.00', '0.00', '1495786499', '0', '0.00', '0.00', '0', '4', '已到', '76', '101', '0.00', '0.00', '0.00', '0', '0'), ('512', '112', '0', '0', '220', '小包间--卡1', '2', '20.00', '20.00', '0.00', '0.00', '1495786522', '1495786926', '0.00', '0.00', '0', '4', '', '74', '101', '20.00', '0.00', '0.00', '0', '74'), ('513', '112', '0', '0', '209', '卡座--05', '2', '0.00', '0.00', '0.00', '0.00', '1495786612', '1495787058', '0.00', '0.00', '0', '4', '', '74', '101', '0.00', '0.00', '0.00', '0', '74'), ('514', '112', '0', '0', '213', '卡座--10', '2', '0.00', '0.00', '0.00', '0.00', '1495786811', '1495786855', '0.00', '0.00', '0', '4', '', '76', '101', '0.00', '0.00', '0.00', '0', '76'), ('515', '112', '0', '0', '213', '卡座--10', '2', '0.00', '0.00', '0.00', '0.00', '1495786878', '1495786891', '0.00', '0.00', '0', '4', '', '76', '101', '0.00', '0.00', '0.00', '0', '76'), ('516', '112', '0', '0', '215', '包间--高山流水', '1', '0.00', '0.00', '0.00', '0.00', '1495787108', '0', '0.00', '0.00', '0', '4', '', '74', '101', '0.00', '0.00', '0.00', '0', '0'), ('517', '112', '0', '0', '209', '卡座--05', '1', '0.00', '0.00', '0.00', '0.00', '1495787117', '0', '0.00', '0.00', '0', '4', '', '76', '101', '0.00', '0.00', '0.00', '0', '0'), ('518', '112', '0', '0', '213', '卡座--10', '1', '0.00', '0.00', '0.00', '0.00', '1495787132', '0', '0.00', '0.00', '0', '4', '', '74', '101', '0.00', '0.00', '0.00', '0', '0'), ('519', '112', '0', '0', '219', '大厅--1', '1', '0.00', '0.00', '0.00', '0.00', '1495787178', '0', '0.00', '0.00', '0', '4', '', '74', '101', '0.00', '0.00', '0.00', '0', '0'), ('520', '112', '0', '0', '221', '大厅--2', '1', '0.00', '0.00', '0.00', '0.00', '1495787240', '0', '0.00', '0.00', '0', '4', '', '74', '101', '0.00', '0.00', '0.00', '0', '0'), ('521', '112', '0', '0', '206', '卡座--01', '2', '0.00', '0.00', '0.00', '0.00', '1495787925', '1495787983', '0.00', '0.00', '0', '4', '', '76', '101', '0.00', '0.00', '0.00', '0', '76'), ('522', '112', '0', '0', '206', '卡座--01', '1', '0.00', '0.00', '0.00', '0.00', '1495788002', '0', '0.00', '0.00', '0', '4', '', '76', '101', '0.00', '0.00', '0.00', '0', '0'), ('523', '111', '0', '0', '203', '测试分类--测试台座', '1', '0.00', '0.00', '0.00', '0.00', '1495817081', '0', '0.00', '0.00', '0', '4', '', '73', '100', '0.00', '0.00', '0.00', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_order_goods`
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1166 DEFAULT CHARSET=utf8 COMMENT='商家订单附属表（台桌订单中消费的商品）';

-- ----------------------------
--  Records of `t_sp_order_goods`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_order_goods` VALUES ('1152', '502', '44', '测试参与库存管理的商品', '12.00', '测试单位', '01', '1', '0', '0', '12.00', '1495710855', '1', '111', '100', '1'), ('1153', '502', '47', '测试绑定原料的商品', '12.00', '测试单位', '10', '1', '0', '0', '12.00', '1495710855', '1', '111', '100', '1'), ('1154', '503', '44', '测试参与库存管理的商品', '12.00', '测试单位', '01', '1', '0', '0', '12.00', '1495762148', '1', '111', '100', '1'), ('1155', '505', '45', '测试不参与库存管理的商品', '12.00', '测试单位', '10', '1', '0', '0', '12.00', '1495762148', '1', '111', '100', '1'), ('1156', '505', '46', '测试允许转配的商品', '12.00', '测试单位', '10', '1', '0', '0', '12.00', '1495762148', '1', '111', '100', '1'), ('1157', '505', '47', '测试绑定原料的商品', '12.00', '测试单位', '10', '1', '0', '0', '12.00', '1495762148', '1', '111', '100', '1'), ('1158', '505', '48', '测试分类二商品一', '321.00', '测试单位', '三德科技发垃圾点开放啦删掉了反馈就是打两份拉萨的弗利萨大姐夫', '1', '0', '0', '321.00', '1495762148', '1', '111', '100', '1'), ('1159', '505', '49', '测试分类二商品2', '546.00', '测试单位', '士大夫撒旦阿萨德收到收到', '1', '0', '0', '546.00', '1495762148', '1', '111', '100', '1'), ('1160', '503', '0', '测试分类--02', '50.00', '小时', null, '14', '0', '0', '700.00', '1495762169', '0', null, null, '1'), ('1163', '508', '0', '包间--三山四海', '0.00', '免费', null, '4', '0', '0', '0.00', '1495786272', '0', null, null, '1'), ('1164', '508', '0', '包间--天涯无归', '0.00', '免费', null, '1', '0', '0', '0.00', '1495786349', '0', null, null, '1'), ('1165', '513', '0', '卡座--10', '0.00', '免费', null, '1', '0', '0', '0.00', '1495786612', '0', null, null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_pandian`
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='盘点日志表';

-- ----------------------------
--  Records of `t_sp_pandian`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_pandian` VALUES ('50', '111', '73', '100', '19', '0', '100', '测试', '1495710765', '0'), ('51', '111', '73', '100', '44', '0', '100', '10', '1495710775', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_storage`
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='进销存入库表';

-- ----------------------------
--  Records of `t_sp_storage`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_storage` VALUES ('72', '111', '100', '73', '201705260903091495760589', '1495760589', '', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_storage_info`
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
) ENGINE=InnoDB AUTO_INCREMENT=488 DEFAULT CHARSET=utf8 COMMENT='进销存入库表商品';

-- ----------------------------
--  Records of `t_sp_storage_info`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_storage_info` VALUES ('475', '111', '100', '44', '73', '1', '1495710855', '销售出库--系统生成', '12.00', '1', '0', '3'), ('476', '111', '100', '19', '73', '4', '1495710855', '销售出库--系统生成', '12.00', '0', '0', '3'), ('477', '111', '100', '19', '73', '2', '1495760589', '', '0.00', '0', '201705260903091495760589', '1'), ('478', '111', '100', '44', '73', '1', '1495762148', '销售出库--系统生成', '12.00', '1', '0', '3'), ('479', '111', '100', '19', '73', '4', '1495762148', '销售出库--系统生成', '12.00', '0', '0', '3'), ('480', '111', '100', '19', '73', '1', '1495763679', '销售出库--系统生成', '12.00', '0', '0', '3'), ('481', '111', '100', '19', '73', '1', '1495763838', '销售回退--系统生成', '12.00', '0', '0', '4'), ('482', '111', '100', '19', '73', '1', '1495763863', '销售出库--系统生成', '12.00', '0', '0', '3'), ('483', '111', '100', '19', '73', '1', '1495763888', '销售回退--系统生成', '12.00', '0', '0', '4'), ('484', '111', '100', '20', '73', '200', '1495764349', '11', '10.00', '0', '0', '1'), ('485', '112', '101', '21', '74', '500', '1495770359', '2017.5.26', '0.10', '0', '0', '1'), ('486', '112', '101', '22', '74', '500', '1495770386', '2017.5.26', '0.10', '0', '0', '1'), ('487', '112', '101', '23', '74', '500', '1495770410', '2017.5.26', '0.10', '0', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_store`
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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='店铺信息表';

-- ----------------------------
--  Records of `t_sp_store`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_store` VALUES ('100', '111', '开发测试店铺', '四川省成都市武侯区环球中心W6 2028', null, null, '23', '385', '4216', '环球中心W6 2028', '0827-8816110', null, '测试店铺的数据！', '1495766019', '32'), ('101', '112', '茶码头智慧茶楼', '四川省成都市武侯区高新区888号', '30.59262000000', '104.03876600000', '23', '385', '4216', '高新区888号', '18200124561', null, '', '1495736157', '32'), ('102', '113', '01', '北京市东城区东华门街道01', '40.38988300000', '116.59396900000', '1', '37', '567', '01', '01', null, '', '1495779336', '32');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_table`
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
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8 COMMENT='台桌表';

-- ----------------------------
--  Records of `t_sp_table`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_table` VALUES ('203', '100', '111', '测试台座', '74', '4'), ('204', '100', '111', '02', '74', '4'), ('205', '100', '111', '87', '74', '4'), ('206', '101', '112', '01', '75', '4'), ('207', '101', '112', '02', '75', '4'), ('208', '101', '112', '03', '75', '4'), ('209', '101', '112', '05', '75', '4'), ('210', '101', '112', '06', '75', '2'), ('211', '101', '112', '07', '75', '2'), ('212', '101', '112', '09', '75', '2'), ('213', '101', '112', '10', '75', '2'), ('214', '101', '112', '三山四海', '77', '4'), ('215', '101', '112', '高山流水', '77', '4'), ('216', '101', '112', '天涯无归', '77', '4'), ('217', '101', '112', '三尺青峰', '77', '4'), ('218', '101', '112', '塞外宝驹', '77', '4'), ('219', '101', '112', '1', '76', '3'), ('220', '101', '112', '卡1', '79', '4'), ('221', '101', '112', '2', '76', '3'), ('222', '101', '112', '11', '75', '3');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_table_type`
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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='台桌类型表';

-- ----------------------------
--  Records of `t_sp_table_type`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_table_type` VALUES ('74', '111', '100', '测试分类', '1', '50.00', null, '0.00', '0'), ('75', '112', '101', '卡座', '3', '0.00', '0', '0.00', '0'), ('76', '112', '101', '大厅', '3', '0.00', '0', '0.00', '0'), ('77', '112', '101', '包间', '3', '0.00', '0', '0.00', '1'), ('79', '112', '101', '小包间', '2', '20.00', '4', '0.00', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_unit`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_unit`;
CREATE TABLE `t_sp_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(6) DEFAULT NULL COMMENT '单位',
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺ID',
  `time` int(11) unsigned DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='茶坊单位表';

-- ----------------------------
--  Records of `t_sp_unit`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_unit` VALUES ('42', '测试单位', '111', '100', '1495710605'), ('43', '包', '112', '101', '1495769732'), ('44', '克', '112', '101', '1495769741');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_users`
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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='茶坊管理系统表';

-- ----------------------------
--  Records of `t_sp_users`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_users` VALUES ('73', '100', '111', '开发测试店铺', '15888888888', '1495710268', 'e10adc3949ba59abbe56e057f20f883e', '1', '0'), ('74', '101', '112', '郑小均', '18200124561', '1495736157', 'e10adc3949ba59abbe56e057f20f883e', '1', '0'), ('75', '101', '112', '周耀进', '18381088838', '1495767897', 'e10adc3949ba59abbe56e057f20f883e', '0', '0'), ('76', '101', '112', '杨荣政', '13547957072', '1495768118', 'e10adc3949ba59abbe56e057f20f883e', '0', '0'), ('77', '102', '113', '余信锴', '13438505154', '1495779336', 'e10adc3949ba59abbe56e057f20f883e', '1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_vip`
-- ----------------------------
DROP TABLE IF EXISTS `t_sp_vip`;
CREATE TABLE `t_sp_vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoper_id` int(11) DEFAULT NULL COMMENT '商家id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户表ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='茶坊会员表';

-- ----------------------------
--  Records of `t_sp_vip`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_vip` VALUES ('40', '111', '0', '18208124561', '201705251932193266', '郑小均', '0.00', '700.00', '1', '1495641600', '', ''), ('41', '112', '0', '18200124561', '201705261152485558', '郑小均', '0.00', '700.00', '1', '1495728000', '', ''), ('42', '112', '0', '15800000000', '201705261153487692', '周耀进', '0.00', '3800.00', '1', '1495728000', '', ''), ('43', '112', '0', '15811111111', '201705261154311944', '杨荣政', '0.00', '99999999.99', '1', '1495728000', '', ''), ('44', '112', '0', '13844444444', '201705261624528654', '周杰伦', '0.00', '0.00', '1', '1495728000', '这娃唱歌厉害', '一条街');
COMMIT;

-- ----------------------------
--  Table structure for `t_sp_vip_pay`
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
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='会员卡充值记录表';

-- ----------------------------
--  Records of `t_sp_vip_pay`
-- ----------------------------
BEGIN;
INSERT INTO `t_sp_vip_pay` VALUES ('129', '111', '40', '500.00', '1495711959', '200.00', '1', '193239201705254871', '0.00', '73'), ('130', '112', '41', '500.00', '1495770784', '200.00', '1', '115304201705269248', '0.00', '74'), ('131', '112', '42', '2000.00', '1495770848', '800.00', '1', '11540820170526375', '0.00', '74'), ('132', '112', '43', '20.00', '1495770882', '5.00', '1', '115442201705264272', '0.00', '74'), ('133', '112', '42', '500.00', '1495779505', '500.00', '3', '141825201705266516', '2800.00', '75'), ('134', '112', '43', '99999999.99', '1495781872', '20.00', '1', '145752201705261849', '25.00', '76');
COMMIT;

-- ----------------------------
--  Table structure for `t_tea_beans_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_tea_beans_config`;
CREATE TABLE `t_tea_beans_config` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `scale` int(11) DEFAULT NULL COMMENT '换算比例，1元钱等于多少茶豆币',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='茶豆币配置表，与钱换算比例';

-- ----------------------------
--  Records of `t_tea_beans_config`
-- ----------------------------
BEGIN;
INSERT INTO `t_tea_beans_config` VALUES ('1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_tea_beans_pay`
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
--  Table structure for `t_unit`
-- ----------------------------
DROP TABLE IF EXISTS `t_unit`;
CREATE TABLE `t_unit` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(6) DEFAULT NULL COMMENT '单位',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台单位配置表';

-- ----------------------------
--  Table structure for `t_user`
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
--  Table structure for `t_users_beans_log`
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
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8 COMMENT='用户茶豆记录表，num不能为负值。';

-- ----------------------------
--  Table structure for `t_withdaw_type`
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
--  Table structure for `t_withdraw`
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='提现记录表';

-- ----------------------------
--  Table structure for `t_wx_user`
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
--  Records of `t_wx_user`
-- ----------------------------
BEGIN;
INSERT INTO `t_wx_user` VALUES ('21', 'lrdouble', '1495710463', 'oq3EJwZZTdMP-uiJ9WZ6ybQPRtWg', null, '', 'http://wx.qlogo.cn/mmopen/oqn8fm7Qia3AEBY7ib5ia8UUlB2jeugVr4613UeLxjNlrJCr8jy8888J4ZVgRQibg6vuNicRc4LgibrIMXDPjvfwXNTlMTmYHr8res/0'), ('22', '茶码头丁波', '1495711797', 'oq3EJwb4u-cN14cgTymxXa4MOWGU', null, '', 'http://wx.qlogo.cn/mmopen/Gt6WnA5IAoqklpyGplFksicj8sdKrDm1psfayJ2YiaqwHnKm18mG5ZKMuxto6aXds6ZrZ38H9YelW4BxUtiaUg1A2dBQ5CUyysZ/0'), ('23', '国王不在家', '1495711967', 'oq3EJwZTUmvNdczoJp-yKf-TY0FE', null, '', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIpS5adG2HfgfKRibRO46mFuGAY7DzPesArf26huicwyuLOj6OByibhGtGuR41AicnyUzbNwucXOJeDTdupXdtibudVyGTcuov8oibT0/0'), ('24', 'harlen', '1495712448', 'oq3EJwb64nNokPPBoZDB4sQY5_qg', null, '', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAlqOt0ATzCziclcxz3bFicOvjSChBrIZMPR8NFr76zxWfm8CTsry2mgKD9GBj8v2buU2tbN3St3WJA/0'), ('25', '一叶知秋', '1495712945', 'oq3EJwYjo2ye4S485yv_WF-TCXN8', null, '', 'http://wx.qlogo.cn/mmopen/OJBGqcfLamIHHAsPbsSlE9kvw3xRjnubndYTaWRd7T3WmSnDIOib1MKibUJqPTv0iakhN2aFN0wHmUo2CUEcxZYEXcKQ9ogQX7R/0'), ('26', 'Dream丶❁҉҉҉҉҉҉҉҉', '1495712962', 'oq3EJwfVA1bAw4c3xO3O_sKQEfOo', null, '', 'http://wx.qlogo.cn/mmopen/oqn8fm7Qia3COS4rINVsT3ZkytFxbTlxNHDHSiaIVKJG93MJeGeI7TWKVvkr4FgibJ60cPqBtacIAUeMTibXs73ndJsvhticbicxw5/0'), ('27', '唐礼强', '1495730491', 'oq3EJwfaxqcRhWEuX_PY85febKic', null, '', 'http://wx.qlogo.cn/mmopen/C0rWDDnNWzVYn0LGTNUI4VQ09uEgZWibRjHq64ichwjDQb2zQyuGL6dVOoIxxECt9CPaD7uSu3qfyr8D2p5BkkKqXhIJc1Aftz/0'), ('28', '。。。', '1495759190', 'oq3EJwbqsMKGNVyyAP-6cXpEteSI', null, '', 'http://wx.qlogo.cn/mmopen/Gt6WnA5IAorfFsGM9ichZClJCtg0WTrnico4GgbicDglEeWF5VasEIDxvAicHJSoI1qic6hJa8ozW9LliaMfZqvl2oSfu23kVZoecP/0'), ('29', null, '1495761430', null, null, '', null), ('30', '忙忙碌碌', '1495761430', 'oq3EJwZAz8hTjxNxOqZhVUwB_gX0', null, '', 'http://wx.qlogo.cn/mmopen/C0rWDDnNWzXjUUEH7bydjzm8pemE3fzicNxr8mLLGQDBHlmiaLFIicicXMNcoDcA2icErUVHGDBRjN2Q2blj9gwn6YXJ1qhTDSiabp/0'), ('31', null, '1495761543', null, null, '', null);
COMMIT;

-- ----------------------------
--  Table structure for `t_wx_user_address`
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

SET FOREIGN_KEY_CHECKS = 1;
