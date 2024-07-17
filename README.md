# 社区养老系统

## 介绍

社区养老系统是一个现代化的养老服务平台，旨在为老年人提供一个便捷、舒适的社区生活环境。该系统采用前后端分离的架构设计，结合了最新的技术栈，以确保系统的高性能和易用性。无论是个人用户还是养老机构，都能通过这个平台享受到智能化的养老服务。

## 软件截图

### 客户端

| 客户端                                                                                  | 客户端                                                                                  |
|--------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| ![客户端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/front/1.jpg)  | ![客户端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/front/2.jpg)  |
| ![客户端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/front/3.jpg)  | ![客户端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/front/4.jpg)  |
| ![客户端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/front/5.jpg)  | ![客户端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/front/6.jpg)  |
| ![客户端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/front/7.jpg)  | ![客户端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/front/8.jpg)  |
| ![客户端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/front/9.jpg)  | ![客户端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/front/10.jpg) |
| ![客户端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/front/11.jpg) | ![客户端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/front/12.jpg) |
| ![客户端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/front/13.jpg) | ![客户端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/front/14.jpg) |

### 管理端

| 管理端                                                                                 | 管理端                                                                                 |
|-------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|
| ![管理端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/back/1.jpg)  | ![管理端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/back/2.jpg)  |
| ![管理端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/back/3.jpg)  | ![管理端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/back/4.jpg)  |
| ![管理端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/back/5.jpg)  | ![管理端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/back/6.jpg)  |
| ![管理端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/back/7.jpg)  | ![管理端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/back/8.jpg)  |
| ![管理端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/back/9.jpg)  | ![管理端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/back/10.jpg) |
| ![管理端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/back/11.jpg) | ![管理端](https://gitee.com/bestwishes0203/Elder-manage/raw/v2/screenshot/back/12.jpg) |

## 技术栈

- **Node.js**：作为后端开发的主要语言，提供了强大的异步处理能力和丰富的模块库。
- **NPM**：Node.js的包管理器，用于管理项目依赖，简化开发流程。
- **Spring Boot**：用于构建快速、易于部署的Spring应用程序，提供了丰富的开发工具和简化的配置。
- **MySQL**：关系型数据库管理系统，用于存储用户数据、服务信息等。
- **Redis**：内存中的数据结构存储系统，用作数据库、缓存和消息代理。
- **Vue.js**：渐进式JavaScript框架，用于构建用户界面和单页应用程序。
- **Vite**：现代化的前端构建工具，提供快速的冷启动和即时的模块热更新。

## 功能特点

- **前后端分离**：前端和后端独立开发，提高了开发效率和系统的可维护性。
- **验证码功能**：增强系统安全性，防止恶意攻击。
- **图片上传**：用户可以上传个人照片或相关文档，方便信息展示和管理。
- **信息管理**：提供用户信息、服务项目等的管理功能，便于用户和管理员操作。
- **后台管理**：管理员可以通过后台管理系统，进行用户管理、数据统计等操作。

## 开发环境

- **IDEA**：集成开发环境，用于编写和管理代码。
- **DataGrap**：数据库管理工具，用于设计和管理MySQL数据库。
- **Webstorm**：前端开发IDE，支持Vue.js等现代前端技术。
- **Apifox**：API开发工具，用于设计、测试和文档化API。
- **Another Redis Desktop Manager**：Redis数据库管理工具，方便开发者操作Redis。
- **Navicat Premium 16**：数据库开发工具，支持多种数据库，包括MySQL和Redis。

## **安装教程**

1. **克隆仓库到本地**：`git clone https://gitee.com/bestwishes0203/le-rongrong-smart-platform`
2. **安装依赖**：`npm install` 或 `yarn`
3. **启动后端服务**：
    - 在后端项目目录下，首先刷新项目依赖：
      ```
      mvn clean install
      ```
    - 然后执行以下命令来启动Spring Boot应用程序：
      ```
      mvn spring-boot:run
      ```
    - 或者，如果你使用的是IntelliJ IDEA，可以直接在IDE中添加服务或手动运行`main`方法来启动。
4. **启动前端服务**：`npm run dev` 或 `yarn dev`
5. **访问应用**：在浏览器中输入 `http://localhost:3000`（前端端口）和 `http://localhost:8080`（后端端口）

## **使用说明**

1. **注册/登录**：用户可以通过注册新账号或使用现有账号登录系统。
2. **信息管理**：用户可以查看和编辑个人信息，上传图片等。
3. **服务浏览**：用户可以浏览社区提供的养老服务项目。
4. **后台管理**：管理员可以管理用户信息、服务项目和系统设置。
5. **活动参与**：用户可以查看社区活动，报名参加。
6. **服务预约**：用户可以预约社区服务。
7. **养老院查看**：用户可以查看养老院信息，查看对比。

## 参与贡献

1. Fork 本仓库到你的Gitee账户。
2. 新建分支：`git checkout -b feature-your-feature`
3. 提交代码：`git commit -am 'Add some feature'`
4. 新建Pull Request：在Gitee上发起PR，等待审核。

## 特技

- 使用多语言Readme支持，如Readme_en.md和Readme_zh.md。
- 通过Gitee官方博客了解最新的开发动态。
- 在Gitee探索页面发现更多优秀的开源项目。
- 参与GVP项目，展示你的开源贡献。
- 使用Gitee官方手册快速上手。
- 关注Gitee封面人物，了解社区风采。

## 🚀 获取笔记

- **后端学习笔记**：[https://gitee.com/bestwishes0203/Front-end-notes](https://gitee.com/bestwishes0203/Front-end-notes)
- **前端学习笔记**：[https://gitee.com/bestwishes0203/Back-end-notes](https://gitee.com/bestwishes0203/Back-end-notes)

---

## 📌 联系方式

如果您对我们的项目感兴趣，或者有任何技术问题想要探讨，欢迎通过以下方式与我联系。我非常期待与您交流，共同学习，共同进步！🌊💡🤖

- **邮箱**：[2109664977@qq.com](mailto:2109664977@qq.com) 📧
- **Gitee**：[https://gitee.com/bestwishes0203](https://gitee.com/bestwishes0203) 🐱
- **GitHub**：[https://github.com/bestwishes0203](https://github.com/bestwishes0203) 🐙
- **CSDN**：[https://blog.csdn.net/interest_ing_/](https://blog.csdn.net/interest_ing_/) 📖
- **个人博客**：[http://bestwishes0203.github.io/blog/](http://bestwishes0203.github.io/blog/) 🏠

---

## 🎉 结语

感谢你的访问，期待与你在技术的道路上相遇！👋🌟🚀

---




