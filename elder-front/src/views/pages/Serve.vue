<template>
  <el-row justify="center">
    <el-col :span="18">
      <el-card style="width: calc(25% - 10px);float: left;margin: 5px;" v-for="item in serveList">
        <img style="height: 180px;" :src="item.cover" alt=" ">
        <p style="font-size: 16px;padding: 10px 20px;height: 20px;">{{ item.name }}</p>
        <el-row align="middle" style="padding: 20px;">
          <p style="font-size: 14px;height: 45px;">{{ item.content }}</p>
          <el-button style="margin-top: 20px;width: 100%;" type="primary" @click="handleServe(item)">预约服务</el-button>
        </el-row>
      </el-card>
    </el-col>
  </el-row>

  <el-dialog v-model="dialogVisible" title="预约服务" width="500" :close-on-click-modal="false">
    <el-form>
      <el-form-item label="预约时间">
        <el-date-picker
            style="width: 100%;"
            v-model="date"
            type="datetime"
            placeholder="请选择预约时间"
            format="YYYY-MM-DD HH:mm:ss"
            date-format="MMM DD, YYYY"
            time-format="HH:mm"
            value-format="YYYY-MM-DD HH:mm:ss"
        />
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="dialogVisible = false" size="large">取消</el-button>
        <el-button type="primary" @click="handleAppend" size="large">
          确定
        </el-button>
      </div>
    </template>
  </el-dialog>
</template>

<script setup lang="ts">
import {getCurrentInstance, onMounted, ref} from "vue";
import api from "@/api";
import {ElMessage} from "element-plus";
import router from "@/router";

onMounted(() => {
  if (localStorage.getItem("user")) {
    myselfForm.value = JSON.parse(localStorage.getItem("user"));
  }
  getServeList();
})

const getServeList = () => {
  api.serve.serveList().then((res) => {
    serveList.value = res.data;
  })
}

const serve = ref({});
const serveList = ref([]);
const dialogVisible = ref(false);
const myselfForm = ref({});
const {appContext} = getCurrentInstance()!
const handleServe = (e) => {
  serve.value = e;
  dialogVisible.value = true;
}

const date = ref('')
const handleAppend = () => {
  api.serveSh.serveShAppend(serve.value.id, myselfForm.value.id, date.value).then((res) => {
    ElMessage({message: res.message, type: res.success ? 'success' : 'error', grouping: true, showClose: true});
    if (res.success) {
      dialogVisible.value = false;
      router.push('/serveSh')
    }
  })
}

</script>

<style scoped>
:deep(.el-card__body) {
  padding: 0;
}
</style>
