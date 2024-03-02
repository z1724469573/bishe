import request from "@/request";


// 参数接口
export interface UpdateNoticeParams {
    noticeId?: number;
    noticeLabel?: string;
    noticeState?: number;
}

// 响应接口
export interface UpdateNoticeRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 修改
 * @param {object} params $!{table.comment}
 * @param {number} params.noticeId 主键
 * @param {string} params.noticeLabel 标题
 * @param {number} params.noticeState 状态（1正常 0禁用）
 * @returns
 */
export function updateNotice(params: UpdateNoticeParams): Promise<UpdateNoticeRes> {
    return request.post(`/noticeEntity/update`, params);
}// 参数接口
export interface SelectNoticeParams {
    id?: number;
}

// 响应接口
export interface SelectNoticeRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 查询
 * @param {object} params IdParam
 * @param {number} params.id ID，记录唯一标识
 * @returns
 */
export function selectNotice(params: SelectNoticeParams): Promise<SelectNoticeRes> {
    return request.post(`/noticeEntity/select`, params);
}// 响应接口
export interface ListNoticeRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 列表
 * @returns
 */
export function listNotice(): Promise<ListNoticeRes> {
    return request.post(`/noticeEntity/list`);
}// 响应接口
export interface ListPageNoticeRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 列表分页
 * @param {string} page
 * @param {string} pageSize
 * @returns
 */
export function listPageNotice(page: number, pageSize: number): Promise<ListPageNoticeRes> {
    return request.post(`/noticeEntity/listPage?page=${page}&pageSize=${pageSize}`);
}// 参数接口
export interface InsertNoticeParams {
    noticeId?: number;
    noticeLabel?: string;
    noticeState?: number;
}

// 响应接口
export interface InsertNoticeRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 保存
 * @param {object} params $!{table.comment}
 * @param {number} params.noticeId 主键
 * @param {string} params.noticeLabel 标题
 * @param {number} params.noticeState 状态（1正常 0禁用）
 * @returns
 */
export function insertNotice(params: InsertNoticeParams): Promise<InsertNoticeRes> {
    return request.post(`/noticeEntity/insert`, params);
}// 响应接口
export interface ImportExcelNoticeRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 导入数据
 * @param {string} file
 * @returns
 */
export function importExcelNotice(file: object): Promise<ImportExcelNoticeRes> {
    return request.post(`/noticeEntity/importExcel`,file);
}// 响应接口
export interface ExportExcelNoticeRes {
}

/**
 * 导出数据
 * @returns
 */
export function exportExcelNotice(): Promise<ExportExcelNoticeRes> {
    return request.post(`/noticeEntity/exportExcel`, {}, {
        responseType: 'arraybuffer',
        headers: {'Content-Type': ' application/octet-stream'}
    });
}// 参数接口
export interface ExistNoticeParams {
    id?: number;
}

// 响应接口
export interface ExistNoticeRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 存在
 * @param {object} params IdParam
 * @param {number} params.id ID，记录唯一标识
 * @returns
 */
export function existNotice(params: ExistNoticeParams): Promise<ExistNoticeRes> {
    return request.post(`/noticeEntity/exist`, params);
}// 参数接口
export interface DeleteNoticeParams {
    id?: number;
}

// 响应接口
export interface DeleteNoticeRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 删除
 * @param {object} params IdParam
 * @param {number} params.id ID，记录唯一标识
 * @returns
 */
export function deleteNotice(params: DeleteNoticeParams): Promise<DeleteNoticeRes> {
    return request.post(`/noticeEntity/delete`, params);
}