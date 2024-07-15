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
          <el-table-column align="center" type="selection" width="55"/>
          <el-table-column align="center" prop="date" label="Date" sortable width="180"/>
          <el-table-column align="center" prop="name" label="Name" width="180"/>
          <el-table-column align="center" prop="address" label="Address" :formatter="formatter"/>
          <el-table-column align="center" label="Operations">
            <template #default="scope">
              <el-button size="small" @click="handleEdit(scope.$index, scope.row)">
                Edit
              </el-button>
              <el-button
                  size="small"
                  type="danger"
                  @click="handleDelete(scope.$index, scope.row)"
              >
                Delete
              </el-button>
            </template>
          </el-table-column>
        </el-table>
        <template #footer>
          <el-row justify="end">
            <el-pagination background layout="total, prev, pager, next" :total="1000"/>
          </el-row>
        </template>
      </el-card>
    </el-col>
  </el-row>
</template>

<script setup lang="ts">
import type {TableColumnCtx} from 'element-plus'

interface User {
  date: string
  name: string
  address: string
}

const formatter = (row: User, column: TableColumnCtx<User>) => {
  return row.address
}

const tableData: User[] = [
  {
    date: '2016-05-03',
    name: 'Tom',
    address: 'No. 189, Grove St, Los Angeles',
  },
  {
    date: '2016-05-02',
    name: 'Tom',
    address: 'No. 189, Grove St, Los Angeles',
  },
  {
    date: '2016-05-04',
    name: 'Tom',
    address: 'No. 189, Grove St, Los Angeles',
  },
  {
    date: '2016-05-01',
    name: 'Tom',
    address: 'No. 189, Grove St, Los Angeles',
  },
]

const handleEdit = (index: number, row: User) => {
  console.log(index, row)
}
const handleDelete = (index: number, row: User) => {
  console.log(index, row)
}

</script>

<style scoped>

</style>