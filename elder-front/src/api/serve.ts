import request from "@/request";

// 响应接口
export interface ServeListRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 列表
 * @returns
 */
export function serveList(): Promise<ServeListRes> {
    return request.get(`/serveEntity/serveList`);
}

// 参数接口
export interface ServeAppendParams {
    name?: string;
    cover?: string;
    content?: string;
}

// 响应接口
export interface ServeAppendRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 新增
 * @param {object} params Serve
 * @param {string} params.name
 * @param {string} params.cover
 * @param {string} params.content
 * @returns
 */
export function serveAppend(params: ServeAppendParams): Promise<ServeAppendRes> {
    return request.post(`/serveEntity/serveAppend`, params);
}

// 响应接口
export interface ServeDeleteRes {
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
export function serveDelete(id: number): Promise<ServeDeleteRes> {
    return request.post(`/serveEntity/serveDelete?id=${id}`);
}

// 参数接口
export interface ServeEditorParams {
    id?: number;
    name?: string;
    cover?: string;
    content?: string;
    status?: number;
}

// 响应接口
export interface ServeEditorRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 编辑
 * @param {object} params $!{table.comment}
 * @param {number} params.id 主键
 * @param {string} params.name 名称
 * @param {string} params.cover 封面
 * @param {string} params.content 内容
 * @param {number} params.status 状态（1正常 0禁用）
 * @returns
 */
export function serveEditor(params: ServeEditorParams): Promise<ServeEditorRes> {
    return request.post(`/serveEntity/serveEditor`, params);
}

// 响应接口
export interface ServeSearchRes {
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
export function serveSearch(name: string): Promise<ServeSearchRes> {
    return request.post(`/serveEntity/serveSearch?name=${name}`);
}

