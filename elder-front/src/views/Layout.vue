<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        <el-row justify="space-between" align="middle">
          <el-col :span="6"></el-col>
          <el-col :span="14">
            <el-menu
                :default-active="activeIndex"
                class="el-menu-demo"
                mode="horizontal"
                background-color="#fff"
                text-color="#333"
                active-text-color="#111"
                @select="handleSelect"
            >
              <el-menu-item index="1">Processing Center</el-menu-item>
              <el-sub-menu index="2">
                <template #title>Workspace</template>
                <el-menu-item index="2-1">item one</el-menu-item>
                <el-menu-item index="2-2">item two</el-menu-item>
                <el-menu-item index="2-3">item three</el-menu-item>
                <el-sub-menu index="2-4">
                  <template #title>item four</template>
                  <el-menu-item index="2-4-1">item one</el-menu-item>
                  <el-menu-item index="2-4-2">item two</el-menu-item>
                  <el-menu-item index="2-4-3">item three</el-menu-item>
                </el-sub-menu>
              </el-sub-menu>
              <el-menu-item index="3" disabled>Info</el-menu-item>
              <el-menu-item index="4">Orders</el-menu-item>
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
        <el-row>
          <el-col :span="24">
            社区养老系统 客服电话 010-55779988
            CopyRight
          </el-col>
        </el-row>
      </el-footer>
    </el-container>
  </div>
</template>

<script setup lang="ts">
import {ref} from 'vue'
import {ArrowDown} from '@element-plus/icons-vue'
import {RouterView} from 'vue-router';

const activeIndex = ref('1')
const handleSelect = (key: string, keyPath: string[]) => {
  console.log(key, keyPath)
}

</script>

<style scoped>
.avatar {
  width: 40px;
  height: 40px;
  margin-right: 5px;
}

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