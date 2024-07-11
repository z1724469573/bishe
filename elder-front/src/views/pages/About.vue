<template>
  <el-row justify="center">
    <el-col :span="16">
      <v-md-editor mode="preview" v-model="content"></v-md-editor>
    </el-col>
  </el-row>
</template>

<script setup lang="ts">
import {ref} from "vue";

const content = ref(`

# 😍开发者
## 😁 Bestwishes0203

## 📌 联系方式

如果您对我们的项目感兴趣，或者有任何技术问题想要探讨，欢迎通过以下方式与我联系。我非常期待与您交流，共同学习，共同进步！🌊💡🤖

- **邮箱**：[2109664977@qq.com](mailto:2109664977@qq.com) 📧
- **Gitee**：[https://gitee.com/bestwishes0203](https://gitee.com/bestwishes0203) 🐱
- **GitHub**：[https://github.com/bestwishes0203](https://github.com/bestwishes0203) 🐙
- **CSDN**：[https://blog.csdn.net/interest_ing_/](https://blog.csdn.net/interest_ing_/) 📖
- **个人博客**：[http://bestwishes0203.github.io/blog/](http://bestwishes0203.github.io/blog/) 🏠


## 🤖 个人介绍

 - 欢迎来到我的技术小宇宙！🌌 这里不仅是我记录技术点滴的后花园，也是我分享学习心得和项目经验的乐园。📚 无论你是技术小白还是资深大牛，这里总有一些内容能触动你的好奇心。🔍
 - 作为一名对编程和技术创新充满热情的开发者，我在这里与你分享我对各种技术话题的见解和思考。🤖 我相信，技术的力量能够改变世界，而交流与分享则是我们共同进步的阶梯。🚀


## 🛠️ 技能清单

 - **编程语言**：Java、C、C++、Python、Go、
 - **前端技术**：Jquery、Vue.js、React、Echarts、Threejs
 - **UI设计**: Element-ui、Antd、Color-ui
 - **后端技术**：Spring Boot、Spring Cloud、Mybatis-plus、Swagger
 - **移动开发**：Android
 - **操作系统**：Windows、Ubuntu、CentOS
 - **开发框架**：微信小程序、uni-app、RuoYi
 - **开发工具**：VSCode、IDEA、WebStorm、CLion 、DataGrip 、GoLand 、Eclipse、HbuildX、Navicat、Xshell、Xftp 7、Android Studio、Postman、Apifox
 - **数据库技术**：MySQL、Redis、SQL Server
 - **版本控制**：Git

## 🚀  获取笔记

- **后端学习笔记**：[https://gitee.com/bestwishes0203/Front-end-notes](https://gitee.com/bestwishes0203/Front-end-notes)
- **前端学习笔记**：[https://gitee.com/bestwishes0203/Back-end-notes](https://gitee.com/bestwishes0203/Back-end-notes)


---

## 🎉 结语

感谢你的访问，期待与你在技术的道路上相遇！👋🌟🚀

---

`)
</script>

<style scoped>

</style>
