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
      <el-button :disabled="tableSelect.length===0" plain type="danger" @click="multipleDelete">批量删除</el-button>
    </el-space>
  </el-card>

  <el-card style="margin-top: 10px;">
    <el-table
        :header-cell-style="{'background-color': '#f6f6f6'}"
        :data="tableData" border
        :default-sort="{ prop: 'id', order: 'ascending' }"
        @selection-change="handleSelect"
        style="width: 100%;font-size: 12px;"
    >
      <el-table-column align="center" type="selection"/>
      <el-table-column align="center" prop="id" label="编号" width="90" :formatter="formatter" sortable/>
      <el-table-column align="center" prop="serveName" label="服务名称"/>
      <el-table-column align="center" prop="date" label="服务详情" width="90">
        <template #default="scope">
          <el-button size="small" plain @click="handleDetail(scope.row.serve)">
            查看
          </el-button>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="userName" label="用户姓名" width="90"/>
      <el-table-column align="center" prop="date" label="用户详情" width="90">
        <template #default="scope">
          <el-button size="small" plain @click="handleDetail(scope.row.user)">
            查看
          </el-button>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="date" label="提交日期" width="100"/>
      <el-table-column align="center" prop="checked" label="审核状态" width="100">
        <template #default="scope">
          <el-tag
              :type="scope.row.checked==='待审核'?'primary':''||scope.row.checked==='审核通过'?'success':''||scope.row.checked==='审核拒绝'?'danger':''">
            {{ scope.row.checked }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="advice" label="审核意见" width="90">
        <template #default="scope">
          <el-popover placement="top" trigger="hover" :content="scope.row.advice">
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
      <el-table-column fixed="right" align="center" label="操作" width="180">
        <template #default="scope">
          <el-button plain size="small" @click="handleEdit(scope.$index, scope.row)">
            审核
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

  <el-dialog v-model="editorDialog" title="审核" :close-on-click-modal="false" width="500">
    <el-form
        ref="editorRef"
        :model="editorForm"
        label-width="80px"
        style="padding: 20px 60px 20px 20px;"
    >
      <el-form-item label="审核状态" prop="checked" :rules="[{ required: true, message: '请输入联系电话' }]">
        <el-radio-group v-model="editorForm.checked">
          <el-radio value="待审核" size="large">待审核</el-radio>
          <el-radio value="审核通过" size="large">审核通过</el-radio>
          <el-radio value="审核拒绝" size="large">审核拒绝</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="审核意见" prop="advice" :rules="[{ required: false, message: '请输入审核意见' }]">
        <el-input v-model="editorForm.advice" maxlength="30" placeholder="请输入审核意见" show-word-limit type="textarea"/>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer" style="padding-right: 60px;">
        <el-button size="large" @click="editorReset(editorRef)">关闭</el-button>
        <el-button size="large" type="primary" @click="editorSubmit(editorRef)">
          提交
        </el-button>
      </div>
    </template>
  </el-dialog>

  <el-dialog v-model="detailDialog" title="查看详情" :close-on-click-modal="false" width="800">
    <el-card shadow="never" v-if="detailForm.pic">
      <el-row :gutter="20">
        <el-col :span="12">
          <img :src="detailForm.pic" alt=" ">
        </el-col>
        <el-col :span="12">
          <h2>{{ detailForm.name }}</h2>
          <el-descriptions title=" " :column="1" border>
            <el-descriptions-item label="账号：">{{ detailForm.acc }}</el-descriptions-item>
            <el-descriptions-item label="性别：">{{ detailForm.sex }}</el-descriptions-item>
            <el-descriptions-item label="年龄：">{{ detailForm.age }}</el-descriptions-item>
            <el-descriptions-item label="联系电话：">
              <b style="font-size: 18px;color: #0753a2;">{{ detailForm.phone }}</b>
            </el-descriptions-item>
            <el-descriptions-item label="地址：">{{ detailForm.address }}</el-descriptions-item>
          </el-descriptions>
        </el-col>
      </el-row>
    </el-card>
    <el-card shadow="never" v-if="detailForm.cover">
      <el-row :gutter="20">
        <el-col :span="12">
          <img :src="detailForm.cover" alt=" ">
        </el-col>
        <el-col :span="12">
          <h2>{{ detailForm.name }}</h2>
          <el-descriptions title=" " :column="1">
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
import {getCurrentInstance, onMounted, reactive, ref} from 'vue'
import type {FormInstance, TableColumnCtx} from 'element-plus'
import {ElMessage, ElMessageBox} from "element-plus";
import api from "@/api";
import {ServeShEditorParams} from "@/api/serveSh";

onMounted(() => {
  getTableData();
})

function getTableData() {
  api.serveSh.serveShList().then((res) => {
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
      api.serveSh.serveShSearch(searchForm.keyword).then((res) => {
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

const formatter = (row: ServeShEditorParams, column: TableColumnCtx<ServeShEditorParams>) => {
  return row.id
}

const tableSelect = ref<ServeShEditorParams[]>([])
const handleSelect = (val: ServeShEditorParams[]) => {
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
        api.serveSh.serveShDelete(element.id).then((res) => {
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

const handleEdit = (index: number, row: ServeShEditorParams) => {
  //@ts-ignore
  editorForm.value = row;
  editorDialog.value = true;
}

const editorDialog = ref(false);

const {appContext} = getCurrentInstance()!
const handleDelete = (index: number, row: ServeShEditorParams) => {
  ElMessageBox.confirm('是否删除这项数据?', '警告', {
    confirmButtonText: '确认',
    cancelButtonText: '取消',
    type: 'warning',
    closeOnClickModal: false,
  }, appContext).then(() => {
    if (row.id != null) {
      api.serveSh.serveShDelete(row.id).then((res) => {
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
const editorRef = ref<FormInstance>()
const editorForm = ref({
  id: null,
  serveId: null,
  userId: null,
  date: "",
  checked: "",
  advice: "",
  status: null
})
const editorSubmit = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      //@ts-ignore
      api.serveSh.serveShEditor(editorForm.value).then((res) => {
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
  // formEl.resetFields();
}
const statusList = [{label: '正常', value: 1}, {label: '禁用', value: 0}];
const sexList = [{label: '男', value: '男'}, {label: '女', value: '女'}];

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
:deep(.v-md-editor) {
  box-shadow: none !important;
  border: 1px solid #ccc;
}

:deep(.v-md-editor__main) {
  display: flex;
  /*flex-direction: column;*/
}

:deep(.v-md-editor__editor-wrapper) {
  border-bottom: 1px solid #dcdfe6;
}

:deep(.v-md-editor__toolbar) {

}

:deep(.v-md-editor__toolbar-left-wrapper) {

}

:deep(.v-md-editor__toolbar-left) {
}

:deep(.v-md-editor__toolbar-item-preview) {
  transform: translateX(4px);
}

:deep(.v-md-editor__toolbar-item-toc) {
  transform: translateX(4px);
}

:deep(.el-upload-list--picture) {
  width: 468px;
}

:deep(.el-upload-list__item > img) {
  width: 70px;
  height: 70px;
}
</style>
