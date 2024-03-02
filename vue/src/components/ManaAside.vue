<template>
  <div style="height: 100vh;background-color:#545c64;">
    <el-menu
        active-text-color="#ffd04b"
        background-color="#545c64"
        class="border-none"
        :default-active="activeIndex"
        text-color="#fff"
        @open="handleOpen"
        :collapse="state.isCollapse"
        @close="handleClose"
        router
    >
      <!--      <el-sub-menu index="1">-->
      <!--        <template #title>-->
      <!--          <el-icon>-->
      <!--            <location/>-->
      <!--          </el-icon>-->
      <!--          <span>Navigator One</span>-->
      <!--        </template>-->
      <!--        <el-menu-item-group>-->
      <!--          <el-menu-item index="1-1">item one</el-menu-item>-->
      <!--          <el-menu-item index="1-2">item two</el-menu-item>-->
      <!--        </el-menu-item-group>-->
      <!--      </el-sub-menu>-->
      <h3 class="line-h-60 text-white text-center text-overflow-sub">{{ state.isCollapse ? '乐融融' : '乐融融管理' }}</h3>
      <el-menu-item v-for="item in menu" :index="item.path">
        <!--        <el-icon>-->
        <!--          <icon-menu/>-->
        <!--        </el-icon>-->
        <component class="icons" :is="item.icon"></component>
        <span>{{ item.name }}</span>
      </el-menu-item>
    </el-menu>
  </div>
</template>

<script lang="ts" setup>
import {Menu as IconMenu,} from '@element-plus/icons-vue'
import {onMounted, ref} from "vue";
import router from "@/router";
import {computed, reactive} from "vue";
import {index} from "@/stores";

onMounted(() => {
  activeIndex.value = location.href.split(location.href.slice(0, 21))[1]
})
const activeIndex = ref('/')

const handleOpen = (key: string, keyPath: string[]) => {
  // console.log(key, keyPath)
}
const handleClose = (key: string, keyPath: string[]) => {
  // console.log(key, keyPath)
}

const menu = ref(router.getRoutes()[router.getRoutes().length - 1].children)
const state = reactive({
  isCollapse: computed(() => index().isCollapse),
});

</script>

<style scoped>
:deep(.el-menu) {
  border: none !important;
}

svg{
  width: 20px;
  height: 20px;
  margin-right: 5px;
}
</style>