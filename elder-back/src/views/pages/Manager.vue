<template>
  <el-card>
    <el-form ref="searchRef" :model="searchForm" :inline="true" style="height: 30px;">
      <el-form-item prop="keyword" :rules="[{required: true, message: '关键词不能为空' }]">
        <el-input
            placeholder="请输入关键词进行查询"
            v-model="searchForm.keyword"
            type="text"
            autocomplete="off"
        />
      </el-form-item>
      <el-form-item>
        <el-button plain type="primary" @click="searchSubmit(searchRef)">查询</el-button>
        <el-button plain type="info" @click="searchReset(searchRef)">重置</el-button>
      </el-form-item>
    </el-form>
  </el-card>
  <el-card style="margin-top: 10px;">
    <el-space :size="12">
      <el-button plain type="primary" @click="appendDialog = true">新增</el-button>
      <el-button :disabled="tableSelect.length===0" plain type="danger" @click="multipleDelete">批量删除</el-button>
    </el-space>
  </el-card>
  <el-card style="margin-top: 10px;">
    <el-table
        :header-cell-style="{'background-color': '#f6f6f6'}"
        :data="tableData" border
        :default-sort="{ prop: 'id', order: 'ascending' }"
        @selection-change="handleSelect"
        style="width: 100%"
    >
      <el-table-column align="center" type="selection"/>
      <el-table-column align="center" prop="id" label="编号" :formatter="formatter" sortable/>
      <el-table-column align="center" prop="acc" label="账号"/>
      <el-table-column align="center" prop="pwd" label="密码">
        <template #default="scope">
          <el-popover placement="top" trigger="hover" :content="scope.row.pwd">
            <template #reference>
              <el-button size="small">查看</el-button>
            </template>
          </el-popover>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="name" label="名称"/>
      <el-table-column align="center" prop="sex" label="性别"/>
      <el-table-column align="center" prop="age" label="年龄"/>
      <el-table-column align="center" prop="phone" label="电话"/>
      <el-table-column align="center" prop="address" label="地址">
        <template #default="scope">
          <el-popover placement="top" trigger="hover" :content="scope.row.address===''?'无':scope.row.address">
            <template #reference>
              <el-button size="small">查看</el-button>
            </template>
          </el-popover>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="status" label="状态">
        <template #default="scope">
          <el-tag :type="scope.row.status===1?'primary':'danger'">正常</el-tag>
        </template>
      </el-table-column>
      <el-table-column align="center" label="操作" width="180">
        <template #default="scope">
          <el-button plain size="small" @click="handleEdit(scope.$index, scope.row)">
            编辑
          </el-button>
          <el-button plain size="small" type="danger" @click="handleDelete(scope.$index, scope.row)">
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-row justify="end" style="margin-top: 20px;">
      <el-pagination background layout="total ,prev, pager, next" :total="tableData.length"/>
    </el-row>
  </el-card>

  <el-dialog v-model="appendDialog" :close-on-click-modal="false" title="新增" width="600">
    <el-form
        ref="appendRef"
        :model="appendForm"
        label-width="60px"
        style="padding: 20px 80px 20px 20px;"
    >
      <el-form-item label="账号" prop="acc" :rules="[{ required: true, message: '请输入账号' }]">
        <el-input placeholder="请输入账号" v-model="appendForm.acc" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="密码" prop="pwd" :rules="[{ required: true, message: '请输入密码' }]">
        <el-input placeholder="请输入密码" type="password" v-model="appendForm.pwd" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="名称" prop="name" :rules="[{ required: true, message: '请输入名称' }]">
        <el-input placeholder="请输入名称" v-model="appendForm.name" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="性别" prop="sex" :rules="[{ required: true, message: '请选择性别' }]">
        <el-select v-model="appendForm.sex" placeholder="请选择性别">
          <el-option v-for="item in sexList" :key="item.value" :label="item.label" :value="item.value"/>
        </el-select>
      </el-form-item>
      <el-form-item label="年龄" prop="age" :rules="[{ required: true, message: '请输入年龄' }]">
        <el-input placeholder="请输入年龄" v-model.number="appendForm.age" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="电话" prop="phone" :rules="[{ required: true, message: '请输入电话' }]">
        <el-input placeholder="请输入电话" v-model="appendForm.phone" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="地址" prop="address" :rules="[{ required: false, message: '请输入地址' }]">
        <el-input placeholder="请输入地址" v-model="appendForm.address" autocomplete="off"/>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer" style="padding-right: 80px;">
        <el-button @click="appendReset(appendRef)" size="large">关闭</el-button>
        <el-button type="primary" @click="appendSubmit(appendRef)" size="large">
          提交
        </el-button>
      </div>
    </template>
  </el-dialog>

  <el-dialog v-model="editorDialog" title="编辑" :close-on-click-modal="false" width="600">
    <el-form
        ref="editorRef"
        :model="editorForm"
        label-width="60px"
        style="padding: 20px 80px 20px 20px;"
    >
      <el-form-item label="编号" prop="id" :rules="[{ required: true, message: '请输入编号' }]">
        <el-input v-model="editorForm.id" disabled/>
      </el-form-item>
      <el-form-item label="账号" prop="acc" :rules="[{ required: true, message: '请输入账号' }]">
        <el-input disabled placeholder="请输入账号" v-model="editorForm.acc" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="密码" prop="pwd" :rules="[{ required: true, message: '请输入密码' }]">
        <el-input disabled placeholder="请输入密码" type="password" v-model="editorForm.pwd" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="名称" prop="name" :rules="[{ required: true, message: '请输入名称' }]">
        <el-input placeholder="请输入名称" v-model="editorForm.name" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="性别" prop="sex" :rules="[{ required: true, message: '请选择性别' }]">
        <el-select v-model="editorForm.sex" placeholder="请选择性别">
          <el-option v-for="item in sexList" :key="item.value" :label="item.label" :value="item.value"/>
        </el-select>
      </el-form-item>
      <el-form-item label="年龄" prop="age" :rules="[{ required: true, message: '请输入年龄' }]">
        <el-input placeholder="请输入年龄" v-model.number="editorForm.age" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="电话" prop="phone" :rules="[{ required: true, message: '请输入电话' }]">
        <el-input placeholder="请输入电话" v-model="editorForm.phone" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="地址" prop="address" :rules="[{ required: false, message: '请输入地址' }]">
        <el-input placeholder="请输入地址" v-model="editorForm.address" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="状态" prop="status" :rules="[{ required: true, message: '请选择状态' }]">
        <el-select v-model="editorForm.status" placeholder="请选择状态">
          <el-option v-for="item in statusList" :key="item.value" :label="item.label" :value="item.value"/>
        </el-select>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer" style="padding-right: 80px;">
        <el-button @click="editorReset(editorRef)" size="large">关闭</el-button>
        <el-button type="primary" @click="editorSubmit(editorRef)" size="large">
          提交
        </el-button>
      </div>
    </template>
  </el-dialog>
</template>

<script setup lang="ts">
import {getCurrentInstance, onMounted, reactive, ref} from 'vue'
import type {FormInstance, TableColumnCtx} from 'element-plus'
import {ElMessage, ElMessageBox} from "element-plus";
import api from "@/api";
import {ManagerEditorParams} from "@/api/manager";

onMounted(() => {
  getTableData();
})

function getTableData() {
  api.manager.managerList().then((res) => {
    tableData.value = res.data;
  })
}

const searchRef = ref<FormInstance>()
const searchForm = reactive({
  keyword: '',
})

const searchSubmit = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      api.manager.managerSearch(searchForm.keyword).then((res) => {
        tableData.value = res.data;
        ElMessage({
          message: res.message,
          type: res.success ? 'success' : 'error',
          grouping: true,
          showClose: true
        })
      })
    } else {
    }
  })
}

const searchReset = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.resetFields();
  getTableData();
}

const formatter = (row: ManagerEditorParams, column: TableColumnCtx<ManagerEditorParams>) => {
  return row.id
}

const tableSelect = ref<ManagerEditorParams[]>([])
const handleSelect = (val: ManagerEditorParams[]) => {
  tableSelect.value = val;
}

const multipleDelete = () => {
  ElMessageBox.confirm('是否批量删除选中数据?', '警告', {
    confirmButtonText: '确认',
    cancelButtonText: '取消',
    type: 'warning',
    closeOnClickModal: false,
  }, appContext).then(() => {
    //删除逻辑
    for (let i = 0; i < tableSelect.value.length; i++) {
      let element = tableSelect.value[i];
      if (element.id != null) {
        api.manager.managerDelete(element.id).then((res) => {
          ElMessage({
            message: res.message,
            type: res.success ? 'success' : 'error',
            grouping: true,
            showClose: true
          });
          getTableData();
        })
      }
    }
  }).catch(() => {
  });
}

const handleEdit = (index: number, row: ManagerEditorParams) => {
  //@ts-ignore
  editorForm.value = row;
  editorDialog.value = true;
}

const editorDialog = ref(false);

const {appContext} = getCurrentInstance()!
const handleDelete = (index: number, row: ManagerEditorParams) => {
  ElMessageBox.confirm('是否删除这项数据?', '警告', {
    confirmButtonText: '确认',
    cancelButtonText: '取消',
    type: 'warning',
    closeOnClickModal: false,
  }, appContext).then(() => {
    if (row.id != null) {
      api.manager.managerDelete(row.id).then((res) => {
        ElMessage({
          message: res.message,
          type: res.success ? 'success' : 'error',
          grouping: true,
          showClose: true
        });
        getTableData();
      })
    }
  }).catch(() => {
  });
}

const tableData = ref([]);
const appendDialog = ref(false);
const appendRef = ref<FormInstance>()
const appendForm = reactive({
  acc: "",
  pwd: "",
  name: "",
  sex: "",
  age: null,
  phone: "",
  address: "",
})

const appendSubmit = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      api.manager.managerAppend(appendForm).then((res) => {
        ElMessage({
          message: res.message,
          type: res.success ? 'success' : 'error',
          grouping: true,
          showClose: true
        });
        if (res.success) appendReset(formEl);
        getTableData();
      })
    } else {
    }
  })
}
const appendReset = (formEl: FormInstance | undefined) => {
  appendDialog.value = false;
  if (!formEl) return
  formEl.resetFields()
}

const editorRef = ref<FormInstance>()
const editorForm = ref({
  id: '',
  acc: "",
  pwd: "",
  name: "",
  sex: "",
  age: null,
  phone: "",
  address: "",
  status: '',
})
const editorSubmit = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      //@ts-ignore
      api.manager.managerEditor(editorForm.value).then((res) => {
        ElMessage({
          message: res.message,
          type: res.success ? 'success' : 'error',
          grouping: true,
          showClose: true
        });
        if (res.success) editorReset(formEl);
      })
    } else {
    }
  })
}
const editorReset = (formEl: FormInstance | undefined) => {
  editorDialog.value = false;
  getTableData();
  // if (!formEl) return
  // formEl.resetFields()
}
const statusList = [{label: '正常', value: 1}, {label: '禁用', value: 0}];
const sexList = [{label: '男', value: '男'}, {label: '女', value: '女'}];

</script>

<style scoped>

</style>
