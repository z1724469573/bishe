<template>
  <el-row justify="center">
    <el-col :span="18">
      <el-card style="width: calc(25% - 10px);float: left;margin: 5px;" v-for="item in elderList">
        <img style="height: 180px;cursor: pointer;" :src="item.cover" alt=" " @click="handleElder(item)">
        <p style="font-size: 16px;padding: 10px 20px;height: 20px;">{{ item.name }}</p>
        <el-row align="middle" style="padding: 20px;">
          <p style="font-size: 14px;height: 30px;color: red;">{{ item.price }}</p>
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
  getElderList();
})

const getElderList = () => {
  api.elder.elderList().then((res) => {
    elderList.value = res.data;
    console.log(res.data);
  })
}

const router = useRouter();
const handleElder = (e) => {
  const name = JSON.stringify(e.name);
  router.push({
    path: "/elderDetail",
    query: {name},
  })
}

const elderList = ref([]);
</script>

<style scoped>
:deep(.el-card__body) {
  padding: 0;
}
</style>
