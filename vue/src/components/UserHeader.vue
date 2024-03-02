<template>
  <el-menu class="flex align-center justify-between p-lr-30" :default-active="activeIndex" mode="horizontal"
           background-color="#578bba"
           text-color="#fff" active-text-color="#ffd04b" @select="handleSelect" router>
    <!--logo-->
    <div class="flex align-center justify-center">
      <img class="w-40px h-40px round cursor" src="@/assets/logo.png" alt="">
      <div class="text-white text-bold-6 text-20 p-lr-20">乐融融智慧平台</div>
    </div>
    <!--menu-->
    <div class="w-50vw h-fill flex align-center justify-center p-r-100">
      <el-menu-item v-for="item in routes[2].children.slice(0,6)" :index="item.path">{{ item.name }}</el-menu-item>
    </div>
    <!--userInfo-->
    <div class="flex align-center justify-center">
      <!--      -->
      <el-dropdown>
        <img class="w-40px h-40px bg-white round cursor" src="@/assets/logo.png" alt="">
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item>修改信息</el-dropdown-item>
            <el-dropdown-item>修改密码</el-dropdown-item>
            <el-dropdown-item>退出登录</el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
      <div class="text-white p-lr-10">何福海</div>
    </div>
  </el-menu>
</template>

<script lang="ts" setup>
import {ref, onMounted} from 'vue'
import {routes} from '@/router'

onMounted(() => {
  activeIndex.value = location.href.split(location.href.slice(0, 21))[1]
})
const activeIndex = ref('/')
const handleSelect = (key: string, keyPath: string[]) => {
  // console.log(key, keyPath)
}


</script>

<style scoped>
.el-menu-item:hover {
  color: #ffd04b !important;
}

:deep(.el-tooltip__trigger:focus-visible) {
  outline: unset;
}

</style>
