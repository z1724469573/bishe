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
      <el-button plain type="primary" @click="handleAppend">新增</el-button>
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
      <el-table-column align="center" prop="id" label="编号" :formatter="formatter" sortable/>
      <el-table-column align="center" prop="title" label="名称" width="140"/>
      <el-table-column align="center" prop="sortName" label="类别" width="140"/>
      <el-table-column align="center" prop="content" label="查看详情" width="90">
        <template #default="scope">
          <el-button size="small" plain @click="handleDetail(scope.row.content)">
            查看
          </el-button>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="date" label="发布时间" width="120"/>
      <el-table-column align="center" prop="cover" label="封面">
        <template #default="scope">
          <el-image
              style="width: 40px; height: 40px;"
              :src="scope.row.cover"
              preview-teleported
              :max-scale="7"
              :min-scale="0.2"
              :zoom-rate="1.1"
              :preview-src-list="[scope.row.cover]"
              fit="cover"
          />
        </template>
      </el-table-column>
      <el-table-column align="center" prop="looks" label="浏览次数"/>
      <el-table-column align="center" prop="status" label="状态">
        <template #default="scope">
          <el-tag :type="scope.row.status===1?'primary':'danger'">正常</el-tag>
        </template>
      </el-table-column>
      <el-table-column fixed="right" align="center" label="操作" width="180">
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

  <el-dialog v-model="appendDialog" :close-on-click-modal="false" title="新增" width="700">
    <el-form
        ref="appendRef"
        :model="appendForm"
        label-width="100px"
        style="padding: 20px 80px 20px 20px;"
    >
      <el-form-item label="名称" prop="title" :rules="[{ required: true, message: '请输入名称' }]">
        <el-input placeholder="请输入名称" v-model="appendForm.title" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="类别" prop="title" :rules="[{ required: true, message: '请选择类别' }]">
        <el-select v-model="appendForm.sortId" placeholder="请选择类别" style="width: 220px">
          <el-option
              v-for="item in sortData"
              :key="item.id"
              :label="item.name"
              :value="item.id"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="封面" prop="cover" :rules="[{ required: true, message: '请输入封面' }]">
        <el-upload
            ref="appendUploadRef"
            :limit="1"
            :on-change="appendUpload"
            :on-exceed="appendExceed"
            :auto-upload="false"
            list-type="picture"
        >
          <template #trigger>
            <el-button type="primary">上传封面</el-button>
          </template>
        </el-upload>
      </el-form-item>
      <el-form-item label="发布时间" prop="date" :rules="[{ required: true, message: '请选择发布时间' }]">
        <el-date-picker
            v-model="appendForm.date"
            type="date" format="YYYY-MM-DD" value-format="YYYY-MM-DD"
            placeholder="请选择发布时间"
        />
      </el-form-item>
      <el-form-item label="详情" prop="content" :rules="[{ required: true, message: '请输入详情' }]">
        <v-md-editor mode="edit" v-model="appendForm.content" height="400px"></v-md-editor>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer" style="padding-right: 40px;">
        <el-button @click="appendReset(appendRef)">关闭</el-button>
        <el-button type="primary" @click="appendSubmit(appendRef)">
          提交
        </el-button>
      </div>
    </template>
  </el-dialog>

  <el-dialog v-model="editorDialog" title="编辑" :close-on-click-modal="false" width="700">
    <el-form
        ref="editorRef"
        :model="editorForm"
        label-width="100px"
        style="padding: 20px 80px 20px 20px;"
    >
      <el-form-item label="名称" prop="title" :rules="[{ required: true, message: '请输入名称' }]">
        <el-input placeholder="请输入名称" v-model="editorForm.title" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="类别" prop="title" :rules="[{ required: true, message: '请选择类别' }]">
        <el-select v-model="editorForm.sortId" placeholder="请选择类别" style="width: 220px">
          <el-option
              v-for="item in sortData"
              :key="item.id"
              :label="item.name"
              :value="item.id"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="封面" prop="cover" :rules="[{ required: true, message: '请输入封面' }]">
        <el-upload
            ref="editorUploadRef"
            :limit="1"
            :on-change="editorUpload"
            :on-exceed="editorExceed"
            :auto-upload="false"
            list-type="picture"
        >
          <template #trigger>
            <el-button type="primary">上传封面</el-button>
          </template>
        </el-upload>
      </el-form-item>
      <el-form-item label="发布时间" prop="date" :rules="[{ required: true, message: '请选择发布时间' }]">
        <el-date-picker
            v-model="editorForm.date"
            type="date" format="YYYY-MM-DD" value-format="YYYY-MM-DD"
            placeholder="请选择发布时间"
        />
      </el-form-item>
      <el-form-item label="详情" prop="content" :rules="[{ required: true, message: '请输入详情' }]">
        <v-md-editor mode="edit" v-model="editorForm.content" height="400px"></v-md-editor>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="editorReset(editorRef)">关闭</el-button>
        <el-button type="primary" @click="editorSubmit(editorRef)">
          提交
        </el-button>
      </div>
    </template>
  </el-dialog>

  <el-dialog v-model="detailDialog" title="查看详情" :close-on-click-modal="false" width="800">
    <v-md-editor mode="preview" v-model="detailForm.content" height="460px"></v-md-editor>
    <template #footer>
      <div class="dialog-footer">
        <el-button size="large" @click="detailDialog = false">关闭</el-button>
      </div>
    </template>
  </el-dialog>

</template>

<script setup lang="ts">
import {getCurrentInstance, onMounted, reactive, ref} from 'vue'
import type {FormInstance, TableColumnCtx, UploadInstance, UploadProps, UploadRawFile} from 'element-plus'
import {ElMessage, ElMessageBox, genFileId} from "element-plus";
import api from "@/api";
import {SortNewsEditorParams} from "@/api/sortNews";

onMounted(() => {
  getTableData();
})

function getTableData() {
  api.sortNews.sortNewsList().then((res) => {
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
      api.sortNews.sortNewsSearch(searchForm.keyword).then((res) => {
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

const formatter = (row: SortNewsEditorParams, column: TableColumnCtx<SortNewsEditorParams>) => {
  return row.id
}

const tableSelect = ref<SortNewsEditorParams[]>([])
const handleSelect = (val: SortNewsEditorParams[]) => {
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
        api.sortNews.sortNewsDelete(element.id).then((res) => {
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

const handleEdit = (index: number, row: SortNewsEditorParams) => {
  api.sort.sortList().then((res) => {
    sortData.value = res.data;
    //@ts-ignore
    editorForm.value = row;
    editorDialog.value = true;
  })
}

const editorDialog = ref(false);

const {appContext} = getCurrentInstance()!
const handleDelete = (index: number, row: SortNewsEditorParams) => {
  ElMessageBox.confirm('是否删除这项数据?', '警告', {
    confirmButtonText: '确认',
    cancelButtonText: '取消',
    type: 'warning',
    closeOnClickModal: false,
  }, appContext).then(() => {
    if (row.id != null) {
      api.sortNews.sortNewsDelete(row.id).then((res) => {
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
  sortId: null,
  title: "",
  content: "",
  date: "",
  cover: "",
  looks: "",
})

const sortData = ref([]);
const handleAppend = () => {
  api.sort.sortList().then((res) => {
    sortData.value = res.data;
    appendDialog.value = true;
  })
}

const appendSubmit = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      api.sortNews.sortNewsAppend(appendForm).then((res) => {
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
  id: "",
  sortId: null,
  title: "",
  content: "",
  date: "",
  cover: "",
  looks: "",
  status: ""
})
const editorSubmit = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      //@ts-ignore
      api.sortNews.sortNewsEditor(editorForm.value).then((res) => {
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

const appendUploadRef = ref<UploadInstance>();
const appendUpload = (e) => {
  const file = new FormData();
  file.append('file', e.raw);
  api.common.upload(file).then((res) => {
    typeof res === "string" ? appendForm.cover = res : "";
  })
}
const appendExceed: UploadProps['onExceed'] = (files) => {
  appendUploadRef.value!.clearFiles()
  const file = files[0] as UploadRawFile
  file.uid = genFileId()
  appendUploadRef.value!.handleStart(file)
}

const editorUploadRef = ref<UploadInstance>();
const editorUpload = (e) => {
  const file = new FormData();
  file.append('file', e.raw);
  api.common.upload(file).then((res) => {
    typeof res === "string" ? editorForm.value.cover = res : "";
  })
}
const editorExceed: UploadProps['onExceed'] = (files) => {
  editorUploadRef.value!.clearFiles()
  const file = files[0] as UploadRawFile
  file.uid = genFileId()
  editorUploadRef.value!.handleStart(file)
}

const detailDialog = ref(false);
const detailForm = ref({
  content: "",
})
const handleDetail = (e) => {
  detailForm.value.content = e;
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
