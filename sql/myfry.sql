/*
 Navicat Premium Data Transfer

 Source Server         : 本机(MySQL5 端口3306 密码12345678)
 Source Server Type    : MySQL
 Source Server Version : 50532
 Source Host           : localhost:3306
 Source Schema         : myfry

 Target Server Type    : MySQL
 Target Server Version : 50532
 File Encoding         : 65001

 Date: 03/12/2020 18:43:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for authorities
-- ----------------------------
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of authorities
-- ----------------------------
INSERT INTO `authorities` VALUES (1, 'ROLE_USER', 'www');
INSERT INTO `authorities` VALUES (2, 'ROLE_USER', '111');

-- ----------------------------
-- Table structure for file_meta
-- ----------------------------
DROP TABLE IF EXISTS `file_meta`;
CREATE TABLE `file_meta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `need_thumb` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scanned` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `garbage_id` bigint(20) NULL DEFAULT NULL,
  `share_filemeta_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK37aidrw2x04lsbv9f6eybk5sl`(`garbage_id`) USING BTREE,
  INDEX `FK3as7pye5vwrmuqh9dylyjgqe1`(`share_filemeta_id`) USING BTREE,
  CONSTRAINT `FK3as7pye5vwrmuqh9dylyjgqe1` FOREIGN KEY (`share_filemeta_id`) REFERENCES `share` (`filemeta_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK37aidrw2x04lsbv9f6eybk5sl` FOREIGN KEY (`garbage_id`) REFERENCES `garbage` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of file_meta
-- ----------------------------

-- ----------------------------
-- Table structure for friendship
-- ----------------------------
DROP TABLE IF EXISTS `friendship`;
CREATE TABLE `friendship`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `followee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `follower` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of friendship
-- ----------------------------

-- ----------------------------
-- Table structure for garbage
-- ----------------------------
DROP TABLE IF EXISTS `garbage`;
CREATE TABLE `garbage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deletetime` datetime NULL DEFAULT NULL,
  `erasetime` datetime NULL DEFAULT NULL,
  `garbage_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKcf4nhajsktk7tvs5l1x9pqggg`(`garbage_id`) USING BTREE,
  CONSTRAINT `FKcf4nhajsktk7tvs5l1x9pqggg` FOREIGN KEY (`garbage_id`) REFERENCES `file_meta` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of garbage
-- ----------------------------

-- ----------------------------
-- Table structure for offline_task
-- ----------------------------
DROP TABLE IF EXISTS `offline_task`;
CREATE TABLE `offline_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of offline_task
-- ----------------------------

-- ----------------------------
-- Table structure for share
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share`  (
  `filemeta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime NULL DEFAULT NULL,
  `expire` datetime NULL DEFAULT NULL,
  `likes` bigint(20) NOT NULL,
  `share_filemeta_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`filemeta_id`) USING BTREE,
  INDEX `FKib9en9telp9m997w5jm2ca9xl`(`share_filemeta_id`) USING BTREE,
  CONSTRAINT `FKib9en9telp9m997w5jm2ca9xl` FOREIGN KEY (`share_filemeta_id`) REFERENCES `file_meta` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of share
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enc` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plain` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('111', 'E_wsq@vcarecity.com', 'Y', NULL, '123456', NULL);
INSERT INTO `users` VALUES ('wsq', 'wsq@msn.com', '1', '1', '123456', '1');
INSERT INTO `users` VALUES ('www', 'E_wsq@vcarecity.com', 'Y', NULL, '123456', NULL);

SET FOREIGN_KEY_CHECKS = 1;
