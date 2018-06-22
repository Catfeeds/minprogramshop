/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.28 : Database - allen2018
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`minprogram` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `minprogram`;

/*Table structure for table `wxb_activity_user_log` */

DROP TABLE IF EXISTS `wxb_activity_user_log`;

CREATE TABLE `wxb_activity_user_log` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `activity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(11) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_activity_user_log` */

/*Table structure for table `wxb_admin` */

DROP TABLE IF EXISTS `wxb_admin`;

CREATE TABLE `wxb_admin` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `role_id` int(11) DEFAULT '0',
  `real_name` varchar(64) DEFAULT NULL,
  `mobile` char(11) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `auth_code` text,
  `is_delete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_admin` */

insert  into `wxb_admin`(`admin_id`,`username`,`password`,`role_id`,`real_name`,`mobile`,`add_time`,`add_ip`,`auth_code`,`is_delete`) values (1,'admin','e10adc3949ba59abbe56e057f20f883e',1,'超级管理员','15169991113',1513177683,'127.0.0.1',NULL,0);

/*Table structure for table `wxb_admin_role` */

DROP TABLE IF EXISTS `wxb_admin_role`;

CREATE TABLE `wxb_admin_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) DEFAULT NULL,
  `role_auth` text,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_admin_role` */

insert  into `wxb_admin_role`(`role_id`,`role_name`,`role_auth`,`add_time`,`add_ip`) values (1,'超级管理员',NULL,NULL,NULL),(2,'管理员','',1498541869,'127.0.0.1');

/*Table structure for table `wxb_city` */

DROP TABLE IF EXISTS `wxb_city`;

CREATE TABLE `wxb_city` (
  `city_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `province_id` tinyint(2) NOT NULL DEFAULT '0' COMMENT '省份id',
  `city_name` varchar(50) NOT NULL DEFAULT '' COMMENT '城市名称',
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `pinyin` varchar(150) NOT NULL DEFAULT '' COMMENT '拼音全拼',
  `initial` char(1) NOT NULL DEFAULT '0' COMMENT '拼音首字母',
  `is_open` tinyint(1) unsigned DEFAULT '1' COMMENT '当前站点是否以开通该城市',
  `is_hot` tinyint(1) DEFAULT '0',
  `orderby` int(10) DEFAULT '0',
  `scenic_spot_num` int(5) NOT NULL DEFAULT '0' COMMENT '关联景点个数',
  `area_num` int(5) NOT NULL DEFAULT '0' COMMENT '关联商圈个数',
  `administration_num` int(5) NOT NULL DEFAULT '0' COMMENT '关联行政个数',
  `station_num` int(5) NOT NULL DEFAULT '0' COMMENT '关联车站个数',
  `colleges_num` int(5) NOT NULL DEFAULT '0' COMMENT '关高校个数',
  `hospital_num` int(5) NOT NULL DEFAULT '0' COMMENT '关医院个数',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`city_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`),
  KEY `initial` (`initial`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_city` */

/*Table structure for table `wxb_city_region` */

DROP TABLE IF EXISTS `wxb_city_region`;

CREATE TABLE `wxb_city_region` (
  `region_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1景点，2商圈，3行政区域，4车站，5高校，6医院',
  `city_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '城市名称',
  `member_miniapp_id` int(11) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) DEFAULT '' COMMENT '图片',
  `region_name` varchar(50) NOT NULL DEFAULT '' COMMENT '区域名字',
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) DEFAULT '0',
  `gps_name` varchar(150) NOT NULL DEFAULT '' COMMENT '定位位置名称',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`region_id`),
  KEY `city_id` (`city_id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_city_region` */

/*Table structure for table `wxb_city_region_describe` */

DROP TABLE IF EXISTS `wxb_city_region_describe`;

CREATE TABLE `wxb_city_region_describe` (
  `describe_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '区域id',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`describe_id`),
  KEY `region_id` (`region_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_city_region_describe` */

/*Table structure for table `wxb_company` */

DROP TABLE IF EXISTS `wxb_company`;

CREATE TABLE `wxb_company` (
  `company_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT '0',
  `title` varchar(512) DEFAULT NULL,
  `company_name` varchar(128) DEFAULT NULL,
  `sort_name` varchar(64) DEFAULT NULL,
  `logo` varchar(128) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0' COMMENT '1 个人 2 企业',
  `cat_id` int(11) DEFAULT '0' COMMENT '分类',
  `area_id` int(11) DEFAULT '0' COMMENT '区域ID',
  `main_business` varchar(128) DEFAULT NULL COMMENT '主营业务',
  `bg_year` varchar(32) DEFAULT NULL COMMENT '成立日期',
  `name` varchar(64) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `zhiwu` varchar(64) DEFAULT NULL,
  `addr` varchar(128) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `vip` tinyint(1) DEFAULT '0' COMMENT '0 代表不是VIP  其他正整数将是VIP 的年数，目前最大6年',
  `view_num` int(11) DEFAULT '0',
  `tel_num` int(11) DEFAULT '0',
  `yuyue_num` int(11) DEFAULT '0',
  `zan_num` int(11) NOT NULL DEFAULT '0',
  `share_num` int(11) DEFAULT '0',
  `detail` varchar(1024) DEFAULT '' COMMENT '商家介绍',
  `audit_photo` varchar(128) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0' COMMENT '0 等待审核 1审核成功 2审核失败',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `orderby` int(11) DEFAULT '0',
  `qrcode` text NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_company` */

/*Table structure for table `wxb_company_area` */

DROP TABLE IF EXISTS `wxb_company_area`;

CREATE TABLE `wxb_company_area` (
  `area_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT NULL,
  `area_name` varchar(64) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_company_area` */

/*Table structure for table `wxb_company_cat` */

DROP TABLE IF EXISTS `wxb_company_cat`;

CREATE TABLE `wxb_company_cat` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT NULL,
  `cat_name` varchar(64) DEFAULT NULL,
  `pid` tinyint(1) DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_company_cat` */

/*Table structure for table `wxb_company_pics` */

DROP TABLE IF EXISTS `wxb_company_pics`;

CREATE TABLE `wxb_company_pics` (
  `pic_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_company_pics` */

/*Table structure for table `wxb_company_tel` */

DROP TABLE IF EXISTS `wxb_company_tel`;

CREATE TABLE `wxb_company_tel` (
  `tel_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`tel_id`)
) ENGINE=MyISAM AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_company_tel` */

/*Table structure for table `wxb_company_yuyue` */

DROP TABLE IF EXISTS `wxb_company_yuyue`;

CREATE TABLE `wxb_company_yuyue` (
  `yuyue_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `mobile` varchar(32) DEFAULT NULL,
  `content` varchar(1024) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`yuyue_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_company_yuyue` */

/*Table structure for table `wxb_company_zan` */

DROP TABLE IF EXISTS `wxb_company_zan`;

CREATE TABLE `wxb_company_zan` (
  `zan_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT NULL,
  `compay_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`zan_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_company_zan` */

/*Table structure for table `wxb_companygw` */

DROP TABLE IF EXISTS `wxb_companygw`;

CREATE TABLE `wxb_companygw` (
  `member_miniapp_id` int(10) unsigned NOT NULL,
  `company_name` varchar(64) NOT NULL DEFAULT '' COMMENT '公司名称',
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `traffic` varchar(255) NOT NULL DEFAULT '' COMMENT '交通信息',
  `name` varchar(24) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `mobile` varchar(12) NOT NULL DEFAULT '' COMMENT '联系方式',
  `describe` varchar(500) NOT NULL DEFAULT '' COMMENT '介绍',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`member_miniapp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_companygw` */

/*Table structure for table `wxb_companygw_banner` */

DROP TABLE IF EXISTS `wxb_companygw_banner`;

CREATE TABLE `wxb_companygw_banner` (
  `banner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) NOT NULL DEFAULT '0' COMMENT '小程序id',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片地址',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `orderby` int(11) DEFAULT '0',
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_companygw_banner` */

/*Table structure for table `wxb_companygw_company` */

DROP TABLE IF EXISTS `wxb_companygw_company`;

CREATE TABLE `wxb_companygw_company` (
  `company_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(64) NOT NULL DEFAULT '' COMMENT '产品名称',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格 不填则不显示',
  `version` varchar(64) NOT NULL DEFAULT '' COMMENT '型号 不填则不显示',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_companygw_company` */

/*Table structure for table `wxb_companygw_consult` */

DROP TABLE IF EXISTS `wxb_companygw_consult`;

CREATE TABLE `wxb_companygw_consult` (
  `consult_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_name` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(24) NOT NULL DEFAULT '',
  `tel` char(11) NOT NULL DEFAULT '',
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`consult_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_companygw_consult` */

/*Table structure for table `wxb_companygw_contents` */

DROP TABLE IF EXISTS `wxb_companygw_contents`;

CREATE TABLE `wxb_companygw_contents` (
  `content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:动态2方案3产品',
  `member_miniapp_id` int(11) DEFAULT '0',
  `toutiao_id` int(11) DEFAULT '0',
  `photo` varchar(255) DEFAULT NULL,
  `content` text,
  `orderby` int(11) DEFAULT '0' COMMENT '这里是数值越小排序越高',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_companygw_contents` */

/*Table structure for table `wxb_companygw_news` */

DROP TABLE IF EXISTS `wxb_companygw_news`;

CREATE TABLE `wxb_companygw_news` (
  `toutiao_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1动态2方案',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`toutiao_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_companygw_news` */

/*Table structure for table `wxb_companygw_product` */

DROP TABLE IF EXISTS `wxb_companygw_product`;

CREATE TABLE `wxb_companygw_product` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `product_name` varchar(64) NOT NULL DEFAULT '' COMMENT '产品名称',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格 不填则不显示',
  `version` varchar(64) NOT NULL DEFAULT '' COMMENT '型号 不填则不显示',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `introduce` varchar(255) DEFAULT '' COMMENT '冗余 字段',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_companygw_product` */

/*Table structure for table `wxb_component_verify_ticket` */

DROP TABLE IF EXISTS `wxb_component_verify_ticket`;

CREATE TABLE `wxb_component_verify_ticket` (
  `ticket_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `component_verify_ticket` varchar(256) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ticket_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20066 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_component_verify_ticket` */

insert  into `wxb_component_verify_ticket`(`ticket_id`,`component_verify_ticket`,`add_time`,`add_ip`) values (1,'ticket@@@DzR3XY-xls_kLXSD8YxleqgF3PhQtYfUGTkXYYVK_B9qqEZVKuc2LkL9GKnD-WJaf-gx_HfGYK-HAxUrHgh5Cg',1515389925,'140.207.54.76'),(2,'ticket@@@DzR3XY-xls_kLXSD8YxleqgF3PhQtYfUGTkXYYVK_B9qqEZVKuc2LkL9GKnD-WJaf-gx_HfGYK-HAxUrHgh5Cg',1515390527,'140.207.54.75');

/*Table structure for table `wxb_coupon` */

DROP TABLE IF EXISTS `wxb_coupon`;

CREATE TABLE `wxb_coupon` (
  `coupon_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `member_miniapp_id` int(11) unsigned NOT NULL DEFAULT '0',
  `way` tinyint(1) DEFAULT '0' COMMENT '1 抢红包活动 2新人登录 3 首单',
  `type` smallint(3) unsigned DEFAULT '0' COMMENT '1住宿 2团购 3商城 （此字段已作废 但为了保证程序不出错 不要删除）',
  `need_money` int(11) DEFAULT '0' COMMENT '需要满足消费金额才能使用的',
  `money` int(11) DEFAULT '0' COMMENT '乘以100保存',
  `expir_time` int(11) unsigned NOT NULL DEFAULT '0',
  `can_use_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '可以使用时间',
  `is_can` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否使用：0未使用 1： 使用',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_coupon` */

/*Table structure for table `wxb_coupon_activity` */

DROP TABLE IF EXISTS `wxb_coupon_activity`;

CREATE TABLE `wxb_coupon_activity` (
  `activity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '1房源2抢购（套餐） 3商城',
  `title` varchar(64) DEFAULT NULL,
  `money` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '红包余额',
  `expire_day` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期',
  `use_day` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '可以使用天数',
  `need_money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '限制',
  `is_newuser` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启',
  `num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  `bg_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_coupon_activity` */

/*Table structure for table `wxb_coupon_setting` */

DROP TABLE IF EXISTS `wxb_coupon_setting`;

CREATE TABLE `wxb_coupon_setting` (
  `member_miniapp_id` int(11) unsigned NOT NULL COMMENT '小程序id',
  `value` text NOT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`member_miniapp_id`),
  UNIQUE KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_coupon_setting` */

/*Table structure for table `wxb_customized_order` */

DROP TABLE IF EXISTS `wxb_customized_order`;

CREATE TABLE `wxb_customized_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '1家庭出游 2公司出游',
  `bg_city` int(11) DEFAULT '0',
  `mb_city` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `bg_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `num1` int(11) DEFAULT '0',
  `num2` int(11) DEFAULT '0',
  `email` varchar(64) DEFAULT NULL,
  `price` int(11) DEFAULT '0',
  `content` varchar(1024) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_customized_order` */

/*Table structure for table `wxb_fitment_activity` */

DROP TABLE IF EXISTS `wxb_fitment_activity`;

CREATE TABLE `wxb_fitment_activity` (
  `activity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '活动标题',
  `photo` varchar(255) DEFAULT NULL,
  `bg_date` date NOT NULL,
  `end_date` date NOT NULL,
  `address` varchar(150) NOT NULL DEFAULT '' COMMENT '地址',
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `introduce` text NOT NULL,
  `rule` text NOT NULL,
  `warning` text NOT NULL,
  `is_end` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '如果为1 则表示 立即结束 该活动即使 为结束的活动',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_fitment_activity` */

/*Table structure for table `wxb_fitment_banner` */

DROP TABLE IF EXISTS `wxb_fitment_banner`;

CREATE TABLE `wxb_fitment_banner` (
  `banner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT 'banner',
  `orderby` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_fitment_banner` */

/*Table structure for table `wxb_fitment_designer` */

DROP TABLE IF EXISTS `wxb_fitment_designer`;

CREATE TABLE `wxb_fitment_designer` (
  `designer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '设计师名称',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '不像本人的自拍',
  `level` varchar(32) NOT NULL DEFAULT '' COMMENT '级别',
  `experience` varchar(32) NOT NULL DEFAULT '' COMMENT '经验',
  `introduce` text NOT NULL COMMENT '设计理念',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `motto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`designer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_fitment_designer` */

/*Table structure for table `wxb_fitment_designer_example` */

DROP TABLE IF EXISTS `wxb_fitment_designer_example`;

CREATE TABLE `wxb_fitment_designer_example` (
  `example_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `designer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '案例标题',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `orderby` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`example_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_fitment_designer_example` */

/*Table structure for table `wxb_fitment_designer_photo` */

DROP TABLE IF EXISTS `wxb_fitment_designer_photo`;

CREATE TABLE `wxb_fitment_designer_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `example_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '例子ID',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_fitment_designer_photo` */

/*Table structure for table `wxb_fitment_enroll` */

DROP TABLE IF EXISTS `wxb_fitment_enroll`;

CREATE TABLE `wxb_fitment_enroll` (
  `encroll_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1活动报名 2设计师预约 3 参团预约 4工地',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属类型的id ',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '联系方式',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`encroll_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_fitment_enroll` */

/*Table structure for table `wxb_fitment_example` */

DROP TABLE IF EXISTS `wxb_fitment_example`;

CREATE TABLE `wxb_fitment_example` (
  `example_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '案例标题',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `orderby` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`example_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_fitment_example` */

/*Table structure for table `wxb_fitment_example_photo` */

DROP TABLE IF EXISTS `wxb_fitment_example_photo`;

CREATE TABLE `wxb_fitment_example_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `example_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '例子ID',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_fitment_example_photo` */

/*Table structure for table `wxb_fitment_group` */

DROP TABLE IF EXISTS `wxb_fitment_group`;

CREATE TABLE `wxb_fitment_group` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '团标题',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '参加此团购至少可以省多少钱',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '参团人数',
  `bg_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_end` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '立即结束',
  `introduce` text NOT NULL,
  `rule` text NOT NULL,
  `warning` text NOT NULL,
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_fitment_group` */

/*Table structure for table `wxb_fitment_photo` */

DROP TABLE IF EXISTS `wxb_fitment_photo`;

CREATE TABLE `wxb_fitment_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `orderby` int(11) DEFAULT '0',
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_fitment_photo` */

/*Table structure for table `wxb_fitment_work` */

DROP TABLE IF EXISTS `wxb_fitment_work`;

CREATE TABLE `wxb_fitment_work` (
  `work_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `designer_ids` varchar(64) NOT NULL DEFAULT '0' COMMENT '设计师ids',
  `title` varchar(64) NOT NULL DEFAULT '0' COMMENT '工地标题',
  `area` smallint(6) NOT NULL DEFAULT '0' COMMENT '面积',
  `village` varchar(64) NOT NULL DEFAULT '' COMMENT '所在小区',
  `company` varchar(64) NOT NULL DEFAULT '' COMMENT '施工单位',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`work_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_fitment_work` */

/*Table structure for table `wxb_fitment_work_detail` */

DROP TABLE IF EXISTS `wxb_fitment_work_detail`;

CREATE TABLE `wxb_fitment_work_detail` (
  `detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `work_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '0' COMMENT '工地标题',
  `introduce` text NOT NULL,
  `num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '施工人员',
  `boss` varchar(32) NOT NULL DEFAULT '' COMMENT '监管',
  `progress` varchar(32) NOT NULL DEFAULT '' COMMENT '进度',
  `orderby` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`detail_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_fitment_work_detail` */

/*Table structure for table `wxb_fitment_work_photo` */

DROP TABLE IF EXISTS `wxb_fitment_work_photo`;

CREATE TABLE `wxb_fitment_work_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `detail_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '例子ID',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_fitment_work_photo` */

/*Table structure for table `wxb_fitment_yvyue` */

DROP TABLE IF EXISTS `wxb_fitment_yvyue`;

CREATE TABLE `wxb_fitment_yvyue` (
  `yvyue_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '联系人',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '联系方式',
  `area` smallint(6) NOT NULL DEFAULT '0' COMMENT '面积',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  `address` varchar(150) NOT NULL DEFAULT '' COMMENT '地址',
  `info` text NOT NULL COMMENT '备注信息',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `is_pass` tinyint(1) DEFAULT '0' COMMENT '0 未沟通 1已沟通有意向 2已沟通无意向 3已沟通并达成协议',
  PRIMARY KEY (`yvyue_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_fitment_yvyue` */

/*Table structure for table `wxb_group` */

DROP TABLE IF EXISTS `wxb_group`;

CREATE TABLE `wxb_group` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类名称',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '团长',
  `max_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '该团需要人数',
  `this_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '当前参团人数',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 等待开团 1 已成团   2 未成团商品库存不足  8 已完成 未成团 大于过期时间',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_group` */

/*Table structure for table `wxb_group_category` */

DROP TABLE IF EXISTS `wxb_group_category`;

CREATE TABLE `wxb_group_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `category_name` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  `orderby` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_group_category` */

/*Table structure for table `wxb_group_comment` */

DROP TABLE IF EXISTS `wxb_group_comment`;

CREATE TABLE `wxb_group_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `order_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `content` varchar(1024) NOT NULL DEFAULT '',
  `reply` varchar(1024) NOT NULL DEFAULT '',
  `reply_time` int(11) NOT NULL DEFAULT '0',
  `reply_ip` varchar(15) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_group_comment` */

/*Table structure for table `wxb_group_comment_photo` */

DROP TABLE IF EXISTS `wxb_group_comment_photo`;

CREATE TABLE `wxb_group_comment_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(128) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_group_comment_photo` */

/*Table structure for table `wxb_group_contents` */

DROP TABLE IF EXISTS `wxb_group_contents`;

CREATE TABLE `wxb_group_contents` (
  `content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT '0',
  `photo` varchar(255) DEFAULT NULL,
  `content` text,
  `orderby` int(11) DEFAULT '0' COMMENT '这里是数值越小排序越高',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_group_contents` */

/*Table structure for table `wxb_group_goods` */

DROP TABLE IF EXISTS `wxb_group_goods`;

CREATE TABLE `wxb_group_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `goods_name` varchar(64) NOT NULL DEFAULT '' COMMENT '商品名称',
  `photo` varchar(150) DEFAULT '',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '原价市场价',
  `group_price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拼团价',
  `alone_price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单独购买价',
  `is_mail` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否包邮',
  `mail_price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邮费价格',
  `service_ids` varchar(64) NOT NULL DEFAULT '' COMMENT '服务',
  `bg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `group_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '几人团',
  `people_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已有多少人参加',
  `surplus_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `brief` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简略',
  `spec` text NOT NULL COMMENT '规格',
  `ctn` text NOT NULL COMMENT '包装',
  `is_online` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上架',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `is_delete` tinyint(1) unsigned DEFAULT '0',
  `sold_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已买出数量',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_group_goods` */

/*Table structure for table `wxb_group_order` */

DROP TABLE IF EXISTS `wxb_group_order`;

CREATE TABLE `wxb_group_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '为0则表示单独购买的',
  `total_price` int(11) DEFAULT '0' COMMENT '总价',
  `need_pay` int(11) DEFAULT '0' COMMENT '实际需要支付',
  `pay_coupon` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券',
  `pay_coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠卷id',
  `pay_money` int(11) DEFAULT '0' COMMENT '已支付',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_info` text,
  `is_comment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否评论',
  `status` tinyint(3) DEFAULT '0' COMMENT '0 等待支付 1已支付等待拼团 2代发货 3已发货 4取消订单申请 5已退款  6 未成团 8订单已完成',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间 拼团订单 过期时冗余',
  `mail_number` varchar(64) NOT NULL DEFAULT '' COMMENT '快递信息',
  `name` varchar(64) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `gps_addr` varchar(128) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `cancel_type` tinyint(1) unsigned DEFAULT '0' COMMENT '1用户取消2:商户取消',
  `cancel_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `cancel_info` varchar(150) NOT NULL DEFAULT '' COMMENT '取消理由',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：会员订单不显示',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `goods_id` int(11) DEFAULT '0',
  `delivery` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mail_price` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_group_order` */

/*Table structure for table `wxb_hair` */

DROP TABLE IF EXISTS `wxb_hair`;

CREATE TABLE `wxb_hair` (
  `member_miniapp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT '',
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hair` */

/*Table structure for table `wxb_hair_banner` */

DROP TABLE IF EXISTS `wxb_hair_banner`;

CREATE TABLE `wxb_hair_banner` (
  `banner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hair_banner` */

/*Table structure for table `wxb_hair_category` */

DROP TABLE IF EXISTS `wxb_hair_category`;

CREATE TABLE `wxb_hair_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `describe` varchar(255) NOT NULL DEFAULT '',
  `ico` varchar(155) NOT NULL DEFAULT '' COMMENT '漂亮的图标',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hair_category` */

/*Table structure for table `wxb_hair_category_price` */

DROP TABLE IF EXISTS `wxb_hair_category_price`;

CREATE TABLE `wxb_hair_category_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  `vip_price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'vip价格',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `category_id` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`price_id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hair_category_price` */

/*Table structure for table `wxb_hair_comment` */

DROP TABLE IF EXISTS `wxb_hair_comment`;

CREATE TABLE `wxb_hair_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `designer_id` int(11) DEFAULT NULL,
  `content` varchar(256) DEFAULT NULL,
  `reply` varchar(256) NOT NULL DEFAULT '',
  `reply_time` int(11) NOT NULL DEFAULT '0',
  `zan_num` int(11) DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hair_comment` */

/*Table structure for table `wxb_hair_designer` */

DROP TABLE IF EXISTS `wxb_hair_designer`;

CREATE TABLE `wxb_hair_designer` (
  `designer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '项目名称',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '头像',
  `zhiwu` varchar(24) NOT NULL DEFAULT '',
  `tages` varchar(255) NOT NULL DEFAULT '',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  `works_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '作品数',
  `enroll_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '预约数',
  `hp_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '好评数',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `orderby` int(11) DEFAULT '0',
  PRIMARY KEY (`designer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hair_designer` */

/*Table structure for table `wxb_hair_designer_photo` */

DROP TABLE IF EXISTS `wxb_hair_designer_photo`;

CREATE TABLE `wxb_hair_designer_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `works_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL,
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hair_designer_photo` */

/*Table structure for table `wxb_hair_designer_works` */

DROP TABLE IF EXISTS `wxb_hair_designer_works`;

CREATE TABLE `wxb_hair_designer_works` (
  `works_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0',
  `designer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`works_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hair_designer_works` */

/*Table structure for table `wxb_hair_enroll` */

DROP TABLE IF EXISTS `wxb_hair_enroll`;

CREATE TABLE `wxb_hair_enroll` (
  `enrol_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `designer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `num` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '6 等于5人以上',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '0 等待商家接单 2已接单 3拒绝此预约 4 取消预约',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`enrol_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hair_enroll` */

/*Table structure for table `wxb_hair_order` */

DROP TABLE IF EXISTS `wxb_hair_order`;

CREATE TABLE `wxb_hair_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `total_money` int(11) DEFAULT '0',
  `pay_coupon` int(11) DEFAULT '0',
  `pay_money` int(11) DEFAULT '0',
  `is_paid` tinyint(1) DEFAULT '0' COMMENT '1 代表已经支付',
  `pay_time` int(11) DEFAULT '0',
  `pay_info` text,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hair_order` */

/*Table structure for table `wxb_hair_photo` */

DROP TABLE IF EXISTS `wxb_hair_photo`;

CREATE TABLE `wxb_hair_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `works_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL,
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hair_photo` */

/*Table structure for table `wxb_hair_works` */

DROP TABLE IF EXISTS `wxb_hair_works`;

CREATE TABLE `wxb_hair_works` (
  `works_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`works_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hair_works` */

/*Table structure for table `wxb_hospital` */

DROP TABLE IF EXISTS `wxb_hospital`;

CREATE TABLE `wxb_hospital` (
  `member_miniapp_id` int(11) NOT NULL DEFAULT '0',
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `hospital_name` varchar(64) NOT NULL DEFAULT '' COMMENT '医院名称',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '联系人',
  `mobile` varchar(12) NOT NULL DEFAULT '' COMMENT '联系人',
  `traffic` varchar(255) NOT NULL DEFAULT '' COMMENT '交通信息',
  `introduce` text NOT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`member_miniapp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hospital` */

/*Table structure for table `wxb_hospital_contents` */

DROP TABLE IF EXISTS `wxb_hospital_contents`;

CREATE TABLE `wxb_hospital_contents` (
  `content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT '0',
  `photo` varchar(255) DEFAULT NULL,
  `content` text,
  `orderby` int(11) DEFAULT '0' COMMENT '这里是数值越小排序越高',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hospital_contents` */

/*Table structure for table `wxb_hospital_doctor` */

DROP TABLE IF EXISTS `wxb_hospital_doctor`;

CREATE TABLE `wxb_hospital_doctor` (
  `doctor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `doctor_name` varchar(64) NOT NULL DEFAULT '' COMMENT '医生的名称',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '头像',
  `experience` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '临床经验',
  `introduce` text NOT NULL COMMENT '介绍',
  `major` varchar(255) NOT NULL DEFAULT '' COMMENT '专业擅长',
  `learning` varchar(255) NOT NULL DEFAULT '' COMMENT '学术荣誉',
  `thank_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '感谢信',
  `consult_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '咨询量',
  `enroll_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '预约数',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hospital_doctor` */

/*Table structure for table `wxb_hospital_enroll` */

DROP TABLE IF EXISTS `wxb_hospital_enroll`;

CREATE TABLE `wxb_hospital_enroll` (
  `enroll_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1门诊2预约',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '联系人',
  `mobile` varchar(12) NOT NULL DEFAULT '' COMMENT '联系方式',
  `date` date NOT NULL COMMENT '预约日期',
  `intention` varchar(64) NOT NULL DEFAULT '' COMMENT '预约意向',
  `demand` varchar(255) NOT NULL DEFAULT '' COMMENT '需求',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1男2nv',
  PRIMARY KEY (`enroll_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hospital_enroll` */

/*Table structure for table `wxb_hotel` */

DROP TABLE IF EXISTS `wxb_hotel`;

CREATE TABLE `wxb_hotel` (
  `hotel_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '城市id',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `brand_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '品牌',
  `hotel_name` varchar(128) NOT NULL DEFAULT '' COMMENT '商户名称',
  `hotel_level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商户等级 1 - 5',
  `hotel_tel` varchar(12) NOT NULL DEFAULT '0' COMMENT '酒店电话',
  `decoration_time` varchar(64) NOT NULL DEFAULT '0' COMMENT '最后装修时间',
  `opening_time` varchar(64) NOT NULL DEFAULT '0' COMMENT '开门时间',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `banner` varchar(150) DEFAULT NULL,
  `score` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '评分 0 - 50',
  `order_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单数',
  `praise_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '好评数',
  `bad_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '差评数',
  `advantage` varchar(8) NOT NULL DEFAULT '' COMMENT '优势最多8个字',
  `price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '起价',
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `scenic_spot_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '景点id',
  `area_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商圈id',
  `administration_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行政区域id',
  `station_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '车站id',
  `colleges_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '高校id',
  `hospital_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '医院id',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1开业0关店',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hotel_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotel` */

/*Table structure for table `wxb_hotel_brand` */

DROP TABLE IF EXISTS `wxb_hotel_brand`;

CREATE TABLE `wxb_hotel_brand` (
  `brand_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) unsigned NOT NULL DEFAULT '0',
  `brand_name` varchar(64) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `bloc` varchar(64) NOT NULL DEFAULT '' COMMENT '所属集团',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `orderby` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotel_brand` */

/*Table structure for table `wxb_hotel_comment` */

DROP TABLE IF EXISTS `wxb_hotel_comment`;

CREATE TABLE `wxb_hotel_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `hotel_id` int(11) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `order_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `content` varchar(1024) NOT NULL DEFAULT '',
  `reply` varchar(1024) NOT NULL DEFAULT '',
  `reply_time` int(11) NOT NULL DEFAULT '0',
  `reply_ip` varchar(15) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotel_comment` */

/*Table structure for table `wxb_hotel_comment_photo` */

DROP TABLE IF EXISTS `wxb_hotel_comment_photo`;

CREATE TABLE `wxb_hotel_comment_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(128) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotel_comment_photo` */

/*Table structure for table `wxb_hotel_detail` */

DROP TABLE IF EXISTS `wxb_hotel_detail`;

CREATE TABLE `wxb_hotel_detail` (
  `hotel_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(11) NOT NULL DEFAULT '0',
  `describe` tinytext NOT NULL COMMENT '酒店详情',
  `unsubscribe` tinytext NOT NULL COMMENT '退订规则',
  `check_otice` tinytext NOT NULL COMMENT '入住须知',
  `is_wifi` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有wif',
  `is_water` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有热水',
  `is_hairdrier` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有吹风机',
  `is_airconditioner` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有空调',
  `is_elevator` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有电梯',
  `is_fitnessroom` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有健生房',
  `is_swimmingpool` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有游泳池',
  `is_sauna` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有桑拿',
  `is_westernfood` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有西餐厅',
  `is_chinesefood` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有中餐厅',
  `is_disability` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有残疾人专用房',
  `is_smokeless` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有无烟房',
  `is_stop` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有免费停车',
  `is_cereal` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有早餐',
  `is_airportpickup` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有接机服务',
  `is_station` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有接站服务',
  `is_cabs` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有叫车服务',
  `is_luggage` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有专职行李',
  `is_carrental` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '租车',
  `is_disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有残疾人设施',
  `is_conference` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有会议室',
  `is_express` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮政服务',
  `is_washclothes` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有洗衣服务',
  `is_merchant` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有商户中心',
  `is_awaken` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有唤醒服务',
  `is_deposit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有行李寄存',
  `is_creditcard` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有信用卡',
  `is_reception` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否全天前台',
  `is_foreignguests` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否接待外宾',
  `is_spa` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有spa',
  `is_chess` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有棋盘室',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`hotel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotel_detail` */

/*Table structure for table `wxb_hotel_manage` */

DROP TABLE IF EXISTS `wxb_hotel_manage`;

CREATE TABLE `wxb_hotel_manage` (
  `manage_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '授权此管理员员的小程序id',
  `hotel_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '酒店id',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '管理员账号',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '授权人密码',
  `role_name` varchar(64) NOT NULL DEFAULT '' COMMENT '授权人角色名称',
  `mange_name` varchar(64) NOT NULL DEFAULT '' COMMENT '授权人姓名',
  `is_lock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定',
  `last_time` int(11) DEFAULT NULL,
  `last_ip` varchar(15) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`manage_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotel_manage` */

/*Table structure for table `wxb_hotel_order` */

DROP TABLE IF EXISTS `wxb_hotel_order`;

CREATE TABLE `wxb_hotel_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL COMMENT '小程序id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员',
  `hotel_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '酒店id',
  `room_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '房源id',
  `room_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '房间数',
  `person_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '人数',
  `total_price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '一共需要支付',
  `need_pay` int(11) DEFAULT '0',
  `pay_money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已支付余额',
  `pay_coupon` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券',
  `lijian` int(11) DEFAULT '0',
  `pay_coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠卷id',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_info` text,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `mobile` char(11) NOT NULL DEFAULT '0' COMMENT '联系人手机',
  `idcard` varchar(18) DEFAULT NULL,
  `is_comment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否评论',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未支付 1等待商家接单 2待入住 3 取消订单 , 8完成',
  `check_in_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '入住时间',
  `leave_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '离店时间',
  `cancel_type` tinyint(1) unsigned DEFAULT '0' COMMENT '1用户取消2:商户取消',
  `cancel_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `cancel_info` varchar(150) NOT NULL DEFAULT '' COMMENT '取消理由',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：会员订单不显示',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`order_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotel_order` */

/*Table structure for table `wxb_hotel_photo` */

DROP TABLE IF EXISTS `wxb_hotel_photo`;

CREATE TABLE `wxb_hotel_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(128) NOT NULL DEFAULT '',
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotel_photo` */

/*Table structure for table `wxb_hotel_room` */

DROP TABLE IF EXISTS `wxb_hotel_room`;

CREATE TABLE `wxb_hotel_room` (
  `room_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '酒店（民宿）id',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `city_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '城市id',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '房间标题',
  `area` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '面积',
  `photo` varchar(128) NOT NULL DEFAULT '' COMMENT '展示图片',
  `room_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1经济型2豪华型3总统 ',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '日常价格',
  `appropriate_num` smallint(2) unsigned NOT NULL DEFAULT '0',
  `bed_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '床的类型',
  `bed_width` varchar(10) NOT NULL DEFAULT '' COMMENT '床宽',
  `bed_logn` varchar(10) NOT NULL DEFAULT '' COMMENT '床长',
  `bed_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '床的数量',
  `is_wifi` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有网络',
  `is_breakfast` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `day_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '单日最大预定数',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1上架',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`room_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotel_room` */

/*Table structure for table `wxb_hotel_room_photo` */

DROP TABLE IF EXISTS `wxb_hotel_room_photo`;

CREATE TABLE `wxb_hotel_room_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(128) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`),
  KEY `room_id` (`room_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotel_room_photo` */

/*Table structure for table `wxb_hotel_room_price` */

DROP TABLE IF EXISTS `wxb_hotel_room_price`;

CREATE TABLE `wxb_hotel_room_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned NOT NULL DEFAULT '0',
  `hotel_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `day` date NOT NULL COMMENT '日期',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  `room_num` smallint(5) NOT NULL DEFAULT '0' COMMENT '房间已售',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0今天不买了',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`price_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotel_room_price` */

/*Table structure for table `wxb_hotel_special` */

DROP TABLE IF EXISTS `wxb_hotel_special`;

CREATE TABLE `wxb_hotel_special` (
  `special_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT '0',
  `special_title1` varchar(64) NOT NULL DEFAULT '' COMMENT '标题一',
  `special_title2` varchar(255) NOT NULL DEFAULT '' COMMENT '标题二',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`special_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotel_special` */

/*Table structure for table `wxb_hotel_special_join` */

DROP TABLE IF EXISTS `wxb_hotel_special_join`;

CREATE TABLE `wxb_hotel_special_join` (
  `join_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `hotel_id` int(10) unsigned NOT NULL DEFAULT '0',
  `special_id` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`join_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotel_special_join` */

/*Table structure for table `wxb_hotelgw` */

DROP TABLE IF EXISTS `wxb_hotelgw`;

CREATE TABLE `wxb_hotelgw` (
  `member_miniapp_id` int(10) unsigned NOT NULL,
  `hotel_name` varchar(64) NOT NULL DEFAULT '' COMMENT '公司名称',
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `logo` varchar(155) NOT NULL DEFAULT '' COMMENT 'LOGO',
  `banner` varchar(155) NOT NULL DEFAULT '' COMMENT 'banner',
  `hotel_service` varchar(500) NOT NULL DEFAULT '' COMMENT '服务标签以逗号隔开',
  `describe` text NOT NULL COMMENT '描述',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`member_miniapp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotelgw` */

/*Table structure for table `wxb_hotelgw_comment` */

DROP TABLE IF EXISTS `wxb_hotelgw_comment`;

CREATE TABLE `wxb_hotelgw_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `order_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `content` varchar(1024) NOT NULL DEFAULT '',
  `reply` varchar(1024) NOT NULL DEFAULT '',
  `reply_time` int(11) NOT NULL DEFAULT '0',
  `reply_ip` varchar(15) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotelgw_comment` */

/*Table structure for table `wxb_hotelgw_comment_photo` */

DROP TABLE IF EXISTS `wxb_hotelgw_comment_photo`;

CREATE TABLE `wxb_hotelgw_comment_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(128) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotelgw_comment_photo` */

/*Table structure for table `wxb_hotelgw_order` */

DROP TABLE IF EXISTS `wxb_hotelgw_order`;

CREATE TABLE `wxb_hotelgw_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL COMMENT '小程序id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员',
  `room_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '房源id',
  `room_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '房间数',
  `total_price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '一共需要支付',
  `need_pay` int(11) DEFAULT '0',
  `pay_money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已支付余额',
  `pay_coupon` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券',
  `lijian` int(11) DEFAULT '0',
  `pay_coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠卷id',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_info` text,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `mobile` char(11) NOT NULL DEFAULT '0' COMMENT '联系人手机',
  `idcard` varchar(18) DEFAULT NULL,
  `is_comment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否评论',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未支付 1等待商家接单 2待入住 3 取消订单, 8完成',
  `check_in_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '入住时间',
  `leave_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '离店时间',
  `cancel_type` tinyint(1) unsigned DEFAULT '0' COMMENT '1用户取消2:商户取消',
  `cancel_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `cancel_info` varchar(150) NOT NULL DEFAULT '' COMMENT '取消理由',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：会员订单不显示',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`order_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotelgw_order` */

/*Table structure for table `wxb_hotelgw_photo` */

DROP TABLE IF EXISTS `wxb_hotelgw_photo`;

CREATE TABLE `wxb_hotelgw_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(128) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotelgw_photo` */

/*Table structure for table `wxb_hotelgw_price` */

DROP TABLE IF EXISTS `wxb_hotelgw_price`;

CREATE TABLE `wxb_hotelgw_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `day` date NOT NULL COMMENT '日期',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  `room_num` smallint(5) NOT NULL DEFAULT '0' COMMENT '房间已售',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0今天不买了',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`price_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotelgw_price` */

/*Table structure for table `wxb_hotelgw_room` */

DROP TABLE IF EXISTS `wxb_hotelgw_room`;

CREATE TABLE `wxb_hotelgw_room` (
  `room_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT '',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '日常价格',
  `area` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '面积',
  `is_cancel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可以取消',
  `cancel` varchar(248) NOT NULL DEFAULT '' COMMENT '取消规则',
  `is_window` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有窗户',
  `people_num` smallint(2) NOT NULL DEFAULT '0' COMMENT '可入住人数',
  `is_wifi` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有wifi',
  `floor` varchar(64) NOT NULL DEFAULT '' COMMENT '所在楼层',
  `day_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '单日最大预定数',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `is_breakfast` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是上架',
  PRIMARY KEY (`room_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hotelgw_room` */

/*Table structure for table `wxb_hunqing_tender` */

DROP TABLE IF EXISTS `wxb_hunqing_tender`;

CREATE TABLE `wxb_hunqing_tender` (
  `tender_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `hssy` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '婚纱摄影',
  `hsch` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '婚礼策划',
  `hslf` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '婚纱礼服',
  `hlgp` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '婚礼跟拍',
  `xngz` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '新娘跟妆',
  `hyjd` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '婚宴酒店',
  `hczp` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '婚车租赁',
  `hlsy` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '婚礼司仪',
  `name` varchar(64) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  `content` varchar(1024) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`tender_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_hunqing_tender` */

/*Table structure for table `wxb_img_upload_log` */

DROP TABLE IF EXISTS `wxb_img_upload_log`;

CREATE TABLE `wxb_img_upload_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT ' 1加盟商上传（后台上传），2商户上传（接口上传）',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'store_id',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'member_id',
  `img_type` varchar(64) NOT NULL DEFAULT '' COMMENT '图片类型',
  `img_size` varchar(64) NOT NULL DEFAULT '' COMMENT '图片大小KB',
  `img_wh` varchar(64) NOT NULL DEFAULT '' COMMENT '图片宽高',
  `img_path` varchar(150) NOT NULL DEFAULT '' COMMENT '图片路径',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_img_upload_log` */

/*Table structure for table `wxb_job` */

DROP TABLE IF EXISTS `wxb_job`;

CREATE TABLE `wxb_job` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `company_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '职位标题',
  `people_num` tinyint(3) NOT NULL DEFAULT '0' COMMENT '招聘人数',
  `experience_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '工作经验',
  `education_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '学历要求',
  `salary_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '薪水',
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址 继承公司的',
  `region` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '区域id 继承公司的',
  `describe` text NOT NULL COMMENT '描述',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '联系人',
  `tel` char(12) NOT NULL DEFAULT '' COMMENT '联系方式',
  `is_online` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1展示0不招聘了',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 为 失效了 公司删除了',
  `apply_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '已申请数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '公司性质 继承公司的',
  `scale` tinyint(1) NOT NULL DEFAULT '0' COMMENT '公司规模',
  `industry_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属行业',
  `is_eat` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否包吃',
  `is_live` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否包住',
  `is_weekend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否双休',
  `is_overtime` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有加班补助',
  `is_vehicle` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有班车接送',
  `is_bus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '交通补助',
  `is_meal` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '饭补',
  `is_phone` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '话补',
  `is_room` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '房补',
  `is_festival` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '节日福利',
  `is_wuxian` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '五险',
  `is_mpf` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '公积金',
  `is_bonus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '年终奖',
  `is_newyear` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '带薪年假',
  `is_healthy` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '健康体检',
  `is_tourism` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '旅游奖励',
  `is_train` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '培训学习',
  `is_shares` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '股票股权',
  `orderby` int(11) unsigned DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `update` int(11) unsigned NOT NULL DEFAULT '0',
  `is_ji` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`job_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job` */

/*Table structure for table `wxb_job_apply` */

DROP TABLE IF EXISTS `wxb_job_apply`;

CREATE TABLE `wxb_job_apply` (
  `apply_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `job_id` int(11) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `company_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 待查看 1已查看 2 有意 3 暂不合适',
  `look_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '企业查看次数',
  `user_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1 用户不显示',
  `company_delete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1 公司不显示',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`apply_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_apply` */

/*Table structure for table `wxb_job_area` */

DROP TABLE IF EXISTS `wxb_job_area`;

CREATE TABLE `wxb_job_area` (
  `area_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT NULL,
  `area_name` varchar(64) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_area` */

/*Table structure for table `wxb_job_company` */

DROP TABLE IF EXISTS `wxb_job_company`;

CREATE TABLE `wxb_job_company` (
  `company_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT '0',
  `title` varchar(512) DEFAULT NULL,
  `company_name` varchar(128) DEFAULT NULL,
  `sort_name` varchar(64) DEFAULT NULL,
  `logo` varchar(128) DEFAULT NULL,
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址 ',
  `region` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '区域id ',
  `main_business` varchar(128) DEFAULT NULL COMMENT '主营业务',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '公司性质',
  `scale` tinyint(1) NOT NULL DEFAULT '0' COMMENT '公司规模',
  `industry_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属行业',
  `bg_year` varchar(32) DEFAULT NULL COMMENT '成立日期',
  `name` varchar(64) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `zhiwu` varchar(64) DEFAULT NULL,
  `vip` tinyint(1) DEFAULT '0' COMMENT '0',
  `vip_expire` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'vip过期时间',
  `view_num` int(11) DEFAULT '0',
  `tel_num` int(11) DEFAULT '0',
  `yuyue_num` int(11) DEFAULT '0',
  `zan_num` int(11) NOT NULL DEFAULT '0',
  `share_num` int(11) DEFAULT '0',
  `detail` varchar(1024) DEFAULT '' COMMENT '商家介绍',
  `audit_photo` varchar(128) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0' COMMENT '0 等待审核 1审核成功 2审核失败',
  `is_gopublic` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已上市',
  `orderby` int(11) DEFAULT '0',
  `qrcode` text NOT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `job_num` tinyint(3) unsigned DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`company_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_company` */

/*Table structure for table `wxb_job_company_pics` */

DROP TABLE IF EXISTS `wxb_job_company_pics`;

CREATE TABLE `wxb_job_company_pics` (
  `pic_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=188 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_company_pics` */

/*Table structure for table `wxb_job_industry` */

DROP TABLE IF EXISTS `wxb_job_industry`;

CREATE TABLE `wxb_job_industry` (
  `industry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `industry_name` varchar(64) NOT NULL DEFAULT '',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`industry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_industry` */

/*Table structure for table `wxb_job_order` */

DROP TABLE IF EXISTS `wxb_job_order`;

CREATE TABLE `wxb_job_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL COMMENT '小程序id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员',
  `company_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '公司id',
  `price_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格id',
  `by_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买时长',
  `vip_level` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '赠送的等级',
  `total_price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '一共需要支付',
  `pay_money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已支付余额',
  `lijian` int(11) DEFAULT '0',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_info` text,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未支付8已完成',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`order_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_order` */

/*Table structure for table `wxb_job_price` */

DROP TABLE IF EXISTS `wxb_job_price`;

CREATE TABLE `wxb_job_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT NULL,
  `day_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '特权天数',
  `price` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  `add_time` int(11) DEFAULT NULL,
  `vip_level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'vip  等级一到十',
  `add_ip` varchar(15) DEFAULT NULL,
  `orderby` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`price_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_price` */

/*Table structure for table `wxb_job_privilege` */

DROP TABLE IF EXISTS `wxb_job_privilege`;

CREATE TABLE `wxb_job_privilege` (
  `member_miniapp_id` int(11) unsigned NOT NULL,
  `privilege` text NOT NULL COMMENT '特权说明',
  `explain` text NOT NULL COMMENT '充值说明',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`member_miniapp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_privilege` */

/*Table structure for table `wxb_job_resume` */

DROP TABLE IF EXISTS `wxb_job_resume`;

CREATE TABLE `wxb_job_resume` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1男2女',
  `birthday` date NOT NULL,
  `census_register` varchar(124) NOT NULL DEFAULT '' COMMENT '户口所在地',
  `residence` varchar(124) NOT NULL DEFAULT '' COMMENT '现居住地',
  `workingyears` date NOT NULL COMMENT '工作开始年份',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `emal` varchar(124) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(11) NOT NULL DEFAULT '' COMMENT 'qq',
  `relative_tel` char(11) NOT NULL DEFAULT '' COMMENT '亲戚电话',
  `politicalstatus_id` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '整治面貌',
  `marriage_id` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '婚姻状态',
  `nature_id` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '求职性质',
  `salary` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '月薪要求',
  `height` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '身高',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `open_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '公开状态 1 只有我投递公司可以查看 0 任何公司都可以查询到',
  `industry_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '行业要求',
  `skill_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '职业技能',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序时间戳排序',
  `add_time` int(11) DEFAULT '0',
  `work_address` varchar(255) NOT NULL DEFAULT '' COMMENT '最佳工作地址',
  `add_ip` varchar(15) DEFAULT '',
  `this_salary` int(11) unsigned NOT NULL DEFAULT '0',
  `id_card` char(18) NOT NULL DEFAULT '',
  `introduction` text NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_resume` */

insert  into `wxb_job_resume`(`user_id`,`member_miniapp_id`,`name`,`sex`,`birthday`,`census_register`,`residence`,`workingyears`,`mobile`,`emal`,`qq`,`relative_tel`,`politicalstatus_id`,`marriage_id`,`nature_id`,`salary`,`height`,`status`,`open_status`,`industry_ids`,`skill_ids`,`orderby`,`add_time`,`work_address`,`add_ip`,`this_salary`,`id_card`,`introduction`) values (1705,182,'马风卿',1,'2017-12-13','兰州','小西湖','2013-10-13','18152059511','1159749111@qq.com','1159749111','13919874318',1,1,2,5,180,2,0,'13','',0,1513153274,'小西湖','42.90.177.16',5000,'620103199001080614','');

/*Table structure for table `wxb_job_resume_certificate` */

DROP TABLE IF EXISTS `wxb_job_resume_certificate`;

CREATE TABLE `wxb_job_resume_certificate` (
  `certificate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL COMMENT '获得时间',
  `certificate_name` varchar(20) DEFAULT NULL COMMENT '证书名称',
  `score` tinyint(3) NOT NULL DEFAULT '0' COMMENT '成绩',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`certificate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_resume_certificate` */

/*Table structure for table `wxb_job_resume_company` */

DROP TABLE IF EXISTS `wxb_job_resume_company`;

CREATE TABLE `wxb_job_resume_company` (
  `company_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bgdate` date NOT NULL COMMENT '公司开始时间',
  `enddate` date NOT NULL COMMENT '公司结束时间',
  `company_industry` varchar(64) NOT NULL DEFAULT '0' COMMENT '所属行业',
  `company_name` varchar(64) NOT NULL DEFAULT '' COMMENT '公司名称',
  `company_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '公司性质',
  `company_division` varchar(64) NOT NULL DEFAULT '' COMMENT '所属部门',
  `company_position` varchar(64) NOT NULL DEFAULT '' COMMENT '职位负则',
  `company_salary` varchar(64) NOT NULL DEFAULT '' COMMENT '平均薪水',
  `company_detail` text NOT NULL COMMENT '工作描述',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`company_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_resume_company` */

/*Table structure for table `wxb_job_resume_honor` */

DROP TABLE IF EXISTS `wxb_job_resume_honor`;

CREATE TABLE `wxb_job_resume_honor` (
  `honor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL COMMENT '获得时间',
  `honor_name` varchar(20) DEFAULT NULL COMMENT '奖项名称',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`honor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_resume_honor` */

/*Table structure for table `wxb_job_resume_language` */

DROP TABLE IF EXISTS `wxb_job_resume_language`;

CREATE TABLE `wxb_job_resume_language` (
  `language_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '级别',
  `language` varchar(24) NOT NULL DEFAULT '' COMMENT '语言',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_resume_language` */

/*Table structure for table `wxb_job_resume_position` */

DROP TABLE IF EXISTS `wxb_job_resume_position`;

CREATE TABLE `wxb_job_resume_position` (
  `position_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bg_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '开始时间',
  `end_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '结束时间',
  `position_name` varchar(20) DEFAULT NULL COMMENT '职务名称',
  `position_describe` text NOT NULL COMMENT '职务描述',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`position_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_resume_position` */

/*Table structure for table `wxb_job_resume_practice` */

DROP TABLE IF EXISTS `wxb_job_resume_practice`;

CREATE TABLE `wxb_job_resume_practice` (
  `practice_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bg_date` date NOT NULL COMMENT '项目开始时间',
  `end_date` date NOT NULL COMMENT '项目结束时间',
  `practice_name` varchar(20) DEFAULT NULL COMMENT '实践名称',
  `practice_describe` text NOT NULL COMMENT '培训描述',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`practice_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_resume_practice` */

/*Table structure for table `wxb_job_resume_project` */

DROP TABLE IF EXISTS `wxb_job_resume_project`;

CREATE TABLE `wxb_job_resume_project` (
  `project_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bg_date` date NOT NULL COMMENT '项目开始时间',
  `end_date` date NOT NULL COMMENT '项目结束时间',
  `project_name` varchar(64) NOT NULL DEFAULT '' COMMENT '项目名称',
  `project_describe` text NOT NULL COMMENT '项目描述',
  `duty_describe` text NOT NULL COMMENT '职责描述',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `company_name` varchar(64) DEFAULT '',
  PRIMARY KEY (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_resume_project` */

/*Table structure for table `wxb_job_resume_school` */

DROP TABLE IF EXISTS `wxb_job_resume_school`;

CREATE TABLE `wxb_job_resume_school` (
  `school_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bgdate` date NOT NULL DEFAULT '0000-00-00' COMMENT '教育开始时间',
  `enddate` date NOT NULL COMMENT '教育结束时间',
  `school_name` varchar(64) NOT NULL DEFAULT '' COMMENT '学校名字',
  `education_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '获得学历',
  `is_tz` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是统招',
  `major` varchar(64) NOT NULL DEFAULT '' COMMENT '专业',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`school_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_resume_school` */

/*Table structure for table `wxb_job_resume_train` */

DROP TABLE IF EXISTS `wxb_job_resume_train`;

CREATE TABLE `wxb_job_resume_train` (
  `train_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bg_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '培训开始时间',
  `end_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '培训结束时间',
  `train_name` varchar(64) NOT NULL DEFAULT '' COMMENT '培训单位',
  `train_calss` varchar(64) NOT NULL DEFAULT '' COMMENT '培训科目',
  `train_describe` text NOT NULL COMMENT '培训描述',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`train_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_resume_train` */

/*Table structure for table `wxb_job_user_count` */

DROP TABLE IF EXISTS `wxb_job_user_count`;

CREATE TABLE `wxb_job_user_count` (
  `user_id` int(10) unsigned NOT NULL,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `look_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '企业查看数',
  `inviter_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邀请数量',
  `apply_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '申请数',
  `whole` tinyint(3) NOT NULL DEFAULT '0' COMMENT '简历完成百分比',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_job_user_count` */

/*Table structure for table `wxb_ktv` */

DROP TABLE IF EXISTS `wxb_ktv`;

CREATE TABLE `wxb_ktv` (
  `member_miniapp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `trade` varchar(64) NOT NULL DEFAULT '' COMMENT '营业时间',
  `tel` varchar(12) NOT NULL DEFAULT '' COMMENT '联系方式',
  `introduce` text NOT NULL COMMENT '介绍',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `ktv_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_ktv` */

/*Table structure for table `wxb_ktv_banner` */

DROP TABLE IF EXISTS `wxb_ktv_banner`;

CREATE TABLE `wxb_ktv_banner` (
  `banner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_ktv_banner` */

/*Table structure for table `wxb_ktv_enroll` */

DROP TABLE IF EXISTS `wxb_ktv_enroll`;

CREATE TABLE `wxb_ktv_enroll` (
  `enroll_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `room_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机',
  `enroll_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '预约日期',
  `enroll_time` smallint(6) NOT NULL DEFAULT '0' COMMENT '预约时长',
  `enroll_room_price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '预约时 包间价格',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0等待接单 1已接单并转入订单 2拒绝预约',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `user_id` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`enroll_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_ktv_enroll` */

/*Table structure for table `wxb_ktv_order` */

DROP TABLE IF EXISTS `wxb_ktv_order`;

CREATE TABLE `wxb_ktv_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL COMMENT '小程序id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员',
  `room_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '房源id',
  `total_price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '一共需要支付',
  `need_pay` int(11) DEFAULT '0',
  `pay_money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已支付余额',
  `pay_coupon` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券',
  `pay_coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠卷id',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_info` text,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `mobile` char(11) NOT NULL DEFAULT '0' COMMENT '联系人手机',
  `idcard` varchar(18) DEFAULT NULL,
  `enroll_date` varchar(64) NOT NULL DEFAULT '' COMMENT '预约日期',
  `enroll_time` smallint(6) NOT NULL DEFAULT '0' COMMENT '预约时长',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未支付 1已支付  8完成',
  `cancel_type` tinyint(1) unsigned DEFAULT '0' COMMENT '1用户取消2:商户取消',
  `cancel_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `cancel_info` varchar(150) NOT NULL DEFAULT '' COMMENT '取消理由',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：会员订单不显示',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_ktv_order` */

/*Table structure for table `wxb_ktv_room` */

DROP TABLE IF EXISTS `wxb_ktv_room`;

CREATE TABLE `wxb_ktv_room` (
  `room_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '标题',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `enroll_time` varchar(64) NOT NULL DEFAULT '' COMMENT '可预约时间段',
  `enroll_length` varchar(64) NOT NULL DEFAULT '' COMMENT '可预约时长',
  `enroll_date` varchar(64) NOT NULL DEFAULT '' COMMENT '可预约日期',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `orderby` int(11) DEFAULT '0',
  PRIMARY KEY (`room_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_ktv_room` */

/*Table structure for table `wxb_ktv_room_photo` */

DROP TABLE IF EXISTS `wxb_ktv_room_photo`;

CREATE TABLE `wxb_ktv_room_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `room_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_ktv_room_photo` */

/*Table structure for table `wxb_login_log` */

DROP TABLE IF EXISTS `wxb_login_log`;

CREATE TABLE `wxb_login_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manage_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登陆者的id',
  `day` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当天登录日期',
  `login_num` tinyint(2) NOT NULL DEFAULT '0' COMMENT '当天登录次数',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `manger_id` (`manage_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_login_log` */

/*Table structure for table `wxb_love` */

DROP TABLE IF EXISTS `wxb_love`;

CREATE TABLE `wxb_love` (
  `user_id` int(10) unsigned NOT NULL,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `nickname` varchar(64) NOT NULL DEFAULT '',
  `photo` varchar(155) NOT NULL DEFAULT '' COMMENT '头像',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1男 2女 0 保密',
  `height` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '身高 单位cm',
  `salary` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '工资',
  `city` varchar(64) NOT NULL DEFAULT '' COMMENT '所在地址',
  `education` tinyint(1) NOT NULL DEFAULT '0' COMMENT '学历',
  `marriage` tinyint(1) NOT NULL DEFAULT '0' COMMENT '婚姻状态',
  `posture` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '体态',
  `weight` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '体重',
  `child` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有小孩',
  `want_child` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否想要孩子',
  `work` varchar(64) NOT NULL DEFAULT '' COMMENT '工作',
  `is_car` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0没买车 1 一买车',
  `is_smoke` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 不吸烟 ， 1 吸烟',
  `is_alcohol` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 不喝酒 ， 1 喝酒',
  `constellation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '星座',
  `race` varchar(64) NOT NULL DEFAULT '' COMMENT '种族',
  `marry` tinyint(1) NOT NULL DEFAULT '0' COMMENT '何时结婚',
  `introduce` text NOT NULL COMMENT '内心独白',
  `vip_overdue` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_love` */

/*Table structure for table `wxb_love_im` */

DROP TABLE IF EXISTS `wxb_love_im`;

CREATE TABLE `wxb_love_im` (
  `im_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msg` varchar(248) NOT NULL DEFAULT '' COMMENT '消息内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1 已查看',
  `from_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来自哪个会员',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '接送会员id',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `member_miniapp_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`im_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_love_im` */

/*Table structure for table `wxb_love_msg` */

DROP TABLE IF EXISTS `wxb_love_msg`;

CREATE TABLE `wxb_love_msg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `from_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来自哪个会员',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `add_ip` varchar(15) NOT NULL DEFAULT '',
  `num` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(11) unsigned NOT NULL DEFAULT '0',
  `msg_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`msg_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_love_msg` */

/*Table structure for table `wxb_love_price` */

DROP TABLE IF EXISTS `wxb_love_price`;

CREATE TABLE `wxb_love_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) NOT NULL DEFAULT '0',
  `days` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '服务天数',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`price_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_love_price` */

/*Table structure for table `wxb_love_price_log` */

DROP TABLE IF EXISTS `wxb_love_price_log`;

CREATE TABLE `wxb_love_price_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) NOT NULL DEFAULT '0',
  `price_id` int(11) NOT NULL DEFAULT '0',
  `user_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_love_price_log` */

/*Table structure for table `wxb_love_setting` */

DROP TABLE IF EXISTS `wxb_love_setting`;

CREATE TABLE `wxb_love_setting` (
  `member_miniapp_id` int(10) unsigned NOT NULL,
  `privilege` text NOT NULL,
  `explain` text NOT NULL,
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`member_miniapp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_love_setting` */

/*Table structure for table `wxb_love_spouse` */

DROP TABLE IF EXISTS `wxb_love_spouse`;

CREATE TABLE `wxb_love_spouse` (
  `user_id` int(10) unsigned NOT NULL,
  `age` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '年龄',
  `height` varchar(24) NOT NULL DEFAULT '0' COMMENT '身高',
  `salary` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '工资',
  `posture` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '体态',
  `weight` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '体重',
  `city` varchar(64) NOT NULL DEFAULT '' COMMENT '所在地址',
  `education` tinyint(1) NOT NULL DEFAULT '0' COMMENT '学历',
  `marriage` tinyint(1) NOT NULL DEFAULT '0' COMMENT '婚姻状态',
  `child` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有小孩',
  `want_child` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否想要孩子',
  `work` varchar(64) NOT NULL DEFAULT '' COMMENT '工作',
  `is_car` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0没买车 1 一买车',
  `is_smoke` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 不吸烟 ， 1 吸烟',
  `is_alcohol` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 不喝酒 ， 1 喝酒',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `member_miniapp_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_love_spouse` */

/*Table structure for table `wxb_love_user_photo` */

DROP TABLE IF EXISTS `wxb_love_user_photo`;

CREATE TABLE `wxb_love_user_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `member_miniapp_id` int(11) unsigned NOT NULL DEFAULT '0',
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_love_user_photo` */

/*Table structure for table `wxb_member` */

DROP TABLE IF EXISTS `wxb_member`;

CREATE TABLE `wxb_member` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` char(11) NOT NULL DEFAULT '0' COMMENT '手机号',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1普通用户 2普通代理商 3合作伙伴 4OEM代理',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `nick_name` varchar(64) NOT NULL DEFAULT '' COMMENT '昵称',
  `real_name` varchar(45) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(11) NOT NULL DEFAULT '' COMMENT 'qq号',
  `weixin` varchar(45) NOT NULL DEFAULT '' COMMENT '微信',
  `money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '余额',
  `sms_num` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '短信剩余条数',
  `is_deposit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已交押金，如果已支付押金 凭微信支付凭证退还',
  `last_time` int(11) DEFAULT '0',
  `last_ip` varchar(15) DEFAULT '',
  `is_lock` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `nick_dltitle` varchar(126) NOT NULL DEFAULT '' COMMENT '微点应用',
  `nick_dllogo` varchar(255) NOT NULL DEFAULT '' COMMENT '代理商LOGO',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=249 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_member` */

insert  into `wxb_member`(`member_id`,`mobile`,`type`,`password`,`nick_name`,`real_name`,`email`,`qq`,`weixin`,`money`,`sms_num`,`is_deposit`,`last_time`,`last_ip`,`is_lock`,`add_time`,`add_ip`,`nick_dltitle`,`nick_dllogo`) values (242,'18124542930',0,'c8837b23ff8aaa8a2dde915473ce0991','用户2930','','','','',0,0,0,0,'',0,1515493903,'113.85.195.176','',''),(243,'13400719695',0,'a3282c2956e50759d4052c63699a7a7f','用户9695','','','','',0,0,0,0,'',0,1515688235,'111.128.188.79','',''),(244,'15050500325',0,'d6762efdaf38206338af9a1d1c9f3754','用户0325','','','','',0,0,0,0,'',0,1515744022,'58.222.254.74','',''),(245,'15853189367',0,'5b1bd39e4c04de446efd43891a0a2fe8','用户9367','','','','',0,0,0,0,'',0,1515920724,'113.123.126.205','',''),(241,'18291818130',0,'8877a06e59fec788258cec52dc277e49','用户8130','','','','',0,0,0,0,'',0,1515447996,'117.35.88.212','',''),(237,'15169991113',3,'e5ccc8270cd29ba187ddde8f864438ee','用户1113','','','','',987250,0,0,1516067994,'222.134.33.194',0,1515389551,'222.134.33.194','','20180108\\5de9a9b2c6ac158b671cc2c382c35212.png'),(238,'17375483770',0,'e10adc3949ba59abbe56e057f20f883e','用户3770','','','','',0,0,0,1529651339,'127.0.0.1',0,1515397506,'183.162.132.176','',''),(239,'13666661111',0,'0ab44bd43d6b18fcd5cd928d6faab1b8','用户1111','','','','',0,0,0,1515480923,'117.150.125.85',0,1515419601,'43.227.137.36','',''),(240,'15703509048',0,'4784986c8670beae7664189fbb159397','用户9048','','','','',0,0,0,0,'',0,1515421656,'171.125.96.165','',''),(246,'15169911111',0,'96e79218965eb72c92a549dd5a330112','用户1111','','','','',134500,0,0,1516030555,'112.245.240.78',0,1516015478,'112.245.240.78','',''),(247,'18888778896',0,'4749b067d3a1385a0012088ec74924b6','用户8896','','','','',0,0,0,1516033778,'115.197.109.207',0,1516033148,'115.197.109.207','',''),(248,'15520449931',3,'e336eba1ffb59e5632e16ceec58d3f74','用户9931','唐彰','it_tangzhang@aliyun.com','861136242','a861136242',983120,0,0,1529650144,'127.0.0.1',0,1529559008,'127.0.0.1','iamguao','iamguao\\logo.jpg');

/*Table structure for table `wxb_member_miniapp` */

DROP TABLE IF EXISTS `wxb_member_miniapp`;

CREATE TABLE `wxb_member_miniapp` (
  `member_miniapp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `appkey` char(32) DEFAULT NULL,
  `miniapp_id` int(11) DEFAULT '0',
  `authorizer_appid` varchar(32) DEFAULT NULL,
  `authorizer_access_token` varchar(512) DEFAULT NULL,
  `authorizer_refresh_token` varchar(512) DEFAULT NULL,
  `authorizer_refresh_token_expir_time` int(11) DEFAULT NULL,
  `nick_name` varchar(64) DEFAULT NULL,
  `head_img` varchar(512) DEFAULT NULL,
  `sms_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户分配的短信条数',
  `user_name` varchar(255) DEFAULT NULL,
  `qrcode_url` varchar(512) DEFAULT NULL,
  `principal_name` varchar(128) DEFAULT NULL,
  `signature` varchar(512) DEFAULT NULL,
  `expir_time` int(11) DEFAULT '0',
  `version` varchar(10) DEFAULT '0.0.0',
  `status` tinyint(1) DEFAULT '0' COMMENT '0暂未提交代码 1等待发布  2、等待腾讯审核 3、审核通过等待发布  8、正常上线  4、审核拒绝',
  `error` varchar(1024) DEFAULT NULL,
  `is_case` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否设置为成功案例',
  `photo` varchar(255) DEFAULT '' COMMENT '二维码图片',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `is_view` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是可视化 1是',
  PRIMARY KEY (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=184 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_member_miniapp` */

insert  into `wxb_member_miniapp`(`member_miniapp_id`,`member_id`,`appkey`,`miniapp_id`,`authorizer_appid`,`authorizer_access_token`,`authorizer_refresh_token`,`authorizer_refresh_token_expir_time`,`nick_name`,`head_img`,`sms_num`,`user_name`,`qrcode_url`,`principal_name`,`signature`,`expir_time`,`version`,`status`,`error`,`is_case`,`photo`,`add_time`,`add_ip`,`is_view`) values (180,238,'e72f769f926ce2d301a50ec1d55f80dc',37,'wxcbac8f5255a697b0','5_YSDh-7zIA3rx4jFb00s-m5xNDerLT9HexrfEr1ZVlqRa-ESel-LVD982yj2WGre0Q04PhyPc8dlCHzu05exCCFD2ZjZxNDBl2HlSlF6nt1aAHj78dPuKVGMAdGlE2CDUmzyzMep5JdDZ5VMlDBScAFDGEV','refreshtoken@@@cIdGdYOA6aBgFXQ0FbLiTRq8L9s3va84qFyQRQnYaCU',1515404672,'新桐科技+','http://wx.qlogo.cn/mmopen/eQn82IQxG53VCHavj1lodYqlocprTe95MuplLlveRLrdRibwPdA1a1at1pyC94xewuZYUd0l0dK33smvCfY7sp11NKuQysVGB/0',0,'gh_1a52d9d08478','http://mmbiz.qpic.cn/mmbiz_jpg/SrOszADcRqnc7icMtX3Ff7sQMFWMXt84z4vu7J7ogwTqEf8kgNlWZ2DZF9gO581VHIprxSvGK82mN7IBtpyMnGw/0','六安新桐文化传媒有限公司','网络服务',1561098326,'1.1.0',0,NULL,0,'',1515397670,'58.63.65.2',0);

/*Table structure for table `wxb_member_miniapp_copy` */

DROP TABLE IF EXISTS `wxb_member_miniapp_copy`;

CREATE TABLE `wxb_member_miniapp_copy` (
  `member_miniapp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `appkey` char(32) DEFAULT NULL,
  `miniapp_id` int(11) DEFAULT '0',
  `authorizer_appid` varchar(32) DEFAULT NULL,
  `authorizer_access_token` varchar(512) DEFAULT NULL,
  `authorizer_refresh_token` varchar(512) DEFAULT NULL,
  `authorizer_refresh_token_expir_time` int(11) DEFAULT NULL,
  `nick_name` varchar(64) DEFAULT NULL,
  `head_img` varchar(512) DEFAULT NULL,
  `sms_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户分配的短信条数',
  `user_name` varchar(255) DEFAULT NULL,
  `qrcode_url` varchar(512) DEFAULT NULL,
  `principal_name` varchar(128) DEFAULT NULL,
  `signature` varchar(512) DEFAULT NULL,
  `expir_time` int(11) DEFAULT '0',
  `version` varchar(10) DEFAULT '0.0.0',
  `status` tinyint(1) DEFAULT '0' COMMENT '0暂未提交代码 1等待发布  2、等待腾讯审核 3、审核通过等待发布  8、正常上线  4、审核拒绝',
  `error` varchar(1024) DEFAULT NULL,
  `is_case` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否设置为成功案例',
  `photo` varchar(255) DEFAULT '' COMMENT '二维码图片',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `is_view` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是可视化 1是',
  PRIMARY KEY (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_member_miniapp_copy` */

/*Table structure for table `wxb_member_miniapp_template_message` */

DROP TABLE IF EXISTS `wxb_member_miniapp_template_message`;

CREATE TABLE `wxb_member_miniapp_template_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT '0',
  `template` varchar(32) DEFAULT NULL,
  `template_id` varchar(64) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_member_miniapp_template_message` */

/*Table structure for table `wxb_member_pay_sms` */

DROP TABLE IF EXISTS `wxb_member_pay_sms`;

CREATE TABLE `wxb_member_pay_sms` (
  `pay_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sms_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作短信数',
  `this_sms_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前剩余短信数',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `way` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1充值短信，2分配给小程序短信',
  `is_consume` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1支出，2收入',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`pay_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_member_pay_sms` */

/*Table structure for table `wxb_member_payment` */

DROP TABLE IF EXISTS `wxb_member_payment`;

CREATE TABLE `wxb_member_payment` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT '0',
  `money` int(11) DEFAULT '0',
  `is_paid` tinyint(1) DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_member_payment` */

/*Table structure for table `wxb_member_sms_log` */

DROP TABLE IF EXISTS `wxb_member_sms_log`;

CREATE TABLE `wxb_member_sms_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) NOT NULL DEFAULT '0' COMMENT '小程序id',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_mobile` char(11) NOT NULL DEFAULT '' COMMENT '发送该用户 为0 是则为自己充值',
  `sms_content` varchar(64) NOT NULL DEFAULT '' COMMENT '短信内容',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_member_sms_log` */

/*Table structure for table `wxb_mendian_order` */

DROP TABLE IF EXISTS `wxb_mendian_order`;

CREATE TABLE `wxb_mendian_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `total_money` int(11) DEFAULT '0',
  `pay_coupon` int(11) DEFAULT '0',
  `pay_money` int(11) DEFAULT '0',
  `is_paid` tinyint(1) DEFAULT '0' COMMENT '1 代表已经支付',
  `pay_time` int(11) DEFAULT '0',
  `pay_info` text,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_mendian_order` */

/*Table structure for table `wxb_mendian_photo` */

DROP TABLE IF EXISTS `wxb_mendian_photo`;

CREATE TABLE `wxb_mendian_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT '0',
  `photo` varchar(256) DEFAULT NULL,
  `orderby` int(11) DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_mendian_photo` */

/*Table structure for table `wxb_mendian_setting` */

DROP TABLE IF EXISTS `wxb_mendian_setting`;

CREATE TABLE `wxb_mendian_setting` (
  `member_miniapp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `banner` varchar(256) DEFAULT NULL,
  `logo` varchar(256) DEFAULT NULL,
  `addr` varchar(128) DEFAULT NULL,
  `gps_addr` varchar(256) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `is_wifi` tinyint(1) DEFAULT '0',
  `is_p` tinyint(1) DEFAULT '0' COMMENT '是否有停车场',
  `is_weixin` tinyint(1) DEFAULT '0',
  `is_alipay` tinyint(1) DEFAULT '0',
  `biz_t` varchar(128) DEFAULT NULL COMMENT '营业时间',
  `info` text COMMENT '介绍',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_mendian_setting` */

/*Table structure for table `wxb_miniapp` */

DROP TABLE IF EXISTS `wxb_miniapp`;

CREATE TABLE `wxb_miniapp` (
  `miniapp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '展示图片',
  `version` varchar(10) NOT NULL DEFAULT '1.0.0' COMMENT '版本号',
  `expire_day` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '过期天数 0为永不过期',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格0为免费',
  `activity_price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动价格',
  `template_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模板id',
  `miniapp_dir` varchar(150) NOT NULL DEFAULT '' COMMENT '小程序目录',
  `is_online` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1上架0下架 下架 则不显示在商店',
  `describe` varchar(255) DEFAULT NULL COMMENT '基本描述',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序 排序规则降序',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `qrcode` varchar(150) DEFAULT '' COMMENT '演示二维码',
  PRIMARY KEY (`miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_miniapp` */

insert  into `wxb_miniapp`(`miniapp_id`,`title`,`photo`,`version`,`expire_day`,`price`,`activity_price`,`template_id`,`miniapp_dir`,`is_online`,`describe`,`orderby`,`add_time`,`add_ip`,`qrcode`) values (3,'酒店预定小程序','20170821/40fd3f65e7fb9ea9373592e04856f2bb.png','1.0.0',7,188800,988800,29,'hotel',1,'类似去哪儿酒店预订、美团酒店预订的一款酒店预订平台小程序\r\n适用于手上有酒店资源的运营者运营',26,1500690678,'127.0.0.1',''),(4,'民宿预定小程序','20170821/45e8e6fc1ad2c0ca0ed2a0633f3fb49a.png','1.0.1',7,198800,988800,27,'minsu',1,'民宿小程序是一款类似途家、小猪短租、榛果民宿的民宿类预定平台小程序，\r\n应用适合民宿类资源拥有这建立平台。',24,1500886698,'127.0.0.1',''),(5,'周边游线路门票套餐','20170821/8609c462b149087119d5402b35e05727.png','1.0.0',7,198800,988800,30,'taocan',1,'适用于周边游、亲子游、门票预订等旅游平台运营者，周边游亲子游是一种旅游趋势。',27,1502101927,'127.0.0.1',''),(7,'定制旅游小程序','20170821/f44f7ef8f637b1adab628c0de43df89d.png','1.0.0',7,58800,380000,5,'customized',1,'定制旅游是一款类似途牛定制游的在线报名的小程序，功能主要是为了收集定制旅游的用户信息',4,1502103168,'127.0.0.1',''),(8,'头条文章小程序','20170821/f03f90e4af7ed5c1e79e5216abf1abf5.png','1.0.0',7,28800,380000,11,'toutiao',1,'一款类似于今日头条、UC头条的微信小程序',10,1502103298,'127.0.0.1',''),(13,'农家乐官网小程序','20170821/e4e540363b1ad2a385cb818f7b0d115c.png','1.0.0',7,88800,568800,26,'njlgw',1,'农家乐官网是一款针对于农家乐、民宿的官网小程序！',23,1502105166,'127.0.0.1',''),(14,'小视频小程序','20170821/cf8b16dae03bbc6760e4eb72c28dc3f2.png','1.0.0',7,28800,500000,10,'video',1,'小视频小程序',9,1503277444,'127.0.0.1',''),(15,'商家114小程序','20170821/6623e56445fd099413c9602e9fcb0627.png','1.0.0',7,88000,680000,13,'company',1,'商家114小程序是一款收集本地企业的微信小程序，给其他提供了更好的在线服务！',12,1503280546,'127.0.0.1','20170831/192da79f0bf12f54ff7d3f299ab7da9b.jpg'),(16,'婚庆小程序','20170821/a7c19c350cc758d3f72278bb3fd48f8a.png','1.0.0',7,88000,680000,7,'hunqing',1,'婚庆小程序是一款，在线预订酒店、预订婚纱摄影等婚庆平台小程序',6,1503302310,'127.0.0.1','20170831/d738d2d7cdc201a5047a41df8c4064ea.jpg'),(17,'装修门户小程序','20170821/39ad11c7f05540912538c6b58c7641fb.png','1.1.0',7,68000,680000,8,'zhuangxiu',1,'装修小程序是一款在线选择装修公司，看案例，报名预约装修的小程序',7,1503302395,'127.0.0.1',''),(19,'酒店预小程序（商家版）','20170830/c7b25030bfd2b96b03368455bd964cda.png','1.2.0',7,58000,528800,6,'hotelgw',1,'酒店预订小程序（商家版）',5,1503650358,'127.0.0.1',''),(20,'公司官网A','20170830/faaa85dc3e8189594707ef628b04642b.png','1.1.0',7,38800,388800,2,'companygw',1,'公司官网小程序',2,1503908047,'127.0.0.1','20170831/575585b1d998273ae14fa47b5b1299ec.jpg'),(22,'人才招聘小程序','20170906\\828b9d8f93e64698bf94c484d35a89d3.png','1.0.0',7,128800,188800,22,'jobs',1,'人才招聘小程序',19,1504162751,'127.0.0.1',''),(23,'学校培训机构小程序','20170906\\c853bd6bc0475b652ebfce3a376800a7.png','1.0.0',7,88800,168800,19,'school',1,'教育官网小程序',16,1504676655,'127.0.0.1',''),(24,'外卖单店小程序','20170911\\2e2a11ce89f0ed74f6b7577ca2b68e4e.png','1.0.0',7,88800,580000,25,'waimai',1,'外卖小程序是一款适用于自己通过微信营销的外卖商家！通过附近的店铺群营销来推广',22,1504750984,'127.0.0.1',''),(25,'拼团小程序','20170908\\c5ac7d25f3d77914ccc266a971a65f3f.png','1.0.0',7,98800,188800,21,'group',1,'拼团小程序',18,1504851263,'127.0.0.1',''),(26,'门店收银小程序','20170911\\35430322335088b1afdf9f001f60c12f.png','1.0.0',7,28800,580000,15,'mendian',1,'门店收银小程序是一款商家的在线收银的小程序',14,1505095544,'127.0.0.1',''),(27,'B2C电商小程序','20171023\\38fb79c4a4be51658f95d606eaa05bd1.png','1.0.0',7,168800,588800,31,'shop',1,'B2C商务小程序',28,1505115529,'127.0.0.1',''),(28,'装修公司装企营销','20170926/a538b95c6b37ba2e5a2c2ab7393ccc54.png','1.0.0',7,168800,228800,9,'zhuangxiugw',1,'装修小程序',8,1505642325,'127.0.0.1',''),(29,'美容美发SPA养生','20170926/59214c3df7f3aa2cbee1c27739161cbd.png','1.0.0',7,88800,198800,20,'lifa',1,'理发店小程序',17,1505811733,'127.0.0.1',''),(30,'婚纱店官网','20170926/2eb7193a57797a34ac3a8f8ab5b0a295.png','1.0.0',7,128800,168800,14,'sheying',1,'婚纱摄影官网',13,1505901185,'127.0.0.1',''),(31,'饭店/餐馆/ktv-预定','20171016\\e162c17ca355921a6d90e29a22e397d9.png','1.1.0',7,128800,168800,28,'ktv',1,'KTV预定小程序',25,1505962777,'127.0.0.1',''),(32,'同城信息','20170926/e2fae5cfab7d3b01f3e7b9c757abd393.png','1.0.0',7,128800,368800,12,'tongcheng',1,'同城信息小程序',11,1506069950,'127.0.0.1',''),(33,'家政维修小程序','20171016\\c7f9f44089fe6024ab4b5505fb3a0a29.png','1.0.0',7,168800,188800,16,'jzfw',1,'家政服务小程序',15,1507527252,'127.0.0.1',''),(34,'医疗预约','20171020\\c1f6e364b5255c6e2922a23bd449bbbf.png','1.0.0',7,588800,688800,23,'yiliao',1,'医疗预约小程序',20,1508132657,'127.0.0.1',''),(35,'拼车小程序','20171020\\01714092d4d29576c8f89a67dbc11aed.png','1.0.0',7,168800,188800,24,'pinche',1,'拼车小程序',21,1508220956,'127.0.0.1',''),(37,'B2C电商升级版','20171023\\0b58ce89414f08f0ef1ef641091611c1.png','1.1.0',7,168800,188800,32,'shop2',1,'B2C电商升级版',29,1508562011,'127.0.0.1',''),(38,'企业官网C','20171025\\18cf5231b19f679fc9c32a93f7bdcaa4.png','1.2.0',7,118800,168800,4,'companygw',1,'公司官网2',4,1508915903,'127.0.0.1',''),(39,'公司官网B','20171025\\218af95cfa8e7d9ca7a244140ab8c256.png','1.1.0',7,168800,198800,3,'companygw',1,'公司官网2',3,1508915982,'127.0.0.1','');

/*Table structure for table `wxb_miniapp_appoint` */

DROP TABLE IF EXISTS `wxb_miniapp_appoint`;

CREATE TABLE `wxb_miniapp_appoint` (
  `appoint_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`appoint_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_miniapp_appoint` */

/*Table structure for table `wxb_miniapp_describe` */

DROP TABLE IF EXISTS `wxb_miniapp_describe`;

CREATE TABLE `wxb_miniapp_describe` (
  `describe_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `describe` text,
  `photo` varchar(155) DEFAULT '0' COMMENT '图片介绍',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序  排序规则为 升序',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`describe_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_miniapp_describe` */

/*Table structure for table `wxb_miniapp_manage` */

DROP TABLE IF EXISTS `wxb_miniapp_manage`;

CREATE TABLE `wxb_miniapp_manage` (
  `manage_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '授权此管理员员的小程序id',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  `app_key` char(32) NOT NULL DEFAULT '' COMMENT '授权此管理员的小程序appkey（平台秘钥）',
  `authorizer_appid` char(32) NOT NULL DEFAULT '' COMMENT '授权此管理员的',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '管理员账号',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '授权人密码',
  `role_name` varchar(64) NOT NULL DEFAULT '' COMMENT '授权人角色名称',
  `mange_name` varchar(64) NOT NULL DEFAULT '' COMMENT '授权人姓名',
  `is_lock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定',
  `last_time` int(11) DEFAULT NULL,
  `last_ip` varchar(15) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `hotel_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '酒店id',
  PRIMARY KEY (`manage_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_miniapp_manage` */

/*Table structure for table `wxb_miniapp_photo` */

DROP TABLE IF EXISTS `wxb_miniapp_photo`;

CREATE TABLE `wxb_miniapp_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '实力图片',
  `miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序  排序规则为 降序',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_miniapp_photo` */

insert  into `wxb_miniapp_photo`(`photo_id`,`photo`,`miniapp_id`,`orderby`,`add_time`,`add_ip`) values (7,'20170715\\fe7219af4dc4dfea92475c4f4abdfe0a.jpg',1,1,1500114001,'127.0.0.1'),(8,'20170715\\edb436aa2a339edc6ae875a1a4bcf081.jpg',1,2,1500114001,'127.0.0.1'),(9,'20170717\\d1ba6dd706a794fd6eafd607eebcffa5.png',2,1,1500271526,'127.0.0.1'),(17,'20170724\\484ac63bb4e3266a369dd4d8ffb0297c.png',4,1,1500886732,'127.0.0.1'),(18,'20170724\\9bd466d67b40be16c5e315ef3603e1ad.png',4,2,1500886732,'127.0.0.1'),(19,'20170724\\dac7df3c513a2815b9039cdc2f6804d9.png',4,3,1500886732,'127.0.0.1'),(20,'20170724\\4fb7783896da26a7c3c8c964c12c26b6.png',4,4,1500886732,'127.0.0.1'),(21,'20170724\\5ee9aaa658aa583f5f34b320249b601f.png',4,5,1500886732,'127.0.0.1'),(22,'20170724\\b099d2dd6c53eb2d5fffae730aa5b02a.png',4,6,1500886732,'127.0.0.1'),(40,'20170816/456bf1fd812dbc9c5fd2400c7680139b.png',3,0,1502845488,'36.5.165.28'),(41,'20170816/2d3311551cb3e8a4238ffce93e9886ab.png',3,0,1502845527,'36.5.165.28'),(42,'20170816/e9636e03d9c8e22daaba83ec9aeb2a1d.png',3,0,1502845527,'36.5.165.28'),(43,'20170816/bf1ccda93606f9d9cff2376d525a42a4.png',3,0,1502845527,'36.5.165.28'),(44,'20170816/dc6b81ba18f9fabcf9d79803e1f690c6.png',3,0,1502845527,'36.5.165.28'),(45,'20170816/2a332633d3342004df034018cad70334.png',3,0,1502845527,'36.5.165.28'),(46,'20170816/1dfaa6aa544e79b51955d495f40015f1.png',3,0,1502845527,'36.5.165.28'),(47,'20170816/c15b7c0aa71c183f6958f4f093b6aeb5.png',3,0,1502845528,'36.5.165.28'),(48,'20170816/c0c47eb6060654d258be57721255b62b.png',3,0,1502845528,'36.5.165.28'),(49,'20170816/5915f0bd53ba13d1244132172b008e29.png',3,0,1502845527,'36.5.165.28'),(50,'20170816/848bfc11c4234791c367b68c1372ba80.png',7,0,1502845655,'36.5.165.28'),(51,'20170816/1165f1bbe6bf2ee909659146bc1c8ce6.png',7,7,1502845655,'36.5.165.28'),(52,'20170816/ccb63dbd3bcb911a715db86742d8ad84.png',7,8,1502845655,'36.5.165.28'),(53,'20170816/bbe5129cae19106417c21bb171336ae0.png',7,100,1502845655,'36.5.165.28'),(54,'20170816/0b835950bcce5fc915a33ae8fa7639f5.png',7,9,1502845655,'36.5.165.28'),(55,'20170816/7e80bf63c370d05b496e3de3e24e7b85.png',8,0,1502845716,'36.5.165.28'),(56,'20170816/d581baf2191affa0098ada39a5e4cb64.png',8,0,1502845716,'36.5.165.28'),(57,'20170816/ec775783d9ce1a35bce769485f40bcf6.png',8,0,1502845716,'36.5.165.28'),(58,'20170816/85bdf2d16c75b34d535e0fb302804a25.png',8,0,1502845716,'36.5.165.28'),(59,'20170816/a0df8d520e0df9296eab1cf837edaa3c.png',8,0,1502845716,'36.5.165.28'),(76,'20170821/0fafa4e0481bcacca15648d8d63501ea.png',14,1,1503306267,'36.5.163.28'),(77,'20170821/ab9d4dd46f1eccc2c61ef3c95831a7fa.png',14,2,1503306267,'36.5.163.28'),(78,'20170821/9dc72f63aeee66415c6c5f17b314f2f6.png',14,4,1503306267,'36.5.163.28'),(79,'20170821/1e0f49dc87091d9c2e770d7056338c3a.png',14,3,1503306268,'36.5.163.28'),(80,'20170821/6e8d086f273378ecc653adcda5124ae6.png',15,50,1503306785,'36.5.163.28'),(81,'20170821/750baae0d8484a89c00da4ae19798656.png',15,40,1503306785,'36.5.163.28'),(82,'20170821/53621f34b3af933ac80db04cdea52abe.png',15,30,1503306785,'36.5.163.28'),(83,'20170821/228d0f3c833e31f0fdac30d88cf6646e.png',15,20,1503306785,'36.5.163.28'),(84,'20170821/dd37f61d785b03caec629d358cc4cf38.png',17,0,1503310374,'36.5.163.28'),(85,'20170821/d9586a66f1db761aa7547beafdfbf072.png',17,0,1503310374,'36.5.163.28'),(86,'20170821/9f3873e404bf4ac0a7de0a9d76b2a9c1.png',17,0,1503310374,'36.5.163.28'),(87,'20170821/13b088b0f281ab2eb625185d31a02278.png',17,0,1503310374,'36.5.163.28'),(88,'20170821/8487e380c867b2de10001007a895239d.png',17,0,1503310375,'36.5.163.28'),(89,'20170821/505d7d8587ee522f72b12095b7019360.png',17,0,1503310374,'36.5.163.28'),(90,'20170821/a9ba159b416342cb0a60325aaf2a3056.png',17,0,1503310374,'36.5.163.28'),(91,'20170821/89280d02486bbcf17875a72b3de86108.png',17,0,1503310375,'36.5.163.28'),(92,'20170821/544a401c3bd8908fcf7954465dd81dd0.png',16,0,1503310711,'36.5.163.28'),(93,'20170821/e0743ede6414c2d01b5520de5d9c4931.png',16,0,1503310711,'36.5.163.28'),(94,'20170821/af663c1b674657ec307de456d1e3ebaf.png',16,80,1503310711,'36.5.163.28'),(95,'20170821/ae539a12193ed8bd42c8b0ec32486667.png',16,90,1503310711,'36.5.163.28'),(96,'20170821/60d76ac0ddf485defc8f4f63aedac117.png',16,100,1503310711,'36.5.163.28'),(97,'20170821/988a8619ee2ceb3d8b438962a7de8b96.png',18,0,1503311655,'36.5.163.28'),(98,'20170821/b91391f4a71f9eef47a9bb4f747e9aff.png',18,100,1503311655,'36.5.163.28'),(99,'20170821/00f2badc1e0318bfb7f7db0f89d3d7e1.png',18,50,1503311655,'36.5.163.28'),(100,'20170821/03b9beffef26927863c3d5ea3e2e86fd.png',18,30,1503311656,'36.5.163.28'),(101,'20170821/221c9aa117a24aa996675b06a946d271.png',18,0,1503311655,'36.5.163.28'),(102,'20170821/c58bc5ad9aed529f18403fbac310ab81.png',18,0,1503311656,'36.5.163.28'),(123,'20170906\\6143b3ac71e0776af1fcac8b0e7a7495.png',22,0,1504697846,'127.0.0.1'),(124,'20170906\\338f393787d280f9f0c043bc00ca16d8.png',22,0,1504697846,'127.0.0.1'),(125,'20170906\\42a646589b2948c1ab797c7091bc001d.png',22,0,1504697846,'127.0.0.1'),(126,'20170906\\8a92d5088db6ac3b8d24fae3cb26b306.png',22,0,1504697846,'127.0.0.1'),(127,'20170906\\4298e38acdd2fab1290f6dfa2299653f.png',22,0,1504697846,'127.0.0.1'),(128,'20170906\\ff3848e9e020aa2a804f9ca7e545a834.png',22,0,1504697846,'127.0.0.1'),(129,'20170913/8a60075049d3338a2d2d0880f75533db.jpg',24,0,1505273977,'36.5.135.7'),(130,'20170913/5f3bfcc4d7cc457b18d46ab4d80cec64.jpg',24,0,1505273977,'36.5.135.7'),(131,'20170913/7b45da867a3a1bd3eefd022f87a742d4.jpg',24,0,1505273977,'36.5.135.7'),(132,'20170913/4e1e08e97bc81f08936f402227971e10.jpg',24,0,1505273977,'36.5.135.7'),(133,'20170913/6bd6f748280702e85b4330d3b13f9588.jpg',24,0,1505273977,'36.5.135.7'),(134,'20170913/5ecdac238a543bee0eaac7d538910bb1.jpg',26,0,1505288343,'36.5.135.7'),(135,'20170913/6cb0fc9e50aba855efd570df293fc496.jpg',26,111,1505288343,'36.5.135.7'),(139,'20170913/bf2f508991762f65f34a0795e513b1c0.png',25,0,1505294862,'36.5.165.128'),(140,'20170913/2495751da81f246a8b627f42d2b0b6f7.png',25,0,1505294863,'36.5.165.128'),(141,'20170913/60490b63d6780667d5a703033b12238c.png',25,0,1505294863,'36.5.165.128'),(147,'20170913/f3f91b6374ef05663fc2253a04fcf268.png',27,1,1505295146,'36.5.165.128'),(148,'20170913/a281884aa673359d087c3c2d573f1431.png',27,10,1505295147,'36.5.165.128'),(149,'20170913/e40746c7eb7ffc69fef1d34fef8fa5f8.png',27,3,1505295146,'36.5.165.128'),(150,'20170913/812769295457578f0373df0be4031eb9.png',27,9,1505295147,'36.5.165.128'),(151,'20170913/3e43dad07eb60bc03a1a4fb3662099c9.png',27,5,1505295166,'36.5.165.128'),(152,'20170922\\94fbb0459318a9a73cc1fc1966b35076.png',28,0,1506049018,'127.0.0.1'),(153,'20170922\\15052efa1a8f4d41565fb0393d243b4a.png',28,0,1506049018,'127.0.0.1'),(154,'20170922\\dd53fea829396ade9d47b442d8bfe93b.png',28,19,1506049018,'127.0.0.1'),(155,'20170922\\234ecbf13a95ea2ec23986de706b9100.png',28,3,1506049018,'127.0.0.1'),(156,'20170922\\2fdbedce67391036402c0c6ff0879448.png',28,100,1506049018,'127.0.0.1'),(157,'20170922\\90a7d5d5ac4a401934cd52329401ee9c.png',28,8,1506049018,'127.0.0.1'),(158,'20170922\\85956facc8ed287569770aee22e2f52e.png',28,7,1506049019,'127.0.0.1'),(159,'20170922\\6d7bd2c470b9dd849c217a7aa14a46d4.png',28,6,1506049020,'127.0.0.1'),(160,'20170922\\b587b446a84ab92eccf6963e7fe6a7aa.png',28,5,1506049021,'127.0.0.1'),(161,'20170925\\49a816ab69d647c72522af73fc2b6e39.png',32,0,1506335453,'127.0.0.1'),(162,'20170925\\ba047484580db7cc13078285749f4da9.png',32,0,1506335453,'127.0.0.1'),(163,'20170925\\fc211316457f2f5785007f4fa8a18722.png',32,0,1506335453,'127.0.0.1'),(164,'20170925\\c07e4edf5dc7fb017b34463320d432c7.png',32,0,1506335453,'127.0.0.1'),(165,'20170925\\ccfec9d0c14f184285212419d8e083eb.png',32,0,1506335453,'127.0.0.1'),(166,'20170925\\85293288fe0052cd6468bc755837d0bd.png',32,100,1506335453,'127.0.0.1'),(167,'20170925\\e6ff631f6e0d1a9f072019bed754ba3f.png',32,0,1506335454,'127.0.0.1'),(168,'20170925\\30b8f6a6a1fe39ccfaeb809b503c6536.png',32,0,1506335455,'127.0.0.1'),(169,'20170925\\1f5c7795b089d9484d09161a29adaed7.png',32,0,1506335456,'127.0.0.1'),(170,'20170925\\19959ccfcca617465cae5faf50acc7d1.png',32,0,1506335457,'127.0.0.1'),(178,'20170926/e5b93bea6d27163628624da62d4b391c.png',29,1,1506409090,'36.5.160.106'),(179,'20170926/be12da97bb39dad988ff74759608525f.png',29,10,1506409091,'36.5.160.106'),(180,'20170926/963a6e94b5fcc6c389f71acd049cc333.png',29,9,1506409091,'36.5.160.106'),(181,'20170926/e77e0afd835916414b35861d637b95d5.png',29,0,1506409091,'36.5.160.106'),(182,'20170926/b1953ceaf5c725d9eadd4cb48720bff3.png',29,6,1506409091,'36.5.160.106'),(183,'20170926/f244d458314e64941f99fffa780c5177.png',29,7,1506409092,'36.5.160.106'),(184,'20170926/5496e666ab2215223f23b80d7de7297a.png',29,8,1506409095,'36.5.160.106'),(185,'20170926/3656e69589d32fe2c607ef73ff2156ca.png',30,6,1506409307,'36.5.160.106'),(186,'20170926/af295aba40caafbf871fcbfe4bcb6680.png',30,7,1506409311,'36.5.160.106'),(187,'20170926/13207d5f551437b80e44ce798af00e7a.png',30,8,1506409311,'36.5.160.106'),(188,'20170926/2c5885e7e8cd47d2271ff7a05f638a2a.png',30,10,1506409313,'36.5.160.106'),(189,'20170926/970f5e0e37629b4e0006a3178ef4b7de.png',30,9,1506409313,'36.5.160.106'),(190,'20170926/69416ccd0dcee18f773fa3fa621d262b.png',13,0,1506411711,'36.5.160.106'),(191,'20170926/0575d760636ecdd192d8fc93d357c316.png',13,70,1506411712,'36.5.160.106'),(192,'20170926/f968abcb0cd32996bfb07386c3110753.png',13,100,1506411713,'36.5.160.106'),(193,'20170926/3741681f7b19e88aba12d8fd7ad94ec1.png',13,10,1506411714,'36.5.160.106'),(194,'20170926/b45ee482f2f696bf7adda07bb1cccad6.png',13,8,1506411714,'36.5.160.106'),(195,'20170926/c4d456879c5a1db47f93da901bbc53ec.png',23,10,1506416304,'36.5.160.106'),(196,'20170926/df94eb1bc0a0f6147b41b19c78c910f2.png',23,0,1506416304,'36.5.160.106'),(197,'20170926/ec2475f5ce6ff357502c860d005ed30c.png',23,50,1506416306,'36.5.160.106'),(198,'20170926/3e1a68def056bb85ad639d00f1bac686.png',23,100,1506416307,'36.5.160.106'),(199,'20170926/47437e5979977a3903937375c57f6683.png',23,1000,1506416307,'36.5.160.106'),(200,'20170926/d0f3196bf90208b550b5f5114d1c70a6.png',20,0,1506417034,'36.5.160.106'),(201,'20170926/84b67fa290f8edfa6814936751cb580e.png',20,9,1506417034,'36.5.160.106'),(202,'20170926/f0edc3a51e2fdadca27f7314fbba5305.png',20,0,1506417036,'36.5.160.106'),(203,'20170926/86d66aa3bc3bea198dd7043179b1bef9.png',20,10,1506417036,'36.5.160.106'),(204,'20170926/a2b217027d260dbed37fe2e7c1a733c1.png',20,100,1506417037,'36.5.160.106'),(205,'20170926/302e31d52bc3b833f5c9ce3b47d9de66.png',20,1000,1506417037,'36.5.160.106'),(206,'20170926/3e408ac0d060499bafaf60a71ce007f4.png',19,0,1506423766,'36.5.160.106'),(207,'20170926/4ab7e5a281f3c1e0bb4704b7d9dbe3af.png',19,666,1506423767,'36.5.160.106'),(208,'20170926/c73f6df11302f50a87eadb9a8a515a1b.png',19,888,1506423768,'36.5.160.106'),(209,'20170926/49622cd93bb1fef5c8a8f73a0fc89012.png',19,1000,1506423769,'36.5.160.106'),(210,'20170926/ac5f9053175140dd2fc54aaa99e5f6ef.png',19,999,1506423769,'36.5.160.106'),(211,'20170927\\3a4efec5bc0d5828c4bd63a20be41310.png',5,7,1506510091,'127.0.0.1'),(213,'20170927\\a900c6960cde9d44a21a3138361bd2e2.png',5,6,1506510138,'127.0.0.1'),(214,'20170927\\9e645fe409b804da4d1b10b5ee7d5628.png',5,8,1506510138,'127.0.0.1'),(215,'20170927\\158b2e74ad8822fd6d6152d300db8b2e.png',5,989,1506510138,'127.0.0.1'),(216,'20170927\\a90766f3d73650dafc6f5cb5a3cc02dd.png',5,1000,1506510138,'127.0.0.1'),(217,'20170927\\c90ee7c96b58686d27b2c4f8529e34d3.png',5,100,1506510138,'127.0.0.1'),(218,'20170927\\d55ce6de774da12d4c030b782a763fb2.png',5,5,1506510138,'127.0.0.1'),(219,'20171016\\7065f63950b03bf577349995159a8e91.jpg',31,0,1508138174,'127.0.0.1'),(220,'20171016\\11341e1f785ba1e47d1a14872867c9d0.jpg',31,0,1508138174,'127.0.0.1'),(221,'20171016\\a676139915110cd7752622ca15e28729.jpg',31,0,1508138174,'127.0.0.1'),(222,'20171016\\e0d40401639bbebc4cfc602527821a1b.jpg',31,0,1508138174,'127.0.0.1'),(223,'20171016\\eb155419fa8ce80c8f73afc4b665391f.jpg',33,0,1508138454,'127.0.0.1'),(224,'20171016\\cf42e36e8c551bbc9e52989f34a9300d.jpg',33,0,1508138454,'127.0.0.1'),(225,'20171016\\4a7f28bfa2d17ed65d7264878c2da7ac.jpg',33,0,1508138454,'127.0.0.1'),(226,'20171016\\bf949b068bbd75d97eca81ad68e6f4e3.jpg',33,0,1508138454,'127.0.0.1'),(227,'20171016\\51e9de76762648a00e325e1f2f0e6bd6.jpg',33,0,1508138454,'127.0.0.1'),(228,'20171020\\84e7a5c4faf1b2955b9e9e10c8efbbea.jpg',34,8,1508464094,'127.0.0.1'),(229,'20171020\\489f2cd7360ea1b9b2da294dc72ba2a3.jpg',34,10,1508464094,'127.0.0.1'),(230,'20171020\\a2cf08aef507b6c5fb055069c6c69bc4.jpg',34,9,1508464094,'127.0.0.1'),(231,'20171020\\4b3e1faaff48687b1f5dbd8596150b77.jpg',34,8,1508464094,'127.0.0.1'),(232,'20171020\\79dc21ad30ff38b641fb7530c160e8cf.jpg',34,5,1508464094,'127.0.0.1'),(233,'20171020\\28188aa5de136a160d7d8aadad55932b.jpg',34,6,1508464094,'127.0.0.1'),(234,'20171020\\894b7be23f23d775834236ea4c616f93.jpg',34,7,1508464095,'127.0.0.1'),(235,'20171020\\a04c513c0d757268d28ceef779a1c86c.jpg',35,0,1508464920,'127.0.0.1'),(236,'20171020\\5df1f3292bb24997236f8e0fc1e667cc.jpg',35,0,1508464920,'127.0.0.1'),(237,'20171020\\cb6ee185661d21a65cca0cf244fc7978.jpg',35,0,1508464920,'127.0.0.1'),(238,'20171020\\561a121382156e6c3c0e3d68b547c0b0.jpg',35,0,1508464920,'127.0.0.1'),(239,'20171020\\e7ffa7f13bace05d4431cd5a03eb092f.jpg',35,0,1508464920,'127.0.0.1'),(240,'20171023\\4e00f40a32172164fb4b41f11c532135.jpg',37,0,1508724008,'127.0.0.1'),(241,'20171023\\08f6c2bcd0abe1e8a117c4d3a6b94e98.jpg',37,0,1508724008,'127.0.0.1'),(242,'20171023\\3b82a90ebe3e396d8423adbe9be5dbb2.jpg',37,0,1508724008,'127.0.0.1'),(243,'20171023\\f8d7062a8007118d6a39876d3358850b.jpg',37,0,1508724008,'127.0.0.1'),(244,'20171023\\c131ca7b3203480954dd19df1b3ff27e.jpg',37,0,1508724008,'127.0.0.1'),(245,'20171023\\d7b425bbc8fdd4933d3a183fbe17b6d9.jpg',37,0,1508724008,'127.0.0.1'),(253,'20180103\\71e105a7bc507b5029e1ebf15cb22b2b.png',39,0,1514993727,'112.252.29.175'),(247,'20171025\\bc656dbb4191b8d6f13b56399e848287.jpg',39,0,1508917069,'127.0.0.1'),(248,'20171025\\54bdae311efaa143c8384974bcac706d.jpg',39,0,1508917069,'127.0.0.1'),(249,'20171025\\9be02b0bf121a3a6d9b4ca982ee3ef46.jpg',39,0,1508917069,'127.0.0.1'),(250,'20171025\\b2858e4286f8679e31908ef94dd3600a.jpg',38,0,1508917121,'127.0.0.1'),(251,'20171025\\fa2aac81e91728efd3c90d27e6d1e468.jpg',38,0,1508917121,'127.0.0.1'),(254,'20180103\\7aa452909abb9c3267cd5e56b48295a0.png',38,0,1514993745,'112.252.29.175');

/*Table structure for table `wxb_miniapp_setting` */

DROP TABLE IF EXISTS `wxb_miniapp_setting`;

CREATE TABLE `wxb_miniapp_setting` (
  `member_miniapp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `service_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '客服电话',
  `complaint_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '投诉电话',
  `about` varchar(255) NOT NULL DEFAULT '' COMMENT '关于我们',
  `app_name` varchar(155) NOT NULL DEFAULT '' COMMENT '站点名称',
  `mini_appid` varchar(255) DEFAULT '' COMMENT '微信小程序支appid',
  `mini_appsecrept` varchar(255) NOT NULL DEFAULT '',
  `mini_mid` varchar(255) NOT NULL DEFAULT '',
  `mini_apicode` varchar(255) DEFAULT NULL,
  `apiclient_cert` varchar(150) NOT NULL COMMENT '证书pem格式',
  `apiclient_cert_key` varchar(150) NOT NULL COMMENT '证书秘钥pem格式',
  `is_pay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启在线支付立减',
  `pay_money` int(11) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `logo` varchar(150) DEFAULT '',
  PRIMARY KEY (`member_miniapp_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_miniapp_setting` */

/*Table structure for table `wxb_minsu` */

DROP TABLE IF EXISTS `wxb_minsu`;

CREATE TABLE `wxb_minsu` (
  `minsu_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '城市id',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `brand_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '品牌',
  `minsu_name` varchar(128) NOT NULL DEFAULT '' COMMENT '商户名称',
  `minsu_tel` varchar(12) NOT NULL DEFAULT '0' COMMENT '民宿房东电话',
  `decoration_time` varchar(64) NOT NULL DEFAULT '0' COMMENT '最后装修时间',
  `opening_time` varchar(64) NOT NULL DEFAULT '0' COMMENT '开门时间',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `banner` varchar(150) DEFAULT NULL,
  `score` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '评分 0 - 50',
  `order_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单数',
  `praise_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '好评数',
  `bad_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '差评数',
  `advantage` varchar(8) NOT NULL DEFAULT '' COMMENT '优势最多8个字',
  `price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '起价',
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `scenic_spot_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '景点id',
  `area_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商圈id',
  `administration_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行政区域id',
  `station_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '车站id',
  `colleges_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '高校id',
  `hospital_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '医院id',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1开业0关店',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  `room_num` smallint(6) unsigned DEFAULT '0' COMMENT '房间数',
  `appropriate` smallint(32) unsigned DEFAULT '0' COMMENT '可接待人数',
  PRIMARY KEY (`minsu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_minsu` */

/*Table structure for table `wxb_minsu_banner` */

DROP TABLE IF EXISTS `wxb_minsu_banner`;

CREATE TABLE `wxb_minsu_banner` (
  `banner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_minsu_banner` */

/*Table structure for table `wxb_minsu_brand` */

DROP TABLE IF EXISTS `wxb_minsu_brand`;

CREATE TABLE `wxb_minsu_brand` (
  `brand_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) unsigned NOT NULL DEFAULT '0',
  `brand_name` varchar(64) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `bloc` varchar(64) NOT NULL DEFAULT '' COMMENT '所属集团',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `orderby` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_minsu_brand` */

/*Table structure for table `wxb_minsu_comment` */

DROP TABLE IF EXISTS `wxb_minsu_comment`;

CREATE TABLE `wxb_minsu_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `minsu_id` int(11) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `order_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `content` varchar(1024) NOT NULL DEFAULT '',
  `reply` varchar(1024) NOT NULL DEFAULT '',
  `reply_time` int(11) NOT NULL DEFAULT '0',
  `reply_ip` varchar(15) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_minsu_comment` */

/*Table structure for table `wxb_minsu_comment_photo` */

DROP TABLE IF EXISTS `wxb_minsu_comment_photo`;

CREATE TABLE `wxb_minsu_comment_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(128) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_minsu_comment_photo` */

/*Table structure for table `wxb_minsu_detail` */

DROP TABLE IF EXISTS `wxb_minsu_detail`;

CREATE TABLE `wxb_minsu_detail` (
  `minsu_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(11) NOT NULL DEFAULT '0',
  `describe` tinytext NOT NULL COMMENT '民宿房东详情',
  `unsubscribe` tinytext NOT NULL COMMENT '退订规则',
  `check_otice` tinytext NOT NULL COMMENT '入住须知',
  `is_wifi` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有wif',
  `is_water` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有热水',
  `is_hairdrier` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有吹风机',
  `is_airconditioner` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有空调',
  `is_elevator` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有电梯',
  `is_fitnessroom` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有健生房',
  `is_swimmingpool` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有游泳池',
  `is_sauna` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有桑拿',
  `is_westernfood` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有西餐厅',
  `is_chinesefood` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有中餐厅',
  `is_disability` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有残疾人专用房',
  `is_smokeless` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有无烟房',
  `is_stop` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有免费停车',
  `is_cereal` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有早餐',
  `is_airportpickup` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有接机服务',
  `is_station` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有接站服务',
  `is_cabs` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有叫车服务',
  `is_luggage` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有专职行李',
  `is_carrental` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '租车',
  `is_disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有残疾人设施',
  `is_conference` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有会议室',
  `is_express` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮政服务',
  `is_washclothes` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有洗衣服务',
  `is_merchant` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有商户中心',
  `is_awaken` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有唤醒服务',
  `is_deposit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有行李寄存',
  `is_creditcard` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有信用卡',
  `is_reception` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否全天前台',
  `is_foreignguests` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否接待外宾',
  `is_spa` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有spa',
  `is_chess` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有棋盘室',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`minsu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_minsu_detail` */

/*Table structure for table `wxb_minsu_like` */

DROP TABLE IF EXISTS `wxb_minsu_like`;

CREATE TABLE `wxb_minsu_like` (
  `like_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `minsu_id` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`like_id`)
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_minsu_like` */

/*Table structure for table `wxb_minsu_manage` */

DROP TABLE IF EXISTS `wxb_minsu_manage`;

CREATE TABLE `wxb_minsu_manage` (
  `manage_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '授权此管理员员的小程序id',
  `minsu_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '民宿房东id',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '管理员账号',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '授权人密码',
  `role_name` varchar(64) NOT NULL DEFAULT '' COMMENT '授权人角色名称',
  `mange_name` varchar(64) NOT NULL DEFAULT '' COMMENT '授权人姓名',
  `is_lock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定',
  `last_time` int(11) DEFAULT NULL,
  `last_ip` varchar(15) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`manage_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_minsu_manage` */

/*Table structure for table `wxb_minsu_order` */

DROP TABLE IF EXISTS `wxb_minsu_order`;

CREATE TABLE `wxb_minsu_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL COMMENT '小程序id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员',
  `minsu_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '民宿房东id',
  `room_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '房源id',
  `room_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '房间数',
  `person_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '人数',
  `total_price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '一共需要支付',
  `need_pay` int(11) DEFAULT '0',
  `pay_money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已支付余额',
  `pay_coupon` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券',
  `lijian` int(11) DEFAULT '0',
  `pay_coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠卷id',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_info` text,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `mobile` char(11) NOT NULL DEFAULT '0' COMMENT '联系人手机',
  `idcard` varchar(18) DEFAULT NULL,
  `is_comment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否评论',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未支付 1等待商家接单 2待入住 3 取消订单, 8完成',
  `check_in_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '入住时间',
  `leave_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '离店时间',
  `cancel_type` tinyint(1) unsigned DEFAULT '0' COMMENT '1用户取消2:商户取消',
  `cancel_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `cancel_info` varchar(150) NOT NULL DEFAULT '' COMMENT '取消理由',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：会员订单不显示',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `form_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_minsu_order` */

/*Table structure for table `wxb_minsu_photo` */

DROP TABLE IF EXISTS `wxb_minsu_photo`;

CREATE TABLE `wxb_minsu_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `minsu_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(128) NOT NULL DEFAULT '',
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`),
  KEY `minsu_id` (`minsu_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_minsu_photo` */

/*Table structure for table `wxb_minsu_room` */

DROP TABLE IF EXISTS `wxb_minsu_room`;

CREATE TABLE `wxb_minsu_room` (
  `room_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `minsu_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '民宿房东（民宿）id',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `city_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '城市id',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '房间标题',
  `area` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '面积',
  `photo` varchar(128) NOT NULL DEFAULT '' COMMENT '展示图片',
  `room_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1经济型2豪华型3总统 ',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '日常价格',
  `appropriate_num` smallint(2) unsigned NOT NULL DEFAULT '0',
  `bed_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '床的类型',
  `bed_width` varchar(10) NOT NULL DEFAULT '' COMMENT '床宽',
  `bed_logn` varchar(10) NOT NULL DEFAULT '' COMMENT '床长',
  `bed_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '床的数量',
  `is_wifi` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有网络',
  `is_breakfast` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `day_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '单日最大预定数',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1上架',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`room_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_minsu_room` */

/*Table structure for table `wxb_minsu_room_photo` */

DROP TABLE IF EXISTS `wxb_minsu_room_photo`;

CREATE TABLE `wxb_minsu_room_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(128) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`),
  KEY `room_id` (`room_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_minsu_room_photo` */

/*Table structure for table `wxb_minsu_room_price` */

DROP TABLE IF EXISTS `wxb_minsu_room_price`;

CREATE TABLE `wxb_minsu_room_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned NOT NULL DEFAULT '0',
  `minsu_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `day` date NOT NULL COMMENT '日期',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  `room_num` smallint(5) NOT NULL DEFAULT '0' COMMENT '房间已售',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0今天不买了',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`price_id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_minsu_room_price` */

/*Table structure for table `wxb_minsu_special` */

DROP TABLE IF EXISTS `wxb_minsu_special`;

CREATE TABLE `wxb_minsu_special` (
  `special_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT '0',
  `special_title1` varchar(64) NOT NULL DEFAULT '' COMMENT '标题一',
  `special_title2` varchar(255) NOT NULL DEFAULT '' COMMENT '标题二',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `banner` varchar(150) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`special_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_minsu_special` */

/*Table structure for table `wxb_minsu_special_join` */

DROP TABLE IF EXISTS `wxb_minsu_special_join`;

CREATE TABLE `wxb_minsu_special_join` (
  `join_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `minsu_id` int(10) unsigned NOT NULL DEFAULT '0',
  `special_id` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`join_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_minsu_special_join` */

/*Table structure for table `wxb_mobile_code` */

DROP TABLE IF EXISTS `wxb_mobile_code`;

CREATE TABLE `wxb_mobile_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) DEFAULT NULL,
  `code` varchar(6) DEFAULT NULL,
  `err_num` int(11) DEFAULT '0',
  `code_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_id`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_mobile_code` */

insert  into `wxb_mobile_code`(`code_id`,`mobile`,`code`,`err_num`,`code_time`) values (230,'15520449931','300967',0,1529564001);

/*Table structure for table `wxb_money_log` */

DROP TABLE IF EXISTS `wxb_money_log`;

CREATE TABLE `wxb_money_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `way` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1充值余额，2购买小程序，3购买短信，4提交押金',
  `money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作余额的数量',
  `this_money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '当前剩余',
  `is_consume` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1收入，2支出',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_money_log` */

insert  into `wxb_money_log`(`log_id`,`member_id`,`way`,`money`,`this_money`,`is_consume`,`add_time`,`add_ip`) values (109,237,2,12880,987120,1,1515389756,'222.134.33.194'),(110,248,2,16880,983120,1,1529562326,'127.0.0.1');

/*Table structure for table `wxb_news` */

DROP TABLE IF EXISTS `wxb_news`;

CREATE TABLE `wxb_news` (
  `news_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '新闻标题',
  `is_show` tinyint(1) DEFAULT '1',
  `content` text NOT NULL COMMENT '新闻内容',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `title2` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_news` */

insert  into `wxb_news`(`news_id`,`title`,`is_show`,`content`,`add_time`,`add_ip`,`title2`) values (2,'微点应用上线啦',1,'<p>微点应用是一个第三方小程序托管平台！<br/></p><p><img src=\"/attachs/ueditor/image/20171218/1513558279101748.jpg\" title=\"1513558279101748.jpg\"/></p><p><img src=\"/attachs/ueditor/image/20171218/1513558280780295.jpg\" title=\"1513558280780295.jpg\"/></p><p><br/></p>',1501920699,'127.0.0.1','微点应用上线啦'),(3,'一款类似于去哪儿酒店、美团酒店的酒店在线预订的微信小程序',1,'<p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">核心功能：</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">1、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">酒店在线预订：能快速在线及时预订，无需下载任何软件只需要微信打开就可以！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">2、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">优惠券活动：不定期的发放优惠券进行入住的宣传通过微信分享，让用户得到实惠！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">3、</span><span style=\";font-family:宋体;font-size:14px\">GPS<span style=\"font-family:宋体\">距离定位：能按照距离查找附近的酒店、方便入住最近的酒店。</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">4、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">房源是否可住清晰可查</span>:<span style=\"font-family:宋体\">房源是否有余房可以在线查看，方便快捷</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">5、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">退款方便：退款支持直接退回用户微信余额，只需要点击一个按钮</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">6、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">多酒店入住：酒店可以在线管理自己的房屋状态以及查看资金流水</span></span></p><p><span style=\";font-family:宋体;font-size:14px\">&nbsp;</span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">适用对象：</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">1、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">品牌连锁酒店：品牌连锁酒店可以将自己的酒店资源利用小程序来进行附近的店营销！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">2、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">拥有酒店资源的创业者：有资源一定要接入到互联网，适用老的一套方法虽然现在能赚钱，但是始终需要被趋势所取代！拥抱互联网，最快最便捷的入口微信小程序势在必行！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">3、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">旅行社：旅行社也可以单独的做一款酒店在线预订的程序，这样可以方便的将自己的资源最大化利益！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">4、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">其他创业者：想在旅游行业创业，但是资源和资金，甚至方向还不明确的可以使用小程序先行尝试，最小的代价迈出自己的人生第一步！</span></span></p><p><span style=\";font-family:宋体;font-size:14px\">&nbsp;</span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">为什么要做酒店小程序：</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">1、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">微信小程序旅游行业在小程序的流量占比已经达到了惊人的</span>7%<span style=\"font-family:宋体\">；可以说微信小程序的流量是相当的可观，另外目前旅游行业的小程序建设都不太完善，早点布局对抢占流量是有帮助的！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">2、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">像华住、去哪儿、携程等等都在做酒店小程序，他们有自己的</span>APP<span style=\"font-family:宋体\">了为什么还要做酒店小程序呢？原因很简单，微信的流量太庞大了，不得不放下身段拥抱微信！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">3、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">小程序有附近的小程序功能以及多大</span>40<span style=\"font-family:宋体\">几个的流量入口，占个位置也要先布局小程序已经成为业内说的做多的一句话了！未来会如何谁都说不好，但是微信一直在增长一直在开放！</span></span></p><p><br/></p>',1503311875,'36.5.163.28','酒店预订小程序发布啦'),(4,'一款类似于去哪儿、途牛的在线报名旅游的微信小程序',1,'<p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">核心功能：</span></span></p><p style=\"text-indent:28px\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">公司和家庭旅游需求的在线采集！</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">适用对象：</span></span></p><p style=\"text-indent:28px\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">需要在线采集用户旅游需求和计划的单位都可以使用该小程序！</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">为什么要做旅游定制小程序：</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">1、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">微信小程序旅游行业在小程序的流量占比已经达到了惊人的</span>7%<span style=\"font-family:宋体\">；可以说微信小程序的流量是相当的可观，另外目前旅游行业的小程序建设都不太完善，早点布局对抢占流量是有帮助的！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">2、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">小程序有附近的小程序功能以及多大</span>40<span style=\"font-family:宋体\">几个的流量入口，占个位置也要先布局小程序已经成为业内说的做多的一句话了！未来会如何谁都说不好，但是微信一直在增长一直在开放！</span></span></p><p><br/></p>',1503312248,'36.5.163.28','微信旅游定制小程序'),(5,'微信民宿预订小程序',1,'<p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">标题：一款类似于去途家、一家民宿的民宿在线预订的微信小程序</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">核心功能：</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">1、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">民宿在线预订：能快速在线及时预订，无需下载任何软件只需要微信打开就可以！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">2、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">优惠券活动：不定期的发放优惠券进行入住的宣传通过微信分享，让用户得到实惠！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">3、</span><span style=\";font-family:宋体;font-size:14px\">GPS<span style=\"font-family:宋体\">距离定位：能按照距离查找附近的民宿、方便入住最近的民宿。</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">4、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">房源是否可住清晰可查</span>:<span style=\"font-family:宋体\">房源是否有余房可以在线查看，方便快捷</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">5、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">退款方便：退款支持直接退回用户微信余额，只需要点击一个按钮</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">6、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">多民宿入住：民宿可以在线管理自己的房屋状态以及查看资金流水</span></span></p><p><span style=\";font-family:宋体;font-size:14px\">&nbsp;</span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">适用对象：</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">1、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">品牌连锁民宿：品牌连锁民宿可以将自己的民宿资源利用小程序来进行附近的店营销！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">2、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">拥有民宿资源的创业者：有资源一定要接入到互联网，适用老的一套方法虽然现在能赚钱，但是始终需要被趋势所取代！拥抱互联网，最快最便捷的入口微信小程序势在必行！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">3、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">旅行社：旅行社也可以单独的做一款民宿在线预订的程序，这样可以方便的将自己的资源最大化利益！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">4、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">其他创业者：想在旅游行业创业，但是资源和资金，甚至方向还不明确的可以使用小程序先行尝试，最小的代价迈出自己的人生第一步！</span></span></p><p><span style=\";font-family:宋体;font-size:14px\">&nbsp;</span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">为什么要做民宿小程序：</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">1、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">微信小程序旅游行业在小程序的流量占比已经达到了惊人的</span>7%<span style=\"font-family:宋体\">；可以说微信小程序的流量是相当的可观，另外目前旅游行业的小程序建设都不太完善，早点布局对抢占流量是有帮助的！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">2、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">像途家、小猪、美团等等都在做民宿小程序，他们有自己的</span>APP<span style=\"font-family:宋体\">了为什么还要做民宿小程序呢？原因很简单，微信的流量太庞大了，不得不放下身段拥抱微信！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">3、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">小程序有附近的小程序功能以及多大</span>40<span style=\"font-family:宋体\">几个的流量入口，占个位置也要先布局小程序已经成为业内说的做多的一句话了！未来会如何谁都说不好，但是微信一直在增长一直在开放！</span></span></p><p><br/></p>',1503312275,'36.5.163.28','微信民宿预订小程序'),(6,'农家乐官网小程序',1,'<p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">标题：一款满足农家乐、微型景区的官方网站小程序，可在线预订房源以及游玩项目美食等套餐！</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">核心功能：</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">1、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">在线订房：可以在线订购住房信息，及时的在线交易！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">2、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">优惠券活动：不定期的发放优惠券进行入住的宣传通过微信分享，让用户得到实惠！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">3、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">房源是否可住清晰可查</span>:<span style=\"font-family:宋体\">房源是否有余房可以在线查看，方便快捷</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">4、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">退款方便：退款支持直接退回用户微信余额，只需要点击一个按钮</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">5、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">游玩项目：可以在线订购游玩项目及周边美食！</span></span></p><p><span style=\";font-family:宋体;font-size:14px\">&nbsp;</span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">适用对象：</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">1、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">农家乐官方：这也是农家乐拥抱移动互联网的一个大的机会！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">2、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">微型景区：可以围绕周边的资源进行互联网化传播！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">3、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">景区</span>IT<span style=\"font-family:宋体\">工作者：可以利用自己对互联网的了解通过小程序赚一笔额外收入</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">为什么要做农家乐小程序：</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">1、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">微信小程序旅游行业在小程序的流量占比已经达到了惊人的</span>7%<span style=\"font-family:宋体\">；可以说微信小程序的流量是相当的可观，另外目前旅游行业的小程序建设都不太完善，早点布局对抢占流量是有帮助的！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">2、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">都说拥抱互联网：拥抱互联网第一步就是需要自己的一个网络名片！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">3、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">像华住、去哪儿、携程等等都在做酒店小程序，他们有自己的</span>APP<span style=\"font-family:宋体\">了为什么还要做酒店小程序呢？原因很简单，微信的流量太庞大了，不得不放下身段拥抱微信！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">4、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">小程序有附近的小程序功能以及多大</span>40<span style=\"font-family:宋体\">几个的流量入口，占个位置也要先布局小程序已经成为业内说的做多的一句话了！未来会如何谁都说不好，但是微信一直在增长一直在开放！</span></span></p><p><br/></p>',1503312310,'36.5.163.28','农家乐官网小程序'),(7,'周边游小程序',1,'<p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">标题：一款类似于去要出发的线路套餐在线预订的微信小程序</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">核心功能：</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">1、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">酒店在线预订：能快速在线及时预订，无需下载任何软件只需要微信打开就可以！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">2、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">优惠券活动：不定期的发放优惠券进行入住的宣传通过微信分享，让用户得到实惠！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">3、</span><span style=\";font-family:宋体;font-size:14px\">GPS<span style=\"font-family:宋体\">距离定位：能按照距离查找附近的酒店、方便入住最近的酒店。</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">4、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">退款方便：退款支持直接退回用户微信余额，只需要点击一个按钮</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">5、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">套餐线路在线预定：快速的预定套餐线路，让旅游一站式搞定</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">6、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">门票美食预定：可以预定景区的门票、已经周边的美食</span></span></p><p><span style=\";font-family:宋体;font-size:14px\">&nbsp;</span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">适用对象：</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">1、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">旅游平台创业者：周边游亲子游已经成为一种周末去哪儿的时尚了</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">2、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">旅行社：酒店、门票、线路一站式服务的搞定，让旅行社能够快速的分销自己的上游产品</span></span></p><p><span style=\";font-family:宋体;font-size:14px\">&nbsp;</span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">为什么要做周边游小程序：</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">1、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">微信小程序旅游行业在小程序的流量占比已经达到了惊人的</span>7%<span style=\"font-family:宋体\">；可以说微信小程序的流量是相当的可观，另外目前旅游行业的小程序建设都不太完善，早点布局对抢占流量是有帮助的！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">2、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">像要出发、妈网亲子游等等都在做酒店小程序，他们有自己的</span>APP<span style=\"font-family:宋体\">了为什么还要做酒店小程序呢？原因很简单，微信的流量太庞大了，不得不放下身段拥抱微信！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">3、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">小程序有附近的小程序功能以及多大</span>40<span style=\"font-family:宋体\">几个的流量入口，占个位置也要先布局小程序已经成为业内说的做多的一句话了！未来会如何谁都说不好，但是微信一直在增长一直在开放！</span></span></p><p><br/></p>',1503312340,'36.5.163.28','周边游小程序'),(8,'装修小程序',1,'<p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">标题：一款收集本地装修建材企业服务的微信小程序</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">核心功能：</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">1、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">商家搜索：分类可以自定义，收集本地商家，</span>VIP<span style=\"font-family:宋体\">有</span><span style=\"font-family:Calibri\">LOGO</span><span style=\"font-family:宋体\">展示，普通商家文字展示！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">2、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">商家名片系统：分享商家的名片可以统计分享数，商家的小程序名片很新颖的一个物件！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">3、</span><span style=\";font-family:宋体;font-size:14px\">GPS<span style=\"font-family:宋体\">距离定位：可以按照距离来查询最近的商家。</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">4、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">商家预约系统：可以在线对商家进行预约到店功能</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">5、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">拨打电话统计功能：用户拨打电话后会记录拨打过哪些商家，拨打过多少次数！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">6、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">装修招标功能：用户在平台提交装修信息，后台可以分配给多家商家！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">7、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">装修攻略：让用户方便的了解装修过程！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">8、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">装修案例：装修效果图提供给用户的最直接的装修方案</span></span></p><p><span style=\";font-family:宋体;font-size:14px\">&nbsp;</span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">适用对象：</span></span></p><p style=\"text-indent:28px\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">本地互联网创业者；</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">为什么要做小程序：</span></span></p><p style=\"text-indent:28px;text-align:justify;text-justify:inter-ideograph\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">小程序新颖的东西能让您快速的收取商家费用，</span>VIP<span style=\"font-family:宋体\">可以包年服务！每个预约信息都可以换取</span><span style=\"font-family:Calibri\">RMB</span></span></p><p><br/></p>',1503312376,'36.5.163.28','装修小程序'),(9,'婚庆小程序',1,'<p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">标题：一款收集本地婚纱摄影、酒店、婚庆服务、司仪、租车企业服务的微信小程序</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">核心功能：</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">1、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">商家搜索：分类可以自定义，收集本地商家，</span>VIP<span style=\"font-family:宋体\">有</span><span style=\"font-family:Calibri\">LOGO</span><span style=\"font-family:宋体\">展示，普通商家文字展示！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">2、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">商家名片系统：分享商家的名片可以统计分享数，商家的小程序名片很新颖的一个物件！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">3、</span><span style=\";font-family:宋体;font-size:14px\">GPS<span style=\"font-family:宋体\">距离定位：可以按照距离来查询最近的商家。</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">4、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">商家预约系统：可以在线对商家进行预约到店功能</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">5、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">拨打电话统计功能：用户拨打电话后会记录拨打过哪些商家，拨打过多少次数！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">6、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">结婚招标功能：用户在平台提交结婚信息，后台可以分配给多家商家！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">7、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">结婚攻略：让用户方便的了解结婚婚庆的过程！</span></span></p><p><span style=\";font-family:宋体;font-size:14px\">&nbsp;</span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">适用对象：</span></span></p><p style=\"text-indent:28px\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">本地互联网创业者；</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">为什么要做小程序：</span></span></p><p style=\"text-indent:28px;text-align:justify;text-justify:inter-ideograph\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">小程序新颖的东西能让您快速的收取商家费用，</span>VIP<span style=\"font-family:宋体\">可以包年服务！每个预约信息都可以换取</span><span style=\"font-family:Calibri\">RMB</span></span></p><p><br/></p>',1503312405,'36.5.163.28','婚庆小程序'),(10,'商家114小程序',1,'<p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">标题：一款收集本地商家服务的微信小程序</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">核心功能：</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">1、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">商家搜索：分类可以自定义，收集本地商家，</span>VIP<span style=\"font-family:宋体\">有</span><span style=\"font-family:Calibri\">LOGO</span><span style=\"font-family:宋体\">展示，普通商家文字展示！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">2、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">商家名片系统：分享商家的名片可以统计分享数，商家的小程序名片很新颖的一个物件！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">3、</span><span style=\";font-family:宋体;font-size:14px\">GPS<span style=\"font-family:宋体\">距离定位：可以按照距离来查询最近的商家。</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">4、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">商家预约系统：可以在线对商家进行预约到店功能</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">5、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">拨打电话统计功能：用户拨打电话后会记录拨打过哪些商家，拨打过多少次数！</span></span></p><p><span style=\";font-family:宋体;font-size:14px\">&nbsp;</span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">适用对象：</span></span></p><p style=\"text-indent:28px\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">本地互联网创业者；</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">为什么要做小程序：</span></span></p><p style=\"text-indent:28px;text-align:justify;text-justify:inter-ideograph\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">小程序新颖的东西能让您快速的收取商家费用，</span>VIP<span style=\"font-family:宋体\">可以包年服务！</span></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><br/></p><p><br/></p>',1503312430,'36.5.163.28','商家114小程序'),(11,'头条文章小程序',1,'<p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">标题：一款类似于今日头条、</span></span><span style=\";font-family:宋体;font-size:14px\">UC<span style=\"font-family:宋体\">头条的</span></span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">微信小程序</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">核心功能：</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">1、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">纯文章头条</span>:<span style=\"font-family:宋体\">可以发布类似段子之类的头条</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">2、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">图文混合的头条</span>:<span style=\"font-family:宋体\">内容排版比较丰富可以图文混排</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">3、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">纯视频的头条：可以发布视频头条</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">4、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">点赞评论功能：用户可以点赞别人的评论和自己发表评论，增加互动</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">适用对象：</span></span></p><p style=\"text-indent:28px\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">拥有微信公众账号粉丝的用户，可以直接开通头条小程序，可以把更多的内容展现给用户！而且比微信公众账号的</span>H5<span style=\"font-family:宋体\">访问更快速！</span></span></p><p><br/></p>',1503312458,'36.5.163.28','头条文章小程序'),(12,'小视频小程序',1,'<p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">标题：一款专门做视频播放的小程序</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">适用对象：</span></span></p><p style=\"text-indent:28px\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">做视频类传播的微信公众账号的小程序绑定。游戏团队等等</span></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\";font-family:宋体;font-size:14px\">&nbsp;</span></p><p><br/></p>',1503312488,'36.5.163.28','小视频小程序'),(13,'人才招聘小程序',1,'<p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">标题：一款类似拉勾招聘的微信小程序</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">核心功能：</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">1、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">用户简历库：用户可以在线编辑自己的简历</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">2、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">招聘商家：商家有认证和未认证标识，以免不良商家的招聘信息！</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">3、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">招聘信息：商家可以发布招聘岗位</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">4、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">商家名片：精美的商家招聘名片，让商家乐于分享平台流量蹭蹭就上去了</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">5、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">商家购买用户简历：网站盈利的一大亮点</span></span></p><p style=\"text-indent:28px\"><span style=\"font-family:宋体;font-size:14px\">6、</span><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">搜索附近的工作：让找工作不再那么麻烦</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">适用对象：</span></span></p><p style=\"text-indent:28px\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">本地互联网创业者；</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">为什么要做小程序：</span></span></p><p style=\"text-indent:28px;text-align:justify;text-justify:inter-ideograph\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">小程序新颖的东西能让您快速的收取商家费用，</span>VIP<span style=\"font-family:宋体\">可以包年服务！</span></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">小程序截图：</span></span></p><p><br/></p>',1503312515,'36.5.163.28','人才招聘小程序'),(14,'如何使用微点应用小程序',1,'<p style=\"text-indent:28px;text-align:justify;text-justify:inter-ideograph\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">第一步：访问</span>http://xcx.mestudio.cn</span></p><p>&nbsp;&nbsp;&nbsp;&nbsp;</p><p style=\"text-indent:28px;text-align:justify;text-justify:inter-ideograph\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">第二步：点击右上角的注册账号</span></span></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p><img src=\"/attachs/ueditor/image/20171218/1513558512833396.jpg\" alt=\"1513558512833396.jpg\" width=\"770\"/></p><p><br/></p><p style=\"text-indent:28px;text-align:justify;text-justify:inter-ideograph\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">第三步：完成注册后自动登录到用户中心</span></span></p><p style=\"text-indent:28px;text-align:justify;text-justify:inter-ideograph\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">第四步：点击我管理的小程序小程序管理</span></span></p><p><img src=\"/attachs/ueditor/image/20170821/1503312801752876.png\" title=\"1503312801752876.png\" alt=\"图片2.png\" width=\"770\"/></p><p><br/></p><p style=\"text-indent:28px;text-align:justify;text-justify:inter-ideograph\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">然后点击添加小程序</span></span></p><p><img src=\"/attachs/ueditor/image/20170821/1503312836298828.png\" title=\"1503312836298828.png\" alt=\"图片3.png\" width=\"770\"/></p><p style=\"text-indent:28px;text-align:justify;text-justify:inter-ideograph\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">出现下图这个页面</span></span></p><p><img src=\"/attachs/ueditor/image/20170821/1503312866254250.png\" title=\"1503312866254250.png\" alt=\"图片4.png\" width=\"770\"/></p><p style=\"text-indent:28px\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">扫描绑定授权的小程序后！</span></span></p><p><br/></p><p><img src=\"/attachs/ueditor/image/20170821/1503312908954685.png\" title=\"1503312908954685.png\" alt=\"图片5.png\" width=\"770\"/></p><p style=\"text-indent:28px\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">这里会多一条数据！</span></span></p><p style=\"text-indent:28px\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">第五步：点击左侧模板商城下的模板商城菜单！会打开如下图</span></span></p><p><img src=\"/attachs/ueditor/image/20170821/1503312947294333.png\" title=\"1503312947294333.png\" alt=\"图片6.png\" width=\"770\"/></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">点击您想要的程序进行试用或者立刻购买</span></span></p><p><img src=\"/attachs/ueditor/image/20170821/1503312981574155.png\" title=\"1503312981574155.png\" alt=\"图片7.png\" width=\"770\"/></p><p><br/></p><p><img src=\"/attachs/ueditor/image/20170821/1503313016615515.png\" title=\"1503313016615515.png\" alt=\"图片8.png\" width=\"770\"/></p><p><br/></p><p style=\"text-indent:28px\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">现在我的小程序后确定试用！</span></span></p><p><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">第六步：返回我管理的小程序</span></span><span style=\";font-family:宋体;font-size:14px\">=<span style=\"font-family:宋体\">》小程序管理</span></span></p><p><img src=\"/attachs/ueditor/image/20170821/1503313053332480.png\" title=\"1503313053332480.png\" alt=\"图片9.png\" width=\"770\"/></p><p style=\"text-indent:28px\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">有个青绿色的戴眼镜的按钮叫管理小程序！</span></span></p><p style=\"text-indent:28px\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">点击后会进入</span></span></p><p><br/></p><p><br/></p><p><img src=\"/attachs/ueditor/image/20170821/1503313094883467.png\" title=\"1503313094883467.png\" alt=\"图片10.png\" width=\"770\"/></p><p><br/></p><p><img src=\"/attachs/ueditor/image/20170821/1503313121849494.png\" title=\"1503313121849494.png\" alt=\"图片11.png\"/></p><p style=\"text-indent:28px\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">核心的功能区域，点击上传代码</span></span><span style=\";font-family:宋体;font-size:14px\">&nbsp;&nbsp;<span style=\"font-family:宋体\">可以生成小程序的在线预览的体验版本！</span></span></p><p style=\"text-indent:28px\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">在体验版本将内容丰富后可以点击提交腾讯审核！</span></span></p><p style=\"text-indent:28px\"><span style=\";font-family:宋体;font-size:14px\"><span style=\"font-family:宋体\">等待审核通过后就可以发布我的小程序！</span></span></p><p><br/></p>',1503313136,'36.5.163.28','如何使用微点应用小程序'),(15,'酒店小程序修复详情BUG',1,'<p>酒店小程序修复详情BUG，原因程序员忘记关闭调试代码！</p><p><br/></p><p>所有已经购买酒店小程序的，请再次上传代码提交审核 覆盖线上！</p>',1505614574,'36.5.161.87','酒店小程序修复详情BUG'),(17,'国庆放假通知',1,'<p>&nbsp; &nbsp; &nbsp; &nbsp;国庆佳节即将到来，根据国务院关于法定节假日的规定和我单位工作实际情况，现将2013年国庆节放假的有关事项通知如下：</p><p>&nbsp; &nbsp; &nbsp;单位放假时间为10月1日到8日，10月9日正常上班。</p><p><br/></p><p>&nbsp; &nbsp; 欢渡国庆，共渡中秋!在这美好日子里，让我们用最真挚的祝福伴您渡过。祝：万事大吉，心想事成!</p>',1506755308,'36.5.160.124','国庆放假通知'),(18,'国庆佳节过后微点应用回来有惊喜哦',1,'<p>国庆佳节过后微点应用回来有惊喜哦&nbsp;</p>',1363700230,'36.5.160.124','国庆佳节过后微点应用回来有惊喜哦'),(19,'系统修复通知',1,'<p>企业官网小程序</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 修复解决了方案无法修改，且会自动添加内容</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 2. 修复企业动态无法修改&nbsp;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 3. 修复首页产品中心的展示，在安卓下无法滚动<br/></p><p>B2C商城小程序</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 1.修复产品展示和详情图片比例不统一 ，现为2:1左右的长方形</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 2.修复首页客服无法激活拨打电话功能</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 3.修复商品在不包邮状态下 无法更改邮费 与邮费自动增加 &quot;00&quot;</p><p><br/></p>',1507526839,'127.0.0.1','系统修复通知'),(20,'b2c商城小程序 修复通知',1,'<p>B2C商城底层进行了重新架构以及bug修复 请商家重新上传审核&nbsp;</p>',1508465562,'127.0.0.1','b2c商城小程序 修复通知'),(21,'代理商模块升级 修复部分已知BUG',1,'<p>代理商模块升级 修复部分已知BUG</p><p style=\"text-align: right;\"><br/><br/><br/><br/>---------------微点应用研发中心</p>',1508560686,'127.0.0.1','代理商模块升级 修复部分已知BUG'),(22,'代理商模块升级  新增代理商自定义LOGO，名称等功能',1,'<p>代理商模块升级&nbsp; 新增代理商自定义LOGO，名称等功能</p>',1513560751,'222.134.33.194','代理商模块升级  新增代理商自定义LOGO，名称等功能'),(23,'官网首页升级完毕，更高端大气',1,'<p>官网首页升级完毕，更高端大气</p><p><br/></p><p><img src=\"/attachs/ueditor/image/20171218/1513558512833396.jpg\"/></p><p><img src=\"/attachs/ueditor/image/20171218/1513558280780295.jpg\"/></p><p><img src=\"/attachs/ueditor/image/20171218/1513558279101748.jpg\"/></p><p><br/></p>',1513560838,'222.134.33.194','官网首页升级完毕，更高端大气');

/*Table structure for table `wxb_njl_comment` */

DROP TABLE IF EXISTS `wxb_njl_comment`;

CREATE TABLE `wxb_njl_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1套餐2房间',
  `product_id` int(11) DEFAULT '0',
  `store_id` int(11) DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `order_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `content` varchar(1024) NOT NULL DEFAULT '',
  `reply` varchar(1024) NOT NULL DEFAULT '',
  `reply_time` int(11) NOT NULL DEFAULT '0',
  `reply_ip` varchar(15) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_njl_comment` */

/*Table structure for table `wxb_njl_comment_photo` */

DROP TABLE IF EXISTS `wxb_njl_comment_photo`;

CREATE TABLE `wxb_njl_comment_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(128) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_njl_comment_photo` */

/*Table structure for table `wxb_njl_news` */

DROP TABLE IF EXISTS `wxb_njl_news`;

CREATE TABLE `wxb_njl_news` (
  `news_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1文章2视频',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `author` varchar(64) DEFAULT NULL,
  `photo1` varchar(150) NOT NULL DEFAULT '' COMMENT '图片1',
  `photo2` varchar(150) NOT NULL DEFAULT '' COMMENT '图片2',
  `photo3` varchar(150) NOT NULL DEFAULT '' COMMENT '图片3',
  `video_url` varchar(512) NOT NULL DEFAULT '' COMMENT '视频地址',
  `comment_num` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `share_num` int(11) DEFAULT '0' COMMENT '分享数',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_njl_news` */

/*Table structure for table `wxb_njl_news_comment` */

DROP TABLE IF EXISTS `wxb_njl_news_comment`;

CREATE TABLE `wxb_njl_news_comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT NULL,
  `news_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(256) DEFAULT NULL,
  `zan_num` int(11) DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_njl_news_comment` */

/*Table structure for table `wxb_njl_news_contents` */

DROP TABLE IF EXISTS `wxb_njl_news_contents`;

CREATE TABLE `wxb_njl_news_contents` (
  `content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT '0',
  `news_id` int(11) DEFAULT '0',
  `photo` varchar(255) DEFAULT NULL,
  `content` text,
  `orderby` int(11) DEFAULT '0' COMMENT '这里是数值越小排序越高',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_njl_news_contents` */

/*Table structure for table `wxb_njl_order` */

DROP TABLE IF EXISTS `wxb_njl_order`;

CREATE TABLE `wxb_njl_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL COMMENT '小程序id',
  `order_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1套餐2房间',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员',
  `stroe_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商家id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '产品根据type不同所属商品则不同',
  `package_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '如果是套餐id则表示:套餐id',
  `product_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '产品数量 （游玩人数：房间数）',
  `total_price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '一共需要支付',
  `need_pay` int(11) DEFAULT '0',
  `pay_money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已支付余额',
  `pay_coupon` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券',
  `lijian` int(11) DEFAULT '0',
  `pay_coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠卷id',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_info` text,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `mobile` char(11) NOT NULL DEFAULT '0' COMMENT '联系人手机',
  `idcard` varchar(18) DEFAULT NULL,
  `is_comment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否评论',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未支付 1等待商户接单 2待使用 3 取消订单, 8完成',
  `bg_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '入住时间',
  `end_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '结束时间 type 为1 是 才有效',
  `cancel_type` tinyint(1) unsigned DEFAULT '0' COMMENT '1用户取消2:商户取消',
  `cancel_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `cancel_info` varchar(150) NOT NULL DEFAULT '' COMMENT '取消理由',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：会员订单不显示',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_njl_order` */

/*Table structure for table `wxb_njl_package` */

DROP TABLE IF EXISTS `wxb_njl_package`;

CREATE TABLE `wxb_njl_package` (
  `package_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taocan_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周边id',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '套餐标题',
  `photo` varchar(128) NOT NULL DEFAULT '' COMMENT '展示图片',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '日常价格',
  `is_cancel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以取消',
  `is_changes` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以改签',
  `details` varchar(128) NOT NULL DEFAULT '' COMMENT '详情说明明',
  `especially` varchar(128) NOT NULL DEFAULT '' COMMENT '特别说明',
  `cancel` varchar(128) NOT NULL DEFAULT '' COMMENT '退订规则',
  `changes` varchar(128) NOT NULL DEFAULT '' COMMENT '改签政策',
  `day_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '单日最大预定数',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1上架',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`package_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_njl_package` */

/*Table structure for table `wxb_njl_project` */

DROP TABLE IF EXISTS `wxb_njl_project`;

CREATE TABLE `wxb_njl_project` (
  `project_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `title` varchar(64) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_njl_project` */

/*Table structure for table `wxb_njl_room` */

DROP TABLE IF EXISTS `wxb_njl_room`;

CREATE TABLE `wxb_njl_room` (
  `room_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0 则就是 官网的小程序；',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '房间标题',
  `area` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '面积',
  `photo` varchar(128) NOT NULL DEFAULT '' COMMENT '展示图片',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '日常价格',
  `is_wifi` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有网络',
  `day_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '单日最大预定数',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1上架',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `appropriate_num` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`room_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_njl_room` */

/*Table structure for table `wxb_njl_room_price` */

DROP TABLE IF EXISTS `wxb_njl_room_price`;

CREATE TABLE `wxb_njl_room_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `day` date NOT NULL COMMENT '日期',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  `room_num` smallint(5) NOT NULL DEFAULT '0' COMMENT '房间已售',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0今天不买了',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`price_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_njl_room_price` */

/*Table structure for table `wxb_njl_store` */

DROP TABLE IF EXISTS `wxb_njl_store`;

CREATE TABLE `wxb_njl_store` (
  `store_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:农家乐平台，2：农家乐官网',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL DEFAULT '',
  `title` varchar(128) NOT NULL DEFAULT '',
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `nav_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航id',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `store_tel` char(12) NOT NULL DEFAULT '' COMMENT '电话',
  `store_weixin` varchar(64) NOT NULL DEFAULT '' COMMENT '微信',
  `store_company` varchar(64) NOT NULL DEFAULT '' COMMENT '公司',
  `traffic` varchar(255) NOT NULL DEFAULT '' COMMENT '交通信息',
  `score` tinyint(2) NOT NULL DEFAULT '0' COMMENT '点评分',
  `commenr_num` int(11) NOT NULL DEFAULT '0' COMMENT '点评数',
  `zan_num` int(10) unsigned NOT NULL DEFAULT '0',
  `introduce` text NOT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `city_id` int(11) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_delete` tinyint(1) unsigned DEFAULT '0',
  `banner` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_njl_store` */

/*Table structure for table `wxb_njl_store_photo` */

DROP TABLE IF EXISTS `wxb_njl_store_photo`;

CREATE TABLE `wxb_njl_store_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_njl_store_photo` */

/*Table structure for table `wxb_njl_taocan` */

DROP TABLE IF EXISTS `wxb_njl_taocan`;

CREATE TABLE `wxb_njl_taocan` (
  `taocan_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '城市id',
  `nav_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '套餐类型',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商家id',
  `title` varchar(255) NOT NULL DEFAULT '',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `banner` varchar(150) DEFAULT NULL,
  `score` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '评分 0 - 50',
  `order_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单数',
  `praise_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '好评数',
  `bad_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '差评数',
  `price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '起价',
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1开业0关店',
  `restrict` varchar(500) NOT NULL DEFAULT '' COMMENT '预定限制',
  `usetime` varchar(500) NOT NULL DEFAULT '' COMMENT '使用时间',
  `service` varchar(500) NOT NULL DEFAULT '' COMMENT '服务',
  `method` varchar(500) NOT NULL DEFAULT '' COMMENT '预定限制',
  `other` varchar(500) NOT NULL DEFAULT '' COMMENT '其他',
  `plus` varchar(500) NOT NULL DEFAULT '' COMMENT '加购',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`taocan_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_njl_taocan` */

/*Table structure for table `wxb_njl_taocan_photo` */

DROP TABLE IF EXISTS `wxb_njl_taocan_photo`;

CREATE TABLE `wxb_njl_taocan_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `orderby` int(11) NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `member_miniapp_id` int(11) unsigned NOT NULL DEFAULT '0',
  `taocan_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`photo_id`),
  UNIQUE KEY `orderby` (`orderby`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_njl_taocan_photo` */

/*Table structure for table `wxb_njl_taocan_price` */

DROP TABLE IF EXISTS `wxb_njl_taocan_price`;

CREATE TABLE `wxb_njl_taocan_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `package_id` int(10) unsigned NOT NULL DEFAULT '0',
  `taocan_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `day` date NOT NULL COMMENT '日期',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  `day_num` smallint(5) NOT NULL DEFAULT '0' COMMENT '房间已售',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0今天不买了',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`price_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_njl_taocan_price` */

/*Table structure for table `wxb_o2oarea_store` */

DROP TABLE IF EXISTS `wxb_o2oarea_store`;

CREATE TABLE `wxb_o2oarea_store` (
  `store_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL DEFAULT '' COMMENT '商家名称',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `views_num` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '标题',
  `good_num` tinyint(2) NOT NULL DEFAULT '0' COMMENT '好评率',
  `photo` varchar(64) NOT NULL DEFAULT '' COMMENT '图片地址',
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '设置为人气',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `introduce` varchar(255) NOT NULL DEFAULT '' COMMENT '介绍',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `open` varchar(64) NOT NULL DEFAULT '' COMMENT '营业时间',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_o2oarea_store` */

/*Table structure for table `wxb_order` */

DROP TABLE IF EXISTS `wxb_order`;

CREATE TABLE `wxb_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `member_miniapp_id` int(11) DEFAULT '0' COMMENT '关联我的小程序id',
  `is_delete` tinyint(1) unsigned DEFAULT '0' COMMENT '删除',
  `expir_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=348 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_order` */

insert  into `wxb_order`(`order_id`,`member_id`,`miniapp_id`,`member_miniapp_id`,`is_delete`,`expir_time`,`add_time`,`add_ip`) values (338,237,30,179,0,1546925757,1515389756,'222.134.33.194'),(339,238,37,180,0,1516002677,1515397876,'58.63.65.2'),(340,238,27,180,0,1516003092,1515398291,'58.63.65.2'),(341,238,25,180,0,1516003161,1515398360,'58.63.65.2'),(342,238,32,180,0,1516003778,1515398977,'58.63.65.2'),(343,238,19,180,0,1516009193,1515404392,'36.7.147.74'),(344,239,37,181,0,1516024828,1515420027,'43.227.137.36'),(345,240,23,182,0,1516026504,1515421703,'171.125.96.165'),(346,244,31,183,0,1516350565,1515745764,'58.222.254.74'),(347,248,37,180,0,1561098326,1529562326,'127.0.0.1');

/*Table structure for table `wxb_pay` */

DROP TABLE IF EXISTS `wxb_pay`;

CREATE TABLE `wxb_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applet_id` varchar(255) DEFAULT NULL,
  `appid` varchar(255) NOT NULL,
  `appsecret` varchar(255) NOT NULL,
  `mchid` varchar(255) NOT NULL,
  `mchkey` varchar(255) NOT NULL,
  `cert_pem` varchar(255) NOT NULL,
  `key_pem` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_pay` */

/*Table structure for table `wxb_payorder` */

DROP TABLE IF EXISTS `wxb_payorder`;

CREATE TABLE `wxb_payorder` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` varchar(30) NOT NULL,
  `trade_no` varchar(150) DEFAULT NULL COMMENT '交易号',
  `order_money` int(100) DEFAULT '0',
  `unit_name` varchar(10) NOT NULL,
  `pay_type` varchar(20) DEFAULT NULL COMMENT '支付方式',
  `state` int(2) NOT NULL DEFAULT '0',
  `addtime` int(10) NOT NULL,
  `update_time` int(10) DEFAULT '0',
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_payorder` */

insert  into `wxb_payorder`(`id`,`order_no`,`trade_no`,`order_money`,`unit_name`,`pay_type`,`state`,`addtime`,`update_time`,`member_id`) values (106,'201801160019299372',NULL,100,'','weixin',0,1516033169,0,247),(107,'201801160021261091',NULL,10000,'','weixin',0,1516033286,0,247);

/*Table structure for table `wxb_pinche` */

DROP TABLE IF EXISTS `wxb_pinche`;

CREATE TABLE `wxb_pinche` (
  `pinche_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1人找车，车找人',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(64) NOT NULL DEFAULT '0' COMMENT '姓名',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '联系方式',
  `begin` varchar(64) NOT NULL DEFAULT '' COMMENT '出发地',
  `end` varchar(64) NOT NULL DEFAULT '' COMMENT '目的地',
  `channel` varchar(64) NOT NULL DEFAULT '' COMMENT '途径',
  `bg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发日期',
  `vacancy` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '空位',
  `car` varchar(64) NOT NULL DEFAULT '' COMMENT '车型',
  `demand` varchar(255) NOT NULL DEFAULT '' COMMENT '留言',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0发布中 1已完成',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1男2女',
  PRIMARY KEY (`pinche_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_pinche` */

/*Table structure for table `wxb_public_banner` */

DROP TABLE IF EXISTS `wxb_public_banner`;

CREATE TABLE `wxb_public_banner` (
  `banner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='通用banner';

/*Data for the table `wxb_public_banner` */

/*Table structure for table `wxb_public_category` */

DROP TABLE IF EXISTS `wxb_public_category`;

CREATE TABLE `wxb_public_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `category_name` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '分类图标',
  `color` char(7) NOT NULL DEFAULT '' COMMENT '颜色',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_public_category` */

/*Table structure for table `wxb_public_comment` */

DROP TABLE IF EXISTS `wxb_public_comment`;

CREATE TABLE `wxb_public_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `resource_id` int(11) DEFAULT NULL,
  `content` varchar(256) DEFAULT NULL,
  `reply` varchar(256) NOT NULL DEFAULT '',
  `reply_time` int(11) NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_public_comment` */

/*Table structure for table `wxb_school` */

DROP TABLE IF EXISTS `wxb_school`;

CREATE TABLE `wxb_school` (
  `member_miniapp_id` int(11) unsigned NOT NULL,
  `company_name` varchar(64) NOT NULL DEFAULT '' COMMENT '公司名称',
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '联系人',
  `tel` varchar(12) NOT NULL DEFAULT '' COMMENT '电话',
  `traffic` varchar(255) NOT NULL DEFAULT '' COMMENT '交通信息',
  `introduce` text NOT NULL COMMENT '学校介绍',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `weixin` varchar(64) DEFAULT '',
  PRIMARY KEY (`member_miniapp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_school` */

insert  into `wxb_school`(`member_miniapp_id`,`company_name`,`lat`,`lng`,`address`,`name`,`tel`,`traffic`,`introduce`,`add_time`,`add_ip`,`weixin`) values (182,'山西半径生活信息技术有限公司','38.412613','112.722809','山西省忻州市忻府区新建路街道建设南路','张峰磊','15703509048','这是测试','乘坐168路公交车即可到校',1515421953,'171.125.96.165','');

/*Table structure for table `wxb_school_activity` */

DROP TABLE IF EXISTS `wxb_school_activity`;

CREATE TABLE `wxb_school_activity` (
  `activity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '活动标题',
  `date` varchar(64) NOT NULL DEFAULT '' COMMENT '活动时间',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0 : 免费',
  `addr` varchar(155) NOT NULL DEFAULT '' COMMENT '集合地点',
  `num` smallint(6) NOT NULL DEFAULT '0' COMMENT '最大报名人数',
  `already_num` smallint(6) NOT NULL DEFAULT '0' COMMENT '已经报名数',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `photo` varchar(150) DEFAULT '',
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_school_activity` */

insert  into `wxb_school_activity`(`activity_id`,`member_miniapp_id`,`title`,`date`,`price`,`addr`,`num`,`already_num`,`orderby`,`add_time`,`add_ip`,`photo`) values (2,182,'抓小偷','周五上午',10,'西门坡',99,0,1,1515422449,'171.125.96.165','20180108\\c9009465964b4b076b7fce0e61b73ca9.png');

/*Table structure for table `wxb_school_activity_contents` */

DROP TABLE IF EXISTS `wxb_school_activity_contents`;

CREATE TABLE `wxb_school_activity_contents` (
  `content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT '0',
  `activity_id` int(11) DEFAULT '0',
  `photo` varchar(255) DEFAULT NULL,
  `content` text,
  `orderby` int(11) DEFAULT '0' COMMENT '这里是数值越小排序越高',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_school_activity_contents` */

insert  into `wxb_school_activity_contents`(`content_id`,`member_miniapp_id`,`activity_id`,`photo`,`content`,`orderby`,`add_time`,`add_ip`) values (3,182,2,'20180108\\c9009465964b4b076b7fce0e61b73ca9.png','萨达萨达所多撒撒奥所大所',1,1515422449,'171.125.96.165');

/*Table structure for table `wxb_school_activity_entry` */

DROP TABLE IF EXISTS `wxb_school_activity_entry`;

CREATE TABLE `wxb_school_activity_entry` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) NOT NULL DEFAULT '0',
  `activity_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '咨询者称呼',
  `mobile` char(12) NOT NULL DEFAULT '' COMMENT '咨询则手机号',
  `message` text NOT NULL COMMENT '备注信息',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_school_activity_entry` */

/*Table structure for table `wxb_school_banner` */

DROP TABLE IF EXISTS `wxb_school_banner`;

CREATE TABLE `wxb_school_banner` (
  `banner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) unsigned NOT NULL,
  `photo` varchar(150) NOT NULL DEFAULT '',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_school_banner` */

insert  into `wxb_school_banner`(`banner_id`,`member_miniapp_id`,`photo`,`orderby`,`add_time`,`add_ip`) values (14,182,'20180108\\4b6fc909efd797073ff7ce05e242dd01.png',0,1515421895,'171.125.96.165');

/*Table structure for table `wxb_school_class` */

DROP TABLE IF EXISTS `wxb_school_class`;

CREATE TABLE `wxb_school_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '课程名字',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '列表图片',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '不X100用来展示的价格',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1课程名称,2学员风才',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_school_class` */

insert  into `wxb_school_class`(`class_id`,`member_miniapp_id`,`title`,`photo`,`price`,`orderby`,`type`,`add_time`,`add_ip`) values (7,182,'这是测试','20180108\\b06baa613618f3b0b05ffad18708af9e.png',0,0,1,1515422241,'171.125.96.165'),(8,182,'这是测试','',0,0,2,1515422358,'171.125.96.165');

/*Table structure for table `wxb_school_contents` */

DROP TABLE IF EXISTS `wxb_school_contents`;

CREATE TABLE `wxb_school_contents` (
  `content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT '0',
  `class_id` int(11) DEFAULT '0',
  `photo` varchar(255) DEFAULT NULL,
  `content` text,
  `orderby` int(11) DEFAULT '0' COMMENT '这里是数值越小排序越高',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_school_contents` */

insert  into `wxb_school_contents`(`content_id`,`member_miniapp_id`,`class_id`,`photo`,`content`,`orderby`,`add_time`,`add_ip`) values (17,182,7,'20180108\\b06baa613618f3b0b05ffad18708af9e.png','2002年的第一场雪，比以往来的更晚一些',1,1515422241,'171.125.96.165'),(18,182,8,'20180108\\a6f05cc009268fa87e216a15e1e66b15.png','大萨达撒多撒多撒大所大多',1,1515422358,'171.125.96.165');

/*Table structure for table `wxb_school_entry` */

DROP TABLE IF EXISTS `wxb_school_entry`;

CREATE TABLE `wxb_school_entry` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `class_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '咨询者称呼',
  `mobile` char(12) NOT NULL DEFAULT '' COMMENT '咨询则手机号',
  `message` text NOT NULL COMMENT '备注信息',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_school_entry` */

/*Table structure for table `wxb_school_photo` */

DROP TABLE IF EXISTS `wxb_school_photo`;

CREATE TABLE `wxb_school_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) unsigned NOT NULL,
  `photo` varchar(150) NOT NULL DEFAULT '',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `title` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_school_photo` */

insert  into `wxb_school_photo`(`photo_id`,`member_miniapp_id`,`photo`,`orderby`,`add_time`,`add_ip`,`title`) values (6,182,'20180108\\0eeef4c6a9404cc29fa4d642c92e6f14.png',0,1515422063,'171.125.96.165',NULL),(7,182,'20180108\\fc43a66cb71f5925fccab9be853dfa94.jpg',0,1515422071,'171.125.96.165',NULL),(8,182,'20180108\\6d81f53000a1a87eac697be1295aef72.png',0,1515422078,'171.125.96.165',NULL);

/*Table structure for table `wxb_school_player` */

DROP TABLE IF EXISTS `wxb_school_player`;

CREATE TABLE `wxb_school_player` (
  `player_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vote_id` int(11) unsigned NOT NULL DEFAULT '0',
  `player_name` varchar(64) NOT NULL DEFAULT '' COMMENT '选手名称',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '选手图片',
  `introduce` text NOT NULL COMMENT '介绍',
  `vote_num` int(11) NOT NULL DEFAULT '0' COMMENT '投票数',
  `view_num` int(11) NOT NULL DEFAULT '0' COMMENT '浏览数',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '编号',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `member_miniapp_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`player_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_school_player` */

/*Table structure for table `wxb_school_teacher` */

DROP TABLE IF EXISTS `wxb_school_teacher`;

CREATE TABLE `wxb_school_teacher` (
  `teacher_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '教师名称',
  `zhiwu` varchar(64) NOT NULL DEFAULT '' COMMENT '教师职务',
  `introduce` text NOT NULL COMMENT '介绍',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`teacher_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_school_teacher` */

insert  into `wxb_school_teacher`(`teacher_id`,`member_miniapp_id`,`photo`,`name`,`zhiwu`,`introduce`,`orderby`,`add_time`,`add_ip`) values (3,182,'20180108\\0335b20d02cef86b3b2ab37fdf5efa5f.jpg','张老师','光杆司令','我啥都不会教，只会捣乱',1,1515422294,'171.125.96.165');

/*Table structure for table `wxb_school_user_vote` */

DROP TABLE IF EXISTS `wxb_school_user_vote`;

CREATE TABLE `wxb_school_user_vote` (
  `user_vote_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '0',
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`user_vote_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_school_user_vote` */

/*Table structure for table `wxb_school_vote` */

DROP TABLE IF EXISTS `wxb_school_vote`;

CREATE TABLE `wxb_school_vote` (
  `vote_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '标题',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `bg_time` int(11) unsigned NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `vote_num` int(11) NOT NULL DEFAULT '0' COMMENT '总投票数',
  `view_num` int(11) NOT NULL DEFAULT '0' COMMENT '浏览数',
  `entry_num` int(11) NOT NULL DEFAULT '0' COMMENT ' 已报名数',
  `rule` text NOT NULL COMMENT '活动规则',
  `introduce` text NOT NULL COMMENT '介绍',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`vote_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_school_vote` */

insert  into `wxb_school_vote`(`vote_id`,`member_miniapp_id`,`title`,`photo`,`bg_time`,`end_time`,`vote_num`,`view_num`,`entry_num`,`rule`,`introduce`,`add_time`,`add_ip`) values (2,182,'最美跌列人物评选','20180108\\73008c291ba4b7b75dc9976cbbe211ca.jpg',1515422507,1517241600,0,2,0,'这是测试，啥都没有','这是测试，不需要介绍',1515422534,'171.125.96.165');

/*Table structure for table `wxb_service_category` */

DROP TABLE IF EXISTS `wxb_service_category`;

CREATE TABLE `wxb_service_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `color` char(7) NOT NULL DEFAULT '' COMMENT '背景色',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型  1:维修类服务 2:商城3:阿姨服务',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_service_category` */

/*Table structure for table `wxb_service_enroll` */

DROP TABLE IF EXISTS `wxb_service_enroll`;

CREATE TABLE `wxb_service_enroll` (
  `enroll_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '名字',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机',
  `address` varchar(128) NOT NULL DEFAULT '' COMMENT '地址',
  `lat` varchar(15) NOT NULL DEFAULT '',
  `lng` varchar(15) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1维修类2阿姨类',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `total_money` int(10) unsigned NOT NULL DEFAULT '0',
  `pay_money` int(10) unsigned NOT NULL DEFAULT '0',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0',
  `pay_info` text NOT NULL,
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 代付款 1已付款待接单 2已接单请联系商家 3拒绝订单 4用户取消 5已退款 6未付款已取消  8已完成',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`enroll_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_service_enroll` */

/*Table structure for table `wxb_service_nanny` */

DROP TABLE IF EXISTS `wxb_service_nanny`;

CREATE TABLE `wxb_service_nanny` (
  `nanny_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '保姆名称',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '头像',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `prie` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '预约需支付价格',
  `day` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '该价格 服务多少天',
  `yv_price` int(11) unsigned NOT NULL DEFAULT '0',
  `age` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '年龄',
  `place` varchar(24) NOT NULL DEFAULT '' COMMENT '籍贯',
  `work` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '工作经验',
  `home` varchar(24) NOT NULL DEFAULT '' COMMENT '现居住地',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1保姆2月嫂',
  `education` varchar(24) NOT NULL DEFAULT '' COMMENT '学历',
  `nation` varchar(24) NOT NULL DEFAULT '' COMMENT '民族',
  `certificates` varchar(150) NOT NULL DEFAULT '' COMMENT '已有证件',
  `evaluate` varchar(150) NOT NULL DEFAULT '' COMMENT '综合评价',
  `skill` varchar(255) NOT NULL DEFAULT '' COMMENT '技能ids',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_hot` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1推荐到首页',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `views_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `yvyue_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '预约数',
  `comment_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  PRIMARY KEY (`nanny_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_service_nanny` */

/*Table structure for table `wxb_service_nanny_photo` */

DROP TABLE IF EXISTS `wxb_service_nanny_photo`;

CREATE TABLE `wxb_service_nanny_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `nanny_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_service_nanny_photo` */

/*Table structure for table `wxb_service_nanny_skill` */

DROP TABLE IF EXISTS `wxb_service_nanny_skill`;

CREATE TABLE `wxb_service_nanny_skill` (
  `skill_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(150) NOT NULL DEFAULT '',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`skill_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_service_nanny_skill` */

/*Table structure for table `wxb_service_repair` */

DROP TABLE IF EXISTS `wxb_service_repair`;

CREATE TABLE `wxb_service_repair` (
  `repair_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '列表图片',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '标题',
  `title2` varchar(64) NOT NULL DEFAULT '' COMMENT '标题2',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '预约的价格',
  `introduce` text NOT NULL COMMENT '介绍',
  `is_hot` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1推荐到首页',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序最高的6个会展示到首页',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`repair_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_service_repair` */

/*Table structure for table `wxb_service_repair_sku` */

DROP TABLE IF EXISTS `wxb_service_repair_sku`;

CREATE TABLE `wxb_service_repair_sku` (
  `sku_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `repair_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '项目id',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '项目名称',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '日常价格',
  `hd_price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动价格',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`sku_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_service_repair_sku` */

/*Table structure for table `wxb_setting` */

DROP TABLE IF EXISTS `wxb_setting`;

CREATE TABLE `wxb_setting` (
  `k` varchar(32) NOT NULL DEFAULT '',
  `v` text,
  PRIMARY KEY (`k`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_setting` */

insert  into `wxb_setting`(`k`,`v`) values ('token','a:2:{s:1:\"t\";i:1516033159;s:5:\"token\";s:135:\"5_-4heRlTcehI5Dtju4JZHBNkcZNit5PCB2Uhik9EsIdZKLWmJF01UyC3q9gEqnCEbs4p-rF_KPkPkhLUu9nN1JQA-gzKKIplFqe9EFjQlsNWtF0GJlptzse0gOIYPQSiACAYZB\";}'),('agent','a:3:{i:1;a:2:{s:4:\"name\";s:15:\"普通代理商\";s:8:\"discount\";s:2:\"90\";}i:2;a:2:{s:4:\"name\";s:15:\"一级代理商\";s:8:\"discount\";s:2:\"70\";}i:3;a:2:{s:4:\"name\";s:12:\"OME代理商\";s:8:\"discount\";s:2:\"10\";}}');

/*Table structure for table `wxb_sheying` */

DROP TABLE IF EXISTS `wxb_sheying`;

CREATE TABLE `wxb_sheying` (
  `member_miniapp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `trade` varchar(64) NOT NULL DEFAULT '' COMMENT '营业时间',
  `mobile` char(12) NOT NULL DEFAULT '' COMMENT '联系方式',
  `introduce` text NOT NULL COMMENT '介绍',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_sheying` */

insert  into `wxb_sheying`(`member_miniapp_id`,`lat`,`lng`,`address`,`trade`,`mobile`,`introduce`,`add_time`,`add_ip`) values (179,'37.379586','118.020879','山东省滨州市滨城区市中街道渤海七路578号','8:00-18:00','15169991113','微城婚纱摄影的梦幻国度，一切起于对稀松平常现实的叛逆，源于高于生活的至尚追求。微城人是一群特立独行的旅人，\r\n一群叛逃现实的理想者，携带着一路上不老的光怪梦想，以及对完美极致的渴求，用相机诠释属于自己心目中的神幻领域。',1515390945,'222.134.33.194');

/*Table structure for table `wxb_sheying_banner` */

DROP TABLE IF EXISTS `wxb_sheying_banner`;

CREATE TABLE `wxb_sheying_banner` (
  `banner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_sheying_banner` */

insert  into `wxb_sheying_banner`(`banner_id`,`member_miniapp_id`,`photo`,`orderby`,`add_time`,`add_ip`) values (13,179,'20180108\\11bcfd45adb240bc90edbc93cc235f68.png',0,1515390707,'222.134.33.194'),(14,179,'20180108\\5e233e6bc27bc414c39b6bf0ae579775.png',0,1515390707,'222.134.33.194'),(15,179,'20180108\\68f40544eabdb67e3510b490f8787401.png',0,1515390709,'222.134.33.194');

/*Table structure for table `wxb_sheying_category` */

DROP TABLE IF EXISTS `wxb_sheying_category`;

CREATE TABLE `wxb_sheying_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_sheying_category` */

insert  into `wxb_sheying_category`(`category_id`,`member_miniapp_id`,`name`,`add_time`,`add_ip`) values (15,179,'国内系列',1515390834,'222.134.33.194'),(16,179,'复古系列',1515390844,'222.134.33.194'),(17,179,'室内场景',1515390880,'222.134.33.194'),(18,179,'室外场景',1515390886,'222.134.33.194');

/*Table structure for table `wxb_sheying_enroll` */

DROP TABLE IF EXISTS `wxb_sheying_enroll`;

CREATE TABLE `wxb_sheying_enroll` (
  `enroll_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '电话',
  `remarks` text NOT NULL,
  `date` varchar(64) NOT NULL DEFAULT '' COMMENT '预约日期',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`enroll_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_sheying_enroll` */

/*Table structure for table `wxb_sheying_photo` */

DROP TABLE IF EXISTS `wxb_sheying_photo`;

CREATE TABLE `wxb_sheying_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `works_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_sheying_photo` */

insert  into `wxb_sheying_photo`(`photo_id`,`member_miniapp_id`,`works_id`,`photo`,`add_time`,`add_ip`) values (69,179,12,'20180108\\a5037ebb3370415557a0e17f54fd6686.jpg',1515391276,'222.134.33.194'),(70,179,12,'20180108\\5ae1a43206dd081abcc9e1a0e2a41b6f.jpg',1515391276,'222.134.33.194'),(82,179,13,'20180108/303650b5df626419a853f9c5a445e740.jpg',1515391583,'222.134.33.194'),(81,179,13,'20180108/c8fc16e2dbf9d1e2ca919999cd904dfa.jpg',1515391583,'222.134.33.194'),(80,179,13,'20180108/6688ec4f976ddfe97a3cde2dcdd0f841.jpg',1515391583,'222.134.33.194'),(79,179,13,'20180108/8b8e95ab8e620a1fda8af77589e2e3cb.jpg',1515391583,'222.134.33.194'),(75,179,14,'20180108\\ff8e643e05494d7ae78fd92b7f68af52.jpg',1515391494,'222.134.33.194'),(76,179,14,'20180108\\1672535aed70eed431df141d3c035aee.jpg',1515391494,'222.134.33.194'),(77,179,15,'20180108\\d29a12071722f36669c8ed0820280a29.jpg',1515391527,'222.134.33.194'),(78,179,15,'20180108\\e0e2d88dcb4e8972930d4870e12dc817.jpg',1515391527,'222.134.33.194');

/*Table structure for table `wxb_sheying_works` */

DROP TABLE IF EXISTS `wxb_sheying_works`;

CREATE TABLE `wxb_sheying_works` (
  `works_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`works_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_sheying_works` */

insert  into `wxb_sheying_works`(`works_id`,`member_miniapp_id`,`title`,`category_id`,`photo`,`orderby`,`add_time`,`add_ip`) values (12,179,'民国风',15,'20180108\\a5037ebb3370415557a0e17f54fd6686.jpg',1,1515391276,'222.134.33.194'),(13,179,'京城',15,'20180108/8b8e95ab8e620a1fda8af77589e2e3cb.jpg',2,1515391333,'222.134.33.194'),(14,179,'天空之城',18,'20180108\\ff8e643e05494d7ae78fd92b7f68af52.jpg',3,1515391494,'222.134.33.194'),(15,179,'风车',18,'20180108\\d29a12071722f36669c8ed0820280a29.jpg',4,1515391527,'222.134.33.194');

/*Table structure for table `wxb_shop_banner` */

DROP TABLE IF EXISTS `wxb_shop_banner`;

CREATE TABLE `wxb_shop_banner` (
  `banner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT 'banner',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `orderby` int(11) DEFAULT '0',
  PRIMARY KEY (`banner_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_shop_banner` */

/*Table structure for table `wxb_shop_cart` */

DROP TABLE IF EXISTS `wxb_shop_cart`;

CREATE TABLE `wxb_shop_cart` (
  `cart_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `sku_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'SKUid',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`cart_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_shop_cart` */

/*Table structure for table `wxb_shop_category` */

DROP TABLE IF EXISTS `wxb_shop_category`;

CREATE TABLE `wxb_shop_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type_name` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `orderby` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否推荐到首页',
  `color` char(7) DEFAULT '' COMMENT '颜色',
  `photo` varchar(150) DEFAULT '' COMMENT '图标',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_shop_category` */

insert  into `wxb_shop_category`(`category_id`,`member_miniapp_id`,`type_name`,`pid`,`orderby`,`add_time`,`add_ip`,`is_hot`,`color`,`photo`) values (100,180,'测试',0,0,1515398205,'58.63.65.2',0,'','');

/*Table structure for table `wxb_shop_comment` */

DROP TABLE IF EXISTS `wxb_shop_comment`;

CREATE TABLE `wxb_shop_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `order_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `content` varchar(1024) NOT NULL DEFAULT '',
  `reply` varchar(1024) NOT NULL DEFAULT '',
  `reply_time` int(11) NOT NULL DEFAULT '0',
  `reply_ip` varchar(15) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_shop_comment` */

/*Table structure for table `wxb_shop_comment_photo` */

DROP TABLE IF EXISTS `wxb_shop_comment_photo`;

CREATE TABLE `wxb_shop_comment_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(128) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_shop_comment_photo` */

/*Table structure for table `wxb_shop_contents` */

DROP TABLE IF EXISTS `wxb_shop_contents`;

CREATE TABLE `wxb_shop_contents` (
  `content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT '0',
  `photo` varchar(255) DEFAULT NULL,
  `content` text,
  `orderby` int(11) DEFAULT '0' COMMENT '这里是数值越小排序越高',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM AUTO_INCREMENT=333 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_shop_contents` */

/*Table structure for table `wxb_shop_goods` */

DROP TABLE IF EXISTS `wxb_shop_goods`;

CREATE TABLE `wxb_shop_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `goods_name` varchar(64) NOT NULL DEFAULT '' COMMENT '商品名称',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '商品图片',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格 最小价格',
  `shop_price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商城价',
  `give_integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '赠送多少积分',
  `user_integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大使用多少积分integral 100 积分等于一块钱',
  `is_mail` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否包邮',
  `mail_price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邮费价格',
  `service_ids` varchar(64) NOT NULL DEFAULT '' COMMENT '服务',
  `brief` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简略',
  `spec` text NOT NULL COMMENT '规格',
  `ctn` text NOT NULL COMMENT '包装',
  `sales_volume` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `surplus_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总库存',
  `like_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '喜欢',
  `is_online` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上架',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否店长推荐',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_shop_goods` */

/*Table structure for table `wxb_shop_goods_type` */

DROP TABLE IF EXISTS `wxb_shop_goods_type`;

CREATE TABLE `wxb_shop_goods_type` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type_name` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  `surplus_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_shop_goods_type` */

/*Table structure for table `wxb_shop_order` */

DROP TABLE IF EXISTS `wxb_shop_order`;

CREATE TABLE `wxb_shop_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `total_price` int(11) DEFAULT '0' COMMENT '总价',
  `need_pay` int(11) DEFAULT '0' COMMENT '实际需要支付',
  `pay_coupon` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券',
  `pay_lijian` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '在线立减',
  `pay_integral` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '积分抵扣',
  `pay_coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠卷id',
  `pay_money` int(11) DEFAULT '0' COMMENT '已支付',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_info` text,
  `is_comment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否评论',
  `status` tinyint(3) DEFAULT '0' COMMENT '0 等待支付 1待发货 2已发货 3申请取消 4已退款 8订单已完成',
  `mail_number` varchar(64) NOT NULL DEFAULT '' COMMENT '快递信息',
  `name` varchar(64) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `gps_addr` varchar(128) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `cancel_type` tinyint(1) unsigned DEFAULT '0' COMMENT '1用户取消2:商户取消',
  `cancel_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `cancel_info` varchar(150) NOT NULL DEFAULT '' COMMENT '取消理由',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：会员订单不显示',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `mail_price` int(11) DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_shop_order` */

/*Table structure for table `wxb_shop_order_sku` */

DROP TABLE IF EXISTS `wxb_shop_order_sku`;

CREATE TABLE `wxb_shop_order_sku` (
  `sku_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0',
  `price` int(11) unsigned NOT NULL DEFAULT '0',
  `num` int(11) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `is_comment` tinyint(1) DEFAULT '0' COMMENT '0',
  `order_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '11',
  PRIMARY KEY (`sku_id`)
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_shop_order_sku` */

/*Table structure for table `wxb_skin_setting` */

DROP TABLE IF EXISTS `wxb_skin_setting`;

CREATE TABLE `wxb_skin_setting` (
  `member_miniapp_id` int(11) unsigned NOT NULL COMMENT '小程序id',
  `service_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '客服电话',
  `complaint_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '投诉电话',
  `about` varchar(255) NOT NULL DEFAULT '' COMMENT '关于我们',
  `app_name` varchar(155) NOT NULL DEFAULT '' COMMENT '站点名称',
  `mini_appid` varchar(255) DEFAULT '' COMMENT '微信小程序支appid',
  `mini_appsecrept` varchar(255) NOT NULL DEFAULT '',
  `mini_mid` varchar(255) NOT NULL DEFAULT '',
  `mini_apicode` varchar(255) DEFAULT NULL,
  `apiclient_cert` varchar(150) NOT NULL COMMENT '证书pem格式',
  `apiclient_cert_key` varchar(150) NOT NULL COMMENT '证书秘钥pem格式',
  `is_pay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启在线支付立减',
  `pay_money` int(11) unsigned NOT NULL DEFAULT '0',
  `skin` char(7) NOT NULL DEFAULT '0099e5' COMMENT '皮肤颜色16进制值',
  `logo` varchar(150) DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`member_miniapp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_skin_setting` */

insert  into `wxb_skin_setting`(`member_miniapp_id`,`service_tel`,`complaint_tel`,`about`,`app_name`,`mini_appid`,`mini_appsecrept`,`mini_mid`,`mini_apicode`,`apiclient_cert`,`apiclient_cert_key`,`is_pay`,`pay_money`,`skin`,`logo`,`add_time`,`add_ip`) values (179,'15169991113','15169991113','婚纱摄影小程序','婚纱摄影','','','',NULL,'','',0,0,'#23c6c8','20180108\\7429c173ed6102137bc1ac5d301a8848.png',1515390549,'222.134.33.194'),(182,'4008699421','0350-2070111','测试','兰妮国际幼儿园','','','',NULL,'','',0,0,'#08d3ff','20180108\\d43bb10f480dccbb6a4936ab431488d6.png',1515421844,'171.125.96.165');

/*Table structure for table `wxb_taocan` */

DROP TABLE IF EXISTS `wxb_taocan`;

CREATE TABLE `wxb_taocan` (
  `taocan_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '城市id',
  `province_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '省份id',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `nav_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航id',
  `destination_id` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '目的地推荐id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '套餐类型：1套餐  2酒店 3门票 4餐饮',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商家id',
  `taocan_name` varchar(128) NOT NULL DEFAULT '' COMMENT '商户名称',
  `taocan_tel` varchar(12) NOT NULL DEFAULT '0' COMMENT '周边游电话',
  `opening_time` varchar(64) NOT NULL DEFAULT '0' COMMENT '开门时间',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `banner` varchar(150) DEFAULT NULL,
  `score` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '评分 0 - 50',
  `order_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单数',
  `praise_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '好评数',
  `bad_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '差评数',
  `advantage` varchar(8) NOT NULL DEFAULT '' COMMENT '优势最多8个字',
  `price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '起价',
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `scenic_spot_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '景点id',
  `area_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商圈id',
  `administration_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行政区域id',
  `station_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '车站id',
  `colleges_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '高校id',
  `hospital_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '医院id',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1开业0关店',
  `is_hot` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`taocan_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_taocan` */

/*Table structure for table `wxb_taocan_banner` */

DROP TABLE IF EXISTS `wxb_taocan_banner`;

CREATE TABLE `wxb_taocan_banner` (
  `banner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT 'banner图片',
  `url` varchar(128) NOT NULL DEFAULT '' COMMENT '地址',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `note` varchar(32) NOT NULL DEFAULT '' COMMENT 'banner 备注',
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_taocan_banner` */

/*Table structure for table `wxb_taocan_comment` */

DROP TABLE IF EXISTS `wxb_taocan_comment`;

CREATE TABLE `wxb_taocan_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `taocan_id` int(11) DEFAULT '0',
  `store_id` int(11) DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `order_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `content` varchar(1024) NOT NULL DEFAULT '',
  `reply` varchar(1024) NOT NULL DEFAULT '',
  `reply_time` int(11) NOT NULL DEFAULT '0',
  `reply_ip` varchar(15) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_taocan_comment` */

/*Table structure for table `wxb_taocan_comment_photo` */

DROP TABLE IF EXISTS `wxb_taocan_comment_photo`;

CREATE TABLE `wxb_taocan_comment_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(128) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_taocan_comment_photo` */

/*Table structure for table `wxb_taocan_destination` */

DROP TABLE IF EXISTS `wxb_taocan_destination`;

CREATE TABLE `wxb_taocan_destination` (
  `destination_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '',
  `title2` varchar(255) NOT NULL DEFAULT '',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `province_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '省份id',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否热门推荐该景点',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  `city_id` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`destination_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_taocan_destination` */

/*Table structure for table `wxb_taocan_destination_join` */

DROP TABLE IF EXISTS `wxb_taocan_destination_join`;

CREATE TABLE `wxb_taocan_destination_join` (
  `join_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `destination_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '目的s地景点id',
  `taocan_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '套餐id',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`join_id`),
  KEY `destination_id` (`destination_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_taocan_destination_join` */

/*Table structure for table `wxb_taocan_detail` */

DROP TABLE IF EXISTS `wxb_taocan_detail`;

CREATE TABLE `wxb_taocan_detail` (
  `taocan_id` int(10) unsigned NOT NULL,
  `restrict` varchar(500) NOT NULL DEFAULT '' COMMENT '预定限制',
  `usetime` varchar(500) NOT NULL DEFAULT '' COMMENT '使用时间',
  `service` varchar(500) NOT NULL DEFAULT '' COMMENT '服务',
  `method` varchar(500) NOT NULL DEFAULT '' COMMENT '使用方式',
  `other` varchar(500) NOT NULL DEFAULT '' COMMENT '其他',
  `plus` varchar(500) NOT NULL DEFAULT '' COMMENT '加购',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`taocan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_taocan_detail` */

/*Table structure for table `wxb_taocan_manage` */

DROP TABLE IF EXISTS `wxb_taocan_manage`;

CREATE TABLE `wxb_taocan_manage` (
  `manage_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '授权此管理员员的小程序id',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商家id',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '管理员账号',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '授权人密码',
  `role_name` varchar(64) NOT NULL DEFAULT '' COMMENT '授权人角色名称',
  `mange_name` varchar(64) NOT NULL DEFAULT '' COMMENT '授权人姓名',
  `is_lock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定',
  `last_time` int(11) DEFAULT NULL,
  `last_ip` varchar(15) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`manage_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_taocan_manage` */

/*Table structure for table `wxb_taocan_nav` */

DROP TABLE IF EXISTS `wxb_taocan_nav`;

CREATE TABLE `wxb_taocan_nav` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `city_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '城市id',
  `nav_name` varchar(64) NOT NULL DEFAULT '' COMMENT '导航图标',
  `nav_ico` varchar(150) NOT NULL DEFAULT '' COMMENT '图标',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否展示',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`nav_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_taocan_nav` */

/*Table structure for table `wxb_taocan_nav_city` */

DROP TABLE IF EXISTS `wxb_taocan_nav_city`;

CREATE TABLE `wxb_taocan_nav_city` (
  `navcity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `city_id` int(10) unsigned NOT NULL DEFAULT '0',
  `nav_ids` varchar(255) NOT NULL DEFAULT '' COMMENT 'ids,号隔开',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`navcity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_taocan_nav_city` */

/*Table structure for table `wxb_taocan_order` */

DROP TABLE IF EXISTS `wxb_taocan_order`;

CREATE TABLE `wxb_taocan_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL COMMENT '小程序id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员',
  `taocan_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商家id',
  `package_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '房源id',
  `package_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '票的数量',
  `total_price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '一共需要支付',
  `need_pay` int(11) DEFAULT '0',
  `pay_money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已支付余额',
  `pay_coupon` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券',
  `lijian` int(11) DEFAULT '0',
  `pay_coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠卷id',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_info` text,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `mobile` char(11) NOT NULL DEFAULT '0' COMMENT '联系人手机',
  `idcard` varchar(18) DEFAULT NULL,
  `is_comment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否评论',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未支付 1等待商户接单 2待使用 3 取消订单, 8完成',
  `play_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '入住时间',
  `cancel_type` tinyint(1) unsigned DEFAULT '0' COMMENT '1用户取消2:商户取消',
  `cancel_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '取消时间',
  `cancel_info` varchar(150) NOT NULL DEFAULT '' COMMENT '取消理由',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：会员订单不显示',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`order_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_taocan_order` */

/*Table structure for table `wxb_taocan_package` */

DROP TABLE IF EXISTS `wxb_taocan_package`;

CREATE TABLE `wxb_taocan_package` (
  `package_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taocan_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周边id',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '套餐标题',
  `photo` varchar(128) NOT NULL DEFAULT '' COMMENT '展示图片',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '日常价格',
  `is_cancel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以取消',
  `is_changes` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以改签',
  `details` varchar(128) NOT NULL DEFAULT '' COMMENT '详情说明明',
  `especially` varchar(128) NOT NULL DEFAULT '' COMMENT '特别说明',
  `cancel` varchar(128) NOT NULL DEFAULT '' COMMENT '退订规则',
  `changes` varchar(128) NOT NULL DEFAULT '' COMMENT '改签政策',
  `day_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '单日最大预定数',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1上架',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`package_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_taocan_package` */

/*Table structure for table `wxb_taocan_package_price` */

DROP TABLE IF EXISTS `wxb_taocan_package_price`;

CREATE TABLE `wxb_taocan_package_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `package_id` int(10) unsigned NOT NULL DEFAULT '0',
  `taocan_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `day` date NOT NULL COMMENT '日期',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  `day_num` smallint(5) NOT NULL DEFAULT '0' COMMENT '房间已售',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0今天不买了',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`price_id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_taocan_package_price` */

/*Table structure for table `wxb_taocan_photo` */

DROP TABLE IF EXISTS `wxb_taocan_photo`;

CREATE TABLE `wxb_taocan_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taocan_id` int(10) unsigned NOT NULL DEFAULT '0',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(128) NOT NULL DEFAULT '',
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`),
  KEY `taocan_id` (`taocan_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_taocan_photo` */

/*Table structure for table `wxb_taocan_store` */

DROP TABLE IF EXISTS `wxb_taocan_store`;

CREATE TABLE `wxb_taocan_store` (
  `store_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) unsigned NOT NULL DEFAULT '0',
  `store_name` varchar(68) NOT NULL DEFAULT '' COMMENT '商家名称',
  `city_id` int(11) unsigned NOT NULL DEFAULT '0',
  `stroe_detail` varchar(255) NOT NULL DEFAULT '' COMMENT '介绍',
  `store_tel` varchar(12) NOT NULL DEFAULT '' COMMENT '负责人电话',
  `stroe_address` varchar(255) NOT NULL DEFAULT '' COMMENT '商家负责人住址',
  `store_idcard` char(18) NOT NULL DEFAULT '' COMMENT '商家负责人身份证号码',
  `lat` varchar(15) NOT NULL DEFAULT '',
  `lng` varchar(15) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_taocan_store` */

/*Table structure for table `wxb_tongcheng_advert` */

DROP TABLE IF EXISTS `wxb_tongcheng_advert`;

CREATE TABLE `wxb_tongcheng_advert` (
  `advert_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '广告图片',
  `info_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '信息id',
  `info` varchar(64) NOT NULL DEFAULT '' COMMENT '备注信息',
  `view_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `bg_data` date NOT NULL COMMENT '广告开始时间',
  `end_data` date NOT NULL COMMENT '广告结束时间',
  `is_end` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1强制不显示',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`advert_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_tongcheng_advert` */

/*Table structure for table `wxb_tongcheng_category` */

DROP TABLE IF EXISTS `wxb_tongcheng_category`;

CREATE TABLE `wxb_tongcheng_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  `ico` varchar(150) NOT NULL DEFAULT '' COMMENT 'ico',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `color` char(7) DEFAULT '',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_tongcheng_category` */

/*Table structure for table `wxb_tongcheng_comment` */

DROP TABLE IF EXISTS `wxb_tongcheng_comment`;

CREATE TABLE `wxb_tongcheng_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `info_id` int(11) DEFAULT NULL,
  `content` varchar(256) DEFAULT NULL,
  `reply` varchar(256) NOT NULL DEFAULT '',
  `reply_time` int(11) NOT NULL DEFAULT '0',
  `zan_num` int(11) DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `info_user_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_tongcheng_comment` */

/*Table structure for table `wxb_tongcheng_info` */

DROP TABLE IF EXISTS `wxb_tongcheng_info`;

CREATE TABLE `wxb_tongcheng_info` (
  `info_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0则显示 官方信息',
  `info` text NOT NULL COMMENT '内容',
  `view_num` smallint(6) NOT NULL DEFAULT '0' COMMENT '查看数',
  `comment_num` smallint(6) NOT NULL DEFAULT '0' COMMENT '评论数',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `tel` varchar(12) NOT NULL DEFAULT '' COMMENT '联系方式',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '置顶过期时间',
  `lat` varchar(15) NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(15) NOT NULL DEFAULT '' COMMENT '纬度',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `zan_num` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`info_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_tongcheng_info` */

/*Table structure for table `wxb_tongcheng_info_photo` */

DROP TABLE IF EXISTS `wxb_tongcheng_info_photo`;

CREATE TABLE `wxb_tongcheng_info_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `info_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_tongcheng_info_photo` */

/*Table structure for table `wxb_tongcheng_news_advert` */

DROP TABLE IF EXISTS `wxb_tongcheng_news_advert`;

CREATE TABLE `wxb_tongcheng_news_advert` (
  `advert_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '广告图片',
  `info_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '信息id',
  `info` varchar(64) NOT NULL DEFAULT '' COMMENT '备注信息',
  `view_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `bg_data` date NOT NULL COMMENT '广告开始时间',
  `end_data` date NOT NULL COMMENT '广告结束时间',
  `is_end` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1强制不显示',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`advert_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_tongcheng_news_advert` */

/*Table structure for table `wxb_tongcheng_order` */

DROP TABLE IF EXISTS `wxb_tongcheng_order`;

CREATE TABLE `wxb_tongcheng_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `total_price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '一共需要支付',
  `need_pay` int(11) DEFAULT '0',
  `day_num` smallint(6) NOT NULL DEFAULT '0' COMMENT '购买天数',
  `pay_money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已支付余额',
  `pay_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 支付失败 1支付成功',
  `pay_info` text NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `info_id` int(11) unsigned NOT NULL DEFAULT '0',
  `cancel_info` varchar(255) DEFAULT NULL,
  `cancel_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_tongcheng_order` */

/*Table structure for table `wxb_tongcheng_price` */

DROP TABLE IF EXISTS `wxb_tongcheng_price`;

CREATE TABLE `wxb_tongcheng_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  `day_num` smallint(6) NOT NULL DEFAULT '0' COMMENT '天数',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`price_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_tongcheng_price` */

/*Table structure for table `wxb_toutiao` */

DROP TABLE IF EXISTS `wxb_toutiao`;

CREATE TABLE `wxb_toutiao` (
  `toutiao_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1文章2视频',
  `nav_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `author` varchar(64) DEFAULT NULL,
  `photo1` varchar(150) DEFAULT '' COMMENT '图片1',
  `photo2` varchar(150) DEFAULT '' COMMENT '图片2',
  `photo3` varchar(150) DEFAULT '' COMMENT '图片3',
  `video_url` varchar(512) NOT NULL DEFAULT '' COMMENT '视频地址',
  `comment_num` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `share_num` int(11) DEFAULT '0' COMMENT '分享数',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`toutiao_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_toutiao` */

/*Table structure for table `wxb_toutiao_comment` */

DROP TABLE IF EXISTS `wxb_toutiao_comment`;

CREATE TABLE `wxb_toutiao_comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT NULL,
  `toutiao_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(256) DEFAULT NULL,
  `zan_num` int(11) DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_toutiao_comment` */

/*Table structure for table `wxb_toutiao_contents` */

DROP TABLE IF EXISTS `wxb_toutiao_contents`;

CREATE TABLE `wxb_toutiao_contents` (
  `content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT '0',
  `toutiao_id` int(11) DEFAULT '0',
  `photo` varchar(255) DEFAULT NULL,
  `content` text,
  `orderby` int(11) DEFAULT '0' COMMENT '这里是数值越小排序越高',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_toutiao_contents` */

/*Table structure for table `wxb_toutiao_nav` */

DROP TABLE IF EXISTS `wxb_toutiao_nav`;

CREATE TABLE `wxb_toutiao_nav` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `nav_name` varchar(24) NOT NULL DEFAULT '' COMMENT '导航名称',
  `orderby` int(11) DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  `is_show` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`nav_id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_toutiao_nav` */

/*Table structure for table `wxb_user` */

DROP TABLE IF EXISTS `wxb_user`;

CREATE TABLE `wxb_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `open_id` varchar(32) NOT NULL DEFAULT '',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `face` varchar(256) NOT NULL DEFAULT '' COMMENT '头像',
  `nick_name` varchar(128) NOT NULL DEFAULT '' COMMENT '昵称',
  `real_name` varchar(128) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `mobile` char(11) NOT NULL DEFAULT '0' COMMENT '手机号码',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0保密1男2女',
  `birthday` date DEFAULT '0000-00-00' COMMENT '生日',
  `day` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '登录天数',
  `last_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) DEFAULT '',
  `is_lock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_manage` tinyint(1) DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  PRIMARY KEY (`user_id`),
  KEY `member_miniapp_id` (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1723 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_user` */

insert  into `wxb_user`(`user_id`,`open_id`,`member_miniapp_id`,`face`,`nick_name`,`real_name`,`mobile`,`sex`,`birthday`,`day`,`last_time`,`last_ip`,`is_lock`,`is_manage`,`add_time`,`add_ip`,`integral`) values (1712,'oUswG0Wg02AdFgwCv3RoVrbtGLHk',179,'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoxZ1DibWG2yzibnGI3ibeAgE0rcjwiaQRjf4hBWLkpFu6Qg7phfWrKUIffnxhU7gIT8Ufwz2GLWBibiaZw/0','微城小程序','','0',1,'0000-00-00',2,1515553788,'222.134.33.194',0,0,1515390472,'222.134.33.194',0),(1713,'oUswG0TZccJmlkgQkdJ3PnzMiLVo',179,'','rdgztest_DZWKFD','','0',0,'0000-00-00',1,1515392495,'183.14.133.13',0,0,1515392495,'183.14.133.13',0),(1714,'o6aMW0UtyBkZjVfVsBBL6HMOU_sY',180,'','','','0',0,'0000-00-00',1,1515398034,'183.162.30.249',0,0,1515398034,'183.162.30.249',0),(1715,'oUswG0X0Z0NV0OZa2TlQ9AU3nukw',179,'','rdgztest_RTEPAP','','0',0,'0000-00-00',1,1515402147,'183.14.134.49',0,0,1515402147,'183.14.134.49',0),(1716,'oUswG0cRJLTOkZJCisd2wJrb9HKk',179,'','rdgztest_OEAPZW','','0',0,'0000-00-00',1,1515402635,'183.14.134.31',0,0,1515402635,'183.14.134.31',0),(1717,'oiJ4Y0Vk6FfJ1uJNWCPAGUVITCIU',182,'https://wx.qlogo.cn/mmopen/vi_32/d8nYib6w74U3yXpG5pfaLSiaWGewiczic4xndxzvoSuR55XbtalU6URMCq8PRibbGzdLCjy7xNICE9vCwZuDgHyUNxA/0','山西半径生活信息技术有限公司','','0',1,'0000-00-00',1,1515421775,'171.125.96.165',0,0,1515421775,'171.125.96.165',0),(1718,'oiJ4Y0b9kXQjz9-UKZYjybDN6H24',182,'','','','0',0,'0000-00-00',1,1515421804,'121.35.102.42',0,0,1515421804,'121.35.102.42',0),(1719,'oUswG0a0a7OaaQIo0Rj7KCMIvqwk',179,'','rdgztest_HQZHBB','','0',0,'0000-00-00',1,1515546290,'183.14.133.238',0,0,1515546290,'183.14.133.238',0),(1720,'oUswG0a35A00hLXxzghg7MjvqkCs',179,'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erDP0nibgzd2FYPCljRJr05nGrrgQfpCEdMgzn6d8Jflk0u2WJtlIEMAjgxSnwMToNZcI88YsWsYPg/0','【阿广】15628962175','','0',1,'0000-00-00',1,1515555188,'113.128.58.38',0,0,1515555188,'113.128.58.38',0),(1721,'oUswG0bUVmdjZ_lI0qTbQiIttUoE',179,'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKcthg7CBtDdOuom0NQus9SibiaGpWzNVaAoR9FRVdmiciahbB1YOuFKW0ttZbcdicyGQn7xsGhh1B9vxw/0','欢儿','','0',2,'0000-00-00',1,1515663859,'27.189.224.196',0,0,1515663859,'27.189.224.196',0),(1722,'oUswG0bDdpeHg3XXAYPwkj9iWC2g',179,'','','','0',0,'0000-00-00',1,1516038448,'112.245.240.78',0,0,1516038448,'112.245.240.78',0);

/*Table structure for table `wxb_user_address` */

DROP TABLE IF EXISTS `wxb_user_address`;

CREATE TABLE `wxb_user_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `gps_addr` varchar(128) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `idcard` varchar(32) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `is_delete` tinyint(1) DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_user_address` */

/*Table structure for table `wxb_user_log` */

DROP TABLE IF EXISTS `wxb_user_log`;

CREATE TABLE `wxb_user_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '1 余额 2 积分',
  `expend` tinyint(1) DEFAULT '0' COMMENT '消费类型： 0：支出 1：收入 (chenzhe:add)',
  `way` tinyint(2) DEFAULT '0' COMMENT '',
  `num` int(11) DEFAULT '0',
  `this_num` int(11) unsigned DEFAULT '0' COMMENT '当前剩余（chenzhe:add）',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_user_log` */

/*Table structure for table `wxb_version_log` */

DROP TABLE IF EXISTS `wxb_version_log`;

CREATE TABLE `wxb_version_log` (
  `version_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `miniapp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '小程序id',
  `this_version_num` varchar(10) NOT NULL DEFAULT '' COMMENT '最新版本号',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '升级描述(回车有效)',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`version_log_id`),
  KEY `miniapp_id` (`miniapp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wxb_version_log` */

/*Table structure for table `wxb_video` */

DROP TABLE IF EXISTS `wxb_video`;

CREATE TABLE `wxb_video` (
  `video_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `share_num` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '',
  `photo` varchar(155) NOT NULL DEFAULT '',
  `link` varchar(500) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`video_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_video` */

/*Table structure for table `wxb_video_comment` */

DROP TABLE IF EXISTS `wxb_video_comment`;

CREATE TABLE `wxb_video_comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(256) DEFAULT NULL,
  `zan_num` int(11) DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_video_comment` */

/*Table structure for table `wxb_video_tag` */

DROP TABLE IF EXISTS `wxb_video_tag`;

CREATE TABLE `wxb_video_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(64) NOT NULL DEFAULT '',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_video_tag` */

/*Table structure for table `wxb_video_tag_join` */

DROP TABLE IF EXISTS `wxb_video_tag_join`;

CREATE TABLE `wxb_video_tag_join` (
  `join_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0',
  `video_id` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`join_id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_video_tag_join` */

/*Table structure for table `wxb_video_type` */

DROP TABLE IF EXISTS `wxb_video_type`;

CREATE TABLE `wxb_video_type` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type_name` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  `photo` varchar(150) NOT NULL DEFAULT '' COMMENT '图片',
  `orderby` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_video_type` */

/*Table structure for table `wxb_waimai_category` */

DROP TABLE IF EXISTS `wxb_waimai_category`;

CREATE TABLE `wxb_waimai_category` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `orderby` int(11) DEFAULT '0' COMMENT '数值越大排序越高',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_waimai_category` */

/*Table structure for table `wxb_waimai_order` */

DROP TABLE IF EXISTS `wxb_waimai_order`;

CREATE TABLE `wxb_waimai_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT '0' COMMENT '总价',
  `peisong` int(11) DEFAULT '0',
  `dabao` int(11) DEFAULT '0',
  `pay_hongbao` int(11) DEFAULT '0' COMMENT '红包支付',
  `pay_money` int(11) DEFAULT '0',
  `pay_info` text,
  `pay_time` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0' COMMENT '0 等待支付  1已经支付 2已审核   4取消订单 8订单已完成',
  `name` varchar(64) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `gps_addr` varchar(128) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `last_time` int(11) DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_waimai_order` */

/*Table structure for table `wxb_waimai_order_product` */

DROP TABLE IF EXISTS `wxb_waimai_order_product`;

CREATE TABLE `wxb_waimai_order_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `price` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_waimai_order_product` */

/*Table structure for table `wxb_waimai_product` */

DROP TABLE IF EXISTS `wxb_waimai_product`;

CREATE TABLE `wxb_waimai_product` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT '0',
  `name` varchar(64) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `dabao` int(11) DEFAULT '0',
  `monthnum` int(11) DEFAULT '0',
  `totalnum` int(11) DEFAULT '0',
  `is_online` tinyint(1) DEFAULT '0' COMMENT '1代表上线销售中',
  `orderby` int(11) DEFAULT '0' COMMENT '排序',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_waimai_product` */

/*Table structure for table `wxb_waimai_setting` */

DROP TABLE IF EXISTS `wxb_waimai_setting`;

CREATE TABLE `wxb_waimai_setting` (
  `member_miniapp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qijia` int(11) DEFAULT '0',
  `peisong` int(11) DEFAULT '0',
  `is_online` tinyint(1) DEFAULT '0' COMMENT '是否营业',
  `add_time` int(11) DEFAULT NULL,
  `add_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`member_miniapp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_waimai_setting` */

/*Table structure for table `wxb_zhuangxiu_case` */

DROP TABLE IF EXISTS `wxb_zhuangxiu_case`;

CREATE TABLE `wxb_zhuangxiu_case` (
  `case_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_id` int(10) unsigned NOT NULL DEFAULT '0',
  `space_id` int(10) unsigned NOT NULL DEFAULT '0',
  `color_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '',
  `photo` varchar(155) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `orderby` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`case_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_zhuangxiu_case` */

/*Table structure for table `wxb_zhuangxiu_case_cat` */

DROP TABLE IF EXISTS `wxb_zhuangxiu_case_cat`;

CREATE TABLE `wxb_zhuangxiu_case_cat` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_name` varchar(64) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_zhuangxiu_case_cat` */

/*Table structure for table `wxb_zhuangxiu_case_color` */

DROP TABLE IF EXISTS `wxb_zhuangxiu_case_color`;

CREATE TABLE `wxb_zhuangxiu_case_color` (
  `color_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `color_name` varchar(64) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`color_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_zhuangxiu_case_color` */

/*Table structure for table `wxb_zhuangxiu_case_photo` */

DROP TABLE IF EXISTS `wxb_zhuangxiu_case_photo`;

CREATE TABLE `wxb_zhuangxiu_case_photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `case_id` int(10) unsigned NOT NULL DEFAULT '0',
  `photo` varchar(155) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `member_miniapp_id` int(11) unsigned NOT NULL DEFAULT '0',
  `orderby` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_zhuangxiu_case_photo` */

/*Table structure for table `wxb_zhuangxiu_case_space` */

DROP TABLE IF EXISTS `wxb_zhuangxiu_case_space`;

CREATE TABLE `wxb_zhuangxiu_case_space` (
  `space_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `space_name` varchar(64) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`space_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_zhuangxiu_case_space` */

/*Table structure for table `wxb_zhuangxiu_offer` */

DROP TABLE IF EXISTS `wxb_zhuangxiu_offer`;

CREATE TABLE `wxb_zhuangxiu_offer` (
  `offer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bedroom` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '卧室每间估价',
  `livingroom` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '客厅每间估价',
  `kitchen` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '厨房每间估价',
  `toilet` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '卫生间每间估价',
  `balcony` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阳台每间价格',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  `artificial` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '人工费总价百分比',
  `material` smallint(3) unsigned DEFAULT '0' COMMENT '材料费百分比',
  `design` smallint(3) unsigned DEFAULT '0' COMMENT '设计费',
  `inspect` smallint(3) unsigned DEFAULT '0' COMMENT '质检费百分比',
  PRIMARY KEY (`offer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_zhuangxiu_offer` */

/*Table structure for table `wxb_zhuangxiu_tender` */

DROP TABLE IF EXISTS `wxb_zhuangxiu_tender`;

CREATE TABLE `wxb_zhuangxiu_tender` (
  `tender_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_miniapp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `bedroom` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '卧室数量',
  `livingroom` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '客厅数量',
  `kitchen` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '厨房数量',
  `toilet` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '卫生间数量',
  `balcony` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阳台数量',
  `area` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '面积',
  `name` varchar(64) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  `content` varchar(1024) NOT NULL DEFAULT '',
  `add_time` int(11) DEFAULT '0',
  `add_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`tender_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `wxb_zhuangxiu_tender` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
