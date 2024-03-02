<template>
  <div class="text-bold-6 text-xl m-t-20">账号信息</div>
  <el-descriptions title="" :column="3" border class="m-t-20">
    <el-descriptions-item
        label="账号"
        label-align="center"
        align="center"
        label-class-name="my-label"
        class-name="my-content"
        width="100px">
      {{ myself.userAcc }}
    </el-descriptions-item>
    <el-descriptions-item width="100px" label="用户名" label-align="center" align="center">
      {{ myself.userName }}
    </el-descriptions-item>
    <el-descriptions-item label="性别" label-align="center" align="center">
      {{ myself.userSex == 0 ? '男' : myself.userSex == 1 ? '女' : '不详' }}
    </el-descriptions-item>
    <el-descriptions-item label="年龄" label-align="center" align="center">
      {{ myself.userAge }}
    </el-descriptions-item>
    <el-descriptions-item label="联系电话" label-align="center" align="center">
      {{ myself.userPhone }}
    </el-descriptions-item>
    <el-descriptions-item label="职业" label-align="center" align="center">
      <el-tag size="small">{{ myself.userIde }}</el-tag>
    </el-descriptions-item>
    <el-descriptions-item label="账号状态" label-align="center" align="center">
      {{ myself.userState == 1 ? '正常' : '禁用' }}
    </el-descriptions-item>
    <el-descriptions-item label="详细地址" label-align="center" align="center">
      {{ myself.userAddress }}
    </el-descriptions-item>
  </el-descriptions>

  <!--  -->
  <el-divider content-position="left"></el-divider>
  <div class="text-bold-6 text-xl m-t-30">我报名的活动</div>
  <el-table :data="apply" style="width: 100%" size="large">
    <el-table-column prop="name" label="活动" width="200">
      <template #default="scope">
        <div class="text-overflow-sub">{{ scope.row.name }}</div>
      </template>
    </el-table-column>
    <el-table-column prop="phone" label="联系方式" width="180"/>
    <el-table-column prop="date" label="报名日期" width="180"/>
    <el-table-column prop="state" label="审核状态" width="120">
      <template #default="scope">
        <el-tag type="primary" v-if="scope.row.state ===0">待审核</el-tag>
        <el-tag type="success" v-if="scope.row.state ===1">审核通过</el-tag>
        <el-tag type="danger" v-if="scope.row.state ===-1">审核不通过</el-tag>
      </template>
    </el-table-column>
    <el-table-column prop="advance" label="审核意见"/>
    <el-table-column label="操作" width="120">
      <template #default="scope">
        <el-button plain
                   v-if="scope.row.state !==1"
                   size="small"
                   type="danger"
                   @click="handleReset(scope.$index, scope.row)"
        >取消报名
        </el-button>
      </template>
    </el-table-column>
  </el-table>
  <el-pagination class="m-t-20 m-l-10" background layout="prev, pager, next" :total="1"/>
  <!--    -->
  <!--    -->
  <el-divider content-position="left"></el-divider>
  <div class="text-bold-6 text-xl m-t-30">我预约的服务</div>
  <el-table :data="order" style="width: 100%" size="large">
    <el-table-column prop="name" label="服务" width="auto">
      <template #default="scope">
        <div class="text-overflow-sub">{{ scope.row.name }}</div>
      </template>
    </el-table-column>
    <el-table-column prop="date" label="预约时间" width="auto"/>
    <el-table-column prop="state" label="审核状态" width="auto">
      <template #default="scope">
        <el-tag type="primary" v-if="scope.row.state ===0">待审核</el-tag>
        <el-tag type="success" v-if="scope.row.state ===1">审核通过</el-tag>
        <el-tag type="danger" v-if="scope.row.state ===-1">审核不通过</el-tag>
      </template>
    </el-table-column>
    <el-table-column prop="advance" label="审核意见"/>
    <el-table-column label="操作" width="120">
      <template #default="scope">
        <el-button plain
                   v-if="scope.row.state !==1"
                   size="small"
                   type="danger"
                   @click="handleReset(scope.$index, scope.row)"
        >取消预约
        </el-button>
      </template>
    </el-table-column>
  </el-table>
  <el-pagination class="m-t-20 m-l-10" background layout="prev, pager, next" :total="1"/>
  <!--    -->
</template>

<script setup lang="ts">
import {onMounted, ref} from "vue";
import request from "@/request";
import api from "@/api";

onMounted(() => {
  api.user.selectUserByAcc(localStorage.getItem("user")).then((rs: any) => {
    myself.value = rs.data;
  })
  api.order.selectOrderByAcc(localStorage.getItem("user")).then((rs: any) => {
    order.value = rs.data
  })
  api.apply.selectApplyByAcc(localStorage.getItem("user")).then((rs: any) => {
    apply.value = rs.data
  })
})
const myself = ref([])
const apply = ref([])
const order = ref([])

function handleReset(i, r) {
  console.log(i);
  console.log(r);
}
</script>
<style scoped>
:deep(.my-label) {
  background: var(--el-color-success-light-9) !important;
}

:deep(.my-content) {
  background: var(--el-color-danger-light-9);
}
</style>