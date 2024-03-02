<template>
  <el-container>
    <ManaAside/>
    <el-container>
      <el-header>
        <ManaHeader/>
      </el-header>
      <el-main class="bg-f1 h-80vh">
        <RouterView/>
      </el-main>
    </el-container>
  </el-container>
</template>

<script setup lang="ts">
import {RouterView} from 'vue-router'
import ManaAside from '@/components/ManaAside.vue'
import ManaHeader from '@/components/ManaHeader.vue'
import {computed, reactive} from "vue";
import {index} from "@/stores";

const state = reactive({
  //@ts-ignore
  isCollapse: computed(() => index().isCollapse),
});
</script>

<style scoped>
.el-main {
  padding: 10px !important;
}
</style>