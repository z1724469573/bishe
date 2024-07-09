import request from "@/request";

// 响应接口
export interface NoticeListRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 列表
 * @returns
 */
export function noticeList(): Promise<NoticeListRes> {
    return request.get(`/noticeEntity/noticeList`);
}

// 参数接口
export interface NoticeAppendParams {
    name?: string;
}

// 响应接口
export interface NoticeAppendRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 新增
 * @param {object} params Notice
 * @param {string} params.name
 * @returns
 */
export function noticeAppend(params: NoticeAppendParams): Promise<NoticeAppendRes> {
    return request.post(`/noticeEntity/noticeAppend`, params);
}

// 响应接口
export interface NoticeDeleteRes {
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
export function noticeDelete(id: number): Promise<NoticeDeleteRes> {
    return request.post(`/noticeEntity/noticeDelete?id=${id}`);
}

// 参数接口
export interface NoticeEditorParams {
    id?: number;
    name?: string;
    status?: number;
}

// 响应接口
export interface NoticeEditorRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 编辑
 * @param {object} params $!{table.comment}
 * @param {number} params.id 主键
 * @param {string} params.name 标题
 * @param {number} params.status 状态（1正常 0禁用）
 * @returns
 */
export function noticeEditor(params: NoticeEditorParams): Promise<NoticeEditorRes> {
    return request.post(`/noticeEntity/noticeEditor`, params);
}

// 响应接口
export interface NoticeSearchRes {
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
export function noticeSearch(name: string): Promise<NoticeSearchRes> {
    return request.post(`/noticeEntity/noticeSearch?name=${name}`);
}

