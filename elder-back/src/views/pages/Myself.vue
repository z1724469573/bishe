<template>
  <el-row justify="center">
    <el-col :span="10">
      <el-card>
        <el-row justify="end">
          <el-button type="primary" @click="passOpen">修改密码</el-button>
        </el-row>
        <el-row justify="center" style="margin-top: 20px;">
          <el-upload
              ref="myselfUploadRef"
              class="avatar-uploader"
              :show-file-list="false"
              :limit="1"
              :on-change="myselfUpload"
              :on-exceed="myselfExceed"
              :auto-upload="false"
          >
            <img v-if="imageSrc" :src="imageSrc" class="avatar" alt=" "/>
            <el-icon v-else class="avatar-uploader-icon">
              <Plus/>
            </el-icon>
          </el-upload>
        </el-row>
        <el-row justify="center" style="margin-top: 20px;">
          <el-form
              ref="myselfRef"
              :model="myselfForm"
              label-width="80px"
              style="padding-right: 60px;width: 100%;"
          >
            <el-form-item label="账号" prop="acc" :rules="[{ required: true, message: '请输入账号' }]">
              <el-input v-model="myselfForm.acc" disabled type="text" placeholder="请输入账号"/>
            </el-form-item>
            <el-form-item label="密码" prop="pwd" :rules="[{ required: true, message: '请输入密码' }]">
              <el-input v-model="myselfForm.pwd" disabled type="password" placeholder="请输入密码"/>
            </el-form-item>
            <el-form-item label="姓名" prop="name" :rules="[{ required: true, message: '请输入姓名' }]">
              <el-input v-model="myselfForm.name" type="text" placeholder="请输入姓名"/>
            </el-form-item>
            <el-form-item label="性别" prop="sex" :rules="[{ required: false, message: '请输入性别' }]">
              <el-select v-model="myselfForm.sex" placeholder="请选择性别">
                <el-option v-for="item in sexList" :key="item.value" :label="item.label" :value="item.value"/>
              </el-select>
            </el-form-item>
            <el-form-item label="年龄" prop="age" :rules="[{ required: false, message: '请输入年龄' }]">
              <el-input v-model="myselfForm.age" type="number" placeholder="请输入性别"/>
            </el-form-item>
            <el-form-item label="电话" prop="phone" :rules="[{ required: true, message: '请输入电话' }]">
              <el-input v-model="myselfForm.phone" type="text" placeholder="请输入电话"/>
            </el-form-item>
            <el-form-item label="地址" prop="address" :rules="[{ required: false, message: '请输入地址' }]">
              <el-input v-model="myselfForm.address" type="text" placeholder="请输入地址"/>
            </el-form-item>
            <el-row justify="center" style="padding-right: 30px;">
              <el-form-item>
                <el-button size="large" @click="resetMyself(myselfRef)">重置</el-button>
                <el-button size="large" type="primary" @click="submitMyself(myselfRef)">保存</el-button>
              </el-form-item>
            </el-row>
          </el-form>
        </el-row>
      </el-card>
    </el-col>
  </el-row>

  <el-dialog v-model="passDialog" title="修改密码" width="500" :close-on-click-modal="false"
             style="padding-right: 60px;"
  >
    <el-form
        ref="passRef"
        :model="passForm"
        label-width="80px"
    >
      <el-form-item label="原密码" prop="oldPwd" :rules="[{ required: true, message: '请输入原密码' }]">
        <el-input placeholder="请输入原密码" type="password" v-model="passForm.oldPwd"/>
      </el-form-item>
      <el-form-item label="新密码" prop="newPwd" :rules="[{ required: true, message: '请输入新密码' }]">
        <el-input placeholder="请输入新密码" type="password" v-model="passForm.newPwd"/>
      </el-form-item>
      <el-form-item label="确认密码" prop="rePwd" :rules="[{ required: true, message: '请确认密码' }]">
        <el-input placeholder="请确认密码" type="password" v-model="passForm.rePwd"/>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button size="large" @click="passReset(passRef)">取消</el-button>
        <el-button size="large" type="primary" @click="passSubmit(passRef)">
          确认
        </el-button>
      </div>
    </template>
  </el-dialog>
</template>

<script setup lang="ts">
import {onMounted, reactive, ref} from 'vue'
import type {FormInstance, UploadInstance, UploadProps, UploadRawFile} from 'element-plus'
import {ElMessage, genFileId} from 'element-plus'
import {Plus} from '@element-plus/icons-vue'
import api from "@/api";
import router from "@/router";

onMounted(() => {
  if (localStorage.getItem("manager")) {
    myselfForm.value = JSON.parse(localStorage.getItem("manager"));
    imageSrc.value = myselfForm.value.pic;
  }
})
const imageSrc = ref("");
const myselfRef = ref<FormInstance>()
const myselfForm = ref({
  id: "",
  pic: "",
  acc: "",
  pwd: "",
  name: "",
  sex: "",
  age: null,
  phone: "",
  address: "",
})

const submitMyself = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      api.user.userEditor(myselfForm.value).then((res) => {
        ElMessage({message: res.message, type: res.success ? 'success' : 'error', grouping: true, showClose: true});
        localStorage.setItem("user", JSON.stringify(res.data));
      })
    } else {
    }
  })
}

const resetMyself = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  if (localStorage.getItem("user")) {
    myselfForm.value = JSON.parse(localStorage.getItem("user"));
  }
  // formEl.resetFields();
}

const myselfUploadRef = ref<UploadInstance>();
const myselfUpload = (e) => {
  const file = new FormData();
  file.append('file', e.raw);
  api.common.upload(file).then((res) => {
    typeof res === "string" ? myselfForm.value.pic = res : "";
    typeof res === "string" ? imageSrc.value = res : "";
  })
}
const myselfExceed: UploadProps['onExceed'] = (files) => {
  myselfUploadRef.value!.clearFiles()
  const file = files[0] as UploadRawFile
  file.uid = genFileId()
  myselfUploadRef.value!.handleStart(file)
}

const passDialog = ref(false);
const passRef = ref<FormInstance>()
const passForm = reactive({
  id: '',
  oldPwd: '',
  newPwd: '',
  rePwd: '',
})

const passOpen = () => {
  passDialog.value = true;
  passForm.id = myselfForm.value.id;
}

const passSubmit = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      if (passForm.newPwd !== passForm.rePwd) {
        ElMessage({message: '两次密码不一致', type: 'error', grouping: true, showClose: true});
        return;
      }
      api.user.userChange(passForm.id, passForm.oldPwd, passForm.newPwd).then((res) => {
        if (res.success) {
          router.push('/');
        }
        ElMessage({message: res.message, type: res.success ? 'success' : 'error', grouping: true, showClose: true});
      })
    } else {
    }
  })
}

const passReset = (formEl: FormInstance | undefined) => {
  passDialog.value = false;
  if (!formEl) return
  formEl.resetFields()
}

const statusList = [{label: '正常', value: 1}, {label: '禁用', value: 0}];
const sexList = [{label: '男', value: '男'}, {label: '女', value: '女'}];

</script>

<style scoped>
.avatar-uploader .avatar {
  width: 150px;
  height: 150px;
  display: block;
}

:deep(.el-upload) {
  border: 1px dashed var(--el-border-color);
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
}

.avatar-uploader .el-upload:hover {
  border-color: var(--el-color-primary);
}

.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 150px;
  height: 150px;
  text-align: center;
}
</style>
