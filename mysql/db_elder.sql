/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : db_elder

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 07/07/2024 23:37:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for eld_active
-- ----------------------------
DROP TABLE IF EXISTS `eld_active`;
CREATE TABLE `eld_active`  (
  `active_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `active_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `active_start` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开始',
  `active_end` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结束',
  `active_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `active_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `active_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `active_cover` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
  `active_state` int NULL DEFAULT 1 COMMENT '状态(1 正常 0 禁用)',
  PRIMARY KEY (`active_id`) USING BTREE,
  UNIQUE INDEX `eld_active_active_id_uindex`(`active_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '活动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_active
-- ----------------------------
INSERT INTO `eld_active` VALUES (1, '爱心共建聚合力 关爱老人做公益', '2023-12-01', '2023-12-28', '和平东路1221号', '', '', 'http://43.142.9.86:9090/files/1703840827680-微信截图_20231229170703.png', 1);

-- ----------------------------
-- Table structure for eld_apply
-- ----------------------------
DROP TABLE IF EXISTS `eld_apply`;
CREATE TABLE `eld_apply`  (
  `apply_id` int NOT NULL AUTO_INCREMENT,
  `apply_acc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账号',
  `apply_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `apply_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `apply_date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日期',
  `apply_check` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '待审核' COMMENT '审核',
  `apply_advice` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '意见',
  `apply_state` int NULL DEFAULT 1 COMMENT '状态（1正常 0禁用）',
  PRIMARY KEY (`apply_id`) USING BTREE,
  UNIQUE INDEX `eld_apply_apply_id_uindex`(`apply_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '报名' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_apply
-- ----------------------------
INSERT INTO `eld_apply` VALUES (1, NULL, NULL, NULL, NULL, '待审核', NULL, 1);

-- ----------------------------
-- Table structure for eld_elder
-- ----------------------------
DROP TABLE IF EXISTS `eld_elder`;
CREATE TABLE `eld_elder`  (
  `elder_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `elder_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `elder_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `elder_tag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `elder_price` int NULL DEFAULT NULL COMMENT '价格',
  `elder_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `elder_date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '成立日期',
  `elder_cover` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
  `elder_bed` int NULL DEFAULT NULL COMMENT '房间数',
  `elder_area` int NULL DEFAULT NULL COMMENT '面积',
  `elder_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `elder_jw` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '经纬度',
  `elder_wd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '经纬度',
  `elder_state` int NULL DEFAULT 1 COMMENT '状态（1正常 0禁用）',
  PRIMARY KEY (`elder_id`) USING BTREE,
  UNIQUE INDEX `eld_elder_elder_id_uindex`(`elder_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '养老院' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_elder
-- ----------------------------
INSERT INTO `eld_elder` VALUES (1, '泰康之家·徽园', '', '', 2199, '111', '2019', 'http://43.142.9.86/img/1.78018329.jpeg', 1230, 600, '13833447788', '117.4', '117.4', 1);
INSERT INTO `eld_elder` VALUES (2, '泰康之家·徽园', NULL, NULL, 2199, '111', '2019', 'http://43.142.9.86:9090/files/1703838534233-3085808915_14_561_400.jpg', 1230, 600, '13833447788', NULL, '117.4', 1);
INSERT INTO `eld_elder` VALUES (3, '泰康之家·徽园', NULL, NULL, 2199, '111', '2019', 'http://43.142.9.86:9090/files/1703840044621-2.jpeg', 1230, 600, '13833447788', NULL, '117.4', 1);
INSERT INTO `eld_elder` VALUES (4, '泰康之家·徽园', NULL, NULL, 2199, '111', '2019', 'http://43.142.9.86:9090/files/1703906855696-微信截图_20231230112730.png', 1230, 600, '13833447788', NULL, '117.4', 1);

-- ----------------------------
-- Table structure for eld_news
-- ----------------------------
DROP TABLE IF EXISTS `eld_news`;
CREATE TABLE `eld_news`  (
  `news_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `news_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `news_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类别',
  `news_date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日期',
  `news_cover` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
  `news_tag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `news_read` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '阅读',
  `news_state` int NULL DEFAULT 1 COMMENT '状态(1 正常 0 禁用)',
  PRIMARY KEY (`news_id`) USING BTREE,
  UNIQUE INDEX `eld_news_news_id_uindex`(`news_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '新闻' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_news
-- ----------------------------
INSERT INTO `eld_news` VALUES (1, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"https://cdn-hw-static2.shanhutech.cn/bizhi/staticwp/202305/a28a152ce7e2a782f602e486eaaaaac4--1846085994.jpg\" alt=\"https://cdn-hw-static2.shanhutech.cn/bizhi/staticwp/202305/a28a152ce7e2a782f602e486eaaaaac4--1846085994.jpg\" data-href=\"https://cdn-hw-static2.shanhutech.cn/bizhi/staticwp/202305/a28a152ce7e2a782f602e486eaaaaac4--1846085994.jpg\" style=\"\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老动态', '2024-06-18 20:40:47', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '20', 1);
INSERT INTO `eld_news` VALUES (2, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老动态', '2024-02-29 00:32:57', 'http://43.142.9.86:9090/files/1703838534233-3085808915_14_561_400.jpg', NULL, '13', 1);
INSERT INTO `eld_news` VALUES (3, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老政策', '2024-02-29 00:33:26', 'http://cdn-hw-static2.shanhutech.cn/bizhi/staticwp/202301/c7315233338256be877b836d42907ef1--1416883533.jpg', NULL, '13', 1);
INSERT INTO `eld_news` VALUES (4, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://cdn-hw-static2.shanhutech.cn/bizhi/staticwp/202301/2a2a00207fabfd1fe9f9955100d28441--4106674217.jpg\" alt=\"\" data-href=\"\" style=\"width: 910.00px;height: 511.88px;\"></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 915.00px;height: 609.97px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老动态', '2024-02-29 00:34:19', 'http://cdn-hw-static2.shanhutech.cn/bizhi/staticwp/202301/2a2a00207fabfd1fe9f9955100d28441--4106674217.jpg', NULL, '14', 1);
INSERT INTO `eld_news` VALUES (5, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://cdn-hw-static2.shanhutech.cn/bizhi/staticwp/202301/8f62504ef8d51b2cd042cdf63b169e35--278618013.jpg\" alt=\"\" data-href=\"\" style=\"width: 735.00px;height: 413.44px;\"></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老政策', '2024-02-29 00:35:13', 'http://cdn-hw-static2.shanhutech.cn/bizhi/staticwp/202301/8f62504ef8d51b2cd042cdf63b169e35--278618013.jpg', NULL, '14', 1);
INSERT INTO `eld_news` VALUES (6, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老服务', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);
INSERT INTO `eld_news` VALUES (7, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老动态', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '13', 1);
INSERT INTO `eld_news` VALUES (8, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老服务', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);
INSERT INTO `eld_news` VALUES (9, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老动态', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '14', 1);
INSERT INTO `eld_news` VALUES (10, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老服务', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);
INSERT INTO `eld_news` VALUES (11, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老动态', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);
INSERT INTO `eld_news` VALUES (12, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老动态', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);
INSERT INTO `eld_news` VALUES (13, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老模式', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);
INSERT INTO `eld_news` VALUES (14, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老动态', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);
INSERT INTO `eld_news` VALUES (15, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '居家养老', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '13', 1);
INSERT INTO `eld_news` VALUES (16, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老动态', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);
INSERT INTO `eld_news` VALUES (17, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '居家养老', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);

-- ----------------------------
-- Table structure for eld_notice
-- ----------------------------
DROP TABLE IF EXISTS `eld_notice`;
CREATE TABLE `eld_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `notice_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `notice_state` int NULL DEFAULT 1 COMMENT '状态（1正常 0禁用）',
  PRIMARY KEY (`notice_id`) USING BTREE,
  UNIQUE INDEX `eld_notice_notice_id_uindex`(`notice_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_notice
-- ----------------------------
INSERT INTO `eld_notice` VALUES (1, '1', 1);

-- ----------------------------
-- Table structure for eld_order
-- ----------------------------
DROP TABLE IF EXISTS `eld_order`;
CREATE TABLE `eld_order`  (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_acc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户',
  `order_date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日期',
  `order_check` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核',
  `order_advice` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '意见',
  `order_state` int NULL DEFAULT 1 COMMENT '状态（1正常 0禁用）',
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `eld_order_order_id_uindex`(`order_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '预约' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_order
-- ----------------------------
INSERT INTO `eld_order` VALUES (1, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for eld_review
-- ----------------------------
DROP TABLE IF EXISTS `eld_review`;
CREATE TABLE `eld_review`  (
  `review_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `review_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `review_date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日期',
  `review_content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `review_star` int NULL DEFAULT NULL COMMENT '点赞',
  `review_state` int NULL DEFAULT 1 COMMENT '状态(1 正常 0 禁用)',
  PRIMARY KEY (`review_id`) USING BTREE,
  UNIQUE INDEX `eld_review_review_id_uindex`(`review_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_review
-- ----------------------------
INSERT INTO `eld_review` VALUES (1, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for eld_serve
-- ----------------------------
DROP TABLE IF EXISTS `eld_serve`;
CREATE TABLE `eld_serve`  (
  `serve_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serve_cover` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
  `serve_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `serve_content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `serve_state` int NULL DEFAULT 1 COMMENT '状态（1正常 0禁用）',
  PRIMARY KEY (`serve_id`) USING BTREE,
  UNIQUE INDEX `eld_serve_serve_id_uindex`(`serve_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '服务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_serve
-- ----------------------------
INSERT INTO `eld_serve` VALUES (1, 'http://43.142.9.86:9090/files/1703906855696-微信截图_20231230112730.png', '社区文化服务', '提供丰富多彩的文化娱乐活动，包括舞蹈、歌唱比赛、户外跑步等活动', 1);

-- ----------------------------
-- Table structure for eld_sort
-- ----------------------------
DROP TABLE IF EXISTS `eld_sort`;
CREATE TABLE `eld_sort`  (
  `sort_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `sort_state` int NULL DEFAULT 1 COMMENT '状态(1 正常 0 禁用)',
  PRIMARY KEY (`sort_id`) USING BTREE,
  UNIQUE INDEX `eld_sort_sort_id_uindex`(`sort_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '类别' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_sort
-- ----------------------------
INSERT INTO `eld_sort` VALUES (1, '全部', 1);
INSERT INTO `eld_sort` VALUES (2, '养老动态', 1);
INSERT INTO `eld_sort` VALUES (3, '养老政策', 1);
INSERT INTO `eld_sort` VALUES (4, '养老服务', 1);
INSERT INTO `eld_sort` VALUES (5, '养老产业', 1);
INSERT INTO `eld_sort` VALUES (6, '养老模式', 1);
INSERT INTO `eld_sort` VALUES (7, '养老金', 1);
INSERT INTO `eld_sort` VALUES (8, '居家养老', 1);

-- ----------------------------
-- Table structure for eld_swiper
-- ----------------------------
DROP TABLE IF EXISTS `eld_swiper`;
CREATE TABLE `eld_swiper`  (
  `swiper_id` int NOT NULL AUTO_INCREMENT,
  `swiper_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `swiper_src` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `swiper_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '新闻',
  `swiper_state` int NULL DEFAULT 1 COMMENT '状态（1正常 0禁用）',
  PRIMARY KEY (`swiper_id`) USING BTREE,
  UNIQUE INDEX `eld_swiper_swiper_id_uindex`(`swiper_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '轮播图' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_swiper
-- ----------------------------
INSERT INTO `eld_swiper` VALUES (1, '1', 'http://43.142.9.86/img/1.78018329.jpeg', '1', 1);
INSERT INTO `eld_swiper` VALUES (2, '2', 'http://43.142.9.86/img/2.952132ef.jpeg', '2', 1);
INSERT INTO `eld_swiper` VALUES (3, '3', 'http://43.142.9.86:9090/files/1703906855696-微信截图_20231230112730.png', '3', 1);
INSERT INTO `eld_swiper` VALUES (4, '4', 'http://43.142.9.86:9090/files/1703838534233-3085808915_14_561_400.jpg', '4', 1);
INSERT INTO `eld_swiper` VALUES (19, NULL, 'https://cdn-hw-static2.shanhutech.cn/bizhi/staticwp/202305/b516be63973f0c8eff8cecfeebfce692--1488048962.jpg', NULL, 1);

-- ----------------------------
-- Table structure for eld_user
-- ----------------------------
DROP TABLE IF EXISTS `eld_user`;
CREATE TABLE `eld_user`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_acc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账号',
  `user_pwd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `user_sex` int NULL DEFAULT 2 COMMENT '性别(0男 1女 2不详)',
  `user_age` int NULL DEFAULT NULL COMMENT '年龄',
  `user_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `user_ide` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '普通用户' COMMENT '角色',
  `user_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `user_state` int NULL DEFAULT 1 COMMENT '状态(1 正常 0 禁用)',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `eld_user_user_id_uindex`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_user
-- ----------------------------
INSERT INTO `eld_user` VALUES (1, '1', '1', NULL, 2, NULL, NULL, '普通用户', NULL, 1);
INSERT INTO `eld_user` VALUES (6, '2', '2', '', 0, 0, '', '管理员', '', 0);

SET FOREIGN_KEY_CHECKS = 1;
