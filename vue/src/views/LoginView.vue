<template>
  <div>
    <div class="w-fill h-10vh bg-white p-lr-150 flex justify-start align-center">
      <img class="w-40px h-40px" src="@/assets/logo.png" alt="logo">
      <div class="text-blue text-bold-6 text-25 p-lr-10">乐融融智慧平台</div>
    </div>
    <div class="w-fill h-90vh bg-f1  flex align-center justify-center">
      <img class="w-40vw h-40vh" src="http://43.142.9.86/img/login.4b369e29.png" alt="logo">
      <div class="w-25vw h-50vh bg-white shadow radius-8 m-l-100 p-40">
        <div class="text-25 text-blue text-bold-6 text-center p-b-20 p-t-10">欢迎使用</div>
        <el-form
            ref="ruleFormRef"
            :model="ruleForm"
            status-icon
            :rules="rules"
            label-width="0"
            class="demo-ruleForm"
        >
          <el-form-item label="" prop="userAcc">
            <el-input v-model.number="ruleForm.userAcc" placeholder="账号"/>
          </el-form-item>
          <el-form-item label="" prop="userPwd">
            <el-input v-model="ruleForm.userPwd" type="userPwdword" placeholder="密码" autocomplete="off"/>
          </el-form-item>
          <el-form-item label="" prop="code">
            <div class="flex align-center justify-between">
              <el-input v-model="ruleForm.code" type="text" placeholder="验证码"/>
              <img @click="getCode" class="w-25 radius-5 h-fill cursor" :src="codeSrc" alt="">
            </div>
          </el-form-item>
          <el-form-item label="" prop="">
            <el-select
                v-model="ruleForm.userIde"
                placeholder="普通用户"
            >
              <el-option
                  v-for="(item,index) in options"
                  :key="item.value"
                  :label="item.value"
                  :value="item.value"
                  @click="setUserIde(item.value)"
              />
            </el-select>
          </el-form-item>
          <el-form-item>
            <el-button class="w-fill bg-blue border-none" type="primary" @click="submitForm(ruleFormRef)">
              登录
            </el-button>
          </el-form-item>
          <el-form-item>
            <div class="w-fill flex align-center justify-end">
              <div @click="$router.push('/regist')">还没有账号？请 <a class="text-blue cursor">注册</a></div>
            </div>
          </el-form-item>
        </el-form>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import {computed, reactive, ref, onMounted} from 'vue'
import type {FormInstance, FormRules} from 'element-plus'
import router from "@/router";
import {setRoutes} from "@/router";
import api from "@/api";
import {ElMessage} from "element-plus";

onMounted(() => {
  localStorage.setItem('user_ide', '普通用户');
  setRoutes();
  getCode();
})
const codeSrc = ref('');

function getCode() {
  api.common.generateImageCode().then((res: any) => {
    const bufferUrl = btoa(
        new Uint8Array(res).reduce(
            (data, byte) => data + String.fromCharCode(byte),
            ""
        )
    );
    codeSrc.value = "data:image/png;base64," + bufferUrl;
  });
}

const ruleFormRef = ref<FormInstance>()

const checkuserAcc = (rule: any, value: any, callback: any) => {
  if (!value) return callback(new Error('请输入账号'))
  callback()
}
const validateuserPwd = (rule: any, value: any, callback: any) => {
  if (value === '') callback(new Error('请输入密码'))
  callback()
}
const checkcode = (rule: any, value: any, callback: any) => {
  if (!value) return callback(new Error('请输入验证码'))
  callback()
}

const ruleForm = reactive({
  userPwd: '',
  userAcc: '',
  code: '',
  userIde: '普通用户'
})

const rules = reactive<FormRules<typeof ruleForm>>({
  userAcc: [{validator: checkuserAcc, trigger: 'blur'}],
  userPwd: [{validator: validateuserPwd, trigger: 'blur'}],
  code: [{validator: checkcode, trigger: 'blur'}],
})

const submitForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      api.common.login(ruleForm).then((rs: any) => {
        router.push(rs.success ? '/home' : '/');
        localStorage.setItem('user', ruleForm.userAcc);
        ElMessage({
          message: rs.message,
          grouping: true,
          type: rs.success ? 'success' : 'error',
        })
        getCode();
      })
    } else {
      console.log(localStorage.getItem('user_ide'))
      return false
    }
  })
}

const options = [{
  value: '普通用户',
}, {
  value: '管理员',
}, {
  value: '超级管理员',
}]

function setUserIde(item: any) {
  ruleForm.userIde = item;
  localStorage.setItem('user_ide', item);
  setRoutes();
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