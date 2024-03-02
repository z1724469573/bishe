import {defineStore} from "pinia";

/**
 * 其内部可以包含，
 * 状态（state），
 * 操作（actions）,
 * getter（getters）
 */
export const index = defineStore("index", {
    state: () => ({
        //左侧导航栏是否折叠
        isCollapse: false,
    }),
    actions: {
        //collapseMenu 点击头部组件的折叠按钮
        collapseMenu() {
            //@ts-ignore
            this.isCollapse = !this.isCollapse;
        },
    },
});
