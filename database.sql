/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : yxb

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 31/03/2019 18:16:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, 'IT部');
INSERT INTO `department` VALUES (2, '采购部');
INSERT INTO `department` VALUES (3, '销售部');

-- ----------------------------
-- Table structure for depot
-- ----------------------------
DROP TABLE IF EXISTS `depot`;
CREATE TABLE `depot`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maxCapacity` decimal(19, 2) NULL DEFAULT NULL,
  `currentCapacity` decimal(19, 2) NULL DEFAULT NULL,
  `totalAmount` decimal(19, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of depot
-- ----------------------------
INSERT INTO `depot` VALUES (1, '成都仓库', 10000.00, 103.00, 10005.00);

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, '部门一');
INSERT INTO `dept` VALUES (2, '阿斯蒂芬');
INSERT INTO `dept` VALUES (3, '2342134');
INSERT INTO `dept` VALUES (4, '玩儿');
INSERT INTO `dept` VALUES (6, '1111111111');
INSERT INTO `dept` VALUES (7, '23t456');
INSERT INTO `dept` VALUES (8, '4htry45y');
INSERT INTO `dept` VALUES (10, '二医院 ');
INSERT INTO `dept` VALUES (12, '1234');
INSERT INTO `dept` VALUES (13, 'sdfa');
INSERT INTO `dept` VALUES (14, 'aaaaa');
INSERT INTO `dept` VALUES (16, 'asdfadf');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `headImage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `department_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK4AFD4ACE851EFECF`(`department_id`) USING BTREE,
  CONSTRAINT `FK4AFD4ACE851EFECF` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 277 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, 'admin', '48d05cc43f3bfe2510394e8dfcef919a', 'admin@itsource.com', '/images/head/avatar.png', 34, 1);
INSERT INTO `employee` VALUES (2, 'roleAdmin', 'd563ad18fb8e2067eaee76ca27f3e8a3', 'roleAdmin@itsource.cn', '/images/head/avatar1.png', 25, 1);
INSERT INTO `employee` VALUES (3, 'admin1', 'admin1', 'amdin1@gaojingsi.cn', '/images/head/avatar2.png', 25, 1);
INSERT INTO `employee` VALUES (4, 'admin2', 'd157d747dc2f6740e81ca9d84b669272', 'amdin2@itsource.cn', NULL, 25, 2);
INSERT INTO `employee` VALUES (5, 'admin3', '89335a5f0fdd015113e9acf90727cdce', 'amdin3@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (6, 'admin4', '12e4dc60e1813184b3e4552dedd7bf9b', 'amdin4@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (7, 'admin5', '02f9b7f759b5654d421c0ce458d16c28', 'amdin5@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (8, 'admin6', '138e943e0987d1fff7a4c367deedd4e3', 'amdin6@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (9, 'admin7', '53bf9cd2cb250a9d82c3260b6d398d73', 'amdin7@itsource.cn', NULL, 25, 2);
INSERT INTO `employee` VALUES (10, 'admin8', 'f6bd6e8ca007216fef1ddd9652e5d42f', 'amdin8@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (11, 'admin9', 'bc9ee22de9d477a4dc21527fb5288e09', 'amdin9@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (12, 'admin10', '4af867a168f310ac9f542fb27d088412', 'amdin10@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (13, 'admin11', 'c953909c87335d7fbc0f004c850d5899', 'amdin11@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (14, 'admin12', '57c15b685c731241ceb257436da984ce', 'amdin12@itsource.cn', '/images/head/avatar3.png', 10, 3);
INSERT INTO `employee` VALUES (15, 'admin13', '72b5871658a55870f55c7cedcdbfc750', 'amdin13@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (16, 'admin14', '3aaae1c105814d0e3b6de8f4e7befe3f', 'amdin14@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (17, 'admin15', 'ec466277d5e194ce58b4be14de342e0d', 'amdin15@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (18, 'admin16', '0f49d0f9f47fbdbe311b90b39d071389', 'amdin16@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (19, 'admin17', '684e22f740a05d25f63a16ed9b22bd3a', 'amdin17@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (20, 'admin18', '6b3f18873b8c1fa7948d2eefd236f0b0', 'amdin18@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (21, 'admin19', '6ed03e3efc7f62c780e5a5f05327c2dd', 'amdin19@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (22, 'admin20', 'b19bb9f57188bb9017a5f1e334f6cad4', 'amdin20@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (23, 'admin21', '8d366e02c4373f215e5fae12ef04ecb2', 'amdin21@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (24, 'admin22', '8a27c7cc380d853babd2c04c9d72625f', 'amdin22@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (25, 'admin23', '1a9687e7f1d50e800b2ece459e654408', 'amdin23@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (26, 'admin24', '4f3d03f2d6eaa67ee678cb25ab6f30fd', 'amdin24@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (27, 'admin25', '8309757711ae53bf971ada0eb756fcad', 'amdin25@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (28, 'admin26', '65faa932744343a804d2644d6725c809', 'amdin26@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (29, 'admin27', 'c37e2a159c4104b5efafeb48c4d3f8a8', 'amdin27@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (30, 'admin28', 'b4d8369858ca62b1871f611a17ab6c85', 'amdin28@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (31, 'admin29', '32761f6f732cbd3a9b1395f3d0282361', 'amdin29@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (32, 'admin30', '2bde47bd1a502737c2bf7ef8bca461e7', 'amdin30@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (33, 'admin31', '1024d7721d427b5625ad0dd73a22d839', 'amdin31@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (34, 'admin32', '67b6c36942783249382c2871fbcc1cb5', 'amdin32@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (35, 'admin33', '8fda601d305b34e693f41b0f8cb4267e', 'amdin33@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (36, 'admin34', 'fab9a4475f7ee7e49890cdf3b2f157bf', 'amdin34@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (37, 'admin35', 'dd90df5259c45dab53823aa2b5ac5ab9', 'amdin35@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (38, 'admin36', 'c265ec550b72583d14cf66f5874d3679', 'amdin36@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (39, 'admin37', '1dbb67fa18836c047c87fa1fbffacd6b', 'amdin37@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (40, 'admin38', '2bd08251c9aba4e1057bbe877164cbe1', 'amdin38@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (41, 'admin39', '4b56537a50ebe8e4814e7e684ec7e938', 'amdin39@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (42, 'admin40', 'ab9d29a6001519fe0ae60064c350760a', 'amdin40@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (43, 'admin41', '36d035b690b5d06002f3e26cc8cc02aa', 'amdin41@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (44, 'admin42', '6189eeb659b66c0121d8e6c5865865a8', 'amdin42@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (45, 'admin43', '7c436b40cc462818481ba1ef64f4a4ca', 'amdin43@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (46, 'admin44', '97d22105abec0c9672d503723e136100', 'amdin44@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (47, 'admin45', 'c8db7f4d490c177925c3c86f11ece83c', 'amdin45@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (48, 'admin46', 'b78114c2399ae23a624b72de85d7cf51', 'amdin46@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (49, 'admin47', 'c00cfd28ef690dc6920d1c9b251f42d8', 'amdin47@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (50, 'admin48', '214b22a99efeef099b1867874c337108', 'amdin48@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (51, 'admin49', '128dad1c555bf4ede2e26206dc92ce1b', 'amdin49@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (52, 'admin50', '062f6299b738b135a73e4c3a64a13a15', 'amdin50@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (53, 'admin51', '3d2f81419d5288c127ec815dfe9e4522', 'amdin51@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (54, 'admin52', '480870bc0920e59dde8998ceba258c03', 'amdin52@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (55, 'admin53', 'b4dc6f1821a2a3332a4bcb3b89490997', 'amdin53@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (56, 'admin54', '9933c8cddd2577281c92b70aa9025f04', 'amdin54@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (57, 'admin55', '52d52dbf39f8459f5a716ce39aff4864', 'amdin55@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (58, 'admin56', 'fcb2b6a672577d89f1227d07b78fcaef', 'amdin56@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (59, 'admin57', 'f2e3452ad0c170f7c5dc307f02012007', 'amdin57@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (60, 'admin58', 'bb8c525fa0dc184229ed2d99d9a6601e', 'amdin58@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (61, 'admin59', 'ba8189906a9cc50bf156c62a8d55f835', 'amdin59@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (62, 'admin60', 'a1cf16ba52327acee543ade45fe2a408', 'amdin60@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (63, 'admin61', 'b38de8af165c14b7b68fb0dcdaea0e28', 'amdin61@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (64, 'admin62', '8f2531b74f008cd456696da6d6a909d7', 'amdin62@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (65, 'admin63', 'bb16c7f9cbea20dafd0fe4f3e404c5fc', 'amdin63@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (66, 'admin64', 'dfeab8b4b419cc4806545a3a1160023e', 'amdin64@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (67, 'admin65', 'd7b78f460b9559557c13af5e637ea921', 'amdin65@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (68, 'admin66', '6b892f86125ed46422b582718bccbaa3', 'amdin66@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (69, 'admin67', '89186a2ef55c1e92160d40eac0358fa4', 'amdin67@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (70, 'admin68', '724beb114c3e0094974b4a495861534f', 'amdin68@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (71, 'admin69', 'a2311a2b59adbb74ddaa8131993e8963', 'amdin69@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (72, 'admin70', '7b8a5667d10bb57744138f5cd6eb3411', 'amdin70@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (73, 'admin71', '927165e67ed3039642578e4f18a65f3c', 'amdin71@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (74, 'admin72', '028615d0a82f39b32ef8df6d7ec9e6d5', 'amdin72@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (75, 'admin73', 'b561bc012063aaf336eddc132564b39b', 'amdin73@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (76, 'admin74', 'fa33a53cf7b3ff49e31da3671d421ad4', 'amdin74@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (77, 'admin75', 'cf4eb8cd0d65a61d0acf0212cb98719f', 'amdin75@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (78, 'admin76', 'e7b06297d2c6fb7426c19a184006ea04', 'amdin76@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (79, 'admin77', '7cc040d1d56a399597a1ca1105a8f392', 'amdin77@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (80, 'admin78', '0afc812c6e7f064a0581c7ac8823e4e1', 'amdin78@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (81, 'admin79', 'df2fc7fd6a88ab389a8997b4f979227f', 'amdin79@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (82, 'admin80', '917edbaba9dd839940f1ea6115b81fb4', 'amdin80@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (84, 'admin82', '23f556879c4d48b62685a4c74462ff20', 'amdin82@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (85, 'admin83', '278bb2a5264784023e10479286bf6ad1', 'amdin83@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (86, 'admin84', '4b646957feea88bd919786b53308e5fe', 'amdin84@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (87, 'admin85', '89e268a7194c186542a2462e9067803f', 'amdin85@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (88, 'admin86', 'df286298bac9ae074263804dcc4b6746', 'amdin86@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (89, 'admin87', 'efe3f582c67ad9c5990d684370b2091b', 'amdin87@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (90, 'admin88', '2442a32ec232ccdd526e1187ca8b8e63', 'amdin88@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (91, 'admin89', '9d02d47995b34e23466ea3f884123b92', 'amdin89@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (92, 'admin90', '361f59cad3911de5f5dc8c0eb0edc837', 'amdin90@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (94, 'admin92', '5a9e4a3970e5dfe918119678b219776f', 'amdin92@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (95, 'admin93', '0668938be4636952839cd7ac3327b710', 'amdin93@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (96, 'admin94', 'b0515c6643d36d015d818bacabb3fa75', 'amdin94@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (97, 'admin95', '9fe8133f960ada5d89d04206e0d6cacf', 'amdin95@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (98, 'admin96', '16f7780cba2e0894b556f784cad4f9e6', 'amdin96@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (99, 'admin97', 'b2038b73d0c2ae5d7fa69f8500dbf0b9', 'amdin97@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (100, 'admin98', '93a4828f14a6d6b583d73e3c32660f69', 'amdin98@itsource.cn', '/images/head/avatar3.png', 25, 3);
INSERT INTO `employee` VALUES (101, 'admin99', '211660364fa51c7ae846fef09527a957', 'amdin99@itsource.cn', '/images/head/avatar3.png', 25, 2);
INSERT INTO `employee` VALUES (174, '左右', 'acbb0dbe42dc6b515806eb3064d40390', '23123', '/images/head/avatar3.png', NULL, NULL);
INSERT INTO `employee` VALUES (175, '顶替', '1d734a549a3f581c7e31dbbbf79a829e', '234', '/images/head/avatar3.png', NULL, NULL);
INSERT INTO `employee` VALUES (176, '234', '586b3891775a181dd42777da93014c66', '234234', '/images/head/avatar3.png', NULL, NULL);
INSERT INTO `employee` VALUES (177, 'aaaa', '3caaaafe2e37048f1d9fb00425990ad3', '23434', '/images/head/avatar3.png', 44, 2);
INSERT INTO `employee` VALUES (178, 'sdf', '687453ac8fed9ff73a204726f6cf8e25', '123', '/images/head/avatar3.png', NULL, NULL);
INSERT INTO `employee` VALUES (179, 'ewr', '92b6f61e4f0df80b31da8b79fdecf0ef', '123', '/images/head/avatar3.png', 34, 3);
INSERT INTO `employee` VALUES (181, 'admin77', '7cc040d1d56a399597a1ca1105a8f392', 'amdin7@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (184, 'asdf', 'e9cd9583b9f7d476e089339052b27a46', '234', '/images/head/avatar3.png', NULL, 1);
INSERT INTO `employee` VALUES (190, 'sdfasdf', '40a16bac1d35bf5da24aee12c8808582', '', '/images/head/avatar3.png', NULL, NULL);
INSERT INTO `employee` VALUES (191, 'sfsdaf', 'ffc5e2fbd5a9c9ae8003751505c28a68', '', '/images/head/avatar3.png', NULL, NULL);
INSERT INTO `employee` VALUES (192, 'sdfa', '4159ef3f7eea6ef9f9fb36918962798b', '', '/images/head/avatar3.png', NULL, NULL);
INSERT INTO `employee` VALUES (198, 'admin811c5f', 'bb62d34813467a1094172636e9f98143', 'lsq@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (199, 'admin185c14d', '546a598ed088ba5e44d731778d02a847', 'amdin1@itsource.cn', '/images/head/avatar3.png', 60, 1);
INSERT INTO `employee` VALUES (200, 'admin5d6c610', 'db9699795998134336cb5f3464845794', 'amdin5@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (201, 'admin11d639b3', '55fa4951d8ee5dfb86fcfe39a1c74385', 'amdin11@itsource.cn', '/images/head/avatar3.png', 25, 1);
INSERT INTO `employee` VALUES (204, 'fasdfasdf', '788d6225bd5c387f9b9ce1efd42865ae', '', '/images/head/avatar3.png', NULL, 1);
INSERT INTO `employee` VALUES (208, 'sadfsdf', 'e7558b4f7398b28901dc5327195af43d', NULL, '/images/head/avatar3.png', NULL, NULL);
INSERT INTO `employee` VALUES (210, 'sadfdfwe', '6c5f1f429eae3a95c188bb0f3a3e7c50', NULL, '/images/head/avatar3.png', NULL, NULL);
INSERT INTO `employee` VALUES (229, 'aaaaa', 'e77106f38bce44bbbd25d1ab33e3b623', '', '/images/head/avatar3.png', NULL, NULL);
INSERT INTO `employee` VALUES (230, 'bbbb', '24ac61f8230ef3cf20919d3426ec5617', '213', '/images/head/avatar3.png', 23, NULL);
INSERT INTO `employee` VALUES (233, 'dfsdf', 'dfsdf', 'sdfsdf', NULL, 324, 2);
INSERT INTO `employee` VALUES (234, 'sfafs', 'sfafs', 'wer', NULL, 23, 1);
INSERT INTO `employee` VALUES (235, 'wer', 'wer', 'wer', NULL, 34, 2);
INSERT INTO `employee` VALUES (236, '222222', '222222', 'qe', NULL, 23, 2);
INSERT INTO `employee` VALUES (240, '123222', '123222', '123@qq.com', NULL, 21, 3);
INSERT INTO `employee` VALUES (245, 'admin1111', 'admin1111', '', NULL, NULL, NULL);
INSERT INTO `employee` VALUES (246, 'sfsfsf', 'sfsfsf', '123@qq.com', NULL, 123, 1);
INSERT INTO `employee` VALUES (247, 'sfsfsf', 'sfsfsf', '', NULL, NULL, NULL);
INSERT INTO `employee` VALUES (262, 'asdf23', 'asdf23', 'wqe@qq.com', NULL, 31, 2);
INSERT INTO `employee` VALUES (263, 'asdfxx', 'asdfxx', 'sdf@qq.com', NULL, 34, 1);
INSERT INTO `employee` VALUES (264, 'sad12', 'sad12', 'sdf@qq.com', NULL, 34, 1);
INSERT INTO `employee` VALUES (265, 'sdfasfasdf', 'sdfasfasdf', 'sdf@qq.com', NULL, 23, 1);
INSERT INTO `employee` VALUES (266, 'admin063-1756-4e3c-8ecb-33fe746ae077', 'admin063-1756-4e3c-8ecb-33fe746ae077', 'lsq@itsource.cn', NULL, 25, 1);
INSERT INTO `employee` VALUES (267, 'monkey500eec-fe27-4ff1-91ef-82d34c400b8f', 'monkey500eec-fe27-4ff1-91ef-82d34c400b8f', 'amdin1@itsource.cn', NULL, 60, 1);
INSERT INTO `employee` VALUES (268, 'admin5d93-266a-4bcd-9852-15586484ea1d', 'admin5d93-266a-4bcd-9852-15586484ea1d', 'amdin5@itsource.cn', NULL, 25, 1);
INSERT INTO `employee` VALUES (269, 'admin1188c-220e-4e42-b364-1439e008eded', 'admin1188c-220e-4e42-b364-1439e008eded', 'amdin11@itsource.cn', NULL, 25, 1);
INSERT INTO `employee` VALUES (270, 'adminf0d-408f-4859-a454-ac51604ae0fd', 'adminf0d-408f-4859-a454-ac51604ae0fd', 'lsq@itsource.cn', NULL, 25, 1);
INSERT INTO `employee` VALUES (271, 'monkey50083b-0ca2-4bd3-8e31-df2248b5ede7', 'monkey50083b-0ca2-4bd3-8e31-df2248b5ede7', 'amdin1@itsource.cn', NULL, 60, 1);
INSERT INTO `employee` VALUES (272, 'admin50b4-cac6-4f70-b404-2276dade3d34', 'admin50b4-cac6-4f70-b404-2276dade3d34', 'amdin5@itsource.cn', NULL, 25, 1);
INSERT INTO `employee` VALUES (273, 'admin1125c-e0cd-45ae-8477-ff99505039ec', 'admin1125c-e0cd-45ae-8477-ff99505039ec', 'amdin11@itsource.cn', NULL, 25, 1);
INSERT INTO `employee` VALUES (274, 'adminf338f', 'adminf338f', 'lsq@itsource.cn', NULL, 25, 1);
INSERT INTO `employee` VALUES (275, 'monkey5003dd03', 'monkey5003dd03', 'amdin1@itsource.cn', NULL, 60, 1);
INSERT INTO `employee` VALUES (276, 'zhangsn12', 'zhangsn12', 'amdin5@itsource.cn', NULL, 25, 2);

-- ----------------------------
-- Table structure for employee_role
-- ----------------------------
DROP TABLE IF EXISTS `employee_role`;
CREATE TABLE `employee_role`  (
  `employee_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`employee_id`, `role_id`) USING BTREE,
  INDEX `FK87184F674D26E00F`(`role_id`) USING BTREE,
  INDEX `FK87184F6710B1828F`(`employee_id`) USING BTREE,
  CONSTRAINT `FK87184F6710B1828F` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK87184F674D26E00F` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee_role
-- ----------------------------
INSERT INTO `employee_role` VALUES (1, 1);
INSERT INTO `employee_role` VALUES (2, 2);
INSERT INTO `employee_role` VALUES (3, 4);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK24897F76799044`(`parent_id`) USING BTREE,
  CONSTRAINT `FK24897F76799044` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '系统管理', NULL, '6.png', NULL);
INSERT INTO `menu` VALUES (2, '角色管理', '/role/index', '6.png', 1);
INSERT INTO `menu` VALUES (3, '菜单管理', '/menu/index', '6.png', 1);
INSERT INTO `menu` VALUES (4, '权限管理', '/permission/index', '6.png', 1);
INSERT INTO `menu` VALUES (5, '导入管理', '/import/index', '6.png', 1);
INSERT INTO `menu` VALUES (6, '组织机构', NULL, '6.png', NULL);
INSERT INTO `menu` VALUES (7, '部门管理', '/department/index', '6.png', 6);
INSERT INTO `menu` VALUES (8, '员工管理', '/employee/index', 'friendgroup.png', 6);
INSERT INTO `menu` VALUES (9, '基础数据', NULL, '6.png', NULL);
INSERT INTO `menu` VALUES (10, '数据字典类型', '/systemdictionarytype/index', '6.png', 9);
INSERT INTO `menu` VALUES (11, '数据字典明细', '/systemdictionarydetail/index', '6.png', 9);
INSERT INTO `menu` VALUES (12, '产品类型', '/producttype/index', '6.png', 9);
INSERT INTO `menu` VALUES (13, '产品管理', '/product/index', '6.png', 9);
INSERT INTO `menu` VALUES (14, '供应商管理', '/supplier/index', '6.png', 9);
INSERT INTO `menu` VALUES (15, '采购模块', NULL, '6.png', NULL);
INSERT INTO `menu` VALUES (16, '采购管理', '/purchasebill/index', '6.png', 15);
INSERT INTO `menu` VALUES (17, '采购报表', '/purchasebillitem/index', '6.png', 15);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `descs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `menu_id`(`menu_id`) USING BTREE,
  CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '添加用户', '/employee/save', NULL, 'employee:save', NULL);
INSERT INTO `permission` VALUES (2, '删除用户', '/employee/delete', NULL, 'employee:delete', NULL);
INSERT INTO `permission` VALUES (3, '修改用户', '/employee/update', NULL, 'employee:update', NULL);
INSERT INTO `permission` VALUES (4, '员工管理', '/employee/index', NULL, 'employee:index', 8);
INSERT INTO `permission` VALUES (5, '用户列表', '/employee/page', NULL, 'employee:page', NULL);
INSERT INTO `permission` VALUES (10, '角色管理', '/role/index', NULL, 'role:index', 2);
INSERT INTO `permission` VALUES (11, '菜单管理', '/menu/index', NULL, 'menu:index', 3);
INSERT INTO `permission` VALUES (12, '权限管理', '/permission/index', NULL, 'permission:index', 4);
INSERT INTO `permission` VALUES (13, '导入管理', '/import', NULL, 'import:*', 5);
INSERT INTO `permission` VALUES (14, '部门管理', '/department/index', NULL, 'department:index', 7);
INSERT INTO `permission` VALUES (15, '数据字典类型', '/systemDictionaryType/index', NULL, 'systemDictionaryType:index', 10);
INSERT INTO `permission` VALUES (16, '数据字典明细', '/systemDictionaryDetail/index', NULL, 'systemDictionaryDetail:index', 11);
INSERT INTO `permission` VALUES (17, '产品类型', '/productType/index', NULL, 'productType:index', 12);
INSERT INTO `permission` VALUES (18, '产品管理', '/product/index', NULL, 'product:index', 13);
INSERT INTO `permission` VALUES (19, '供应商管理', '/supplier/index', NULL, 'supplier:index', 14);
INSERT INTO `permission` VALUES (20, '采购管理', '/purchaseBill/index', NULL, 'purchaseBill:index', 16);
INSERT INTO `permission` VALUES (21, '采购报表', '/purchaseBillItem/index', NULL, 'purchaseBillItem:index', 17);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `smallPic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `costPrice` decimal(19, 2) NULL DEFAULT NULL,
  `salePrice` decimal(19, 2) NULL DEFAULT NULL,
  `types_id` bigint(20) NOT NULL,
  `unit_id` bigint(20) NOT NULL,
  `brand_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK50C664CF8DF77FB5`(`types_id`) USING BTREE,
  INDEX `FK50C664CF422B987E`(`brand_id`) USING BTREE,
  INDEX `FK50C664CF329AED61`(`unit_id`) USING BTREE,
  CONSTRAINT `FK50C664CF329AED61` FOREIGN KEY (`unit_id`) REFERENCES `systemdictionarydetail` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK50C664CF422B987E` FOREIGN KEY (`brand_id`) REFERENCES `systemdictionarydetail` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK50C664CF8DF77FB5` FOREIGN KEY (`types_id`) REFERENCES `producttype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '产品1', '#ff0000', '/uploadImg/cdbb1746-842f-40f4-bdb6-875da2502990.jpg', '/uploadImg/cdbb1746-842f-40f4-bdb6-875da2502990-small.jpg', 1.00, 1.00, 2, 3, 1);
INSERT INTO `product` VALUES (2, '产品2', '#00ff40', '/uploadImg/f8c5e75b-e219-4ef3-af34-a30de48d4f23.jpg', '/uploadImg/f8c5e75b-e219-4ef3-af34-a30de48d4f23-small.jpg', 2.00, 2.00, 7, 4, 2);
INSERT INTO `product` VALUES (12, 'sdf', '#000000', '/uploadImg/9f3de5b8-eda6-41e7-9895-bce7825d7700.png', '/uploadImg/9f3de5b8-eda6-41e7-9895-bce7825d7700-small.png', 23.00, 34.00, 3, 3, 1);

-- ----------------------------
-- Table structure for productstock
-- ----------------------------
DROP TABLE IF EXISTS `productstock`;
CREATE TABLE `productstock`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `num` decimal(19, 2) NULL DEFAULT NULL,
  `amount` decimal(19, 2) NULL DEFAULT NULL,
  `price` decimal(19, 2) NULL DEFAULT NULL,
  `incomeDate` datetime(0) NULL DEFAULT NULL,
  `warning` bit(1) NULL DEFAULT NULL,
  `topNum` decimal(19, 2) NULL DEFAULT NULL,
  `bottomNum` decimal(19, 2) NULL DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `depot_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK459B4B879F064DC5`(`depot_id`) USING BTREE,
  INDEX `FK459B4B87D6A81925`(`product_id`) USING BTREE,
  CONSTRAINT `FK459B4B879F064DC5` FOREIGN KEY (`depot_id`) REFERENCES `depot` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK459B4B87D6A81925` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productstock
-- ----------------------------
INSERT INTO `productstock` VALUES (1, 1.00, 1.00, 1.00, '2018-12-16 23:53:30', b'1', 100.00, 50.00, 1, 1);
INSERT INTO `productstock` VALUES (2, 2.00, 4.00, 2.00, '2018-12-16 23:53:30', b'1', 100.00, 50.00, 2, 1);

-- ----------------------------
-- Table structure for producttype
-- ----------------------------
DROP TABLE IF EXISTS `producttype`;
CREATE TABLE `producttype`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `descs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKA8168A931A015E4`(`parent_id`) USING BTREE,
  CONSTRAINT `FKA8168A931A015E4` FOREIGN KEY (`parent_id`) REFERENCES `producttype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of producttype
-- ----------------------------
INSERT INTO `producttype` VALUES (1, '汽车', '汽车', NULL);
INSERT INTO `producttype` VALUES (2, '奥迪', '奥迪', 1);
INSERT INTO `producttype` VALUES (3, '奔驰', '奔驰', 1);
INSERT INTO `producttype` VALUES (4, '大众', '大众', 1);
INSERT INTO `producttype` VALUES (5, '电视', '电视', NULL);
INSERT INTO `producttype` VALUES (6, '3D电视', '3D电视', 5);
INSERT INTO `producttype` VALUES (7, '液晶电视', '液晶电视', 5);

-- ----------------------------
-- Table structure for purchasebill
-- ----------------------------
DROP TABLE IF EXISTS `purchasebill`;
CREATE TABLE `purchasebill`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vdate` datetime(0) NULL DEFAULT NULL,
  `totalAmount` decimal(19, 2) NULL DEFAULT NULL,
  `totalNum` decimal(19, 2) NULL DEFAULT NULL,
  `inputTime` datetime(0) NULL DEFAULT NULL,
  `auditorTime` datetime(0) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `auditor_id` bigint(20) NULL DEFAULT NULL,
  `inputUser_id` bigint(20) NOT NULL,
  `buyer_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK9BD788C89FE0CD6A`(`buyer_id`) USING BTREE,
  INDEX `FK9BD788C83FF7A83F`(`auditor_id`) USING BTREE,
  INDEX `FK9BD788C8A902BD48`(`inputUser_id`) USING BTREE,
  INDEX `FK9BD788C812C245CF`(`supplier_id`) USING BTREE,
  CONSTRAINT `FK9BD788C812C245CF` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK9BD788C83FF7A83F` FOREIGN KEY (`auditor_id`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK9BD788C89FE0CD6A` FOREIGN KEY (`buyer_id`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK9BD788C8A902BD48` FOREIGN KEY (`inputUser_id`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchasebill
-- ----------------------------
INSERT INTO `purchasebill` VALUES (1, '2015-04-21 00:00:00', 5.00, 3.00, '2015-04-21 21:01:12', NULL, 0, 1, NULL, 1, 1);
INSERT INTO `purchasebill` VALUES (2, '2015-04-23 00:00:00', 22.00, 22.00, '2015-04-21 21:01:27', NULL, 1, 1, NULL, 1, 1);
INSERT INTO `purchasebill` VALUES (3, '2015-04-21 12:00:00', 4.00, 2.00, '2015-04-21 21:01:39', NULL, -1, 2, NULL, 1, 1);
INSERT INTO `purchasebill` VALUES (11, '2018-06-08 00:00:00', 16.00, 8.00, '2018-06-08 19:03:36', NULL, 0, 1, NULL, 1, 4);
INSERT INTO `purchasebill` VALUES (12, '2018-06-07 00:00:00', 98.00, 7.00, '2018-06-12 09:38:11', NULL, 0, 1, NULL, 1, 8);
INSERT INTO `purchasebill` VALUES (16, '2018-07-02 00:00:00', 990.00, 30.00, '2018-07-09 09:44:08', NULL, 0, 2, NULL, 1, 12);
INSERT INTO `purchasebill` VALUES (19, '2018-07-04 00:00:00', 266.00, 33.00, '2018-07-09 14:09:39', NULL, 0, 1, NULL, 1, 12);
INSERT INTO `purchasebill` VALUES (22, '2018-10-18 00:00:00', 74.00, 3.00, '2018-10-18 12:45:11', NULL, 0, 2, NULL, 1, 4);
INSERT INTO `purchasebill` VALUES (23, '2018-11-27 00:00:00', 26.00, 4.00, '2018-11-27 21:14:53', NULL, 0, 1, NULL, 1, 4);
INSERT INTO `purchasebill` VALUES (24, '2018-11-20 00:00:00', 275.00, 25.00, '2018-11-27 21:31:27', NULL, 0, 2, NULL, 1, 12);
INSERT INTO `purchasebill` VALUES (27, '2018-12-16 00:00:00', 43.00, 25.00, '2018-12-16 19:46:53', NULL, 0, 1, NULL, 1, 4);
INSERT INTO `purchasebill` VALUES (28, '2018-12-16 00:00:00', 43.00, 25.00, '2018-12-16 19:46:53', NULL, 0, 1, NULL, 1, 4);

-- ----------------------------
-- Table structure for purchasebillitem
-- ----------------------------
DROP TABLE IF EXISTS `purchasebillitem`;
CREATE TABLE `purchasebillitem`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` decimal(19, 2) NULL DEFAULT NULL,
  `num` decimal(19, 2) NULL DEFAULT NULL,
  `amount` decimal(19, 2) NULL DEFAULT NULL,
  `descs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `bill_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5FF8D3FBD6A81925`(`product_id`) USING BTREE,
  INDEX `FK5FF8D3FB60931610`(`bill_id`) USING BTREE,
  CONSTRAINT `FK5FF8D3FB60931610` FOREIGN KEY (`bill_id`) REFERENCES `purchasebill` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5FF8D3FBD6A81925` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchasebillitem
-- ----------------------------
INSERT INTO `purchasebillitem` VALUES (1, 1.00, 1.00, 1.00, '1', 1, 1);
INSERT INTO `purchasebillitem` VALUES (2, 2.00, 2.00, 4.00, '', 2, 1);
INSERT INTO `purchasebillitem` VALUES (3, 1.00, 11.00, 11.00, '', 1, 2);
INSERT INTO `purchasebillitem` VALUES (4, 1.00, 11.00, 11.00, '', 1, 2);
INSERT INTO `purchasebillitem` VALUES (5, 2.00, 2.00, 4.00, '', 2, 3);
INSERT INTO `purchasebillitem` VALUES (7, 2.00, 3.00, 6.00, '', 2, 11);
INSERT INTO `purchasebillitem` VALUES (8, 2.00, 5.00, 10.00, '', 2, 11);
INSERT INTO `purchasebillitem` VALUES (37, 2.00, 3.00, 6.00, '', 2, 12);
INSERT INTO `purchasebillitem` VALUES (38, 23.00, 4.00, 92.00, '', 12, 12);
INSERT INTO `purchasebillitem` VALUES (41, 33.00, 30.00, 990.00, '', 2, 16);
INSERT INTO `purchasebillitem` VALUES (45, 2.00, 23.00, 46.00, 'fsdfsdf', 2, 19);
INSERT INTO `purchasebillitem` VALUES (46, 22.00, 10.00, 220.00, 'sdfaf', 1, 19);
INSERT INTO `purchasebillitem` VALUES (53, 34.00, 1.00, 34.00, '', 1, 22);
INSERT INTO `purchasebillitem` VALUES (54, 20.00, 2.00, 40.00, '', 2, 22);
INSERT INTO `purchasebillitem` VALUES (55, 11.00, 2.00, 22.00, '11', 1, 23);
INSERT INTO `purchasebillitem` VALUES (56, 2.00, 2.00, 4.00, '1222', 2, 23);
INSERT INTO `purchasebillitem` VALUES (63, 11.00, 2.00, 22.00, '11', 2, 24);
INSERT INTO `purchasebillitem` VALUES (64, 11.00, 23.00, 253.00, '11', 12, 24);
INSERT INTO `purchasebillitem` VALUES (65, 10.00, 2.00, 20.00, '1212', 2, 27);
INSERT INTO `purchasebillitem` VALUES (66, 1.00, 23.00, 23.00, '213', 12, 27);
INSERT INTO `purchasebillitem` VALUES (67, 10.00, 2.00, 20.00, '1212', 2, 28);
INSERT INTO `purchasebillitem` VALUES (68, 1.00, 23.00, 23.00, '213', 12, 28);

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `descs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1, '用户添加', '/employee/save', '用户添加');
INSERT INTO `resource` VALUES (2, '用户页面访问', '/employee/index', '是否能够进入访问用户的页面');
INSERT INTO `resource` VALUES (3, '用户分页数据', '/employee/page', '查询分页的数据');
INSERT INTO `resource` VALUES (4, '用户修改', '/employee/update', '用户修改');
INSERT INTO `resource` VALUES (5, '用户删除', '/employee/delete', '用户删除');
INSERT INTO `resource` VALUES (6, '检查用户名', '/employee/checkUsername', '检查用户名');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', 'admin');
INSERT INTO `role` VALUES (2, '角色管理员', 'guest');
INSERT INTO `role` VALUES (4, '人事部', 'renShiBu');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `FK1404278833B84B6F`(`menu_id`) USING BTREE,
  INDEX `FK140427884D26E00F`(`role_id`) USING BTREE,
  CONSTRAINT `FK1404278833B84B6F` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK140427884D26E00F` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (1, 1);
INSERT INTO `role_menu` VALUES (2, 1);
INSERT INTO `role_menu` VALUES (1, 2);
INSERT INTO `role_menu` VALUES (2, 2);
INSERT INTO `role_menu` VALUES (1, 3);
INSERT INTO `role_menu` VALUES (1, 4);
INSERT INTO `role_menu` VALUES (1, 5);
INSERT INTO `role_menu` VALUES (1, 6);
INSERT INTO `role_menu` VALUES (1, 7);
INSERT INTO `role_menu` VALUES (1, 8);
INSERT INTO `role_menu` VALUES (1, 9);
INSERT INTO `role_menu` VALUES (1, 10);
INSERT INTO `role_menu` VALUES (1, 11);
INSERT INTO `role_menu` VALUES (1, 12);
INSERT INTO `role_menu` VALUES (1, 13);
INSERT INTO `role_menu` VALUES (1, 14);
INSERT INTO `role_menu` VALUES (1, 15);
INSERT INTO `role_menu` VALUES (1, 16);
INSERT INTO `role_menu` VALUES (1, 17);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `FKAEE599B74D26E00F`(`role_id`) USING BTREE,
  INDEX `FKAEE599B7C854068F`(`permission_id`) USING BTREE,
  CONSTRAINT `FKAEE599B74D26E00F` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKAEE599B7C854068F` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 1);
INSERT INTO `role_permission` VALUES (1, 3);
INSERT INTO `role_permission` VALUES (1, 4);
INSERT INTO `role_permission` VALUES (1, 5);
INSERT INTO `role_permission` VALUES (1, 10);
INSERT INTO `role_permission` VALUES (1, 11);
INSERT INTO `role_permission` VALUES (1, 12);
INSERT INTO `role_permission` VALUES (1, 13);
INSERT INTO `role_permission` VALUES (1, 14);
INSERT INTO `role_permission` VALUES (1, 15);
INSERT INTO `role_permission` VALUES (1, 16);
INSERT INTO `role_permission` VALUES (1, 17);
INSERT INTO `role_permission` VALUES (1, 18);
INSERT INTO `role_permission` VALUES (1, 19);
INSERT INTO `role_permission` VALUES (1, 20);
INSERT INTO `role_permission` VALUES (1, 21);
INSERT INTO `role_permission` VALUES (2, 10);
INSERT INTO `role_permission` VALUES (4, 1);
INSERT INTO `role_permission` VALUES (4, 3);
INSERT INTO `role_permission` VALUES (4, 4);
INSERT INTO `role_permission` VALUES (4, 5);

-- ----------------------------
-- Table structure for stockincomebill
-- ----------------------------
DROP TABLE IF EXISTS `stockincomebill`;
CREATE TABLE `stockincomebill`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vdate` datetime(0) NULL DEFAULT NULL,
  `totalAmount` decimal(19, 2) NULL DEFAULT NULL,
  `totalNum` decimal(19, 2) NULL DEFAULT NULL,
  `inputTime` datetime(0) NULL DEFAULT NULL,
  `auditorTime` datetime(0) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `auditor_id` bigint(20) NULL DEFAULT NULL,
  `inputUser_id` bigint(20) NOT NULL,
  `keeper_id` bigint(20) NOT NULL,
  `depot_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK54AC64E69F064DC5`(`depot_id`) USING BTREE,
  INDEX `FK54AC64E63FF7A83F`(`auditor_id`) USING BTREE,
  INDEX `FK54AC64E6A902BD48`(`inputUser_id`) USING BTREE,
  INDEX `FK54AC64E6725F67CB`(`keeper_id`) USING BTREE,
  INDEX `FK54AC64E612C245CF`(`supplier_id`) USING BTREE,
  CONSTRAINT `FK54AC64E612C245CF` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK54AC64E63FF7A83F` FOREIGN KEY (`auditor_id`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK54AC64E6725F67CB` FOREIGN KEY (`keeper_id`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK54AC64E69F064DC5` FOREIGN KEY (`depot_id`) REFERENCES `depot` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK54AC64E6A902BD48` FOREIGN KEY (`inputUser_id`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stockincomebill
-- ----------------------------
INSERT INTO `stockincomebill` VALUES (1, '2018-11-28 13:00:47', 5.00, 3.00, '2018-11-28 13:00:47', '2018-12-16 23:53:30', 1, 2, 1, 1, 2, 1);

-- ----------------------------
-- Table structure for stockincomebillitem
-- ----------------------------
DROP TABLE IF EXISTS `stockincomebillitem`;
CREATE TABLE `stockincomebillitem`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` decimal(19, 2) NULL DEFAULT NULL,
  `num` decimal(19, 2) NULL DEFAULT NULL,
  `amount` decimal(19, 2) NULL DEFAULT NULL,
  `descs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `bill_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKACA67119D6A81925`(`product_id`) USING BTREE,
  INDEX `FKACA671192B5E3024`(`bill_id`) USING BTREE,
  CONSTRAINT `FKACA671192B5E3024` FOREIGN KEY (`bill_id`) REFERENCES `stockincomebill` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKACA67119D6A81925` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stockincomebillitem
-- ----------------------------
INSERT INTO `stockincomebillitem` VALUES (1, 1.00, 1.00, 1.00, '备注1', 1, 1);
INSERT INTO `stockincomebillitem` VALUES (2, 2.00, 2.00, 4.00, '备注2', 2, 1);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, '成都供应商');
INSERT INTO `supplier` VALUES (2, '东莞供应商');

-- ----------------------------
-- Table structure for systemdictionarydetail
-- ----------------------------
DROP TABLE IF EXISTS `systemdictionarydetail`;
CREATE TABLE `systemdictionarydetail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `types_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK81BC50F6718C93B5`(`types_id`) USING BTREE,
  CONSTRAINT `FK81BC50F6718C93B5` FOREIGN KEY (`types_id`) REFERENCES `systemdictionarytype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of systemdictionarydetail
-- ----------------------------
INSERT INTO `systemdictionarydetail` VALUES (1, '七匹狼', 1);
INSERT INTO `systemdictionarydetail` VALUES (2, '耐克', 1);
INSERT INTO `systemdictionarydetail` VALUES (3, '条', 2);
INSERT INTO `systemdictionarydetail` VALUES (4, '斤', 2);

-- ----------------------------
-- Table structure for systemdictionarytype
-- ----------------------------
DROP TABLE IF EXISTS `systemdictionarytype`;
CREATE TABLE `systemdictionarytype`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sn`(`sn`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of systemdictionarytype
-- ----------------------------
INSERT INTO `systemdictionarytype` VALUES (1, 'productBrand', '产品品牌');
INSERT INTO `systemdictionarytype` VALUES (2, 'productUnit', '产品单位');

SET FOREIGN_KEY_CHECKS = 1;
