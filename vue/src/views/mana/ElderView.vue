<template>
  <div>
    <el-space wrap>
      <el-input v-model="searchValue.id" placeholder="请输入..."/>
      <el-button type="primary" @click="search">查找</el-button>
      <el-button type="success" @click="dialogSave = true">添加</el-button>
      <el-button type="info" @click="update" disabled>修改</el-button>
      <el-button type="danger" @click="remove">批量删除</el-button>
      <el-button type="warning" @click="dialogImpact = true">导入</el-button>
      <el-button type="warning" @click="explore">导出</el-button>
    </el-space>
    <el-divider/>
    <el-table @selection-change="handleSelectionChange" :data="tableData" style="width: 100%" height="76.5vh">
      <el-table-column type="selection" width="55"/>
      <el-table-column v-for="item in list" :prop="item.en" :label="item.zh" :width="item.width" align="center"/>

      <el-table-column prop="elderCover" label="封面" align="center">
        <template #default="scope">
          <el-popover effect="light" trigger="hover" placement="top" width="auto">
            <template #default>
              <div>{{ scope.row.elderCover }}</div>
            </template>
            <template #reference>
              <el-avatar shape="square" :size="50" :src="scope.row.elderCover"/>
            </template>
          </el-popover>
        </template>
      </el-table-column>

      <el-table-column label="状态" width="100">
        <template #default="scope">
          <el-tag type="success" v-if="scope.row.elderState===1">正常</el-tag>
          <el-tag type="danger" v-if="scope.row.elderState===0">禁用</el-tag>
        </template>
      </el-table-column>

      <el-table-column label="操作" align="center">
        <template #default="scope">
          <el-button size="small" @click="handleEdit(scope.$index, scope.row)">
            编辑
          </el-button>
          <el-button
              size="small"
              type="danger"
              @click="handleDelete(scope.$index, scope.row)">
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <div class="flex justify-end align-center m-t-10">
      <el-pagination background layout="prev, pager, next" :total="total"
                     :page-sizes="[10, 20, 30, 40]"
                     @size-change="handleSizeChange"
                     @current-change="handleCurrentChange"
      />
    </div>

    <!--  添加  -->
    <el-dialog v-model="dialogSave" title="添加数据" width="33%">
      <el-form :model="formSave">
        <div v-for="item in elderList">
          <el-form-item v-if="item.zh!=='状态'" :label="item.zh">
            <el-input v-model="formSave[item.en]" placeholder="请输入..." clearable/>
          </el-form-item>
        </div>
        <el-form-item label="状态">
          <el-radio-group v-model="formSave.elderState">
            <el-radio label="1">正常</el-radio>
            <el-radio label="0">禁用</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item>
          <el-button class="w-fill" color="#626aef" type="primary" @click="save">提交</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

    <!--  编辑  -->
    <el-dialog v-model="dialogEdit" title="编辑数据" width="33%">
      <el-form :model="formEdit">
        <div v-for="(item,index) in elderList" :class="index===0||index===elderList.length-1?'none':''">
          <el-form-item :label="item.zh">
            <el-input v-model="formEdit[item.en]" placeholder="请输入..." clearable/>
          </el-form-item>
        </div>
        <el-form-item label="状态">
          <el-radio-group v-model="formEdit.elderState">
            <el-radio :label="1">正常</el-radio>
            <el-radio :label="0">禁用</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item>
          <el-button class="w-fill" color="#626aef" type="primary" @click="update">提交</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

    <!--  导入  -->
    <el-dialog v-model="dialogImpact" title="导入数据" width="33%">
      <el-form>
        <el-upload
            :on-remove="handleRemove"
            :on-change="handleChange"
            v-model:file-list="fileList"
            accept="file/xsl, file/xsxl"
            :show-file-list="true"
            :auto-upload="false"
            :limit="2"
            multiple
            drag
        >
          <el-icon class="el-icon--upload">
            <upload-filled/>
          </el-icon>
          <div class="el-upload__text">
            将文件拖到这里 or <em>点击这里</em>
          </div>
          <template #tip>
            <div class="el-upload__tip">
              只支持上传xsl/xsxl文件
            </div>
          </template>
        </el-upload>
        <el-form-item class="m-t-10">
          <el-button class="w-fill" color="#626aef" type="primary" @click="impact">提交</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script lang="ts" setup>
import {onMounted, reactive, ref} from "vue";
import api from "@/api";
import type {UploadProps} from 'element-plus'
import {ElMessage, ElTable, UploadFile, UploadFiles} from "element-plus";
import {DeleteElderParams, InsertElderParams} from "@/api/elder";
import {UploadFilled} from '@element-plus/icons-vue'

const elderList = [
  {zh: '主键', width: 55, en: 'elderId'},
  {zh: '标题', width: 120, en: 'elderLabel'},
  {zh: '内容', width: 100, en: 'elderContent'},
  {zh: '标签', width: 80, en: 'elderTag'},
  {zh: '价格', width: 60, en: 'elderPrice'},
  {zh: '地址', width: 60, en: 'elderAddress'},
  {zh: '成立时间', width: 60, en: 'elderDate'},
  {zh: '封面', width: 40, en: 'elderCover'},
  {zh: '房间数', width: 60, en: 'elderBed'},
  {zh: '面积', width: 60, en: 'elderArea'},
  {zh: '电话', width: 60, en: 'elderPhone'},
  {zh: '经度', width: 60, en: 'elderJw'},
  {zh: '纬度', width: 60, en: 'elderWd'},
  {zh: '状态', width: 60, en: 'elderState'},
]

let list = [];
elderList.filter((e, i) => {
  if (e.en !== 'elderCover' && e.en !== 'elderState') list.push(e);
})

onMounted(() => {
  getListPage(page.value, pageSize.value);
})
//获取分页数据
let tableData: InsertElderParams[] = [];
const total = ref(0);
const page = ref(1);
const pageSize = ref(13);

function getListPage(page, pageSize) {
  api.elder.listPageElder(page, pageSize).then((rs: any) => {
    tableData = rs.data.records;
    total.value = rs.data.total;
  })
}

//多选
const multipleSelection = ref<InsertElderParams[]>()
let isSelection = ref(false);
const handleSelectionChange = (val: InsertElderParams[]) => {
  isSelection.value = true;
  multipleSelection.value = val
}
//打开编辑对话框
const dialogEdit = ref(false)
let formEdit: InsertElderParams = reactive({})
const handleEdit = (index: number, row: InsertElderParams) => {
  dialogEdit.value = true;
  formEdit = row;
}
//单个删除
const handleDelete = (index: number, row: InsertElderParams) => {
  const rowValue: DeleteElderParams = {id: 0};
  rowValue.id = JSON.parse(JSON.stringify(row)).elderId;
  api.elder.deleteElder(rowValue).then((rs: any) => {
    ElMessage({
      message: rs.message,
      grouping: true,
      type: rs.success ? 'success' : 'error',
    })
    getListPage(page.value, pageSize.value);
  })
}
//搜索
const searchValue = ref({}<DeleteElderParams>);

function search() {
  api.elder.selectElder(searchValue.value).then((rs: any) => {
    if (searchValue.value.id == null) return;
    if (rs.success) tableData = [rs.data];
    else ElMessage({
      message: rs.message,
      grouping: true,
      type: rs.success ? 'success' : 'error',
    })
  })
}

//保存
const dialogSave = ref(false)
let formSave: InsertElderParams = reactive({})
const empty: InsertElderParams = reactive({})

function save() {
  const form = JSON.parse(JSON.stringify(formSave));
  api.elder.insertElder(form).then((rs: any) => {
    ElMessage({
      message: rs.message,
      grouping: true,
      type: rs.success ? 'success' : 'error',
    })
    getListPage(page.value, pageSize.value);
    dialogSave.value = false;
    formSave = empty;
  })
}

//编辑
function update() {
  api.elder.updateElder(formEdit).then((rs: any) => {
    ElMessage({
      message: rs.message,
      grouping: true,
      type: rs.success ? 'success' : 'error',
    })
    getListPage(page.value, pageSize.value);
    dialogEdit.value = false;
    formEdit = empty;
  })
}

//批量删除
function remove() {
  if (!isSelection.value) return;
  const selection = JSON.parse(JSON.stringify(multipleSelection.value));
  for (let i = 0; i < selection.length; i++) {
    api.elder.deleteElder({id: selection[i].elderId}).then((rs: any) => {
      ElMessage({
        message: rs.message,
        grouping: true,
        type: rs.success ? 'success' : 'error',
      })
    })
    multipleSelection.value = [];
    getListPage(page.value, pageSize.value);
  }
}

//导入
const dialogImpact = ref(false);
const fileList = ref<any["fileList"]>([]);

const handleChange: UploadProps['onChange'] = (file: UploadFile, uploadFiles: UploadFiles) => {
  fileList.value = [...(fileList.value || []), file.raw];
  return false;
}

const handleRemove: UploadProps['onRemove'] = (file: UploadFile, uploadFiles: UploadFiles) => {
  const index = fileList.value.indexOf(file);
  const newFileList = fileList.value.slice();
  newFileList.splice(index, 1);
  fileList.value = newFileList;
}

function impact() {
  fileList.value.forEach((file: UploadProps["fileList"]) => {
    const formData = new FormData();
    formData.append("file", file.raw as any);
    api.elder.importExcelElder(formData).then((rs: any) => {
      ElMessage({
        message: rs.success ? rs.message : file.raw.name + " 失败！",
        grouping: true,
        duration: rs.success ? 3000 : 10000,
        showClose: !rs.success,
        type: rs.success ? 'success' : 'error',
      })
      fileList.value = [];
      dialogImpact.value = false;
    })
  });
}

//导出
function explore() {
  api.elder.exportExcelElder().then((rs: any) => {
    const link = document.createElement('a')
    const fileName = "养老院表.xlsx";
    let blob = new Blob([rs], {type: 'application/vnd.ms-excel'})
    link.style.display = 'none'
    link.href = URL.createObjectURL(blob)
    link.download = fileName
    document.body.appendChild(link)
    link.click()
    document.body.removeChild(link)
  })
}

const handleSizeChange = (val: number) => {
  console.log(`${val} items per page`)
}
//获取分页数据
const handleCurrentChange = (val: number) => {
  page.value = val;
  getListPage(page.value, pageSize.value);
}

</script>

<style scoped>
:deep(.el-divider) {
  margin: 10px 0 !important;
}
</style>