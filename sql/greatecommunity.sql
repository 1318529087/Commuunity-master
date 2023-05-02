/*
Navicat MySQL Data Transfer

Source Server         : MySQL5.7
Source Server Version : 50739
Source Host           : localhost:3306
Source Database       : greatecommunity

Target Server Type    : MYSQL
Target Server Version : 50739
File Encoding         : 65001

Date: 2023-05-02 23:21:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `entity_type` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `content` text,
  `status` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`),
  KEY `index_entity_id` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '2', '1', '3', '4', '我是admin', '0', '2023-01-17 21:58:07');
INSERT INTO `comment` VALUES ('2', '4', '2', '1', '2', '我是tj', '0', '2023-01-18 13:12:39');
INSERT INTO `comment` VALUES ('6', '4', '1', '1', '2', '我是tj', '0', '2023-01-29 20:59:42');
INSERT INTO `comment` VALUES ('7', '4', '1', '1', '2', '我是tj', '0', '2023-01-29 21:01:46');
INSERT INTO `comment` VALUES ('8', '2', '1', '4', '2', '我是发帖的作者', '0', '2023-02-06 15:22:15');
INSERT INTO `comment` VALUES ('9', '4', '2', '8', '2', '我是tj，您的帖子我收获很大', '0', '2023-02-06 15:23:38');
INSERT INTO `comment` VALUES ('10', '3', '2', '8', '4', '我是th，我也感觉他的贴子很好', '0', '2023-02-06 15:24:53');

-- ----------------------------
-- Table structure for `discuss_post`
-- ----------------------------
DROP TABLE IF EXISTS `discuss_post`;
CREATE TABLE `discuss_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text,
  `type` int(11) DEFAULT NULL COMMENT '0-普通; 1-置顶;',
  `status` int(11) DEFAULT NULL COMMENT '0-正常; 1-精华; 2-拉黑;',
  `create_time` timestamp NULL DEFAULT NULL,
  `comment_count` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of discuss_post
-- ----------------------------
INSERT INTO `discuss_post` VALUES ('1', '2', 'admin的第一个帖子', '\n#### Welcome to community\n\n&gt; Course\n\n- java\n- C C++\n- Android\n- HTML\n- JavaScript\n\n#### Edit code\n```\npublic static void main(String[] args) {\n    System.out.println(&quot;My name is admin&quot;);\n}\n```\n#### Edit Msg\n```\n  我是admin,一个热爱编程的男孩\n```', '0', '0', '2023-01-14 20:54:41', '2', '3301.4149733479708');
INSERT INTO `discuss_post` VALUES ('2', '3', 'th的第一个帖子', '\n#### Welcome to community\n\n&gt; Course\n\n- Spring\n- SpringMVC\n- MyBatis\n- MyBatis-Plus\n- SpringBoot\n\n#### Edit code\n```\npublic static void main(String[] args) {\n    System.out.println(&quot;My name is th&quot;);\n}\n```\n#### Edit Msg\n```\n  我是th,一个热爱学习的男孩\n```', '0', '0', '2023-01-14 20:56:23', '0', '3300');
INSERT INTO `discuss_post` VALUES ('3', '4', 'tj的第一个帖子', '\n#### Welcome to community\n\n&gt; Course\n\n- Resid\n- RabbitMQ\n- Nginx\n- Kafka\n- SpringCloud\n\n#### Edit code\n```\npublic static void main(String[] args) {\n    System.out.println(&quot;My name is tj&quot;);\n}\n```\n#### Edit Msg\n```\n  我是tj,一个热爱生活的男孩\n```', '0', '0', '2023-01-14 20:58:22', '1', '3301.9395192526185');
INSERT INTO `discuss_post` VALUES ('4', '2', 'admin的第二个帖子', '\n#### Welcome to Echo\n\n&gt; Examples\n\n- TeX (Based on KaTeX);\n- Emoji;\n- Task lists;\n- HTML tags decode;\n- Flowchart and Sequence Diagram;\n\n#### Editor.md directory\n\n```java\npublic static void main(String[] args) {\n    System.out.println(&quot;Hello World!&quot;);\n}\n```\n\n```html\n&lt;!-- English --&gt;\n&lt;script src=&quot;../dist/js/languages/en.js&quot;&gt;&lt;/script&gt;\n\n&lt;!-- 繁體中文 --&gt;\n&lt;script src=&quot;../dist/js/languages/zh-tw.js&quot;&gt;&lt;/script&gt;\n```\n                ', '0', '0', '2023-01-19 19:17:01', '1', '3306');
INSERT INTO `discuss_post` VALUES ('5', '2', 'admin的第三个帖子', '\n#### Welcome to Echo\n\n&gt; Examples\n\n- TeX (Based on KaTeX);\n- Emoji;\n- Task lists;\n- HTML tags decode;\n- Flowchart and Sequence Diagram;\n\n#### Editor.md directory\n\n```java\npublic static void main(String[] args) {\n    System.out.println(&quot;Hello World!&quot;);\n}\n```\n\n```html\n&lt;!-- English --&gt;\n&lt;script src=&quot;../dist/js/languages/en.js&quot;&gt;&lt;/script&gt;\n\n&lt;!-- 繁體中文 --&gt;\n&lt;script src=&quot;../dist/js/languages/zh-tw.js&quot;&gt;&lt;/script&gt;\n```\n                ', '0', '0', '2023-02-16 20:13:14', '0', '3333');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `conversation_id` varchar(45) NOT NULL,
  `content` text,
  `status` int(11) DEFAULT NULL COMMENT '0-未读;1-已读;2-删除;',
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_from_id` (`from_id`),
  KEY `index_to_id` (`to_id`),
  KEY `index_conversation_id` (`conversation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '1', '4', 'like', '{&quot;entityType&quot;:1,&quot;entityId&quot;:3,&quot;postId&quot;:3,&quot;userId&quot;:2}', '1', '2023-01-17 21:57:47');
INSERT INTO `message` VALUES ('2', '1', '4', 'comment', '{&quot;entityType&quot;:1,&quot;entityId&quot;:3,&quot;postId&quot;:3,&quot;userId&quot;:2}', '0', '2023-01-17 21:58:07');
INSERT INTO `message` VALUES ('3', '1', '2', 'like', '{&quot;entityType&quot;:2,&quot;entityId&quot;:1,&quot;postId&quot;:3,&quot;userId&quot;:2}', '0', '2023-01-17 22:00:03');
INSERT INTO `message` VALUES ('4', '1', '2', 'like', '{&quot;entityType&quot;:2,&quot;entityId&quot;:1,&quot;postId&quot;:3,&quot;userId&quot;:2}', '0', '2023-01-17 22:00:05');
INSERT INTO `message` VALUES ('5', '1', '2', 'like', '{&quot;entityType&quot;:2,&quot;entityId&quot;:1,&quot;postId&quot;:3,&quot;userId&quot;:2}', '0', '2023-01-17 22:00:10');
INSERT INTO `message` VALUES ('6', '1', '2', 'like', '{&quot;entityType&quot;:2,&quot;entityId&quot;:1,&quot;postId&quot;:3,&quot;userId&quot;:2}', '0', '2023-01-17 22:03:12');
INSERT INTO `message` VALUES ('7', '1', '2', 'comment', '{&quot;entityType&quot;:2,&quot;entityId&quot;:1,&quot;postId&quot;:3,&quot;userId&quot;:2}', '0', '2023-01-18 13:11:19');
INSERT INTO `message` VALUES ('8', '1', '2', 'comment', '{&quot;entityType&quot;:2,&quot;entityId&quot;:1,&quot;postId&quot;:3,&quot;userId&quot;:2}', '0', '2023-01-18 13:11:19');
INSERT INTO `message` VALUES ('9', '1', '2', 'comment', '{&quot;entityType&quot;:2,&quot;entityId&quot;:1,&quot;postId&quot;:3,&quot;userId&quot;:2}', '0', '2023-01-18 13:11:19');
INSERT INTO `message` VALUES ('10', '1', '2', 'comment', '{&quot;entityType&quot;:2,&quot;entityId&quot;:1,&quot;postId&quot;:3,&quot;userId&quot;:4}', '0', '2023-01-18 13:12:39');
INSERT INTO `message` VALUES ('11', '1', '2', 'follow', '{&quot;entityType&quot;:3,&quot;entityId&quot;:2,&quot;userId&quot;:4}', '0', '2023-01-19 19:14:43');
INSERT INTO `message` VALUES ('12', '4', '2', '2_4', '你好，我是tj', '1', '2023-01-19 19:15:01');
INSERT INTO `message` VALUES ('13', '2', '4', '2_4', '你好，我是admin', '1', '2023-01-19 19:16:09');
INSERT INTO `message` VALUES ('14', '4', '2', '2_4', '你好，我是tj', '1', '2023-01-29 19:47:29');
INSERT INTO `message` VALUES ('15', '1', '2', 'comment', '{&quot;entityType&quot;:1,&quot;entityId&quot;:1,&quot;postId&quot;:1,&quot;userId&quot;:4}', '0', '2023-01-29 20:59:42');
INSERT INTO `message` VALUES ('16', '1', '2', 'comment', '{&quot;entityType&quot;:1,&quot;entityId&quot;:1,&quot;postId&quot;:1,&quot;userId&quot;:4}', '0', '2023-01-29 20:59:55');
INSERT INTO `message` VALUES ('17', '1', '2', 'comment', '{&quot;entityType&quot;:1,&quot;entityId&quot;:1,&quot;postId&quot;:1,&quot;userId&quot;:4}', '0', '2023-01-29 21:01:49');
INSERT INTO `message` VALUES ('18', '1', '2', 'comment', '{&quot;entityType&quot;:1,&quot;entityId&quot;:1,&quot;postId&quot;:1,&quot;userId&quot;:4}', '0', '2023-01-29 21:03:25');
INSERT INTO `message` VALUES ('19', '1', '2', 'comment', '{&quot;entityType&quot;:1,&quot;entityId&quot;:1,&quot;postId&quot;:1,&quot;userId&quot;:4}', '0', '2023-01-29 21:03:25');
INSERT INTO `message` VALUES ('20', '1', '2', 'like', '{&quot;entityType&quot;:1,&quot;entityId&quot;:1,&quot;postId&quot;:1,&quot;userId&quot;:4}', '0', '2023-01-29 21:10:04');
INSERT INTO `message` VALUES ('21', '1', '2', 'comment', '{&quot;entityType&quot;:1,&quot;entityId&quot;:4,&quot;postId&quot;:4,&quot;userId&quot;:2}', '0', '2023-02-06 15:22:16');
INSERT INTO `message` VALUES ('22', '1', '2', 'comment', '{&quot;entityType&quot;:2,&quot;entityId&quot;:8,&quot;postId&quot;:4,&quot;userId&quot;:4}', '0', '2023-02-06 15:23:38');
INSERT INTO `message` VALUES ('23', '1', '2', 'comment', '{&quot;entityType&quot;:2,&quot;entityId&quot;:8,&quot;postId&quot;:4,&quot;userId&quot;:3}', '0', '2023-02-06 15:24:53');

-- ----------------------------
-- Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(190) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `INSTANCE_NAME` varchar(190) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(190) DEFAULT NULL,
  `JOB_GROUP` varchar(190) DEFAULT NULL,
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

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(190) NOT NULL,
  `JOB_GROUP` varchar(190) NOT NULL,
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

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('communityScheduler', 'postScoreRefreshJob', 'communityJobGroup', null, 'com.greate.community.quartz.PostScoreRefreshJob', '1', '0', '0', '1', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);

-- ----------------------------
-- Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('communityScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('communityScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(190) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('communityScheduler', 'DESKTOP-FPFMQ0H1677056010439', '1677077120131', '7500');

-- ----------------------------
-- Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------
INSERT INTO `qrtz_simple_triggers` VALUES ('communityScheduler', 'postScoreRefreshTrigger', 'communityTriggerGroup', '-1', '300000', '11210');

-- ----------------------------
-- Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
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

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `JOB_NAME` varchar(190) NOT NULL,
  `JOB_GROUP` varchar(190) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) DEFAULT NULL,
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

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('communityScheduler', 'postScoreRefreshTrigger', 'communityTriggerGroup', 'postScoreRefreshJob', 'communityJobGroup', null, '1677077314566', '1677077014566', '0', 'WAITING', 'SIMPLE', '1673714314566', '0', null, '0', '');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '0-普通用户; 1-超级管理员; 2-版主;',
  `status` int(11) DEFAULT NULL COMMENT '0-未激活; 1-已激活;',
  `activation_code` varchar(100) DEFAULT NULL,
  `header_url` varchar(200) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_username` (`username`(20)),
  KEY `index_email` (`email`(20))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'SYSTEM', 'SYSTEM', 'SYSTEM', 'system@sina.com', '0', '1', null, 'http://static.nowcoder.com/images/head/notify.png', '2020-01-13 02:11:03');
INSERT INTO `user` VALUES ('2', 'admin', 'd2d5a85cc78dc580aaa8d5d0dafa0a79', '0c7b1', 'admin@qq.com', '1', '1', '671f3fdb898e455997aec3d2bcb695a6', 'http://rofpn7rzl.hd-bkt.clouddn.com/eca1cd32ca1246a9831b40230049d3ac', '2021-02-10 22:27:00');
INSERT INTO `user` VALUES ('3', 'th', '39e4aa5530cec4c397b4734cabe2e777', '3d196', 'master@qq.com', '2', '1', '3563733cece74ee4b61b86b0b375987c', 'http://rofpn7rzl.hd-bkt.clouddn.com/b8d29f1763e141ffa77b3e1a140baf7c', '2021-02-10 22:29:03');
INSERT INTO `user` VALUES ('4', 'tj', '09f34e9ab3492ecc75a6320cf6a6c594', '6e42f', '1318529087@qq.com', '0', '1', '8a550427b9eb46db9e4c8f76631c7862', 'http://rofpn7rzl.hd-bkt.clouddn.com/e544061b72a54f148bd051dc636ad918', '2023-01-14 19:21:27');
