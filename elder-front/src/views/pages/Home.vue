<template>
  <el-row>
    <el-col :span="3"></el-col>
    <el-col :span="18">
      <el-row :gutter="20">
        <el-col :span="12">
          <el-carousel height="300px" motion-blur autoplay>
            <el-carousel-item v-for="item in swiperList" :key="item">
              <img :src="item" alt=" ">
            </el-carousel-item>
          </el-carousel>
        </el-col>
        <el-col :span="12">
          <el-tabs type="card" v-model="activeName" @tab-click="handleName">
            <el-tab-pane label="最新资讯" name="first">
              <el-row style="cursor: pointer;margin-bottom: 4px;" justify="space-between"
                      v-for="(item,index) in sortNewsLate">
                <el-col :span="18">
                  <el-link>
                    <el-text size="large" :line-clamp="1">
                      {{ item.title }}
                    </el-text>
                  </el-link>
                </el-col>
                <el-col :span="4">
                  <el-text style="margin-top: 4px;" :line-clamp="1">{{ item.date }}</el-text>
                </el-col>
              </el-row>
            </el-tab-pane>
            <el-tab-pane label="最热资讯" name="second">
              <el-row style="cursor: pointer;margin-bottom: 4px;" justify="space-between"
                      v-for="(item,index) in sortNewsHots">
                <el-col :span="18">
                  <el-link>
                    <el-text size="large" :line-clamp="1">
                      {{ item.title }}
                    </el-text>
                  </el-link>
                </el-col>
                <el-col :span="4">
                  <el-text style="margin-top: 4px;" :line-clamp="1">{{ item.date }}</el-text>
                </el-col>
              </el-row>
            </el-tab-pane>
          </el-tabs>
        </el-col>
      </el-row>
      <el-row :gutter="20" style="margin-top: 20px;">
        <el-col :span="16">
          <el-card shadow="never">
            <template #header>
              <div class="card-header">
                <span><b>资讯分类</b></span>
              </div>
            </template>
            <el-tabs v-model="activeSort" type="card" @tab-click="handleSort">
              <el-tab-pane v-for="(item,index) in sortList" :label="item.name" :name="index">
                <el-card shadow="never" style="margin: 5px 0;" v-for="(item,index) in sortNewsData">
                  <el-row justify="space-between">
                    <el-image style="width: 60px; height: 60px" :src="item.cover" :fit="fit"/>
                    <el-col :span="21">
                      <div style="margin-bottom: 14px;">
                        <el-text size="large" style="cursor: pointer;"><el-link>{{ item.title }}</el-link></el-text>
                      </div>
                      <el-row align="middle">
                        <el-col :span="5">
                          <el-tag size="small">{{ item.sortName }}</el-tag>
                        </el-col>
                        <el-col :span="5">
                          <el-text>{{ item.date }}</el-text>
                        </el-col>
                        <el-col :span="8">
                          <el-text> 阅读：{{ item.looks }}</el-text>
                        </el-col>
                      </el-row>
                    </el-col>
                  </el-row>
                </el-card>
              </el-tab-pane>
            </el-tabs>
          </el-card>
        </el-col>
        <el-col :span="8">
          <el-card shadow="never">
            <template #header>
              <div class="card-header">
                <el-row align="middle" justify="space-between">
                  <span><b>公益活动</b></span>
                  <el-button text size="small" @click="handleSelect">更多</el-button>
                </el-row>
              </div>
            </template>

          </el-card>
        </el-col>
      </el-row>
    </el-col>
    <el-col :span="8"></el-col>
  </el-row>
</template>

<script setup lang="ts">
import {onMounted, ref} from 'vue'
import type {TabsPaneContext} from 'element-plus'
import router from "@/router";
import one from "@/assets/swiper/1.78018329.jpeg"
import two from "@/assets/swiper/2.952132ef.jpeg"
import api from "@/api";

onMounted(() => {
  api.sort.sortList().then((res) => {
    sortList.value = res.data;
  })
  api.sortNews.sortNewsLate().then((res) => {
    sortNewsLate.value = res.data.slice(0, 8);
  })
  api.sortNews.sortNewsHots().then((res) => {
    sortNewsHots.value = res.data.slice(0, 8);
  })
  api.sortNews.sortNewsList().then((res) => {
    sortNewsData.value = res.data.slice(0, 5);
  })
})
const sortNewsData = ref([]);
const sortNewsLate = ref([]);
const sortNewsHots = ref([]);

const activeName = ref('first');
const activeSort = ref(0);
const sortList = ref([]);
const swiperList = ref([one, two]);
const handleName = (tab: TabsPaneContext, event: Event) => {
  console.log(tab, event)
}

const handleSort = (tab: TabsPaneContext, event: Event) => {
  console.log(tab, event)
}

const handleSelect = () => {
  localStorage.setItem("activeIndex", '/active');
  router.push('/active');
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

.overflow-text {
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 1;
}
</style>
