<template>
  <div>
    <div id="content"></div>
  </div>
</template>

<script setup lang="ts">

import {onMounted, reactive, ref} from "vue";
import {useRoute} from 'vue-router';
import api from "@/api";
import {SelectNewsParams} from "@/api/news";

const route = useRoute();
onMounted(() => {
  const id: SelectNewsParams = {"id": Number(route.query.id)};
  api.news.selectNews(id).then((rs: any) => {
    document.getElementById('content').innerHTML = rs.data.newsContent
  })
})
</script>

<style scoped>

</style>