import request from "@/request";

// 响应接口
export interface ServeShSearchRes {
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
export function serveShSearch(name: string): Promise<ServeShSearchRes> {
    return request.post(`/serveShEntity/serveShSearch?name=${name}`);
}

// 响应接口
export interface ServeShMyselfRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 报名人
 * @param {string} userId
 * @returns
 */
export function serveShMyself(userId: number): Promise<ServeShMyselfRes> {
    return request.post(`/serveShEntity/serveShMyself?userId=${userId}`);
}

// 参数接口
export interface ServeShEditorParams {
    id?: number;
    serveId?: number;
    userId?: number;
    date?: string;
    checked?: string;
    advice?: string;
    status?: number;
}

// 响应接口
export interface ServeShEditorRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 编辑
 * @param {object} params $!{table.comment}
 * @param {number} params.id
 * @param {number} params.serveId 服务
 * @param {number} params.userId 用户
 * @param {string} params.date 日期
 * @param {string} params.checked 审核
 * @param {string} params.advice 意见
 * @param {number} params.status 状态（1正常 0禁用）
 * @returns
 */
export function serveShEditor(params: ServeShEditorParams): Promise<ServeShEditorRes> {
    return request.post(`/serveShEntity/serveShEditor`, params);
}

// 响应接口
export interface ServeShDeleteRes {
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
export function serveShDelete(id: number): Promise<ServeShDeleteRes> {
    return request.post(`/serveShEntity/serveShDelete?id=${id}`);
}

// 响应接口
export interface ServeShAppendRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 新增
 * @param {string} serveId
 * @param {string} userId
 * @param {string} date
 * @returns
 */
export function serveShAppend(serveId: number, userId: number, date: string): Promise<ServeShAppendRes> {
    return request.post(`/serveShEntity/serveShAppend?serveId=${serveId}&userId=${userId}&date=${date}`);
}

// 响应接口
export interface ServeShListRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 列表
 * @returns
 */
export function serveShList(): Promise<ServeShListRes> {
    return request.get(`/serveShEntity/serveShList`);
}

