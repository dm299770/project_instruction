/*
Navicat MySQL Data Transfer

Source Server         : locahost
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : smallev_oauth

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-12-10 10:32:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t2_app_account
-- ----------------------------
DROP TABLE IF EXISTS `t2_app_account`;
CREATE TABLE `t2_app_account` (
  `KEY_ID` decimal(8,0) NOT NULL COMMENT '主键',
  `ACCOUNT` varchar(50) NOT NULL COMMENT '账号',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `PHONE` varchar(50) DEFAULT NULL COMMENT '电话',
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码（加密）',
  `VERIFICATION` varchar(10) DEFAULT NULL COMMENT '验证码',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `REG_MODE` varchar(1) DEFAULT NULL COMMENT '注册方式1：APP；2：车主网站；3：wcc同步；9：其他',
  `TYPE` varchar(1) NOT NULL COMMENT '类型1：主账号；2：子账号',
  `OVER_TIME` datetime DEFAULT NULL COMMENT '子账号失效时间',
  `ICON` varchar(200) DEFAULT NULL COMMENT '头像url地址',
  `MAIL` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `SECURITY_PASSWORD` varchar(50) DEFAULT NULL COMMENT '车控密码',
  `CHILD_STATUS` char(1) DEFAULT NULL COMMENT '子账号启用/禁用状态 0:禁用；1:启用',
  `PARENT_ID` decimal(8,0) DEFAULT NULL COMMENT '用户头像，存字节流',
  `SALT` varchar(50) DEFAULT NULL COMMENT '密码盐值',
  `SUB_AUTHORITY` char(1) DEFAULT NULL COMMENT '子账户权限 1:车况查看；2:车况查看+远程车控',
  `START_TIME` datetime DEFAULT NULL COMMENT '子账号开始使用时间',
  `UNIONID` varchar(100) DEFAULT NULL COMMENT '微信id',
  `GESTURES_PASSWORD` varchar(50) DEFAULT NULL COMMENT '车控手势密码',
  `ERROR_NUMBER` varchar(10) DEFAULT NULL COMMENT '密码错误次数',
  `PASSWORD_TIME` datetime DEFAULT NULL COMMENT '密码输入时间',
  `TRACKS_OPEN_TIME` datetime DEFAULT NULL COMMENT '驶轨迹查询 开启时间',
  `IS_TRACKS_OPEN` char(1) NOT NULL DEFAULT '1' COMMENT '是否开启行驶轨迹查询 0:关闭；1:开启；2:废弃(改用新行车轨迹功能)',
  `BAIDUID` varchar(50) DEFAULT NULL COMMENT '百度ID',
  `AUTO_ACCOUNTID` varchar(50) DEFAULT NULL COMMENT '高德账号auto_accountId',
  PRIMARY KEY (`KEY_ID`),
  KEY `UN2_T2_APP_ACCOUNT` (`ACCOUNT`),
  KEY `UN_T2_APP_ACCOUNT` (`NAME`,`PHONE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='手机、车主网站用户表';

-- ----------------------------
-- Records of t2_app_account
-- ----------------------------
INSERT INTO `t2_app_account` VALUES ('2807', 'yut', 'TEST', '15640011022', 'gqvHVwegiLV7tWrP8sPuLZfGbEYxgMMss+VW3WMlKs8=', null, null, '1', '1', null, 'app/icon2018-04-02/15226579203424235.png', 'yu123456@163.com', null, '0', null, '794af298-3d7d-4cf4-80de-613a884e2e6e', null, null, 'oApk3wlg0a_VUwduy4Da-GgFRPZY', null, '2', null, null, '1', null, null);

-- ----------------------------
-- Table structure for t3_oauth_thirdparty
-- ----------------------------
DROP TABLE IF EXISTS `t3_oauth_thirdparty`;
CREATE TABLE `t3_oauth_thirdparty` (
  `KEY_ID` decimal(8,0) DEFAULT NULL COMMENT '主键',
  `CLIENT_ID` varchar(50) DEFAULT NULL COMMENT '奇瑞分配的第三方账号',
  `CLIENT_SECRET` varchar(50) DEFAULT NULL COMMENT '奇瑞分配的第三方账号密码',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `SCOPE` varchar(50) DEFAULT NULL COMMENT '第三方访问权限范围',
  `REDIRECT_URI` varchar(300) DEFAULT NULL COMMENT '第三方重定向地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t3_oauth_thirdparty
-- ----------------------------
INSERT INTO `t3_oauth_thirdparty` VALUES ('3', 'oauth_clientid_jd', 'oauth_clientsecret_jd', null, 'read', 'https://alphadev.jd.com/engine/api/voice/oauth2/authorize/alpha/2a1c006a553e4860aecc9ad3e3a16cdb');
INSERT INTO `t3_oauth_thirdparty` VALUES ('2', 'oauth_clientid_baidu', 'oauth_clientsecret_baidu', null, 'scp01001', 'http://sandbox.codriver.baidu.com/codriverapi/oauthredirecturi');
INSERT INTO `t3_oauth_thirdparty` VALUES ('1', 'oauth_clientid_auto', 'oauth_clientsecret_auto', null, 'scp02001', 'https://www.amap.com/');
INSERT INTO `t3_oauth_thirdparty` VALUES ('4', 'oauth_clientid_aligenie', 'oauth_clientid_aligenie', null, 'scp03001', 'https://i.ai.mi.com/skills/bind/oauth/2.0/379326851299935232');
INSERT INTO `t3_oauth_thirdparty` VALUES ('5', 'oauth_clientid_ali', 'oauth_clientid_ali', null, null, 'https://open.bot.tmall.com/oauth/callback');

-- ----------------------------
-- Table structure for t3_refreshtoken
-- ----------------------------
DROP TABLE IF EXISTS `t3_refreshtoken`;
CREATE TABLE `t3_refreshtoken` (
  `KEY_ID` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `REFRESHTOKEN` varchar(50) DEFAULT NULL COMMENT '刷新码',
  `CLIENT_ID` varchar(50) DEFAULT NULL COMMENT '奇瑞分配的第三方账号',
  `APP_ACCOUNT_ID` varchar(50) DEFAULT NULL COMMENT '用户唯一标识',
  `EXPIREIN` varchar(50) DEFAULT NULL COMMENT '过期时间',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`KEY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t3_refreshtoken
-- ----------------------------
INSERT INTO `t3_refreshtoken` VALUES ('1', 'fdcaa4fe38fe999c702a46c3d112a165', 'oauth_clientid_baidu', '2807', '1544079726', null);
INSERT INTO `t3_refreshtoken` VALUES ('2', '05b6bccb71572423937b9ccf5dc64bae', 'oauth_clientid_aligenie', '2807', '1544755106', null);
