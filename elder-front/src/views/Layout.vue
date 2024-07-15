<template>
  <el-container>
    <el-header>
      <el-row justify="space-around" align="middle">
        <el-row :gutter="0" align="middle" justify="start">
          <el-image style="width: 40px;height: 40px;" :src="logo" fit="contain"/>
          <b style="font-size: 20px;color: #0753a2;margin-left: 20px;">社区养老系统</b>
        </el-row>
        <el-col :span="11">
          <el-menu
              :default-active="activeIndex"
              mode="horizontal"
              @select="handleSelect"
              router
          >
            <el-menu-item v-for="(item,index) in routes" :index="item.path" style="font-size: 16px;">
              <b>{{ item.name }}</b>
            </el-menu-item>
          </el-menu>
        </el-col>
        <el-dropdown>
          <el-row align="middle">
            <el-avatar style="margin-right: 20px;" shape="square" :src="user.pic"/>
            <span>
                {{ user.name }}
                <el-icon> <arrow-down/> </el-icon>
              </span>
          </el-row>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item>我报名的活动</el-dropdown-item>
              <el-dropdown-item>我预约的服务</el-dropdown-item>
              <el-dropdown-item divided @click="loginOut">退出</el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </el-row>
    </el-header>
    <el-main>
      <RouterView/>
    </el-main>
    <el-footer style="color: #666;font-size: 14px;">
      <el-row justify="center">
        <p style="margin: 10px 0;">社区养老系统 客服电话 010-55669988</p>
      </el-row>
      <el-row justify="center" style="padding-bottom: 30px;">
        <p>CopyRight© 2001-2023 Bestwishes0203版权所有</p>
      </el-row>
    </el-footer>
  </el-container>
</template>

<script setup lang="ts">
import {onMounted, ref} from 'vue'
import {ArrowDown} from '@element-plus/icons-vue'
import {RouterView} from 'vue-router';
import router from "@/router";
import logo from "@/assets/logo.png"

onMounted(() => {
  if (localStorage.getItem("activeIndex")) {
    activeIndex.value = localStorage.getItem("activeIndex");
  }
  if (localStorage.getItem("user")) {
    user.value = JSON.parse(localStorage.getItem("user"));
  }
})

const activeIndex = ref('')
const user = ref('')
const handleSelect = (key: string, keyPath: string[]) => {
  localStorage.setItem("activeIndex", key);
}

const loginOut = () => {
  localStorage.clear();
  router.push("/");
}

const routes = [
  {
    path: '/home',
    name: '首页',
  },
  {
    path: '/active',
    name: '公益活动',
  }, {
    path: '/serve',
    name: '养老服务',
  },
  {
    path: '/elder',
    name: '养老院',
  },
  {
    path: '/myself',
    name: '个人中心',
  },
  {
    path: '/about',
    name: '关于我们',
  }
]

</script>

<style scoped>
.el-menu {
  border-bottom: none;
}

.el-header {
  border-bottom: 1px solid #ccc;
  height: 61px;
  padding: 0;
}

.el-main {
  min-height: 80vh;
}

:deep(.el-tooltip__trigger:focus-visible) {
  outline: unset;
}

svg {
  width: 18px !important;
  height: 18px !important;
  margin-right: 5px !important;
}

</style>