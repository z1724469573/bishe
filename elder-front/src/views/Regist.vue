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
            <el-image style="width: 100%; height: 500px" :src="regist" fit="contain"/>
          </el-col>
        </el-row>
      </el-col>
      <el-col :span="12">
        <el-row align="middle" justify="center" style="width: 100%;height: calc(100vh - 80px);">
          <el-col :span="18">
            <el-card>
              <template #header>
                <div class="card-header">
                  <div style="width: 100%;text-align: center;">
                    <b style="font-size: 26px;color: #0753a2;">用户注册</b>
                  </div>
                </div>
              </template>
              <el-form
                  ref="formRef"
                  :model="user"
                  label-width="70px"
                  style="padding-right: 70px"
              >
                <el-form-item label="手机号" prop="phone" :rules="[{ required: true, message: '请输入手机号' }]">
                  <el-input size="large" v-model="user.phone" type="text" placeholder="请输入账号/手机号"/>
                </el-form-item>
                <el-form-item label="密码" prop="pwd" :rules="[{ required: true, message: '请输入密码' }]">
                  <el-input size="large" v-model="user.pwd" type="text" placeholder="请输入密码"/>
                </el-form-item>
                <el-form-item label="姓名" prop="name" :rules="[{ required: true, message: '请输入姓名' }]">
                  <el-input size="large" v-model="user.name" type="text" placeholder="请输入姓名"/>
                </el-form-item>
                <el-form-item label="验证码" prop="code" :rules="[{ required: true, message: '请输入验证码' }]">
                  <el-row justify="space-between" style="width: 100%;">
                    <el-col :span="16">
                      <el-input size="large" placeholder="请输入验证码"
                                v-model="user.code"
                                autocomplete="off"
                      />
                    </el-col>
                    <el-col :span="8">
                      <el-image @click="getCode" style="cursor: pointer;width: 100%;height: 40px;"
                                :src="codeSrc"></el-image>
                    </el-col>
                  </el-row>
                </el-form-item>
                <el-form-item label=" ">
                  <el-button size="large" style="width: 100%" type="primary" @click="submitForm(formRef)">
                    注册
                  </el-button>
                </el-form-item>
                <el-form-item label=" ">
                  <el-button size="large" style="width: 100%" @click="resetForm(formRef)">清空</el-button>
                </el-form-item>
              </el-form>
              <template #footer>
                <el-row justify="end" align="middle">
                  <el-col :span="10">
                    <el-link @click="router.push('/')">
                      <el-text tag="a">已有账号？前往登录</el-text>
                    </el-link>
                  </el-col>
                </el-row>
              </template>
            </el-card>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
  </div>
</template>

<script setup lang="ts">
import {onMounted, reactive, ref} from 'vue'
import logo from "@/assets/logo.png"
import api from "@/api";
import router from "@/router"
import type {FormInstance} from 'element-plus'
import regist from "@/assets/swiper/2.952132ef.jpeg"
import {ElMessage} from "element-plus";

onMounted(() => {
  localStorage.setItem("activeIndex", "/home");
  getCode();
})
const codeSrc = ref("");

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

const formRef = ref<FormInstance>()

const user = reactive({
  phone: '',
  pwd: '',
  name: '',
  code: '',
})

const submitForm = (formEl: FormInstance | undefined) => {
  if (!formEl) return
  formEl.validate((valid) => {
    if (valid) {
      api.user.userRegist(user.phone, user.pwd, user.name, user.code).then((res) => {
        if (res.success) {
          resetForm(formEl);
          router.push("/");
        }
        ElMessage({message: res.message, type: res.success ? 'success' : 'error', grouping: true, showClose: true})
      })
    } else {
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