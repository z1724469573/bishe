<template>
  <div>
    <el-container>
      <el-header>
        <CommonNotice/>
        <CommonHeader/>
      </el-header>
      <el-main class="" style="width: 70vw;margin: 20px auto">
        <RouterView/>
      </el-main>
      <el-footer>
        <CommonFooter/>
      </el-footer>
    </el-container>
  </div>
</template>
<script setup lang="ts">
import {RouterView} from 'vue-router'
import CommonNotice from '@/components/UserNotice.vue'
import CommonHeader from '@/components/UserHeader.vue'
import CommonFooter from '@/components/UserFooter.vue'
</script>

<style scoped>

</style>
