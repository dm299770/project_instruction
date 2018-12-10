/*
Navicat MySQL Data Transfer

Source Server         : locahost
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : idm

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-12-07 10:19:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tm_charge_account
-- ----------------------------
DROP TABLE IF EXISTS `tm_charge_account`;
CREATE TABLE `tm_charge_account` (
  `USER_ACCOUNT` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户外键',
  `BALANCE` varchar(255) DEFAULT NULL COMMENT '余额',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '最后修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm_charge_account
-- ----------------------------

-- ----------------------------
-- Table structure for tr_user_vin
-- ----------------------------
DROP TABLE IF EXISTS `tr_user_vin`;
CREATE TABLE `tr_user_vin` (
  `USER_ID` varchar(36) NOT NULL COMMENT '用户id',
  `VIN` varchar(17) DEFAULT NULL COMMENT '车辆唯一标识码 17位',
  `PLATE_NUM` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_SIX_PHONENUM` varchar(6) DEFAULT NULL,
  `ENGINE_NUM` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DEFAULT_VEHICLE` tinyint(4) DEFAULT NULL,
  `BINDING_DATE` datetime DEFAULT NULL COMMENT '绑定时间',
  `UNBINDING_DATE` datetime DEFAULT NULL COMMENT '解绑日期',
  `IS_EFFCTIVE` tinyint(1) DEFAULT NULL COMMENT '是否有效 0-无效,1-有效',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tr_user_vin
-- ----------------------------
INSERT INTO `tr_user_vin` VALUES ('e5792c05-fa1c-4ffa-9adb-aa66f2cd8863', 'A123456789012345', '沪A79023', '671990', 'WDDNG5GB0AA', '0', '2018-10-31 16:15:52', '2018-10-31 16:10:32', '0', '2018-10-31 16:15:52');
INSERT INTO `tr_user_vin` VALUES ('e5792c05-fa1c-4ffa-9adb-aa66f2cd8863', 'A123456789054321', '沪A64634', '671990', 'BWDBC6DB0AA', '0', '2018-10-31 16:20:14', null, '1', '2018-10-31 16:20:14');
INSERT INTO `tr_user_vin` VALUES ('e5792c05-fa1c-4ffa-9adb-aa66f2cd8863', 'B323456789054321', '沪A22213', '671990', 'RMDBC6DB0AA', '1', '2018-10-31 16:21:01', null, '1', '2018-10-31 16:21:01');

-- ----------------------------
-- Table structure for ts_user
-- ----------------------------
DROP TABLE IF EXISTS `ts_user`;
CREATE TABLE `ts_user` (
  `USER_ID` varchar(36) NOT NULL COMMENT 'uuid 主键',
  `PHONE_NUM` varchar(15) NOT NULL COMMENT '用户手机号',
  `PASSWORD` varchar(32) NOT NULL COMMENT '密码 md5加密',
  `IS_EFFCTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 0-无效 , 1-有效',
  `CREATE_DATE` datetime DEFAULT NULL,
  `TOKEN` varchar(255) DEFAULT NULL COMMENT '暂留 未来匹配Kamereon',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user
-- ----------------------------
INSERT INTO `ts_user` VALUES ('87a8b831-ac77-4c30-951b-666a2d330851', '15900798629', '81dc9bdb52d04dc20036dbd8313ed055', '1', '2018-10-08 16:00:49', null);
INSERT INTO `ts_user` VALUES ('bf57f345-cab8-4fbb-b7f9-eccdb5cf14cf', '13312675004', '21232f297a57a5a743894a0e4a801fc3', '1', '2018-10-16 16:50:31', null);
INSERT INTO `ts_user` VALUES ('e5792c05-fa1c-4ffa-9adb-aa66f2cd8863', '18101671990', '21232f297a57a5a743894a0e4a801fc3', '1', '2018-09-28 16:40:40', null);

-- ----------------------------
-- Table structure for ts_user_info
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_info`;
CREATE TABLE `ts_user_info` (
  `USER_ID` varchar(36) NOT NULL COMMENT '用户id',
  `PROFILE_PHOTO` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `NICK_NAME` varchar(30) DEFAULT NULL COMMENT '昵称',
  `REAL_NAME` varchar(30) DEFAULT NULL COMMENT '姓名',
  `SEXUAL` varchar(10) DEFAULT NULL,
  `EMEY_CONTACT` varchar(36) DEFAULT NULL COMMENT '紧急联系人',
  `IS_EFFCTIVE` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 0-无效 ,1-有效',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ts_user_info
-- ----------------------------
INSERT INTO `ts_user_info` VALUES ('bf57f345-cab8-4fbb-b7f9-eccdb5cf14cf', '127.0.0.1:8888/bf57f345-cab8-4fbb-b7f9-eccdb5cf14cf/1540193681718.jpg', 'LILEI', 'leo', '男', null, '1', '2018-10-16 16:50:31');

-- ----------------------------
-- Table structure for tt_charge_flow
-- ----------------------------
DROP TABLE IF EXISTS `tt_charge_flow`;
CREATE TABLE `tt_charge_flow` (
  `ID` varchar(36) NOT NULL COMMENT '流水单号',
  `USER_ACCOUNT` varchar(36) DEFAULT NULL COMMENT '关联用户表id',
  `CHARGE_DATE` datetime DEFAULT NULL COMMENT '下单日期',
  `CHARGE_FROM` varchar(20) DEFAULT NULL COMMENT '发起方',
  `CHARGE_TO` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '到达方',
  `DIRECTION` tinyint(1) DEFAULT NULL COMMENT '增减标识(-1减少 1增加)',
  `AMOUNT` double(20,0) DEFAULT NULL COMMENT '金额',
  `COMMENT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tt_charge_flow
-- ----------------------------
