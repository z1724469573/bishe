<template>
  <div class="w-fill h-fill flex align-center justify-between">
    <div class="h-fill flex align-center justify-center m-l-20">
      <el-button @click="collapseMenu" type="info" :icon="Star"/>
    </div>
    <div class="flex align-center justify-center m-r-20">
      <el-dropdown>
        <el-avatar class="cursor" :size="50" src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"/>
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item>修改信息</el-dropdown-item>
            <el-dropdown-item>修改密码</el-dropdown-item>
            <el-dropdown-item @click="loginOut">安全退出</el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
      <div class="m-l-10 flex flex-direction">
        <span>何福海</span>
        <span class="text-sm m-t-5 text-gray">超级管理员</span>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import {Star,} from '@element-plus/icons-vue'
import {index} from "@/stores";
import router from "@/router";

const collapseMenu = () => {
  index().collapseMenu();
};

function loginOut() {
  localStorage.clear();
  router.push("/");
}
</script>

<style scoped>
:deep(.el-tooltip__trigger:focus-visible) {
  outline: unset;
}

</style>