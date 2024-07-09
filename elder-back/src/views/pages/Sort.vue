<template>
  <el-card>
    <el-form
        ref="searchRef"
        :model="searchForm"
        label-width="0"
        :inline="true"
        style="height: 30px;"
    >
      <el-form-item
          prop="keyword"
          :rules="[
        { required: true, message: '关键词不能为空' },
      ]"
      >
        <el-input
            placeholder="请输入关键词进行查询"
            v-model.number="searchForm.keyword"
            type="text"
            autocomplete="off"
        />
      </el-form-item>
      <el-form-item>
        <el-button plain type="primary" @click="submitSearch(searchRef)">查询</el-button>
        <el-button plain type="info" @click="resetSearch(searchRef)">重置</el-button>
      </el-form-item>
    </el-form>
  </el-card>
  <el-card style="margin-top: 10px;">
    <el-space :size="10">
      <el-button plain type="primary" @click="dialogVisible = true">新增</el-button>
      <el-dialog
          v-model="dialogVisible"
          :close-on-click-modal="false"
          title="新增"
          width="500"
      >
        <el-form
            ref="ruleFormRef"
            :model="ruleForm"
            status-icon
            :rules="rules"
            label-width="auto"
            class="demo-ruleForm"
        >
          <el-form-item label="Password" prop="pass">
            <el-input v-model="ruleForm.pass" type="password" autocomplete="off"/>
          </el-form-item>
          <el-form-item label="Confirm" prop="checkPass">
            <el-input
                v-model="ruleForm.checkPass"
                type="password"
                autocomplete="off"
            />
          </el-form-item>
          <el-form-item label="Age" prop="age">
            <el-input v-model.number="ruleForm.age"/>
          </el-form-item>
        </el-form>
        <template #footer>
          <div class="dialog-footer">
            <el-button plain @click="dialogVisible = false">关闭</el-button>
            <el-button plain type="info" @click="resetForm(ruleFormRef)">重置</el-button>
            <el-button plain type="primary" @click="submitForm(ruleFormRef)">
              提交
            </el-button>
          </div>
        </template>
      </el-dialog>
      <el-button plain type="danger">批量删除</el-button>
    </el-space>
  </el-card>
  <el-card style="margin-top: 10px;">
    <el-table
        border
        :header-cell-style="{'background-color': '#f6f6f6'}"
        :data="tableData"
        :default-sort="{ prop: 'date', order: 'descending' }"
        style="width: 100%"
    >
      <el-table-column prop="date" label="Date" sortable width="180"/>
      <el-table-column prop="name" label="Name" width="180"/>
      <el-table-column prop="address" label="Address" :formatter="formatter"/>
    </el-table>
    <el-row justify="end">
      <el-pagination style="margin-top: 20px;" background layout="prev, pager, next" :total="1000"/>
    </el-row>
  </el-card>

</template>

<script setup lang="ts">
import {reactive, ref} from 'vue'
import type {FormInstance, FormRules, TableColumnCtx} from 'element-plus'

const searchRef = ref<FormInstance>()
const searchForm = reactive({
  keyword: '',
})

const submitSearch = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      console.log('submit!')
    } else {
      console.log('error submit!')
    }
  })
}

const resetSearch = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.resetFields()
}

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

const dialogVisible = ref(false);
const ruleFormRef = ref<FormInstance>()

const checkAge = (rule: any, value: any, callback: any) => {
  if (!value) {
    return callback(new Error('Please input the age'))
  }
  setTimeout(() => {
    if (!Number.isInteger(value)) {
      callback(new Error('Please input digits'))
    } else {
      if (value < 18) {
        callback(new Error('Age must be greater than 18'))
      } else {
        callback()
      }
    }
  }, 1000)
}

const validatePass = (rule: any, value: any, callback: any) => {
  if (value === '') {
    callback(new Error('Please input the password'))
  }
  callback();
}
const validatePass2 = (rule: any, value: any, callback: any) => {
  if (value === '') {
    callback(new Error('Please input the password again'))
  } else if (value !== ruleForm.pass) {
    callback(new Error("Two inputs don't match!"))
  } else {
    callback()
  }
}

const ruleForm = reactive({
  pass: '',
  checkPass: '',
  age: '',
})

const rules = reactive<FormRules<typeof ruleForm>>({
  pass: [{validator: validatePass, trigger: 'blur'}],
  checkPass: [{validator: validatePass2, trigger: 'blur'}],
  age: [{validator: checkAge, trigger: 'blur'}],
})

const submitForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      console.log('submit!')
    } else {
      console.log('error submit!')
    }
  })
}

const resetForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.resetFields()
}

</script>

<style scoped>
:deep(.el-card__body) {
  padding: 20px 10px;
}
</style>
