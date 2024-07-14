<template>
  <div style="width: 100vw;height: 100vh;background-color:#f2f3f4;">
    <el-row>
      <el-col :span="24">
        <div style="width: 100%;height: 80px;background-color:#fff;">
          <el-row :gutter="20" style="width: 40%;height: 80px;" align="middle" justify="center">
            <el-col :span="4">
              <el-image style="width: 100%; height: 50px;" :src="logo" fit="contain"/>
            </el-col>
            <el-col :span="10">
              <b style="font-size: 24px;color: #0753a2;">社区养老系统</b>
            </el-col>
          </el-row>
        </div>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="12">
        <el-row align="middle" justify="center" style="width: 100%;height: calc(100vh - 80px);">
          <el-col :span="20">
            <el-image style="width: 100%; height: 500px" :src="login" fit="contain"/>
          </el-col>
        </el-row>
      </el-col>
      <el-col :span="12">
        <el-row align="middle" justify="center" style="width: 100%;height: calc(100vh - 80px);">
          <el-col :span="14">
            <el-card>
              <template #header>
                <div class="card-header">
                  <div style="width: 100%;text-align: center;">
                    <b style="font-size: 26px;color: #0753a2;">用户登录</b>
                  </div>
                </div>
              </template>
              <template #footer>
                <el-row justify="end" align="middle">
                  <el-col :span="10">
                    <div style="font-size: 14px;">
                      还没有账号？前往
                      <em style="font-style: normal;color: #0753a2;cursor: pointer;">注册</em>
                    </div>
                  </el-col>
                </el-row>
              </template>
              <el-form
                  style="padding-right: 60px"
                  ref="ruleFormRef"
                  :model="ruleForm"
                  status-icon
                  :rules="rules"
                  label-width="60px"
              >
                <el-form-item label="账号" prop="acc">
                  <el-input placeholder="请输入账号" size="large" v-model="ruleForm.acc"/>
                </el-form-item>
                <el-form-item label="密码" prop="pwd">
                  <el-input placeholder="请输入密码" size="large" v-model="ruleForm.pwd" type="password" autocomplete="off"/>
                </el-form-item>
                <el-form-item label="验证码" prop="code">
                  <el-row justify="space-between">
                    <el-col :span="12">
                      <el-input size="large" placeholder="请输入验证码"
                                v-model="ruleForm.code"
                                autocomplete="off"
                      />
                    </el-col>
                    <el-col :span="12">
                      <el-image @click="getCode" style="cursor: pointer;width: 100%;height: 40px;"
                                :src="codeSrc"></el-image>
                    </el-col>
                  </el-row>
                </el-form-item>
                <el-form-item label=" ">
                  <el-button size="large" style="width: 100%" type="primary" @click="submitForm(ruleFormRef)">
                    登录
                  </el-button>
                </el-form-item>
                <el-form-item label=" ">
                  <el-button size="large" style="width: 100%" @click="resetForm(ruleFormRef)">清空</el-button>
                </el-form-item>
              </el-form>
            </el-card>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
  </div>
</template>

<script setup lang="ts">
import {onMounted, reactive, ref} from 'vue'
import type {FormInstance, FormRules} from 'element-plus'
import {ElMessage} from "element-plus";
import logo from "@/assets/logo.png"
import login from "@/assets/login.4b369e29.png"
import router from "@/router";
import api from "@/api";

onMounted(() => {
  localStorage.setItem("activeIndex", "/home");
  getCode();
})

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
const codeSrc = ref("");
const checkAcc = (rule: any, value: any, callback: any) => {
  if (value === '') {
    callback(new Error('请输入账号'))
  }
  callback();
}
const checkPwd = (rule: any, value: any, callback: any) => {
  if (value === '') {
    callback(new Error('请输入密码'))
  }
  callback();
}
const checkCode = (rule: any, value: any, callback: any) => {
  if (value === '') {
    callback(new Error('请输入验证码'))
  }
  callback();
}

const ruleForm = reactive({
  acc: '',
  pwd: '',
  code: '',
})

const rules = reactive<FormRules<typeof ruleForm>>({
  acc: [{validator: checkAcc, trigger: 'blur'}],
  pwd: [{validator: checkPwd, trigger: 'blur'}],
  code: [{validator: checkCode, trigger: 'blur'}],
})

const submitForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  //@ts-ignore
  formEl.validate((valid) => {
    if (valid) {
      ElMessage({message: 'submit', type: 'success', grouping: true, showClose: true})
      console.log('submit!');
      router.push("/home");
    } else {
      console.log('error submit!');
    }
  })
}

const resetForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.resetFields()
}


</script>

<style scoped>

</style>