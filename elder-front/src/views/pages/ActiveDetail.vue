<template>
  <el-row justify="center">
    <el-col :span="16">
      <el-card shadow="never">
        <el-row :gutter="20">
          <el-col :span="12">
            <img :src="active.cover" alt=" ">
          </el-col>
          <el-col :span="12">
            <h2>{{ active.name }}</h2>
            <el-descriptions title=" " :column="1">
              <el-descriptions-item label="活动时间：">{{ active.start }}~{{ active.end }}</el-descriptions-item>
              <el-descriptions-item label="活动地址：">{{ active.address }}</el-descriptions-item>
              <el-descriptions-item label="联系电话：">
                <b style="font-size: 18px;color: #0753a2;">{{ active.phone }}</b>
              </el-descriptions-item>
            </el-descriptions>
            <el-button style="width: 100%;margin-top: 20px;" size="large" plain type="primary" :disabled="isPast">
              <a v-if="!isPast">活动可报名</a>
              <a v-else>活动已过期</a>
            </el-button>
          </el-col>
        </el-row>
      </el-card>
      <el-card style="margin-top: 10px;" shadow="never">
        <h2 style="text-align: center;">活动详情</h2>
        <v-md-editor mode="preview" v-model="active.content"></v-md-editor>
      </el-card>
    </el-col>
  </el-row>
</template>

<script setup lang="ts">
import {onMounted, ref} from "vue";
import {useRoute} from 'vue-router'
import api from "@/api";
import {ElMessage} from "element-plus";

const route = useRoute()
const name = route.query.name;
const active = ref({});
const isPast = ref(false);
onMounted(() => {
  api.active.activeSearch(typeof name === "string" ? name.slice(1, name.length - 1) : "").then((res) => {
    active.value = res.data[0];
    const dateEnd = new Date(res.data[0].end).getTime();
    const dateNow = new Date().getTime();
    isPast.value = dateEnd <= dateNow;
  })
})

function formatDate(date) {
  const year = date.getFullYear();
  const month = (date.getMonth() + 1).toString().padStart(2, '0');
  const day = date.getDate().toString().padStart(2, '0');
  const hours = date.getHours().toString().padStart(2, '0');
  const minutes = date.getMinutes().toString().padStart(2, '0');
  const seconds = date.getSeconds().toString().padStart(2, '0');
  return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
}

const activeList = ref([]);
</script>

<style scoped>

</style>
