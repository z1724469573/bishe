<template>
  <el-card style="font-size: 14px;color: #0753a2;"><b>您好，管理员！欢迎使用本系统！</b></el-card>
  <el-row :gutter="20">
    <el-col :span="12">
      <el-card style="margin-top: 10px;">
        <v-chart class="chart" :option="option_one"/>
      </el-card>
    </el-col>
    <el-col :span="12">
      <el-card style="margin-top: 10px;">
        <v-chart class="chart" :option="option_two"/>
      </el-card>
    </el-col>
  </el-row>
  <el-card style="margin-top: 10px;"></el-card>
</template>

<script setup lang="ts">
import {ref} from "vue";

const data = ref([
  {name: 'A', value: {value: 110, itemStyle: {color: '#ffaa2e'}}},
  {name: 'B', value: {value: 210, itemStyle: {color: '#33c8ed'}}},
  {name: 'C', value: {value: 89, itemStyle: {color: '#fe5252'}}},
  {name: 'D', value: {value: 56, itemStyle: {color: '#91cc75'}}},
  {name: 'E', value: {value: 140, itemStyle: {color: '#73c0de'}}},
  {name: 'F', value: {value: 40, itemStyle: {color: '#cec74e'}}},
  {name: 'G', value: {value: 90, itemStyle: {color: '#14ad2a'}}},
  {name: 'H', value: {value: 40, itemStyle: {color: '#aa47d9'}}},
]);

const option_one = ref({
  title: {
    text: '各类活动报名统计数量',
    subtext: 'Living Expenses in Shenzhen'
  },
  xAxis: {
    type: 'category',
    data: data.value.map(d => d.name),
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      data: data.value.map(d => d.value),
      type: 'bar'
    }
  ]
});

const option_two = ref({
  title: {
    text: '各类服务预约统计',
    subtext: 'Fake Data',
    left: 'center'
  },
  tooltip: {
    trigger: 'item'
  },
  legend: {
    orient: 'vertical',
    left: 'left'
  },
  series: [
    {
      name: 'Access From',
      type: 'pie',
      radius: '50%',
      data: [
        {value: 1048, name: 'Search Engine'},
        {value: 735, name: 'Direct'},
        {value: 580, name: 'Email'},
        {value: 484, name: 'Union Ads'},
        {value: 300, name: 'Video Ads'}
      ],
      emphasis: {
        itemStyle: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
      }
    }
  ]
})

</script>

<style scoped>
.chart {
  height: 400px;
}
</style>
