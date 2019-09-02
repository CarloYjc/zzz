/*
Navicat MySQL Data Transfer

Source Server         : DB
Source Server Version : 50561
Source Host           : localhost:3306
Source Database       : zzz

Target Server Type    : MYSQL
Target Server Version : 50561
File Encoding         : 65001

Date: 2019-09-02 10:39:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_actual_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_actual_order`;
CREATE TABLE `tb_actual_order` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `oid` bigint(20) NOT NULL,
  `order_date` datetime NOT NULL COMMENT '订单日期',
  `cust_name` varchar(50) NOT NULL COMMENT '公司名称',
  `tamt` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `order_status` varchar(200) DEFAULT NULL COMMENT '订单状态 0:待确认 1:已确认',
  `atamt` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '实收金额',
  `sid` varchar(50) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_actual_order
-- ----------------------------
INSERT INTO `tb_actual_order` VALUES ('6', '10101', '2019-08-02 11:26:45', '12', '710.00', '1', '40.00', '10001,10002');
INSERT INTO `tb_actual_order` VALUES ('7', '10101', '2019-08-05 09:38:50', '12', '251.00', '1', '251.00', '10000,10003,10004,10005,10006');
INSERT INTO `tb_actual_order` VALUES ('8', '10113', '2019-08-06 17:30:43', '12', '5.00', '1', '20.00', '10013');
INSERT INTO `tb_actual_order` VALUES ('9', '10113', '2019-08-06 17:32:09', '12', '16.00', '1', '100.00', '10014');
INSERT INTO `tb_actual_order` VALUES ('10', '10099', '2019-08-07 10:44:15', '客户100', '550.00', '1', '550.00', '10020');
INSERT INTO `tb_actual_order` VALUES ('11', '10099', '2019-08-07 10:44:58', '客户100', '202.00', '1', '0.00', '10021,10022');
INSERT INTO `tb_actual_order` VALUES ('12', '10113', '2019-08-07 11:31:01', '12', '162.00', '0', '0.00', '10023,10024');

-- ----------------------------
-- Table structure for `tb_actual_order_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_actual_order_info`;
CREATE TABLE `tb_actual_order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `aid` bigint(20) NOT NULL,
  `itemno` varchar(50) NOT NULL COMMENT '货号',
  `num` int(11) NOT NULL COMMENT '数量',
  `aprice` decimal(6,2) NOT NULL DEFAULT '0.00' COMMENT '实际单价',
  `amt` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '实际金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_actual_order_info
-- ----------------------------
INSERT INTO `tb_actual_order_info` VALUES ('10', '6', '100002', '50', '12.00', '600.00');
INSERT INTO `tb_actual_order_info` VALUES ('11', '6', '100003', '40', '2.00', '80.00');
INSERT INTO `tb_actual_order_info` VALUES ('12', '6', '100004', '10', '3.00', '30.00');
INSERT INTO `tb_actual_order_info` VALUES ('13', '6', '999998', '1', '0.00', '0.00');
INSERT INTO `tb_actual_order_info` VALUES ('14', '6', '999999', '1', '0.00', '0.00');
INSERT INTO `tb_actual_order_info` VALUES ('15', '7', '100001', '60', '1.00', '60.00');
INSERT INTO `tb_actual_order_info` VALUES ('16', '7', '100003', '10', '2.00', '20.00');
INSERT INTO `tb_actual_order_info` VALUES ('17', '7', '100004', '40', '3.00', '120.00');
INSERT INTO `tb_actual_order_info` VALUES ('18', '7', '100005', '10', '4.00', '40.00');
INSERT INTO `tb_actual_order_info` VALUES ('19', '7', '999998', '1', '5.00', '5.00');
INSERT INTO `tb_actual_order_info` VALUES ('20', '7', '999999', '1', '6.00', '6.00');
INSERT INTO `tb_actual_order_info` VALUES ('21', '8', 'F99864A6', '1', '1.00', '1.00');
INSERT INTO `tb_actual_order_info` VALUES ('22', '8', 'A7C2314F', '1', '1.00', '1.00');
INSERT INTO `tb_actual_order_info` VALUES ('23', '8', 'E05966EC', '1', '1.00', '1.00');
INSERT INTO `tb_actual_order_info` VALUES ('24', '8', '999998', '1', '1.00', '1.00');
INSERT INTO `tb_actual_order_info` VALUES ('25', '8', '999999', '1', '1.00', '1.00');
INSERT INTO `tb_actual_order_info` VALUES ('26', '9', 'F99864A6', '2', '2.00', '4.00');
INSERT INTO `tb_actual_order_info` VALUES ('27', '9', 'A7C2314F', '2', '2.00', '4.00');
INSERT INTO `tb_actual_order_info` VALUES ('28', '9', 'E05966EC', '2', '2.00', '4.00');
INSERT INTO `tb_actual_order_info` VALUES ('29', '9', '999998', '1', '2.00', '2.00');
INSERT INTO `tb_actual_order_info` VALUES ('30', '9', '999999', '1', '2.00', '2.00');
INSERT INTO `tb_actual_order_info` VALUES ('31', '10', 'F99864A6', '10', '1.00', '10.00');
INSERT INTO `tb_actual_order_info` VALUES ('32', '10', 'A7C2314F', '20', '2.00', '40.00');
INSERT INTO `tb_actual_order_info` VALUES ('33', '10', 'E05966EC', '30', '3.00', '90.00');
INSERT INTO `tb_actual_order_info` VALUES ('34', '10', '7A7661A5', '40', '4.00', '160.00');
INSERT INTO `tb_actual_order_info` VALUES ('35', '10', '03704928', '50', '5.00', '250.00');
INSERT INTO `tb_actual_order_info` VALUES ('36', '10', '999998', '1', '0.00', '0.00');
INSERT INTO `tb_actual_order_info` VALUES ('37', '10', '999999', '1', '0.00', '0.00');
INSERT INTO `tb_actual_order_info` VALUES ('38', '11', 'F99864A6', '60', '1.00', '60.00');
INSERT INTO `tb_actual_order_info` VALUES ('39', '11', 'A7C2314F', '50', '1.00', '50.00');
INSERT INTO `tb_actual_order_info` VALUES ('40', '11', 'E05966EC', '40', '1.00', '40.00');
INSERT INTO `tb_actual_order_info` VALUES ('41', '11', '7A7661A5', '30', '1.00', '30.00');
INSERT INTO `tb_actual_order_info` VALUES ('42', '11', '03704928', '20', '1.00', '20.00');
INSERT INTO `tb_actual_order_info` VALUES ('43', '11', '999998', '1', '1.00', '1.00');
INSERT INTO `tb_actual_order_info` VALUES ('44', '11', '999999', '1', '1.00', '1.00');
INSERT INTO `tb_actual_order_info` VALUES ('45', '12', 'F99864A6', '10', '1.00', '10.00');
INSERT INTO `tb_actual_order_info` VALUES ('46', '12', 'A7C2314F', '20', '1.00', '20.00');
INSERT INTO `tb_actual_order_info` VALUES ('47', '12', 'E05966EC', '10', '1.00', '10.00');
INSERT INTO `tb_actual_order_info` VALUES ('48', '12', '7A7661A5', '10', '1.00', '10.00');
INSERT INTO `tb_actual_order_info` VALUES ('49', '12', '03704928', '10', '1.00', '10.00');
INSERT INTO `tb_actual_order_info` VALUES ('50', '12', '857FE0BE', '10', '1.00', '10.00');
INSERT INTO `tb_actual_order_info` VALUES ('51', '12', '6B2BAAE9', '10', '1.00', '10.00');
INSERT INTO `tb_actual_order_info` VALUES ('52', '12', '2EDF21FE', '20', '1.00', '20.00');
INSERT INTO `tb_actual_order_info` VALUES ('53', '12', '486616FA', '10', '1.00', '10.00');
INSERT INTO `tb_actual_order_info` VALUES ('54', '12', 'F580EB8D', '10', '1.00', '10.00');
INSERT INTO `tb_actual_order_info` VALUES ('55', '12', 'F4471F7E', '20', '1.00', '20.00');
INSERT INTO `tb_actual_order_info` VALUES ('56', '12', 'E60F8680', '10', '1.00', '10.00');
INSERT INTO `tb_actual_order_info` VALUES ('57', '12', 'ABC268DC', '10', '1.00', '10.00');
INSERT INTO `tb_actual_order_info` VALUES ('58', '12', '999998', '1', '1.00', '1.00');
INSERT INTO `tb_actual_order_info` VALUES ('59', '12', '999999', '1', '1.00', '1.00');

-- ----------------------------
-- Table structure for `tb_item`
-- ----------------------------
DROP TABLE IF EXISTS `tb_item`;
CREATE TABLE `tb_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `itemno` varchar(50) NOT NULL COMMENT '货号',
  `item_name` varchar(100) NOT NULL COMMENT '品名',
  `price` decimal(6,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `item_spec` varchar(200) DEFAULT NULL COMMENT '规格',
  `weight` varchar(200) DEFAULT NULL COMMENT '重量',
  `status` varchar(1) DEFAULT NULL COMMENT '0:禁用，1:正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1026 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_item
-- ----------------------------
INSERT INTO `tb_item` VALUES ('1', 'F99864A6', '货号0', '0.41', 'asdf', 'fdsa', '1');
INSERT INTO `tb_item` VALUES ('2', 'A7C2314F', '货号1', '9.32', 'qwer', 'rewq', '1');
INSERT INTO `tb_item` VALUES ('3', 'E05966EC', '货号2', '2.76', 'abcd', 'dcba', '1');
INSERT INTO `tb_item` VALUES ('4', '7A7661A5', '货号3', '3.21', '', '', '1');
INSERT INTO `tb_item` VALUES ('5', '03704928', '货号4', '7.04', '', '', '1');
INSERT INTO `tb_item` VALUES ('6', '857FE0BE', '货号5', '6.85', '', '', '1');
INSERT INTO `tb_item` VALUES ('7', '6B2BAAE9', '货号6', '2.79', '', '', '1');
INSERT INTO `tb_item` VALUES ('8', '2EDF21FE', '货号7', '0.80', '', '', '1');
INSERT INTO `tb_item` VALUES ('9', '486616FA', '货号8', '6.74', '', '', '1');
INSERT INTO `tb_item` VALUES ('10', 'F580EB8D', '货号9', '7.79', '', '', '1');
INSERT INTO `tb_item` VALUES ('11', 'F4471F7E', '货号10', '0.09', '', '', '1');
INSERT INTO `tb_item` VALUES ('12', 'E60F8680', '货号11', '8.80', '', '', '1');
INSERT INTO `tb_item` VALUES ('13', 'ABC268DC', '货号12', '6.80', '', '', '1');
INSERT INTO `tb_item` VALUES ('14', '5F9359C3', '货号13', '1.14', '', '', '1');
INSERT INTO `tb_item` VALUES ('15', '768AB507', '货号14', '2.11', '', '', '1');
INSERT INTO `tb_item` VALUES ('16', '9F893DE6', '货号15', '4.15', '', '', '1');
INSERT INTO `tb_item` VALUES ('17', '6A2C6468', '货号16', '7.02', '', '', '1');
INSERT INTO `tb_item` VALUES ('18', 'BAF9BB40', '货号17', '7.79', '', '', '1');
INSERT INTO `tb_item` VALUES ('19', '54319734', '货号18', '7.17', '', '', '1');
INSERT INTO `tb_item` VALUES ('20', 'FA8333ED', '货号19', '1.97', '', '', '1');
INSERT INTO `tb_item` VALUES ('21', 'F73D40A4', '货号20', '7.78', '', '', '1');
INSERT INTO `tb_item` VALUES ('22', '0CF4B3F9', '货号21', '7.19', '', '', '1');
INSERT INTO `tb_item` VALUES ('23', 'DEB6B88F', '货号22', '3.92', '', '', '1');
INSERT INTO `tb_item` VALUES ('24', '5F781A2F', '货号23', '0.01', '', '', '1');
INSERT INTO `tb_item` VALUES ('25', '7A062909', '货号24', '3.65', '', '', '1');
INSERT INTO `tb_item` VALUES ('26', '675FA45A', '货号25', '8.57', '', '', '1');
INSERT INTO `tb_item` VALUES ('27', 'C4620E7F', '货号26', '5.02', '', '', '1');
INSERT INTO `tb_item` VALUES ('28', 'A070696D', '货号27', '3.24', '', '', '1');
INSERT INTO `tb_item` VALUES ('29', '95E959CA', '货号28', '9.75', '', '', '1');
INSERT INTO `tb_item` VALUES ('30', '1718BFE1', '货号29', '3.15', '', '', '1');
INSERT INTO `tb_item` VALUES ('31', '34827967', '货号30', '5.68', '', '', '1');
INSERT INTO `tb_item` VALUES ('32', '7DA9D703', '货号31', '6.24', '', '', '1');
INSERT INTO `tb_item` VALUES ('33', '619FE16B', '货号32', '2.77', '', '', '1');
INSERT INTO `tb_item` VALUES ('34', '380B78CF', '货号33', '0.93', '', '', '1');
INSERT INTO `tb_item` VALUES ('35', 'E5D2D308', '货号34', '0.08', '', '', '1');
INSERT INTO `tb_item` VALUES ('36', '40B7B03F', '货号35', '7.62', '', '', '1');
INSERT INTO `tb_item` VALUES ('37', 'A8BABE3D', '货号36', '1.33', '', '', '1');
INSERT INTO `tb_item` VALUES ('38', '838F9ACE', '货号37', '5.43', '', '', '1');
INSERT INTO `tb_item` VALUES ('39', 'D6C9CD16', '货号38', '7.41', '', '', '1');
INSERT INTO `tb_item` VALUES ('40', '3F0DF595', '货号39', '0.90', '', '', '1');
INSERT INTO `tb_item` VALUES ('41', '21C9593D', '货号40', '1.20', '', '', '1');
INSERT INTO `tb_item` VALUES ('42', '0A81E82D', '货号41', '7.06', '', '', '1');
INSERT INTO `tb_item` VALUES ('43', 'BE4092CC', '货号42', '8.48', '', '', '1');
INSERT INTO `tb_item` VALUES ('44', '8C03FBB7', '货号43', '6.48', '', '', '1');
INSERT INTO `tb_item` VALUES ('45', '7B99446E', '货号44', '0.56', '', '', '1');
INSERT INTO `tb_item` VALUES ('46', '590A839E', '货号45', '8.03', '', '', '1');
INSERT INTO `tb_item` VALUES ('47', 'DE6D4DBB', '货号46', '6.95', '', '', '1');
INSERT INTO `tb_item` VALUES ('48', '66DFF951', '货号47', '9.74', '', '', '1');
INSERT INTO `tb_item` VALUES ('49', 'EAD30EDA', '货号48', '8.41', '', '', '1');
INSERT INTO `tb_item` VALUES ('50', 'FF35B3FA', '货号49', '6.95', '', '', '1');
INSERT INTO `tb_item` VALUES ('51', 'BC4205EE', '货号50', '8.96', '', '', '1');
INSERT INTO `tb_item` VALUES ('52', '460BBFA7', '货号51', '8.47', '', '', '1');
INSERT INTO `tb_item` VALUES ('53', '568FD8EB', '货号52', '1.46', '', '', '1');
INSERT INTO `tb_item` VALUES ('54', '48D5320D', '货号53', '4.68', '', '', '1');
INSERT INTO `tb_item` VALUES ('55', 'B6E84078', '货号54', '9.08', '', '', '1');
INSERT INTO `tb_item` VALUES ('56', '62AEDC04', '货号55', '8.50', '', '', '1');
INSERT INTO `tb_item` VALUES ('57', '50F77247', '货号56', '8.71', '', '', '1');
INSERT INTO `tb_item` VALUES ('58', '8D2E9DF4', '货号57', '3.07', '', '', '1');
INSERT INTO `tb_item` VALUES ('59', 'B15EA190', '货号58', '2.28', '', '', '1');
INSERT INTO `tb_item` VALUES ('60', '9E1CA52A', '货号59', '9.52', '', '', '1');
INSERT INTO `tb_item` VALUES ('61', 'E864CC2B', '货号60', '0.56', '', '', '1');
INSERT INTO `tb_item` VALUES ('62', 'B0C14EFF', '货号61', '4.65', '', '', '1');
INSERT INTO `tb_item` VALUES ('63', '76D54F55', '货号62', '1.43', '', '', '1');
INSERT INTO `tb_item` VALUES ('64', '23EB5C34', '货号63', '8.84', '', '', '1');
INSERT INTO `tb_item` VALUES ('65', 'D5314183', '货号64', '4.28', '', '', '1');
INSERT INTO `tb_item` VALUES ('66', '38440B4B', '货号65', '5.47', '', '', '1');
INSERT INTO `tb_item` VALUES ('67', 'E7797EDE', '货号66', '7.80', '', '', '1');
INSERT INTO `tb_item` VALUES ('68', 'B0C7384F', '货号67', '2.46', '', '', '1');
INSERT INTO `tb_item` VALUES ('69', 'DE4AB610', '货号68', '8.12', '', '', '1');
INSERT INTO `tb_item` VALUES ('70', 'DCD40D88', '货号69', '5.58', '', '', '1');
INSERT INTO `tb_item` VALUES ('71', 'D6CC2A66', '货号70', '3.64', '', '', '1');
INSERT INTO `tb_item` VALUES ('72', 'B3B69AC5', '货号71', '1.38', '', '', '1');
INSERT INTO `tb_item` VALUES ('73', 'D6E36FFD', '货号72', '0.62', '', '', '1');
INSERT INTO `tb_item` VALUES ('74', 'F60F568C', '货号73', '3.51', '', '', '1');
INSERT INTO `tb_item` VALUES ('75', '1B61B844', '货号74', '6.28', '', '', '1');
INSERT INTO `tb_item` VALUES ('76', 'EB595A84', '货号75', '9.89', '', '', '1');
INSERT INTO `tb_item` VALUES ('77', '019414BB', '货号76', '9.81', '', '', '1');
INSERT INTO `tb_item` VALUES ('78', 'D5A9DB1A', '货号77', '2.77', '', '', '1');
INSERT INTO `tb_item` VALUES ('79', '98719263', '货号78', '6.90', '', '', '1');
INSERT INTO `tb_item` VALUES ('80', 'BC23D6C3', '货号79', '8.05', '', '', '1');
INSERT INTO `tb_item` VALUES ('81', 'E3A60A73', '货号80', '6.87', '', '', '1');
INSERT INTO `tb_item` VALUES ('82', 'B0386921', '货号81', '1.02', '', '', '1');
INSERT INTO `tb_item` VALUES ('83', '7BA76DE1', '货号82', '9.86', '', '', '1');
INSERT INTO `tb_item` VALUES ('84', 'ABD228BD', '货号83', '8.60', '', '', '1');
INSERT INTO `tb_item` VALUES ('85', '753C5ECB', '货号84', '3.03', '', '', '1');
INSERT INTO `tb_item` VALUES ('86', 'A774AF81', '货号85', '5.09', '', '', '1');
INSERT INTO `tb_item` VALUES ('87', '554465D1', '货号86', '2.22', '', '', '1');
INSERT INTO `tb_item` VALUES ('88', 'E9FF1E43', '货号87', '3.43', '', '', '1');
INSERT INTO `tb_item` VALUES ('89', 'DA0F3B4B', '货号88', '3.63', '', '', '1');
INSERT INTO `tb_item` VALUES ('90', '3271DA6E', '货号89', '6.76', '', '', '1');
INSERT INTO `tb_item` VALUES ('91', 'EC289B46', '货号90', '8.89', '', '', '1');
INSERT INTO `tb_item` VALUES ('92', 'B1F01782', '货号91', '4.56', '', '', '1');
INSERT INTO `tb_item` VALUES ('93', 'C838FA9D', '货号92', '4.90', '', '', '1');
INSERT INTO `tb_item` VALUES ('94', '023E7014', '货号93', '6.39', '', '', '1');
INSERT INTO `tb_item` VALUES ('95', '2187F2FE', '货号94', '7.70', '', '', '1');
INSERT INTO `tb_item` VALUES ('96', '9A151899', '货号95', '3.81', '', '', '1');
INSERT INTO `tb_item` VALUES ('97', '291E33F6', '货号96', '6.16', '', '', '1');
INSERT INTO `tb_item` VALUES ('98', 'F2900D2C', '货号97', '0.62', '', '', '1');
INSERT INTO `tb_item` VALUES ('99', '7E696370', '货号98', '2.14', '', '', '1');
INSERT INTO `tb_item` VALUES ('100', '8F58C043', '货号99', '6.62', '', '', '1');
INSERT INTO `tb_item` VALUES ('101', '92ABC1F5', '货号100', '7.56', '', '', '1');
INSERT INTO `tb_item` VALUES ('102', '8BAC0C64', '货号101', '9.44', '', '', '1');
INSERT INTO `tb_item` VALUES ('103', 'F73DF85A', '货号102', '0.89', '', '', '1');
INSERT INTO `tb_item` VALUES ('104', '381ED7BC', '货号103', '4.55', '', '', '1');
INSERT INTO `tb_item` VALUES ('105', '2A120823', '货号104', '4.30', '', '', '1');
INSERT INTO `tb_item` VALUES ('106', '07427D23', '货号105', '8.28', '', '', '1');
INSERT INTO `tb_item` VALUES ('107', '8BAD5C74', '货号106', '3.74', '', '', '1');
INSERT INTO `tb_item` VALUES ('108', '4D0AEB1C', '货号107', '5.09', '', '', '1');
INSERT INTO `tb_item` VALUES ('109', '823A92F8', '货号108', '5.59', '', '', '1');
INSERT INTO `tb_item` VALUES ('110', '43E63541', '货号109', '8.81', '', '', '1');
INSERT INTO `tb_item` VALUES ('111', 'E5CC32A4', '货号110', '9.21', '', '', '1');
INSERT INTO `tb_item` VALUES ('112', 'DFE6C71F', '货号111', '3.46', '', '', '1');
INSERT INTO `tb_item` VALUES ('113', '8D1F4A61', '货号112', '8.81', '', '', '1');
INSERT INTO `tb_item` VALUES ('114', '2D1BC6FA', '货号113', '5.10', '', '', '1');
INSERT INTO `tb_item` VALUES ('115', '6F1E087B', '货号114', '5.78', '', '', '1');
INSERT INTO `tb_item` VALUES ('116', 'C3CB1F34', '货号115', '6.04', '', '', '1');
INSERT INTO `tb_item` VALUES ('117', 'F1D578F6', '货号116', '9.41', '', '', '1');
INSERT INTO `tb_item` VALUES ('118', '2BC54287', '货号117', '5.48', '', '', '1');
INSERT INTO `tb_item` VALUES ('119', 'F96DD22E', '货号118', '7.16', '', '', '1');
INSERT INTO `tb_item` VALUES ('120', 'C8023D26', '货号119', '8.36', '', '', '1');
INSERT INTO `tb_item` VALUES ('121', '8396426D', '货号120', '6.42', '', '', '1');
INSERT INTO `tb_item` VALUES ('122', 'E5DBAAD7', '货号121', '8.72', '', '', '1');
INSERT INTO `tb_item` VALUES ('123', '0923D6A1', '货号122', '7.21', '', '', '1');
INSERT INTO `tb_item` VALUES ('124', '4C2E4B3E', '货号123', '2.26', '', '', '1');
INSERT INTO `tb_item` VALUES ('125', 'C199404D', '货号124', '7.55', '', '', '1');
INSERT INTO `tb_item` VALUES ('126', 'C9E41D0C', '货号125', '0.15', '', '', '1');
INSERT INTO `tb_item` VALUES ('127', '760A2DE7', '货号126', '9.46', '', '', '1');
INSERT INTO `tb_item` VALUES ('128', '0B98D4A6', '货号127', '2.23', '', '', '1');
INSERT INTO `tb_item` VALUES ('129', '920B75DD', '货号128', '9.58', '', '', '1');
INSERT INTO `tb_item` VALUES ('130', '8CC02408', '货号129', '9.88', '', '', '1');
INSERT INTO `tb_item` VALUES ('131', '4591EB67', '货号130', '7.84', '', '', '1');
INSERT INTO `tb_item` VALUES ('132', '3B01656F', '货号131', '0.87', '', '', '1');
INSERT INTO `tb_item` VALUES ('133', '0B6DFFA3', '货号132', '1.25', '', '', '1');
INSERT INTO `tb_item` VALUES ('134', 'D000270B', '货号133', '0.92', '', '', '1');
INSERT INTO `tb_item` VALUES ('135', '88CEA5CA', '货号134', '7.11', '', '', '1');
INSERT INTO `tb_item` VALUES ('136', 'E2A922C5', '货号135', '7.49', '', '', '1');
INSERT INTO `tb_item` VALUES ('137', '7F6AFF41', '货号136', '6.76', '', '', '1');
INSERT INTO `tb_item` VALUES ('138', '65960C2C', '货号137', '3.55', '', '', '1');
INSERT INTO `tb_item` VALUES ('139', 'F1DA3105', '货号138', '0.41', '', '', '1');
INSERT INTO `tb_item` VALUES ('140', 'F11FE174', '货号139', '0.55', '', '', '1');
INSERT INTO `tb_item` VALUES ('141', '39394B43', '货号140', '7.07', '', '', '1');
INSERT INTO `tb_item` VALUES ('142', '85429955', '货号141', '6.44', '', '', '1');
INSERT INTO `tb_item` VALUES ('143', '7B2F2401', '货号142', '9.25', '', '', '1');
INSERT INTO `tb_item` VALUES ('144', '777EB092', '货号143', '6.04', '', '', '1');
INSERT INTO `tb_item` VALUES ('145', 'ECDD806E', '货号144', '1.90', '', '', '1');
INSERT INTO `tb_item` VALUES ('146', '186E62BC', '货号145', '9.66', '', '', '1');
INSERT INTO `tb_item` VALUES ('147', 'D2C0C19D', '货号146', '6.81', '', '', '1');
INSERT INTO `tb_item` VALUES ('148', '2D3E9C39', '货号147', '4.56', '', '', '1');
INSERT INTO `tb_item` VALUES ('149', 'EC99D45F', '货号148', '0.81', '', '', '1');
INSERT INTO `tb_item` VALUES ('150', '0228AB56', '货号149', '9.31', '', '', '1');
INSERT INTO `tb_item` VALUES ('151', '82F550AC', '货号150', '8.66', '', '', '1');
INSERT INTO `tb_item` VALUES ('152', 'D2182ED4', '货号151', '0.24', '', '', '1');
INSERT INTO `tb_item` VALUES ('153', 'E92A21AD', '货号152', '4.22', '', '', '1');
INSERT INTO `tb_item` VALUES ('154', '4E2ACF2A', '货号153', '6.30', '', '', '1');
INSERT INTO `tb_item` VALUES ('155', '78F9A078', '货号154', '5.10', '', '', '1');
INSERT INTO `tb_item` VALUES ('156', '3CFB222D', '货号155', '1.39', '', '', '1');
INSERT INTO `tb_item` VALUES ('157', 'B729708F', '货号156', '5.95', '', '', '1');
INSERT INTO `tb_item` VALUES ('158', '7ADBA6ED', '货号157', '0.04', '', '', '1');
INSERT INTO `tb_item` VALUES ('159', '6E31D18E', '货号158', '2.36', '', '', '1');
INSERT INTO `tb_item` VALUES ('160', '2550C823', '货号159', '2.41', '', '', '1');
INSERT INTO `tb_item` VALUES ('161', '483D8D3E', '货号160', '5.49', '', '', '1');
INSERT INTO `tb_item` VALUES ('162', '92DAEFBE', '货号161', '8.87', '', '', '1');
INSERT INTO `tb_item` VALUES ('163', '8FF224E1', '货号162', '6.35', '', '', '1');
INSERT INTO `tb_item` VALUES ('164', '9AA943D0', '货号163', '3.79', '', '', '1');
INSERT INTO `tb_item` VALUES ('165', 'C7D6B074', '货号164', '8.33', '', '', '1');
INSERT INTO `tb_item` VALUES ('166', 'AA44C2DC', '货号165', '8.01', '', '', '1');
INSERT INTO `tb_item` VALUES ('167', '873028D3', '货号166', '6.64', '', '', '1');
INSERT INTO `tb_item` VALUES ('168', '458F0CF7', '货号167', '5.96', '', '', '1');
INSERT INTO `tb_item` VALUES ('169', '224D3E0C', '货号168', '2.78', '', '', '1');
INSERT INTO `tb_item` VALUES ('170', 'B421BB41', '货号169', '8.83', '', '', '1');
INSERT INTO `tb_item` VALUES ('171', 'D9975F6B', '货号170', '5.42', '', '', '1');
INSERT INTO `tb_item` VALUES ('172', 'B301FEA0', '货号171', '4.00', '', '', '1');
INSERT INTO `tb_item` VALUES ('173', '33DC5486', '货号172', '9.30', '', '', '1');
INSERT INTO `tb_item` VALUES ('174', '473E4D64', '货号173', '6.77', '', '', '1');
INSERT INTO `tb_item` VALUES ('175', '711606DA', '货号174', '2.82', '', '', '1');
INSERT INTO `tb_item` VALUES ('176', 'F29E9405', '货号175', '5.96', '', '', '1');
INSERT INTO `tb_item` VALUES ('177', 'EEB24BB4', '货号176', '6.99', '', '', '1');
INSERT INTO `tb_item` VALUES ('178', '03938029', '货号177', '9.11', '', '', '1');
INSERT INTO `tb_item` VALUES ('179', '08BD1667', '货号178', '9.30', '', '', '1');
INSERT INTO `tb_item` VALUES ('180', '8C8A7E71', '货号179', '9.79', '', '', '1');
INSERT INTO `tb_item` VALUES ('181', '00FFEF0E', '货号180', '2.86', '', '', '1');
INSERT INTO `tb_item` VALUES ('182', '2C14BD1C', '货号181', '6.81', '', '', '1');
INSERT INTO `tb_item` VALUES ('183', '1F0C14F9', '货号182', '4.11', '', '', '1');
INSERT INTO `tb_item` VALUES ('184', '72E66422', '货号183', '5.67', '', '', '1');
INSERT INTO `tb_item` VALUES ('185', '8BE489A8', '货号184', '6.12', '', '', '1');
INSERT INTO `tb_item` VALUES ('186', '0259C5B6', '货号185', '7.90', '', '', '1');
INSERT INTO `tb_item` VALUES ('187', '3B3054B4', '货号186', '1.28', '', '', '1');
INSERT INTO `tb_item` VALUES ('188', '524BD892', '货号187', '2.47', '', '', '1');
INSERT INTO `tb_item` VALUES ('189', 'A1FF2B53', '货号188', '7.43', '', '', '1');
INSERT INTO `tb_item` VALUES ('190', 'C7F6C9EA', '货号189', '3.68', '', '', '1');
INSERT INTO `tb_item` VALUES ('191', '0AFEAB9E', '货号190', '6.38', '', '', '1');
INSERT INTO `tb_item` VALUES ('192', '569DC50B', '货号191', '0.72', '', '', '1');
INSERT INTO `tb_item` VALUES ('193', '7A472AF6', '货号192', '2.73', '', '', '1');
INSERT INTO `tb_item` VALUES ('194', '1BF4FA7B', '货号193', '0.52', '', '', '1');
INSERT INTO `tb_item` VALUES ('195', '60F17AAD', '货号194', '7.23', '', '', '1');
INSERT INTO `tb_item` VALUES ('196', 'CD7894E4', '货号195', '2.89', '', '', '1');
INSERT INTO `tb_item` VALUES ('197', 'EA7D087F', '货号196', '1.09', '', '', '1');
INSERT INTO `tb_item` VALUES ('198', '96EAA07A', '货号197', '6.83', '', '', '1');
INSERT INTO `tb_item` VALUES ('199', '21745387', '货号198', '8.20', '', '', '1');
INSERT INTO `tb_item` VALUES ('200', '9D2AB19F', '货号199', '3.71', '', '', '1');
INSERT INTO `tb_item` VALUES ('201', '743779E6', '货号200', '2.78', '', '', '1');
INSERT INTO `tb_item` VALUES ('202', '62556D7F', '货号201', '2.32', '', '', '1');
INSERT INTO `tb_item` VALUES ('203', '953F9EFD', '货号202', '3.21', '', '', '1');
INSERT INTO `tb_item` VALUES ('204', '000A271D', '货号203', '4.69', '', '', '1');
INSERT INTO `tb_item` VALUES ('205', '1C982693', '货号204', '8.25', '', '', '1');
INSERT INTO `tb_item` VALUES ('206', '37742C44', '货号205', '8.86', '', '', '1');
INSERT INTO `tb_item` VALUES ('207', '231DC9C1', '货号206', '6.35', '', '', '1');
INSERT INTO `tb_item` VALUES ('208', '246F3130', '货号207', '0.84', '', '', '1');
INSERT INTO `tb_item` VALUES ('209', 'CD88CA74', '货号208', '2.45', '', '', '1');
INSERT INTO `tb_item` VALUES ('210', '72D1E386', '货号209', '0.83', '', '', '1');
INSERT INTO `tb_item` VALUES ('211', '3E39BDEE', '货号210', '5.57', '', '', '1');
INSERT INTO `tb_item` VALUES ('212', 'FBFC54AD', '货号211', '9.63', '', '', '1');
INSERT INTO `tb_item` VALUES ('213', '3767AA7C', '货号212', '1.77', '', '', '1');
INSERT INTO `tb_item` VALUES ('214', '6A3906D9', '货号213', '6.93', '', '', '1');
INSERT INTO `tb_item` VALUES ('215', '670A408E', '货号214', '9.70', '', '', '1');
INSERT INTO `tb_item` VALUES ('216', 'FE2281C4', '货号215', '1.55', '', '', '1');
INSERT INTO `tb_item` VALUES ('217', '98EFEEDA', '货号216', '3.63', '', '', '1');
INSERT INTO `tb_item` VALUES ('218', 'C1D73F90', '货号217', '3.84', '', '', '1');
INSERT INTO `tb_item` VALUES ('219', 'E9896040', '货号218', '8.40', '', '', '1');
INSERT INTO `tb_item` VALUES ('220', '6592F9DF', '货号219', '5.43', '', '', '1');
INSERT INTO `tb_item` VALUES ('221', '183C37FE', '货号220', '5.89', '', '', '1');
INSERT INTO `tb_item` VALUES ('222', 'DF1DB639', '货号221', '7.82', '', '', '1');
INSERT INTO `tb_item` VALUES ('223', '12B7A9F6', '货号222', '2.87', '', '', '1');
INSERT INTO `tb_item` VALUES ('224', 'E201AACE', '货号223', '2.99', '', '', '1');
INSERT INTO `tb_item` VALUES ('225', 'C3E6AE60', '货号224', '1.53', '', '', '1');
INSERT INTO `tb_item` VALUES ('226', 'C472FEC4', '货号225', '7.20', '', '', '1');
INSERT INTO `tb_item` VALUES ('227', 'EA7667DF', '货号226', '2.58', '', '', '1');
INSERT INTO `tb_item` VALUES ('228', 'CC386F0F', '货号227', '2.39', '', '', '1');
INSERT INTO `tb_item` VALUES ('229', '915170BE', '货号228', '0.18', '', '', '1');
INSERT INTO `tb_item` VALUES ('230', '524D0D76', '货号229', '0.88', '', '', '1');
INSERT INTO `tb_item` VALUES ('231', '0C5E240A', '货号230', '9.43', '', '', '1');
INSERT INTO `tb_item` VALUES ('232', 'CF7FF0CE', '货号231', '8.59', '', '', '1');
INSERT INTO `tb_item` VALUES ('233', 'E890A5E3', '货号232', '4.72', '', '', '1');
INSERT INTO `tb_item` VALUES ('234', 'B47C9C53', '货号233', '8.47', '', '', '1');
INSERT INTO `tb_item` VALUES ('235', '8EC38E7B', '货号234', '6.64', '', '', '1');
INSERT INTO `tb_item` VALUES ('236', '6C911213', '货号235', '2.32', '', '', '1');
INSERT INTO `tb_item` VALUES ('237', 'C6DD4BA5', '货号236', '4.29', '', '', '1');
INSERT INTO `tb_item` VALUES ('238', 'CB3A5214', '货号237', '7.80', '', '', '1');
INSERT INTO `tb_item` VALUES ('239', '66D73F37', '货号238', '9.36', '', '', '1');
INSERT INTO `tb_item` VALUES ('240', 'BEEB5117', '货号239', '5.32', '', '', '1');
INSERT INTO `tb_item` VALUES ('241', '0BB9E2C8', '货号240', '4.03', '', '', '1');
INSERT INTO `tb_item` VALUES ('242', 'E3BF3C73', '货号241', '4.51', '', '', '1');
INSERT INTO `tb_item` VALUES ('243', '07F415A8', '货号242', '8.69', '', '', '1');
INSERT INTO `tb_item` VALUES ('244', '10A30176', '货号243', '9.07', '', '', '1');
INSERT INTO `tb_item` VALUES ('245', 'E9CBB07E', '货号244', '7.45', '', '', '1');
INSERT INTO `tb_item` VALUES ('246', '6C0C4E01', '货号245', '9.81', '', '', '1');
INSERT INTO `tb_item` VALUES ('247', '205555F9', '货号246', '2.13', '', '', '1');
INSERT INTO `tb_item` VALUES ('248', '4B401969', '货号247', '5.27', '', '', '1');
INSERT INTO `tb_item` VALUES ('249', '6961687D', '货号248', '2.95', '', '', '1');
INSERT INTO `tb_item` VALUES ('250', '1C53D1D6', '货号249', '8.14', '', '', '1');
INSERT INTO `tb_item` VALUES ('251', 'C49C6326', '货号250', '5.16', '', '', '1');
INSERT INTO `tb_item` VALUES ('252', 'EF17C367', '货号251', '1.81', '', '', '1');
INSERT INTO `tb_item` VALUES ('253', 'B7B42B08', '货号252', '1.00', '', '', '1');
INSERT INTO `tb_item` VALUES ('254', '0F650919', '货号253', '0.06', '', '', '1');
INSERT INTO `tb_item` VALUES ('255', 'A93C96C6', '货号254', '2.87', '', '', '1');
INSERT INTO `tb_item` VALUES ('256', '5738A37A', '货号255', '2.57', '', '', '1');
INSERT INTO `tb_item` VALUES ('257', '4B60183C', '货号256', '3.61', '', '', '1');
INSERT INTO `tb_item` VALUES ('258', '9C76FF06', '货号257', '2.73', '', '', '1');
INSERT INTO `tb_item` VALUES ('259', '50E434B8', '货号258', '1.14', '', '', '1');
INSERT INTO `tb_item` VALUES ('260', '87853843', '货号259', '1.01', '', '', '1');
INSERT INTO `tb_item` VALUES ('261', '43400256', '货号260', '7.48', '', '', '1');
INSERT INTO `tb_item` VALUES ('262', '561E4077', '货号261', '9.09', '', '', '1');
INSERT INTO `tb_item` VALUES ('263', '0BA0899B', '货号262', '6.38', '', '', '1');
INSERT INTO `tb_item` VALUES ('264', '24F6B3CC', '货号263', '1.41', '', '', '1');
INSERT INTO `tb_item` VALUES ('265', '20963FA2', '货号264', '7.15', '', '', '1');
INSERT INTO `tb_item` VALUES ('266', 'DC1CE890', '货号265', '3.79', '', '', '1');
INSERT INTO `tb_item` VALUES ('267', '68BECFFF', '货号266', '1.13', '', '', '1');
INSERT INTO `tb_item` VALUES ('268', '88C4431F', '货号267', '3.84', '', '', '1');
INSERT INTO `tb_item` VALUES ('269', 'E3324C85', '货号268', '2.69', '', '', '1');
INSERT INTO `tb_item` VALUES ('270', '68BDC89D', '货号269', '1.79', '', '', '1');
INSERT INTO `tb_item` VALUES ('271', '771713F8', '货号270', '3.18', '', '', '1');
INSERT INTO `tb_item` VALUES ('272', '29809AF4', '货号271', '3.33', '', '', '1');
INSERT INTO `tb_item` VALUES ('273', '7A3CB24A', '货号272', '5.01', '', '', '1');
INSERT INTO `tb_item` VALUES ('274', '3AD784F7', '货号273', '8.55', '', '', '1');
INSERT INTO `tb_item` VALUES ('275', '8032C5A7', '货号274', '5.44', '', '', '1');
INSERT INTO `tb_item` VALUES ('276', '4109E4F7', '货号275', '2.01', '', '', '1');
INSERT INTO `tb_item` VALUES ('277', '1E1043C7', '货号276', '3.02', '', '', '1');
INSERT INTO `tb_item` VALUES ('278', 'DE46D55D', '货号277', '5.29', '', '', '1');
INSERT INTO `tb_item` VALUES ('279', '8426D4F8', '货号278', '5.36', '', '', '1');
INSERT INTO `tb_item` VALUES ('280', '2293190C', '货号279', '8.66', '', '', '1');
INSERT INTO `tb_item` VALUES ('281', 'A79E68C6', '货号280', '3.30', '', '', '1');
INSERT INTO `tb_item` VALUES ('282', '8ED22FFD', '货号281', '3.48', '', '', '1');
INSERT INTO `tb_item` VALUES ('283', '988B7A81', '货号282', '9.89', '', '', '1');
INSERT INTO `tb_item` VALUES ('284', '341C521F', '货号283', '5.21', '', '', '1');
INSERT INTO `tb_item` VALUES ('285', 'B6207752', '货号284', '3.48', '', '', '1');
INSERT INTO `tb_item` VALUES ('286', '28949E1D', '货号285', '9.94', '', '', '1');
INSERT INTO `tb_item` VALUES ('287', '225035A5', '货号286', '1.23', '', '', '1');
INSERT INTO `tb_item` VALUES ('288', '05E16ADA', '货号287', '1.45', '', '', '1');
INSERT INTO `tb_item` VALUES ('289', 'D453A9F8', '货号288', '4.73', '', '', '1');
INSERT INTO `tb_item` VALUES ('290', '433FC926', '货号289', '0.63', '', '', '1');
INSERT INTO `tb_item` VALUES ('291', 'DD72D238', '货号290', '4.80', '', '', '1');
INSERT INTO `tb_item` VALUES ('292', '5D6D7311', '货号291', '1.52', '', '', '1');
INSERT INTO `tb_item` VALUES ('293', '3DF102B3', '货号292', '4.72', '', '', '1');
INSERT INTO `tb_item` VALUES ('294', 'B31F45A3', '货号293', '8.24', '', '', '1');
INSERT INTO `tb_item` VALUES ('295', 'F0D1C2FC', '货号294', '9.47', '', '', '1');
INSERT INTO `tb_item` VALUES ('296', '6FF9FC63', '货号295', '1.61', '', '', '1');
INSERT INTO `tb_item` VALUES ('297', 'B7891056', '货号296', '9.72', '', '', '1');
INSERT INTO `tb_item` VALUES ('298', 'B469E277', '货号297', '4.86', '', '', '1');
INSERT INTO `tb_item` VALUES ('299', '4DC3D164', '货号298', '4.56', '', '', '1');
INSERT INTO `tb_item` VALUES ('300', '7015C170', '货号299', '8.66', '', '', '1');
INSERT INTO `tb_item` VALUES ('301', '236C7A45', '货号300', '3.18', '', '', '1');
INSERT INTO `tb_item` VALUES ('302', '617CFC0D', '货号301', '6.12', '', '', '1');
INSERT INTO `tb_item` VALUES ('303', 'F229B35C', '货号302', '5.70', '', '', '1');
INSERT INTO `tb_item` VALUES ('304', '07ACFBBC', '货号303', '0.57', '', '', '1');
INSERT INTO `tb_item` VALUES ('305', 'D7B037C5', '货号304', '7.57', '', '', '1');
INSERT INTO `tb_item` VALUES ('306', 'B540A74B', '货号305', '0.00', '', '', '1');
INSERT INTO `tb_item` VALUES ('307', '2B5CC097', '货号306', '0.48', '', '', '1');
INSERT INTO `tb_item` VALUES ('308', '8E3D74FB', '货号307', '9.02', '', '', '1');
INSERT INTO `tb_item` VALUES ('309', '7DBBEFDE', '货号308', '6.10', '', '', '1');
INSERT INTO `tb_item` VALUES ('310', 'FE3DF4D7', '货号309', '4.44', '', '', '1');
INSERT INTO `tb_item` VALUES ('311', '8A653C75', '货号310', '2.16', '', '', '1');
INSERT INTO `tb_item` VALUES ('312', 'DA3D3EFA', '货号311', '8.24', '', '', '1');
INSERT INTO `tb_item` VALUES ('313', 'BC0A189F', '货号312', '6.14', '', '', '1');
INSERT INTO `tb_item` VALUES ('314', '1BD685A1', '货号313', '5.21', '', '', '1');
INSERT INTO `tb_item` VALUES ('315', 'E1A18C08', '货号314', '0.47', '', '', '1');
INSERT INTO `tb_item` VALUES ('316', '8019EDF9', '货号315', '0.68', '', '', '1');
INSERT INTO `tb_item` VALUES ('317', '49E3DE9E', '货号316', '9.99', '', '', '1');
INSERT INTO `tb_item` VALUES ('318', '61A7DA5E', '货号317', '7.54', '', '', '1');
INSERT INTO `tb_item` VALUES ('319', 'C11E4AC3', '货号318', '7.61', '', '', '1');
INSERT INTO `tb_item` VALUES ('320', '5746CBA6', '货号319', '6.70', '', '', '1');
INSERT INTO `tb_item` VALUES ('321', '82602F7B', '货号320', '9.39', '', '', '1');
INSERT INTO `tb_item` VALUES ('322', 'A9D9E277', '货号321', '0.87', '', '', '1');
INSERT INTO `tb_item` VALUES ('323', 'F80CE6EB', '货号322', '1.22', '', '', '1');
INSERT INTO `tb_item` VALUES ('324', 'CC76E0A3', '货号323', '0.51', '', '', '1');
INSERT INTO `tb_item` VALUES ('325', 'F342D3F9', '货号324', '6.81', '', '', '1');
INSERT INTO `tb_item` VALUES ('326', '500BD340', '货号325', '9.81', '', '', '1');
INSERT INTO `tb_item` VALUES ('327', 'FE132621', '货号326', '5.17', '', '', '1');
INSERT INTO `tb_item` VALUES ('328', '799CD399', '货号327', '7.92', '', '', '1');
INSERT INTO `tb_item` VALUES ('329', 'E86FCA57', '货号328', '9.62', '', '', '1');
INSERT INTO `tb_item` VALUES ('330', '214D1417', '货号329', '8.84', '', '', '1');
INSERT INTO `tb_item` VALUES ('331', '7637DBCB', '货号330', '6.70', '', '', '1');
INSERT INTO `tb_item` VALUES ('332', '6921FBE6', '货号331', '7.96', '', '', '1');
INSERT INTO `tb_item` VALUES ('333', 'FFF88881', '货号332', '4.57', '', '', '1');
INSERT INTO `tb_item` VALUES ('334', '8C57ED12', '货号333', '0.75', '', '', '1');
INSERT INTO `tb_item` VALUES ('335', '800EBDAF', '货号334', '1.63', '', '', '1');
INSERT INTO `tb_item` VALUES ('336', 'BF238F9D', '货号335', '3.88', '', '', '1');
INSERT INTO `tb_item` VALUES ('337', 'CA2A4516', '货号336', '9.29', '', '', '1');
INSERT INTO `tb_item` VALUES ('338', '6723C532', '货号337', '1.87', '', '', '1');
INSERT INTO `tb_item` VALUES ('339', 'A7F8BF82', '货号338', '4.73', '', '', '1');
INSERT INTO `tb_item` VALUES ('340', '41F20A6C', '货号339', '6.69', '', '', '1');
INSERT INTO `tb_item` VALUES ('341', '5F048D57', '货号340', '0.05', '', '', '1');
INSERT INTO `tb_item` VALUES ('342', '9A7A9F39', '货号341', '4.70', '', '', '1');
INSERT INTO `tb_item` VALUES ('343', 'A3C6E9F0', '货号342', '6.96', '', '', '1');
INSERT INTO `tb_item` VALUES ('344', 'BB4E759E', '货号343', '2.82', '', '', '1');
INSERT INTO `tb_item` VALUES ('345', '919A6417', '货号344', '4.12', '', '', '1');
INSERT INTO `tb_item` VALUES ('346', 'DB5C7D9D', '货号345', '4.49', '', '', '1');
INSERT INTO `tb_item` VALUES ('347', 'F17FD84B', '货号346', '7.82', '', '', '1');
INSERT INTO `tb_item` VALUES ('348', '0172614B', '货号347', '0.79', '', '', '1');
INSERT INTO `tb_item` VALUES ('349', 'A05EFAFE', '货号348', '5.19', '', '', '1');
INSERT INTO `tb_item` VALUES ('350', 'CA8D3D12', '货号349', '9.21', '', '', '1');
INSERT INTO `tb_item` VALUES ('351', 'E38BFE54', '货号350', '4.20', '', '', '1');
INSERT INTO `tb_item` VALUES ('352', 'CF62B43E', '货号351', '1.62', '', '', '1');
INSERT INTO `tb_item` VALUES ('353', 'CD0E3B33', '货号352', '1.11', '', '', '1');
INSERT INTO `tb_item` VALUES ('354', 'BA543D0E', '货号353', '6.27', '', '', '1');
INSERT INTO `tb_item` VALUES ('355', '6C1E78EB', '货号354', '3.07', '', '', '1');
INSERT INTO `tb_item` VALUES ('356', '4FE078DB', '货号355', '1.63', '', '', '1');
INSERT INTO `tb_item` VALUES ('357', 'FEB447FF', '货号356', '6.79', '', '', '1');
INSERT INTO `tb_item` VALUES ('358', '17E7165F', '货号357', '8.53', '', '', '1');
INSERT INTO `tb_item` VALUES ('359', 'EEA4A637', '货号358', '0.37', '', '', '1');
INSERT INTO `tb_item` VALUES ('360', 'A9C50B07', '货号359', '9.78', '', '', '1');
INSERT INTO `tb_item` VALUES ('361', '1E1E0FF0', '货号360', '4.04', '', '', '1');
INSERT INTO `tb_item` VALUES ('362', '5D2C05C3', '货号361', '2.31', '', '', '1');
INSERT INTO `tb_item` VALUES ('363', '6C59C0D0', '货号362', '5.43', '', '', '1');
INSERT INTO `tb_item` VALUES ('364', '48EA7F64', '货号363', '8.26', '', '', '1');
INSERT INTO `tb_item` VALUES ('365', '5B5194EB', '货号364', '6.31', '', '', '1');
INSERT INTO `tb_item` VALUES ('366', '060387A0', '货号365', '6.37', '', '', '1');
INSERT INTO `tb_item` VALUES ('367', '6D269158', '货号366', '9.59', '', '', '1');
INSERT INTO `tb_item` VALUES ('368', '1EE21A97', '货号367', '2.48', '', '', '1');
INSERT INTO `tb_item` VALUES ('369', '79EFB257', '货号368', '9.47', '', '', '1');
INSERT INTO `tb_item` VALUES ('370', '2036B987', '货号369', '5.26', '', '', '1');
INSERT INTO `tb_item` VALUES ('371', 'EA3B773F', '货号370', '4.97', '', '', '1');
INSERT INTO `tb_item` VALUES ('372', '5BA52588', '货号371', '2.86', '', '', '1');
INSERT INTO `tb_item` VALUES ('373', '00345AFE', '货号372', '4.56', '', '', '1');
INSERT INTO `tb_item` VALUES ('374', '590262B0', '货号373', '9.37', '', '', '1');
INSERT INTO `tb_item` VALUES ('375', '23178354', '货号374', '2.73', '', '', '1');
INSERT INTO `tb_item` VALUES ('376', 'EEC3DFA7', '货号375', '4.55', '', '', '1');
INSERT INTO `tb_item` VALUES ('377', '4FF975A9', '货号376', '1.20', '', '', '1');
INSERT INTO `tb_item` VALUES ('378', '7DB5F54B', '货号377', '3.69', '', '', '1');
INSERT INTO `tb_item` VALUES ('379', 'A8E68FC4', '货号378', '9.79', '', '', '1');
INSERT INTO `tb_item` VALUES ('380', '13689FCD', '货号379', '3.88', '', '', '1');
INSERT INTO `tb_item` VALUES ('381', 'CD81D4F0', '货号380', '4.36', '', '', '1');
INSERT INTO `tb_item` VALUES ('382', '3D90F321', '货号381', '8.36', '', '', '1');
INSERT INTO `tb_item` VALUES ('383', '1ABD3C9D', '货号382', '6.55', '', '', '1');
INSERT INTO `tb_item` VALUES ('384', 'EB361AA2', '货号383', '1.37', '', '', '1');
INSERT INTO `tb_item` VALUES ('385', '562EA112', '货号384', '6.34', '', '', '1');
INSERT INTO `tb_item` VALUES ('386', '292D716E', '货号385', '6.26', '', '', '1');
INSERT INTO `tb_item` VALUES ('387', '11795964', '货号386', '1.12', '', '', '1');
INSERT INTO `tb_item` VALUES ('388', '6F2B36B1', '货号387', '7.84', '', '', '1');
INSERT INTO `tb_item` VALUES ('389', 'CCE73E6E', '货号388', '5.84', '', '', '1');
INSERT INTO `tb_item` VALUES ('390', '33F77CE5', '货号389', '4.69', '', '', '1');
INSERT INTO `tb_item` VALUES ('391', '69BEFD0E', '货号390', '5.09', '', '', '1');
INSERT INTO `tb_item` VALUES ('392', 'D8B40D4E', '货号391', '5.77', '', '', '1');
INSERT INTO `tb_item` VALUES ('393', '92BAA4C5', '货号392', '8.80', '', '', '1');
INSERT INTO `tb_item` VALUES ('394', '55C47C86', '货号393', '8.44', '', '', '1');
INSERT INTO `tb_item` VALUES ('395', 'D18839D8', '货号394', '7.68', '', '', '1');
INSERT INTO `tb_item` VALUES ('396', '6B3CECB4', '货号395', '7.98', '', '', '1');
INSERT INTO `tb_item` VALUES ('397', '549A35B5', '货号396', '0.27', '', '', '1');
INSERT INTO `tb_item` VALUES ('398', '9A94E513', '货号397', '0.55', '', '', '1');
INSERT INTO `tb_item` VALUES ('399', '0E462099', '货号398', '5.38', '', '', '1');
INSERT INTO `tb_item` VALUES ('400', '8F4B840A', '货号399', '5.00', '', '', '1');
INSERT INTO `tb_item` VALUES ('401', 'DDF92B94', '货号400', '3.82', '', '', '1');
INSERT INTO `tb_item` VALUES ('402', '856A4952', '货号401', '7.16', '', '', '1');
INSERT INTO `tb_item` VALUES ('403', 'C3D74FB0', '货号402', '0.88', '', '', '1');
INSERT INTO `tb_item` VALUES ('404', '81340332', '货号403', '1.99', '', '', '1');
INSERT INTO `tb_item` VALUES ('405', 'A5FFA782', '货号404', '5.62', '', '', '1');
INSERT INTO `tb_item` VALUES ('406', 'F33C0B08', '货号405', '3.80', '', '', '1');
INSERT INTO `tb_item` VALUES ('407', '561A5A82', '货号406', '7.99', '', '', '1');
INSERT INTO `tb_item` VALUES ('408', 'CB29217C', '货号407', '5.31', '', '', '1');
INSERT INTO `tb_item` VALUES ('409', 'CCF2DF9B', '货号408', '1.26', '', '', '1');
INSERT INTO `tb_item` VALUES ('410', '450ECF8F', '货号409', '6.49', '', '', '1');
INSERT INTO `tb_item` VALUES ('411', '7A998486', '货号410', '2.84', '', '', '1');
INSERT INTO `tb_item` VALUES ('412', 'D2E8D3EA', '货号411', '0.06', '', '', '1');
INSERT INTO `tb_item` VALUES ('413', 'CB2B9442', '货号412', '7.28', '', '', '1');
INSERT INTO `tb_item` VALUES ('414', 'F254899F', '货号413', '7.48', '', '', '1');
INSERT INTO `tb_item` VALUES ('415', '4D421255', '货号414', '6.92', '', '', '1');
INSERT INTO `tb_item` VALUES ('416', '7B786CAC', '货号415', '8.07', '', '', '1');
INSERT INTO `tb_item` VALUES ('417', 'B542E083', '货号416', '1.06', '', '', '1');
INSERT INTO `tb_item` VALUES ('418', '3A526DF3', '货号417', '5.29', '', '', '1');
INSERT INTO `tb_item` VALUES ('419', '679BC810', '货号418', '4.98', '', '', '1');
INSERT INTO `tb_item` VALUES ('420', '80CC0EC7', '货号419', '2.39', '', '', '1');
INSERT INTO `tb_item` VALUES ('421', '35649161', '货号420', '4.06', '', '', '1');
INSERT INTO `tb_item` VALUES ('422', '6C9EE455', '货号421', '5.70', '', '', '1');
INSERT INTO `tb_item` VALUES ('423', 'E37B10A1', '货号422', '5.92', '', '', '1');
INSERT INTO `tb_item` VALUES ('424', '914D4EF7', '货号423', '1.22', '', '', '1');
INSERT INTO `tb_item` VALUES ('425', 'CB7796C1', '货号424', '4.98', '', '', '1');
INSERT INTO `tb_item` VALUES ('426', '2EAED937', '货号425', '9.36', '', '', '1');
INSERT INTO `tb_item` VALUES ('427', '92C20682', '货号426', '2.75', '', '', '1');
INSERT INTO `tb_item` VALUES ('428', 'E2D73753', '货号427', '5.27', '', '', '1');
INSERT INTO `tb_item` VALUES ('429', '2A09F944', '货号428', '1.35', '', '', '1');
INSERT INTO `tb_item` VALUES ('430', '75FBAF27', '货号429', '9.68', '', '', '1');
INSERT INTO `tb_item` VALUES ('431', 'A2124A0C', '货号430', '9.54', '', '', '1');
INSERT INTO `tb_item` VALUES ('432', '326F5B84', '货号431', '6.73', '', '', '1');
INSERT INTO `tb_item` VALUES ('433', '071991BC', '货号432', '5.20', '', '', '1');
INSERT INTO `tb_item` VALUES ('434', '88771162', '货号433', '0.95', '', '', '1');
INSERT INTO `tb_item` VALUES ('435', '8EA9D616', '货号434', '5.73', '', '', '1');
INSERT INTO `tb_item` VALUES ('436', '1F10DEDF', '货号435', '4.61', '', '', '1');
INSERT INTO `tb_item` VALUES ('437', '8D071BC6', '货号436', '5.69', '', '', '1');
INSERT INTO `tb_item` VALUES ('438', '2D4CC90B', '货号437', '6.89', '', '', '1');
INSERT INTO `tb_item` VALUES ('439', 'B8A6D97F', '货号438', '1.93', '', '', '1');
INSERT INTO `tb_item` VALUES ('440', '1C6CFEEE', '货号439', '4.23', '', '', '1');
INSERT INTO `tb_item` VALUES ('441', '40195836', '货号440', '9.54', '', '', '1');
INSERT INTO `tb_item` VALUES ('442', '9D60DB44', '货号441', '0.01', '', '', '1');
INSERT INTO `tb_item` VALUES ('443', '909F22F3', '货号442', '7.78', '', '', '1');
INSERT INTO `tb_item` VALUES ('444', 'DE814F7C', '货号443', '9.19', '', '', '1');
INSERT INTO `tb_item` VALUES ('445', 'C5E640CF', '货号444', '4.61', '', '', '1');
INSERT INTO `tb_item` VALUES ('446', 'A0AE5F67', '货号445', '4.68', '', '', '1');
INSERT INTO `tb_item` VALUES ('447', '651FF6CB', '货号446', '4.31', '', '', '1');
INSERT INTO `tb_item` VALUES ('448', '75C39508', '货号447', '7.07', '', '', '1');
INSERT INTO `tb_item` VALUES ('449', '03C81A3F', '货号448', '8.58', '', '', '1');
INSERT INTO `tb_item` VALUES ('450', '6A688985', '货号449', '6.93', '', '', '1');
INSERT INTO `tb_item` VALUES ('451', 'C6BB4CB5', '货号450', '7.39', '', '', '1');
INSERT INTO `tb_item` VALUES ('452', '433793C6', '货号451', '5.84', '', '', '1');
INSERT INTO `tb_item` VALUES ('453', '3034F2D2', '货号452', '3.06', '', '', '1');
INSERT INTO `tb_item` VALUES ('454', 'F8955C5D', '货号453', '2.35', '', '', '1');
INSERT INTO `tb_item` VALUES ('455', '120A06D0', '货号454', '6.70', '', '', '1');
INSERT INTO `tb_item` VALUES ('456', '97EFBCE3', '货号455', '4.63', '', '', '1');
INSERT INTO `tb_item` VALUES ('457', '51979B25', '货号456', '6.25', '', '', '1');
INSERT INTO `tb_item` VALUES ('458', '96843B3A', '货号457', '3.61', '', '', '1');
INSERT INTO `tb_item` VALUES ('459', 'C9EBA7BA', '货号458', '5.25', '', '', '1');
INSERT INTO `tb_item` VALUES ('460', '70EC81F1', '货号459', '5.60', '', '', '1');
INSERT INTO `tb_item` VALUES ('461', 'BA7A1017', '货号460', '9.10', '', '', '1');
INSERT INTO `tb_item` VALUES ('462', '1B3B7B06', '货号461', '3.30', '', '', '1');
INSERT INTO `tb_item` VALUES ('463', '19F0A7C1', '货号462', '4.77', '', '', '1');
INSERT INTO `tb_item` VALUES ('464', '4D2EA5C3', '货号463', '6.12', '', '', '1');
INSERT INTO `tb_item` VALUES ('465', '2DB1C198', '货号464', '5.61', '', '', '1');
INSERT INTO `tb_item` VALUES ('466', '77D973CB', '货号465', '0.70', '', '', '1');
INSERT INTO `tb_item` VALUES ('467', 'BE1464E1', '货号466', '6.74', '', '', '1');
INSERT INTO `tb_item` VALUES ('468', 'B1C66489', '货号467', '4.36', '', '', '1');
INSERT INTO `tb_item` VALUES ('469', '97BAD9C2', '货号468', '5.74', '', '', '1');
INSERT INTO `tb_item` VALUES ('470', 'D2815CAF', '货号469', '9.75', '', '', '1');
INSERT INTO `tb_item` VALUES ('471', '851979F2', '货号470', '1.05', '', '', '1');
INSERT INTO `tb_item` VALUES ('472', 'B2D1235E', '货号471', '2.94', '', '', '1');
INSERT INTO `tb_item` VALUES ('473', 'FA315E96', '货号472', '3.50', '', '', '1');
INSERT INTO `tb_item` VALUES ('474', 'F2CC6195', '货号473', '3.95', '', '', '1');
INSERT INTO `tb_item` VALUES ('475', 'AAE849FF', '货号474', '8.11', '', '', '1');
INSERT INTO `tb_item` VALUES ('476', '8CEF14BF', '货号475', '6.60', '', '', '1');
INSERT INTO `tb_item` VALUES ('477', 'B2845C42', '货号476', '5.51', '', '', '1');
INSERT INTO `tb_item` VALUES ('478', '29B08757', '货号477', '1.76', '', '', '1');
INSERT INTO `tb_item` VALUES ('479', '058F32C3', '货号478', '7.69', '', '', '1');
INSERT INTO `tb_item` VALUES ('480', '2B5F8936', '货号479', '2.30', '', '', '1');
INSERT INTO `tb_item` VALUES ('481', 'A2C6A064', '货号480', '3.10', '', '', '1');
INSERT INTO `tb_item` VALUES ('482', 'CC43A4D8', '货号481', '2.90', '', '', '1');
INSERT INTO `tb_item` VALUES ('483', 'B3DAB15A', '货号482', '1.34', '', '', '1');
INSERT INTO `tb_item` VALUES ('484', 'F5D62DE2', '货号483', '6.98', '', '', '1');
INSERT INTO `tb_item` VALUES ('485', '0FD999B9', '货号484', '1.74', '', '', '1');
INSERT INTO `tb_item` VALUES ('486', '48E49E83', '货号485', '9.45', '', '', '1');
INSERT INTO `tb_item` VALUES ('487', '46FEFA10', '货号486', '6.22', '', '', '1');
INSERT INTO `tb_item` VALUES ('488', 'E662B0B3', '货号487', '0.38', '', '', '1');
INSERT INTO `tb_item` VALUES ('489', '22322ABE', '货号488', '2.58', '', '', '1');
INSERT INTO `tb_item` VALUES ('490', 'F8964200', '货号489', '7.39', '', '', '1');
INSERT INTO `tb_item` VALUES ('491', 'F37A6DB2', '货号490', '9.38', '', '', '1');
INSERT INTO `tb_item` VALUES ('492', '9BFA2BE7', '货号491', '5.45', '', '', '1');
INSERT INTO `tb_item` VALUES ('493', '00803CF4', '货号492', '7.15', '', '', '1');
INSERT INTO `tb_item` VALUES ('494', '6158CCFC', '货号493', '7.32', '', '', '1');
INSERT INTO `tb_item` VALUES ('495', 'A569F96E', '货号494', '4.32', '', '', '1');
INSERT INTO `tb_item` VALUES ('496', 'E653A704', '货号495', '9.33', '', '', '1');
INSERT INTO `tb_item` VALUES ('497', 'D81F6D7F', '货号496', '8.18', '', '', '1');
INSERT INTO `tb_item` VALUES ('498', '3BF69E61', '货号497', '2.25', '', '', '1');
INSERT INTO `tb_item` VALUES ('499', 'B26D7D1C', '货号498', '7.26', '', '', '1');
INSERT INTO `tb_item` VALUES ('500', '6C2CCA96', '货号499', '9.53', '', '', '1');
INSERT INTO `tb_item` VALUES ('501', '584A3AE6', '货号500', '7.17', '', '', '1');
INSERT INTO `tb_item` VALUES ('502', '693C9BD5', '货号501', '7.48', '', '', '1');
INSERT INTO `tb_item` VALUES ('503', '4FD5B8D0', '货号502', '0.61', '', '', '1');
INSERT INTO `tb_item` VALUES ('504', '2DCD4560', '货号503', '5.41', '', '', '1');
INSERT INTO `tb_item` VALUES ('505', '6840AAAA', '货号504', '4.71', '', '', '1');
INSERT INTO `tb_item` VALUES ('506', 'AC151ECD', '货号505', '8.68', '', '', '1');
INSERT INTO `tb_item` VALUES ('507', '7805DF6A', '货号506', '9.06', '', '', '1');
INSERT INTO `tb_item` VALUES ('508', 'FA5D9ECB', '货号507', '0.82', '', '', '1');
INSERT INTO `tb_item` VALUES ('509', '92A2810B', '货号508', '6.27', '', '', '1');
INSERT INTO `tb_item` VALUES ('510', '251AD9DC', '货号509', '3.28', '', '', '1');
INSERT INTO `tb_item` VALUES ('511', '191F5940', '货号510', '8.78', '', '', '1');
INSERT INTO `tb_item` VALUES ('512', '3249008B', '货号511', '5.90', '', '', '1');
INSERT INTO `tb_item` VALUES ('513', '5C6FAB59', '货号512', '9.28', '', '', '1');
INSERT INTO `tb_item` VALUES ('514', '3C249DDF', '货号513', '5.95', '', '', '1');
INSERT INTO `tb_item` VALUES ('515', '86527633', '货号514', '2.80', '', '', '1');
INSERT INTO `tb_item` VALUES ('516', 'FCC7BCF4', '货号515', '1.37', '', '', '1');
INSERT INTO `tb_item` VALUES ('517', 'B842CDFA', '货号516', '4.78', '', '', '1');
INSERT INTO `tb_item` VALUES ('518', '653F52A0', '货号517', '1.51', '', '', '1');
INSERT INTO `tb_item` VALUES ('519', '49AB1785', '货号518', '0.96', '', '', '1');
INSERT INTO `tb_item` VALUES ('520', '19217AA7', '货号519', '2.54', '', '', '1');
INSERT INTO `tb_item` VALUES ('521', '7EC048AF', '货号520', '4.38', '', '', '1');
INSERT INTO `tb_item` VALUES ('522', 'B38307EB', '货号521', '3.20', '', '', '1');
INSERT INTO `tb_item` VALUES ('523', '2A9C951A', '货号522', '0.22', '', '', '1');
INSERT INTO `tb_item` VALUES ('524', '1BA35384', '货号523', '1.11', '', '', '1');
INSERT INTO `tb_item` VALUES ('525', '2ADDDB7A', '货号524', '7.65', '', '', '1');
INSERT INTO `tb_item` VALUES ('526', '509B5456', '货号525', '9.60', '', '', '1');
INSERT INTO `tb_item` VALUES ('527', 'CD9A9FFE', '货号526', '6.60', '', '', '1');
INSERT INTO `tb_item` VALUES ('528', '8DB9C1EB', '货号527', '3.61', '', '', '1');
INSERT INTO `tb_item` VALUES ('529', 'D8FB7835', '货号528', '4.47', '', '', '1');
INSERT INTO `tb_item` VALUES ('530', '48A3D08B', '货号529', '8.09', '', '', '1');
INSERT INTO `tb_item` VALUES ('531', 'E557AD0B', '货号530', '9.39', '', '', '1');
INSERT INTO `tb_item` VALUES ('532', 'F38C2798', '货号531', '7.01', '', '', '1');
INSERT INTO `tb_item` VALUES ('533', '93D9EE51', '货号532', '0.18', '', '', '1');
INSERT INTO `tb_item` VALUES ('534', '7787CE9A', '货号533', '9.19', '', '', '1');
INSERT INTO `tb_item` VALUES ('535', '81104CF8', '货号534', '5.90', '', '', '1');
INSERT INTO `tb_item` VALUES ('536', '9E465D3F', '货号535', '8.67', '', '', '1');
INSERT INTO `tb_item` VALUES ('537', 'A8B05427', '货号536', '6.21', '', '', '1');
INSERT INTO `tb_item` VALUES ('538', 'B469CFF9', '货号537', '3.17', '', '', '1');
INSERT INTO `tb_item` VALUES ('539', 'B4525BF0', '货号538', '6.55', '', '', '1');
INSERT INTO `tb_item` VALUES ('540', '4A26B3B0', '货号539', '2.71', '', '', '1');
INSERT INTO `tb_item` VALUES ('541', 'E4A4CC4C', '货号540', '1.76', '', '', '1');
INSERT INTO `tb_item` VALUES ('542', 'E5CA0619', '货号541', '2.59', '', '', '1');
INSERT INTO `tb_item` VALUES ('543', 'FD5AF18E', '货号542', '0.99', '', '', '1');
INSERT INTO `tb_item` VALUES ('544', 'ECA716A1', '货号543', '1.62', '', '', '1');
INSERT INTO `tb_item` VALUES ('545', 'A4C55EFB', '货号544', '6.58', '', '', '1');
INSERT INTO `tb_item` VALUES ('546', '42ECA873', '货号545', '1.94', '', '', '1');
INSERT INTO `tb_item` VALUES ('547', '5A0BDD42', '货号546', '7.95', '', '', '1');
INSERT INTO `tb_item` VALUES ('548', '6BD1B6E7', '货号547', '0.51', '', '', '1');
INSERT INTO `tb_item` VALUES ('549', 'C87BD99E', '货号548', '8.23', '', '', '1');
INSERT INTO `tb_item` VALUES ('550', 'B8CA9E6B', '货号549', '9.39', '', '', '1');
INSERT INTO `tb_item` VALUES ('551', '0E33814C', '货号550', '8.70', '', '', '1');
INSERT INTO `tb_item` VALUES ('552', '252FB765', '货号551', '4.05', '', '', '1');
INSERT INTO `tb_item` VALUES ('553', '7B32BFC3', '货号552', '4.10', '', '', '1');
INSERT INTO `tb_item` VALUES ('554', 'D3963B03', '货号553', '4.37', '', '', '1');
INSERT INTO `tb_item` VALUES ('555', '7047A3F9', '货号554', '1.81', '', '', '1');
INSERT INTO `tb_item` VALUES ('556', '797AAB33', '货号555', '9.08', '', '', '1');
INSERT INTO `tb_item` VALUES ('557', 'DA1A3D2A', '货号556', '2.26', '', '', '1');
INSERT INTO `tb_item` VALUES ('558', '2C529ACD', '货号557', '6.75', '', '', '1');
INSERT INTO `tb_item` VALUES ('559', '8AA49E37', '货号558', '6.98', '', '', '1');
INSERT INTO `tb_item` VALUES ('560', 'ECBC6191', '货号559', '6.59', '', '', '1');
INSERT INTO `tb_item` VALUES ('561', '91FFB51A', '货号560', '1.71', '', '', '1');
INSERT INTO `tb_item` VALUES ('562', 'FB6A19A6', '货号561', '1.83', '', '', '1');
INSERT INTO `tb_item` VALUES ('563', '0F590FEB', '货号562', '9.23', '', '', '1');
INSERT INTO `tb_item` VALUES ('564', '6D719880', '货号563', '5.01', '', '', '1');
INSERT INTO `tb_item` VALUES ('565', 'CE679884', '货号564', '5.46', '', '', '1');
INSERT INTO `tb_item` VALUES ('566', '5757EA21', '货号565', '1.90', '', '', '1');
INSERT INTO `tb_item` VALUES ('567', '3B972415', '货号566', '1.71', '', '', '1');
INSERT INTO `tb_item` VALUES ('568', 'D8C3AE81', '货号567', '0.20', '', '', '1');
INSERT INTO `tb_item` VALUES ('569', '673BFD70', '货号568', '5.12', '', '', '1');
INSERT INTO `tb_item` VALUES ('570', 'D55C053F', '货号569', '5.34', '', '', '1');
INSERT INTO `tb_item` VALUES ('571', 'C300023D', '货号570', '0.19', '', '', '1');
INSERT INTO `tb_item` VALUES ('572', 'C3803389', '货号571', '5.86', '', '', '1');
INSERT INTO `tb_item` VALUES ('573', 'B5BBC628', '货号572', '3.73', '', '', '1');
INSERT INTO `tb_item` VALUES ('574', '4EB5A5DB', '货号573', '1.47', '', '', '1');
INSERT INTO `tb_item` VALUES ('575', 'D5EB246E', '货号574', '9.13', '', '', '1');
INSERT INTO `tb_item` VALUES ('576', '1A53DBE1', '货号575', '1.58', '', '', '1');
INSERT INTO `tb_item` VALUES ('577', '832803F3', '货号576', '0.73', '', '', '1');
INSERT INTO `tb_item` VALUES ('578', 'B1898615', '货号577', '8.06', '', '', '1');
INSERT INTO `tb_item` VALUES ('579', 'BCD0CCEB', '货号578', '3.64', '', '', '1');
INSERT INTO `tb_item` VALUES ('580', 'A894774A', '货号579', '6.94', '', '', '1');
INSERT INTO `tb_item` VALUES ('581', '466CAFF2', '货号580', '8.76', '', '', '1');
INSERT INTO `tb_item` VALUES ('582', 'A97849FE', '货号581', '2.43', '', '', '1');
INSERT INTO `tb_item` VALUES ('583', '3B104CCD', '货号582', '2.53', '', '', '1');
INSERT INTO `tb_item` VALUES ('584', '712D9C87', '货号583', '1.44', '', '', '1');
INSERT INTO `tb_item` VALUES ('585', '322E3E38', '货号584', '5.82', '', '', '1');
INSERT INTO `tb_item` VALUES ('586', '22CD71A4', '货号585', '0.32', '', '', '1');
INSERT INTO `tb_item` VALUES ('587', '67FF949F', '货号586', '7.39', '', '', '1');
INSERT INTO `tb_item` VALUES ('588', '9A1B9A52', '货号587', '5.86', '', '', '1');
INSERT INTO `tb_item` VALUES ('589', '54B65506', '货号588', '8.22', '', '', '1');
INSERT INTO `tb_item` VALUES ('590', '7A3FAFCB', '货号589', '6.83', '', '', '1');
INSERT INTO `tb_item` VALUES ('591', '65EF54AD', '货号590', '3.44', '', '', '1');
INSERT INTO `tb_item` VALUES ('592', '530FCD46', '货号591', '2.43', '', '', '1');
INSERT INTO `tb_item` VALUES ('593', 'E691E8CA', '货号592', '4.93', '', '', '1');
INSERT INTO `tb_item` VALUES ('594', '272D6C24', '货号593', '3.26', '', '', '1');
INSERT INTO `tb_item` VALUES ('595', 'CD2E7095', '货号594', '6.27', '', '', '1');
INSERT INTO `tb_item` VALUES ('596', 'D560AB17', '货号595', '3.05', '', '', '1');
INSERT INTO `tb_item` VALUES ('597', '3D594C1D', '货号596', '8.99', '', '', '1');
INSERT INTO `tb_item` VALUES ('598', '328024F5', '货号597', '8.61', '', '', '1');
INSERT INTO `tb_item` VALUES ('599', 'E38588B4', '货号598', '4.39', '', '', '1');
INSERT INTO `tb_item` VALUES ('600', 'A26D10BF', '货号599', '2.21', '', '', '1');
INSERT INTO `tb_item` VALUES ('601', 'A76B5AD2', '货号600', '4.55', '', '', '1');
INSERT INTO `tb_item` VALUES ('602', '7F15883D', '货号601', '5.63', '', '', '1');
INSERT INTO `tb_item` VALUES ('603', 'FDD6DF65', '货号602', '1.38', '', '', '1');
INSERT INTO `tb_item` VALUES ('604', '2DF82071', '货号603', '8.03', '', '', '1');
INSERT INTO `tb_item` VALUES ('605', 'D443F2CA', '货号604', '5.88', '', '', '1');
INSERT INTO `tb_item` VALUES ('606', 'C517DF54', '货号605', '5.12', '', '', '1');
INSERT INTO `tb_item` VALUES ('607', 'DCF54663', '货号606', '6.09', '', '', '1');
INSERT INTO `tb_item` VALUES ('608', '9BED2C50', '货号607', '2.82', '', '', '1');
INSERT INTO `tb_item` VALUES ('609', '375E9F5A', '货号608', '7.53', '', '', '1');
INSERT INTO `tb_item` VALUES ('610', '2EBBE8F4', '货号609', '8.93', '', '', '1');
INSERT INTO `tb_item` VALUES ('611', '1B8D9455', '货号610', '5.38', '', '', '1');
INSERT INTO `tb_item` VALUES ('612', 'AEACEE30', '货号611', '0.82', '', '', '1');
INSERT INTO `tb_item` VALUES ('613', '1B6FE5C8', '货号612', '8.63', '', '', '1');
INSERT INTO `tb_item` VALUES ('614', '48ED9138', '货号613', '0.01', '', '', '1');
INSERT INTO `tb_item` VALUES ('615', '07B0BE14', '货号614', '2.05', '', '', '1');
INSERT INTO `tb_item` VALUES ('616', '7A2A36FF', '货号615', '0.91', '', '', '1');
INSERT INTO `tb_item` VALUES ('617', '5D4A85D3', '货号616', '4.07', '', '', '1');
INSERT INTO `tb_item` VALUES ('618', '486BB43A', '货号617', '9.07', '', '', '1');
INSERT INTO `tb_item` VALUES ('619', '14ACE3C5', '货号618', '1.28', '', '', '1');
INSERT INTO `tb_item` VALUES ('620', '60108ABF', '货号619', '6.73', '', '', '1');
INSERT INTO `tb_item` VALUES ('621', '7FCA7DB1', '货号620', '0.73', '', '', '1');
INSERT INTO `tb_item` VALUES ('622', '49EED644', '货号621', '3.95', '', '', '1');
INSERT INTO `tb_item` VALUES ('623', 'E7CF282A', '货号622', '3.34', '', '', '1');
INSERT INTO `tb_item` VALUES ('624', 'EA6522F9', '货号623', '5.33', '', '', '1');
INSERT INTO `tb_item` VALUES ('625', '2C11566E', '货号624', '1.47', '', '', '1');
INSERT INTO `tb_item` VALUES ('626', '5FDA1A94', '货号625', '2.16', '', '', '1');
INSERT INTO `tb_item` VALUES ('627', '496F97BF', '货号626', '1.52', '', '', '1');
INSERT INTO `tb_item` VALUES ('628', '232A8670', '货号627', '5.79', '', '', '1');
INSERT INTO `tb_item` VALUES ('629', 'A6275AC1', '货号628', '8.90', '', '', '1');
INSERT INTO `tb_item` VALUES ('630', '422A7AE6', '货号629', '0.18', '', '', '1');
INSERT INTO `tb_item` VALUES ('631', 'BC38B0D3', '货号630', '7.44', '', '', '1');
INSERT INTO `tb_item` VALUES ('632', 'A1E50007', '货号631', '0.13', '', '', '1');
INSERT INTO `tb_item` VALUES ('633', 'F7B45A85', '货号632', '5.70', '', '', '1');
INSERT INTO `tb_item` VALUES ('634', 'B5609476', '货号633', '2.00', '', '', '1');
INSERT INTO `tb_item` VALUES ('635', 'AABA55BE', '货号634', '2.98', '', '', '1');
INSERT INTO `tb_item` VALUES ('636', 'BECFD036', '货号635', '8.02', '', '', '1');
INSERT INTO `tb_item` VALUES ('637', '027FCE1E', '货号636', '3.92', '', '', '1');
INSERT INTO `tb_item` VALUES ('638', 'BF4651A9', '货号637', '6.92', '', '', '1');
INSERT INTO `tb_item` VALUES ('639', 'EF2EBC44', '货号638', '3.92', '', '', '1');
INSERT INTO `tb_item` VALUES ('640', '502F1926', '货号639', '1.24', '', '', '1');
INSERT INTO `tb_item` VALUES ('641', '9539842A', '货号640', '5.31', '', '', '1');
INSERT INTO `tb_item` VALUES ('642', 'EC15D3DB', '货号641', '6.72', '', '', '1');
INSERT INTO `tb_item` VALUES ('643', '5F146A16', '货号642', '5.84', '', '', '1');
INSERT INTO `tb_item` VALUES ('644', 'B607778A', '货号643', '7.27', '', '', '1');
INSERT INTO `tb_item` VALUES ('645', '698F4DF8', '货号644', '8.03', '', '', '1');
INSERT INTO `tb_item` VALUES ('646', '0178CDED', '货号645', '1.79', '', '', '1');
INSERT INTO `tb_item` VALUES ('647', 'E8BF26A5', '货号646', '3.28', '', '', '1');
INSERT INTO `tb_item` VALUES ('648', '6FA8872E', '货号647', '0.93', '', '', '1');
INSERT INTO `tb_item` VALUES ('649', '7091D8B9', '货号648', '6.98', '', '', '1');
INSERT INTO `tb_item` VALUES ('650', 'CD1ACF86', '货号649', '3.70', '', '', '1');
INSERT INTO `tb_item` VALUES ('651', '51D88161', '货号650', '8.51', '', '', '1');
INSERT INTO `tb_item` VALUES ('652', '429647F9', '货号651', '0.55', '', '', '1');
INSERT INTO `tb_item` VALUES ('653', 'E972FDD3', '货号652', '9.63', '', '', '1');
INSERT INTO `tb_item` VALUES ('654', '6FA34EED', '货号653', '6.76', '', '', '1');
INSERT INTO `tb_item` VALUES ('655', '9D740B23', '货号654', '9.72', '', '', '1');
INSERT INTO `tb_item` VALUES ('656', '4F4C97E4', '货号655', '6.82', '', '', '1');
INSERT INTO `tb_item` VALUES ('657', '53CF60CA', '货号656', '3.93', '', '', '1');
INSERT INTO `tb_item` VALUES ('658', 'F3E5D078', '货号657', '6.32', '', '', '1');
INSERT INTO `tb_item` VALUES ('659', 'FDE29668', '货号658', '9.41', '', '', '1');
INSERT INTO `tb_item` VALUES ('660', '1D51CA37', '货号659', '0.43', '', '', '1');
INSERT INTO `tb_item` VALUES ('661', '46020DB0', '货号660', '7.17', '', '', '1');
INSERT INTO `tb_item` VALUES ('662', '313E53EC', '货号661', '4.78', '', '', '1');
INSERT INTO `tb_item` VALUES ('663', '4CF06598', '货号662', '1.56', '', '', '1');
INSERT INTO `tb_item` VALUES ('664', '841C05DC', '货号663', '1.45', '', '', '1');
INSERT INTO `tb_item` VALUES ('665', '80F3510E', '货号664', '1.77', '', '', '1');
INSERT INTO `tb_item` VALUES ('666', '34B81195', '货号665', '1.81', '', '', '1');
INSERT INTO `tb_item` VALUES ('667', 'DA266971', '货号666', '7.01', '', '', '1');
INSERT INTO `tb_item` VALUES ('668', '75194372', '货号667', '1.98', '', '', '1');
INSERT INTO `tb_item` VALUES ('669', 'C607D523', '货号668', '3.08', '', '', '1');
INSERT INTO `tb_item` VALUES ('670', 'B9E4E994', '货号669', '0.86', '', '', '1');
INSERT INTO `tb_item` VALUES ('671', '873E6219', '货号670', '1.06', '', '', '1');
INSERT INTO `tb_item` VALUES ('672', '7A69B318', '货号671', '7.60', '', '', '1');
INSERT INTO `tb_item` VALUES ('673', 'E80D74EA', '货号672', '0.44', '', '', '1');
INSERT INTO `tb_item` VALUES ('674', 'B1289335', '货号673', '6.95', '', '', '1');
INSERT INTO `tb_item` VALUES ('675', '4747547C', '货号674', '5.73', '', '', '1');
INSERT INTO `tb_item` VALUES ('676', '0044CC87', '货号675', '4.17', '', '', '1');
INSERT INTO `tb_item` VALUES ('677', 'BBB52557', '货号676', '1.87', '', '', '1');
INSERT INTO `tb_item` VALUES ('678', '3F37C46A', '货号677', '8.77', '', '', '1');
INSERT INTO `tb_item` VALUES ('679', '0B647163', '货号678', '7.12', '', '', '1');
INSERT INTO `tb_item` VALUES ('680', '05F44230', '货号679', '4.34', '', '', '1');
INSERT INTO `tb_item` VALUES ('681', '0F11AE54', '货号680', '6.79', '', '', '1');
INSERT INTO `tb_item` VALUES ('682', '9263B875', '货号681', '0.41', '', '', '1');
INSERT INTO `tb_item` VALUES ('683', '1DAA645D', '货号682', '1.82', '', '', '1');
INSERT INTO `tb_item` VALUES ('684', 'F1231C48', '货号683', '4.02', '', '', '1');
INSERT INTO `tb_item` VALUES ('685', '4BC7C465', '货号684', '4.47', '', '', '1');
INSERT INTO `tb_item` VALUES ('686', '47F98907', '货号685', '2.39', '', '', '1');
INSERT INTO `tb_item` VALUES ('687', 'D7E2245F', '货号686', '5.01', '', '', '1');
INSERT INTO `tb_item` VALUES ('688', 'CCB21645', '货号687', '3.75', '', '', '1');
INSERT INTO `tb_item` VALUES ('689', '3357592B', '货号688', '1.71', '', '', '1');
INSERT INTO `tb_item` VALUES ('690', '3F045EC9', '货号689', '9.16', '', '', '1');
INSERT INTO `tb_item` VALUES ('691', '7EA82029', '货号690', '9.07', '', '', '1');
INSERT INTO `tb_item` VALUES ('692', 'A3FECAB3', '货号691', '5.60', '', '', '1');
INSERT INTO `tb_item` VALUES ('693', '324C0A98', '货号692', '8.04', '', '', '1');
INSERT INTO `tb_item` VALUES ('694', 'F34F8B54', '货号693', '7.59', '', '', '1');
INSERT INTO `tb_item` VALUES ('695', 'E5E73D00', '货号694', '0.52', '', '', '1');
INSERT INTO `tb_item` VALUES ('696', 'CCA91C20', '货号695', '7.51', '', '', '1');
INSERT INTO `tb_item` VALUES ('697', 'E065B15F', '货号696', '3.80', '', '', '1');
INSERT INTO `tb_item` VALUES ('698', '188DACC7', '货号697', '8.63', '', '', '1');
INSERT INTO `tb_item` VALUES ('699', 'EFD67038', '货号698', '4.65', '', '', '1');
INSERT INTO `tb_item` VALUES ('700', 'D16AAD78', '货号699', '4.74', '', '', '1');
INSERT INTO `tb_item` VALUES ('701', 'CDC15E06', '货号700', '7.58', '', '', '1');
INSERT INTO `tb_item` VALUES ('702', 'D3B06BA4', '货号701', '3.55', '', '', '1');
INSERT INTO `tb_item` VALUES ('703', '478F9462', '货号702', '7.04', '', '', '1');
INSERT INTO `tb_item` VALUES ('704', '3B3C98A2', '货号703', '7.92', '', '', '1');
INSERT INTO `tb_item` VALUES ('705', 'A43A1339', '货号704', '9.25', '', '', '1');
INSERT INTO `tb_item` VALUES ('706', '09F9B72A', '货号705', '8.48', '', '', '1');
INSERT INTO `tb_item` VALUES ('707', '4302283D', '货号706', '4.84', '', '', '1');
INSERT INTO `tb_item` VALUES ('708', '70843950', '货号707', '4.52', '', '', '1');
INSERT INTO `tb_item` VALUES ('709', '6AE21611', '货号708', '1.18', '', '', '1');
INSERT INTO `tb_item` VALUES ('710', 'B998F0C6', '货号709', '0.42', '', '', '1');
INSERT INTO `tb_item` VALUES ('711', '2408A97E', '货号710', '5.68', '', '', '1');
INSERT INTO `tb_item` VALUES ('712', 'EAE99E66', '货号711', '3.64', '', '', '1');
INSERT INTO `tb_item` VALUES ('713', 'E78AC577', '货号712', '7.71', '', '', '1');
INSERT INTO `tb_item` VALUES ('714', 'E76C65D9', '货号713', '5.69', '', '', '1');
INSERT INTO `tb_item` VALUES ('715', 'BCA34A59', '货号714', '5.78', '', '', '1');
INSERT INTO `tb_item` VALUES ('716', '3E279EB4', '货号715', '5.56', '', '', '1');
INSERT INTO `tb_item` VALUES ('717', '8B919F97', '货号716', '5.14', '', '', '1');
INSERT INTO `tb_item` VALUES ('718', 'DF4C8C2D', '货号717', '5.14', '', '', '1');
INSERT INTO `tb_item` VALUES ('719', '972313FB', '货号718', '3.09', '', '', '1');
INSERT INTO `tb_item` VALUES ('720', '201E31D4', '货号719', '2.19', '', '', '1');
INSERT INTO `tb_item` VALUES ('721', '8E3289CC', '货号720', '7.37', '', '', '1');
INSERT INTO `tb_item` VALUES ('722', 'E13357AC', '货号721', '1.73', '', '', '1');
INSERT INTO `tb_item` VALUES ('723', 'B450F5EB', '货号722', '0.73', '', '', '1');
INSERT INTO `tb_item` VALUES ('724', '29ED7A49', '货号723', '1.90', '', '', '1');
INSERT INTO `tb_item` VALUES ('725', '36D81AAC', '货号724', '2.11', '', '', '1');
INSERT INTO `tb_item` VALUES ('726', 'B84515F4', '货号725', '6.08', '', '', '1');
INSERT INTO `tb_item` VALUES ('727', 'CB604268', '货号726', '1.03', '', '', '1');
INSERT INTO `tb_item` VALUES ('728', '2B263A2F', '货号727', '8.99', '', '', '1');
INSERT INTO `tb_item` VALUES ('729', '9601DE03', '货号728', '4.61', '', '', '1');
INSERT INTO `tb_item` VALUES ('730', 'A98E2724', '货号729', '1.78', '', '', '1');
INSERT INTO `tb_item` VALUES ('731', 'F7201D6B', '货号730', '8.97', '', '', '1');
INSERT INTO `tb_item` VALUES ('732', '80CE1C4C', '货号731', '5.52', '', '', '1');
INSERT INTO `tb_item` VALUES ('733', '2B914B30', '货号732', '5.58', '', '', '1');
INSERT INTO `tb_item` VALUES ('734', '030D6A22', '货号733', '8.54', '', '', '1');
INSERT INTO `tb_item` VALUES ('735', '1B41B2B5', '货号734', '6.75', '', '', '1');
INSERT INTO `tb_item` VALUES ('736', 'EC2EE7E0', '货号735', '2.46', '', '', '1');
INSERT INTO `tb_item` VALUES ('737', 'A2C26405', '货号736', '1.97', '', '', '1');
INSERT INTO `tb_item` VALUES ('738', 'CFAFA58D', '货号737', '8.05', '', '', '1');
INSERT INTO `tb_item` VALUES ('739', '3B9CDBB9', '货号738', '5.66', '', '', '1');
INSERT INTO `tb_item` VALUES ('740', 'A1A5F816', '货号739', '9.23', '', '', '1');
INSERT INTO `tb_item` VALUES ('741', '4BC9C27C', '货号740', '4.24', '', '', '1');
INSERT INTO `tb_item` VALUES ('742', 'F91D9F1C', '货号741', '7.35', '', '', '1');
INSERT INTO `tb_item` VALUES ('743', 'D65EB699', '货号742', '5.91', '', '', '1');
INSERT INTO `tb_item` VALUES ('744', 'B1042100', '货号743', '9.44', '', '', '1');
INSERT INTO `tb_item` VALUES ('745', '8558904C', '货号744', '2.73', '', '', '1');
INSERT INTO `tb_item` VALUES ('746', '9E8D0423', '货号745', '1.48', '', '', '1');
INSERT INTO `tb_item` VALUES ('747', 'F6831D77', '货号746', '3.61', '', '', '1');
INSERT INTO `tb_item` VALUES ('748', 'C5CD37EE', '货号747', '1.44', '', '', '1');
INSERT INTO `tb_item` VALUES ('749', 'EBA28614', '货号748', '2.61', '', '', '1');
INSERT INTO `tb_item` VALUES ('750', 'DDDDFB4C', '货号749', '8.32', '', '', '1');
INSERT INTO `tb_item` VALUES ('751', '28437D83', '货号750', '1.79', '', '', '1');
INSERT INTO `tb_item` VALUES ('752', '1529254E', '货号751', '1.67', '', '', '1');
INSERT INTO `tb_item` VALUES ('753', '3E5AD51F', '货号752', '7.09', '', '', '1');
INSERT INTO `tb_item` VALUES ('754', 'CB163415', '货号753', '3.18', '', '', '1');
INSERT INTO `tb_item` VALUES ('755', 'C0808C26', '货号754', '2.35', '', '', '1');
INSERT INTO `tb_item` VALUES ('756', '0D016210', '货号755', '4.00', '', '', '1');
INSERT INTO `tb_item` VALUES ('757', '08B03274', '货号756', '8.96', '', '', '1');
INSERT INTO `tb_item` VALUES ('758', '5E9E1DAD', '货号757', '2.69', '', '', '1');
INSERT INTO `tb_item` VALUES ('759', '8251B0E7', '货号758', '2.36', '', '', '1');
INSERT INTO `tb_item` VALUES ('760', 'CCA114D8', '货号759', '7.12', '', '', '1');
INSERT INTO `tb_item` VALUES ('761', '5737A4A9', '货号760', '8.92', '', '', '1');
INSERT INTO `tb_item` VALUES ('762', '147CE8E4', '货号761', '2.82', '', '', '1');
INSERT INTO `tb_item` VALUES ('763', 'D40B50A7', '货号762', '2.36', '', '', '1');
INSERT INTO `tb_item` VALUES ('764', 'BFD7A0C8', '货号763', '2.79', '', '', '1');
INSERT INTO `tb_item` VALUES ('765', '66344918', '货号764', '7.22', '', '', '1');
INSERT INTO `tb_item` VALUES ('766', '8CC6BA01', '货号765', '3.69', '', '', '1');
INSERT INTO `tb_item` VALUES ('767', 'E8346EC1', '货号766', '9.62', '', '', '1');
INSERT INTO `tb_item` VALUES ('768', 'A0EA7C4C', '货号767', '0.46', '', '', '1');
INSERT INTO `tb_item` VALUES ('769', 'AAD781DD', '货号768', '2.07', '', '', '1');
INSERT INTO `tb_item` VALUES ('770', '68277BF3', '货号769', '0.15', '', '', '1');
INSERT INTO `tb_item` VALUES ('771', '044D278F', '货号770', '7.38', '', '', '1');
INSERT INTO `tb_item` VALUES ('772', '65CAF0E3', '货号771', '7.67', '', '', '1');
INSERT INTO `tb_item` VALUES ('773', '7B13B776', '货号772', '6.31', '', '', '1');
INSERT INTO `tb_item` VALUES ('774', '2EC9B0BC', '货号773', '2.35', '', '', '1');
INSERT INTO `tb_item` VALUES ('775', '41611D88', '货号774', '7.65', '', '', '1');
INSERT INTO `tb_item` VALUES ('776', '0CC92BD5', '货号775', '6.37', '', '', '1');
INSERT INTO `tb_item` VALUES ('777', '6C6EE626', '货号776', '7.82', '', '', '1');
INSERT INTO `tb_item` VALUES ('778', 'CBC5E11C', '货号777', '0.51', '', '', '1');
INSERT INTO `tb_item` VALUES ('779', '716AA67C', '货号778', '4.88', '', '', '1');
INSERT INTO `tb_item` VALUES ('780', 'F9B2D8F3', '货号779', '0.37', '', '', '1');
INSERT INTO `tb_item` VALUES ('781', 'CB8CEB2D', '货号780', '5.65', '', '', '1');
INSERT INTO `tb_item` VALUES ('782', '77D234A2', '货号781', '2.97', '', '', '1');
INSERT INTO `tb_item` VALUES ('783', '6231A9AC', '货号782', '7.32', '', '', '1');
INSERT INTO `tb_item` VALUES ('784', '101B5480', '货号783', '8.26', '', '', '1');
INSERT INTO `tb_item` VALUES ('785', '145F476C', '货号784', '7.63', '', '', '1');
INSERT INTO `tb_item` VALUES ('786', 'F7B3E727', '货号785', '0.10', '', '', '1');
INSERT INTO `tb_item` VALUES ('787', '58A6E115', '货号786', '0.59', '', '', '1');
INSERT INTO `tb_item` VALUES ('788', '53384F79', '货号787', '3.68', '', '', '1');
INSERT INTO `tb_item` VALUES ('789', 'E7DB5803', '货号788', '0.53', '', '', '1');
INSERT INTO `tb_item` VALUES ('790', 'A06B7BAE', '货号789', '0.02', '', '', '1');
INSERT INTO `tb_item` VALUES ('791', '24032607', '货号790', '3.48', '', '', '1');
INSERT INTO `tb_item` VALUES ('792', '056AADBB', '货号791', '8.21', '', '', '1');
INSERT INTO `tb_item` VALUES ('793', '3FF69FFF', '货号792', '0.33', '', '', '1');
INSERT INTO `tb_item` VALUES ('794', '56432BAA', '货号793', '5.97', '', '', '1');
INSERT INTO `tb_item` VALUES ('795', '3827C822', '货号794', '7.17', '', '', '1');
INSERT INTO `tb_item` VALUES ('796', 'A4CAF278', '货号795', '2.10', '', '', '1');
INSERT INTO `tb_item` VALUES ('797', '7F98225D', '货号796', '0.19', '', '', '1');
INSERT INTO `tb_item` VALUES ('798', 'B6C6995F', '货号797', '1.75', '', '', '1');
INSERT INTO `tb_item` VALUES ('799', '61CB4DDA', '货号798', '2.34', '', '', '1');
INSERT INTO `tb_item` VALUES ('800', 'CEA0DB2D', '货号799', '5.57', '', '', '1');
INSERT INTO `tb_item` VALUES ('801', '0D066C7B', '货号800', '0.51', '', '', '1');
INSERT INTO `tb_item` VALUES ('802', '3739B232', '货号801', '8.61', '', '', '1');
INSERT INTO `tb_item` VALUES ('803', '1FED0B90', '货号802', '4.97', '', '', '1');
INSERT INTO `tb_item` VALUES ('804', 'F06B8D44', '货号803', '7.59', '', '', '1');
INSERT INTO `tb_item` VALUES ('805', 'B2E92EF8', '货号804', '9.07', '', '', '1');
INSERT INTO `tb_item` VALUES ('806', 'BC0DD679', '货号805', '8.13', '', '', '1');
INSERT INTO `tb_item` VALUES ('807', 'F279C354', '货号806', '2.30', '', '', '1');
INSERT INTO `tb_item` VALUES ('808', 'BED3971E', '货号807', '7.39', '', '', '1');
INSERT INTO `tb_item` VALUES ('809', '833F5DDC', '货号808', '5.53', '', '', '1');
INSERT INTO `tb_item` VALUES ('810', 'A1D590EA', '货号809', '3.98', '', '', '1');
INSERT INTO `tb_item` VALUES ('811', '441C955B', '货号810', '3.21', '', '', '1');
INSERT INTO `tb_item` VALUES ('812', '8929C339', '货号811', '6.99', '', '', '1');
INSERT INTO `tb_item` VALUES ('813', '24263E3C', '货号812', '3.85', '', '', '1');
INSERT INTO `tb_item` VALUES ('814', '06A40D3E', '货号813', '1.24', '', '', '1');
INSERT INTO `tb_item` VALUES ('815', '3B3AEA4E', '货号814', '7.90', '', '', '1');
INSERT INTO `tb_item` VALUES ('816', 'BED781B8', '货号815', '6.30', '', '', '1');
INSERT INTO `tb_item` VALUES ('817', 'BBECABE7', '货号816', '5.83', '', '', '1');
INSERT INTO `tb_item` VALUES ('818', '4BA438E8', '货号817', '8.61', '', '', '1');
INSERT INTO `tb_item` VALUES ('819', 'BF443446', '货号818', '3.54', '', '', '1');
INSERT INTO `tb_item` VALUES ('820', 'A3C1905A', '货号819', '3.51', '', '', '1');
INSERT INTO `tb_item` VALUES ('821', 'E8431D47', '货号820', '6.41', '', '', '1');
INSERT INTO `tb_item` VALUES ('822', 'B1C62A0D', '货号821', '6.85', '', '', '1');
INSERT INTO `tb_item` VALUES ('823', '18ECA41E', '货号822', '0.11', '', '', '1');
INSERT INTO `tb_item` VALUES ('824', '59FCBFFB', '货号823', '7.43', '', '', '1');
INSERT INTO `tb_item` VALUES ('825', 'D20EB89A', '货号824', '3.26', '', '', '1');
INSERT INTO `tb_item` VALUES ('826', '9191E8CE', '货号825', '7.75', '', '', '1');
INSERT INTO `tb_item` VALUES ('827', '6FA59431', '货号826', '8.12', '', '', '1');
INSERT INTO `tb_item` VALUES ('828', 'DB825823', '货号827', '1.15', '', '', '1');
INSERT INTO `tb_item` VALUES ('829', '54CCE067', '货号828', '1.13', '', '', '1');
INSERT INTO `tb_item` VALUES ('830', 'D9B1917B', '货号829', '5.20', '', '', '1');
INSERT INTO `tb_item` VALUES ('831', '4E0E1BBD', '货号830', '0.00', '', '', '1');
INSERT INTO `tb_item` VALUES ('832', 'BA60122E', '货号831', '8.54', '', '', '1');
INSERT INTO `tb_item` VALUES ('833', 'D3464BF9', '货号832', '3.92', '', '', '1');
INSERT INTO `tb_item` VALUES ('834', 'FD02E092', '货号833', '2.02', '', '', '1');
INSERT INTO `tb_item` VALUES ('835', 'D6E42F18', '货号834', '1.12', '', '', '1');
INSERT INTO `tb_item` VALUES ('836', '75C5E2B7', '货号835', '1.02', '', '', '1');
INSERT INTO `tb_item` VALUES ('837', '4F26A24D', '货号836', '2.28', '', '', '1');
INSERT INTO `tb_item` VALUES ('838', '519D1444', '货号837', '2.30', '', '', '1');
INSERT INTO `tb_item` VALUES ('839', '7E47F667', '货号838', '1.24', '', '', '1');
INSERT INTO `tb_item` VALUES ('840', '3B2A0DAC', '货号839', '1.56', '', '', '1');
INSERT INTO `tb_item` VALUES ('841', '43B91762', '货号840', '3.17', '', '', '1');
INSERT INTO `tb_item` VALUES ('842', '8DDBB0C3', '货号841', '0.33', '', '', '1');
INSERT INTO `tb_item` VALUES ('843', 'D26D4502', '货号842', '9.28', '', '', '1');
INSERT INTO `tb_item` VALUES ('844', '5E790A79', '货号843', '3.64', '', '', '1');
INSERT INTO `tb_item` VALUES ('845', '975A5114', '货号844', '8.47', '', '', '1');
INSERT INTO `tb_item` VALUES ('846', '31265BA8', '货号845', '9.80', '', '', '1');
INSERT INTO `tb_item` VALUES ('847', '1DBA9554', '货号846', '0.32', '', '', '1');
INSERT INTO `tb_item` VALUES ('848', '17D36CEB', '货号847', '6.56', '', '', '1');
INSERT INTO `tb_item` VALUES ('849', '4D35020D', '货号848', '7.94', '', '', '1');
INSERT INTO `tb_item` VALUES ('850', '6838002F', '货号849', '9.12', '', '', '1');
INSERT INTO `tb_item` VALUES ('851', 'B7329B07', '货号850', '1.47', '', '', '1');
INSERT INTO `tb_item` VALUES ('852', '78E42788', '货号851', '5.38', '', '', '1');
INSERT INTO `tb_item` VALUES ('853', '8231E880', '货号852', '9.98', '', '', '1');
INSERT INTO `tb_item` VALUES ('854', '020D0132', '货号853', '7.74', '', '', '1');
INSERT INTO `tb_item` VALUES ('855', '6655AF75', '货号854', '9.20', '', '', '1');
INSERT INTO `tb_item` VALUES ('856', 'B350B2D0', '货号855', '7.83', '', '', '1');
INSERT INTO `tb_item` VALUES ('857', '253C4CB7', '货号856', '4.20', '', '', '1');
INSERT INTO `tb_item` VALUES ('858', 'EDCCFD92', '货号857', '0.74', '', '', '1');
INSERT INTO `tb_item` VALUES ('859', 'C95747DB', '货号858', '7.96', '', '', '1');
INSERT INTO `tb_item` VALUES ('860', 'E2D60B6A', '货号859', '0.33', '', '', '1');
INSERT INTO `tb_item` VALUES ('861', 'D9D27F64', '货号860', '9.83', '', '', '1');
INSERT INTO `tb_item` VALUES ('862', '57A29DAF', '货号861', '2.70', '', '', '1');
INSERT INTO `tb_item` VALUES ('863', 'D7B9BF7A', '货号862', '7.64', '', '', '1');
INSERT INTO `tb_item` VALUES ('864', '7E853AC7', '货号863', '3.64', '', '', '1');
INSERT INTO `tb_item` VALUES ('865', 'F4315025', '货号864', '9.92', '', '', '1');
INSERT INTO `tb_item` VALUES ('866', '55CDE8FA', '货号865', '3.91', '', '', '1');
INSERT INTO `tb_item` VALUES ('867', 'A4D4AA81', '货号866', '7.62', '', '', '1');
INSERT INTO `tb_item` VALUES ('868', '1006C3A9', '货号867', '8.94', '', '', '1');
INSERT INTO `tb_item` VALUES ('869', '3FBCCE2A', '货号868', '7.59', '', '', '1');
INSERT INTO `tb_item` VALUES ('870', '9700EAD0', '货号869', '7.62', '', '', '1');
INSERT INTO `tb_item` VALUES ('871', '098CC9AA', '货号870', '8.50', '', '', '1');
INSERT INTO `tb_item` VALUES ('872', '3A50FFD6', '货号871', '6.40', '', '', '1');
INSERT INTO `tb_item` VALUES ('873', '1F0CBAD8', '货号872', '0.44', '', '', '1');
INSERT INTO `tb_item` VALUES ('874', '41A423D9', '货号873', '6.69', '', '', '1');
INSERT INTO `tb_item` VALUES ('875', 'FCD39C50', '货号874', '2.63', '', '', '1');
INSERT INTO `tb_item` VALUES ('876', 'ED0E7036', '货号875', '8.20', '', '', '1');
INSERT INTO `tb_item` VALUES ('877', 'C9D08022', '货号876', '5.60', '', '', '1');
INSERT INTO `tb_item` VALUES ('878', '6E0A3879', '货号877', '6.32', '', '', '1');
INSERT INTO `tb_item` VALUES ('879', '603604E5', '货号878', '8.33', '', '', '1');
INSERT INTO `tb_item` VALUES ('880', '8CEE477E', '货号879', '9.64', '', '', '1');
INSERT INTO `tb_item` VALUES ('881', 'B19F7107', '货号880', '3.63', '', '', '1');
INSERT INTO `tb_item` VALUES ('882', '32C57946', '货号881', '2.52', '', '', '1');
INSERT INTO `tb_item` VALUES ('883', '7A28EC8E', '货号882', '5.83', '', '', '1');
INSERT INTO `tb_item` VALUES ('884', '383A2814', '货号883', '0.81', '', '', '1');
INSERT INTO `tb_item` VALUES ('885', '6E752D26', '货号884', '3.07', '', '', '1');
INSERT INTO `tb_item` VALUES ('886', 'EAF06039', '货号885', '4.80', '', '', '1');
INSERT INTO `tb_item` VALUES ('887', '027CC2F1', '货号886', '1.92', '', '', '1');
INSERT INTO `tb_item` VALUES ('888', 'E57FECE5', '货号887', '1.81', '', '', '1');
INSERT INTO `tb_item` VALUES ('889', 'AD0DF4A7', '货号888', '4.15', '', '', '1');
INSERT INTO `tb_item` VALUES ('890', '041B5E8A', '货号889', '6.55', '', '', '1');
INSERT INTO `tb_item` VALUES ('891', '2DAB1369', '货号890', '4.99', '', '', '1');
INSERT INTO `tb_item` VALUES ('892', '19914774', '货号891', '6.76', '', '', '1');
INSERT INTO `tb_item` VALUES ('893', '0F6BF541', '货号892', '2.79', '', '', '1');
INSERT INTO `tb_item` VALUES ('894', '9E99B6BE', '货号893', '2.30', '', '', '1');
INSERT INTO `tb_item` VALUES ('895', 'F392FE74', '货号894', '5.82', '', '', '1');
INSERT INTO `tb_item` VALUES ('896', '2540EA61', '货号895', '9.89', '', '', '1');
INSERT INTO `tb_item` VALUES ('897', '6D2BB36C', '货号896', '9.74', '', '', '1');
INSERT INTO `tb_item` VALUES ('898', 'BC9AFD3E', '货号897', '5.17', '', '', '1');
INSERT INTO `tb_item` VALUES ('899', '95554EC1', '货号898', '7.33', '', '', '1');
INSERT INTO `tb_item` VALUES ('900', '4A68C273', '货号899', '8.30', '', '', '1');
INSERT INTO `tb_item` VALUES ('901', '5B3BBA03', '货号900', '4.15', '', '', '1');
INSERT INTO `tb_item` VALUES ('902', '0CFCF218', '货号901', '4.71', '', '', '1');
INSERT INTO `tb_item` VALUES ('903', 'A4B98538', '货号902', '7.88', '', '', '1');
INSERT INTO `tb_item` VALUES ('904', 'DDCC413C', '货号903', '2.54', '', '', '1');
INSERT INTO `tb_item` VALUES ('905', '8A0355A6', '货号904', '5.82', '', '', '1');
INSERT INTO `tb_item` VALUES ('906', '2DFF4EAA', '货号905', '0.94', '', '', '1');
INSERT INTO `tb_item` VALUES ('907', '1F972B63', '货号906', '4.54', '', '', '1');
INSERT INTO `tb_item` VALUES ('908', '7F8B5051', '货号907', '7.74', '', '', '1');
INSERT INTO `tb_item` VALUES ('909', 'A9050073', '货号908', '9.75', '', '', '1');
INSERT INTO `tb_item` VALUES ('910', 'DC41DA67', '货号909', '9.27', '', '', '1');
INSERT INTO `tb_item` VALUES ('911', '1285450D', '货号910', '1.77', '', '', '1');
INSERT INTO `tb_item` VALUES ('912', 'A9920B1F', '货号911', '6.62', '', '', '1');
INSERT INTO `tb_item` VALUES ('913', '51F87C26', '货号912', '3.15', '', '', '1');
INSERT INTO `tb_item` VALUES ('914', '3E5CFB90', '货号913', '8.80', '', '', '1');
INSERT INTO `tb_item` VALUES ('915', '6B7148D9', '货号914', '7.23', '', '', '1');
INSERT INTO `tb_item` VALUES ('916', '3841EECF', '货号915', '1.77', '', '', '1');
INSERT INTO `tb_item` VALUES ('917', '0CADF6DF', '货号916', '2.24', '', '', '1');
INSERT INTO `tb_item` VALUES ('918', '81FBCBF8', '货号917', '3.89', '', '', '1');
INSERT INTO `tb_item` VALUES ('919', '045B5EEF', '货号918', '4.52', '', '', '1');
INSERT INTO `tb_item` VALUES ('920', 'EC2808C1', '货号919', '7.88', '', '', '1');
INSERT INTO `tb_item` VALUES ('921', '2B3E0C46', '货号920', '5.80', '', '', '1');
INSERT INTO `tb_item` VALUES ('922', 'D6F9A57D', '货号921', '1.21', '', '', '1');
INSERT INTO `tb_item` VALUES ('923', 'B9F83144', '货号922', '9.92', '', '', '1');
INSERT INTO `tb_item` VALUES ('924', 'F16810AA', '货号923', '5.50', '', '', '1');
INSERT INTO `tb_item` VALUES ('925', '6DFFD774', '货号924', '6.78', '', '', '1');
INSERT INTO `tb_item` VALUES ('926', '53CBCA69', '货号925', '1.91', '', '', '1');
INSERT INTO `tb_item` VALUES ('927', '66168383', '货号926', '8.77', '', '', '1');
INSERT INTO `tb_item` VALUES ('928', 'DFAE36F8', '货号927', '8.22', '', '', '1');
INSERT INTO `tb_item` VALUES ('929', 'F9D03910', '货号928', '2.69', '', '', '1');
INSERT INTO `tb_item` VALUES ('930', '6067A448', '货号929', '1.55', '', '', '1');
INSERT INTO `tb_item` VALUES ('931', 'B1AE1933', '货号930', '8.13', '', '', '1');
INSERT INTO `tb_item` VALUES ('932', '04CD7C18', '货号931', '1.89', '', '', '1');
INSERT INTO `tb_item` VALUES ('933', '11CD7E72', '货号932', '2.04', '', '', '1');
INSERT INTO `tb_item` VALUES ('934', 'C2D93D01', '货号933', '1.35', '', '', '1');
INSERT INTO `tb_item` VALUES ('935', 'CC1A5282', '货号934', '6.93', '', '', '1');
INSERT INTO `tb_item` VALUES ('936', '81516CF6', '货号935', '0.15', '', '', '1');
INSERT INTO `tb_item` VALUES ('937', 'CAEABC89', '货号936', '3.20', '', '', '1');
INSERT INTO `tb_item` VALUES ('938', '5F2C37E9', '货号937', '0.95', '', '', '1');
INSERT INTO `tb_item` VALUES ('939', '064BFD68', '货号938', '5.25', '', '', '1');
INSERT INTO `tb_item` VALUES ('940', '623BD667', '货号939', '2.39', '', '', '1');
INSERT INTO `tb_item` VALUES ('941', '980BB610', '货号940', '3.56', '', '', '1');
INSERT INTO `tb_item` VALUES ('942', 'E8AFF5F0', '货号941', '7.50', '', '', '1');
INSERT INTO `tb_item` VALUES ('943', '19A9DDEF', '货号942', '0.54', '', '', '1');
INSERT INTO `tb_item` VALUES ('944', 'CF55321A', '货号943', '4.25', '', '', '1');
INSERT INTO `tb_item` VALUES ('945', 'C6338420', '货号944', '5.77', '', '', '1');
INSERT INTO `tb_item` VALUES ('946', '15A6E63A', '货号945', '5.65', '', '', '1');
INSERT INTO `tb_item` VALUES ('947', '1E117476', '货号946', '9.99', '', '', '1');
INSERT INTO `tb_item` VALUES ('948', 'E3E6BD91', '货号947', '7.95', '', '', '1');
INSERT INTO `tb_item` VALUES ('949', 'AA540ECF', '货号948', '7.42', '', '', '1');
INSERT INTO `tb_item` VALUES ('950', '55EA7BF1', '货号949', '2.36', '', '', '1');
INSERT INTO `tb_item` VALUES ('951', 'AB041B8D', '货号950', '2.33', '', '', '1');
INSERT INTO `tb_item` VALUES ('952', '92579640', '货号951', '8.08', '', '', '1');
INSERT INTO `tb_item` VALUES ('953', '8A924550', '货号952', '3.34', '', '', '1');
INSERT INTO `tb_item` VALUES ('954', 'CF7AEC72', '货号953', '7.15', '', '', '1');
INSERT INTO `tb_item` VALUES ('955', 'EE68EC4B', '货号954', '6.99', '', '', '1');
INSERT INTO `tb_item` VALUES ('956', '4EFDA367', '货号955', '3.14', '', '', '1');
INSERT INTO `tb_item` VALUES ('957', '509F4A01', '货号956', '0.88', '', '', '1');
INSERT INTO `tb_item` VALUES ('958', '742CF22D', '货号957', '1.92', '', '', '1');
INSERT INTO `tb_item` VALUES ('959', '2A0164D8', '货号958', '3.80', '', '', '1');
INSERT INTO `tb_item` VALUES ('960', 'FDBBB7A1', '货号959', '6.53', '', '', '1');
INSERT INTO `tb_item` VALUES ('961', 'A3CF2D24', '货号960', '2.74', '', '', '1');
INSERT INTO `tb_item` VALUES ('962', 'AF95336B', '货号961', '9.78', '', '', '1');
INSERT INTO `tb_item` VALUES ('963', 'FD501211', '货号962', '4.55', '', '', '1');
INSERT INTO `tb_item` VALUES ('964', '28CBF37B', '货号963', '9.61', '', '', '1');
INSERT INTO `tb_item` VALUES ('965', '4B7576C5', '货号964', '0.99', '', '', '1');
INSERT INTO `tb_item` VALUES ('966', 'B0044B93', '货号965', '5.26', '', '', '1');
INSERT INTO `tb_item` VALUES ('967', '083A3AFA', '货号966', '9.60', '', '', '1');
INSERT INTO `tb_item` VALUES ('968', 'A97332B2', '货号967', '7.51', '', '', '1');
INSERT INTO `tb_item` VALUES ('969', 'D082D281', '货号968', '0.83', '', '', '1');
INSERT INTO `tb_item` VALUES ('970', '118791B0', '货号969', '6.87', '', '', '1');
INSERT INTO `tb_item` VALUES ('971', '64088E72', '货号970', '5.00', '', '', '1');
INSERT INTO `tb_item` VALUES ('972', 'E74C21DB', '货号971', '8.79', '', '', '1');
INSERT INTO `tb_item` VALUES ('973', 'FFA14524', '货号972', '3.48', '', '', '1');
INSERT INTO `tb_item` VALUES ('974', 'BEC3723E', '货号973', '5.56', '', '', '1');
INSERT INTO `tb_item` VALUES ('975', '18115197', '货号974', '9.63', '', '', '1');
INSERT INTO `tb_item` VALUES ('976', '8D4EE436', '货号975', '9.02', '', '', '1');
INSERT INTO `tb_item` VALUES ('977', 'D98D2333', '货号976', '0.51', '', '', '1');
INSERT INTO `tb_item` VALUES ('978', '09735937', '货号977', '6.38', '', '', '1');
INSERT INTO `tb_item` VALUES ('979', 'BF04FC06', '货号978', '4.42', '', '', '1');
INSERT INTO `tb_item` VALUES ('980', 'F5F7E926', '货号979', '7.69', '', '', '1');
INSERT INTO `tb_item` VALUES ('981', 'B036EAF3', '货号980', '1.11', '', '', '1');
INSERT INTO `tb_item` VALUES ('982', 'DD4DCD2F', '货号981', '1.12', '', '', '1');
INSERT INTO `tb_item` VALUES ('983', 'D39550C9', '货号982', '6.58', '', '', '1');
INSERT INTO `tb_item` VALUES ('984', 'A03B641B', '货号983', '5.43', '', '', '1');
INSERT INTO `tb_item` VALUES ('985', 'E3A86488', '货号984', '8.20', '1000*800*600', '20g', '0');
INSERT INTO `tb_item` VALUES ('986', 'A9716A19', '货号985', '1.54', '', '', '1');
INSERT INTO `tb_item` VALUES ('987', 'E4ADB846', '货号986', '8.72', '', '', '1');
INSERT INTO `tb_item` VALUES ('988', '0DC54E8E', '货号987', '8.62', '', '', '1');
INSERT INTO `tb_item` VALUES ('989', '3F8D10D3', '货号988', '3.49', '', '', '1');
INSERT INTO `tb_item` VALUES ('990', 'A39DEDF8', '货号989', '0.13', '', '', '1');
INSERT INTO `tb_item` VALUES ('991', 'A42715C4', '货号990', '6.39', '', '', '1');
INSERT INTO `tb_item` VALUES ('992', '87BA02D5', '货号991', '9.04', '', '', '1');
INSERT INTO `tb_item` VALUES ('993', 'BEE57902', '货号992', '6.95', '', '', '1');
INSERT INTO `tb_item` VALUES ('994', 'C031ACAB', '货号993', '7.11', '', '', '1');
INSERT INTO `tb_item` VALUES ('995', '733AC186', '货号994', '0.52', '', '', '1');
INSERT INTO `tb_item` VALUES ('996', 'B546C2A7', '货号995', '5.79', '', '', '1');
INSERT INTO `tb_item` VALUES ('997', 'EA3F6F67', '货号996', '2.72', '', '', '1');
INSERT INTO `tb_item` VALUES ('998', '205CF757', '货号997', '8.38', '', '', '1');
INSERT INTO `tb_item` VALUES ('999', 'A5B8D505', '货号998', '0.54', '', '', '1');
INSERT INTO `tb_item` VALUES ('1000', '3FA66E32', '货号999', '6.35', '', '', '1');
INSERT INTO `tb_item` VALUES ('1001', '100001', '测试1', '20.80', 'a', '11', '1');
INSERT INTO `tb_item` VALUES ('1002', '100002', '测试2', '3.28', 'b', '12', '1');
INSERT INTO `tb_item` VALUES ('1003', '100003', '测试3', '10.20', 'c', '13', '1');
INSERT INTO `tb_item` VALUES ('1004', '100004', '测试4', '5.67', 'd', '14', '1');
INSERT INTO `tb_item` VALUES ('1005', '100005', '测试5', '20.80', 'e', '15', '1');
INSERT INTO `tb_item` VALUES ('1006', '100006', '测试6', '99.23', 'f', '16', '1');
INSERT INTO `tb_item` VALUES ('1007', '100007', '测试7', '10.22', '', '', '1');
INSERT INTO `tb_item` VALUES ('1008', '100008', '测试8', '50.20', '', '', '1');
INSERT INTO `tb_item` VALUES ('1009', '100009', '测试9', '10.32', '', '', '1');
INSERT INTO `tb_item` VALUES ('1010', '100010', '测试10', '999.99', '', '', '1');
INSERT INTO `tb_item` VALUES ('1014', '100011', '测试11', '20.14', '1000*800*600', '20g', '0');
INSERT INTO `tb_item` VALUES ('1015', '货号2', '货品名2', '2.00', '1000*800*600', '20g', '1');
INSERT INTO `tb_item` VALUES ('1016', '货号3', '货品名3', '3.00', '1000*800*600', '30g', '1');
INSERT INTO `tb_item` VALUES ('1017', '货号1', '货品名1', '1.00', '1000*800*600', '10g', '1');
INSERT INTO `tb_item` VALUES ('1018', '123456', '123456', '12.12', '', '', '1');
INSERT INTO `tb_item` VALUES ('1019', 'P5024', '10010', '0.00', '', '', '1');
INSERT INTO `tb_item` VALUES ('1020', '999998', '快递费', '0.00', '', '', '1');
INSERT INTO `tb_item` VALUES ('1021', '999999', '模具费', '0.00', '', '', '1');
INSERT INTO `tb_item` VALUES ('1022', '货号4', '货品名1', '0.00', '1000*800*600', '10g', '1');
INSERT INTO `tb_item` VALUES ('1023', 'P5025', '12', '12.55', '', '', '1');
INSERT INTO `tb_item` VALUES ('1024', 'P5026', '23', '10.00', '100*80*60', '30g', '1');
INSERT INTO `tb_item` VALUES ('1025', 'P5027', '23', '10.00', '100*80*60', '30g', '1');

-- ----------------------------
-- Table structure for `tb_log`
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `operation` varchar(50) NOT NULL COMMENT '操作',
  `method` varchar(100) DEFAULT NULL COMMENT '执行方法',
  `params` varchar(500) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'ip',
  `create_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_log
-- ----------------------------
INSERT INTO `tb_log` VALUES ('1', 'admin', '新增用户', '/zzz/sys/insertUser', '{\"id\":null,\"username\":\"ls\",\"password\":\"123456\",\"fullname\":\"李四\",\"status\":\"1\",\"roleId\":1,\"roleName\":null};', '0:0:0:0:0:0:0:1', '2019-05-29 00:34:04');
INSERT INTO `tb_log` VALUES ('2', 'admin', '新增用户', '/zzz/sys/insertUser', '{\"id\":null,\"username\":\"zs\",\"password\":\"123456\",\"fullname\":\"张三\",\"status\":\"1\",\"roleId\":1,\"roleName\":null};', '0:0:0:0:0:0:0:1', '2019-05-29 14:51:42');
INSERT INTO `tb_log` VALUES ('3', 'admin', '更新用户', '/zzz/sys/updateUser', '{\"id\":4,\"username\":\"zs\",\"password\":null,\"fullname\":\"张三\",\"status\":\"0\",\"roleId\":1,\"roleName\":null};', '0:0:0:0:0:0:0:1', '2019-05-29 15:57:26');
INSERT INTO `tb_log` VALUES ('4', 'admin', '更新用户', '/zzz/sys/updateUser', '{\"id\":2,\"username\":\"test\",\"password\":null,\"fullname\":\"测试\",\"status\":\"1\",\"roleId\":1,\"roleName\":null};', '0:0:0:0:0:0:0:1', '2019-05-29 15:58:44');
INSERT INTO `tb_log` VALUES ('5', 'admin', '更新用户', '/zzz/sys/updateUser', '{\"id\":4,\"username\":\"zs\",\"password\":null,\"fullname\":\"张三\",\"status\":\"1\",\"roleId\":1,\"roleName\":null};', '0:0:0:0:0:0:0:1', '2019-05-29 15:58:51');
INSERT INTO `tb_log` VALUES ('6', 'admin', '更新用户', '/zzz/sys/updateUser', '{\"id\":4,\"username\":\"zs\",\"password\":null,\"fullname\":\"张三\",\"status\":\"0\",\"roleId\":1,\"roleName\":null};', '0:0:0:0:0:0:0:1', '2019-05-29 20:16:16');
INSERT INTO `tb_log` VALUES ('7', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"123456\",\"itemName\":\"测试1\",\"price\":100,\"itemSpec\":\"1000*800*600\",\"weight\":\"50g\",\"status\":\"1\"};', '127.0.0.1', '2019-05-30 16:25:25');
INSERT INTO `tb_log` VALUES ('8', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":1001,\"itemno\":\"123456\",\"itemName\":\"测试1\",\"price\":100.00,\"itemSpec\":\"1000*800*600\",\"weight\":\"50g\",\"status\":\"0\"};', '127.0.0.1', '2019-05-30 16:36:23');
INSERT INTO `tb_log` VALUES ('9', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":985,\"itemno\":\"E3A86488\",\"itemName\":\"货号984\",\"price\":8.20,\"itemSpec\":\"1000*800*600\",\"weight\":\"20g\",\"status\":\"0\"};', '127.0.0.1', '2019-05-30 16:46:53');
INSERT INTO `tb_log` VALUES ('10', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":1001,\"itemno\":\"123456\",\"itemName\":\"测试1\",\"price\":9999999,\"itemSpec\":\"1000*800*600\",\"weight\":\"50g\",\"status\":\"0\"};', '0:0:0:0:0:0:0:1', '2019-05-30 19:47:51');
INSERT INTO `tb_log` VALUES ('11', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":1001,\"itemno\":\"123456\",\"itemName\":\"测试1\",\"price\":9999999,\"itemSpec\":\"1000*800*600\",\"weight\":\"50g\",\"status\":\"0\"};', '0:0:0:0:0:0:0:1', '2019-05-30 19:49:48');
INSERT INTO `tb_log` VALUES ('12', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":1001,\"itemno\":\"123456\",\"itemName\":\"测试1\",\"price\":100.00,\"itemSpec\":\"1000*800*600\",\"weight\":\"50g\",\"status\":\"0\"};', '0:0:0:0:0:0:0:1', '2019-05-30 19:50:05');
INSERT INTO `tb_log` VALUES ('13', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":1001,\"itemno\":\"123456\",\"itemName\":\"测试1\",\"price\":99999,\"itemSpec\":\"1000*800*600\",\"weight\":\"50g\",\"status\":\"0\"};', '0:0:0:0:0:0:0:1', '2019-05-30 19:53:08');
INSERT INTO `tb_log` VALUES ('14', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":1001,\"itemno\":\"123456\",\"itemName\":\"测试1\",\"price\":99999,\"itemSpec\":\"1000*800*600\",\"weight\":\"50g\",\"status\":\"0\"};', '0:0:0:0:0:0:0:1', '2019-05-30 19:55:12');
INSERT INTO `tb_log` VALUES ('15', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":1001,\"itemno\":\"123456\",\"itemName\":\"测试1\",\"price\":0.02,\"itemSpec\":\"1000*800*600\",\"weight\":\"50g\",\"status\":\"0\"};', '0:0:0:0:0:0:0:1', '2019-05-30 19:58:13');
INSERT INTO `tb_log` VALUES ('16', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":1001,\"itemno\":\"123456\",\"itemName\":\"测试1\",\"price\":0.02,\"itemSpec\":\"1000*800*600\",\"weight\":\"20g\",\"status\":\"0\"};', '0:0:0:0:0:0:0:1', '2019-05-30 21:50:26');
INSERT INTO `tb_log` VALUES ('17', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":1001,\"itemno\":\"123456\",\"itemName\":\"测试1\",\"price\":0.02,\"itemSpec\":\"1000*800*600\",\"weight\":\"30g\",\"status\":\"0\"};', '0:0:0:0:0:0:0:1', '2019-05-30 21:51:31');
INSERT INTO `tb_log` VALUES ('18', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":1001,\"itemno\":\"123456\",\"itemName\":\"测试1\",\"price\":0.02,\"itemSpec\":\"1000*800*600\",\"weight\":\"10g\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 21:53:30');
INSERT INTO `tb_log` VALUES ('19', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":1001,\"itemno\":\"123456\",\"itemName\":\"测试1\",\"price\":0.02,\"itemSpec\":\"1000*800*600\",\"weight\":\"10g\",\"status\":\"0\"};', '0:0:0:0:0:0:0:1', '2019-05-30 21:54:19');
INSERT INTO `tb_log` VALUES ('20', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":1001,\"itemno\":\"123456\",\"itemName\":\"测试1\",\"price\":0.02,\"itemSpec\":\"1000*800*600\",\"weight\":\"10g\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:08:11');
INSERT INTO `tb_log` VALUES ('21', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":1001,\"itemno\":\"123456\",\"itemName\":\"测试1\",\"price\":50.2,\"itemSpec\":\"1000*800*600\",\"weight\":\"10g\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:09:54');
INSERT INTO `tb_log` VALUES ('22', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":1001,\"itemno\":\"123456\",\"itemName\":\"测试1\",\"price\":40.9,\"itemSpec\":\"1000*800*600\",\"weight\":\"10g\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:10:34');
INSERT INTO `tb_log` VALUES ('23', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":1001,\"itemno\":\"123456\",\"itemName\":\"测试1\",\"price\":20.8,\"itemSpec\":\"1000*800*600\",\"weight\":\"10g\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:15:34');
INSERT INTO `tb_log` VALUES ('24', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"123457\",\"itemName\":\"测试2\",\"price\":3.28,\"itemSpec\":\"\",\"weight\":\"40g\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:19:42');
INSERT INTO `tb_log` VALUES ('25', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":1001,\"itemno\":\"123456\",\"itemName\":\"测试1\",\"price\":20.80,\"itemSpec\":\"1000*800*600\",\"weight\":\"20g\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:28:38');
INSERT INTO `tb_log` VALUES ('26', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"123458\",\"itemName\":\"测试3\",\"price\":10.2,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:28:57');
INSERT INTO `tb_log` VALUES ('27', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"123459\",\"itemName\":\"测试4\",\"price\":5.67,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:29:34');
INSERT INTO `tb_log` VALUES ('28', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"123460\",\"itemName\":\"测试5\",\"price\":20.8,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:31:11');
INSERT INTO `tb_log` VALUES ('29', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"123461\",\"itemName\":\"测试6\",\"price\":99.23,\"itemSpec\":\"\",\"weight\":\"20g\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:32:05');
INSERT INTO `tb_log` VALUES ('30', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"123462\",\"itemName\":\"测试7\",\"price\":10.22,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:35:20');
INSERT INTO `tb_log` VALUES ('31', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":21,\"itemno\":\"F73D40A4\",\"itemName\":\"货号20\",\"price\":7.78,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:38:49');
INSERT INTO `tb_log` VALUES ('32', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"123465\",\"itemName\":\"测试5\",\"price\":50.2,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:40:08');
INSERT INTO `tb_log` VALUES ('33', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"123466\",\"itemName\":\"测试5\",\"price\":10.32,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:43:30');
INSERT INTO `tb_log` VALUES ('34', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"102545\",\"itemName\":\"测试7\",\"price\":999.99,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:48:05');
INSERT INTO `tb_log` VALUES ('35', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"100011\",\"itemName\":\"测试11\",\"price\":2.35,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:51:01');
INSERT INTO `tb_log` VALUES ('36', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"100012\",\"itemName\":\"测试12\",\"price\":2.35,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:54:47');
INSERT INTO `tb_log` VALUES ('37', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"100013\",\"itemName\":\"测试13\",\"price\":20.51,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:58:06');
INSERT INTO `tb_log` VALUES ('38', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"100011\",\"itemName\":\"测试11\",\"price\":20.15,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-30 22:59:19');
INSERT INTO `tb_log` VALUES ('39', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":1014,\"itemno\":\"100011\",\"itemName\":\"测试11\",\"price\":20.14,\"itemSpec\":\"1000*800*600\",\"weight\":\"50g\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-31 09:58:26');
INSERT INTO `tb_log` VALUES ('40', 'admin', '更新货号', '/zzz/item/updateItem', '{\"id\":1014,\"itemno\":\"100011\",\"itemName\":\"测试11\",\"price\":20.14,\"itemSpec\":\"1000*800*600\",\"weight\":\"20g\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-05-31 09:59:07');
INSERT INTO `tb_log` VALUES ('41', 'admin', '更新用户', '/zzz/user/updateUser', '{\"id\":4,\"username\":\"zs\",\"password\":null,\"fullname\":\"王五\",\"status\":\"0\",\"roleId\":1,\"roleName\":null};', '0:0:0:0:0:0:0:1', '2019-05-31 15:07:34');
INSERT INTO `tb_log` VALUES ('42', 'admin', '新增角色', '/zzz/role/insertRole', '{\"roleId\":null,\"roleName\":\"测试\",\"roleRemark\":\"测试\"};', '0:0:0:0:0:0:0:1', '2019-05-31 16:03:34');
INSERT INTO `tb_log` VALUES ('43', 'admin', '新增角色', '/zzz/role/insertRole', '{\"roleId\":null,\"roleName\":\"测试2\",\"roleRemark\":\"测试2\"};', '0:0:0:0:0:0:0:1', '2019-05-31 16:04:02');
INSERT INTO `tb_log` VALUES ('44', 'admin', '新增角色', '/zzz/role/insertRole', '{\"roleId\":null,\"roleName\":\"测试3\",\"roleRemark\":\"测试3\"};', '0:0:0:0:0:0:0:1', '2019-05-31 16:04:18');
INSERT INTO `tb_log` VALUES ('45', 'admin', '更新角色', '/zzz/role/updateRole', '{\"roleId\":4,\"roleName\":\"测试1\",\"roleRemark\":\"测试1\"};', '127.0.0.1', '2019-05-31 17:10:14');
INSERT INTO `tb_log` VALUES ('46', 'admin', '新增角色', '/zzz/role/insertRole', '{\"roleId\":null,\"roleName\":\"测试4\",\"roleRemark\":\"测试4\"};', '0:0:0:0:0:0:0:1', '2019-06-03 10:45:09');
INSERT INTO `tb_log` VALUES ('47', 'admin', '批量删除角色', '/zzz/role/deleteRole/4', '\"4\";', '0:0:0:0:0:0:0:1', '2019-06-03 10:49:40');
INSERT INTO `tb_log` VALUES ('48', 'admin', '批量删除角色', '/zzz/role/deleteRole/5,6,7', '\"5,6,7\";', '0:0:0:0:0:0:0:1', '2019-06-03 10:49:54');
INSERT INTO `tb_log` VALUES ('49', 'admin', '更新角色', '/zzz/role/updateRole', '{\"roleId\":1,\"roleName\":\"管理员\",\"roleRemark\":\"管理员\"};', '0:0:0:0:0:0:0:1', '2019-06-03 14:21:26');
INSERT INTO `tb_log` VALUES ('50', 'admin', '更新角色', '/zzz/role/updateRole', '{\"roleId\":2,\"roleName\":\"下单员\",\"roleRemark\":\"下单员\"};\"1,2,3,6,7,8,4,5,23,24,25,26,9,10,11,12,13,14,15,16,17,18,19,20,21,22\";', '0:0:0:0:0:0:0:1', '2019-06-05 09:03:49');
INSERT INTO `tb_log` VALUES ('51', 'admin', '更新角色', '/zzz/role/updateRole', '{\"roleId\":2,\"roleName\":\"下单员\",\"roleRemark\":\"下单员\"};\"1,2,3,6,7,8,4,5,23,24,25,26,9,10,11,12,13,14,15,16,17,18,19,20,21,22\";', '0:0:0:0:0:0:0:1', '2019-06-05 09:07:45');
INSERT INTO `tb_log` VALUES ('52', 'admin', '更新角色', '/zzz/role/updateRole', '{\"roleId\":2,\"roleName\":\"下单员\",\"roleRemark\":\"下单员\"};\"1,2,3,6,7,8,4,5,23,24,25,26,9,10,11,12,13,14,15,16,17,18,19,20,21,22\";', '0:0:0:0:0:0:0:1', '2019-06-05 09:08:07');
INSERT INTO `tb_log` VALUES ('53', 'admin', '更新角色', '/zzz/role/updateRole', '{\"roleId\":2,\"roleName\":\"下单员\",\"roleRemark\":\"下单员\"};\"1,2,3,6,7,8,4,5,23,24,25,26,9,10,11,12,13,14,15,16,17,18,19,20,21,22\";', '0:0:0:0:0:0:0:1', '2019-06-05 09:09:13');
INSERT INTO `tb_log` VALUES ('54', 'admin', '更新角色', '/zzz/role/updateRole', '{\"roleId\":2,\"roleName\":\"下单员\",\"roleRemark\":\"下单员\"};\"1,2,3,6,7,8,4,5,23,24,25,26,9,10,11,12,13,14,15,16,17,18,19,20,21,22\";', '0:0:0:0:0:0:0:1', '2019-06-05 09:09:55');
INSERT INTO `tb_log` VALUES ('55', 'admin', '更新角色', '/zzz/role/updateRole', '{\"roleId\":2,\"roleName\":\"下单员\",\"roleRemark\":\"下单员\"};\"1,2,3,6,7,8,4,5,23,24,25,26,9,10,11,12,13,14,15,16,17,18,19,20,21,22\";', '0:0:0:0:0:0:0:1', '2019-06-05 09:12:05');
INSERT INTO `tb_log` VALUES ('56', 'admin', '更新角色', '/zzz/role/updateRole', '{\"roleId\":2,\"roleName\":\"下单员\",\"roleRemark\":\"下单员\"};\"1,2,3,6,7,8,4,5,23,24,25,26,9,10,11,12,13,14,15,16,17,18,19,20,21,22\";', '0:0:0:0:0:0:0:1', '2019-06-05 09:14:07');
INSERT INTO `tb_log` VALUES ('57', 'admin', '更新用户', '/zzz/user/updateUser', '{\"id\":2,\"username\":\"test\",\"password\":null,\"fullname\":\"测试\",\"status\":\"1\",\"roleId\":2,\"roleName\":null};', '0:0:0:0:0:0:0:1', '2019-06-05 09:14:58');
INSERT INTO `tb_log` VALUES ('58', 'admin', '更新角色', '/zzz/role/updateRole', '{\"roleId\":2,\"roleName\":\"下单员\",\"roleRemark\":\"下单员\"};\"1,2,3,6,7,8,4,5,23,24,25,26,14,15,16,17,18,19,20,21,22\";', '0:0:0:0:0:0:0:1', '2019-06-05 09:15:12');
INSERT INTO `tb_log` VALUES ('59', 'admin', '更新角色', '/zzz/role/updateRole', '{\"roleId\":2,\"roleName\":\"下单员\",\"roleRemark\":\"下单员\"};\"1,2,3,6,7,8,4,5,23,24,25,26,14,15,16,17,18,19,20,21,22\";', '0:0:0:0:0:0:0:1', '2019-06-05 09:48:42');
INSERT INTO `tb_log` VALUES ('60', 'admin', '新增角色', '/zzz/role/insertRole', '{\"roleId\":null,\"roleName\":\"测试\",\"roleRemark\":\"测试\"};\"1,2,3,6,7,8,4,5,23,24,25,26,9,10,11,12,13,14,15,16,17,18,19,20,21,22\";', '0:0:0:0:0:0:0:1', '2019-06-05 10:04:23');
INSERT INTO `tb_log` VALUES ('61', 'admin', '新增角色', '/zzz/role/insertRole', '{\"roleId\":null,\"roleName\":\"测试\",\"roleRemark\":\"测试\"};\"1,2,3,6,7,8,4,5,23,24,25,26,9,10,11,12,13,14,15,16,17,18,19,20,21,22\";', '0:0:0:0:0:0:0:1', '2019-06-05 10:12:52');
INSERT INTO `tb_log` VALUES ('62', 'admin', '新增角色', '/zzz/role/insertRole', '{\"roleId\":null,\"roleName\":\"测试\",\"roleRemark\":\"测试\"};\"1,2,3,6,7,8,4,5,23,24,25,26,9,10,11,12,13,14,15,16,17,18,19,20,21,22\";', '0:0:0:0:0:0:0:1', '2019-06-05 10:14:01');
INSERT INTO `tb_log` VALUES ('63', 'admin', '新增角色', '/zzz/role/insertRole', '{\"roleId\":null,\"roleName\":\"测试\",\"roleRemark\":\"测试\"};\"1,2,3,6,7,8,4,5,23,24,25,26,9,10,11,12,13,14,15,16,17,18,19,20,21,22\";', '0:0:0:0:0:0:0:1', '2019-06-05 10:14:42');
INSERT INTO `tb_log` VALUES ('64', 'admin', '新增角色', '/zzz/role/insertRole', '{\"roleId\":null,\"roleName\":\"测试\",\"roleRemark\":\"测试\"};\"1,2,3,6,7,8,4,5,23,24,25,26,9,10,11,12,13,14,15,16,17,18,19,20,21,22\";', '0:0:0:0:0:0:0:1', '2019-06-05 10:26:59');
INSERT INTO `tb_log` VALUES ('65', 'admin', '删除菜单', '/zzz/menu/deleteMenu/31', '31;', '0:0:0:0:0:0:0:1', '2019-06-05 15:19:45');
INSERT INTO `tb_log` VALUES ('66', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"菜单管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":998,\"checked\":null};\"\";', '0:0:0:0:0:0:0:1', '2019-06-05 21:33:58');
INSERT INTO `tb_log` VALUES ('67', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"菜单管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":124121,\"checked\":null};\"\";', '0:0:0:0:0:0:0:1', '2019-06-05 21:38:27');
INSERT INTO `tb_log` VALUES ('68', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":998,\"checked\":null};\"\";', '0:0:0:0:0:0:0:1', '2019-06-05 21:38:45');
INSERT INTO `tb_log` VALUES ('69', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"菜单管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":998,\"checked\":null};\"\";', '0:0:0:0:0:0:0:1', '2019-06-05 21:38:53');
INSERT INTO `tb_log` VALUES ('70', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":998,\"checked\":null};\"\";', '0:0:0:0:0:0:0:1', '2019-06-05 21:39:03');
INSERT INTO `tb_log` VALUES ('71', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"菜单管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":998,\"checked\":null};\"\";', '0:0:0:0:0:0:0:1', '2019-06-05 21:43:21');
INSERT INTO `tb_log` VALUES ('72', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":1000,\"checked\":null};\"\";', '0:0:0:0:0:0:0:1', '2019-06-05 21:43:32');
INSERT INTO `tb_log` VALUES ('73', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":1000,\"checked\":null};\"\";', '0:0:0:0:0:0:0:1', '2019-06-05 21:46:22');
INSERT INTO `tb_log` VALUES ('74', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":1000,\"checked\":null};\"\";', '0:0:0:0:0:0:0:1', '2019-06-05 21:46:42');
INSERT INTO `tb_log` VALUES ('75', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":1000,\"checked\":null};\"\";', '0:0:0:0:0:0:0:1', '2019-06-05 21:49:08');
INSERT INTO `tb_log` VALUES ('76', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":12222,\"checked\":null};\"\";', '0:0:0:0:0:0:0:1', '2019-06-05 21:49:23');
INSERT INTO `tb_log` VALUES ('77', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":999,\"checked\":null};\"\";', '0:0:0:0:0:0:0:1', '2019-06-05 21:49:33');
INSERT INTO `tb_log` VALUES ('78', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":998,\"checked\":null};\"\";', '0:0:0:0:0:0:0:1', '2019-06-05 21:49:52');
INSERT INTO `tb_log` VALUES ('79', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"菜单管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":998,\"checked\":null};\"\";', '0:0:0:0:0:0:0:1', '2019-06-06 09:47:41');
INSERT INTO `tb_log` VALUES ('80', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":998,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 10:55:54');
INSERT INTO `tb_log` VALUES ('81', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":998,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 10:56:19');
INSERT INTO `tb_log` VALUES ('82', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":1000,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 11:02:54');
INSERT INTO `tb_log` VALUES ('83', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":998,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 11:03:11');
INSERT INTO `tb_log` VALUES ('84', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":998,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 11:09:06');
INSERT INTO `tb_log` VALUES ('85', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":4,\"title\":\"菜单管理\",\"icon\":\"\",\"href\":\"sys/menuList\",\"perms\":\"\",\"parentId\":2,\"sorting\":997,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 11:09:42');
INSERT INTO `tb_log` VALUES ('86', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":998,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 11:11:59');
INSERT INTO `tb_log` VALUES ('87', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":998,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 11:16:37');
INSERT INTO `tb_log` VALUES ('88', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":3,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"sys/userList\",\"perms\":\"\",\"parentId\":2,\"sorting\":998,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 11:16:58');
INSERT INTO `tb_log` VALUES ('89', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":4,\"title\":\"菜单管理\",\"icon\":\"\",\"href\":\"sys/menuList\",\"perms\":\"\",\"parentId\":2,\"sorting\":997,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 11:17:14');
INSERT INTO `tb_log` VALUES ('90', 'admin', '更新菜单', '/zzz/menu/updateMenu', '{\"menuId\":5,\"title\":\"角色管理\",\"icon\":\"\",\"href\":\"sys/roleList\",\"perms\":\"\",\"parentId\":2,\"sorting\":996,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 11:17:50');
INSERT INTO `tb_log` VALUES ('91', 'admin', '新增菜单', '/zzz/menu/insertMenu', '{\"menuId\":null,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"sada\",\"perms\":\"fsg\",\"parentId\":2,\"sorting\":1000,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 13:10:28');
INSERT INTO `tb_log` VALUES ('92', 'admin', '新增菜单', '/zzz/menu/insertMenu', '{\"menuId\":null,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"asdfaf\",\"perms\":\"\",\"parentId\":2,\"sorting\":null,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 13:10:58');
INSERT INTO `tb_log` VALUES ('93', 'admin', '新增菜单', '/zzz/menu/insertMenu', '{\"menuId\":null,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"a\",\"perms\":\"20\",\"parentId\":0,\"sorting\":1000,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 13:13:44');
INSERT INTO `tb_log` VALUES ('94', 'admin', '新增菜单', '/zzz/menu/insertMenu', '{\"menuId\":null,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"adfa\",\"perms\":\"20\",\"parentId\":0,\"sorting\":1000,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 13:15:23');
INSERT INTO `tb_log` VALUES ('95', 'admin', '新增菜单', '/zzz/menu/insertMenu', '{\"menuId\":null,\"title\":\"用户管理\",\"icon\":\"\",\"href\":\"adfaa\",\"perms\":\"\",\"parentId\":2,\"sorting\":null,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 13:16:44');
INSERT INTO `tb_log` VALUES ('96', 'admin', '新增菜单', '/zzz/menu/insertMenu', '{\"menuId\":null,\"title\":\"asdf\",\"icon\":\"\",\"href\":\"adf\",\"perms\":\"\",\"parentId\":6,\"sorting\":null,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 13:17:10');
INSERT INTO `tb_log` VALUES ('97', 'admin', '新增菜单', '/zzz/menu/insertMenu', '{\"menuId\":null,\"title\":\"测试\",\"icon\":\"\",\"href\":\"12345\",\"perms\":\"sys:test:list\",\"parentId\":0,\"sorting\":10,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 13:24:16');
INSERT INTO `tb_log` VALUES ('98', 'admin', '删除菜单', '/zzz/menu/deleteMenu/31', '31;', '0:0:0:0:0:0:0:1', '2019-06-06 13:24:31');
INSERT INTO `tb_log` VALUES ('99', 'admin', '新增菜单', '/zzz/menu/insertMenu', '{\"menuId\":null,\"title\":\"测试用户\",\"icon\":\"\",\"href\":\"\",\"perms\":\"\",\"parentId\":3,\"sorting\":null,\"checked\":null};', '0:0:0:0:0:0:0:1', '2019-06-06 13:24:53');
INSERT INTO `tb_log` VALUES ('100', 'admin', '删除菜单', '/zzz/menu/deleteMenu/32', '32;', '0:0:0:0:0:0:0:1', '2019-06-06 13:24:58');
INSERT INTO `tb_log` VALUES ('101', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"123456\",\"itemName\":\"123456\",\"price\":12.123,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-07-29 17:10:13');
INSERT INTO `tb_log` VALUES ('102', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"111111111111111111111111111111111111111111111111111111111111111111111111111111111111\",\"itemName\":\"111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111\",\"price\":10,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-07-29 17:12:02');
INSERT INTO `tb_log` VALUES ('103', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"111111111111111111111111111111111111111111111111111111111111111111111111111111111111\",\"itemName\":\"111111111111111111111111111111111111111111111111111111111111111111111111111111111111\",\"price\":10,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-07-29 17:17:56');
INSERT INTO `tb_log` VALUES ('104', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"111111111111111111111111111111111111111111111111111111111111111111111111111111111111\",\"itemName\":\"111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111\",\"price\":10,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-07-29 17:20:46');
INSERT INTO `tb_log` VALUES ('105', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"41216\",\"itemName\":\"123456\",\"price\":null,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-07-29 17:25:40');
INSERT INTO `tb_log` VALUES ('106', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"41216\",\"itemName\":\"123456\",\"price\":null,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-07-29 17:26:44');
INSERT INTO `tb_log` VALUES ('107', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"P5024\",\"itemName\":\"1111\",\"price\":null,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '127.0.0.1', '2019-07-30 10:36:33');
INSERT INTO `tb_log` VALUES ('108', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"P5024\",\"itemName\":\"1111\",\"price\":null,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '127.0.0.1', '2019-07-30 10:36:54');
INSERT INTO `tb_log` VALUES ('109', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"P5024\",\"itemName\":\"10010\",\"price\":null,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '127.0.0.1', '2019-07-30 10:40:26');
INSERT INTO `tb_log` VALUES ('110', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"999998\",\"itemName\":\"快递费\",\"price\":null,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '127.0.0.1', '2019-07-30 10:47:03');
INSERT INTO `tb_log` VALUES ('111', 'admin', '新增货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"999999\",\"itemName\":\"模具费\",\"price\":null,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '127.0.0.1', '2019-07-30 10:47:21');
INSERT INTO `tb_log` VALUES ('112', 'admin', '添加货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"p5025\",\"itemName\":\"12\",\"price\":null,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-07-30 11:33:19');
INSERT INTO `tb_log` VALUES ('113', 'admin', '修改货号', '/zzz/item/updateItem', '{\"id\":1023,\"itemno\":\"P5025\",\"itemName\":\"12\",\"price\":12.55,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-07-30 11:33:31');
INSERT INTO `tb_log` VALUES ('114', 'admin', '添加货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"1111111111111111111111111111111111111111111111111111111111111\",\"itemName\":\"1111111\",\"price\":null,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-07-31 09:19:55');
INSERT INTO `tb_log` VALUES ('115', 'admin', '添加货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"111111111111111111111111111111111111111111111111111111111111111111111111111111\",\"itemName\":\"1111111\",\"price\":null,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-07-31 09:20:01');
INSERT INTO `tb_log` VALUES ('116', 'admin', '添加货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"111111111111111111111111111111111111111111111111111111111111111111111111111111\",\"itemName\":\"11111111111111111111111111111111111111111111111\",\"price\":null,\"itemSpec\":\"\",\"weight\":\"\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-07-31 09:20:07');
INSERT INTO `tb_log` VALUES ('117', 'admin', '批量删除角色', '/zzz/role/deleteRole/8', '\"8\";', '0:0:0:0:0:0:0:1', '2019-08-06 10:00:20');
INSERT INTO `tb_log` VALUES ('118', 'admin', '更新用户', '/zzz/user/updateUser', '{\"id\":4,\"username\":\"zs\",\"password\":null,\"fullname\":\"张三\",\"status\":\"1\",\"roleId\":2,\"roleName\":null};', '0:0:0:0:0:0:0:1', '2019-08-06 10:00:56');
INSERT INTO `tb_log` VALUES ('119', 'admin', '添加货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"p5026\",\"itemName\":\"23\",\"price\":10,\"itemSpec\":\"100*80*60\",\"weight\":\"30g\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-08-06 13:46:23');
INSERT INTO `tb_log` VALUES ('120', 'admin', '添加货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"p5026\",\"itemName\":\"23\",\"price\":10,\"itemSpec\":\"100*80*60\",\"weight\":\"30g\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-08-06 13:46:30');
INSERT INTO `tb_log` VALUES ('121', 'admin', '添加货号', '/zzz/item/insertItem', '{\"id\":null,\"itemno\":\"p5027\",\"itemName\":\"23\",\"price\":10,\"itemSpec\":\"100*80*60\",\"weight\":\"30g\",\"status\":\"1\"};', '0:0:0:0:0:0:0:1', '2019-08-06 13:46:44');
INSERT INTO `tb_log` VALUES ('122', 'admin', '添加/修改销售订单', '/zzz/sell/saveSell', '{\"oid\":null,\"custName\":\"12\",\"orderDate\":\"2019-08-06 00:00:00\",\"deliDate\":\"2019-08-07 00:00:00\",\"orderStatus\":\"订单输入\",\"note\":\"11\",\"status\":\"1\",\"tamt\":null,\"atamt\":null};', '0:0:0:0:0:0:0:1', '2019-08-06 14:30:08');
INSERT INTO `tb_log` VALUES ('123', 'admin', '添加/修改销售订单', '/zzz/sell/saveSell', '{\"oid\":null,\"custName\":\"12\",\"orderDate\":\"2019-08-06 00:00:00\",\"deliDate\":\"2019-08-07 00:00:00\",\"orderStatus\":\"订单输入\",\"note\":\"11\",\"status\":\"1\",\"tamt\":null,\"atamt\":null};', '0:0:0:0:0:0:0:1', '2019-08-06 14:36:16');
INSERT INTO `tb_log` VALUES ('124', 'admin', '添加出货明细', '/zzz/sell/insertShip/10113', '[{\"id\":null,\"sid\":null,\"itemno\":\"F99864A6\",\"num\":1},{\"id\":null,\"sid\":null,\"itemno\":\"A7C2314F\",\"num\":1},{\"id\":null,\"sid\":null,\"itemno\":\"E05966EC\",\"num\":1}];10113;', '127.0.0.1', '2019-08-06 17:30:10');
INSERT INTO `tb_log` VALUES ('125', 'admin', '添加出货明细', '/zzz/sell/insertShip/10113', '[{\"id\":null,\"sid\":null,\"itemno\":\"F99864A6\",\"num\":2},{\"id\":null,\"sid\":null,\"itemno\":\"A7C2314F\",\"num\":2},{\"id\":null,\"sid\":null,\"itemno\":\"E05966EC\",\"num\":2}];10113;', '127.0.0.1', '2019-08-06 17:30:16');
INSERT INTO `tb_log` VALUES ('126', 'admin', '新增结算订单', '/zzz/sell/mergeShipInfo', '[{\"oid\":10113,\"sid\":\"10013\",\"data\":[{\"id\":null,\"aid\":null,\"itemno\":\"F99864A6\",\"num\":1,\"aprice\":1,\"amt\":1},{\"id\":null,\"aid\":null,\"itemno\":\"A7C2314F\",\"num\":1,\"aprice\":1,\"amt\":1},{\"id\":null,\"aid\":null,\"itemno\":\"E05966EC\",\"num\":1,\"aprice\":1,\"amt\":1},{\"id\":null,\"aid\":null,\"itemno\":\"999998\",\"num\":1,\"aprice\":1,\"amt\":1},{\"id\":null,\"aid\":null,\"itemno\":\"999999\",\"num\":1,\"aprice\":1,\"amt\":1}]}];', '127.0.0.1', '2019-08-06 17:30:43');
INSERT INTO `tb_log` VALUES ('127', 'admin', '新增结算订单', '/zzz/sell/mergeShipInfo', '[{\"oid\":10113,\"sid\":\"10014\",\"data\":[{\"id\":null,\"aid\":null,\"itemno\":\"F99864A6\",\"num\":2,\"aprice\":2,\"amt\":4},{\"id\":null,\"aid\":null,\"itemno\":\"A7C2314F\",\"num\":2,\"aprice\":2,\"amt\":4},{\"id\":null,\"aid\":null,\"itemno\":\"E05966EC\",\"num\":2,\"aprice\":2,\"amt\":4},{\"id\":null,\"aid\":null,\"itemno\":\"999998\",\"num\":1,\"aprice\":2,\"amt\":2},{\"id\":null,\"aid\":null,\"itemno\":\"999999\",\"num\":1,\"aprice\":2,\"amt\":2}]}];', '0:0:0:0:0:0:0:1', '2019-08-06 17:32:09');
INSERT INTO `tb_log` VALUES ('128', 'admin', '添加/修改销售订单', '/zzz/sell/saveSell', '{\"oid\":10099,\"custName\":\"客户100\",\"orderDate\":\"2019-08-07 09:18:40\",\"deliDate\":\"2019-08-31 08:00:00\",\"orderStatus\":\"订单输入\",\"note\":\"\",\"status\":\"1\",\"tamt\":0.00,\"atamt\":0.00};', '0:0:0:0:0:0:0:1', '2019-08-07 09:18:53');
INSERT INTO `tb_log` VALUES ('129', 'admin', '添加销售明细', '/zzz/sell/insertSellInfo', '{\"id\":null,\"oid\":10099,\"itemno\":\"F99864A6\",\"itemName\":null,\"itemSpec\":null,\"weight\":null,\"num\":20};', '0:0:0:0:0:0:0:1', '2019-08-07 09:19:05');
INSERT INTO `tb_log` VALUES ('130', 'admin', '添加销售明细', '/zzz/sell/insertSellInfo', '{\"id\":null,\"oid\":10099,\"itemno\":\"A7C2314F\",\"itemName\":null,\"itemSpec\":null,\"weight\":null,\"num\":20};', '0:0:0:0:0:0:0:1', '2019-08-07 09:19:14');
INSERT INTO `tb_log` VALUES ('131', 'admin', '添加销售明细', '/zzz/sell/insertSellInfo', '{\"id\":null,\"oid\":10099,\"itemno\":\"E05966EC\",\"itemName\":null,\"itemSpec\":null,\"weight\":null,\"num\":20};', '0:0:0:0:0:0:0:1', '2019-08-07 09:19:21');
INSERT INTO `tb_log` VALUES ('132', 'admin', '添加销售明细', '/zzz/sell/insertSellInfo', '{\"id\":null,\"oid\":10099,\"itemno\":\"7A7661A5\",\"itemName\":null,\"itemSpec\":null,\"weight\":null,\"num\":20};', '0:0:0:0:0:0:0:1', '2019-08-07 09:19:33');
INSERT INTO `tb_log` VALUES ('133', 'admin', '添加销售明细', '/zzz/sell/insertSellInfo', '{\"id\":null,\"oid\":10099,\"itemno\":\"03704928\",\"itemName\":null,\"itemSpec\":null,\"weight\":null,\"num\":20};', '0:0:0:0:0:0:0:1', '2019-08-07 09:19:42');
INSERT INTO `tb_log` VALUES ('134', 'admin', '添加出货明细', '/zzz/sell/insertShip/10099', '[{\"id\":null,\"sid\":null,\"itemno\":\"A7C2314F\",\"num\":10},{\"id\":null,\"sid\":null,\"itemno\":\"7A7661A5\",\"num\":10}];10099;', '0:0:0:0:0:0:0:1', '2019-08-07 09:20:51');
INSERT INTO `tb_log` VALUES ('135', 'admin', '添加/修改销售订单', '/zzz/sell/saveSell', '{\"oid\":10099,\"custName\":\"客户100\",\"orderDate\":\"2019-08-07 09:22:27\",\"deliDate\":\"2019-08-31 08:00:00\",\"orderStatus\":\"发货中\",\"note\":\"\",\"status\":\"1\",\"tamt\":0.00,\"atamt\":0.00};', '0:0:0:0:0:0:0:1', '2019-08-07 09:22:37');
INSERT INTO `tb_log` VALUES ('136', 'admin', '添加/修改销售订单', '/zzz/sell/saveSell', '{\"oid\":10099,\"custName\":\"客户100\",\"orderDate\":\"2019-08-07 00:00:00\",\"deliDate\":\"2019-08-07 00:00:00\",\"orderStatus\":\"发货中\",\"note\":\"11\",\"status\":\"1\",\"tamt\":0.00,\"atamt\":0.00};', '0:0:0:0:0:0:0:1', '2019-08-07 09:22:51');
INSERT INTO `tb_log` VALUES ('137', 'admin', '添加出货明细', '/zzz/sell/insertShip/10099', '[{\"id\":null,\"sid\":null,\"itemno\":\"F99864A6\",\"num\":10},{\"id\":null,\"sid\":null,\"itemno\":\"7A7661A5\",\"num\":10}];10099;', '0:0:0:0:0:0:0:1', '2019-08-07 09:23:05');
INSERT INTO `tb_log` VALUES ('138', 'admin', '添加出货明细', '/zzz/sell/insertShip/10099', '[{\"id\":null,\"sid\":null,\"itemno\":\"F99864A6\",\"num\":10},{\"id\":null,\"sid\":null,\"itemno\":\"7A7661A5\",\"num\":10}];10099;', '0:0:0:0:0:0:0:1', '2019-08-07 09:23:15');
INSERT INTO `tb_log` VALUES ('139', 'admin', '添加出货明细', '/zzz/sell/insertShip/10099', '[{\"id\":null,\"sid\":null,\"itemno\":\"F99864A6\",\"num\":20},{\"id\":null,\"sid\":null,\"itemno\":\"7A7661A5\",\"num\":20}];10099;', '0:0:0:0:0:0:0:1', '2019-08-07 09:23:38');
INSERT INTO `tb_log` VALUES ('140', 'admin', '添加出货明细', '/zzz/sell/insertShip/10099', '[{\"id\":null,\"sid\":null,\"itemno\":\"F99864A6\",\"num\":20}];10099;', '0:0:0:0:0:0:0:1', '2019-08-07 09:24:03');
INSERT INTO `tb_log` VALUES ('141', 'admin', '删除出货明细', '/zzz/sell/deleteShip/10015', '10015;', '0:0:0:0:0:0:0:1', '2019-08-07 09:25:00');
INSERT INTO `tb_log` VALUES ('142', 'admin', '删除出货明细', '/zzz/sell/deleteShip/10016', '10016;', '0:0:0:0:0:0:0:1', '2019-08-07 09:25:02');
INSERT INTO `tb_log` VALUES ('143', 'admin', '删除出货明细', '/zzz/sell/deleteShip/10017', '10017;', '0:0:0:0:0:0:0:1', '2019-08-07 09:25:05');
INSERT INTO `tb_log` VALUES ('144', 'admin', '删除出货明细', '/zzz/sell/deleteShip/10018', '10018;', '0:0:0:0:0:0:0:1', '2019-08-07 09:25:07');
INSERT INTO `tb_log` VALUES ('145', 'admin', '删除出货明细', '/zzz/sell/deleteShip/10019', '10019;', '0:0:0:0:0:0:0:1', '2019-08-07 09:25:10');
INSERT INTO `tb_log` VALUES ('146', 'admin', '添加出货明细', '/zzz/sell/insertShip/10099', '[{\"id\":null,\"sid\":null,\"itemno\":\"F99864A6\",\"num\":10},{\"id\":null,\"sid\":null,\"itemno\":\"A7C2314F\",\"num\":20},{\"id\":null,\"sid\":null,\"itemno\":\"E05966EC\",\"num\":30},{\"id\":null,\"sid\":null,\"itemno\":\"7A7661A5\",\"num\":40},{\"id\":null,\"sid\":null,\"itemno\":\"03704928\",\"num\":50}];10099;', '0:0:0:0:0:0:0:1', '2019-08-07 09:25:18');
INSERT INTO `tb_log` VALUES ('147', 'admin', '添加出货明细', '/zzz/sell/insertShip/10099', '[{\"id\":null,\"sid\":null,\"itemno\":\"F99864A6\",\"num\":50},{\"id\":null,\"sid\":null,\"itemno\":\"A7C2314F\",\"num\":40},{\"id\":null,\"sid\":null,\"itemno\":\"E05966EC\",\"num\":30},{\"id\":null,\"sid\":null,\"itemno\":\"7A7661A5\",\"num\":20},{\"id\":null,\"sid\":null,\"itemno\":\"03704928\",\"num\":10}];10099;', '0:0:0:0:0:0:0:1', '2019-08-07 10:42:25');
INSERT INTO `tb_log` VALUES ('148', 'admin', '添加出货明细', '/zzz/sell/insertShip/10099', '[{\"id\":null,\"sid\":null,\"itemno\":\"F99864A6\",\"num\":10},{\"id\":null,\"sid\":null,\"itemno\":\"A7C2314F\",\"num\":10},{\"id\":null,\"sid\":null,\"itemno\":\"E05966EC\",\"num\":10},{\"id\":null,\"sid\":null,\"itemno\":\"7A7661A5\",\"num\":10},{\"id\":null,\"sid\":null,\"itemno\":\"03704928\",\"num\":10}];10099;', '0:0:0:0:0:0:0:1', '2019-08-07 10:42:49');
INSERT INTO `tb_log` VALUES ('149', 'admin', '添加销售明细', '/zzz/sell/insertSellInfo', '{\"id\":null,\"oid\":10113,\"itemno\":\"7A7661A5\",\"itemName\":null,\"itemSpec\":null,\"weight\":null,\"num\":10};', '0:0:0:0:0:0:0:1', '2019-08-07 11:17:44');
INSERT INTO `tb_log` VALUES ('150', 'admin', '添加销售明细', '/zzz/sell/insertSellInfo', '{\"id\":null,\"oid\":10113,\"itemno\":\"03704928\",\"itemName\":null,\"itemSpec\":null,\"weight\":null,\"num\":10};', '0:0:0:0:0:0:0:1', '2019-08-07 11:17:51');
INSERT INTO `tb_log` VALUES ('151', 'admin', '添加销售明细', '/zzz/sell/insertSellInfo', '{\"id\":null,\"oid\":10113,\"itemno\":\"857FE0BE\",\"itemName\":null,\"itemSpec\":null,\"weight\":null,\"num\":10};', '0:0:0:0:0:0:0:1', '2019-08-07 11:17:59');
INSERT INTO `tb_log` VALUES ('152', 'admin', '添加销售明细', '/zzz/sell/insertSellInfo', '{\"id\":null,\"oid\":10113,\"itemno\":\"6B2BAAE9\",\"itemName\":null,\"itemSpec\":null,\"weight\":null,\"num\":10};', '0:0:0:0:0:0:0:1', '2019-08-07 11:18:08');
INSERT INTO `tb_log` VALUES ('153', 'admin', '添加销售明细', '/zzz/sell/insertSellInfo', '{\"id\":null,\"oid\":10113,\"itemno\":\"2EDF21FE\",\"itemName\":null,\"itemSpec\":null,\"weight\":null,\"num\":10};', '0:0:0:0:0:0:0:1', '2019-08-07 11:18:20');
INSERT INTO `tb_log` VALUES ('154', 'admin', '添加销售明细', '/zzz/sell/insertSellInfo', '{\"id\":null,\"oid\":10113,\"itemno\":\"486616FA\",\"itemName\":null,\"itemSpec\":null,\"weight\":null,\"num\":10};', '0:0:0:0:0:0:0:1', '2019-08-07 11:18:49');
INSERT INTO `tb_log` VALUES ('155', 'admin', '添加销售明细', '/zzz/sell/insertSellInfo', '{\"id\":null,\"oid\":10113,\"itemno\":\"F580EB8D\",\"itemName\":null,\"itemSpec\":null,\"weight\":null,\"num\":10};', '0:0:0:0:0:0:0:1', '2019-08-07 11:18:58');
INSERT INTO `tb_log` VALUES ('156', 'admin', '添加销售明细', '/zzz/sell/insertSellInfo', '{\"id\":null,\"oid\":10113,\"itemno\":\"F4471F7E\",\"itemName\":null,\"itemSpec\":null,\"weight\":null,\"num\":10};', '0:0:0:0:0:0:0:1', '2019-08-07 11:19:12');
INSERT INTO `tb_log` VALUES ('157', 'admin', '添加销售明细', '/zzz/sell/insertSellInfo', '{\"id\":null,\"oid\":10113,\"itemno\":\"E60F8680\",\"itemName\":null,\"itemSpec\":null,\"weight\":null,\"num\":10};', '0:0:0:0:0:0:0:1', '2019-08-07 11:27:00');
INSERT INTO `tb_log` VALUES ('158', 'admin', '添加销售明细', '/zzz/sell/insertSellInfo', '{\"id\":null,\"oid\":10113,\"itemno\":\"E60F8680\",\"itemName\":null,\"itemSpec\":null,\"weight\":null,\"num\":10};', '0:0:0:0:0:0:0:1', '2019-08-07 11:27:10');
INSERT INTO `tb_log` VALUES ('159', 'admin', '添加销售明细', '/zzz/sell/insertSellInfo', '{\"id\":null,\"oid\":10113,\"itemno\":\"ABC268DC\",\"itemName\":null,\"itemSpec\":null,\"weight\":null,\"num\":10};', '0:0:0:0:0:0:0:1', '2019-08-07 11:27:21');
INSERT INTO `tb_log` VALUES ('160', 'admin', '添加出货明细', '/zzz/sell/insertShip/10113', '[{\"id\":null,\"sid\":null,\"itemno\":\"A7C2314F\",\"num\":10},{\"id\":null,\"sid\":null,\"itemno\":\"2EDF21FE\",\"num\":10},{\"id\":null,\"sid\":null,\"itemno\":\"F4471F7E\",\"num\":10}];10113;', '0:0:0:0:0:0:0:1', '2019-08-07 11:30:16');

-- ----------------------------
-- Table structure for `tb_menu`
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '菜单名',
  `icon` varchar(20) DEFAULT NULL COMMENT '图标',
  `href` varchar(100) DEFAULT NULL COMMENT '资源地址',
  `perms` varchar(500) DEFAULT NULL COMMENT '权限',
  `parent_id` bigint(20) NOT NULL COMMENT '父节点',
  `sorting` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', '首页', null, 'page/main', null, '0', '1000');
INSERT INTO `tb_menu` VALUES ('2', '管理员功能', null, null, null, '0', '999');
INSERT INTO `tb_menu` VALUES ('3', '用户管理', '', 'sys/userList', '', '2', '998');
INSERT INTO `tb_menu` VALUES ('4', '菜单管理', '', 'sys/menuList', '', '2', '997');
INSERT INTO `tb_menu` VALUES ('5', '角色管理', '', 'sys/roleList', '', '2', '996');
INSERT INTO `tb_menu` VALUES ('6', '查询用户', null, null, 'sys:user:list', '3', null);
INSERT INTO `tb_menu` VALUES ('7', '新增用户', null, null, 'sys:user:insert', '3', null);
INSERT INTO `tb_menu` VALUES ('8', '编辑用户', null, null, 'sys:user:update', '3', null);
INSERT INTO `tb_menu` VALUES ('9', '系统日志', '', null, null, '0', '500');
INSERT INTO `tb_menu` VALUES ('10', '日志管理', '&#xe642;', 'log/logList', null, '9', null);
INSERT INTO `tb_menu` VALUES ('11', 'SQL监控', '', null, null, '0', '600');
INSERT INTO `tb_menu` VALUES ('12', 'SQL监控', '&#xe672;', 'sys/druid', null, '11', null);
INSERT INTO `tb_menu` VALUES ('13', '查询日志', null, null, 'sys:druid:list', '12', null);
INSERT INTO `tb_menu` VALUES ('14', '货号管理', null, null, null, '0', '800');
INSERT INTO `tb_menu` VALUES ('15', '货号维护', '&#xe631;', 'sys/itemList', null, '14', null);
INSERT INTO `tb_menu` VALUES ('16', '查询货号', null, null, 'sys:item:list', '15', null);
INSERT INTO `tb_menu` VALUES ('17', '新增货号', null, null, 'sys:item:insert', '15', null);
INSERT INTO `tb_menu` VALUES ('18', '编辑货号', null, null, 'sys:item:update', '15', null);
INSERT INTO `tb_menu` VALUES ('19', '导出货号', null, null, 'sys:item:export', '15', null);
INSERT INTO `tb_menu` VALUES ('20', '订单管理', '', '', null, '0', '700');
INSERT INTO `tb_menu` VALUES ('21', '销售订单', '&#xe63c;', 'sys/sellOrdList', null, '20', '699');
INSERT INTO `tb_menu` VALUES ('22', '结算订单', '&#xe63c;', 'sys/actualOrdList', '', '20', '698');
INSERT INTO `tb_menu` VALUES ('23', '查询角色', null, null, 'sys:role:list', '5', null);
INSERT INTO `tb_menu` VALUES ('24', '新增角色', null, null, 'sys:role:insert', '5', null);
INSERT INTO `tb_menu` VALUES ('25', '编辑角色', null, null, 'sys:role:update', '5', null);
INSERT INTO `tb_menu` VALUES ('26', '删除角色', null, null, 'sys:role:delete', '5', null);
INSERT INTO `tb_menu` VALUES ('27', '查询菜单', null, null, 'sys:menu:list', '4', null);
INSERT INTO `tb_menu` VALUES ('28', '新增菜单', null, null, 'sys:menu:insert', '4', null);
INSERT INTO `tb_menu` VALUES ('29', '编辑菜单', null, null, 'sys:menu:update', '4', null);
INSERT INTO `tb_menu` VALUES ('30', '删除菜单', null, null, 'sys:menu:delete', '4', null);
INSERT INTO `tb_menu` VALUES ('31', '查询订单', null, null, 'sys:sell:list', '21', null);
INSERT INTO `tb_menu` VALUES ('32', '新增订单', null, null, 'sys:sell:insert', '21', null);
INSERT INTO `tb_menu` VALUES ('33', '编辑订单', null, null, 'sys:sell:update', '21', null);
INSERT INTO `tb_menu` VALUES ('34', '删除订单', null, null, 'sys:sell:delete', '21', null);

-- ----------------------------
-- Table structure for `tb_role`
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名',
  `role_remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '管理员', '管理员');
INSERT INTO `tb_role` VALUES ('2', '下单员', '下单员');
INSERT INTO `tb_role` VALUES ('3', '财务', '财务');

-- ----------------------------
-- Table structure for `tb_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_menu`;
CREATE TABLE `tb_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `menu_id` (`menu_id`),
  KEY `role_id` (`role_id`) USING BTREE,
  CONSTRAINT `tb_role_menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_role_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `tb_menu` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_role_menu
-- ----------------------------
INSERT INTO `tb_role_menu` VALUES ('1', '1');
INSERT INTO `tb_role_menu` VALUES ('2', '1');
INSERT INTO `tb_role_menu` VALUES ('3', '1');
INSERT INTO `tb_role_menu` VALUES ('1', '2');
INSERT INTO `tb_role_menu` VALUES ('1', '3');
INSERT INTO `tb_role_menu` VALUES ('1', '4');
INSERT INTO `tb_role_menu` VALUES ('1', '5');
INSERT INTO `tb_role_menu` VALUES ('1', '6');
INSERT INTO `tb_role_menu` VALUES ('1', '7');
INSERT INTO `tb_role_menu` VALUES ('1', '8');
INSERT INTO `tb_role_menu` VALUES ('1', '9');
INSERT INTO `tb_role_menu` VALUES ('1', '10');
INSERT INTO `tb_role_menu` VALUES ('1', '11');
INSERT INTO `tb_role_menu` VALUES ('1', '12');
INSERT INTO `tb_role_menu` VALUES ('1', '13');
INSERT INTO `tb_role_menu` VALUES ('1', '14');
INSERT INTO `tb_role_menu` VALUES ('2', '14');
INSERT INTO `tb_role_menu` VALUES ('3', '14');
INSERT INTO `tb_role_menu` VALUES ('1', '15');
INSERT INTO `tb_role_menu` VALUES ('2', '15');
INSERT INTO `tb_role_menu` VALUES ('3', '15');
INSERT INTO `tb_role_menu` VALUES ('1', '16');
INSERT INTO `tb_role_menu` VALUES ('2', '16');
INSERT INTO `tb_role_menu` VALUES ('3', '16');
INSERT INTO `tb_role_menu` VALUES ('1', '17');
INSERT INTO `tb_role_menu` VALUES ('2', '17');
INSERT INTO `tb_role_menu` VALUES ('3', '17');
INSERT INTO `tb_role_menu` VALUES ('1', '18');
INSERT INTO `tb_role_menu` VALUES ('2', '18');
INSERT INTO `tb_role_menu` VALUES ('3', '18');
INSERT INTO `tb_role_menu` VALUES ('1', '19');
INSERT INTO `tb_role_menu` VALUES ('2', '19');
INSERT INTO `tb_role_menu` VALUES ('3', '19');
INSERT INTO `tb_role_menu` VALUES ('1', '20');
INSERT INTO `tb_role_menu` VALUES ('2', '20');
INSERT INTO `tb_role_menu` VALUES ('3', '20');
INSERT INTO `tb_role_menu` VALUES ('1', '21');
INSERT INTO `tb_role_menu` VALUES ('2', '21');
INSERT INTO `tb_role_menu` VALUES ('3', '21');
INSERT INTO `tb_role_menu` VALUES ('1', '22');
INSERT INTO `tb_role_menu` VALUES ('2', '22');
INSERT INTO `tb_role_menu` VALUES ('3', '22');
INSERT INTO `tb_role_menu` VALUES ('1', '23');
INSERT INTO `tb_role_menu` VALUES ('1', '24');
INSERT INTO `tb_role_menu` VALUES ('1', '25');
INSERT INTO `tb_role_menu` VALUES ('1', '26');
INSERT INTO `tb_role_menu` VALUES ('1', '27');
INSERT INTO `tb_role_menu` VALUES ('1', '28');
INSERT INTO `tb_role_menu` VALUES ('1', '29');
INSERT INTO `tb_role_menu` VALUES ('1', '30');
INSERT INTO `tb_role_menu` VALUES ('1', '31');
INSERT INTO `tb_role_menu` VALUES ('3', '31');
INSERT INTO `tb_role_menu` VALUES ('1', '32');
INSERT INTO `tb_role_menu` VALUES ('3', '32');
INSERT INTO `tb_role_menu` VALUES ('1', '33');
INSERT INTO `tb_role_menu` VALUES ('3', '33');
INSERT INTO `tb_role_menu` VALUES ('1', '34');
INSERT INTO `tb_role_menu` VALUES ('3', '34');

-- ----------------------------
-- Table structure for `tb_sell_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_sell_order`;
CREATE TABLE `tb_sell_order` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(50) NOT NULL COMMENT '公司名称',
  `order_date` datetime NOT NULL COMMENT '订单日期',
  `deli_date` datetime NOT NULL COMMENT '交货日期',
  `order_status` varchar(200) DEFAULT NULL COMMENT '订单状态',
  `note` varchar(500) NOT NULL COMMENT '备注',
  `status` varchar(1) DEFAULT NULL COMMENT '0:禁用，1:正常',
  `tamt` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `atamt` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '实收金额',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=10114 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_sell_order
-- ----------------------------
INSERT INTO `tb_sell_order` VALUES ('10000', '客户1', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '290842D9', '1', '100.00', '50.00');
INSERT INTO `tb_sell_order` VALUES ('10001', '客户2', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '79F7BE6B', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10002', '客户3', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'EE6036CC', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10003', '客户4', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '07EF464D', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10004', '客户5', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '0E0DEE12', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10005', '客户6', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '560E86B5', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10006', '客户7', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '0FCBB611', '1', '70.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10007', '客户8', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'F5EC5AE3', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10008', '客户9', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '44E7F554', '1', '30.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10009', '客户10', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'C7053411', '1', '20.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10010', '客户11', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'A8C793DB', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10011', '客户12', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'BAB89B92', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10012', '客户13', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'C4E5663F', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10013', '客户14', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '6BC93BDE', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10014', '客户15', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '62237D43', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10015', '客户16', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '4517D57C', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10016', '客户17', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'FF493C49', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10017', '客户18', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '5D20BCC6', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10018', '客户19', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'E2F9F557', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10019', '客户20', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '9C027C68', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10020', '客户21', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'EE918251', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10021', '客户22', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'F15511AC', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10022', '客户23', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '35161BB9', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10023', '客户24', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '874597C0', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10024', '客户25', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'FCD9E41C', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10025', '客户26', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'CA939D96', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10026', '客户27', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'DAE9AE1E', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10027', '客户28', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'D8AE5B71', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10028', '客户29', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '17D4A205', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10029', '客户30', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '719C8396', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10030', '客户31', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'C8B19C00', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10031', '客户32', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '7975BA10', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10032', '客户33', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '347BEEBB', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10033', '客户34', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'F9B8595D', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10034', '客户35', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '8B543F2D', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10035', '客户36', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'B5F20DD2', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10036', '客户37', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '70ACF06E', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10037', '客户38', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '90E16457', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10038', '客户39', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'BBC0F13A', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10039', '客户40', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '905840F3', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10040', '客户41', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'DFF1BF3E', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10041', '客户42', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'CFAFD5C1', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10042', '客户43', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'CFAC8C90', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10043', '客户44', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '6F22E86A', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10044', '客户45', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'F8987B17', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10045', '客户46', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '8F09C4B9', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10046', '客户47', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '218EE6D8', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10047', '客户48', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '0DD2DBA1', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10048', '客户49', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '874BAEBA', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10049', '客户50', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '12607141', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10050', '客户51', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '956E1DB5', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10051', '客户52', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'C6F3250E', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10052', '客户53', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '4C6B9300', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10053', '客户54', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '4BF6BD9F', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10054', '客户55', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'EF7F69CB', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10055', '客户56', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'AA9F1030', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10056', '客户57', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '81B9A24B', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10057', '客户58', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '4D19C4E2', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10058', '客户59', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '164EC02D', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10059', '客户60', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '87E78631', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10060', '客户61', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '4760584A', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10061', '客户62', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '67483258', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10062', '客户63', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '0012C9C4', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10063', '客户64', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '08F3AF1C', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10064', '客户65', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '28187C15', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10065', '客户66', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'D338AA11', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10066', '客户67', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'ED358CF8', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10067', '客户68', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'B99A4D67', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10068', '客户69', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'A223904C', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10069', '客户70', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '75A78CCE', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10070', '客户71', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '7B117402', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10071', '客户72', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '28C3F592', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10072', '客户73', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '14404072', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10073', '客户74', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '26C83C01', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10074', '客户75', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'EBBB2941', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10075', '客户76', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '34C0B2E5', '0', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10076', '客户77', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '4BA9AE42', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10077', '客户78', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '3ADC1C6B', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10078', '客户79', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '1709CB73', '0', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10079', '客户80', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '5A78206D', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10080', '客户81', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '4F8B0D05', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10081', '客户82', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '78965B7F', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10082', '客户83', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'E6384DA4', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10083', '客户84', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'F4E36788', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10084', '客户85', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '6D1B71CC', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10085', '客户86', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '56322166', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10086', '客户87', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '45AA59DF', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10087', '客户88', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '7537ED33', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10088', '客户89', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '694D6127', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10089', '客户90', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'CFA9CC56', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10090', '客户91', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '849F31DD', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10091', '客户92', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'F6FE48C5', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10092', '客户93', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'FF374C48', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10093', '客户94', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'ECF38B3C', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10094', '客户95', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '9064F161', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10095', '客户96', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '3BB351EF', '0', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10096', '客户97', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'CBEB012A', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10097', '客户98', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', 'A3201AAD', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10098', '客户99', '2019-06-08 12:00:00', '2019-07-01 00:00:00', '订单输入', '4A0CE763', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10099', '客户100', '2019-08-07 09:18:40', '2019-08-31 08:00:00', '对账中', '', '1', '752.00', '550.00');
INSERT INTO `tb_sell_order` VALUES ('10101', '12', '2019-06-13 00:00:00', '2019-06-30 00:00:00', '制作中', '22', '1', '300.00', '291.00');
INSERT INTO `tb_sell_order` VALUES ('10102', '12', '2019-07-30 00:00:00', '2019-07-30 00:00:00', '对账中', '12', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10103', '123', '2019-07-29 00:00:00', '2019-07-17 00:00:00', '订单输入', '123', '0', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10104', '客户2222', '2019-07-24 00:00:00', '2019-08-22 08:03:02', '订单输入', '11', '0', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10105', '客户111', '2019-07-30 14:54:46', '2019-08-30 00:00:00', '订单输入', '11', '0', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10106', '客户aa', '2019-07-30 14:56:48', '2019-07-31 00:00:00', '订单输入', '', '0', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10107', '客户cc', '2019-07-30 14:57:54', '2019-07-31 00:00:00', '订单输入', '11', '0', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10108', '客户dd', '2019-07-30 00:00:00', '2019-07-30 00:00:00', '订单输入', '112', '0', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10109', '客户处1', '2019-07-30 00:00:00', '2019-07-30 00:00:00', '订单输入', '112', '0', '200.00', '30.00');
INSERT INTO `tb_sell_order` VALUES ('10110', '客户23', '2019-07-30 15:28:51', '2019-07-31 00:00:00', '订单输入', '11', '0', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10111', '客户1', '2019-07-30 15:48:25', '2019-08-31 08:00:00', '订单结束', '11', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10112', '12', '2019-08-06 00:00:00', '2019-08-07 00:00:00', '订单输入', '11', '1', '0.00', '0.00');
INSERT INTO `tb_sell_order` VALUES ('10113', '12', '2019-08-06 00:00:00', '2019-08-07 00:00:00', '制作中', '11', '1', '183.00', '120.00');

-- ----------------------------
-- Table structure for `tb_sell_order_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_sell_order_info`;
CREATE TABLE `tb_sell_order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `oid` bigint(20) NOT NULL,
  `itemno` varchar(50) NOT NULL COMMENT '货号',
  `num` int(11) NOT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_sell_order_info
-- ----------------------------
INSERT INTO `tb_sell_order_info` VALUES ('1', '10101', '100001', '50');
INSERT INTO `tb_sell_order_info` VALUES ('6', '10101', '100002', '50');
INSERT INTO `tb_sell_order_info` VALUES ('7', '10101', '100003', '50');
INSERT INTO `tb_sell_order_info` VALUES ('10', '10101', '100004', '50');
INSERT INTO `tb_sell_order_info` VALUES ('14', '10101', '100005', '50');
INSERT INTO `tb_sell_order_info` VALUES ('15', '10102', 'F99864A6', '20');
INSERT INTO `tb_sell_order_info` VALUES ('17', '10111', 'A7C2314F', '100');
INSERT INTO `tb_sell_order_info` VALUES ('18', '10111', 'E05966EC', '40');
INSERT INTO `tb_sell_order_info` VALUES ('20', '10101', 'F99864A6', '20');
INSERT INTO `tb_sell_order_info` VALUES ('21', '10101', 'A7C2314F', '20');
INSERT INTO `tb_sell_order_info` VALUES ('22', '10101', 'E05966EC', '30');
INSERT INTO `tb_sell_order_info` VALUES ('23', '10113', 'F99864A6', '10');
INSERT INTO `tb_sell_order_info` VALUES ('24', '10113', 'A7C2314F', '10');
INSERT INTO `tb_sell_order_info` VALUES ('25', '10113', 'E05966EC', '20');
INSERT INTO `tb_sell_order_info` VALUES ('26', '10099', 'F99864A6', '20');
INSERT INTO `tb_sell_order_info` VALUES ('27', '10099', 'A7C2314F', '20');
INSERT INTO `tb_sell_order_info` VALUES ('28', '10099', 'E05966EC', '20');
INSERT INTO `tb_sell_order_info` VALUES ('29', '10099', '7A7661A5', '20');
INSERT INTO `tb_sell_order_info` VALUES ('30', '10099', '03704928', '20');
INSERT INTO `tb_sell_order_info` VALUES ('31', '10113', '7A7661A5', '10');
INSERT INTO `tb_sell_order_info` VALUES ('32', '10113', '03704928', '10');
INSERT INTO `tb_sell_order_info` VALUES ('33', '10113', '857FE0BE', '10');
INSERT INTO `tb_sell_order_info` VALUES ('34', '10113', '6B2BAAE9', '10');
INSERT INTO `tb_sell_order_info` VALUES ('35', '10113', '2EDF21FE', '10');
INSERT INTO `tb_sell_order_info` VALUES ('36', '10113', '486616FA', '10');
INSERT INTO `tb_sell_order_info` VALUES ('37', '10113', 'F580EB8D', '10');
INSERT INTO `tb_sell_order_info` VALUES ('38', '10113', 'F4471F7E', '10');
INSERT INTO `tb_sell_order_info` VALUES ('39', '10113', 'E60F8680', '10');
INSERT INTO `tb_sell_order_info` VALUES ('40', '10113', 'ABC268DC', '10');

-- ----------------------------
-- Table structure for `tb_ship_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ship_order`;
CREATE TABLE `tb_ship_order` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `oid` bigint(20) NOT NULL,
  `ship_date` varchar(50) NOT NULL COMMENT '交货日期',
  `ship_status` varchar(1) DEFAULT NULL COMMENT '0:未合并，1:合并',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=10025 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_ship_order
-- ----------------------------
INSERT INTO `tb_ship_order` VALUES ('10000', '10101', '2019/06/01', '2');
INSERT INTO `tb_ship_order` VALUES ('10001', '10101', '2019/06/02', '2');
INSERT INTO `tb_ship_order` VALUES ('10002', '10101', '2019/06/03', '2');
INSERT INTO `tb_ship_order` VALUES ('10003', '10101', '2019/07/11', '1');
INSERT INTO `tb_ship_order` VALUES ('10004', '10101', '2019/07/12', '1');
INSERT INTO `tb_ship_order` VALUES ('10005', '10101', '2019/07/13', '1');
INSERT INTO `tb_ship_order` VALUES ('10006', '10101', '2019/07/14', '1');
INSERT INTO `tb_ship_order` VALUES ('10007', '10111', '2019/07/30', '1');
INSERT INTO `tb_ship_order` VALUES ('10008', '10111', '2019/07/30', '1');
INSERT INTO `tb_ship_order` VALUES ('10009', '10102', '2019/07/31', '1');
INSERT INTO `tb_ship_order` VALUES ('10010', '10102', '2019/07/31', '1');
INSERT INTO `tb_ship_order` VALUES ('10011', '10102', '2019/07/31', '1');
INSERT INTO `tb_ship_order` VALUES ('10012', '10102', '2019/07/31', '1');
INSERT INTO `tb_ship_order` VALUES ('10013', '10113', '2019/08/06', '2');
INSERT INTO `tb_ship_order` VALUES ('10014', '10113', '2019/08/06', '2');
INSERT INTO `tb_ship_order` VALUES ('10015', '10099', '2019/08/07', '0');
INSERT INTO `tb_ship_order` VALUES ('10016', '10099', '2019/08/07', '0');
INSERT INTO `tb_ship_order` VALUES ('10017', '10099', '2019/08/07', '0');
INSERT INTO `tb_ship_order` VALUES ('10018', '10099', '2019/08/07', '0');
INSERT INTO `tb_ship_order` VALUES ('10019', '10099', '2019/08/07', '0');
INSERT INTO `tb_ship_order` VALUES ('10020', '10099', '2019/08/07', '2');
INSERT INTO `tb_ship_order` VALUES ('10021', '10099', '2019/08/07', '2');
INSERT INTO `tb_ship_order` VALUES ('10022', '10099', '2019/08/07', '2');
INSERT INTO `tb_ship_order` VALUES ('10023', '10113', '2019/08/07', '2');
INSERT INTO `tb_ship_order` VALUES ('10024', '10113', '2019/08/07', '2');

-- ----------------------------
-- Table structure for `tb_ship_order_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ship_order_info`;
CREATE TABLE `tb_ship_order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sid` bigint(20) NOT NULL,
  `itemno` varchar(50) NOT NULL COMMENT '货号',
  `num` int(11) NOT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_ship_order_info
-- ----------------------------
INSERT INTO `tb_ship_order_info` VALUES ('1', '10000', '100001', '10');
INSERT INTO `tb_ship_order_info` VALUES ('2', '10000', '100004', '20');
INSERT INTO `tb_ship_order_info` VALUES ('3', '10001', '100002', '20');
INSERT INTO `tb_ship_order_info` VALUES ('4', '10001', '100003', '40');
INSERT INTO `tb_ship_order_info` VALUES ('5', '10002', '100002', '30');
INSERT INTO `tb_ship_order_info` VALUES ('6', '10002', '100004', '10');
INSERT INTO `tb_ship_order_info` VALUES ('7', '10003', '100001', '10');
INSERT INTO `tb_ship_order_info` VALUES ('8', '10003', '100004', '10');
INSERT INTO `tb_ship_order_info` VALUES ('9', '10003', '100005', '10');
INSERT INTO `tb_ship_order_info` VALUES ('10', '10004', '100001', '30');
INSERT INTO `tb_ship_order_info` VALUES ('11', '10005', '100003', '10');
INSERT INTO `tb_ship_order_info` VALUES ('12', '10005', '100004', '10');
INSERT INTO `tb_ship_order_info` VALUES ('13', '10006', '100001', '10');
INSERT INTO `tb_ship_order_info` VALUES ('14', '10007', 'A7C2314F', '100');
INSERT INTO `tb_ship_order_info` VALUES ('15', '10007', 'E05966EC', '20');
INSERT INTO `tb_ship_order_info` VALUES ('16', '10008', 'A7C2314F', '30');
INSERT INTO `tb_ship_order_info` VALUES ('17', '10008', 'E05966EC', '10');
INSERT INTO `tb_ship_order_info` VALUES ('18', '10009', 'F99864A6', '10');
INSERT INTO `tb_ship_order_info` VALUES ('19', '10010', 'F99864A6', '11');
INSERT INTO `tb_ship_order_info` VALUES ('20', '10011', 'F99864A6', '22');
INSERT INTO `tb_ship_order_info` VALUES ('21', '10012', 'F99864A6', '10');
INSERT INTO `tb_ship_order_info` VALUES ('22', '10013', 'F99864A6', '1');
INSERT INTO `tb_ship_order_info` VALUES ('23', '10013', 'A7C2314F', '1');
INSERT INTO `tb_ship_order_info` VALUES ('24', '10013', 'E05966EC', '1');
INSERT INTO `tb_ship_order_info` VALUES ('25', '10014', 'F99864A6', '2');
INSERT INTO `tb_ship_order_info` VALUES ('26', '10014', 'A7C2314F', '2');
INSERT INTO `tb_ship_order_info` VALUES ('27', '10014', 'E05966EC', '2');
INSERT INTO `tb_ship_order_info` VALUES ('28', '10015', 'A7C2314F', '10');
INSERT INTO `tb_ship_order_info` VALUES ('29', '10015', '7A7661A5', '10');
INSERT INTO `tb_ship_order_info` VALUES ('30', '10016', 'F99864A6', '10');
INSERT INTO `tb_ship_order_info` VALUES ('31', '10016', '7A7661A5', '10');
INSERT INTO `tb_ship_order_info` VALUES ('32', '10017', 'F99864A6', '10');
INSERT INTO `tb_ship_order_info` VALUES ('33', '10017', '7A7661A5', '10');
INSERT INTO `tb_ship_order_info` VALUES ('34', '10018', 'F99864A6', '20');
INSERT INTO `tb_ship_order_info` VALUES ('35', '10018', '7A7661A5', '20');
INSERT INTO `tb_ship_order_info` VALUES ('36', '10019', 'F99864A6', '20');
INSERT INTO `tb_ship_order_info` VALUES ('37', '10020', 'F99864A6', '10');
INSERT INTO `tb_ship_order_info` VALUES ('38', '10020', 'A7C2314F', '20');
INSERT INTO `tb_ship_order_info` VALUES ('39', '10020', 'E05966EC', '30');
INSERT INTO `tb_ship_order_info` VALUES ('40', '10020', '7A7661A5', '40');
INSERT INTO `tb_ship_order_info` VALUES ('41', '10020', '03704928', '50');
INSERT INTO `tb_ship_order_info` VALUES ('42', '10021', 'F99864A6', '50');
INSERT INTO `tb_ship_order_info` VALUES ('43', '10021', 'A7C2314F', '40');
INSERT INTO `tb_ship_order_info` VALUES ('44', '10021', 'E05966EC', '30');
INSERT INTO `tb_ship_order_info` VALUES ('45', '10021', '7A7661A5', '20');
INSERT INTO `tb_ship_order_info` VALUES ('46', '10021', '03704928', '10');
INSERT INTO `tb_ship_order_info` VALUES ('47', '10022', 'F99864A6', '10');
INSERT INTO `tb_ship_order_info` VALUES ('48', '10022', 'A7C2314F', '10');
INSERT INTO `tb_ship_order_info` VALUES ('49', '10022', 'E05966EC', '10');
INSERT INTO `tb_ship_order_info` VALUES ('50', '10022', '7A7661A5', '10');
INSERT INTO `tb_ship_order_info` VALUES ('51', '10022', '03704928', '10');
INSERT INTO `tb_ship_order_info` VALUES ('52', '10023', 'A7C2314F', '10');
INSERT INTO `tb_ship_order_info` VALUES ('53', '10023', '2EDF21FE', '10');
INSERT INTO `tb_ship_order_info` VALUES ('54', '10023', 'F4471F7E', '10');
INSERT INTO `tb_ship_order_info` VALUES ('55', '10024', 'F99864A6', '10');
INSERT INTO `tb_ship_order_info` VALUES ('56', '10024', 'A7C2314F', '10');
INSERT INTO `tb_ship_order_info` VALUES ('57', '10024', 'E05966EC', '10');
INSERT INTO `tb_ship_order_info` VALUES ('58', '10024', '7A7661A5', '10');
INSERT INTO `tb_ship_order_info` VALUES ('59', '10024', '03704928', '10');
INSERT INTO `tb_ship_order_info` VALUES ('60', '10024', '857FE0BE', '10');
INSERT INTO `tb_ship_order_info` VALUES ('61', '10024', '6B2BAAE9', '10');
INSERT INTO `tb_ship_order_info` VALUES ('62', '10024', '2EDF21FE', '10');
INSERT INTO `tb_ship_order_info` VALUES ('63', '10024', '486616FA', '10');
INSERT INTO `tb_ship_order_info` VALUES ('64', '10024', 'F580EB8D', '10');
INSERT INTO `tb_ship_order_info` VALUES ('65', '10024', 'F4471F7E', '10');
INSERT INTO `tb_ship_order_info` VALUES ('66', '10024', 'E60F8680', '10');
INSERT INTO `tb_ship_order_info` VALUES ('67', '10024', 'ABC268DC', '10');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `fullname` varchar(50) NOT NULL COMMENT '全名',
  `status` varchar(1) DEFAULT NULL COMMENT '0:禁用，1:正常',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`) USING BTREE,
  CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`role_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '1', '1');
INSERT INTO `tb_user` VALUES ('2', 'test', 'e10adc3949ba59abbe56e057f20f883e', '测试', '1', '2');
INSERT INTO `tb_user` VALUES ('3', 'ls', 'e10adc3949ba59abbe56e057f20f883e', '李四', '1', '1');
INSERT INTO `tb_user` VALUES ('4', 'zs', 'e10adc3949ba59abbe56e057f20f883e', '张三', '1', '2');

-- ----------------------------
-- Procedure structure for `getShipInfo`
-- ----------------------------
DROP PROCEDURE IF EXISTS `getShipInfo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getShipInfo`(
	IN `@oid` BIGINT,
	IN `@s` VARCHAR(5000)
)
BEGIN
    
		SELECT oid, sid, ship_date, `@s`
		FROM (
				SELECT a.oid, a.sid, a.ship_date, b.itemno, ifnull(c.num, 0) AS num
				FROM tb_ship_order a
					LEFT JOIN tb_sell_order_info b ON a.oid = b.oid
					LEFT JOIN tb_ship_order_info c ON b.itemno = c.itemno AND a.sid = c.sid
				WHERE a.oid = `@oid`
		) A
		GROUP BY oid, sid, ship_date;
		
END
;;
DELIMITER ;
