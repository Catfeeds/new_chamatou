# Host: localhost  (Version: 5.5.53)
# Date: 2017-04-20 20:22:54
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "t_ad"
#

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

#
# Data for table "t_ad"
#

INSERT INTO `t_ad` VALUES (12,'ygh','',20000.00,20000.00,'fsdfjsjfo',0,60,20.00,1489477745,NULL,0,NULL),(13,'爱好','东方闪电',6000.00,3000.00,'fgbfb',0,30,20.00,1489635878,NULL,1,1489642832);
