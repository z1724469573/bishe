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

      <el-table-column v-for="item in list" :prop="item.en" :label="item.zh"
                       :width="item.width" align="center"/>

      <el-table-column prop="swiperSrc" label="封面" align="center">
        <template #default="scope">
          <el-popover effect="light" trigger="hover" placement="top" width="auto">
            <template #default>
              <div>{{ scope.row.swiperSrc }}</div>
            </template>
            <template #reference>
              <el-avatar shape="square" :size="50" :src="scope.row.swiperSrc"/>
            </template>
          </el-popover>
        </template>
      </el-table-column>

      <el-table-column label="状态" width="100">
        <template #default="scope">
          <el-tag type="success" v-if="scope.row.swiperState===1">正常</el-tag>
          <el-tag type="danger" v-if="scope.row.swiperState===0">禁用</el-tag>
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
        <div v-for="item in swiperList">
          <el-form-item v-if="item.zh!=='状态'" :label="item.zh">
            <el-input v-model="formSave[item.en]" placeholder="请输入..." clearable/>
          </el-form-item>
        </div>
        <el-form-item label="状态">
          <el-radio-group v-model="formSave.swiperState">
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
        <div v-for="(item,index) in swiperList" :class="index===0||index===swiperList.length-1?'none':''">
          <el-form-item :label="item.zh">
            <el-input v-model="formEdit[item.en]" placeholder="请输入..." clearable/>
          </el-form-item>
        </div>
        <el-form-item label="状态">
          <el-radio-group v-model="formEdit.swiperState">
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
import {computed, onMounted, reactive, ref} from "vue";
import api from "@/api";
import {ElMessage, UploadFile, UploadFiles, UploadRawFile} from "element-plus";
import {DeleteSwiperParams, InsertSwiperParams} from "@/api/swiper";
import {ElTable} from 'element-plus'
import type {UploadInstance} from 'element-plus'
import type {UploadProps, UploadUserFile} from 'element-plus'
import {UploadFilled} from '@element-plus/icons-vue'

const swiperList = [
  {zh: '主键', width: 100, en: 'swiperId'},
  {zh: '标题', width: 100, en: 'swiperLabel'},
  {zh: '图片', width: 300, en: 'swiperSrc'},
  {zh: '文章', width: 300, en: 'swiperUrl'},
  {zh: '状态', width: 60, en: 'swiperState'},
]
let list = [];
swiperList.filter((e, i) => {
  if (i !== 2 && i !== 4) list.push(e);
})

onMounted(() => {
  getListPage(page.value, pageSize.value);
})
//获取分页数据
let tableData: InsertSwiperParams[] = [];
const total = ref(0);
const page = ref(1);
const pageSize = ref(13);

function getListPage(page, pageSize) {
  api.swiper.listPageSwiper(page, pageSize).then((rs: any) => {
    tableData = rs.data.records;
    total.value = rs.data.total;
  })
}

//多选
const multipleSelection = ref<InsertSwiperParams[]>()
let isSelection = ref(false);
const handleSelectionChange = (val: InsertSwiperParams[]) => {
  isSelection.value = true;
  multipleSelection.value = val
}
//打开编辑对话框
const dialogEdit = ref(false)
let formEdit: InsertSwiperParams = reactive({})
const handleEdit = (index: number, row: InsertSwiperParams) => {
  dialogEdit.value = true;
  formEdit = row;
}
//单个删除
const handleDelete = (index: number, row: InsertSwiperParams) => {
  const rowValue: DeleteSwiperParams = {id: 0};
  rowValue.id = JSON.parse(JSON.stringify(row)).swiperId;
  api.swiper.deleteSwiper(rowValue).then((rs: any) => {
    ElMessage({
      message: rs.message,
      grouping: true,
      type: rs.success ? 'success' : 'error',
    })
    getListPage(page.value, pageSize.value);
  })
}
//搜索
const searchValue = ref({}<DeleteSwiperParams>);

function search() {
  api.swiper.selectSwiper(searchValue.value).then((rs: any) => {
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
let formSave: InsertSwiperParams = reactive({})
const empty: InsertSwiperParams = reactive({})

function save() {
  const form = JSON.parse(JSON.stringify(formSave));
  api.swiper.insertSwiper(form).then((rs: any) => {
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
  api.swiper.updateSwiper(formEdit).then((rs: any) => {
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
    api.swiper.deleteSwiper({id: selection[i].swiperId}).then((rs: any) => {
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
    api.swiper.importExcelSwiper(formData).then((rs: any) => {
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
  api.swiper.exportExcelSwiper().then((rs: any) => {
    const link = document.createElement('a')
    //定义文件名
    const fileName = "轮播图表.xlsx";  //后面必须加.xlsx，否则文件导出打开会提示文损坏之类的....
    // const fileName = '自定义命名的表格名' + new Date().getTime()+'.xlsx';  //返回时间戳
    //  blob(size,type) Blob构造函数，接受两个参数。第一个参数是一个包含实际数据的数组，第二个参数是数据的类型(注：有的需要res.data看后台返回的实际数据参数了)
    let blob = new Blob([rs], {type: 'application/vnd.ms-excel'})
    //如果您设置 display:none，将隐藏整个元素，如果您设置 visibility:hidden，元素的内容将不可见，但元素保持原来的位置和大小。
    link.style.display = 'none'
    //URL.createObjectURL() 静态方法会创建一个 DOMString，其中包含一个表示参数中给出的对象的URL。这个 URL 的生命周期和创建它的窗口中的 document 绑定。这个新的URL 对象表示指定的 File 对象或 Blob 对象。该URL可用于指定源 object(blob)的内容。
    link.href = URL.createObjectURL(blob)
    //download="filename" 属性规定被下载的超链接目标。filename规定作为文件名来使用的文本。
    link.download = fileName //下载的文件名
    //link(a)是一个dom元素（一个标签），向body中插入了一个dom(a)元素。
    document.body.appendChild(link)
    //创建一个a链接 使用a.click()模拟点击
    link.click()
    //removeChild() 方法指定元素的某个指定的子节点。以 Node 对象返回被删除的节点，如果节点不存在则返回 null。
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