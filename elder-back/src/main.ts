import {createApp} from 'vue'
import {createPinia} from 'pinia'

import App from './App.vue'
import router from './router'

const app = createApp(App)

import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import 'dayjs/locale/zh-cn'
import zhCn from 'element-plus/dist/locale/zh-cn.mjs'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
import "echarts"
import ECharts from 'vue-echarts'

for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
}

import VueMarkdownEditor from '@kangc/v-md-editor';
import '@kangc/v-md-editor/lib/style/base-editor.css';
import vuepressTheme from '@kangc/v-md-editor/lib/theme/vuepress.js';
import '@kangc/v-md-editor/lib/theme/style/vuepress.css';
import Prism from 'prismjs';

VueMarkdownEditor.use(vuepressTheme, {
    Prism,
});

import VueUeditorWrap from 'vue-ueditor-wrap';

//@ts-ignore
app.use(ElementPlus, {locale: zhCn, size: "default", zIndex: 3000});
app.use(VueMarkdownEditor);
app.use(VueUeditorWrap);
app.use(createPinia());
app.use(router);
app.component('v-chart', ECharts);
app.mount('#app');


