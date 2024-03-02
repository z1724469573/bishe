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

      <el-table-column label="状态" width="100">
        <template #default="scope">
          <el-tag type="success" v-if="scope.row.orderState===1">正常</el-tag>
          <el-tag type="danger" v-if="scope.row.orderState===0">禁用</el-tag>
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
        <div v-for="item in orderList">
          <el-form-item v-if="item.zh!=='状态'" :label="item.zh">
            <el-input v-model="formSave[item.en]" placeholder="请输入..." clearable/>
          </el-form-item>
        </div>
        <el-form-item label="状态">
          <el-radio-group v-model="formSave.orderState">
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
        <div v-for="(item,index) in orderList" :class="index===0||index===orderList.length-1?'none':''">
          <el-form-item :label="item.zh">
            <el-input v-model="formEdit[item.en]" placeholder="请输入..." clearable/>
          </el-form-item>
        </div>
        <el-form-item label="状态">
          <el-radio-group v-model="formEdit.orderState">
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
import {DeleteOrderParams, InsertOrderParams} from "@/api/order";
import {UploadFilled} from '@element-plus/icons-vue'

const orderList = [
  {zh: '主键', width: 'auto', en: 'orderId'},
  {zh: '用户账号', width: 0, en: 'orderAcc'},
  {zh: '日期', width: 0, en: 'orderDate'},
  {zh: '审核', width: 0, en: 'orderCheck'},
  {zh: '意见', width: 0, en: 'orderAdvice'},
  {zh: '状态', width: 0, en: 'orderState'},
]

let list = [];
orderList.filter((e, i) => {
  if (e.en !== 'orderState') list.push(e);
})

onMounted(() => {
  getListPage(page.value, pageSize.value);
})
//获取分页数据
let tableData: InsertOrderParams[] = [];
const total = ref(0);
const page = ref(1);
const pageSize = ref(13);

function getListPage(page, pageSize) {
  api.order.listPageOrder(page, pageSize).then((rs: any) => {
    tableData = rs.data.records;
    total.value = rs.data.total;
  })
}

//多选
const multipleSelection = ref<InsertOrderParams[]>()
let isSelection = ref(false);
const handleSelectionChange = (val: InsertOrderParams[]) => {
  isSelection.value = true;
  multipleSelection.value = val
}
//打开编辑对话框
const dialogEdit = ref(false)
let formEdit: InsertOrderParams = reactive({})
const handleEdit = (index: number, row: InsertOrderParams) => {
  dialogEdit.value = true;
  formEdit = row;
}
//单个删除
const handleDelete = (index: number, row: InsertOrderParams) => {
  const rowValue: DeleteOrderParams = {id: 0};
  rowValue.id = JSON.parse(JSON.stringify(row)).orderId;
  api.order.deleteOrder(rowValue).then((rs: any) => {
    ElMessage({
      message: rs.message,
      grouping: true,
      type: rs.success ? 'success' : 'error',
    })
    getListPage(page.value, pageSize.value);
  })
}
//搜索
const searchValue = ref({}<DeleteOrderParams>);

function search() {
  api.order.selectOrder(searchValue.value).then((rs: any) => {
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
let formSave: InsertOrderParams = reactive({})
const empty: InsertOrderParams = reactive({})

function save() {
  const form = JSON.parse(JSON.stringify(formSave));
  api.order.insertOrder(form).then((rs: any) => {
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
  api.order.updateOrder(formEdit).then((rs: any) => {
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
    api.order.deleteOrder({id: selection[i].orderId}).then((rs: any) => {
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
    api.order.importExcelOrder(formData).then((rs: any) => {
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
  api.order.exportExcelOrder().then((rs: any) => {
    const link = document.createElement('a')
    const fileName = "服务预约表.xlsx";
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