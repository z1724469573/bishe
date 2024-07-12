<template>
  <div class="common-layout">
    <el-container>
      <el-aside :width="isCollapse?'60px':'200px'"
                style="border-right: 1px solid #ccc;box-shadow: #ccc 2px 2px 2px 2px;">
        <el-menu
            :collapse="isCollapse"
            @open="handleOpen"
            @close="handleClose"
            :collapse-transition="false"
            :default-active="currentMenu.path"
            :default-openeds="['2','3']"
            router
        >
          <el-menu-item index="/home" @click="handleMenu({name:'首页',path:'/home'})">
            <el-icon>
              <HomeFilled/>
            </el-icon>
            <template #title>首页</template>
          </el-menu-item>
          <el-sub-menu index="2">
            <template #title>
              <el-icon>
                <icon-menu/>
              </el-icon>
              <span>系统管理</span>
            </template>
            <el-menu-item-group>
              <template #title><span>系统管理</span></template>
              <el-menu-item v-for="(item,index) in system" :index="item.path" @click="handleMenu(item)">
                {{ item.name }}
              </el-menu-item>
            </el-menu-item-group>
          </el-sub-menu>
          <el-sub-menu index="3">
            <template #title>
              <el-icon>
                <icon-menu/>
              </el-icon>
              <span>用户管理</span>
            </template>
            <el-menu-item-group>
              <template #title><span>用户管理</span></template>
              <el-menu-item v-for="(item,index) in user" :index="item.path" @click="handleMenu(item)">{{
                  item.name
                }}
              </el-menu-item>
            </el-menu-item-group>
          </el-sub-menu>
        </el-menu>
      </el-aside>
      <el-container>
        <el-header>
          <el-row style="width: 100%;height: 100%;" align="middle" justify="center">
            <el-col :span="1">
              <el-button plain @click="handleCollapse" link>
                <el-icon v-if="!isCollapse" style="transform: scale(2);">
                  <Fold/>
                </el-icon>
                <el-icon v-else style="transform: scale(2);">
                  <Expand/>
                </el-icon>
              </el-button>
            </el-col>
            <el-col :span="7">
              <el-breadcrumb :separator-icon="ArrowRight">
                <el-breadcrumb-item :to="{ path: '/home' }" @click="handleMenu({name:'首页',path:'/home'})">首页
                </el-breadcrumb-item>
                <el-breadcrumb-item v-if="currentMenu.name!=='首页'">{{ currentMenu.name }}</el-breadcrumb-item>
              </el-breadcrumb>
            </el-col>
            <el-col :span="12"></el-col>
            <el-col :span="4">
              <el-row align="middle" justify="center" :gutter="0">
                <el-col :span="6">
                  <el-avatar shape="square" :size="40" :src="squareUrl"/>
                </el-col>
                <el-col :span="16">
                  <el-dropdown>
                <span class="el-dropdown-link">
                  Dropdown List
                  <el-icon class="el-icon--right">
                    <arrow-down/>
                  </el-icon>
                </span>
                    <template #dropdown>
                      <el-dropdown-menu>
                        <el-dropdown-item>个人中心</el-dropdown-item>
                        <el-dropdown-item divided>退出登录</el-dropdown-item>
                      </el-dropdown-menu>
                    </template>
                  </el-dropdown>
                </el-col>
              </el-row>
            </el-col>
          </el-row>
        </el-header>
        <el-main>
          <RouterView/>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script setup lang="ts">
import {ArrowDown, Expand, Fold, Menu as IconMenu, HomeFilled, ArrowRight} from '@element-plus/icons-vue'
import {RouterView} from 'vue-router';
import {onMounted, ref} from "vue";

onMounted(() => {
  if (localStorage.getItem("currentMenu")) {
    currentMenu.value = JSON.parse(localStorage.getItem("currentMenu"));
  }
})
const currentMenu = ref({name: "首页", path: '/home'});
const squareUrl = ref('https://cube.elemecdn.com/9/c2/f0ee8a3c7c9638a54940382568c9dpng.png');
const isCollapse = ref(false);

const handleOpen = (key: string, keyPath: string[]) => {
  // console.log(key, keyPath);
}
const handleClose = (key: string, keyPath: string[]) => {
  // console.log(key, keyPath);
}

function handleCollapse() {
  isCollapse.value = !isCollapse.value;
}

function handleMenu(e) {
  currentMenu.value = e;
  localStorage.setItem("currentMenu", JSON.stringify(e));
}

const user = [{
  path: '/manager',
  name: '管理员管理',
}, {
  path: '/user',
  name: '用户管理',
}];

const system = [{
  path: '/sort',
  name: '资讯类别',
}, {
  path: '/news',
  name: '资讯管理',
}, {
  path: '/elder',
  name: '养老院管理',
}, {
  path: '/active',
  name: '活动管理',
}, {
  path: '/active.sh',
  name: '活动审核',
}, {
  path: '/serve',
  name: '服务管理',
}, {
  path: '/serve.sh',
  name: '服务审核',
}, {
  path: '/about',
  name: '关于我们',
},]

</script>

<style scoped>
.el-menu {
  height: 100vh;
  border-right: none;
}

.el-header {
  border-bottom: 1px solid #ccc;
  box-shadow: #ccc 2px 2px 2px 2px;
}

.el-main {
  height: calc(100vh - 65px);
  margin-top: 5px;
  overflow: scroll;
}

:deep(.el-tooltip__trigger:focus-visible) {
  outline: unset;
}

</style>