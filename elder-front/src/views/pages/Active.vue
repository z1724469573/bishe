<template>
  <el-row justify="center">
    <el-col :span="18">
      <el-card style="width: calc(25% - 10px);float: left;margin: 5px;" v-for="item in activeList">
        <img style="height: 180px;cursor: pointer;" @click="handleActive(item)" :src="item.cover" alt=" ">
        <p style="font-size: 14px;padding: 10px 20px;height: 60px;">{{ item.name }}</p>
        <el-row align="middle" justify="space-between" style="padding: 20px;">
          <p style="font-size: 12px;">{{ item.start }} ~ {{ item.end }}</p>
          <el-button text size="small" @click="handleActive(item)">更多</el-button>
        </el-row>
      </el-card>
    </el-col>
  </el-row>
</template>

<script setup lang="ts">
import {onMounted, ref} from "vue";
import api from "@/api";
import {useRouter} from 'vue-router'

onMounted(() => {
  getActiveList();
})

const getActiveList = () => {
  api.active.activeList().then((res) => {
    activeList.value = res.data;
  })
}

const router = useRouter();
const handleActive = (e) => {
  const name = JSON.stringify(e.name);
  router.push({
    path: "/activeDetail",
    query: {name},
  })
}

const activeList = ref([]);
</script>

<style scoped>
:deep(.el-card__body) {
  padding: 0;
}
</style>
