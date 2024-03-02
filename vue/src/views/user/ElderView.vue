<template>
  <div class="grid col-4">
    <div class="p-10" v-for="i in currentElder">
      <el-card :body-style="{ padding: '0px' }">
        <img :src="i.elderCover" alt=" " class="image cursor"/>
        <div style="padding: 14px">
          <span class="text-overflow-double">{{ i.elderLabel }}</span>
          <span class="text-overflow-double text-lg text-red m-t-10">￥{{ i.elderPrice }}起/月</span>
        </div>
      </el-card>
    </div>
  </div>
  <el-pagination class="m-t-20 m-l-10" background layout="prev, pager, next" :total="1"/>
</template>

<script lang="ts" setup>
import {ref, onMounted} from 'vue'
import api from "@/api";

const currentElder = ref([])
onMounted(() => {
  api.elder.listElder().then((rs: any) => {
    currentElder.value = rs.data
  })
})

</script>

<style scoped>
.time {
  font-size: 12px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.button {
  padding: 0;
  width: 100%;
  min-height: auto;
}

.image {
  width: 100%;
  display: block;
}
</style>