<template>
  <RouterView/>
</template>
<script setup lang="ts">
import {RouterView} from 'vue-router'
</script>

<style>
.el-main,
.el-footer,
.el-header {
  padding: 0 !important;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html,
body {
  width: 100vw;
  height: 100vh;
  overflow-y: scroll;
}

img {
  width: 100%;
  height: 100%;
}

a {
  text-decoration: none;
  font-style: normal;
}

</style>
