<template>
  <el-row justify="center">
    <el-col :span="10">
      <el-card>
        <el-row justify="end">
          <el-button type="primary" @click="dialogVisible = true">修改密码</el-button>
        </el-row>
        <el-row justify="center" style="margin-top: 20px;">
          <el-upload
              class="avatar-uploader"
              action="https://run.mocky.io/v3/9d059bf9-4660-45f2-925d-ce80ad6c4d15"
              :show-file-list="false"
              :on-success="handleAvatarSuccess"
              :before-upload="beforeAvatarUpload"
          >
            <img v-if="imageUrl" :src="imageUrl" class="avatar"/>
            <el-icon v-else class="avatar-uploader-icon">
              <Plus/>
            </el-icon>
          </el-upload>
        </el-row>
        <el-row justify="center" style="margin-top: 20px;">
          <el-form
              ref="formRef"
              :model="numberValidateForm"
              label-width="80px"
              style="padding-right: 60px;width: 100%;"
          >
            <el-form-item label="age" prop="age" :rules="[{ required: true, message: 'age is required' }]">
              <el-input
                  v-model.number="numberValidateForm.age"
                  type="text"
                  autocomplete="off"
              />
            </el-form-item>
            <el-row justify="center" style="padding-right: 30px;">
              <el-form-item>
                <el-button size="large" @click="resetForm(formRef)">重置</el-button>
                <el-button size="large" type="primary" @click="submitForm(formRef)">保存</el-button>
              </el-form-item>
            </el-row>
          </el-form>
        </el-row>
      </el-card>
    </el-col>
  </el-row>

  <el-dialog
      v-model="dialogVisible"
      title="修改密码"
      width="500"
      :close-on-click-modal="false"
  >
    <span>This is a message</span>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="dialogVisible = false">
          确认
        </el-button>
      </div>
    </template>
  </el-dialog>
</template>

<script setup lang="ts">
import {reactive, ref} from 'vue'
import type {FormInstance, UploadProps} from 'element-plus'
import {ElMessage} from 'element-plus'
import {Plus} from '@element-plus/icons-vue'

const imageUrl = ref('')

const handleAvatarSuccess: UploadProps['onSuccess'] = (
    response,
    uploadFile
) => {
  imageUrl.value = URL.createObjectURL(uploadFile.raw!)
}

const beforeAvatarUpload: UploadProps['beforeUpload'] = (rawFile) => {
  if (rawFile.type !== 'image/jpeg') {
    ElMessage.error('Avatar picture must be JPG format!')
    return false
  } else if (rawFile.size / 1024 / 1024 > 2) {
    ElMessage.error('Avatar picture size can not exceed 2MB!')
    return false
  }
  return true
}


const formRef = ref<FormInstance>()
const numberValidateForm = reactive({
  age: '',
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

const dialogVisible = ref(false);

const user = ref({
  acc: "",
  pwd: "",
  name: "",
  sex: "",
  age: 0,
  phone: "",
  address: "",
})


</script>

<style scoped>
.avatar-uploader .avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>

<style>
.avatar-uploader .el-upload {
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
  width: 178px;
  height: 178px;
  text-align: center;
}

</style>
