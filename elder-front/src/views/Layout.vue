<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-row justify="space-between" align="middle">
          <el-col :span="6"></el-col>
          <el-col :span="14">
            <el-menu
                :default-active="activeIndex"
                mode="horizontal"
                background-color="#fff"
                text-color="#666"
                active-text-color="#111"
                @select="handleSelect"
                router
            >
              <el-menu-item v-for="(item,index) in routes[1].children" :index="item.path" style="font-size: 16px;">
                <b>{{ item.name }}</b>
              </el-menu-item>
            </el-menu>
          </el-col>
          <el-col :span="3">
            <el-row align="middle">
              <el-col :span="6">
                <el-avatar shape="square"
                           src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"
                />
              </el-col>
              <el-col :span="18">
                <el-dropdown>
              <span>
                Dropdown List
                <el-icon>
                  <arrow-down/>
                </el-icon>
              </span>
                  <template #dropdown>
                    <el-dropdown-menu>
                      <el-dropdown-item>Action 1</el-dropdown-item>
                      <el-dropdown-item>Action 2</el-dropdown-item>
                      <el-dropdown-item>Action 3</el-dropdown-item>
                      <el-dropdown-item disabled>Action 4</el-dropdown-item>
                      <el-dropdown-item divided>Action 5</el-dropdown-item>
                    </el-dropdown-menu>
                  </template>
                </el-dropdown>
              </el-col>
            </el-row>
          </el-col>
        </el-row>
      </el-header>
      <el-main>
        <RouterView/>
      </el-main>
      <el-footer>
        <div style="display: flex;align-items: center;justify-content: center;flex-direction: column;font-size: 14px;">
          <p style="margin: 10px 0;">社区养老系统 客服电话 010-55669988</p>
          <p>CopyRight© 2001-2023 Bestwishes0203版权所有</p>
        </div>
      </el-footer>
    </el-container>
  </div>
</template>

<script setup lang="ts">
import {onMounted, ref} from 'vue'
import {ArrowDown} from '@element-plus/icons-vue'
import {RouterView} from 'vue-router';
import {routes} from "@/router";

onMounted(() => {
  if (localStorage.getItem("activeIndex")) {
    activeIndex.value = localStorage.getItem("activeIndex");
  }
})

const activeIndex = ref('')
const handleSelect = (key: string, keyPath: string[]) => {
  localStorage.setItem("activeIndex", key);
}

</script>

<style scoped>
.el-menu {
  border-bottom: none;
}

.el-header {
  border-bottom: 1px solid #ccc;
  height: 61px;
  padding: 0;
}

:deep(.el-tooltip__trigger:focus-visible) {
  outline: unset;
}

svg {
  width: 18px !important;
  height: 18px !important;
  margin-right: 5px !important;
}

</style>