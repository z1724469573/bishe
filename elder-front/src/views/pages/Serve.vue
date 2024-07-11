<template>
  <el-row justify="center">
    <el-col :span="18">
      <el-card style="width: calc(25% - 10px);float: left;margin: 5px;" v-for="item in serveList">
        <img style="height: 180px;" :src="item.cover" alt=" ">
        <p style="font-size: 16px;padding: 10px 20px;height: 20px;">{{ item.name }}</p>
        <el-row align="middle" style="padding: 20px;">
          <p style="font-size: 14px;height: 45px;">{{ item.content }}</p>
          <el-button style="margin-top: 20px;width: 100%;" type="primary">预约服务</el-button>
        </el-row>
      </el-card>
    </el-col>
  </el-row>
</template>

<script setup lang="ts">
import {onMounted, ref} from "vue";
import api from "@/api";

onMounted(() => {
  getServeList();
})

const getServeList = () => {
  api.serve.serveList().then((res) => {
    serveList.value = res.data;
    console.log(res.data);
  })
}

const serveList = ref([]);
</script>

<style scoped>
:deep(.el-card__body) {
  padding: 0;
}
</style>
