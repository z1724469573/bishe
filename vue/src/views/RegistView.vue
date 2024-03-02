<template>
  <div>
    <div class="w-fill h-10vh bg-white p-lr-150 flex justify-start align-center">
      <img class="w-40px h-40px" src="@/assets/logo.png" alt="logo">
      <div class="text-blue text-bold-6 text-25 p-lr-10">乐融融智慧平台</div>
    </div>
    <div class="w-fill h-90vh bg-f1  flex align-center justify-center">
      <img class="w-40vw h-40vh" src="http://43.142.9.86/img/login.4b369e29.png" alt="logo">
      <div class="w-25vw h-50vh bg-white shadow radius-8 m-l-100 p-40">
        <div class="text-25 text-blue text-bold-6 text-center p-b-20 p-t-10">欢迎注册</div>
        <el-form
            ref="ruleFormRef"
            :model="ruleForm"
            status-icon
            :rules="rules"
            label-width="0"
            class="demo-ruleForm"
        >
          <el-form-item label="" prop="userAcc">
            <el-input v-model.number="ruleForm.userAcc" placeholder="请输入账号"/>
          </el-form-item>
          <el-form-item label="" prop="userPwd">
            <el-input v-model="ruleForm.userPwd" type="userPwdword" placeholder="请输入密码" autocomplete="off"/>
          </el-form-item>
          <el-form-item label="" prop="checkuserPwd">
            <el-input v-model="ruleForm.checkuserPwd" type="userPwdword" placeholder="请确认密码" autocomplete="off"/>
          </el-form-item>
          <el-form-item>
            <el-button class="w-fill bg-blue border-none" type="primary" @click="submitForm(ruleFormRef)">
              注册
            </el-button>
          </el-form-item>
          <el-form-item>
            <div class="w-fill flex align-center justify-end">
              <div @click="$router.push('/')">已有账号？请 <a class="text-blue cursor">登录</a></div>
            </div>
          </el-form-item>
        </el-form>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import {reactive, ref} from 'vue'
import type {FormInstance, FormRules} from 'element-plus'
import api from "@/api";
import {ElMessage} from "element-plus";
import router from "@/router";

const ruleFormRef = ref<FormInstance>()

const checkuserAcc = (rule: any, value: any, callback: any) => {
  if (!value) {
    return callback(new Error('请输入账号'))
  }
  callback()
}

const validateuserPwd = (rule: any, value: any, callback: any) => {
  if (value === '') {
    callback(new Error('请输入密码'))
  } else {
    callback()
  }
}

const validateuserPwd2 = (rule: any, value: any, callback: any) => {
  if (value === '') {
    callback(new Error('请确认密码'))
  } else if (value !== ruleForm.userPwd) {
    callback(new Error("两次密码不一致!"))
  } else {
    callback()
  }
}

const ruleForm = reactive({
  userAcc: '',
  userPwd: '',
  userIde: '',
  checkuserPwd: '',
})

const rules = reactive<FormRules<typeof ruleForm>>({
  userAcc: [{validator: checkuserAcc, trigger: 'blur'}],
  userPwd: [{validator: validateuserPwd, trigger: 'blur'}],
  checkuserPwd: [{validator: validateuserPwd2, trigger: 'blur'}],
})

const submitForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      api.common.regist(ruleForm).then((rs: any) => {
        ElMessage({
          message: rs.message,
          grouping: true,
          type: rs.success ? 'success' : 'error',
        })
        setTimeout(() => {
          router.push(rs.success ? "/" : '/regist');
        }, 1000);
      })
    } else {
      return false
    }
  })
}

</script>

<style scoped>
.text-blue {
  color: #3d6093;
}

.bg-blue {
  background-color: #3d6093;
}
</style>