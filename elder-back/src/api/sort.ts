import request from "@/request";

// 响应接口
export interface SortListRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 列表
 * @returns
 */
export function sortList(): Promise<SortListRes> {
    return request.get(`/sortEntity/sortList`);
}

// 参数接口
export interface SortAppendParams {
    name?: string;
}

// 响应接口
export interface SortAppendRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 新增
 * @param {object} params Sort
 * @param {string} params.name
 * @returns
 */
export function sortAppend(params: SortAppendParams): Promise<SortAppendRes> {
    return request.post(`/sortEntity/sortAppend`, params);
}

// 响应接口
export interface SortDeleteRes {
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
export function sortDelete(id: number): Promise<SortDeleteRes> {
    return request.post(`/sortEntity/sortDelete?id=${id}`);
}

// 参数接口
export interface SortEditorParams {
    id?: number;
    name?: string;
    status?: number;
}

// 响应接口
export interface SortEditorRes {
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
 * @param {number} params.status 状态(1 正常 0 禁用)
 * @returns
 */
export function sortEditor(params: SortEditorParams): Promise<SortEditorRes> {
    return request.post(`/sortEntity/sortEditor`, params);
}

// 响应接口
export interface SortSearchRes {
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
export function sortSearch(name: string): Promise<SortSearchRes> {
    return request.post(`/sortEntity/sortSearch?name=${name}`);
}

