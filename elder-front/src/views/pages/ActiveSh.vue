<template>
  <el-row justify="center">
    <el-col :span="16">
      <el-card shadow="never">
        <template #header>
          <b>
            <el-text size="large">我报名的活动</el-text>
          </b>
        </template>
        <el-table border
                  :data="tableData"
                  :default-sort="{ prop: 'date', order: 'descending' }"
                  style="width: 100%"
        >
          <el-table-column align="center" prop="date" label="报名日期" sortable/>
          <el-table-column align="center" prop="activeName" label="活动"/>
          <el-table-column align="center" prop="date" label="活动详情" width="90">
            <template #default="scope">
              <el-button size="small" plain @click="handleDetail(scope.row.active)">
                查看
              </el-button>
            </template>
          </el-table-column>
          <el-table-column align="center" prop="checked" label="审核状态">
            <template #default="scope">
              <el-tag
                  :type="scope.row.checked==='待审核'?'primary':''||scope.row.checked==='审核通过'?'success':''||scope.row.checked==='审核拒绝'?'danger':''">
                {{ scope.row.checked }}
              </el-tag>
            </template>
          </el-table-column>
          <el-table-column align="center" prop="advice" label="审核意见"/>
          <el-table-column align="center" label="操作" width="100">
            <template #default="scope">
              <el-button v-if="scope.row.checked==='待审核'" plain size="small" type="danger"
                         @click="handleDelete(scope.$index, scope.row)">
                取消报名
              </el-button>
            </template>
          </el-table-column>
        </el-table>
        <template #footer>
          <el-row justify="end">
            <el-pagination background layout="total, prev, pager, next" :total="tableData.length"/>
          </el-row>
        </template>
      </el-card>
    </el-col>
  </el-row>

  <el-dialog v-model="detailDialog" title="查看详情" :close-on-click-modal="false" width="800">
    <el-card shadow="never">
      <el-row :gutter="20">
        <el-col :span="12">
          <img :src="detailForm.cover" alt=" ">
        </el-col>
        <el-col :span="12">
          <h2>{{ detailForm.name }}</h2>
          <el-descriptions title=" " :column="1">
            <el-descriptions-item label="活动时间：">{{ detailForm.start }}~{{ detailForm.end }}</el-descriptions-item>
            <el-descriptions-item label="活动地址：">{{ detailForm.address }}</el-descriptions-item>
            <el-descriptions-item label="联系电话：">
              <b style="font-size: 18px;color: #0753a2;">{{ detailForm.phone }}</b>
            </el-descriptions-item>
          </el-descriptions>
        </el-col>
      </el-row>
    </el-card>
    <v-md-editor mode="preview" v-if="detailForm.content" v-model="detailForm.content" height="460px"></v-md-editor>
    <template #footer>
      <div class="dialog-footer">
        <el-button size="large" @click="detailDialog = false">关闭</el-button>
      </div>
    </template>
  </el-dialog>
</template>

<script setup lang="ts">
import {getCurrentInstance, onMounted, ref} from "vue";
import api from "@/api";
import {ElMessage, ElMessageBox} from 'element-plus'

onMounted(() => {
  if (localStorage.getItem("user")) {
    myselfForm.value = JSON.parse(localStorage.getItem("user"));
  }
  getTableData();
})

function getTableData() {
  api.activeSh.activeShMyself(myselfForm.value.id).then((res) => {
    tableData.value = res.data;
  })
}

const {appContext} = getCurrentInstance()!
const myselfForm = ref({});
const tableData = ref([]);
const handleDelete = (index: number, row: any) => {
  ElMessageBox.confirm('确认取消报名吗?', '提示',
      {
        confirmButtonText: '确认',
        cancelButtonText: '取消',
        type: 'warning',
      }, appContext)
      .then(() => {
        api.activeSh.activeShDelete(row.id).then((res) => {
          ElMessage({message: res.message, type: res.success ? 'success' : 'error', grouping: true, showClose: true});
          getTableData();
        })
      })
      .catch(() => {
      })
}

const detailDialog = ref(false);
const detailForm = ref({
  content: "",
})
const handleDetail = (e) => {
  detailForm.value = e;
  detailDialog.value = true;
}
</script>

<style scoped>

</style>