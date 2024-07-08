<template>
  <el-row :gutter="20">
    <el-col :span="12">
      <el-carousel height="350px" motion-blur>
        <el-carousel-item v-for="item in 4" :key="item">
          <img
              src="https://cdn-hw-static2.shanhutech.cn/bizhi/staticwp/202306/372e4fe6e22117b4647911751abfc42b--179789999.jpg"
              alt=" ">
        </el-carousel-item>
      </el-carousel>
    </el-col>
    <el-col :span="12">
      <el-tabs type="card" v-model="activeName" @tab-click="handleName">
        <el-tab-pane label="最新资讯" name="first">最新资讯</el-tab-pane>
        <el-tab-pane label="最热资讯" name="second">最热资讯</el-tab-pane>
      </el-tabs>
    </el-col>
  </el-row>
  <el-row :gutter="20" style="margin-top: 20px;">
    <el-col :span="16">
      <el-card>
        <template #header>
          <div class="card-header">
            <span><b>资讯分类</b></span>
          </div>
        </template>
        <el-tabs v-model="activeSort" type="card" @tab-click="handleSort">
          <el-tab-pane v-for="(item,index) in newsSort" :label="item" :name="index">{{ item }}</el-tab-pane>
        </el-tabs>
      </el-card>
    </el-col>
    <el-col :span="8">
      <el-card>
        <template #header>
          <div class="card-header">
            <el-row align="middle" justify="space-between">
              <span><b>公益活动</b></span>
              <el-button text size="small">更多</el-button>
            </el-row>
          </div>
        </template>

      </el-card>
    </el-col>
  </el-row>
</template>

<script setup lang="ts">
import {ref} from 'vue'
import type {TabsPaneContext} from 'element-plus'

const activeName = ref('first');
const activeSort = ref(0);
const newsSort = ref(["全部", "养老动态", "养老政策", "养老服务", "养老产业", "养老模式", "养老金", "居家养老"]);

const handleName = (tab: TabsPaneContext, event: Event) => {
  console.log(tab, event)
}

const handleSort = (tab: TabsPaneContext, event: Event) => {
  console.log(tab, event)
}
</script>

<style scoped>
.demonstration {
  color: var(--el-text-color-secondary);
}

.el-carousel__item h3 {
  color: #475669;
  opacity: 0.75;
  line-height: 200px;
  margin: 0;
  text-align: center;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}
</style>
