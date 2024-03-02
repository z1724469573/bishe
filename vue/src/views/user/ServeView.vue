<template>
  <div class="grid col-4">
    <div class="p-10" v-for="i in currentServe">
      <el-card :body-style="{ padding: '0px' }">
        <img :src="i.serveCover" alt=" " class="image cursor"/>
        <div style="padding: 14px">
          <span class="text-overflow-double">{{ i.serveLabel }}</span>
          <span class="text-overflow-double text-df text-gray m-t-5">{{ i.serveContent }}</span>
          <div class="bottom">
            <el-button type="primary" class="button">预约服务</el-button>
          </div>
        </div>
      </el-card>
    </div>
  </div>
  <el-pagination class="m-t-20 m-l-10" background layout="prev, pager, next" :total="1"/>
</template>

<script lang="ts" setup>
import {ref, onMounted} from 'vue'
import api from "@/api";

const currentServe = ref([])
onMounted(() => {
  api.serve.listServe().then((rs: any) => {
    currentServe.value = rs.data
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