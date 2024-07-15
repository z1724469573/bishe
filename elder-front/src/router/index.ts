import {createRouter, createWebHashHistory} from 'vue-router'
import {ElMessage, ElMessageBox} from 'element-plus'
import type {Action} from 'element-plus'

export const routes = [
    {
        path: '/',
        name: 'login',
        component: () => import('../views/Login.vue')
    },
    {
        path: '/regist',
        name: 'regist',
        component: () => import('../views/Regist.vue')
    },
    {
        path: '/layout',
        name: 'layout',
        redirect: '/home',
        component: () => import('../views/Layout.vue'),
        meta: {requireAuth: true},
        beforeEnter: (to, from, next) => {
            //@ts-ignore
            if (to.meta.requireAuth) { //判断是否需要授权
                if (localStorage.getItem('token')) {
                    next();
                } else {
                    ElMessageBox.alert('抱歉，请先登录，您无权限查看！', '提示', {
                        confirmButtonText: '确认',
                        callback: (action: Action) => {
                            router.push('/');
                            ElMessage.info({message: `已返回登录页`, grouping: true, showClose: true})
                        },
                    })
                }
            } else {
                next();
            }
        },
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
