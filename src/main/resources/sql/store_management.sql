/*
 Navicat Premium Dump SQL

 Source Server         : yuzhouchen
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : localhost:3306
 Source Schema         : store_management

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 02/05/2025 22:51:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `role_id` int NULL DEFAULT NULL COMMENT '角色ID',
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
  `status` int NULL DEFAULT 1 COMMENT '状态：0=停用，1=启用',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序编号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sort_order`(`sort_order` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 203 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (142, 'superadmin1', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员1', '13800010001', 'superadmin1@example.com', 1, '超级管理员', 1, 5, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (143, 'superadmin2', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员2', '13800010002', 'superadmin2@example.com', 1, '超级管理员', 1, 6, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (144, 'superadmin3', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员3', '13800010003', 'superadmin3@example.com', 1, '超级管理员', 1, 7, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (145, 'superadmin4', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员4', '13800010004', 'superadmin4@example.com', 1, '超级管理员', 1, 8, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (146, 'superadmin5', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员5', '13800010005', 'superadmin5@example.com', 1, '超级管理员', 1, 9, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (147, 'superadmin6', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员6', '13800010006', 'superadmin6@example.com', 1, '超级管理员', 1, 10, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (148, 'superadmin7', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员7', '13800010007', 'superadmin7@example.com', 1, '超级管理员', 1, 11, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (149, 'superadmin8', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员8', '13800010008', 'superadmin8@example.com', 1, '超级管理员', 1, 12, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (150, 'superadmin9', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员9', '13800010009', 'superadmin9@example.com', 1, '超级管理员', 1, 13, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (151, 'superadmin10', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员10', '13800010010', 'superadmin10@example.com', 1, '超级管理员', 1, 14, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (152, 'superadmin11', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员11', '13800010011', 'superadmin11@example.com', 1, '超级管理员', 1, 15, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (153, 'superadmin12', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员12', '13800010012', 'superadmin12@example.com', 1, '超级管理员', 1, 16, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (154, 'superadmin13', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员13', '13800010013', 'superadmin13@example.com', 1, '超级管理员', 1, 17, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (155, 'superadmin14', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员14', '13800010014', 'superadmin14@example.com', 1, '超级管理员', 1, 18, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (156, 'superadmin15', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员15', '13800010015', 'superadmin15@example.com', 1, '超级管理员', 1, 19, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (157, 'contentadmin1', 'e10adc3949ba59abbe56e057f20f883e', '内容管理员1', '13800020001', 'contentadmin1@example.com', 2, '内容管理员', 1, 20, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (158, 'contentadmin2', 'e10adc3949ba59abbe56e057f20f883e', '内容管理员2', '13800020002', 'contentadmin2@example.com', 2, '内容管理员', 1, 21, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (159, 'contentadmin3', 'e10adc3949ba59abbe56e057f20f883e', '内容管理员3', '13800020003', 'contentadmin3@example.com', 2, '内容管理员', 1, 22, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (160, 'contentadmin4', 'e10adc3949ba59abbe56e057f20f883e', '内容管理员4', '13800020004', 'contentadmin4@example.com', 2, '内容管理员', 1, 23, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (161, 'contentadmin5', 'e10adc3949ba59abbe56e057f20f883e', '内容管理员5', '13800020005', 'contentadmin5@example.com', 2, '内容管理员', 1, 24, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (162, 'contentadmin6', 'e10adc3949ba59abbe56e057f20f883e', '内容管理员6', '13800020006', 'contentadmin6@example.com', 2, '内容管理员', 1, 25, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (163, 'contentadmin7', 'e10adc3949ba59abbe56e057f20f883e', '内容管理员7', '13800020007', 'contentadmin7@example.com', 2, '内容管理员', 1, 26, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (164, 'contentadmin8', 'e10adc3949ba59abbe56e057f20f883e', '内容管理员8', '13800020008', 'contentadmin8@example.com', 2, '内容管理员', 1, 27, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (165, 'contentadmin9', 'e10adc3949ba59abbe56e057f20f883e', '内容管理员9', '13800020009', 'contentadmin9@example.com', 2, '内容管理员', 1, 28, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (166, 'contentadmin10', 'e10adc3949ba59abbe56e057f20f883e', '内容管理员10', '13800020010', 'contentadmin10@example.com', 2, '内容管理员', 1, 29, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (167, 'contentadmin11', 'e10adc3949ba59abbe56e057f20f883e', '内容管理员11', '13800020011', 'contentadmin11@example.com', 2, '内容管理员', 1, 30, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (168, 'contentadmin12', 'e10adc3949ba59abbe56e057f20f883e', '内容管理员12', '13800020012', 'contentadmin12@example.com', 2, '内容管理员', 1, 31, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (169, 'contentadmin13', 'e10adc3949ba59abbe56e057f20f883e', '内容管理员13', '13800020013', 'contentadmin13@example.com', 2, '内容管理员', 1, 32, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (170, 'contentadmin14', 'e10adc3949ba59abbe56e057f20f883e', '内容管理员14', '13800020014', 'contentadmin14@example.com', 2, '内容管理员', 1, 33, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (171, 'contentadmin15', 'e10adc3949ba59abbe56e057f20f883e', '内容管理员15', '13800020015', 'contentadmin15@example.com', 2, '内容管理员', 1, 34, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (172, 'sysadmin1', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员1', '13800030001', 'sysadmin1@example.com', 3, '系统管理员', 1, 35, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (173, 'sysadmin2', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员2', '13800030002', 'sysadmin2@example.com', 3, '系统管理员', 1, 36, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (174, 'sysadmin3', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员3', '13800030003', 'sysadmin3@example.com', 3, '系统管理员', 1, 37, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (175, 'sysadmin4', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员4', '13800030004', 'sysadmin4@example.com', 3, '系统管理员', 1, 38, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (176, 'sysadmin5', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员5', '13800030005', 'sysadmin5@example.com', 3, '系统管理员', 1, 39, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (177, 'sysadmin6', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员6', '13800030006', 'sysadmin6@example.com', 3, '系统管理员', 1, 40, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (178, 'sysadmin7', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员7', '13800030007', 'sysadmin7@example.com', 3, '系统管理员', 1, 41, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (179, 'sysadmin8', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员8', '13800030008', 'sysadmin8@example.com', 3, '系统管理员', 1, 42, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (180, 'sysadmin9', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员9', '13800030009', 'sysadmin9@example.com', 3, '系统管理员', 1, 43, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (181, 'sysadmin10', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员10', '13800030010', 'sysadmin10@example.com', 3, '系统管理员', 1, 44, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (182, 'sysadmin11', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员11', '13800030011', 'sysadmin11@example.com', 3, '系统管理员', 1, 45, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (183, 'sysadmin12', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员12', '13800030012', 'sysadmin12@example.com', 3, '系统管理员', 1, 46, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (184, 'sysadmin13', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员13', '13800030013', 'sysadmin13@example.com', 3, '系统管理员', 1, 47, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (185, 'sysadmin14', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员14', '13800030014', 'sysadmin14@example.com', 3, '系统管理员', 1, 48, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (186, 'sysadmin15', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员15', '13800030015', 'sysadmin15@example.com', 3, '系统管理员', 1, 49, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (187, 'useradmin1', 'e10adc3949ba59abbe56e057f20f883e', '用户管理员1', '13800040001', 'useradmin1@example.com', 4, '用户管理员', 1, 50, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (188, 'useradmin2', 'e10adc3949ba59abbe56e057f20f883e', '用户管理员2', '13800040002', 'useradmin2@example.com', 4, '用户管理员', 1, 51, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (189, 'useradmin3', 'e10adc3949ba59abbe56e057f20f883e', '用户管理员3', '13800040003', 'useradmin3@example.com', 4, '用户管理员', 1, 52, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (190, 'useradmin4', 'e10adc3949ba59abbe56e057f20f883e', '用户管理员4', '13800040004', 'useradmin4@example.com', 4, '用户管理员', 1, 53, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (191, 'useradmin5', 'e10adc3949ba59abbe56e057f20f883e', '用户管理员5', '13800040005', 'useradmin5@example.com', 4, '用户管理员', 1, 54, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (192, 'useradmin6', 'e10adc3949ba59abbe56e057f20f883e', '用户管理员6', '13800040006', 'useradmin6@example.com', 4, '用户管理员', 1, 55, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (193, 'useradmin7', 'e10adc3949ba59abbe56e057f20f883e', '用户管理员7', '13800040007', 'useradmin7@example.com', 4, '用户管理员', 1, 56, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (194, 'useradmin8', 'e10adc3949ba59abbe56e057f20f883e', '用户管理员8', '13800040008', 'useradmin8@example.com', 4, '用户管理员', 1, 57, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (195, 'useradmin9', 'e10adc3949ba59abbe56e057f20f883e', '用户管理员9', '13800040009', 'useradmin9@example.com', 4, '用户管理员', 1, 58, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (196, 'useradmin10', 'e10adc3949ba59abbe56e057f20f883e', '用户管理员10', '13800040010', 'useradmin10@example.com', 4, '用户管理员', 1, 59, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (197, 'useradmin11', 'e10adc3949ba59abbe56e057f20f883e', '用户管理员11', '13800040011', 'useradmin11@example.com', 4, '用户管理员', 1, 60, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (198, 'useradmin12', 'e10adc3949ba59abbe56e057f20f883e', '用户管理员12', '13800040012', 'useradmin12@example.com', 4, '用户管理员', 1, 61, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (199, 'useradmin13', 'e10adc3949ba59abbe56e057f20f883e', '用户管理员13', '13800040013', 'useradmin13@example.com', 4, '用户管理员', 1, 62, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (200, 'useradmin14', 'e10adc3949ba59abbe56e057f20f883e', '用户管理员14', '13800040014', 'useradmin14@example.com', 4, '用户管理员', 1, 63, '2025-04-28 10:57:33', '2025-04-28 10:57:33');
INSERT INTO `t_admin` VALUES (201, 'useradmin15', 'e10adc3949ba59abbe56e057f20f883e', '用户管理员15', '13800040015', 'useradmin15@example.com', 4, '用户管理员', 1, 64, '2025-04-28 10:57:33', '2025-04-28 10:57:33');

-- ----------------------------
-- Table structure for t_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role`;
CREATE TABLE `t_admin_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色描述',
  `status` int NULL DEFAULT 1 COMMENT '状态：0=禁用，1=启用',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序编号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '管理员角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin_role
-- ----------------------------
INSERT INTO `t_admin_role` VALUES (1, '超级管理员', '拥有所有权限', 1, 1, '2025-04-28 08:46:50', '2025-04-28 08:46:50');
INSERT INTO `t_admin_role` VALUES (2, '系统管理员', '管理系统基础设置', 1, 2, '2025-04-28 08:46:50', '2025-04-28 08:46:50');
INSERT INTO `t_admin_role` VALUES (3, '内容管理员', '管理内容发布', 1, 3, '2025-04-28 08:46:50', '2025-04-28 08:46:50');
INSERT INTO `t_admin_role` VALUES (4, '用户管理员', '管理用户信息', 1, 4, '2025-04-28 08:46:50', '2025-04-28 08:46:50');

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `category_id` int NOT NULL COMMENT '分类ID',
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文章内容',
  `summary` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章简介',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态：0=待发布，1=显示，2=隐藏',
  `sort_order` int NOT NULL DEFAULT 0 COMMENT '排序顺序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category`(`category_id` ASC) USING BTREE,
  INDEX `idx_sort`(`sort_order` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES (3, '帮助中心服务范围', 1, '帮助中心', '服务范围详细信息。', '服务范围简介', 1, 3, '2025-04-27 16:02:00', '2025-04-27 21:25:05');
INSERT INTO `t_article` VALUES (4, '注册流程说明', 1, '帮助中心', '用户注册流程详解。', '注册流程摘要', 1, 4, '2025-04-27 16:03:00', '2025-04-27 21:23:00');
INSERT INTO `t_article` VALUES (5, '账户安全指南', 1, '帮助中心', '保护账户安全的方法。', '账户安全摘要', 1, 5, '2025-04-27 16:04:00', '2025-04-27 16:04:00');
INSERT INTO `t_article` VALUES (6, '资料修改操作', 1, '帮助中心', '如何修改账户资料。', '资料修改摘要', 1, 6, '2025-04-27 16:05:00', '2025-04-27 16:05:00');
INSERT INTO `t_article` VALUES (7, '帮助中心常见问题', 1, '帮助中心', '帮助中心的常见问题集合。', '帮助中心问题摘要', 1, 7, '2025-04-27 16:06:00', '2025-04-27 16:06:00');
INSERT INTO `t_article` VALUES (8, '常见问题总览', 2, '常见问题', '常见问题汇总内容。', '常见问题简介', 1, 8, '2025-04-27 16:07:00', '2025-04-27 16:07:00');
INSERT INTO `t_article` VALUES (9, '订单问题解答', 2, '常见问题', '订单相关问题解答内容。', '订单问题摘要', 1, 9, '2025-04-27 16:08:00', '2025-04-27 16:08:00');
INSERT INTO `t_article` VALUES (10, '支付问题解答', 2, '常见问题', '支付相关问题解答内容。', '支付问题摘要', 1, 10, '2025-04-27 16:09:00', '2025-04-27 16:09:00');
INSERT INTO `t_article` VALUES (11, '配送问题答疑', 2, '常见问题', '配送相关常见问题。', '配送问题摘要', 1, 11, '2025-04-27 16:10:00', '2025-04-27 16:10:00');
INSERT INTO `t_article` VALUES (12, '账户问题解答', 2, '常见问题', '账户相关常见问题说明。', '账户问题摘要', 1, 12, '2025-04-27 16:11:00', '2025-04-27 16:11:00');
INSERT INTO `t_article` VALUES (13, '退款问题处理', 2, '常见问题', '退款流程及常见问题。', '退款问题摘要', 1, 13, '2025-04-27 16:12:00', '2025-04-27 16:12:00');
INSERT INTO `t_article` VALUES (14, '评价系统说明', 2, '常见问题', '商品评价的相关说明。', '评价系统摘要', 1, 14, '2025-04-27 16:13:00', '2025-04-27 16:13:00');
INSERT INTO `t_article` VALUES (15, '联系客服指南', 3, '客服服务', '如何联系人工客服。', '联系客服摘要', 1, 15, '2025-04-27 16:14:00', '2025-04-27 16:14:00');
INSERT INTO `t_article` VALUES (16, '客服服务时间', 3, '客服服务', '客服具体服务时间段。', '服务时间简介', 1, 16, '2025-04-27 16:15:00', '2025-04-27 16:15:00');
INSERT INTO `t_article` VALUES (17, '智能客服使用', 3, '客服服务', '智能客服功能介绍。', '智能客服摘要', 1, 17, '2025-04-27 16:16:00', '2025-04-27 16:16:00');
INSERT INTO `t_article` VALUES (18, '投诉渠道说明', 3, '客服服务', '如何进行有效投诉。', '投诉渠道摘要', 1, 18, '2025-04-27 16:17:00', '2025-04-27 16:17:00');
INSERT INTO `t_article` VALUES (19, '客服常见问题', 3, '客服服务', '客服日常答疑内容。', '客服问题摘要', 1, 19, '2025-04-27 16:18:00', '2025-04-27 16:18:00');
INSERT INTO `t_article` VALUES (20, '购物流程详解', 4, '购物指南', '购物的完整流程。', '购物流程简介', 1, 20, '2025-04-27 16:19:00', '2025-04-27 16:19:00');
INSERT INTO `t_article` VALUES (21, '下单流程教学', 4, '购物指南', '如何快速下单。', '下单流程摘要', 1, 21, '2025-04-27 16:20:00', '2025-04-27 16:20:00');
INSERT INTO `t_article` VALUES (22, '购物注意事项', 4, '购物指南', '购物时需注意的事项。', '购物注意摘要', 1, 22, '2025-04-27 16:21:00', '2025-04-27 16:21:00');
INSERT INTO `t_article` VALUES (23, '会员购物特权', 4, '购物指南', '会员购物特权说明。', '会员购物摘要', 1, 23, '2025-04-27 16:22:00', '2025-04-27 16:22:00');
INSERT INTO `t_article` VALUES (24, '优惠券使用说明', 4, '购物指南', '如何使用优惠券。', '优惠券摘要', 1, 24, '2025-04-27 16:23:00', '2025-04-27 16:23:00');
INSERT INTO `t_article` VALUES (25, '限时秒杀攻略', 4, '购物指南', '秒杀商品购买技巧。', '秒杀攻略摘要', 1, 25, '2025-04-27 16:24:00', '2025-04-27 16:24:00');
INSERT INTO `t_article` VALUES (26, '积分使用规则', 4, '购物指南', '购物积分使用方法。', '积分规则摘要', 1, 26, '2025-04-27 16:25:00', '2025-04-27 16:25:00');
INSERT INTO `t_article` VALUES (27, '配送方式介绍', 5, '配送方式', '多种配送方式详细介绍。', '配送方式摘要', 1, 27, '2025-04-27 16:26:00', '2025-04-27 16:26:00');
INSERT INTO `t_article` VALUES (28, '快速配送服务', 5, '配送方式', '快速送达服务介绍。', '快速配送摘要', 1, 28, '2025-04-27 16:27:00', '2025-04-27 16:27:00');
INSERT INTO `t_article` VALUES (29, '自提点使用指南', 5, '配送方式', '自提点使用流程说明。', '自提点摘要', 1, 29, '2025-04-27 16:28:00', '2025-04-27 16:28:00');
INSERT INTO `t_article` VALUES (30, '国际配送须知', 5, '配送方式', '国际配送相关事项。', '国际配送摘要', 1, 30, '2025-04-27 16:29:00', '2025-04-27 16:29:00');
INSERT INTO `t_article` VALUES (31, '配送费用标准', 5, '配送方式', '配送费用详细标准。', '配送费用摘要', 1, 31, '2025-04-27 16:30:00', '2025-04-27 16:30:00');
INSERT INTO `t_article` VALUES (32, '特殊商品配送', 5, '配送方式', '特殊商品配送说明。', '特殊商品配送摘要', 1, 32, '2025-04-27 16:31:00', '2025-04-27 16:31:00');
INSERT INTO `t_article` VALUES (33, '支付方式选择', 6, '支付方式', '选择合适支付方式。', '支付方式简介', 1, 33, '2025-04-27 16:32:00', '2025-04-27 16:32:00');
INSERT INTO `t_article` VALUES (34, '银行卡支付流程', 6, '支付方式', '银行卡支付操作步骤。', '银行卡支付摘要', 1, 34, '2025-04-27 16:33:00', '2025-04-27 16:33:00');
INSERT INTO `t_article` VALUES (35, '第三方支付使用', 6, '支付方式', '使用支付宝、微信支付指南。', '第三方支付摘要', 1, 35, '2025-04-27 16:34:00', '2025-04-27 16:34:00');
INSERT INTO `t_article` VALUES (36, '支付常见问题', 6, '支付方式', '支付过程中的常见问题。', '支付问题摘要', 1, 36, '2025-04-27 16:35:00', '2025-04-27 16:35:00');
INSERT INTO `t_article` VALUES (37, '退款支付渠道', 6, '支付方式', '退款支持的支付渠道列表。', '退款渠道摘要', 1, 37, '2025-04-27 16:36:00', '2025-04-27 16:36:00');
INSERT INTO `t_article` VALUES (38, '支付安全说明', 6, '支付方式', '支付安全保障措施。', '支付安全摘要', 1, 38, '2025-04-27 16:37:00', '2025-04-27 16:37:00');
INSERT INTO `t_article` VALUES (39, '特色服务介绍', 7, '特色服务', '平台特色服务一览。', '特色服务简介', 1, 39, '2025-04-27 16:38:00', '2025-04-27 16:38:00');
INSERT INTO `t_article` VALUES (40, '增值服务项目', 7, '特色服务', '可选增值服务详情。', '增值服务摘要', 1, 40, '2025-04-27 16:39:00', '2025-04-27 16:39:00');
INSERT INTO `t_article` VALUES (41, '会员专属特权', 7, '特色服务', '会员专属权益说明。', '会员特权摘要', 1, 41, '2025-04-27 16:40:00', '2025-04-27 16:40:00');
INSERT INTO `t_article` VALUES (42, '礼品卡使用指南', 7, '特色服务', '如何使用礼品卡。', '礼品卡摘要', 1, 42, '2025-04-27 16:41:00', '2025-04-27 16:41:00');
INSERT INTO `t_article` VALUES (43, '定制服务介绍', 7, '特色服务', '个性化定制服务详情。', '定制服务摘要', 1, 43, '2025-04-27 16:42:00', '2025-04-27 16:42:00');
INSERT INTO `t_article` VALUES (44, '积分兑换服务', 7, '特色服务', '如何使用积分兑换。', '积分兑换摘要', 1, 44, '2025-04-27 16:43:00', '2025-04-27 16:43:00');
INSERT INTO `t_article` VALUES (45, '售后服务范围', 8, '售后服务', '售后服务包含哪些内容。', '售后服务简介', 1, 45, '2025-04-27 16:44:00', '2025-04-27 16:44:00');
INSERT INTO `t_article` VALUES (46, '退换货流程', 8, '售后服务', '退换货详细操作流程。', '退换货摘要', 1, 46, '2025-04-27 16:45:00', '2025-04-27 16:45:00');
INSERT INTO `t_article` VALUES (47, '维修服务指南', 8, '售后服务', '产品维修流程及注意事项。', '维修服务摘要', 1, 47, '2025-04-27 16:46:00', '2025-04-27 16:46:00');
INSERT INTO `t_article` VALUES (48, '质保政策说明', 8, '售后服务', '商品质保政策详情。', '质保政策摘要', 1, 48, '2025-04-27 16:47:00', '2025-04-27 16:47:00');
INSERT INTO `t_article` VALUES (49, '退货注意事项', 8, '售后服务', '退货过程中需注意的事项。', '退货注意摘要', 1, 49, '2025-04-27 16:48:00', '2025-04-27 16:48:00');
INSERT INTO `t_article` VALUES (50, '售后处理时间', 8, '售后服务', '售后处理需要的时间说明。', '售后时间摘要', 1, 50, '2025-04-27 16:49:00', '2025-04-27 16:49:00');
INSERT INTO `t_article` VALUES (51, '售后政策总览', 8, '售后服务', '平台售后政策详细介绍。', '售后政策摘要', 1, 51, '2025-04-27 16:50:00', '2025-04-27 16:50:00');
INSERT INTO `t_article` VALUES (52, '申请售后服务', 8, '售后服务', '如何申请售后服务。', '申请售后摘要', 1, 52, '2025-04-27 16:51:00', '2025-04-27 16:51:00');
INSERT INTO `t_article` VALUES (53, '换货流程指引', 8, '售后服务', '换货的完整流程说明。', '换货流程摘要', 1, 53, '2025-04-27 16:52:00', '2025-04-27 16:52:00');
INSERT INTO `t_article` VALUES (54, '商品维修须知', 8, '售后服务', '维修商品前的注意事项。', '维修须知摘要', 1, 54, '2025-04-27 16:53:00', '2025-04-27 16:53:00');
INSERT INTO `t_article` VALUES (55, '售后案例分享', 8, '售后服务', '售后成功案例分享。', '售后案例摘要', 1, 55, '2025-04-27 16:54:00', '2025-04-27 16:54:00');
INSERT INTO `t_article` VALUES (56, '售后服务流程', 8, '售后服务', '售后服务处理的详细流程。', '售后流程摘要', 1, 56, '2025-04-27 16:55:00', '2025-04-27 16:55:00');
INSERT INTO `t_article` VALUES (57, '售后保障政策', 8, '售后服务', '平台的售后保障政策。', '售后保障摘要', 1, 57, '2025-04-27 16:56:00', '2025-04-27 16:56:00');
INSERT INTO `t_article` VALUES (58, '延长质保服务', 8, '售后服务', '延长质保的具体介绍。', '延长质保摘要', 1, 58, '2025-04-27 16:57:00', '2025-04-27 16:57:00');
INSERT INTO `t_article` VALUES (59, '快速售后通道', 8, '售后服务', '快速售后申请流程。', '快速售后摘要', 1, 59, '2025-04-27 16:58:00', '2025-04-27 16:58:00');

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '产品名称',
  `category_id` int NOT NULL COMMENT '分类ID',
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `original_price` decimal(10, 2) NOT NULL COMMENT '原价格',
  `current_price` decimal(10, 2) NOT NULL COMMENT '现价',
  `region` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地区/国家',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '产品描述',
  `status` int NOT NULL DEFAULT 0 COMMENT '状态：0=待审核，1=通过，2=拒绝',
  `sort_order` int NOT NULL COMMENT '排序编号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category`(`category_id` ASC) USING BTREE,
  INDEX `idx_sort_order`(`sort_order` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '产品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES (1, '新鲜苹果', 1, '蔬菜水果', 10.00, 8.50, '中国', '新鲜红富士苹果', 1, 1001, '2025-04-27 16:45:54', '2025-04-27 20:48:53');
INSERT INTO `t_product` VALUES (2, '小米手机', 2, '手机数码', 1999.00, 1799.00, '中国', '小米最新款手机', 1, 1002, '2025-04-27 16:45:54', '2025-04-27 16:45:54');
INSERT INTO `t_product` VALUES (3, '牛仔裤', 4, '服装鞋帽', 299.00, 199.00, '美国', '经典款牛仔裤', 1, 1003, '2025-04-27 16:45:54', '2025-04-27 16:45:54');
INSERT INTO `t_product` VALUES (4, '智能手环', 2, '手机数码', 299.00, 249.00, '中国', '最新款智能手环', 1, 1004, '2025-04-27 16:46:00', '2025-04-27 16:46:00');
INSERT INTO `t_product` VALUES (5, '苹果耳机', 2, '手机数码', 1299.00, 1099.00, '美国', 'AirPods Pro耳机', 1, 1005, '2025-04-27 16:46:05', '2025-04-27 16:46:05');
INSERT INTO `t_product` VALUES (6, '蓝莓', 1, '蔬菜水果', 35.00, 28.00, '美国', '新鲜进口蓝莓', 1, 1006, '2025-04-27 16:46:10', '2025-04-27 16:46:10');
INSERT INTO `t_product` VALUES (7, '机械键盘', 3, '电脑配件', 699.00, 599.00, '中国', 'RGB灯光机械键盘', 1, 1007, '2025-04-27 16:46:15', '2025-04-27 16:46:15');
INSERT INTO `t_product` VALUES (8, '可调鼠标垫', 3, '电脑配件', 199.00, 179.00, '中国', '高度可调节鼠标垫', 1, 1008, '2025-04-27 16:46:20', '2025-04-27 16:46:20');
INSERT INTO `t_product` VALUES (9, 'T恤衫', 4, '服装鞋帽', 199.00, 149.00, '美国', '舒适圆领T恤衫', 1, 1009, '2025-04-27 16:46:25', '2025-04-27 16:46:25');
INSERT INTO `t_product` VALUES (10, '运动鞋', 4, '服装鞋帽', 499.00, 399.00, '中国', '时尚跑步运动鞋', 1, 1010, '2025-04-27 16:46:30', '2025-04-27 16:46:30');
INSERT INTO `t_product` VALUES (11, '橙子', 1, '蔬菜水果', 25.00, 20.00, '西班牙', '进口新鲜橙子', 1, 1011, '2025-04-27 16:46:35', '2025-04-27 16:46:35');
INSERT INTO `t_product` VALUES (12, '笔记本电脑', 3, '电脑配件', 5999.00, 5499.00, '中国', '高性能笔记本电脑', 1, 1012, '2025-04-27 16:46:40', '2025-04-27 16:46:40');
INSERT INTO `t_product` VALUES (13, '紫葡萄', 1, '蔬菜水果', 40.00, 30.00, '美国', '进口新鲜紫葡萄', 1, 1013, '2025-04-27 16:46:45', '2025-04-27 16:46:45');
INSERT INTO `t_product` VALUES (14, '手提包', 4, '服装鞋帽', 699.00, 599.00, '法国', '时尚手提包', 1, 1014, '2025-04-27 16:46:50', '2025-04-27 16:46:50');
INSERT INTO `t_product` VALUES (15, '键盘鼠标套装', 3, '电脑配件', 399.00, 349.00, '中国', '无线键盘鼠标套装', 1, 1015, '2025-04-27 16:46:55', '2025-04-27 16:46:55');
INSERT INTO `t_product` VALUES (16, '电动牙刷', 2, '手机数码', 299.00, 249.00, '中国', '高效电动牙刷', 1, 1016, '2025-04-27 16:47:00', '2025-04-27 16:47:00');
INSERT INTO `t_product` VALUES (17, '平板电脑', 2, '手机数码', 2999.00, 2499.00, '中国', '最新款平板电脑', 1, 1017, '2025-04-27 16:47:05', '2025-04-27 16:47:05');
INSERT INTO `t_product` VALUES (18, '便携式音响', 2, '手机数码', 499.00, 399.00, '中国', '蓝牙便携音响', 1, 1018, '2025-04-27 16:47:10', '2025-04-27 16:47:10');
INSERT INTO `t_product` VALUES (19, '耳机', 2, '手机数码', 799.00, 699.00, '韩国', '高品质耳机', 1, 1019, '2025-04-27 16:47:15', '2025-04-27 16:47:15');
INSERT INTO `t_product` VALUES (20, '紫甘蓝', 1, '蔬菜水果', 18.00, 14.50, '中国', '新鲜紫甘蓝', 1, 1020, '2025-04-27 16:47:20', '2025-04-27 16:47:20');
INSERT INTO `t_product` VALUES (21, '男士外套', 4, '服装鞋帽', 599.00, 499.00, '英国', '男士防风外套', 1, 1021, '2025-04-27 16:47:25', '2025-04-27 16:47:25');
INSERT INTO `t_product` VALUES (22, '手机支架', 3, '电脑配件', 99.00, 79.00, '中国', '可调节手机支架', 1, 1022, '2025-04-27 16:47:30', '2025-04-27 16:47:30');
INSERT INTO `t_product` VALUES (23, '南瓜', 1, '蔬菜水果', 12.00, 9.50, '中国', '新鲜南瓜', 1, 1023, '2025-04-27 16:47:35', '2025-04-27 16:47:35');
INSERT INTO `t_product` VALUES (24, '显示器', 3, '电脑配件', 1499.00, 1399.00, '中国', '超高清显示器', 1, 1024, '2025-04-27 16:47:40', '2025-04-27 16:47:40');
INSERT INTO `t_product` VALUES (25, '女性长裙', 4, '服装鞋帽', 399.00, 299.00, '法国', '夏季女性长裙', 1, 1025, '2025-04-27 16:47:45', '2025-04-27 16:47:45');
INSERT INTO `t_product` VALUES (26, '草莓', 1, '蔬菜水果', 30.00, 22.00, '日本', '新鲜草莓', 1, 1026, '2025-04-27 16:47:50', '2025-04-27 16:47:50');
INSERT INTO `t_product` VALUES (27, '蓝牙耳机', 2, '手机数码', 999.00, 849.00, '中国', '高性能蓝牙耳机', 1, 1027, '2025-04-27 16:47:55', '2025-04-27 16:47:55');
INSERT INTO `t_product` VALUES (28, '电热水壶', 3, '电脑配件', 199.00, 169.00, '中国', '电热水壶，快速加热', 1, 1028, '2025-04-27 16:48:00', '2025-04-27 16:48:00');
INSERT INTO `t_product` VALUES (29, '家用打印机', 3, '电脑配件', 899.00, 799.00, '中国', '无线家用打印机', 1, 1029, '2025-04-27 16:48:05', '2025-04-27 16:48:05');
INSERT INTO `t_product` VALUES (30, '男士牛仔裤', 4, '服装鞋帽', 399.00, 299.00, '美国', '时尚男士牛仔裤', 1, 1030, '2025-04-27 16:48:10', '2025-04-27 16:48:10');
INSERT INTO `t_product` VALUES (31, '红枣', 1, '蔬菜水果', 25.00, 20.00, '中国', '新鲜红枣', 1, 1031, '2025-04-27 16:48:15', '2025-04-27 16:48:15');
INSERT INTO `t_product` VALUES (32, '蓝牙音响', 2, '手机数码', 399.00, 299.00, '中国', '高质量蓝牙音响', 1, 1032, '2025-04-27 16:48:20', '2025-04-27 16:48:20');
INSERT INTO `t_product` VALUES (33, '女性T恤', 4, '服装鞋帽', 149.00, 99.00, '中国', '简约设计女性T恤', 1, 1033, '2025-04-27 16:48:25', '2025-04-27 16:48:25');
INSERT INTO `t_product` VALUES (34, '苹果手机', 2, '手机数码', 6999.00, 6499.00, '美国', 'iPhone 14 Pro', 1, 1034, '2025-04-27 16:48:30', '2025-04-27 16:48:30');
INSERT INTO `t_product` VALUES (35, '电饭锅', 3, '电脑配件', 499.00, 399.00, '中国', '智能电饭锅', 1, 1035, '2025-04-27 16:48:35', '2025-04-27 16:48:35');
INSERT INTO `t_product` VALUES (36, '秋冬外套', 4, '服装鞋帽', 799.00, 649.00, '意大利', '经典秋冬外套', 1, 1036, '2025-04-27 16:48:40', '2025-04-27 16:48:40');
INSERT INTO `t_product` VALUES (37, '柠檬', 1, '蔬菜水果', 15.00, 12.00, '中国', '新鲜柠檬', 1, 1037, '2025-04-27 16:48:45', '2025-04-27 16:48:45');
INSERT INTO `t_product` VALUES (38, '冬季靴子', 4, '服装鞋帽', 499.00, 399.00, '中国', '保暖冬季靴子', 1, 1038, '2025-04-27 16:48:50', '2025-04-27 16:48:50');
INSERT INTO `t_product` VALUES (39, '内存条', 3, '电脑配件', 249.00, 199.00, '中国', '高性能内存条', 1, 1039, '2025-04-27 16:48:55', '2025-04-27 16:48:55');
INSERT INTO `t_product` VALUES (40, '女士鞋子', 4, '服装鞋帽', 299.00, 249.00, '意大利', '舒适女士鞋子', 1, 1040, '2025-04-27 16:49:00', '2025-04-27 16:49:00');
INSERT INTO `t_product` VALUES (41, '草莓', 1, '蔬菜水果', 28.00, 22.50, '中国', '新鲜草莓', 1, 1041, '2025-04-27 16:49:05', '2025-04-27 16:49:05');
INSERT INTO `t_product` VALUES (42, '壁挂电视', 3, '电脑配件', 3999.00, 3499.00, '韩国', '超薄壁挂电视', 1, 1042, '2025-04-27 16:49:10', '2025-04-27 16:49:10');
INSERT INTO `t_product` VALUES (43, '男士长袖衬衫', 4, '服装鞋帽', 249.00, 199.00, '中国', '男士长袖衬衫', 1, 1043, '2025-04-27 16:49:15', '2025-04-27 16:49:15');
INSERT INTO `t_product` VALUES (44, '移动硬盘', 3, '电脑配件', 799.00, 699.00, '中国', '1TB移动硬盘', 1, 1044, '2025-04-27 16:49:20', '2025-04-27 16:49:20');
INSERT INTO `t_product` VALUES (45, '手提包', 4, '服装鞋帽', 499.00, 399.00, '意大利', '经典手提包', 1, 1045, '2025-04-27 16:49:25', '2025-04-27 16:49:25');
INSERT INTO `t_product` VALUES (46, '西瓜', 1, '蔬菜水果', 35.00, 25.00, '中国', '新鲜西瓜', 1, 1046, '2025-04-27 16:49:30', '2025-04-27 16:49:30');
INSERT INTO `t_product` VALUES (47, '耳罩耳机', 2, '手机数码', 899.00, 799.00, '美国', '无线耳罩耳机', 1, 1047, '2025-04-27 16:49:35', '2025-04-27 16:49:35');
INSERT INTO `t_product` VALUES (48, '苹果手机', 2, '手机数码', 7999.00, 7499.00, '美国', 'iPhone 13', 1, 1048, '2025-04-27 16:49:40', '2025-04-27 16:49:40');
INSERT INTO `t_product` VALUES (49, '鸡蛋', 1, '蔬菜水果', 12.00, 9.00, '中国', '新鲜鸡蛋', 1, 1049, '2025-04-27 16:49:45', '2025-04-27 16:49:45');
INSERT INTO `t_product` VALUES (50, '塑料杯', 4, '服装鞋帽', 49.00, 39.00, '中国', '便捷塑料杯', 1, 1050, '2025-04-27 16:49:50', '2025-04-27 16:49:50');
INSERT INTO `t_product` VALUES (51, 'LED台灯', 3, '电脑配件', 199.00, 149.00, '中国', '高亮LED台灯', 1, 1051, '2025-04-27 16:49:55', '2025-04-27 16:49:55');
INSERT INTO `t_product` VALUES (52, '手机壳', 2, '手机数码', 59.00, 49.00, '中国', '手机保护壳', 1, 1052, '2025-04-27 16:50:00', '2025-04-27 16:50:00');
INSERT INTO `t_product` VALUES (53, '智能手表', 2, '手机数码', 999.00, 899.00, '中国', '最新款智能手表', 1, 1053, '2025-04-27 16:50:05', '2025-04-27 16:50:05');
INSERT INTO `t_product` VALUES (54, '羽绒服', 4, '服装鞋帽', 799.00, 649.00, '中国', '冬季羽绒服', 1, 1054, '2025-04-27 16:50:10', '2025-04-27 16:50:10');
INSERT INTO `t_product` VALUES (55, '洗发水', 1, '蔬菜水果', 28.00, 22.00, '中国', '高端洗发水', 1, 1055, '2025-04-27 16:50:15', '2025-04-27 16:50:15');
INSERT INTO `t_product` VALUES (56, '篮球鞋', 4, '服装鞋帽', 599.00, 499.00, '美国', '篮球专用运动鞋', 1, 1056, '2025-04-27 16:50:20', '2025-04-27 16:50:20');
INSERT INTO `t_product` VALUES (57, '无线耳机', 2, '手机数码', 799.00, 699.00, '中国', '高品质无线耳机', 1, 1057, '2025-04-27 16:50:25', '2025-04-27 16:50:25');
INSERT INTO `t_product` VALUES (61, '123', 1, '蔬菜水果', 1001.00, 213.00, '美国', '', 1, 1, '2025-04-27 20:58:19', '2025-04-27 21:17:58');

-- ----------------------------
-- Table structure for t_product_category
-- ----------------------------
DROP TABLE IF EXISTS `t_product_category`;
CREATE TABLE `t_product_category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态：0=禁用，1=启用',
  `sort_order` int NOT NULL COMMENT '排序编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '产品分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product_category
-- ----------------------------
INSERT INTO `t_product_category` VALUES (1, '蔬菜水果', 1, 1);
INSERT INTO `t_product_category` VALUES (2, '手机数码', 1, 2);
INSERT INTO `t_product_category` VALUES (3, '电脑配件', 1, 3);
INSERT INTO `t_product_category` VALUES (4, '服装鞋帽', 1, 4);

-- ----------------------------
-- Table structure for t_shop
-- ----------------------------
DROP TABLE IF EXISTS `t_shop`;
CREATE TABLE `t_shop`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商铺名称',
  `category_id` int NOT NULL COMMENT '分类ID',
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `shop_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商铺类型',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商铺描述',
  `status` int NULL DEFAULT 0 COMMENT '0: 待审核, 1: 已通过, 2: 已拒绝',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `sort_order` int NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_shop
-- ----------------------------
INSERT INTO `t_shop` VALUES (1, '泡吧食品旗舰店', 1, '食品类', '企业店铺', '12', 1, '2025-04-25 17:15:51', '2025-04-27 21:27:00', 1);
INSERT INTO `t_shop` VALUES (2, '康健保健品专营店', 2, '保健品类', '企业店铺', '45', 1, '2025-04-25 18:10:22', '2025-04-27 14:01:15', 2);
INSERT INTO `t_shop` VALUES (3, '数码先锋官方店', 3, '数码产品', '企业店铺', '78', 1, '2025-04-25 19:05:33', '2025-04-27 15:22:31', 3);
INSERT INTO `t_shop` VALUES (4, '家之选生活百货', 4, '生活百货', '企业店铺', '23', 1, '2025-04-25 20:17:44', '2025-04-27 16:40:20', 4);
INSERT INTO `t_shop` VALUES (5, '舒眠床品旗舰店', 5, '床上用品', '企业店铺', '34', 1, '2025-04-25 21:11:11', '2025-04-27 17:02:14', 5);
INSERT INTO `t_shop` VALUES (6, '美味食品专卖店', 1, '食品类', '企业店铺', '56', 1, '2025-04-25 22:23:56', '2025-04-27 18:10:05', 6);
INSERT INTO `t_shop` VALUES (7, '养生堂保健品店', 2, '保健品类', '企业店铺', '39', 1, '2025-04-25 23:45:17', '2025-04-27 19:20:15', 7);
INSERT INTO `t_shop` VALUES (8, '数码港数码商城', 3, '数码产品', '企业店铺', '67', 1, '2025-04-26 00:51:28', '2025-04-27 20:11:30', 8);
INSERT INTO `t_shop` VALUES (9, '生活优品百货店', 4, '生活百货', '企业店铺', '21', 1, '2025-04-26 01:32:49', '2025-04-27 20:40:21', 9);
INSERT INTO `t_shop` VALUES (10, '柔软之家床品店', 5, '床上用品', '企业店铺', '88', 1, '2025-04-26 02:15:00', '2025-04-27 21:22:40', 10);
INSERT INTO `t_shop` VALUES (11, '天天美食旗舰店', 1, '食品类', '企业店铺', '19', 1, '2025-04-26 03:21:33', '2025-04-27 22:01:12', 11);
INSERT INTO `t_shop` VALUES (12, '健康优选保健品', 2, '保健品类', '企业店铺', '47', 1, '2025-04-26 04:45:15', '2025-04-27 23:22:00', 12);
INSERT INTO `t_shop` VALUES (13, '极客数码体验店', 3, '数码产品', '企业店铺', '53', 1, '2025-04-26 05:30:22', '2025-04-27 23:45:11', 13);
INSERT INTO `t_shop` VALUES (14, '家居生活便利店', 4, '生活百货', '企业店铺', '25', 1, '2025-04-26 06:15:44', '2025-04-28 00:15:30', 14);
INSERT INTO `t_shop` VALUES (15, '温馨床品专卖店', 5, '床上用品', '企业店铺', '31', 1, '2025-04-26 07:40:19', '2025-04-28 01:10:00', 15);
INSERT INTO `t_shop` VALUES (16, '味道良品食品店', 1, '食品类', '企业店铺', '14', 1, '2025-04-26 08:25:32', '2025-04-28 01:45:20', 16);
INSERT INTO `t_shop` VALUES (17, '自然健康保健馆', 2, '保健品类', '企业店铺', '62', 1, '2025-04-26 09:35:27', '2025-04-28 02:20:10', 17);
INSERT INTO `t_shop` VALUES (18, '未来数码科技店', 3, '数码产品', '企业店铺', '81', 1, '2025-04-26 10:20:55', '2025-04-28 03:01:50', 18);
INSERT INTO `t_shop` VALUES (19, '生活大本营百货', 4, '生活百货', '企业店铺', '36', 1, '2025-04-26 11:10:18', '2025-04-28 03:32:41', 19);
INSERT INTO `t_shop` VALUES (20, '梦享床品生活馆', 5, '床上用品', '企业店铺', '29', 1, '2025-04-26 12:22:40', '2025-04-28 04:10:00', 20);
INSERT INTO `t_shop` VALUES (21, '鲜味坊食品专营店', 1, '食品类', '企业店铺', '54', 1, '2025-04-26 13:30:10', '2025-04-28 05:12:30', 21);
INSERT INTO `t_shop` VALUES (22, '生命之源保健馆', 2, '保健品类', '企业店铺', '67', 1, '2025-04-26 14:15:25', '2025-04-28 05:55:40', 22);
INSERT INTO `t_shop` VALUES (23, '智联数码旗舰店', 3, '数码产品', '企业店铺', '88', 1, '2025-04-26 15:22:45', '2025-04-28 06:30:50', 23);
INSERT INTO `t_shop` VALUES (24, '优生活百货中心', 4, '生活百货', '企业店铺', '34', 1, '2025-04-26 16:05:10', '2025-04-28 07:02:10', 24);
INSERT INTO `t_shop` VALUES (25, '舒适之家床品坊', 5, '床上用品', '企业店铺', '25', 1, '2025-04-26 17:12:33', '2025-04-28 07:40:20', 25);
INSERT INTO `t_shop` VALUES (26, '味蕾美食食品店', 1, '食品类', '企业店铺', '18', 1, '2025-04-26 18:25:44', '2025-04-28 08:10:40', 26);
INSERT INTO `t_shop` VALUES (27, '健康之家保健品', 2, '保健品类', '企业店铺', '49', 1, '2025-04-26 19:05:56', '2025-04-28 08:45:55', 27);
INSERT INTO `t_shop` VALUES (28, '未来数码专卖店', 3, '数码产品', '企业店铺', '77', 1, '2025-04-26 20:11:22', '2025-04-28 09:20:10', 28);
INSERT INTO `t_shop` VALUES (29, '优品生活馆', 4, '生活百货', '企业店铺', '23', 1, '2025-04-26 21:33:10', '2025-04-28 09:55:20', 29);
INSERT INTO `t_shop` VALUES (30, '甜梦床品生活馆', 5, '床上用品', '企业店铺', '46', 1, '2025-04-26 22:45:55', '2025-04-28 10:15:35', 30);
INSERT INTO `t_shop` VALUES (31, '味觉工坊食品店', 1, '食品类', '企业店铺', '35', 1, '2025-04-26 23:55:10', '2025-04-28 10:50:50', 31);
INSERT INTO `t_shop` VALUES (32, '康源保健坊', 2, '保健品类', '企业店铺', '57', 1, '2025-04-27 00:32:45', '2025-04-28 11:21:10', 32);
INSERT INTO `t_shop` VALUES (33, '智能酷玩数码店', 3, '数码产品', '企业店铺', '92', 1, '2025-04-27 01:45:30', '2025-04-28 11:55:30', 33);
INSERT INTO `t_shop` VALUES (34, '时尚生活百货店', 4, '生活百货', '企业店铺', '26', 1, '2025-04-27 02:55:20', '2025-04-28 12:25:40', 34);
INSERT INTO `t_shop` VALUES (35, '美梦成真床品店', 5, '床上用品', '企业店铺', '31', 1, '2025-04-27 03:33:10', '2025-04-28 13:05:55', 35);
INSERT INTO `t_shop` VALUES (36, '美食物语食品专卖', 1, '食品类', '企业店铺', '12', 1, '2025-04-27 04:12:40', '2025-04-28 13:42:10', 36);
INSERT INTO `t_shop` VALUES (37, '自然之选保健品', 2, '保健品类', '企业店铺', '41', 1, '2025-04-27 05:20:50', '2025-04-28 14:10:30', 37);
INSERT INTO `t_shop` VALUES (38, '极致数码专营店', 3, '数码产品', '企业店铺', '68', 1, '2025-04-27 06:35:00', '2025-04-28 14:40:45', 38);
INSERT INTO `t_shop` VALUES (39, '百佳生活百货', 4, '生活百货', '企业店铺', '19', 1, '2025-04-27 07:25:15', '2025-04-28 15:10:00', 39);
INSERT INTO `t_shop` VALUES (40, '悠然床品旗舰店', 5, '床上用品', '企业店铺', '28', 1, '2025-04-27 08:15:20', '2025-04-28 15:50:20', 40);
INSERT INTO `t_shop` VALUES (41, '食尚优选食品店', 1, '食品类', '企业店铺', '16', 1, '2025-04-27 09:25:10', '2025-04-28 16:30:10', 41);
INSERT INTO `t_shop` VALUES (42, '安康保健馆', 2, '保健品类', '企业店铺', '52', 1, '2025-04-27 10:15:22', '2025-04-28 17:01:20', 42);
INSERT INTO `t_shop` VALUES (43, '未来派数码店', 3, '数码产品', '企业店铺', '89', 1, '2025-04-27 11:30:33', '2025-04-28 17:32:40', 43);
INSERT INTO `t_shop` VALUES (44, '幸福生活百货馆', 4, '生活百货', '企业店铺', '31', 1, '2025-04-27 12:45:44', '2025-04-28 18:05:00', 44);
INSERT INTO `t_shop` VALUES (45, '悠梦床品专卖店', 5, '床上用品', '企业店铺', '40', 1, '2025-04-27 13:15:10', '2025-04-28 18:30:20', 45);
INSERT INTO `t_shop` VALUES (46, '鲜味家食品坊', 1, '食品类', '企业店铺', '22', 1, '2025-04-27 14:05:25', '2025-04-28 19:05:30', 46);
INSERT INTO `t_shop` VALUES (47, '绿源保健专营店', 2, '保健品类', '企业店铺', '48', 1, '2025-04-27 15:20:40', '2025-04-28 19:45:50', 47);
INSERT INTO `t_shop` VALUES (48, '智选数码体验馆', 3, '数码产品', '企业店铺', '73', 1, '2025-04-27 16:32:55', '2025-04-28 20:10:10', 48);
INSERT INTO `t_shop` VALUES (49, '优佳生活百货', 4, '生活百货', '企业店铺', '27', 1, '2025-04-27 17:45:00', '2025-04-28 20:40:20', 49);
INSERT INTO `t_shop` VALUES (50, '甜心床品旗舰店', 5, '床上用品', '企业店铺', '36', 1, '2025-04-27 18:55:15', '2025-04-28 21:12:30', 50);
INSERT INTO `t_shop` VALUES (51, '味觉记忆食品馆', 1, '食品类', '企业店铺', '14', 1, '2025-04-27 19:15:20', '2025-04-28 21:45:40', 51);
INSERT INTO `t_shop` VALUES (52, '康体保健品坊', 2, '保健品类', '企业店铺', '55', 1, '2025-04-27 20:22:33', '2025-04-28 22:10:55', 52);
INSERT INTO `t_shop` VALUES (53, '潮玩数码专卖店', 3, '数码产品', '企业店铺', '80', 1, '2025-04-27 21:30:45', '2025-04-28 22:41:10', 53);
INSERT INTO `t_shop` VALUES (54, '家有好货生活馆', 4, '生活百货', '企业店铺', '29', 1, '2025-04-27 22:40:55', '2025-04-28 23:05:25', 54);
INSERT INTO `t_shop` VALUES (55, '暖心之家床品店', 5, '床上用品', '企业店铺', '33', 1, '2025-04-27 23:50:05', '2025-04-28 23:30:40', 55);
INSERT INTO `t_shop` VALUES (56, '风味传承食品店', 1, '食品类', '企业店铺', '19', 1, '2025-04-28 00:15:10', '2025-04-29 00:01:10', 56);
INSERT INTO `t_shop` VALUES (57, '健康管家保健馆', 2, '保健品类', '企业店铺', '59', 1, '2025-04-28 01:25:22', '2025-04-29 00:35:30', 57);
INSERT INTO `t_shop` VALUES (58, '科技先锋数码城', 3, '数码产品', '企业店铺', '84', 1, '2025-04-28 02:35:33', '2025-04-29 01:05:45', 58);

-- ----------------------------
-- Table structure for t_shop_category
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_category`;
CREATE TABLE `t_shop_category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序',
  `status` int NULL DEFAULT 1 COMMENT '状态 0:禁用, 1:启用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_shop_category
-- ----------------------------
INSERT INTO `t_shop_category` VALUES (1, '食品类', 1, 1, '2025-04-25 17:15:51', '2025-04-25 17:15:51');
INSERT INTO `t_shop_category` VALUES (2, '保健品类', 2, 1, '2025-04-25 17:15:51', '2025-04-25 17:15:51');
INSERT INTO `t_shop_category` VALUES (3, '数码产品', 3, 1, '2025-04-25 17:15:51', '2025-04-25 17:15:51');
INSERT INTO `t_shop_category` VALUES (4, '生活百货', 4, 1, '2025-04-25 17:15:51', '2025-04-25 17:15:51');
INSERT INTO `t_shop_category` VALUES (5, '床上用品', 5, 1, '2025-04-25 17:15:51', '2025-04-25 17:15:51');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` tinyint NULL DEFAULT 0 COMMENT '0-未知 1-男 2-女',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '普通用户',
  `status` int NULL DEFAULT 0 COMMENT '0-正常 1-锁定 2-禁用',
  `login_attempts` int NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin@example.com', '13800138000', 1, '北京市海淀区', '管理员', 1, 0, '2024-01-01 10:00:00', '2025-04-27 15:30:00');
INSERT INTO `t_user` VALUES (2, 'user1', 'e10adc3949ba59abbe56e057f20f883e', 'user1@example.com', '13900139001', 1, '上海市浦东新区', '金牌用户', 0, 0, '2024-02-15 14:25:00', '2025-04-26 09:15:00');
INSERT INTO `t_user` VALUES (3, 'user2', 'e10adc3949ba59abbe56e057f20f883e', 'user2@example.com', '13700137002', 2, '广州市天河区', '银牌用户', 0, 0, '2024-03-20 16:40:00', '2025-04-25 11:20:00');
INSERT INTO `t_user` VALUES (4, 'user3', 'e10adc3949ba59abbe56e057f20f883e', 'user3@example.com', '13600136003', 0, '深圳市南山区', '普通用户', 0, 0, '2024-04-10 09:15:00', '2025-04-24 14:10:00');
INSERT INTO `t_user` VALUES (5, 'locked_user', 'e10adc3949ba59abbe56e057f20f883e', 'locked@example.com', '13500135004', 1, '成都市武侯区', '普通用户', 1, 6, '2024-05-05 11:30:00', '2025-04-20 10:05:00');
INSERT INTO `t_user` VALUES (6, 'disabled_user', 'e10adc3949ba59abbe56e057f20f883e', 'disabled@example.com', '13400134005', 2, '杭州市西湖区', '普通用户', 0, 0, '2024-06-18 13:45:00', '2025-04-15 16:30:00');
INSERT INTO `t_user` VALUES (7, 'admin1', '12345678', 'universe0602@outlook.com', '13333366531', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 21:45:19', '2025-04-28 11:04:42');
INSERT INTO `t_user` VALUES (8, 'admin2', '12345678', 'universe0603@outlook.com', '13333366532', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 21:46:19', '2025-04-27 23:37:38');
INSERT INTO `t_user` VALUES (10, 'admin4', '12345678', 'universe0605@outlook.com', '13333366534', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 21:48:19', '2025-04-27 23:39:38');
INSERT INTO `t_user` VALUES (11, 'admin5', '12345678', 'universe0606@outlook.com', '13333366535', 1, '河北省沧州市', '普通用户', 1, 0, '2025-04-27 21:49:19', '2025-04-27 23:40:38');
INSERT INTO `t_user` VALUES (12, 'admin6', '12345678', 'universe0607@outlook.com', '13333366536', 0, '河北省沧州市', '普通用户', 1, 0, '2025-04-27 21:50:19', '2025-04-27 23:41:38');
INSERT INTO `t_user` VALUES (13, 'admin7', '12345678', 'universe0608@outlook.com', '13333366537', 1, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 21:51:19', '2025-04-27 23:42:38');
INSERT INTO `t_user` VALUES (16, 'admin10', '12345678', 'universe0611@outlook.com', '13333366540', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 21:54:19', '2025-04-27 23:45:38');
INSERT INTO `t_user` VALUES (17, 'admin11', '12345678', 'universe0612@outlook.com', '13333366541', 1, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 21:55:19', '2025-04-27 23:46:38');
INSERT INTO `t_user` VALUES (18, 'admin12', '12345678', 'universe0613@outlook.com', '13333366542', 0, '河北省沧州市', '普通用户', 1, 0, '2025-04-27 21:56:19', '2025-04-27 23:47:38');
INSERT INTO `t_user` VALUES (19, 'admin13', '12345678', 'universe0614@outlook.com', '13333366543', 1, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 21:57:19', '2025-04-27 23:48:38');
INSERT INTO `t_user` VALUES (20, 'admin14', '12345678', 'universe0615@outlook.com', '13333366544', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 21:58:19', '2025-04-27 23:49:38');
INSERT INTO `t_user` VALUES (21, 'admin15', '12345678', 'universe0616@outlook.com', '13333366545', 1, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 21:59:19', '2025-04-27 23:50:38');
INSERT INTO `t_user` VALUES (22, 'admin16', '12345678', 'universe0617@outlook.com', '13333366546', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:00:19', '2025-04-27 23:51:38');
INSERT INTO `t_user` VALUES (23, 'admin17', '12345678', 'universe0618@outlook.com', '13333366547', 1, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:01:19', '2025-04-27 23:52:38');
INSERT INTO `t_user` VALUES (24, 'admin18', '12345678', 'universe0619@outlook.com', '13333366548', 0, '河北省沧州市', '普通用户', 1, 0, '2025-04-27 22:02:19', '2025-04-27 23:53:38');
INSERT INTO `t_user` VALUES (25, 'admin19', '12345678', 'universe0620@outlook.com', '13333366549', 1, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:03:19', '2025-04-27 23:54:38');
INSERT INTO `t_user` VALUES (26, 'admin20', '12345678', 'universe0621@outlook.com', '13333366550', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:04:19', '2025-04-27 23:55:38');
INSERT INTO `t_user` VALUES (27, 'admin21', '12345678', 'universe0622@outlook.com', '13333366551', 1, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:05:19', '2025-04-27 23:56:38');
INSERT INTO `t_user` VALUES (28, 'admin22', '12345678', 'universe0623@outlook.com', '13333366552', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:06:19', '2025-04-27 23:57:38');
INSERT INTO `t_user` VALUES (29, 'admin23', '12345678', 'universe0624@outlook.com', '13333366553', 1, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:07:19', '2025-04-27 23:58:38');
INSERT INTO `t_user` VALUES (30, 'admin24', '12345678', 'universe0625@outlook.com', '13333366554', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:08:19', '2025-04-27 23:59:38');
INSERT INTO `t_user` VALUES (31, 'admin25', '12345678', 'universe0626@outlook.com', '13333366555', 1, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:09:19', '2025-04-28 00:00:38');
INSERT INTO `t_user` VALUES (32, 'admin26', '12345678', 'universe0627@outlook.com', '13333366556', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:10:19', '2025-04-28 00:01:38');
INSERT INTO `t_user` VALUES (33, 'admin27', '12345678', 'universe0628@outlook.com', '13333366557', 1, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:11:19', '2025-04-28 00:02:38');
INSERT INTO `t_user` VALUES (34, 'admin28', '12345678', 'universe0629@outlook.com', '13333366558', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:12:19', '2025-04-28 00:03:38');
INSERT INTO `t_user` VALUES (35, 'admin29', '12345678', 'universe0630@outlook.com', '13333366559', 1, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:13:19', '2025-04-28 00:04:38');
INSERT INTO `t_user` VALUES (36, 'admin30', '12345678', 'universe0631@outlook.com', '13333366560', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:14:19', '2025-04-28 00:05:38');
INSERT INTO `t_user` VALUES (37, 'admin31', '12345678', 'universe0632@outlook.com', '13333366561', 1, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:15:19', '2025-04-28 00:06:38');
INSERT INTO `t_user` VALUES (38, 'admin32', '12345678', 'universe0633@outlook.com', '13333366562', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:16:19', '2025-04-28 00:07:38');
INSERT INTO `t_user` VALUES (39, 'admin33', '12345678', 'universe0634@outlook.com', '13333366563', 1, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:17:19', '2025-04-28 00:08:38');
INSERT INTO `t_user` VALUES (40, 'admin34', '12345678', 'universe0635@outlook.com', '13333366564', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:18:19', '2025-04-28 00:09:38');
INSERT INTO `t_user` VALUES (41, 'admin35', '12345678', 'universe0636@outlook.com', '13333366565', 1, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:19:19', '2025-04-28 00:10:38');
INSERT INTO `t_user` VALUES (42, 'admin36', '12345678', 'universe0637@outlook.com', '13333366566', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:20:19', '2025-04-28 00:11:38');
INSERT INTO `t_user` VALUES (43, 'admin37', '12345678', 'universe0638@outlook.com', '13333366567', 1, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:21:19', '2025-04-28 00:12:38');
INSERT INTO `t_user` VALUES (44, 'admin38', '12345678', 'universe0639@outlook.com', '13333366568', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:22:19', '2025-04-28 00:13:38');
INSERT INTO `t_user` VALUES (45, 'admin39', '12345678', 'universe0640@outlook.com', '13333366569', 1, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:23:19', '2025-04-28 00:14:38');
INSERT INTO `t_user` VALUES (46, 'admin40', '12345678', 'universe0641@outlook.com', '13333366570', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:24:19', '2025-04-28 00:15:38');
INSERT INTO `t_user` VALUES (47, 'admin41', '12345678', 'universe0642@outlook.com', '13333366571', 1, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:25:19', '2025-04-28 00:16:38');
INSERT INTO `t_user` VALUES (48, 'admin42', '12345678', 'universe0643@outlook.com', '13333366572', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:26:19', '2025-04-28 00:17:38');
INSERT INTO `t_user` VALUES (49, 'admin43', '12345678', 'universe0644@outlook.com', '13333366573', 1, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:27:19', '2025-04-28 00:18:38');
INSERT INTO `t_user` VALUES (50, 'admin44', '12345678', 'universe0645@outlook.com', '13333366574', 0, '河北省沧州市', '普通用户', 0, 0, '2025-04-27 22:28:19', '2025-04-28 00:19:38');
INSERT INTO `t_user` VALUES (51, 'admin123', '12345678', '730548942@qq.com', '13333366531', 1, '河北省沧州市', '管理员', 0, NULL, '2025-04-28 00:07:36', NULL);
INSERT INTO `t_user` VALUES (52, 'admin1234', '12345678', '730548942@qq.com', '13333366532', 1, '123', '普通用户', 0, NULL, '2025-04-28 00:10:11', NULL);

SET FOREIGN_KEY_CHECKS = 1;
