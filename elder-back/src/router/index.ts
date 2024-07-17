import {createRouter, createWebHistory} from 'vue-router'

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
                name: 'home',
                component: () => import('../views/pages/Home.vue')
            },
            {
                path: '/elder',
                name: 'elder',
                component: () => import('../views/pages/Elder.vue')
            },
            {
                path: '/active',
                name: 'active',
                component: () => import('../views/pages/Active.vue')
            },
            {
                path: '/active.sh',
                name: 'active.sh',
                component: () => import('../views/pages/ActiveShen.vue')
            },
            {
                path: '/manager',
                name: 'manager',
                component: () => import('../views/pages/Manager.vue')
            },
            {
                path: '/user',
                name: 'user',
                component: () => import('../views/pages/User.vue')
            },
            {
                path: '/serve',
                name: 'serve',
                component: () => import('../views/pages/Serve.vue')
            },
            {
                path: '/serve.sh',
                name: 'serve.sh',
                component: () => import('../views/pages/ServeShen.vue')
            },
            {
                path: '/sort',
                name: 'sort',
                component: () => import('../views/pages/Sort.vue')
            },
            {
                path: '/news',
                name: 'news',
                component: () => import('../views/pages/SortNews.vue')
            },
            {
                path: '/about',
                name: 'about',
                component: () => import('../views/pages/About.vue')
            },
            {
                path: '/myself',
                name: 'myself',
                component: () => import('../views/pages/Myself.vue')
            },
        ]
    },
]

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes,
})

export default router;
