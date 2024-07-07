import {createRouter, createWebHistory} from 'vue-router'

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
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
                    path: '/about',
                    name: 'about',
                    component: () => import('../views/pages/About.vue')
                }
            ]
        },
    ]
})

export default router
