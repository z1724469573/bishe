import request from "@/request";

// 响应接口
export interface ActiveListRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 列表
 * @returns
 */
export function activeList(): Promise<ActiveListRes> {
    return request.get(`/activeEntity/activeList`);
}

// 参数接口
export interface ActiveAppendParams {
    name?: string;
    start?: string;
    end?: string;
    address?: string;
    phone?: string;
    content?: string;
    cover?: string;
}

// 响应接口
export interface ActiveAppendRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 新增
 * @param {object} params Active
 * @param {string} params.name
 * @param {string} params.start
 * @param {string} params.end
 * @param {string} params.address
 * @param {string} params.phone
 * @param {string} params.content
 * @param {string} params.cover
 * @returns
 */
export function activeAppend(params: ActiveAppendParams): Promise<ActiveAppendRes> {
    return request.post(`/activeEntity/activeAppend`, params);
}

// 响应接口
export interface ActiveDeleteRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 删除
 * @param {string} id
 * @returns
 */
export function activeDelete(id: number): Promise<ActiveDeleteRes> {
    return request.post(`/activeEntity/activeDelete?id=${id}`);
}

// 参数接口
export interface ActiveEditorParams {
    id?: number;
    name?: string;
    start?: string;
    end?: string;
    address?: string;
    phone?: string;
    content?: string;
    cover?: string;
    status?: number;
}

// 响应接口
export interface ActiveEditorRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 编辑
 * @param {object} params $!{table.comment}
 * @param {number} params.id 主键
 * @param {string} params.name 名称
 * @param {string} params.start 开始
 * @param {string} params.end 结束
 * @param {string} params.address 地址
 * @param {string} params.phone 电话
 * @param {string} params.content 内容
 * @param {string} params.cover 封面
 * @param {number} params.status 状态(1 正常 0 禁用)
 * @returns
 */
export function activeEditor(params: ActiveEditorParams): Promise<ActiveEditorRes> {
    return request.post(`/activeEntity/activeEditor`, params);
}

// 响应接口
export interface ActiveSearchRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 搜索
 * @param {string} name
 * @returns
 */
export function activeSearch(name: string): Promise<ActiveSearchRes> {
    return request.post(`/activeEntity/activeSearch?name=${name}`);
}

