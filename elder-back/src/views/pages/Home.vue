<template>
  <el-card style="font-size: 16px;color: #0753a2;"><b>您好，管理员！欢迎使用本系统！</b></el-card>
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
  <el-row :gutter="20">
    <el-col :span="12">
      <el-card style="margin-top: 10px;">
        <el-text style="font-size: 20px;"><b>版本日志</b></el-text>
        <el-steps direction="vertical" :space="90" style="margin-top: 20px;">
          <el-step :icon="ArrowUpBold" title="系统初步开发完成，开始内测" description="2024-07-18 12:00:00"/>
          <el-step :icon="ArrowUpBold" title="累了休息" description="2024-07-15 12:00:00"/>
          <el-step :icon="ArrowUpBold" title="系统V2版本开始开发" description="2024-07-08 12:00:00"/>
          <el-step :icon="ArrowUpBold" title="系统V1版本完成开发，代码全部提交" description="2024-03-02 12:00:00"/>
        </el-steps>
      </el-card>
    </el-col>
    <el-col :span="12">
    </el-col>
  </el-row>
</template>

<script setup lang="ts">
import {ref} from "vue";
import {ArrowUpBold} from '@element-plus/icons-vue'

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

.el-steps svg {
  transform: scale(1.6);
  color: #aaa;
}
</style>
