<template>
  <el-row justify="center">
    <el-col :span="16">
      <el-card style="margin-top: 10px;" shadow="never">
        <h2 style="text-align: center;">{{ sortNews.title }}</h2>
        <el-text tag="p" style="text-align: center;line-height: 60px;">
          {{ sortNews.date }} 浏览：{{ sortNews.looks }}
        </el-text>
        <el-row justify="center">
          <el-image :src="sortNews.cover"></el-image>
        </el-row>
        <v-md-editor mode="preview" v-model="sortNews.content"></v-md-editor>
      </el-card>
    </el-col>
  </el-row>
</template>

<script setup lang="ts">
import {onMounted, ref} from "vue";
import {useRoute} from 'vue-router'
import api from "@/api";
import {ElMessage} from "element-plus";

const route = useRoute();
const name = route.query.name;
const sortNews = ref({});
onMounted(() => {
  api.sortNews.sortNewsSearch(typeof name === "string" ? name.slice(1, name.length - 1) : "").then((res) => {
    sortNews.value = res.data[0];
  })
})
</script>

<style scoped>

</style>
