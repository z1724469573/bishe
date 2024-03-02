<template>
  <div class="">
    <el-row :gutter="20">
      <!--  轮播图  -->
      <el-col :span="12">
        <el-carousel height="300px" class="m-t-10">
          <el-carousel-item class="cursor" v-for="item in swiperList" :key="item">
            <img :src="item.swiperSrc" :alt="item.swiperLabel">
          </el-carousel-item>
        </el-carousel>
      </el-col>
      <!--   新闻   -->
      <el-col :span="12">
        <el-tabs v-model="activeName" class="" @tab-click="handleClick">
          <el-tab-pane label="最新资讯" name="first">
            <div class="flex align-center justify-between p-tb-5 text-dark cursor text-hover-blue hover"
                 v-for="i in newsHot" @click="toNewsDetail(i.newsId)">
              <div class="text-overflow-sub text-df">{{ i.newsTitle }}</div>
              <div class="text-overflow-sub text-sm">{{ i.newsDate }}</div>
            </div>
          </el-tab-pane>
          <el-tab-pane label="最热资讯" name="twice">
            <div class="flex align-center justify-between p-tb-5 text-dark cursor text-hover-blue hover"
                 v-for="i in newsNew" @click="toNewsDetail(i.newsId)">
              <div class="text-overflow-sub text-df">{{ i.newsTitle }}</div>
              <div class="text-overflow-sub text-sm">{{ i.newsDate }}</div>
            </div>
          </el-tab-pane>
        </el-tabs>
      </el-col>
    </el-row>
    <el-row :gutter="40" class="m-t-20">
      <el-col :span="18">
        <!--  选项卡  -->
        <div class="flex align-center justify-start">
          <div class="p-8 radius-5 cursor m-r-10 text-df text-overflow-sub" @click="clickSorts(i)"
               v-for="(i,index) in sorts" :class="currentSorts===i?'bg-blue b-solid-blue':'b-solid-222'">
            {{ i.sortLabel }}
          </div>
        </div>
        <!--  选项卡内容  -->
        <div class="flex align-center cursor justify-start p-20 m-tb-10 radius-5 shadow"
             v-for="i in newsSort" @click="toNewsDetail(i.newsId)">
          <img class="w-60px h-70px m-t-5 radius-2" :src="i.newsCover" alt=" ">
          <div class="p-lr-10">
            <div class="p-tb-10 text-hover-blue">{{ i.newsTitle }}</div>
            <div class="p-tb-5 text-sm text-gray-dark flex align-center">
              <el-tag size="small">{{ i.newsTag }}</el-tag>
              <div class="m-l-20">{{ i.newsDate }}</div>
              <div class="m-l-20">阅读：{{ i.newsRead }}</div>
            </div>
          </div>
        </div>
      </el-col>
      <el-col :span="6">
        <!--   活动     -->
        <div class="flex align-center justify-between">
          <div class="text-xl">公益活动</div>
          <div class="text-df cursor text-hover-blue text-gray-dark" @click="$router.push('/active')">更多>>></div>
        </div>
        <!--    活动    -->
        <div class="w-fill h-80px flex align-center cursor justify-start p-10 m-tb-10 "
             v-for="i in active">
          <img class="w-60px h-60px radius-10" :src="i.activeCover" alt=" ">
          <div class="p-lr-10">
            <div class="text-overflow-double text-df">{{ i.activeLabel }}</div>
            <div class="text-sm m-tb-5">{{ i.activeStart }}</div>
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script setup lang="ts">
import {onMounted, ref} from "vue";
import type {TabsPaneContext} from 'element-plus'
import api from "@/api";

onMounted(() => {
  api.swiper.listSwiper().then((rs: any) => {
    swiperList.value = rs.data
  })
  api.news.listNews().then((rs: any) => {
    newsHot.value = rs.data.slice(0,9);
    newsNew.value = rs.data.slice(0,9);
    newsSort.value = rs.data.slice(0, 6);
  })
  api.sort.listSort().then((rs: any) => {
    sorts.value = rs.data;
  })
  api.active.listActive().then((rs: any) => {
    active.value = rs.data.slice(0, 6);
  })
})
const swiperList = ref([])
//
const activeName = ref('first')
const handleClick = (tab: TabsPaneContext, event: Event) => {
  console.log(tab, event)
}
const newsHot = ref([])
const newsNew = ref([])
//
const newsSort = ref([]);
const currentSorts = ref('全部')
const sorts = ref([])

function clickSorts(i) {
  currentSorts.value = i;
  if (i.sortLabel === '全部') {
    api.news.listNews().then((rs: any) => {
      newsSort.value = rs.data.slice(0, 6);
    })
  } else {
    api.news.listSortNews(i.sortLabel).then((rs: any) => {
      newsSort.value = rs.data.slice(0, 6);
    })
  }
}

const active = ref([]);

import {useRouter} from 'vue-router';

const router = useRouter();

function toNewsDetail(id: any) {
  router.push({path: '/news_detail', query: {id}})
}

</script>

<style scoped>

</style>
