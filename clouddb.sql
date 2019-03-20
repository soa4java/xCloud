/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : clouddb

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 08/03/2019 09:33:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dir_info
-- ----------------------------
DROP TABLE IF EXISTS `dir_info`;
CREATE TABLE `dir_info`  (
  `dir_id` int(11) NOT NULL AUTO_INCREMENT,
  `dir_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_dir` int(11) NULL DEFAULT NULL,
  `dir_user_id` int(11) NOT NULL,
  `dir_path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `open_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  ` close_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dir_id`) USING BTREE,
  INDEX `dir_user_id`(`dir_user_id`) USING BTREE,
  CONSTRAINT `dir_user_id` FOREIGN KEY (`dir_user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dir_info
-- ----------------------------
INSERT INTO `dir_info` VALUES (1, '全部图片', NULL, 1, '/', NULL, NULL);
INSERT INTO `dir_info` VALUES (2, '生活照', 1, 1, '/全部照片/', NULL, NULL);
INSERT INTO `dir_info` VALUES (3, '证件照', 1, 1, '/全部照片/', NULL, NULL);
INSERT INTO `dir_info` VALUES (4, '学校风景', 1, 1, '/全部照片/', NULL, NULL);
INSERT INTO `dir_info` VALUES (5, '天津夜景', 1, 1, '/全部照片/', NULL, NULL);
INSERT INTO `dir_info` VALUES (6, '全部视频', NULL, 1, '/', NULL, NULL);
INSERT INTO `dir_info` VALUES (7, '课程资料', NULL, 1, '', NULL, NULL);
INSERT INTO `dir_info` VALUES (8, ' JAVA 课程 01', 7, 1, '/全部视频/课程视频/', NULL, NULL);
INSERT INTO `dir_info` VALUES (9, ' JAVA 课程 02', 7, 1, '/全部视频/课程视频/', NULL, NULL);
INSERT INTO `dir_info` VALUES (10, '街拍 0226 ', 6, 1, '/全部视频/', NULL, NULL);
INSERT INTO `dir_info` VALUES (11, '街拍 0202', 6, 1, '/全部视频/', NULL, NULL);

-- ----------------------------
-- Table structure for file_info
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info`  (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `file_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_upload_time` datetime(0) NOT NULL,
  `file_status` int(11) NOT NULL,
  `file_dir_id` int(11) NOT NULL,
  `file_upload_user_id` int(11) NOT NULL,
  `downloadCount` int(12) NOT NULL DEFAULT 0,
  PRIMARY KEY (`file_id`) USING BTREE,
  INDEX `file_dir_id`(`file_dir_id`) USING BTREE,
  INDEX `file_upload_user_id`(`file_upload_user_id`) USING BTREE,
  CONSTRAINT `file_dir_id` FOREIGN KEY (`file_dir_id`) REFERENCES `dir_info` (`dir_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `file_upload_user_id` FOREIGN KEY (`file_upload_user_id`) REFERENCES `user_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_info
-- ----------------------------
INSERT INTO `file_info` VALUES (1, '头像收藏.jpg', 1, 'isPicture', '2019-01-17 08:52:00', 1, 1, 1, 61);
INSERT INTO `file_info` VALUES (2, '身份证正面.jpg', 2, 'isPicture', '2019-01-17 08:52:55', 1, 1, 1, 15);
INSERT INTO `file_info` VALUES (3, '天津之眼.jpg', 2, 'isPicture', '2019-02-20 21:34:48', 1, 1, 1, 10);
INSERT INTO `file_info` VALUES (4, '身份证反面.jpg', 5, 'isPicture', '2019-02-20 21:42:33', 0, 1, 1, 3);
INSERT INTO `file_info` VALUES (5, '壁纸收藏01.png', 10, 'isPicture', '2019-02-20 21:43:35', 0, 1, 1, 65);
INSERT INTO `file_info` VALUES (8, 'PS素材01.png', 10, 'isPicture', '2019-02-20 21:44:21', 0, 1, 1, 8);
INSERT INTO `file_info` VALUES (9, 'PS素材02.png', 10, 'isPicture', '2019-02-20 21:44:25', 0, 1, 1, 1);
INSERT INTO `file_info` VALUES (11, '证件照蓝.jpg', 10, 'isPicture', '2019-02-20 21:47:13', 1, 1, 1, 2);
INSERT INTO `file_info` VALUES (12, '证件照红.jpg', 10, 'isPicture', '2019-02-20 21:47:25', 0, 1, 1, 0);
INSERT INTO `file_info` VALUES (14, 'SSM 课程01', 10, 'isVideo', '2019-02-20 21:50:53', 1, 1, 1, 1);
INSERT INTO `file_info` VALUES (15, 'SSM 课程02', 10, 'isVideo', '2019-02-20 21:50:57', 1, 1, 1, 1);
INSERT INTO `file_info` VALUES (16, 'SSM 课程03', 10, 'isVideo', '2019-02-20 21:51:00', 0, 1, 1, 45);
INSERT INTO `file_info` VALUES (17, 'Spring Boot课程02', 10, 'isVideo', '2019-02-20 21:51:23', 0, 1, 1, 4);
INSERT INTO `file_info` VALUES (18, 'Spring Boot课程0222', 20, 'isVideo', '2019-02-20 21:51:32', 0, 1, 1, 3);
INSERT INTO `file_info` VALUES (19, 'Spring Boot课程03', 20, 'isVideo', '2019-02-20 21:51:36', 0, 1, 1, 6);
INSERT INTO `file_info` VALUES (20, '上课录音01', 15, 'isAudio', '2019-02-20 21:52:17', 1, 1, 1, 4);
INSERT INTO `file_info` VALUES (21, '上课录音02', 15, 'isAudio', '2019-02-20 21:52:20', 0, 1, 1, 8);
INSERT INTO `file_info` VALUES (22, '上课录音3', 15, 'isAudio', '2019-02-20 21:52:22', 0, 1, 1, 9);
INSERT INTO `file_info` VALUES (23, '手机铃声3', 15, 'isAudio', '2019-02-20 21:52:33', 1, 1, 1, 2);
INSERT INTO `file_info` VALUES (24, '手机铃声1', 15, 'isAudio', '2019-02-20 21:52:35', 0, 1, 1, 15);
INSERT INTO `file_info` VALUES (25, '手机铃声2', 15, 'isAudio', '2019-02-20 21:52:38', 1, 1, 1, 848);
INSERT INTO `file_info` VALUES (26, 'Spring 入门文档01', 15, 'isDocument', '2019-02-20 21:53:10', 1, 1, 1, 6);
INSERT INTO `file_info` VALUES (27, 'Spring 入门文档02', 15, 'isDocument', '2019-02-20 21:53:12', 1, 1, 1, 31);
INSERT INTO `file_info` VALUES (28, 'Spring 入门文档03', 15, 'isDocument', '2019-02-20 21:53:16', 0, 1, 1, 48);
INSERT INTO `file_info` VALUES (30, '阿里巴巴开发手册2018', 15, 'isDocument', '2019-02-20 21:53:35', 1, 1, 1, 1);
INSERT INTO `file_info` VALUES (31, 'Java 编程思想', 15, 'isDocument', '2019-02-20 21:53:46', 0, 1, 1, 84);
INSERT INTO `file_info` VALUES (32, 'Java 架构', 15, 'isDocument', '2019-02-20 21:54:10', 1, 1, 1, 8);
INSERT INTO `file_info` VALUES (33, '头像收藏.jpg', 1, 'isPicture', '2019-01-17 08:52:00', 1, 1, 3, 56);
INSERT INTO `file_info` VALUES (34, '头像收藏02.jpg', 1, 'isPicture', '2019-01-17 08:52:00', 1, 1, 3, 3);
INSERT INTO `file_info` VALUES (35, '身份证正面.jpg', 2, 'isPicture', '2019-01-17 08:52:55', 1, 1, 3, 32);
INSERT INTO `file_info` VALUES (36, '天津之眼.jpg', 2, 'isPicture', '2019-02-20 21:34:48', 1, 1, 3, 54);
INSERT INTO `file_info` VALUES (37, '身份证反面.jpg', 5, 'isPicture', '2019-02-20 21:42:33', 1, 1, 3, 8);
INSERT INTO `file_info` VALUES (38, '壁纸收藏01.png', 10, 'isPicture', '2019-02-20 21:43:35', 0, 1, 3, 5);
INSERT INTO `file_info` VALUES (39, 'PS素材01.png', 10, 'isPicture', '2019-02-20 21:44:21', 1, 1, 3, 5);
INSERT INTO `file_info` VALUES (40, 'PS素材02.png', 10, 'isPicture', '2019-02-20 21:44:25', 0, 1, 3, 78);
INSERT INTO `file_info` VALUES (41, '证件照蓝.jpg', 10, 'isPicture', '2019-02-20 21:47:13', 1, 1, 3, 0);
INSERT INTO `file_info` VALUES (42, '证件照红.jpg', 10, 'isPicture', '2019-02-20 21:47:25', 1, 1, 3, 12);
INSERT INTO `file_info` VALUES (43, 'SSM 课程01', 10, 'isVideo', '2019-02-20 21:50:53', 0, 1, 3, 45);
INSERT INTO `file_info` VALUES (44, 'SSM 课程02', 10, 'isVideo', '2019-02-20 21:50:57', 0, 1, 3, 2);
INSERT INTO `file_info` VALUES (45, 'SSM 课程03', 10, 'isVideo', '2019-02-20 21:51:00', 1, 1, 3, 3);
INSERT INTO `file_info` VALUES (46, 'Spring Boot课程01', 10, 'isVideo', '2019-02-20 21:51:23', 0, 1, 3, 5);
INSERT INTO `file_info` VALUES (47, 'Spring Boot课程02', 20, 'isVideo', '2019-02-20 21:51:32', 1, 1, 3, 498);
INSERT INTO `file_info` VALUES (48, 'Spring Boot课程03', 20, 'isVideo', '2019-02-20 21:51:36', 1, 1, 3, 48);
INSERT INTO `file_info` VALUES (49, '上课录音01', 15, 'isAudio', '2019-02-20 21:52:17', 0, 1, 3, 5);
INSERT INTO `file_info` VALUES (50, '上课录音02', 15, 'isAudio', '2019-02-20 21:52:20', 0, 1, 3, 8);
INSERT INTO `file_info` VALUES (51, '上课录音3', 15, 'isAudio', '2019-02-20 21:52:22', 0, 1, 3, 4);
INSERT INTO `file_info` VALUES (52, '手机铃声3', 15, 'isAudio', '2019-02-20 21:52:33', 1, 1, 3, 849);
INSERT INTO `file_info` VALUES (53, '手机铃声1', 15, 'isAudio', '2019-02-20 21:52:35', 0, 1, 3, 4);
INSERT INTO `file_info` VALUES (54, '手机铃声2', 15, 'isAudio', '2019-02-20 21:52:38', 1, 1, 3, 0);
INSERT INTO `file_info` VALUES (55, 'Spring 入门文档01', 15, 'isDocument', '2019-02-20 21:53:10', 1, 1, 3, 78);
INSERT INTO `file_info` VALUES (56, 'Spring 入门文档02', 15, 'isDocument', '2019-02-20 21:53:12', 1, 1, 3, 0);
INSERT INTO `file_info` VALUES (57, 'Spring 入门文档03', 15, 'isDocument', '2019-02-20 21:53:16', 0, 1, 3, 546);
INSERT INTO `file_info` VALUES (58, '阿里巴巴开发手册2018', 15, 'isDocument', '2019-02-20 21:53:35', 1, 1, 3, 0);
INSERT INTO `file_info` VALUES (59, 'Java 编程思想', 15, 'isDocument', '2019-02-20 21:53:46', 0, 1, 3, 56);
INSERT INTO `file_info` VALUES (60, 'Java 架构', 15, 'isDocument', '2019-02-20 21:54:10', 1, 1, 3, 0);
INSERT INTO `file_info` VALUES (61, '头像收藏02.jpg', 1, 'isPicture', '2019-01-17 08:52:00', 1, 1, 3, 7);
INSERT INTO `file_info` VALUES (62, '身份证正面.jpg', 2, 'isPicture', '2019-01-17 08:52:55', 1, 1, 3, 8);
INSERT INTO `file_info` VALUES (63, '天津之眼.jpg', 2, 'isPicture', '2019-02-20 21:34:48', 1, 1, 3, 51);
INSERT INTO `file_info` VALUES (64, '身份证反面.jpg', 5, 'isPicture', '2019-02-20 21:42:33', 1, 1, 3, 3);
INSERT INTO `file_info` VALUES (65, '壁纸收藏01.png', 10, 'isPicture', '2019-02-20 21:43:35', 0, 1, 3, 0);
INSERT INTO `file_info` VALUES (66, 'PS素材01.png', 10, 'isPicture', '2019-02-20 21:44:21', 1, 1, 3, 6);
INSERT INTO `file_info` VALUES (67, 'PS素材02.png', 10, 'isPicture', '2019-02-20 21:44:25', 0, 1, 3, 5);
INSERT INTO `file_info` VALUES (68, '证件照蓝.jpg', 10, 'isPicture', '2019-02-20 21:47:13', 1, 1, 3, 45);
INSERT INTO `file_info` VALUES (69, '证件照红.jpg', 10, 'isPicture', '2019-02-20 21:47:25', 1, 1, 3, 5);
INSERT INTO `file_info` VALUES (70, 'SSM 课程01', 10, 'isVideo', '2019-02-20 21:50:53', 0, 1, 3, 12);
INSERT INTO `file_info` VALUES (71, 'SSM 课程02', 10, 'isVideo', '2019-02-20 21:50:57', 0, 1, 3, 5);
INSERT INTO `file_info` VALUES (72, 'SSM 课程03', 10, 'isVideo', '2019-02-20 21:51:00', 1, 1, 3, 45);
INSERT INTO `file_info` VALUES (73, 'Spring Boot课程01', 10, 'isVideo', '2019-02-20 21:51:23', 0, 1, 3, 1);
INSERT INTO `file_info` VALUES (74, 'Spring Boot课程02', 20, 'isVideo', '2019-02-20 21:51:32', 1, 1, 3, 0);
INSERT INTO `file_info` VALUES (75, 'Spring Boot课程03', 20, 'isVideo', '2019-02-20 21:51:36', 1, 1, 3, 4);
INSERT INTO `file_info` VALUES (76, '上课录音01', 15, 'isAudio', '2019-02-20 21:52:17', 0, 1, 3, 0);
INSERT INTO `file_info` VALUES (77, '上课录音02', 15, 'isAudio', '2019-02-20 21:52:20', 0, 1, 3, 8484);
INSERT INTO `file_info` VALUES (78, '上课录音3', 15, 'isAudio', '2019-02-20 21:52:22', 0, 1, 3, 512);
INSERT INTO `file_info` VALUES (79, '手机铃声3', 15, 'isAudio', '2019-02-20 21:52:33', 1, 1, 3, 48);
INSERT INTO `file_info` VALUES (80, '手机铃声1', 15, 'isAudio', '2019-02-20 21:52:35', 0, 1, 3, 0);
INSERT INTO `file_info` VALUES (81, '手机铃声2', 15, 'isAudio', '2019-02-20 21:52:38', 1, 1, 3, 45);
INSERT INTO `file_info` VALUES (82, 'Spring 入门文档01', 15, 'isDocument', '2019-02-20 21:53:10', 1, 1, 3, 0);
INSERT INTO `file_info` VALUES (83, 'Spring 入门文档02', 15, 'isDocument', '2019-02-20 21:53:12', 1, 1, 3, 31);
INSERT INTO `file_info` VALUES (84, 'Spring 入门文档03', 15, 'isDocument', '2019-02-20 21:53:16', 0, 1, 3, 48);
INSERT INTO `file_info` VALUES (85, '阿里巴巴开发手册2018', 15, 'isDocument', '2019-02-20 21:53:35', 1, 1, 3, 78);
INSERT INTO `file_info` VALUES (86, 'Java 编程思想', 15, 'isDocument', '2019-02-20 21:53:46', 0, 1, 3, 78);
INSERT INTO `file_info` VALUES (87, 'Java 架构', 15, 'isDocument', '2019-02-20 21:54:10', 1, 1, 3, 6);
INSERT INTO `file_info` VALUES (88, '05eeb17ac4ca360f583b9fd1a21ccb53.png', 62167, 'isPicture', '2019-03-04 17:07:41', 0, 2, 1, 1);
INSERT INTO `file_info` VALUES (89, 'QQ截图20190226092519.png', 51474, 'isPicture', '2019-03-04 17:10:20', 0, 2, 1, 6);
INSERT INTO `file_info` VALUES (90, '3f23b20c52dd920442f91ccedc526d56.png', 17904, 'isPicture', '2019-03-04 17:15:05', 0, 2, 1, 51);
INSERT INTO `file_info` VALUES (91, 'QQ截图20190224214924.png', 21794, 'isPicture', '2019-03-05 16:07:38', 0, 2, 1, 0);
INSERT INTO `file_info` VALUES (94, 'qqq.png', 4442, 'isPicture', '2019-03-06 22:47:04', 1, 2, 1, 0);
INSERT INTO `file_info` VALUES (95, 'download.jpg', 15799, 'isPicture', '2019-03-06 22:51:44', 0, 2, 1, 1);
INSERT INTO `file_info` VALUES (96, '222.jpg', 15799, 'isPicture', '2019-03-06 23:06:16', 0, 2, 1, 2);
INSERT INTO `file_info` VALUES (97, '项目脑图.png', 70216, 'isPicture', '2019-03-06 23:34:06', 0, 2, 1, 1);

-- ----------------------------
-- Table structure for user_detail_info
-- ----------------------------
DROP TABLE IF EXISTS `user_detail_info`;
CREATE TABLE `user_detail_info`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `runame` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` int(255) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `userId` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_detail_info
-- ----------------------------
INSERT INTO `user_detail_info` VALUES (1, '肖朋伟', '女', '1997-06-20', '天津', 1838888888, 'Java 开发');
INSERT INTO `user_detail_info` VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_detail_info` VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_detail_info` VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_detail_info` VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_detail_info` VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_detail_info` VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `register_time` datetime(0) NOT NULL,
  `user_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户类型，默认为 user',
  `status` int(10) NOT NULL COMMENT '是否是新注册用户',
  `head` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, '肖朋伟', '60149a289a3623cd214943af2892e103f4bddafb', 'xpwi@qq.com', '2019-01-16 08:44:11', 'admin', 1, 'myphoto/1551938395034.JPG');
INSERT INTO `user_info` VALUES (2, '露娜', '60149a289a3623cd214943af2892e103f4bddafb', '1234@qq.cpm', '2019-01-16 08:45:56', 'user', 0, 'myphoto/myphoto.jpg');
INSERT INTO `user_info` VALUES (3, '关羽', '60149a289a3623cd214943af2892e103f4bddafb', 'guanyu@qq.com', '2019-01-16 08:46:29', 'user', 1, 'myphoto/myphoto.jpg');
INSERT INTO `user_info` VALUES (4, '钟馗', '60149a289a3623cd214943af2892e103f4bddafb', 'xpwi10@qq.com', '2019-01-16 10:31:21', 'user', -1, 'myphoto/myphoto.jpg');
INSERT INTO `user_info` VALUES (5, '添加', '60149a289a3623cd214943af2892e103f4bddafb', '1234444@qq.com', '2019-01-16 18:37:12', 'user', 1, 'myphoto/myphoto.jpg');
INSERT INTO `user_info` VALUES (6, '安琪拉', '60149a289a3623cd214943af2892e103f4bddafb', '456@qq.com', '2019-01-16 18:48:41', 'user', -1, 'myphoto/myphoto.jpg');
INSERT INTO `user_info` VALUES (8, '刘备', '60149a289a3623cd214943af2892e103f4bddafb', 'xpwi9@qq.com', '2019-01-16 18:51:37', 'user', -1, 'myphoto/myphoto.jpg');
INSERT INTO `user_info` VALUES (9, '赵云', '60149a289a3623cd214943af2892e103f4bddafb', '1123456@qq.com', '2019-02-28 13:04:38', 'user', 1, 'myphoto/myphoto.jpg');
INSERT INTO `user_info` VALUES (10, '张飞', '60149a289a3623cd214943af2892e103f4bddafb', '2123456@qq.com', '2019-02-28 13:05:56', 'user', 1, 'myphoto/myphoto.jpg');
INSERT INTO `user_info` VALUES (11, '刘德华', '60149a289a3623cd214943af2892e103f4bddafb', '3123456@qq.com', '2019-02-28 13:30:11', 'user', -1, 'myphoto/myphoto.jpg');
INSERT INTO `user_info` VALUES (12, '吕布', '60149a289a3623cd214943af2892e103f4bddafb', '4123456@qq.com', '2019-02-28 14:59:13', 'user', 1, 'myphoto/myphoto.jpg');
INSERT INTO `user_info` VALUES (13, '曹操', '60149a289a3623cd214943af2892e103f4bddafb', '5123456@qq.com', '2019-02-28 17:17:31', 'user', -1, 'myphoto/myphoto.jpg');
INSERT INTO `user_info` VALUES (14, '司马懿', '60149a289a3623cd214943af2892e103f4bddafb', '6123456@qq.com', '2019-02-28 17:25:13', 'user', -1, 'myphoto/myphoto.jpg');
INSERT INTO `user_info` VALUES (15, '荀彧', '60149a289a3623cd214943af2892e103f4bddafb', '7000000@qq.com', '2019-02-28 18:15:24', 'user', 1, 'myphoto/myphoto.jpg');
INSERT INTO `user_info` VALUES (16, '郭嘉', '60149a289a3623cd214943af2892e103f4bddafb', '00000@qq.com', '2019-02-28 18:18:07', 'user', 1, 'myphoto/myphoto.jpg');
INSERT INTO `user_info` VALUES (17, '曹丕', '60149a289a3623cd214943af2892e103f4bddafb', '0000@qq.com', '2019-02-28 18:19:03', 'user', -1, 'myphoto/myphoto.jpg');
INSERT INTO `user_info` VALUES (18, '孙尚香', '60149a289a3623cd214943af2892e103f4bddafb', '23456@qq.com', '2019-02-28 18:28:12', 'user', -1, 'myphoto/myphoto.jpg');
INSERT INTO `user_info` VALUES (19, '诸葛亮', '60149a289a3623cd214943af2892e103f4bddafb', '3456@qq.com', '2019-02-28 20:39:58', 'user', -1, NULL);
INSERT INTO `user_info` VALUES (21, '刘禅', '60149a289a3623cd214943af2892e103f4bddafb', '7123456@qq.com', '2019-02-28 21:00:27', 'user', -1, NULL);
INSERT INTO `user_info` VALUES (22, '黄忠', '60149a289a3623cd214943af2892e103f4bddafb', '8123456@qq.com', '2019-02-28 22:25:19', 'user', -1, NULL);
INSERT INTO `user_info` VALUES (23, '曹仁', '60149a289a3623cd214943af2892e103f4bddafb', '9123456@qq.com', '2019-02-28 22:25:52', 'user', 0, NULL);
INSERT INTO `user_info` VALUES (24, '张合', '60149a289a3623cd214943af2892e103f4bddafb', '10123456@qq.com', '2019-02-28 22:26:13', 'user', 0, NULL);
INSERT INTO `user_info` VALUES (25, '孙权', '60149a289a3623cd214943af2892e103f4bddafb', '11123456@qq.com', '2019-02-28 22:26:46', 'user', 0, NULL);
INSERT INTO `user_info` VALUES (26, '陈群', '60149a289a3623cd214943af2892e103f4bddafb', '123456@qq.com', '2019-02-28 22:27:56', 'user', 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
