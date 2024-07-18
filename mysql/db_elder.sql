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

 Date: 18/07/2024 13:25:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for eld_active
-- ----------------------------
DROP TABLE IF EXISTS `eld_active`;
CREATE TABLE `eld_active`  (
  `active_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `active_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `active_start` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开始',
  `active_end` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结束',
  `active_address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `active_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `active_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `active_cover` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
  `status` int NULL DEFAULT 1 COMMENT '状态(1 正常 0 禁用)',
  PRIMARY KEY (`active_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '活动' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_active
-- ----------------------------
INSERT INTO `eld_active` VALUES (1, '爱心共建聚合力 关爱老人做公益', '2024-07-04', '2024-07-07', '和平东路1221号', '18733550077', '# 一级标题\n老吾老，以及人之老，尊老敬老是中华民族的传统美德，也是培育和践行社会主义核心价值观的基本要求。为营造敬老、亲老、爱老、助老的社会风尚', 'http://localhost/images/20240711203034798.png', 1);
INSERT INTO `eld_active` VALUES (2, '季度集体生日会，让“银发”志愿者感受“大家庭”的温暖', '2024-07-01', '2024-07-20', '和平东路1221号', '17899003344', '>**🌟  前言**\n>\n>欢迎来到我的技术小宇宙！🌌 这里不仅是我记录技术点滴的后花园，也是我分享学习心得和项目经验的乐园。📚 无论你是技术小白还是资深大牛，这里总有一些内容能触动你的好奇心。🔍\n>\n>- 🤖 **洛可可白**：[个人主页](https://blog.csdn.net/interest_ing_/)\n>- 🔥 **个人专栏**：✅[前端技术](https://blog.csdn.net/interest_ing_/category_12596885.html) ✅[后端技术](https://blog.csdn.net/interest_ing_/category_12596886.html)\n>- 🏠 **个人博客**：[洛可可白博客](https://bestwishes0203.gitee.io/blog/) \n>\n>- 🐱 **代码获取**：[bestwishes0203](https://gitee.com/bestwishes0203) \n>- 📷  **封面壁纸**：[洛可可白wallpaper](https://wallpaper.seenav.cn/) \n\n', 'http://localhost/images/20240711203043441.jpg', 1);
INSERT INTO `eld_active` VALUES (3, '支部结对聚合力 携手共建保健康', '2024-08-07', '2024-08-11', '安义县前进东路8号', '13488990044', '\n\n**如果对你有帮助，点赞👍、收藏💖、关注🔔是我更新的动力！👋🌟🚀**\n\n## 🎉 往期精彩回顾\n\n\n| **[VS Code上搭建Vue开发环境](https://blog.csdn.net/interest_ing_/article/details/125754543)** |\n| :----------------------------------------------------------- |\n| **[如何从零开始创建React应用：简易指南](https://blog.csdn.net/interest_ing_/article/details/137846547)** |\n| **[爆肝3k字！掌握Spring与Redis的高效交互：从Jedis到Spring Data Redis](https://blog.csdn.net/interest_ing_/article/details/137846121)** |\n| **[Spring Boot 多环境配置：YML 文件的三种高效方法](https://blog.csdn.net/interest_ing_/article/details/137845013)** |\n| **[Vue项目实战：基于用户身份的动态路由管理](https://blog.csdn.net/interest_ing_/article/details/137759056)** |\n| **[Vite多环境配置与打包：灵活高效的Vue开发工作流](https://blog.csdn.net/interest_ing_/article/details/137758784)** |\n| **[前端实现自动获取农历日期：探索JavaScript的跨文化编程](https://blog.csdn.net/interest_ing_/article/details/137730085)** |\n| **[自定义滚动条样式：前端实现跨浏览器兼容](https://blog.csdn.net/interest_ing_/article/details/137729892)** |\n| **[Windows Edge 兼容性问题修复：提升用户体验的关键步骤](https://blog.csdn.net/interest_ing_/article/details/137617926)** |\n| **[Vue2和Vue3组件通信：父子与兄弟间的桥梁](https://blog.csdn.net/interest_ing_/article/details/137617666)** |\n\n', 'http://localhost/images/20240711203050358.jpg', 1);

-- ----------------------------
-- Table structure for eld_active_sh
-- ----------------------------
DROP TABLE IF EXISTS `eld_active_sh`;
CREATE TABLE `eld_active_sh`  (
  `sh_id` int NOT NULL AUTO_INCREMENT,
  `sh_active_id` int NOT NULL COMMENT '活动',
  `sh_user_id` int NOT NULL COMMENT '用户',
  `sh_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '日期',
  `sh_checked` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '待审核' COMMENT '审核',
  `sh_advice` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '意见',
  `status` int NULL DEFAULT 1 COMMENT '状态（1正常 0禁用）',
  PRIMARY KEY (`sh_id`) USING BTREE,
  INDEX `eld_active_sh_eld_active_active_id_fk`(`sh_active_id` ASC) USING BTREE,
  INDEX `eld_active_sh_eld_user_user_id_fk`(`sh_user_id` ASC) USING BTREE,
  CONSTRAINT `eld_active_sh_eld_active_active_id_fk` FOREIGN KEY (`sh_active_id`) REFERENCES `eld_active` (`active_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `eld_active_sh_eld_user_user_id_fk` FOREIGN KEY (`sh_user_id`) REFERENCES `eld_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '报名' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_active_sh
-- ----------------------------
INSERT INTO `eld_active_sh` VALUES (3, 1, 4, '2024-07-15 21:04:30', '审核通过', '可以参加', 1);
INSERT INTO `eld_active_sh` VALUES (5, 3, 4, '2024-07-15 22:39:44', '审核拒绝', '不可以参加', 1);
INSERT INTO `eld_active_sh` VALUES (6, 1, 5, '2024-07-15 22:39:44', '审核拒绝', NULL, 1);
INSERT INTO `eld_active_sh` VALUES (17, 2, 4, '2024-07-17 19:31:00', '待审核', NULL, 1);

-- ----------------------------
-- Table structure for eld_elder
-- ----------------------------
DROP TABLE IF EXISTS `eld_elder`;
CREATE TABLE `eld_elder`  (
  `elder_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `elder_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `elder_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `elder_tag` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `elder_price` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '价格',
  `elder_address` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `elder_date` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '成立日期',
  `elder_cover` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
  `elder_bed` int NULL DEFAULT NULL COMMENT '房间数',
  `elder_area` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '面积',
  `elder_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `elder_jd` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '经度',
  `elder_wd` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '纬度',
  `status` int NULL DEFAULT 1 COMMENT '状态（1正常 0禁用）',
  PRIMARY KEY (`elder_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '养老院' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_elder
-- ----------------------------
INSERT INTO `eld_elder` VALUES (3, '泰康之家·徽园', '# 泰康之家·徽园\n\n\nNode.js是一个流行的JavaScript运行环境，用于构建各种类型的应用程序，从简单的Web应用到复杂的企业级后端服务。Node Version Manager（nvm）是一个命令行工具，它允许开发者在同一台机器上安装和切换不同版本的Node.js。本文将详细介绍nvm的作用、在不同操作系统下的安装方法，以及如何使用nvm来管理Node.js版本。\n\n------------------------------------\n\n\n![泰康之家·徽园](http://localhost/images/20240711202857501.png)\n\n## nvm的作用\n\nnvm的主要作用包括：\n\n1. **多版本管理**：允许在同一台机器上安装多个版本的Node.js。\n2. **无缝切换**：轻松切换当前使用的Node.js版本。\n3. **简化安装**：简化了Node.js的安装过程，尤其是对于尚未正式发布的版本。\n4. **环境隔离**：每个Node.js版本独立安装，互不干扰。\n\n## 安装nvm\n\nnvm的安装过程因操作系统而异。以下是在Linux/macOS和Windows上的安装方法：\n\n### Linux/macOS\n\n1. 安装nvm。可以通过克隆nvm仓库的方式来安装：\n\n```bash\ncurl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash\n```\n\n或者使用wget：\n\n```bash\nwget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash\n```\n\n2. 重启终端或运行`source ~/.bashrc`（或对应的shell配置文件）以使nvm生效。\n\n3. 验证安装是否成功：\n\n```bash\ncommand -v nvm\n```\n\n如果返回`nvm`，则表示安装成功。\n\n### Windows\n\n在Windows上，可以使用nvm-windows来管理Node.js版本。\n\n1. 下载nvm-setup.zip文件，可以从nvm-windows的[GitHub发布页面](https://github.com/coreybutler/nvm-windows/releases)获取。\n\n2. 解压缩下载的文件，并运行`nvm-setup.zip`中的`nvm-setup.exe`安装程序。\n\n3. 解压或安装目录不能有空格！\n\n4. 安装完成后，重启计算机或重新启动命令提示符。\n\n5. 打开命令提示符或PowerShell，输入以下命令来验证安装：\n\n```bash\nnvm --version\n```\n\n如果返回版本号，则表示安装成功。\n\n## 使用nvm\n\n### 安装Node.js版本\n\n要安装一个Node.js版本，使用`nvm install`命令：\n\n```bash\nnvm install 14.17.0\n```\n\n### 列出已安装的版本\n\n使用`nvm ls`命令查看已安装的Node.js版本：\n\n```bash\nnvm ls\n```\n\n### 切换Node.js版本\n\n要切换到一个已安装的Node.js版本，使用`nvm use`命令：\n\n```bash\nnvm use 14.17.0\n```\n\n### 设置默认Node.js版本\n\n如果你想为当前用户设置默认的Node.js版本，可以使用`nvm alias`命令：\n\n```bash\nnvm alias default 14.17.0\n```\n\n这样，每次打开新的终端会话时，都会自动使用14.17.0版本。\n\n### 查看可用的Node.js版本\n\n要查看所有可用的Node.js版本，可以使用`nvm ls-remote`命令：\n\n```bash\nnvm ls-remote\n```\n\n### 卸载Node.js版本\n\n要卸载一个Node.js版本，使用`nvm uninstall`命令：\n\n```bash\nnvm uninstall 14.17.0\n```\n\n## 更多`nvm`命令行\n\n```basg\nnvm -h\n```\n\n\n\n\n\n## 总结\n\nnvm是一个跨平台的工具，它极大地简化了Node.js版本的管理。无论是在Linux/macOS还是Windows上，nvm都提供了一致的体验，使开发者能够轻松地在不同版本的Node.js之间切换，以适应不同项目的需求。掌握nvm的使用，对于Node.js开发者来说是一项宝贵的技能。\n\n\n\n\n\n**如果对你有帮助，点赞👍、收藏💖、关注🔔是我更新的动力！👋🌟🚀**', '环境优美', '2020元起/月', '安徽 ▪ 合肥 ▪ 包河区 贵阳路与云南路交叉口东北侧', '2001-10-03', 'http://localhost/images/20240711234545396.png', 300, '约8万平米', '13877669944', '11', '11', 1);
INSERT INTO `eld_elder` VALUES (4, '九久夕阳红养老集团', '# 九久夕阳红养老集团\n\nNode.js是一个流行的JavaScript运行环境，用于构建各种类型的应用程序，从简单的Web应用到复杂的企业级后端服务。Node Version Manager（nvm）是一个命令行工具，它允许开发者在同一台机器上安装和切换不同版本的Node.js。本文将详细介绍nvm的作用、在不同操作系统下的安装方法，以及如何使用nvm来管理Node.js版本。\n\n## nvm的作用\n\nnvm的主要作用包括：\n\n1. **多版本管理**：允许在同一台机器上安装多个版本的Node.js。\n2. **无缝切换**：轻松切换当前使用的Node.js版本。\n3. **简化安装**：简化了Node.js的安装过程，尤其是对于尚未正式发布的版本。\n4. **环境隔离**：每个Node.js版本独立安装，互不干扰。\n\n## 安装nvm\n\nnvm的安装过程因操作系统而异。以下是在Linux/macOS和Windows上的安装方法：\n\n### Linux/macOS\n\n1. 安装nvm。可以通过克隆nvm仓库的方式来安装：\n\n```bash\ncurl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash\n```\n\n或者使用wget：\n\n```bash\nwget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash\n```\n\n2. 重启终端或运行`source ~/.bashrc`（或对应的shell配置文件）以使nvm生效。\n\n3. 验证安装是否成功：\n\n```bash\ncommand -v nvm\n```\n\n如果返回`nvm`，则表示安装成功。\n\n### Windows\n\n在Windows上，可以使用nvm-windows来管理Node.js版本。\n\n1. 下载nvm-setup.zip文件，可以从nvm-windows的[GitHub发布页面](https://github.com/coreybutler/nvm-windows/releases)获取。\n\n2. 解压缩下载的文件，并运行`nvm-setup.zip`中的`nvm-setup.exe`安装程序。\n\n3. 解压或安装目录不能有空格！\n\n4. 安装完成后，重启计算机或重新启动命令提示符。\n\n5. 打开命令提示符或PowerShell，输入以下命令来验证安装：\n\n```bash\nnvm --version\n```\n\n如果返回版本号，则表示安装成功。\n\n## 使用nvm\n\n### 安装Node.js版本\n\n要安装一个Node.js版本，使用`nvm install`命令：\n\n```bash\nnvm install 14.17.0\n```\n\n### 列出已安装的版本\n\n使用`nvm ls`命令查看已安装的Node.js版本：\n\n```bash\nnvm ls\n```\n\n### 切换Node.js版本\n\n要切换到一个已安装的Node.js版本，使用`nvm use`命令：\n\n```bash\nnvm use 14.17.0\n```\n\n### 设置默认Node.js版本\n\n如果你想为当前用户设置默认的Node.js版本，可以使用`nvm alias`命令：\n\n```bash\nnvm alias default 14.17.0\n```\n\n这样，每次打开新的终端会话时，都会自动使用14.17.0版本。\n\n### 查看可用的Node.js版本\n\n要查看所有可用的Node.js版本，可以使用`nvm ls-remote`命令：\n\n```bash\nnvm ls-remote\n```\n\n### 卸载Node.js版本\n\n要卸载一个Node.js版本，使用`nvm uninstall`命令：\n\n```bash\nnvm uninstall 14.17.0\n```\n\n## 更多`nvm`命令行\n\n```basg\nnvm -h\n```\n\n\n\n\n\n## 总结\n\nnvm是一个跨平台的工具，它极大地简化了Node.js版本的管理。无论是在Linux/macOS还是Windows上，nvm都提供了一致的体验，使开发者能够轻松地在不同版本的Node.js之间切换，以适应不同项目的需求。掌握nvm的使用，对于Node.js开发者来说是一项宝贵的技能。\n\n\n\n\n\n**如果对你有帮助，点赞👍、收藏💖、关注🔔是我更新的动力！👋🌟🚀**', '餐饮丰富', '2020元起/月', '安徽 ▪ 合肥 ▪ 包河区 贵阳路与云南路交叉口东北侧', '2001-10-03', 'http://localhost/images/20240711202806879.jpg', 300, '约8万平米', '13877669944', '11', '11', 1);
INSERT INTO `eld_elder` VALUES (5, '丰盛爱心护理院', '# 丰盛爱心护理院\n\nNode.js是一个流行的JavaScript运行环境，用于构建各种类型的应用程序，从简单的Web应用到复杂的企业级后端服务。Node Version Manager（nvm）是一个命令行工具，它允许开发者在同一台机器上安装和切换不同版本的Node.js。本文将详细介绍nvm的作用、在不同操作系统下的安装方法，以及如何使用nvm来管理Node.js版本。\n\n## nvm的作用\n\nnvm的主要作用包括：\n\n1. **多版本管理**：允许在同一台机器上安装多个版本的Node.js。\n2. **无缝切换**：轻松切换当前使用的Node.js版本。\n3. **简化安装**：简化了Node.js的安装过程，尤其是对于尚未正式发布的版本。\n4. **环境隔离**：每个Node.js版本独立安装，互不干扰。\n\n## 安装nvm\n\nnvm的安装过程因操作系统而异。以下是在Linux/macOS和Windows上的安装方法：\n\n### Linux/macOS\n\n1. 安装nvm。可以通过克隆nvm仓库的方式来安装：\n\n```bash\ncurl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash\n```\n\n或者使用wget：\n\n```bash\nwget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash\n```\n\n2. 重启终端或运行`source ~/.bashrc`（或对应的shell配置文件）以使nvm生效。\n\n3. 验证安装是否成功：\n\n```bash\ncommand -v nvm\n```\n\n如果返回`nvm`，则表示安装成功。\n\n### Windows\n\n在Windows上，可以使用nvm-windows来管理Node.js版本。\n\n1. 下载nvm-setup.zip文件，可以从nvm-windows的[GitHub发布页面](https://github.com/coreybutler/nvm-windows/releases)获取。\n\n2. 解压缩下载的文件，并运行`nvm-setup.zip`中的`nvm-setup.exe`安装程序。\n\n3. 解压或安装目录不能有空格！\n\n4. 安装完成后，重启计算机或重新启动命令提示符。\n\n5. 打开命令提示符或PowerShell，输入以下命令来验证安装：\n\n```bash\nnvm --version\n```\n\n如果返回版本号，则表示安装成功。\n\n## 使用nvm\n\n### 安装Node.js版本\n\n要安装一个Node.js版本，使用`nvm install`命令：\n\n```bash\nnvm install 14.17.0\n```\n\n### 列出已安装的版本\n\n使用`nvm ls`命令查看已安装的Node.js版本：\n\n```bash\nnvm ls\n```\n\n### 切换Node.js版本\n\n要切换到一个已安装的Node.js版本，使用`nvm use`命令：\n\n```bash\nnvm use 14.17.0\n```\n\n### 设置默认Node.js版本\n\n如果你想为当前用户设置默认的Node.js版本，可以使用`nvm alias`命令：\n\n```bash\nnvm alias default 14.17.0\n```\n\n这样，每次打开新的终端会话时，都会自动使用14.17.0版本。\n\n### 查看可用的Node.js版本\n\n要查看所有可用的Node.js版本，可以使用`nvm ls-remote`命令：\n\n```bash\nnvm ls-remote\n```\n\n### 卸载Node.js版本\n\n要卸载一个Node.js版本，使用`nvm uninstall`命令：\n\n```bash\nnvm uninstall 14.17.0\n```\n\n## 更多`nvm`命令行\n\n```basg\nnvm -h\n```\n\n\n\n\n\n## 总结\n\nnvm是一个跨平台的工具，它极大地简化了Node.js版本的管理。无论是在Linux/macOS还是Windows上，nvm都提供了一致的体验，使开发者能够轻松地在不同版本的Node.js之间切换，以适应不同项目的需求。掌握nvm的使用，对于Node.js开发者来说是一项宝贵的技能。\n\n\n\n\n\n**如果对你有帮助，点赞👍、收藏💖、关注🔔是我更新的动力！👋🌟🚀**', '餐饮丰富', '2020元起/月', '安徽 ▪ 合肥 ▪ 包河区 贵阳路与云南路交叉口东北侧', '2001-10-03', 'http://localhost/images/20240711202823404.png', 300, '约8万平米', '13877669944', '11', '11', 1);
INSERT INTO `eld_elder` VALUES (6, '光明老年护理院', '\n# 光明老年护理院\n掌握Node Version Manager（nvm）：跨平台Node.js版本管理\n\nNode.js是一个流行的JavaScript运行环境，用于构建各种类型的应用程序，从简单的Web应用到复杂的企业级后端服务。Node Version Manager（nvm）是一个命令行工具，它允许开发者在同一台机器上安装和切换不同版本的Node.js。本文将详细介绍nvm的作用、在不同操作系统下的安装方法，以及如何使用nvm来管理Node.js版本。\n\n## nvm的作用\n\nnvm的主要作用包括：\n\n1. **多版本管理**：允许在同一台机器上安装多个版本的Node.js。\n2. **无缝切换**：轻松切换当前使用的Node.js版本。\n3. **简化安装**：简化了Node.js的安装过程，尤其是对于尚未正式发布的版本。\n4. **环境隔离**：每个Node.js版本独立安装，互不干扰。\n\n## 安装nvm\n\nnvm的安装过程因操作系统而异。以下是在Linux/macOS和Windows上的安装方法：\n\n### Linux/macOS\n\n1. 安装nvm。可以通过克隆nvm仓库的方式来安装：\n\n```bash\ncurl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash\n```\n\n或者使用wget：\n\n```bash\nwget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash\n```\n\n2. 重启终端或运行`source ~/.bashrc`（或对应的shell配置文件）以使nvm生效。\n\n3. 验证安装是否成功：\n\n```bash\ncommand -v nvm\n```\n\n如果返回`nvm`，则表示安装成功。\n\n### Windows\n\n在Windows上，可以使用nvm-windows来管理Node.js版本。\n\n1. 下载nvm-setup.zip文件，可以从nvm-windows的[GitHub发布页面](https://github.com/coreybutler/nvm-windows/releases)获取。\n\n2. 解压缩下载的文件，并运行`nvm-setup.zip`中的`nvm-setup.exe`安装程序。\n\n3. 解压或安装目录不能有空格！\n\n4. 安装完成后，重启计算机或重新启动命令提示符。\n\n5. 打开命令提示符或PowerShell，输入以下命令来验证安装：\n\n```bash\nnvm --version\n```\n\n如果返回版本号，则表示安装成功。\n\n## 使用nvm\n\n### 安装Node.js版本\n\n要安装一个Node.js版本，使用`nvm install`命令：\n\n```bash\nnvm install 14.17.0\n```\n\n### 列出已安装的版本\n\n使用`nvm ls`命令查看已安装的Node.js版本：\n\n```bash\nnvm ls\n```\n\n### 切换Node.js版本\n\n要切换到一个已安装的Node.js版本，使用`nvm use`命令：\n\n```bash\nnvm use 14.17.0\n```\n\n### 设置默认Node.js版本\n\n如果你想为当前用户设置默认的Node.js版本，可以使用`nvm alias`命令：\n\n```bash\nnvm alias default 14.17.0\n```\n\n这样，每次打开新的终端会话时，都会自动使用14.17.0版本。\n\n### 查看可用的Node.js版本\n\n要查看所有可用的Node.js版本，可以使用`nvm ls-remote`命令：\n\n```bash\nnvm ls-remote\n```\n\n### 卸载Node.js版本\n\n要卸载一个Node.js版本，使用`nvm uninstall`命令：\n\n```bash\nnvm uninstall 14.17.0\n```\n\n## 更多`nvm`命令行\n\n```basg\nnvm -h\n```\n\n\n\n\n\n## 总结\n\nnvm是一个跨平台的工具，它极大地简化了Node.js版本的管理。无论是在Linux/macOS还是Windows上，nvm都提供了一致的体验，使开发者能够轻松地在不同版本的Node.js之间切换，以适应不同项目的需求。掌握nvm的使用，对于Node.js开发者来说是一项宝贵的技能。\n\n\n\n\n\n**如果对你有帮助，点赞👍、收藏💖、关注🔔是我更新的动力！👋🌟🚀**', '餐饮丰富', '2020元起/月', '安徽 ▪ 合肥 ▪ 包河区 贵阳路与云南路交叉口东北侧', '2001-10-03', 'http://localhost/images/20240711202831735.png', 300, '约8万平米', '13877669944', '11', '11', 1);

-- ----------------------------
-- Table structure for eld_manager
-- ----------------------------
DROP TABLE IF EXISTS `eld_manager`;
CREATE TABLE `eld_manager`  (
  `manager_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `manager_acc` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账号',
  `manager_pwd` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `manager_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `manager_sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `manager_age` int NULL DEFAULT NULL COMMENT '年龄',
  `manager_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `manager_address` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `status` int NULL DEFAULT 1 COMMENT '状态(1 正常 0 禁用)',
  PRIMARY KEY (`manager_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_manager
-- ----------------------------
INSERT INTO `eld_manager` VALUES (1, '1', 'c4ca4238a0b923820dcc509a6f75849b', '何福海', '男', 1, '1', '', 1);
INSERT INTO `eld_manager` VALUES (3, '11', 'c4ca4238a0b923820dcc509a6f75849b', '11', '男', 11, '11', '', 1);

-- ----------------------------
-- Table structure for eld_notice
-- ----------------------------
DROP TABLE IF EXISTS `eld_notice`;
CREATE TABLE `eld_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `notice_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `status` int NULL DEFAULT 1 COMMENT '状态（1正常 0禁用）',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_notice
-- ----------------------------

-- ----------------------------
-- Table structure for eld_review
-- ----------------------------
DROP TABLE IF EXISTS `eld_review`;
CREATE TABLE `eld_review`  (
  `review_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `review_user_id` int NULL DEFAULT NULL COMMENT '用户',
  `review_date` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日期',
  `review_content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `review_star` int NULL DEFAULT NULL COMMENT '点赞',
  `status` int NULL DEFAULT 1 COMMENT '状态(1 正常 0 禁用)',
  PRIMARY KEY (`review_id`) USING BTREE,
  INDEX `eld_review_eld_user_user_id_fk`(`review_user_id` ASC) USING BTREE,
  CONSTRAINT `eld_review_eld_user_user_id_fk` FOREIGN KEY (`review_user_id`) REFERENCES `eld_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_review
-- ----------------------------

-- ----------------------------
-- Table structure for eld_serve
-- ----------------------------
DROP TABLE IF EXISTS `eld_serve`;
CREATE TABLE `eld_serve`  (
  `serve_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serve_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `serve_cover` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
  `serve_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `status` int NULL DEFAULT 1 COMMENT '状态（1正常 0禁用）',
  PRIMARY KEY (`serve_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '服务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_serve
-- ----------------------------
INSERT INTO `eld_serve` VALUES (1, '社区文化服务', 'http://localhost/images/20240711203007824.png', '提供丰富多彩的文化娱乐活动，包括舞蹈、歌唱比赛、户外跑步等活动', 1);
INSERT INTO `eld_serve` VALUES (2, '社区心理健康服务', 'http://localhost/images/20240711203015387.png', '提供心理问题咨询，帮助老人疏导心理障碍，改善老人心理环境', 1);
INSERT INTO `eld_serve` VALUES (3, '社区维修服务', 'http://localhost/images/20240711202923435.png', '提供一般小型家用电器维修，手机维修，电子器件维修，家具维修', 1);
INSERT INTO `eld_serve` VALUES (4, '社区医疗服务', 'http://localhost/images/20240711202931607.png', '提供老人血压、血糖、血脂免费检查，提供一般常规项目检查', 1);

-- ----------------------------
-- Table structure for eld_serve_sh
-- ----------------------------
DROP TABLE IF EXISTS `eld_serve_sh`;
CREATE TABLE `eld_serve_sh`  (
  `sh_id` int NOT NULL AUTO_INCREMENT,
  `sh_serve_id` int NOT NULL COMMENT '服务',
  `sh_user_id` int NOT NULL COMMENT '用户',
  `sh_date` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日期',
  `sh_checked` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '待审核' COMMENT '审核',
  `sh_advice` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '意见',
  `status` int NULL DEFAULT 1 COMMENT '状态（1正常 0禁用）',
  PRIMARY KEY (`sh_id`) USING BTREE,
  INDEX `eld_serve_sh_eld_serve_serve_id_fk`(`sh_serve_id` ASC) USING BTREE,
  INDEX `eld_serve_sh_eld_user_user_id_fk`(`sh_user_id` ASC) USING BTREE,
  CONSTRAINT `eld_serve_sh_eld_serve_serve_id_fk` FOREIGN KEY (`sh_serve_id`) REFERENCES `eld_serve` (`serve_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `eld_serve_sh_eld_user_user_id_fk` FOREIGN KEY (`sh_user_id`) REFERENCES `eld_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '预约' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_serve_sh
-- ----------------------------
INSERT INTO `eld_serve_sh` VALUES (3, 2, 4, '2024-07-28 10:00:00', '审核拒绝', '测试', 1);

-- ----------------------------
-- Table structure for eld_sort
-- ----------------------------
DROP TABLE IF EXISTS `eld_sort`;
CREATE TABLE `eld_sort`  (
  `sort_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `status` int NULL DEFAULT 1 COMMENT '状态(1 正常 0 禁用)',
  PRIMARY KEY (`sort_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '类别' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_sort
-- ----------------------------
INSERT INTO `eld_sort` VALUES (1, '全部', 1);
INSERT INTO `eld_sort` VALUES (2, '养老动态', 1);
INSERT INTO `eld_sort` VALUES (3, '养老政策', 1);
INSERT INTO `eld_sort` VALUES (4, '养老服务', 1);
INSERT INTO `eld_sort` VALUES (5, '养老模式', 1);
INSERT INTO `eld_sort` VALUES (9, '养老产业', 1);

-- ----------------------------
-- Table structure for eld_sort_news
-- ----------------------------
DROP TABLE IF EXISTS `eld_sort_news`;
CREATE TABLE `eld_sort_news`  (
  `news_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_sort_id` int NOT NULL COMMENT '类别',
  `news_title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `news_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `news_date` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日期',
  `news_cover` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
  `news_looks` int NULL DEFAULT 0 COMMENT '阅读',
  `status` int NULL DEFAULT 1 COMMENT '状态(1 正常 0 禁用)',
  PRIMARY KEY (`news_id`) USING BTREE,
  INDEX `eld_sort_news_eld_sort_sort_id_fk`(`news_sort_id` ASC) USING BTREE,
  CONSTRAINT `eld_sort_news_eld_sort_sort_id_fk` FOREIGN KEY (`news_sort_id`) REFERENCES `eld_sort` (`sort_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '资讯' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_sort_news
-- ----------------------------
INSERT INTO `eld_sort_news` VALUES (1, 2, '市卫生健康委领导参观历城区养老服务中心，肯定医养结合服务内容', '### 情暖寒冬，关爱老人。\n为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。\n\n# 一级标题\n\n### 三级标题\n\n\n', '2023-12-01', 'http://localhost/images/20240712100538175.jpg', 12, 1);
INSERT INTO `eld_sort_news` VALUES (3, 2, '特困老人的“温暖使者”', '### 特困老人的“温暖使者”\n“大娘，我又来看您啦！”每月16日，是沭阳县万匹乡丁蒋村姜根英老人“家访”的日子，走进院里的是一位身材魁悟的中年汉子，他一边招呼同来的人打扫院子、整理被褥、洗衣服，一边为老人洗头、聊家常……这位‘家访’的老哥叫杨光来，是沭阳县万匹乡敬老院院长。”姜根英老人说，“自己82岁了，有个残疾儿子，平时弄口饭吃还凑合，打扫卫生就吃力了，幸好县里搞高龄老人上门照料服务，杨院长他们每月都会来家里服务，还带儿子洗澡，为我减轻了一大负担。”', '2024-07-03', 'http://localhost/images/20240712100627040.png', 10, 1);
INSERT INTO `eld_sort_news` VALUES (4, 5, '新型养老模式造福老人：以前再麻烦的事，有了他们，也能解决了', '在数字时代下，全民科技进步，但对于老年人来说，很多事情却变成了“麻烦”，如果期望老人像年轻人一样，完全掌握当下的电子信息化生活，并不现实，那么如果能为老年人提供更贴心、更直接的服务，让老人不至于被大踏步的新社会“抛弃”，已经成为刻不容缓的事情。\n\n这个时候，就不得不提一下我国飞速发展的养老行业，“十三五”以来，我国养老服务事业取得全方位进步。各种新型的养老模式正展开“双臂”准备拥抱更多需要帮助的老人们。', '2024-07-03', 'http://localhost/images/20240714104558127.4b369e29', 3, 1);
INSERT INTO `eld_sort_news` VALUES (5, 2, '西乡街道麻布社区开展“抗压有方”麻布社区长者慢病管理小组活动', '群众利益无小事,慢病防控是大事”，为了满足长者对于慢病健康知识的需求，且有利于其日常健康的自我管理，12月5日至12月15日，尚德驻麻布社区党群服务中心社工开展了麻布社区新时代文明实践站活动暨“抗压有方”麻布社区长者慢病管理小组，本次小组共吸引了72人次长者报名参与，旨在通过多种方式为长者群体传递健康知识，为其提供一个学习的平台。', '2023-07-30', 'http://localhost/images/20240712102815613.png', 5, 1);
INSERT INTO `eld_sort_news` VALUES (6, 4, '冬至吃饺子，九九养老•玖悦颐养中心陪你过一个温暖的节日！', '### 冬至不端饺子碗，冻掉耳朵没人管。\n\n老话说“冬至大如年”，按照北方的传统，冬至是必须要吃饺子的！这不仅是一种文化习俗的传承，也是一种颇有仪式感的情感表达。\n\n饺子形如元宝，是福气和财源的象征，另一方面在包饺子的时候全家齐上阵，热热闹闹，也是团圆幸福的象征。所以每到冬至吃饺子就是北方人的执念。\n\n冬至这天，高新区社会事业服务局和锦业路社区的志愿者们来到高新区丈八街道综合养老服务中心（玖悦颐养中心），和长者们一起包饺子。\n\n厨房已经帮大家准备好食材，长者和志愿者们相互配合、分工合作，擀皮、包馅，共享厨房里欢笑声、交谈声、锅碗瓢盆的撞击声交织在一起，气氛欢乐融洽、热闹非凡。', '2023-11-10', 'http://localhost/images/20240712112302281.jpg', 0, 1);
INSERT INTO `eld_sort_news` VALUES (7, 3, '印发推动乡镇敬老院高质量发展十条措施的通知', '### 各县 （区）人民政府、抚州高新区管委会、东临新区管委会，市政府各部门：\n\n为贯彻落实《江西省人民政府办公厅关于加快推进养老服务高质量发展的实施意见》（赣府厅发〔2021〕16号）、《江西省民政厅中共江西省委编办江西省发展改革委江西省财政厅江西省人力资源和社会保障厅关于深化公办养老机构改革的实施意见》（赣民发〔2021〕12号）等文件精神，加快补齐农村养老服务短板，全面构建满足农村老年人需求的新时代农村养老服务体系，不断满足农村老人日益增长的养老需求,结合抚州实际，提出推动乡镇敬老院高质量发展十条措施如下:\n\n一、推进乡镇敬老院规划建设。依照 《老年人照料设施建筑设计标准》（ JGJ450-2018）、《老年养护院建设标准》（建标144-2010）等标准，各县（区）人民政府要对规模小、条件差，难以满足养老服务发展需求的乡镇敬老院，积极统筹政府专项债、中央预算内项目资金，加快推进乡镇敬老院新建、改建或扩建，单体项目床位设置规模原则上不超过150张，其中新建护理型床位占比不低于60%，改建或扩建护理型床位占比不低于50%。\n\n二、提升乡镇敬老院居住环境。按照《江西省公办养老院改造提升实施方案（2020-2022年）》，对乡镇敬老院实施建筑标准、设施设备、院区场地、用房功能等改造提升。 2022年6月前，乡镇敬老院具备安装空调条件的老人居室、活动室要全部安装完成； 2022年底前，新建、改扩建和改造提升后的乡镇敬老院须达到《江西省公办养老院服务设施改造提升基础指标》要求。依照《江西省公办养老院适老化改造指南》，对在运营的乡镇敬老院实施适老化改造， 2022年底前完成80%以上，且全部达到一级或二级养老机构标准。\n\n三、统筹区域养老服务资源配置。原则上按每2至3个毗邻乡镇组成一个协作区域，选择该区域内一所设施条件较好、床位规模较多、交通便利的乡镇敬老院作为区域性中心敬老院，负责接收协作区域内其他乡镇敬老院转送的特困供养障对象。对现有床位数不足40张且收住人数少于10人的乡镇敬老院，可将收住对象安置到毗邻乡镇或区域性中心敬老院，相关经费按标准一并划入接收机构。原有设施不得改变养老服务用途，可通过公建民营方式交由社会力量运营，或用于居家社区养老服务和农村互助养老服务。到2022年底前，各县 （区）在运营的乡镇敬老院入住率达到60%以上。\n\n四、优化乡镇敬老院功能定位。乡镇敬老院要从兜底保障服务机构向区域养老服务中心转型，为周边老年人提供短期托养、日间照料、家庭养老床位以及助餐、助浴、助洁、助急、助医等养老延伸服务。到2022年底前，乡镇敬老院在满足特困人员集中供养服务需求的前提下，逐步满足其他经济困难的高龄、失能老年人社会化照护托养需求。\n\n五、推进乡镇敬老院改革。按照《江西省养老服务设施公建民营暂行办法》要求，对符合国家规定并需要实施公建民营的，综合从业信誉、服务水平、可持续性等指标，引入品牌化、专业化的服务机构、社会组织承接运营。公建民营协议要明确约定保留不低于20%的床位用于接收政府供养和基本养老服务保障对象，确保公益属性。公建民营乡镇敬老院接收特殊困难群体的服务收费标准，由相关部门按照普惠性原则合理确定。\n\n六、推进乡镇敬老院人事制度改革。根据省民政厅、省委编办等5部门联合下发的《关于深化公办养老机构改革的实施意见》（以下简称 《实施意见》）要求，2022年1月起，乡镇敬老院核定事业编制岗位出现空缺的，应根据国家和我省事业单位公开招聘制度等有关规定进行公开招聘，列入正式事业编制。《实施意见》下发之前，通过公开选聘方式聘用、实行定编定岗不定人管理的人员，在聘期内享受事业单位国家规定的工资福利待遇，参照事业单位同类人员缴费基数缴纳社会保险。\n\n七、加强乡镇敬老院管理人员考核。县（区）民政部门或乡镇人民政府要加强对乡镇敬老院管理人员的规范管理，建立健全人员管理制度和管理人员考核办法，重点考核服务数量和质量、管理水平、运营效率、持续发展、满意度评价等。建立按岗定酬、按工作业绩取酬的内部分配激励机制，考核结果与职务职级晋升、奖惩、薪酬分配挂钩。\n\n八、做好乡镇敬老院消防改造工作。按照养老机构消防安全专项整治三年行动要求，县（区）人民政府要加强协调调度，妥善解决乡镇敬老院消防审验历史遗留问题。对局部设施条件落后、功能不完善、安全不达标的乡镇敬老院实施改造提升，重点对涉及底线的安全设施设备进行维修和配置。对符合消防安全要求的乡镇敬老院，因未办理土地、规划等手续问题未能通过消防审验的，由属地县（区）政府按规定集中研究处理。\n\n九、健全乡镇敬老院综合监管。建立以“双随机、一公开”监管为基本手段、以重点监管为补充、以标准规范为支撑、以信用监管为基础的新型监管机制。建立各司其职、各尽其责的跨部门协同监管机制，对乡镇敬老院消防安全、燃气安全、疫情防控、食品安全、服务安全工作加强事中事后协同监督，实现各部门线索互联、标准互通、结果互认。\n\n十、做好乡镇敬老院经费保障。各县（区）人民政府要把乡镇敬老院正常运营所需经费列入财政预算，并及时足额拨付。入住人数少于或等于10人的，安排运行经费（不含人员工资、绩效等经费）不少于2万元/年；入住人数大于10人的，每增加1人，增加运行经费不少于0.2万元/年。要按照“应储尽储”原则，将乡镇敬老院新建或提升改造工程纳入中央预算内项目和政府专项债券，并做好项目申报前期各项准备工作。\n\n市政府将定期调度各地工作推进情况，对工作推进有力的地方予以通报表扬，并在项目资金安排上予以倾斜；对工作推进不力的地方予以通报批评。各县（区）人民政府要落实属地管理职责，结合实际制定实施方案，细化具体举措，强化督促检查，确保完成各项工作任务。', '2023-10-04', 'http://localhost/images/20240712112350203.png', 0, 1);
INSERT INTO `eld_sort_news` VALUES (8, 3, '【最新】2023年杭州高龄老人生活津贴标准调整啦', '#### 2023年3月1日杭州市民政局、财政局印发《关于调整全市高龄老人生活津贴发放标准的通知》，自2023年3月1日起，杭州市高龄老人生活津贴发放标准调整如下：\n\n1、100周岁（含）以上老人的高龄津贴由原每人每月300元提高到每人每月800元；\n\n2、80（含）—99周岁老人高龄津贴按照省市相关标准执行。\n\n3、本标准自2023年3月1日起施行（2023年1月1日至2023年2月28日期间按本通知相关标准执行）。', '2023-03-10', 'http://localhost/images/20240712112454125.jpg', 0, 1);
INSERT INTO `eld_sort_news` VALUES (9, 9, '社区养老服务中心在并建成', '蝴蝶型的餐桌、舒适的室温、可自由操控的座椅……1月9日，记者走进位于太原三晋国际饭店三层的迎泽区南官坊社区养老服务中心时，顿时感受到这里对老年人细致入微的关爱。该中心于2020年12月30日开始试运营，占地2600平方米，是我省已获批的30个城镇社区幸福养老工程中面积最大、设施和服务项目最完备的养老服务示范中心。\n\n该中心是由省、太原市、迎泽区三级政府提供支持的公益项目，是迎泽区城镇社区幸福养老工程。中心划分为大客厅、社区课堂等8个功能区，可为老人提供多项服务。\n\n根据我省2020年9月下发的《关于支持社区居家养老服务发展的意见》，到2022年，将以太原为标杆，基本实现每个社区具有一处社区养老服务站（点）。目前，太原市已建成7处城区重点养老服务示范中心。\n\n据悉，该中心运营主体为太原市三晋大厦有限公司，老人们的活动场所为公司自有，工作人员为酒店员工，人工成本由酒店承担。“目前，中心日接待量可达到150人，配有25辆送餐车，加上居家上门服务项目，可辐射到迎泽区桥东和迎泽两个街道，为老人们晚年幸福生活提供帮助。”该中心负责人宋小霞说。', '2023-04-01', 'http://localhost/images/20240712112535887.png', 0, 1);

-- ----------------------------
-- Table structure for eld_user
-- ----------------------------
DROP TABLE IF EXISTS `eld_user`;
CREATE TABLE `eld_user`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_pic` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `user_acc` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账号',
  `user_pwd` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `user_sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `user_age` int NULL DEFAULT NULL COMMENT '年龄',
  `user_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `user_address` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `status` int NULL DEFAULT 1 COMMENT '状态(1 正常 0 禁用)',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eld_user
-- ----------------------------
INSERT INTO `eld_user` VALUES (4, 'http://localhost/images/20240717013552269.png', '1', 'c4ca4238a0b923820dcc509a6f75849b', '何福海', '男', 32, '13988006677', '南昌', 1);
INSERT INTO `eld_user` VALUES (5, 'http://localhost/images/20240718000414357.jpeg', '11', 'c4ca4238a0b923820dcc509a6f75849b', '11', '男', 11, '11', '11', 1);
INSERT INTO `eld_user` VALUES (6, 'http://localhost/images/20240717224839965.png', '111', 'c4ca4238a0b923820dcc509a6f75849b', '111', '男', 111, '111', '111', 1);
INSERT INTO `eld_user` VALUES (8, 'http://localhost/images/20240715113750586.png', '2', 'c81e728d9d4c2f636f067f89cc14862c', '2', '男', NULL, '2', NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
