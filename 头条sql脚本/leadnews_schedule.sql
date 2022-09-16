/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : leadnews_schedule

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 16/09/2022 19:39:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for taskinfo
-- ----------------------------
DROP TABLE IF EXISTS `taskinfo`;
CREATE TABLE `taskinfo`  (
  `task_id` bigint(0) NOT NULL COMMENT '任务id',
  `execute_time` datetime(3) NOT NULL COMMENT '执行时间',
  `parameters` longblob NULL COMMENT '参数',
  `priority` int(0) NOT NULL COMMENT '优先级',
  `task_type` int(0) NOT NULL COMMENT '任务类型',
  PRIMARY KEY (`task_id`) USING BTREE,
  INDEX `index_taskinfo_time`(`task_type`, `priority`, `execute_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of taskinfo
-- ----------------------------

-- ----------------------------
-- Table structure for taskinfo_logs
-- ----------------------------
DROP TABLE IF EXISTS `taskinfo_logs`;
CREATE TABLE `taskinfo_logs`  (
  `task_id` bigint(0) NOT NULL COMMENT '任务id',
  `execute_time` datetime(3) NOT NULL COMMENT '执行时间',
  `parameters` longblob NULL COMMENT '参数',
  `priority` int(0) NOT NULL COMMENT '优先级',
  `task_type` int(0) NOT NULL COMMENT '任务类型',
  `version` int(0) NOT NULL COMMENT '版本号,用乐观锁',
  `status` int(0) NULL DEFAULT 0 COMMENT '状态 0=初始化状态 1=EXECUTED 2=CANCELLED',
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of taskinfo_logs
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
