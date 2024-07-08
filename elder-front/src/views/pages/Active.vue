<template>
  <el-row>
    <el-col :span="3"></el-col>
    <el-col :span="18">
      <el-card style="width: calc(25% - 10px);float: left;margin: 5px;" v-for="item in 6">
        <img
            src="https://cdn-hw-static2.shanhutech.cn/bizhi/staticwp/202306/372e4fe6e22117b4647911751abfc42b--179789999.jpg"
            alt=" ">
        <p style="font-size: 14px;">爱心共建聚合力 关爱老人做公益</p>
        <el-row align="middle" justify="space-between" style="margin-top: 20px;">
          <p style="font-size: 12px;">2024-08-09 12:23:23</p>
          <el-button text size="small">更多</el-button>
        </el-row>
      </el-card>
    </el-col>
    <el-col :span="3"></el-col>
  </el-row>
</template>

<script setup lang="ts">

</script>

<style scoped>

</style>
