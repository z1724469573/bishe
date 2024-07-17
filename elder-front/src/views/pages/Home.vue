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
          <el-tabs type="card" v-model="classifyHots" @tab-click="handleHots">
            <el-tab-pane label="最新资讯" name="first">
              <el-row style="cursor: pointer;margin-bottom: 4px;" justify="space-between"
                      v-for="(item,index) in sortNewsLate">
                <el-col :span="18">
                  <el-link @click="handleNews(item)">
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
                  <el-link @click="handleNews(item)">
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
            <el-tabs v-model="classifySort" type="card" @tab-click="handleSort">
              <el-tab-pane v-for="(item,index) in sortList" :label="item.name" :name="index">
                <el-card shadow="never" style="margin: 5px 0;" v-for="(item,index) in showNewsData">
                  <el-row justify="start">
                    <el-col :span="3">
                      <el-image style="width: 60px; height: 60px;border-radius: 2px;" :src="item.cover"/>
                    </el-col>
                    <el-col :span="21">
                      <div style="margin-bottom: 14px;">
                        <el-link>
                          <el-text tag="p" size="large" :line-clamp="1" @click="handleNews(item)">
                            {{ item.title }}
                          </el-text>
                        </el-link>
                      </div>
                      <el-row align="middle">
                        <el-col :span="5">
                          <el-tag size="small">{{ item.sortName }}</el-tag>
                        </el-col>
                        <el-col :span="5">
                          <el-text :line-clamp="1">{{ item.date }}</el-text>
                        </el-col>
                        <el-col :span="8">
                          <el-text :line-clamp="1"> 阅读：{{ item.looks }}</el-text>
                        </el-col>
                      </el-row>
                    </el-col>
                  </el-row>
                </el-card>
              </el-tab-pane>
            </el-tabs>
            <el-row justify="end" style="margin-top: 10px;">
              <el-pagination background :page-size="5" layout="total, prev, pager, next" :total="sortLen"
                             @current-change="handleNewsPager"/>
            </el-row>
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
            <el-row style="padding: 5px 0;" justify="space-between" v-for="(item,index) in activeList">
              <el-col :span="7">
                <el-image style="width: 70px;height: 70px;border-radius: 3px;" :src="item.cover"></el-image>
              </el-col>
              <el-col :span="17">
                <el-link @click="handleActive(item)">
                  <el-text size="large" :line-clamp="2">{{ item.name }}</el-text>
                </el-link>
                <el-text style="margin-top: 10px;" tag="p">{{ item.start }}</el-text>
              </el-col>
            </el-row>
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
import oneSW from "@/assets/swiper/1.78018329.jpeg"
import twoSW from "@/assets/swiper/2.952132ef.jpeg"
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
    sortNewsData.value = res.data;
    showNewsData.value = res.data.slice(0, 5);
    sortLen.value = res.data.length;
  })
  api.active.activeList().then((res) => {
    activeList.value = res.data.slice(0, 7);
  })
})
const showNewsData = ref([]);
const sortNewsData = ref([]);
const sortLen = ref(0);
const sortNewsLate = ref([]);
const sortNewsHots = ref([]);
const activeList = ref([]);
const handleNews = (e) => {
  const name = JSON.stringify(e.title);
  router.push({
    path: "/newsDetail",
    query: {name},
  })
}

const classifyHots = ref('first');
const classifySort = ref(0);
const sortList = ref([]);
const swiperList = ref([oneSW, twoSW]);
const handleHots = (tab: TabsPaneContext, event: Event) => {
  // console.log(tab, event)
}

const handleSort = (tab: TabsPaneContext, event: Event) => {
  api.sortNews.sortNewsSort(tab.props.label).then((res) => {
    sortNewsData.value = res.data;
    showNewsData.value = res.data.slice(0, 5);
    sortLen.value = res.data.length;
  })
}

const handleNewsPager = (e) => {
  showNewsData.value = sortNewsData.value.slice((e - 1) * 5, e * 5);
}

const handleActive = (e) => {
  const name = JSON.stringify(e.name);
  router.push({
    path: "/activeDetail",
    query: {name},
  })
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
