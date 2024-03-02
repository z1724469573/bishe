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
      <el-table-column prop="newsId" label="主键" width="55" align="center"/>
      <el-table-column v-for="item in list" :prop="item.en" :label="item.zh" :width="item.width" align="center"/>

      <el-table-column prop="newsContent" label="内容" align="center">
        <template #default="scope">
          <el-popover effect="light" trigger="hover" placement="top" width="auto">
            <template #default>
              <div>{{ scope.row.newsContent }}</div>
            </template>
            <template #reference>
              <el-button type="primary">查看</el-button>
            </template>
          </el-popover>
        </template>
      </el-table-column>

      <el-table-column prop="newsCover" label="封面" align="center">
        <template #default="scope">
          <el-popover effect="light" trigger="hover" placement="top" width="auto">
            <template #default>
              <div>{{ scope.row.newsCover }}</div>
            </template>
            <template #reference>
              <el-avatar shape="square" :size="50" :src="scope.row.newsCover"/>
            </template>
          </el-popover>
        </template>
      </el-table-column>

      <el-table-column label="状态" width="100">
        <template #default="scope">
          <el-tag type="success" v-if="scope.row.newsState===1">正常</el-tag>
          <el-tag type="danger" v-if="scope.row.newsState===0">禁用</el-tag>
        </template>
      </el-table-column>

      <el-table-column label="操作" align="center" width="150">
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
    <el-dialog v-model="dialogSave" :destroy-on-close="true" @close="closeDialog" title="添加数据" width="90%">
      <el-form :model="formSave">
        <div class="grid col-4">
          <div v-for="item in newsList">
            <el-form-item v-if="item.zh!=='状态'&&item.zh!=='内容'" :label="item.zh">
              <el-input v-model="formSave[item.en]" placeholder="请输入..." clearable/>
            </el-form-item>
          </div>
        </div>
        <el-form-item label="内容">
          <Toolbar
              :editor="editorRef"
              :defaultConfig="toolbarConfig"
              :mode="mode"
              style="border-bottom: 1px solid #ccc;width: 100%;height: 90px"
          />
          <Editor
              :defaultConfig="editorConfig"
              :mode="mode"
              v-model="formSave['newsContent']"
              style="height: 400px;width: 100%; overflow-y: hidden;"
              @onCreated="handleCreated"
              @onChange="handleChange"
              @onDestroyed="handleDestroyed"
              @onFocus="handleFocus"
              @onBlur="handleBlur"
              @customAlert="customAlert"
              @customPaste="customPaste"
          />
        </el-form-item>

        <el-form-item label="状态">
          <el-radio-group v-model="formSave.newsState">
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
    <el-dialog v-model="dialogEdit" :destroy-on-close="true" @close="closeDialog" title="编辑数据" width="90%">
      <el-form :model="formEdit">
        <div class="grid col-4">
          <div v-for="(item,index) in newsList">
            <el-form-item v-if="item.zh!=='主键'&&item.zh!=='内容'&&item.zh!=='状态'" :label="item.zh">
              <el-input style="width: 90%" v-model="formEdit[item.en]" placeholder="请输入..." clearable/>
            </el-form-item>
          </div>
        </div>
        <el-form-item label="内容">
          <Toolbar
              :editor="editorRef"
              :defaultConfig="toolbarConfig"
              :mode="mode"
              style="border-bottom: 1px solid #ccc;width: 100%;height: 90px;"
          />
          <Editor
              :defaultConfig="editorConfig"
              :mode="mode"
              v-model="formEdit['newsContent']"
              style="height: 400px;width: 100%; overflow-y: hidden;"
              @onCreated="handleCreated"
              @onChange="handleChange"
              @onDestroyed="handleDestroyed"
              @onFocus="handleFocus"
              @onBlur="handleBlur"
              @customAlert="customAlert"
              @customPaste="customPaste"
          />
        </el-form-item>
        <el-form-item label="状态">
          <el-radio-group v-model="formEdit.newsState">
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
            :on-remove="uploadRemove"
            :on-change="uploadChange"
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
import {reactive, onBeforeUnmount, ref, shallowRef, onMounted} from "vue";
import api from "@/api";
import type {UploadProps} from 'element-plus'
import {ElMessage, ElTable, UploadFile, UploadFiles} from "element-plus";
import {DeleteNewsParams, InsertNewsParams} from "@/api/news";
import {UploadFilled} from '@element-plus/icons-vue'
import '@wangeditor/editor/dist/css/style.css';
import {Editor, Toolbar} from '@wangeditor/editor-for-vue';

const newsList = [
  {zh: '标题', width: 0, en: 'newsTitle'},
  {zh: '类别', width: 0, en: 'newsType'},
  {zh: '日期', width: 0, en: 'newsDate'},
  {zh: '封面', width: 0, en: 'newsCover'},
  {zh: '标签', width: 0, en: 'newsTag'},
  {zh: '阅读', width: 0, en: 'newsRead'},
  {zh: '主键', width: 0, en: 'newsId'},
  {zh: '内容', width: 0, en: 'newsContent'},
  {zh: '状态', width: 0, en: 'newsState'},
]

let list = [];
newsList.filter((e, i) => {
  if (e.en !== 'newsCover' && e.en !== 'newsState' && e.en !== 'newsContent' && e.en !== 'newsId') list.push(e);
})

onMounted(() => {
  getListPage(page.value, pageSize.value);
})
//获取分页数据
let tableData: InsertNewsParams[] = [];
const total = ref(0);
const page = ref(1);
const pageSize = ref(13);

function getListPage(page, pageSize) {
  api.news.listPageNews(page, pageSize).then((rs: any) => {
    tableData = rs.data.records;
    total.value = rs.data.total;
  })
}

//多选
const multipleSelection = ref<InsertNewsParams[]>()
let isSelection = ref(false);
const handleSelectionChange = (val: InsertNewsParams[]) => {
  isSelection.value = true;
  multipleSelection.value = val
}
//打开编辑对话框
const dialogEdit = ref(false)
let formEdit: InsertNewsParams = reactive({})
const handleEdit = (index: number, row: InsertNewsParams) => {
  dialogEdit.value = true;
  formEdit = row;
}
//单个删除
const handleDelete = (index: number, row: InsertNewsParams) => {
  const rowValue: DeleteNewsParams = {id: 0};
  rowValue.id = JSON.parse(JSON.stringify(row)).newsId;
  api.news.deleteNews(rowValue).then((rs: any) => {
    ElMessage({
      message: rs.message,
      grouping: true,
      type: rs.success ? 'success' : 'error',
    })
    getListPage(page.value, pageSize.value);
  })
}
//搜索
const searchValue = ref({}<DeleteNewsParams>);

function search() {
  api.news.selectNews(searchValue.value).then((rs: any) => {
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
let formSave: InsertNewsParams = reactive({})
const empty: InsertNewsParams = reactive({})

function save() {
  const form = JSON.parse(JSON.stringify(formSave));
  api.news.insertNews(form).then((rs: any) => {
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
  api.news.updateNews(formEdit).then((rs: any) => {
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
    api.news.deleteNews({id: selection[i].newsId}).then((rs: any) => {
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

const uploadChange: UploadProps['onChange'] = (file: UploadFile, uploadFiles: UploadFiles) => {
  fileList.value = [...(fileList.value || []), file.raw];
  return false;
}

const uploadRemove: UploadProps['onRemove'] = (file: UploadFile, uploadFiles: UploadFiles) => {
  const index = fileList.value.indexOf(file);
  const newFileList = fileList.value.slice();
  newFileList.splice(index, 1);
  fileList.value = newFileList;
}

function impact() {
  fileList.value.forEach((file: UploadProps["fileList"]) => {
    const formData = new FormData();
    formData.append("file", file.raw as any);
    api.news.importExcelNews(formData).then((rs: any) => {
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
  api.news.exportExcelNews().then((rs: any) => {
    const link = document.createElement('a')
    const fileName = "新闻表.xlsx";
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

//关闭对话框回调
function closeDialog(e) {
}

//编辑器配置
const mode = 'default';
// 编辑器实例，必须用 shallowRef，重要！
const editorRef = shallowRef();
// 内容 HTML
const toolbarConfig = {};
const editorConfig = {placeholder: '请输入内容...'};
// 组件销毁时，也及时销毁编辑器，重要！
onBeforeUnmount(() => {
  const editor = editorRef.value;
  if (editor == null) return;
  editor.destroy();
});

// 编辑器回调函数
const handleCreated = (editor) => {
  console.log('created', editor);
  editorRef.value = editor; // 记录 editor 实例，重要！
};
const handleChange = (editor) => {
  console.log('change:', editor.getHtml());
};
const handleDestroyed = (editor) => {
  console.log('destroyed', editor);
};
const handleFocus = (editor) => {
  console.log('focus', editor);
};
const handleBlur = (editor) => {
  console.log('blur', editor);
};
const customAlert = (info, type) => {
  alert(`【自定义提示】${type} - ${info}`);
};
const customPaste = (editor, event, callback) => {
  console.log('ClipboardEvent 粘贴事件对象', event);
  // 自定义插入内容
  // editor.insertText('xxx');
  // 返回值（注意，vue 事件的返回值，不能用 return）
  // callback(false); // 返回 false ，阻止默认粘贴行为
  callback(true) // 返回 true ，继续默认的粘贴行为
};
</script>

<style scoped>
:deep(.el-divider) {
  margin: 10px 0 !important;
}
</style>