<template>
  <el-row justify="center">
    <el-col :span="18">
      <el-card shadow="never">
        <el-row :gutter="20">
          <el-col :span="12">
            <img :src="elder.cover" alt=" ">
          </el-col>
          <el-col :span="12">
            <h2>{{ elder.name }}</h2>
            <el-descriptions title=" " :column="1">
              <el-descriptions-item label=" ">
                <el-tag size="small">{{ elder.tag }}</el-tag>
              </el-descriptions-item>
              <el-descriptions-item label=" ">
                <b style="font-size: 22px;color: #c45656;">{{ elder.price }}</b>
              </el-descriptions-item>
              <el-descriptions-item label=" ">
                <a style="font-size: 18px;">{{ elder.address }}</a>
              </el-descriptions-item>
              <el-descriptions-item label="联系电话：">
                <b style="font-size: 18px;color: #0753a2;">{{ elder.phone }}</b>
              </el-descriptions-item>
              <el-descriptions-item label="成立时间：">{{ elder.date }}</el-descriptions-item>
              <el-descriptions-item label="机构面积：">{{ elder.area }}</el-descriptions-item>
              <el-descriptions-item label="房间数量：">{{ elder.bed }}</el-descriptions-item>
            </el-descriptions>
          </el-col>
        </el-row>
      </el-card>
      <el-card style="margin-top: 10px;" shadow="never">
        <h2 style="text-align: center;">详情信息</h2>
        <v-md-editor mode="preview" v-model="elder.content"></v-md-editor>
      </el-card>
    </el-col>
  </el-row>
</template>

<script setup lang="ts">
import {onMounted, ref} from "vue";
import {useRoute} from 'vue-router'
import api from "@/api";

const route = useRoute()
const name = route.query.name;
const elder = ref({});
onMounted(() => {
  api.elder.elderSearch(typeof name === "string" ? name.slice(1, name.length - 1) : "").then((res) => {
    elder.value = res.data[0];
  })
})

const elderList = ref([]);
</script>

<style scoped>

</style>
