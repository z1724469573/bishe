import {createRouter, createWebHistory} from 'vue-router'
import {computed} from "vue";

const userIde = computed(() => {
    return localStorage.getItem('user_ide');
})

const root_routes = [{
    path: '/',
    name: '登录',
    component: () => import('../views/LoginView.vue')
}, {
    path: '/regist',
    name: '注册',
    component: () => import('../views/RegistView.vue')
}, {
    path: '/layout',
    name: '首页',
    component: () => import('../views/mana/LayoutView.vue'),
    redirect: '/home',
    children: [{
        path: '/home',
        name: '首页',
        icon: 'FullScreen',
        component: () => import('../views/mana/HomeView.vue')
    }, {
        path: '/user',
        name: '用户',
        icon: 'FullScreen',
        component: () => import('../views/root/UserView.vue')
    }, {
        path: '/elder',
        name: '养老院',
        icon: 'FullScreen',
        component: () => import('../views/mana/ElderView.vue')
    }, {
        path: '/sort',
        name: '资讯分类',
        icon: 'FullScreen',
        component: () => import('../views/mana/SortView.vue')
    }, {
        path: '/message',
        name: '资讯',
        icon: 'FullScreen',
        component: () => import('../views/mana/NewsView.vue')
    }, {
        path: '/review',
        name: '资讯评论',
        icon: 'FullScreen',
        component: () => import('../views/mana/ReviewView.vue')
    }, {
        path: '/serve',
        name: '服务',
        icon: 'FullScreen',
        component: () => import('../views/mana/ServeView.vue')
    }, {
        path: '/order',
        name: '服务预约',
        icon: 'FullScreen',
        component: () => import('../views/mana/OrderView.vue')
    }, {
        path: '/active',
        name: '活动',
        icon: 'FullScreen',
        component: () => import('../views/mana/ActiveView.vue')
    }, {
        path: '/apply',
        name: '活动报名',
        icon: 'FullScreen',
        component: () => import('../views/mana/ApplyView.vue')
    }, {
        path: '/notice',
        name: '公告',
        icon: 'FullScreen',
        component: () => import('../views/mana/NoticeView.vue')
    },]
}]

const mana_routes = [{
    path: '/',
    name: '登录',
    component: () => import('../views/LoginView.vue')
}, {
    path: '/regist',
    name: '注册',
    component: () => import('../views/RegistView.vue')
}, {
    path: '/layout',
    name: '首页',
    component: () => import('../views/mana/LayoutView.vue'),
    redirect: '/home',
    children: [{
        path: '/home',
        name: '首页',
        icon: 'House',
        component: () => import('../views/mana/HomeView.vue')
    }, {
        path: '/elder',
        name: '养老院',
        icon: 'FullScreen',
        component: () => import('../views/mana/ElderView.vue')
    }, {
        path: '/sort',
        name: '资讯分类',
        icon: 'CollectionTag',
        component: () => import('../views/mana/SortView.vue')
    }, {
        path: '/message',
        name: '资讯',
        icon: 'Message',
        component: () => import('../views/mana/NewsView.vue')
    }, {
        path: '/review',
        name: '资讯评论',
        icon: 'ChatLineSquare',
        component: () => import('../views/mana/ReviewView.vue')
    }, {
        path: '/serve',
        name: '服务',
        icon: 'Notification',
        component: () => import('../views/mana/ServeView.vue')
    }, {
        path: '/order',
        name: '服务预约',
        icon: 'Connection',
        component: () => import('../views/mana/OrderView.vue')
    }, {
        path: '/active',
        name: '活动',
        icon: 'Help',
        component: () => import('../views/mana/ActiveView.vue')
    }, {
        path: '/apply',
        name: '活动报名',
        icon: 'Pointer',
        component: () => import('../views/mana/ApplyView.vue')
    }, {
        path: '/notice',
        name: '公告',
        icon: 'MuteNotification',
        component: () => import('../views/mana/NoticeView.vue')
    },]
}]

const user_routes = [{
    path: '/',
    name: '登录',
    component: () => import('../views/LoginView.vue')
}, {
    path: '/regist',
    name: '注册',
    component: () => import('../views/RegistView.vue')
}, {
    path: '/layout',
    name: '首页',
    component: () => import('../views/user/LayoutView.vue'),
    redirect: '/home',
    children: [{
        path: '/home',
        name: '首页',
        component: () => import('../views/user/HomeView.vue')
    }, {
        path: '/active',
        name: '公益活动',
        component: () => import('../views/user/ActiveView.vue')
    }, {
        path: '/serve',
        name: '养老服务',
        component: () => import('../views/user/ServeView.vue')
    }, {
        path: '/elder',
        name: '养老院',
        component: () => import('../views/user/ElderView.vue')
    }, {
        path: '/mine',
        name: '个人中心',
        component: () => import('../views/user/MineView.vue')
    }, {
        path: '/about',
        name: '关于我们',
        component: () => import('../views/user/AboutView.vue')
    }, {
        path: '/news_detail',
        name: '新闻详情',
        component: () => import('../views/user/DetailNews.vue'),
    },]
},]


export const setRoutes = () => {
    if (userIde.value === '普通用户') return user_routes
    if (userIde.value === '管理员') return mana_routes
    if (userIde.value === '超级管理员') return root_routes
    return user_routes
}
export const routes = setRoutes();

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes,
})

export default router
