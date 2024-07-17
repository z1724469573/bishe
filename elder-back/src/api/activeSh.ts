import request from "@/request";

// 响应接口
export interface ActiveShListRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 列表
 * @returns
 */
export function activeShList(): Promise<ActiveShListRes> {
    return request.get(`/activeShEntity/activeShList`);
}

// 参数接口
export interface ActiveShAppendParams {
    activeId?: number;
    userId?: number;
    checked?: string;
    advice?: string;
}

// 响应接口
export interface ActiveShAppendRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 新增
 * @param {object} params ActiveSh
 * @param {number} params.activeId
 * @param {number} params.userId
 * @param {string} params.checked
 * @param {string} params.advice
 * @returns
 */
export function activeShAppend(params: ActiveShAppendParams): Promise<ActiveShAppendRes> {
    return request.post(`/activeShEntity/activeShAppend`, params);
}

// 响应接口
export interface ActiveShDeleteRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 删除
 * @param {string} id
 * @returns
 */
export function activeShDelete(id: number): Promise<ActiveShDeleteRes> {
    return request.post(`/activeShEntity/activeShDelete?id=${id}`);
}

// 参数接口
export interface ActiveShEditorParams {
    id?: number;
    activeId?: number;
    userId?: number;
    date?: string;
    checked?: string;
    advice?: string;
    status?: number;
}

// 响应接口
export interface ActiveShEditorRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 编辑
 * @param {object} params $!{table.comment}
 * @param {number} params.id
 * @param {number} params.activeId 活动
 * @param {number} params.userId 用户
 * @param {string} params.date 日期
 * @param {string} params.checked 审核
 * @param {string} params.advice 意见
 * @param {number} params.status 状态（1正常 0禁用）
 * @returns
 */
export function activeShEditor(params: ActiveShEditorParams): Promise<ActiveShEditorRes> {
    return request.post(`/activeShEntity/activeShEditor`, params);
}

// 响应接口
export interface ActiveShSearchRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 搜索
 * @param {string} name
 * @returns
 */
export function activeShSearch(name: string): Promise<ActiveShSearchRes> {
    return request.post(`/activeShEntity/activeShSearch?name=${name}`);
}

