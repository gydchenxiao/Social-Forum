/*
SQLyog Ultimate v11.13 (64 bit)
MySQL - 5.7.30-log : Database - linfeng-community-ky
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*USE `linfeng-community-ky`;*/

/*Table structure for table `lf_category` */

DROP TABLE IF EXISTS `lf_category`;

CREATE TABLE `lf_category` (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `cate_name` varchar(50) NOT NULL COMMENT '分类名称',
  `is_top` int(1) DEFAULT '0' COMMENT '是否推荐',
  `cover_image` varchar(255) DEFAULT '' COMMENT '图片地址',
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `lf_category` */

insert  into `lf_category`(`cate_id`,`cate_name`,`is_top`,`cover_image`) values (1,'校园',0,'http://pic.linfeng.tech/test/20220210/88148b0cd20f4ad4a09ce61866024281.jpg'),(2,'音乐',1,'http://pic.linfeng.tech/test/20220207/8d796540337d4dd48ae11143fc570b77.jpg'),(3,'生活',1,'http://pic.linfeng.tech/test/20220207/69aaaff2132447dc9c4b893ce53e242d.jpg'),(4,'兴趣',0,'http://pic.linfeng.tech/test/20220210/c7d2e8489a5642ba91b7b5f97c282141.jpg'),(5,'运动',0,'http://pic.linfeng.tech/test/20220207/69aaaff2132447dc9c4b893ce53e242d.jpg'),(6,'旅行',1,'http://pic.linfeng.tech/test/20220207/69aaaff2132447dc9c4b893ce53e242d.jpg'),(7,'知识',0,'http://pic.linfeng.tech/test/20220210/9621f4992cf64393be7567159b8d13f8.jpeg'),(8,'动漫',0,'http://pic.linfeng.tech/test/20220207/69aaaff2132447dc9c4b893ce53e242d.jpg'),(9,'情感',0,'http://pic.linfeng.tech/test/20220207/69aaaff2132447dc9c4b893ce53e242d.jpg'),(10,'娱乐',0,'http://pic.linfeng.tech/test/20220207/69aaaff2132447dc9c4b893ce53e242d.jpg'),(11,'宠物',0,'http://pic.linfeng.tech/test/20220207/69aaaff2132447dc9c4b893ce53e242d.jpg'),(13,'美食',0,'http://pic.linfeng.tech/test/20220207/69aaaff2132447dc9c4b893ce53e242d.jpg'),(14,'职场',0,'http://pic.linfeng.tech/test/20220207/69aaaff2132447dc9c4b893ce53e242d.jpg'),(15,'摄影',1,'http://pic.linfeng.tech/test/20220207/69aaaff2132447dc9c4b893ce53e242d.jpg'),(16,'时尚',0,'http://pic.linfeng.tech/test/20220207/69aaaff2132447dc9c4b893ce53e242d.jpg'),(17,'阅读',0,'http://pic.linfeng.tech/test/20220207/69aaaff2132447dc9c4b893ce53e242d.jpg'),(18,'游戏',0,'http://pic.linfeng.tech/test/20220207/69aaaff2132447dc9c4b893ce53e242d.jpg'),(19,'打卡',0,'http://pic.linfeng.tech/test/20220207/2858506e3dca4a9a8367201ed04b80bb.png'),(22,'开发',0,'http://pic.linfeng.tech/test/20220207/223ba0004cf54969a68a0ffad58cc51f.png'),(23,'交流',0,'http://pic.linfeng.tech/test/20220207/e334ab448fb44083b3df5d288f18d261.jpg');

/*Table structure for table `lf_comment` */

DROP TABLE IF EXISTS `lf_comment`;

CREATE TABLE `lf_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` int(11) DEFAULT '0' COMMENT '父级id',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '评论类型',
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '评论作者ID',
  `to_uid` int(11) DEFAULT '0' COMMENT '被回复用户ID',
  `post_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '评论帖子ID',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '评论内容',
  `status` tinyint(4) DEFAULT '1' COMMENT '评论状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

/*Data for the table `lf_comment` */

insert  into `lf_comment`(`id`,`pid`,`type`,`uid`,`to_uid`,`post_id`,`content`,`status`,`create_time`) values (1,0,1,7,0,41,'校园社交论坛',1,'2024-04-23 10:42:17');

/*Table structure for table `lf_comment_thumbs` */

DROP TABLE IF EXISTS `lf_comment_thumbs`;

CREATE TABLE `lf_comment_thumbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `c_id` int(11) NOT NULL COMMENT '评论id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `lf_comment_thumbs` */

insert  into `lf_comment_thumbs`(`id`,`c_id`,`uid`,`create_time`) values (1,1,7,'2024-04-23 10:42:37');

/*Table structure for table `lf_follow` */

DROP TABLE IF EXISTS `lf_follow`;

CREATE TABLE `lf_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `follow_uid` int(11) NOT NULL COMMENT '关注的用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`,`follow_uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `lf_follow` */

/*Table structure for table `lf_link` */

DROP TABLE IF EXISTS `lf_link`;

CREATE TABLE `lf_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `url` varchar(255) NOT NULL COMMENT '跳转路径',
  `img` varchar(255) NOT NULL COMMENT '图片',
  `type` int(1) DEFAULT '3' COMMENT '广场轮播图',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `lf_link` */

insert  into `lf_link`(`id`,`title`,`url`,`img`,`type`,`create_time`) values (47,'v1.13.0','/pages/post/detail?id=9248','https://pic.linfeng.tech/test/20240228/22cf911537754b8aa30699ed625b384f.png',3,'2022-01-26 14:03:38'),(48,'晚安','/pages/post/detail?id=140','http://pic.linfeng.tech/test/20220418/fd00e1b7f5d84f50b7f06e7c232624f1.jpeg',3,'2022-01-26 14:03:38'),(49,'你好','/pages/post/detail?id=293','http://pic.linfeng.tech/test/20220719/c002d92851654755877cb1f3e7c9460d.jpeg',3,'2022-07-19 20:49:39');

/*Table structure for table `lf_post` */

DROP TABLE IF EXISTS `lf_post`;

CREATE TABLE `lf_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `topic_id` int(11) DEFAULT '0' COMMENT '圈子ID',
  `discuss_id` int(11) DEFAULT '0' COMMENT '话题ID',
  `vote_id` int(11) DEFAULT NULL COMMENT '投票ID',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COMMENT '内容',
  `media` text COMMENT '文件',
  `read_count` int(255) DEFAULT '0' COMMENT '浏览量',
  `post_top` int(1) DEFAULT '0' COMMENT '置顶',
  `type` int(1) DEFAULT '1' COMMENT '帖子类型1图文',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `longitude` double(10,6) DEFAULT '0.000000' COMMENT '经度',
  `latitude` double(10,6) DEFAULT '0.000000' COMMENT '纬度',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态0正常1审核',
  `cut` int(1) NOT NULL DEFAULT '0' COMMENT '分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `lf_post` */

insert  into `lf_post`(`id`,`uid`,`topic_id`,`discuss_id`,`vote_id`,`title`,`content`,`media`,`read_count`,`post_top`,`type`,`address`,`longitude`,`latitude`,`create_time`,`status`,`cut`) values (40,4,2,0,NULL,'项目说明','此版本为开源版，如需商业版请咨询官网客服：\r\nhttps://www.linfengtech.cn\r\n或者关注微信公众号：江苏省南京市科技','[]',5,0,1,'',0.000000,0.000000,'2023-08-01 16:33:23',0,1),(41,1,2,0,NULL,'关于项目','图一：说明  \r\n图二：咨询  \r\n图三：演示  \r\n图四：校园论坛\r\n,12334,0,1,'',0.000000,0.000000,'2023-08-02 16:33:23',0,1);

/*Table structure for table `lf_post_collection` */

DROP TABLE IF EXISTS `lf_post_collection`;

CREATE TABLE `lf_post_collection` (
  `uid` int(11) NOT NULL COMMENT '用户id',
  `post_id` int(11) NOT NULL COMMENT '帖子id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `lf_post_collection` */

insert  into `lf_post_collection`(`uid`,`post_id`) values (7,41);

/*Table structure for table `lf_system` */

DROP TABLE IF EXISTS `lf_system`;

CREATE TABLE `lf_system` (
  `config` varchar(50) NOT NULL,
  `value` text,
  `extend` text,
  `intro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`config`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `lf_system` */

insert  into `lf_system`(`config`,`value`,`extend`,`intro`) values ('miniapp','wx8068e9992da3e9d5','ba0b3020uio6bf078b8c0ada099e8ed','http://pic.linfeng.tech/test/20220724/9a665bf276a44827ad8ef0b3140a7d1d.png');

/*Table structure for table `lf_user` */

DROP TABLE IF EXISTS `lf_user`;

CREATE TABLE `lf_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `mobile` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机号',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `group_id` int(11) NOT NULL DEFAULT '2' COMMENT '用户组',
  `avatar` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '性别(0未知，1男，2女)',
  `province` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '省份',
  `city` varchar(20) CHARACTER SET utf8 DEFAULT '' COMMENT '城市',
  `openid` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '小程序openid',
  `mp_openid` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '公众号openid',
  `unionid` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'unionid',
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '状态',
  `intro` varchar(255) DEFAULT '这个人很懒，没留下什么' COMMENT '个性签名',
  `integral` int(255) DEFAULT '0' COMMENT '积分',
  `last_login_ip` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '最后登录ip',
  `tag_str` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '用户标签',
  `type` int(1) DEFAULT '0' COMMENT '0为普通用户 1官方账号',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

/*Data for the table `lf_user` */

insert  into `lf_user`(`uid`,`mobile`,`username`,`password`,`group_id`,`avatar`,`gender`,`province`,`city`,`openid`,`mp_openid`,`unionid`,`status`,`intro`,`integral`,`last_login_ip`,`tag_str`,`type`,`update_time`,`create_time`) values (1,'15678876545','示例2',NULL,2,'https://pic.linfeng.tech/test/20240121/2e6d70dc0a6b4ec7a86f1f065983b1c5.png',2,'','江苏省南京市','o7yfg4vyubvvxgjtaIuuuvcxcfGA',NULL,'ajskajskajskajskasd',1,'这个人很懒，没留下什么',0,'39.130.106.136','[\"萌新\",\"码农\",\"发帖达人\",\"运动\"]',0,'2022-01-21 15:12:16','2022-01-21 15:12:23'),(2,NULL,'pity',NULL,2,'http://pic.linfeng.tech/test/20220126/a58ae30c4bc44942afa4b9752bedc59b.jpeg',1,'','江苏省南京市','o8cxg9vudddhsjjOK33TavcklbGA',NULL,NULL,0,'这个人很懒，没留下什么',0,'39.130.106.135','[\"萌新\",\"码农\",\"发帖达人\",\"运动\"]',0,'2022-01-21 15:12:26','2022-01-21 15:12:28'),(3,NULL,'天边的云',NULL,2,'https://thirdwx.qlogo.cn/mmopen/vi_32/jXkb3ugwib7xMoiaOpz03GLBDEsy9G6e7m0iaIpWoIt1UpTxCzibQA4M5dAicSjQBkOYA7Yu6jgrTKqmMiag9jtWl5Aw/132',1,'','浙江省杭州市 移通','o6z2m5Cc8jzhvANf42L5LQQRXsuu',NULL,NULL,0,'这个人很懒',0,'0:0:0:0:0:0:0:1','[\"萌新\",\"圈子达人\",\"旅行\",\"软件开发\"]',0,'2022-02-10 14:25:25','2022-01-20 14:25:30'),(4,NULL,'示例',NULL,2,'https://thirdwx.qlogo.cn/mmopen/vi_32/DicojWMHWdvIFD9tQa7XBt1iaTBQtYJ4icLE9z971WErrNXLLdFmPvACiaHpmibuCKicoTR8S1Z7iayXYynRwEFgVqlnw/132',1,'','江苏省南京市','o6z2m5DdnR0-9BdqZfK3Z3f_i4tt',NULL,NULL,0,'这个人很懒，没留下什么',0,'0:0:0:0:0:0:0:1','[\"萌新\",\"码农\",\"发帖达人\",\"运动\"]',1,'2022-04-15 12:37:39','2022-01-27 14:21:58'),(6,'15669210138','LF_968742',NULL,2,'http://pic.linfeng.tech/test/20220305/6c6b1a1f1a904d5bb155daa48d2a0649.jpg',0,'','江苏省南京市 电信',NULL,NULL,NULL,0,'这个人很懒，没留下什么',0,'0:0:0:0:0:0:0:1','[\"萌新\"]',1,'2022-03-05 19:45:08','2022-03-05 19:42:28'),(7,'15105701666','LF_353869',NULL,2,'http://pic.linfeng.tech/test/20220126/4515fc2cbed74d0b9163d35a12bd4c3b.png',0,'','江苏省南京市 电信',NULL,NULL,NULL,0,'这个人很懒，没留下什么',0,'0:0:0:0:0:0:0:1','[\"萌新\"]',0,'2022-04-03 14:20:01','2022-04-03 14:18:40'),(8,'13245677090','LF_79271821',NULL,2,'http://pic.linfeng.tech/test/20220126/4515fc2cbed74d0b9163d35a12bd4c3b.png',0,'','',NULL,NULL,NULL,0,'这个人很懒，没留下什么',0,NULL,'[\"新人\"]',0,'2022-07-27 16:33:05','2022-07-27 16:33:05'),(12,NULL,'天边的云',NULL,2,'https://thirdwx.qlogo.cn/mmopen/vi_32/jXkb3ugwib7xMoiaOpz03GLBDEsy9G6e7m0iaIpWoIt1UpTxCzibQA4M5dAicSjQBkOYA7Yu6jgrTKqmMiag9jtWl5Aw/132',0,'','','o6z2m5Cc8jzhvANf42L5LQQRXsuY',NULL,NULL,0,'这个人很懒，没留下什么',0,NULL,'[\"新人\"]',0,'2022-08-18 11:03:36','2022-08-18 11:03:36'),(13,'15890909999','LF_74950175',NULL,2,'http://pic.linfeng.tech/test/20220126/4515fc2cbed74d0b9163d35a12bd4c3b.png',0,'','',NULL,NULL,NULL,0,'这个人很懒，没留下什么',0,NULL,'[\"新人\"]',0,'2022-09-04 10:48:54','2022-09-04 10:48:54'),(14,'17890909898','LF_55258784',NULL,2,'http://pic.linfeng.tech/test/20220126/4515fc2cbed74d0b9163d35a12bd4c3b.png',0,'','',NULL,NULL,NULL,0,'这个人很懒，没留下什么',0,NULL,'[\"新人\"]',0,'2022-10-08 13:41:03','2022-10-08 13:41:03');

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_cron_triggers` */

insert  into `qrtz_cron_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`CRON_EXPRESSION`,`TIME_ZONE_ID`) values ('RenrenScheduler','TASK_1','DEFAULT','0 0/30 * * * ?','Asia/Shanghai');

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_job_details` */

insert  into `qrtz_job_details`(`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`JOB_CLASS_NAME`,`IS_DURABLE`,`IS_NONCONCURRENT`,`IS_UPDATE_DATA`,`REQUESTS_RECOVERY`,`JOB_DATA`) values ('RenrenScheduler','TASK_1','DEFAULT',NULL,'io.linfeng.modules.job.utils.ScheduleJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0/io.linfeng.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0~(�d�xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0renrent\0参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0');

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_locks` */

insert  into `qrtz_locks`(`SCHED_NAME`,`LOCK_NAME`) values ('RenrenScheduler','STATE_ACCESS'),('RenrenScheduler','TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_scheduler_state` */

insert  into `qrtz_scheduler_state`(`SCHED_NAME`,`INSTANCE_NAME`,`LAST_CHECKIN_TIME`,`CHECKIN_INTERVAL`) values ('ProjectScheduler','LAPTOP-47M7VFTC1713840032062',1713840379425,15000),('RenrenScheduler','LAPTOP-47M7VFTC1641368553138',1641368599756,15000);

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_triggers` */

insert  into `qrtz_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`NEXT_FIRE_TIME`,`PREV_FIRE_TIME`,`PRIORITY`,`TRIGGER_STATE`,`TRIGGER_TYPE`,`START_TIME`,`END_TIME`,`CALENDAR_NAME`,`MISFIRE_INSTR`,`JOB_DATA`) values ('RenrenScheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1641369600000,-1,5,'WAITING','CRON',1641368553000,0,NULL,2,'');

/*Table structure for table `schedule_job` */

DROP TABLE IF EXISTS `schedule_job`;

CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务';

/*Data for the table `schedule_job` */

/*Table structure for table `schedule_job_log` */

DROP TABLE IF EXISTS `schedule_job_log`;

CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务日志';

/*Data for the table `schedule_job_log` */

/*Table structure for table `sys_captcha` */

DROP TABLE IF EXISTS `sys_captcha`;

CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统验证码';

/*Data for the table `sys_captcha` */

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态1显示0隐藏',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='系统配置信息表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`id`,`param_key`,`param_value`,`status`,`remark`) values (1,'CLOUD_STORAGE_CONFIG_KEY','{\"type\":2,\"qiniuDomain\":\"http://pic.linfeng.tech\",\"qiniuPrefix\":\"test\",\"qiniuAccessKey\":\"Fmp__H-4gMbT5nu-FSW7OzFKfFFPPkNO0CB\",\"qiniuSecretKey\":\"YVBVbxI_XXWlax5gXwwwzcIiNvqdeQNfb\",\"qiniuBucketName\":\"linfeng01\",\"aliyunDomain\":\"https://multishop.oss-cn-shenzhen.aliyuncs.com/\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"https://oss-cn-shenzhen.aliyuncs.com/\",\"aliyunAccessKeyId\":\"LTAIbbbbbbYgE0fyPX0iuX\",\"aliyunAccessKeySecret\":\"SH1ZOzzXH0WIg0gqyJ2oooYI5\",\"aliyunBucketName\":\"multshop\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qcloudBucketName\":\"\"}',0,'云存储配置信息');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长单位毫秒',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统日志';

/*Data for the table `sys_log` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '路径',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权',
  `type` int(11) DEFAULT NULL COMMENT '类型0目录1菜单2按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COMMENT='菜单管理';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`) values (1,0,'系统管理',NULL,NULL,0,'system',0),(2,1,'管理员列表','sys/user',NULL,1,'admin',1),(3,1,'角色管理','sys/role',NULL,1,'role',2),(4,1,'菜单管理','sys/menu',NULL,1,'menu',3),(5,1,'SQL监控','http://localhost:8080/druid/sql.html',NULL,1,'sql',4),(6,1,'定时任务','job/schedule',NULL,1,'job',5),(7,6,'查看',NULL,'sys:schedule:list,sys:schedule:info',2,NULL,0),(8,6,'新增',NULL,'sys:schedule:save',2,NULL,0),(9,6,'修改',NULL,'sys:schedule:update',2,NULL,0),(10,6,'删除',NULL,'sys:schedule:delete',2,NULL,0),(11,6,'暂停',NULL,'sys:schedule:pause',2,NULL,0),(12,6,'恢复',NULL,'sys:schedule:resume',2,NULL,0),(13,6,'立即执行',NULL,'sys:schedule:run',2,NULL,0),(14,6,'日志列表',NULL,'sys:schedule:log',2,NULL,0),(15,2,'查看',NULL,'sys:user:list,sys:user:info',2,NULL,0),(16,2,'新增',NULL,'sys:user:save,sys:role:select',2,NULL,0),(17,2,'修改',NULL,'sys:user:update,sys:role:select',2,NULL,0),(18,2,'删除',NULL,'sys:user:delete',2,NULL,0),(19,3,'查看',NULL,'sys:role:list,sys:role:info',2,NULL,0),(20,3,'新增',NULL,'sys:role:save,sys:menu:list',2,NULL,0),(21,3,'修改',NULL,'sys:role:update,sys:menu:list',2,NULL,0),(22,3,'删除',NULL,'sys:role:delete',2,NULL,0),(23,4,'查看',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),(24,4,'新增',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),(25,4,'修改',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),(26,4,'删除',NULL,'sys:menu:delete',2,NULL,0),(27,1,'参数管理','sys/config','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'config',6),(29,1,'系统日志','sys/log','sys:log:list',1,'log',7),(30,42,'文件上传','oss/oss','sys:oss:all',1,'oss',6),(36,0,'动态管理','','',0,'geren',3),(37,42,'应用配置管理','admin/system',NULL,1,'config',6),(38,37,'查看',NULL,'admin:system:list,admin:system:info',2,NULL,6),(39,37,'新增',NULL,'admin:system:save',2,NULL,6),(40,37,'修改',NULL,'admin:system:update',2,NULL,6),(41,37,'删除',NULL,'admin:system:delete',2,NULL,6),(42,0,'应用管理','','',0,'zhedie',2),(43,88,'会员管理','admin/user',NULL,1,'geren',6),(44,43,'查看',NULL,'admin:user:list,admin:user:info',2,NULL,6),(45,43,'新增',NULL,'admin:user:save',2,NULL,6),(46,43,'修改',NULL,'admin:user:update',2,NULL,6),(47,43,'删除',NULL,'admin:user:delete',2,NULL,6),(48,89,'分类管理','admin/category',NULL,1,'zhedie',6),(49,48,'查看',NULL,'admin:category:list,admin:category:info',2,NULL,6),(50,48,'新增',NULL,'admin:category:save',2,NULL,6),(51,48,'修改',NULL,'admin:category:update',2,NULL,6),(58,36,'帖子管理','admin/post',NULL,1,'config',6),(59,58,'查看',NULL,'admin:post:list,admin:post:info',2,NULL,6),(60,58,'新增',NULL,'admin:post:save',2,NULL,6),(61,58,'修改',NULL,'admin:post:update',2,NULL,6),(62,58,'删除',NULL,'admin:post:delete',2,NULL,6),(68,36,'评论管理','admin/comment',NULL,1,'config',6),(69,68,'查看',NULL,'admin:comment:list,admin:comment:info',2,NULL,6),(70,68,'新增',NULL,'admin:comment:save',2,NULL,6),(71,68,'修改',NULL,'admin:comment:update',2,NULL,6),(72,68,'删除',NULL,'admin:comment:delete',2,NULL,6),(78,42,'轮播图管理','admin/link',NULL,1,'config',6),(79,78,'查看',NULL,'admin:link:list,admin:link:info',2,NULL,6),(80,78,'新增',NULL,'admin:link:save',2,NULL,6),(81,78,'修改',NULL,'admin:link:update',2,NULL,6),(82,78,'删除',NULL,'admin:link:delete',2,NULL,6),(88,0,'用户管理','','',0,'admin',6),(89,0,'内容管理','','',0,'editor',9);

/*Table structure for table `sys_oss` */

DROP TABLE IF EXISTS `sys_oss`;

CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `url` varchar(200) DEFAULT NULL COMMENT '文件地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='文件上传';

/*Data for the table `sys_oss` */

insert  into `sys_oss`(`id`,`url`,`create_date`) values (1,'https://qingbaobbs.oss-cn-shenzhen.aliyuncs.com/20240423/b94d60f203b74f3a9fe8ca17d68703a3.jpg','2024-04-23 10:38:56');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建用户ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='角色';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`remark`,`create_user_id`,`create_time`) values (1,'运营','运营人员',1,'2022-01-05 13:35:45');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色与菜单对应关系';

/*Data for the table `sys_role_menu` */

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态1正常0禁用',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建用户ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='系统用户';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`username`,`password`,`salt`,`email`,`mobile`,`status`,`create_user_id`,`create_time`) values (1,'admin','cdac762d0ba79875489f6a8b430fa8b5dfe0cdd81da38b80f02f33328af7fd4a','YzcmCZNvbXocrsz9dm8e','root@163.com','18100900090',1,1,'2022-01-05 13:36:24'),(2,'yunying','5ad9030f5f5e49ed06e6dfb44f0da6f9a95cf9f68276207c1277c05d31bc5fc6','hXie4Fbhak1N6pNOtIoo','yunying@163.com','15669231234',1,1,'2022-01-05 13:36:24');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户与角色对应关系';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values (1,2,1);

/*Table structure for table `sys_user_token` */

DROP TABLE IF EXISTS `sys_user_token`;

CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `token` varchar(100) NOT NULL COMMENT 'token值',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统用户Token';

/*Data for the table `sys_user_token` */

insert  into `sys_user_token`(`user_id`,`token`,`expire_time`,`update_time`) values (1,'bae623cdee585dc9db254b8385488e1b','2022-10-21 03:48:44','2022-10-20 15:48:44'),(2,'354a481dc6c46c194bc1d01aa7f4bbeb','2022-01-06 02:55:50','2022-01-05 14:55:50');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
