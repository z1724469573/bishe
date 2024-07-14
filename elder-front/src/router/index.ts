import {createRouter, createWebHashHistory} from 'vue-router'

export const routes = [
    {
        path: '/',
        name: 'login',
        component: () => import('../views/Login.vue')
    },
    {
        path: '/layout',
        name: 'layout',
        redirect: '/home',
        component: () => import('../views/Layout.vue'),
        children: [
            {
                path: '/home',
                name: '首页',
                component: () => import('../views/pages/Home.vue')
            },
            {
                path: '/newsDetail',
                name: '资讯详情',
                component: () => import('../views/pages/NewsDetail.vue')
            },
            {
                path: '/active',
                name: '公益活动',
                component: () => import('../views/pages/Active.vue')
            },
            {
                path: '/activeDetail',
                name: '活动详情',
                component: () => import('../views/pages/ActiveDetail.vue')
            },
            {
                path: '/serve',
                name: '养老服务',
                component: () => import('../views/pages/Serve.vue')
            },
            {
                path: '/elder',
                name: '养老院',
                component: () => import('../views/pages/Elder.vue')
            },
            {
                path: '/elderDetail',
                name: '养老院详情',
                component: () => import('../views/pages/ElderDetail.vue')
            },
            {
                path: '/myself',
                name: '个人中心',
                component: () => import('../views/pages/Myself.vue')
            },
            {
                path: '/about',
                name: '关于我们',
                component: () => import('../views/pages/About.vue')
            }
        ]
    },
]

const router = createRouter({
    history: createWebHashHistory(import.meta.env.BASE_URL),
    routes
})

export default router
