import request from "@/request";

// 响应接口
export interface ListActiveRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 列表
 * @returns
 */
export function listActive(): Promise<ListActiveRes> {
    return request.post(`/activeEntity/list`);
}

// 参数接口
export interface UpdateActiveParams {
    activeId?: number;
    activeLabel?: string;
    activeStart?: string;
    activeEnd?: string;
    activeAddress?: string;
    activePhone?: string;
    activeContent?: string;
    activeCover?: string;
    activeState?: number;
}

// 响应接口
export interface UpdateActiveRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 修改
 * @param {object} params $!{table.comment}
 * @param {number} params.activeId 主键
 * @param {string} params.activeLabel 名称
 * @param {string} params.activeStart 开始
 * @param {string} params.activeEnd 结束
 * @param {string} params.activeAddress 地址
 * @param {string} params.activePhone 电话
 * @param {string} params.activeContent 内容
 * @param {string} params.activeCover 封面
 * @param {number} params.activeState 状态(1 正常 0 禁用)
 * @returns
 */
export function updateActive(params: UpdateActiveParams): Promise<UpdateActiveRes> {
    return request.post(`/activeEntity/update`, params);
}// 参数接口
export interface SelectActiveParams {
    id?: number;
}

// 响应接口
export interface SelectActiveRes {
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
export function selectActive(params: SelectActiveParams): Promise<SelectActiveRes> {
    return request.post(`/activeEntity/select`, params);
}// 响应接口
export interface ListPageActiveRes {
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
export function listPageActive(page: number, pageSize: number): Promise<ListPageActiveRes> {
    return request.post(`/activeEntity/listPage?page=${page}&pageSize=${pageSize}`);
}// 参数接口
export interface InsertActiveParams {
    activeId?: number;
    activeLabel?: string;
    activeStart?: string;
    activeEnd?: string;
    activeAddress?: string;
    activePhone?: string;
    activeContent?: string;
    activeCover?: string;
    activeState?: number;
}

// 响应接口
export interface InsertActiveRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 保存
 * @param {object} params $!{table.comment}
 * @param {number} params.activeId 主键
 * @param {string} params.activeLabel 名称
 * @param {string} params.activeStart 开始
 * @param {string} params.activeEnd 结束
 * @param {string} params.activeAddress 地址
 * @param {string} params.activePhone 电话
 * @param {string} params.activeContent 内容
 * @param {string} params.activeCover 封面
 * @param {number} params.activeState 状态(1 正常 0 禁用)
 * @returns
 */
export function insertActive(params: InsertActiveParams): Promise<InsertActiveRes> {
    return request.post(`/activeEntity/insert`, params);
}// 响应接口
export interface ImportExcelActiveRes {
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
export function importExcelActive(file: object): Promise<ImportExcelActiveRes> {
    return request.post(`/activeEntity/importExcel`,file);
}// 响应接口
export interface ExportExcelActiveRes {
}

/**
 * 导出数据
 * @returns
 */
export function exportExcelActive(): Promise<ExportExcelActiveRes> {
    return request.post(`/activeEntity/exportExcel`, {}, {
        responseType: 'arraybuffer',
        headers: {'Content-Type': ' application/octet-stream'}
    });
}// 参数接口
export interface ExistActiveParams {
    id?: number;
}

// 响应接口
export interface ExistActiveRes {
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
export function existActive(params: ExistActiveParams): Promise<ExistActiveRes> {
    return request.post(`/activeEntity/exist`, params);
}// 参数接口
export interface DeleteActiveParams {
    id?: number;
}

// 响应接口
export interface DeleteActiveRes {
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
export function deleteActive(params: DeleteActiveParams): Promise<DeleteActiveRes> {
    return request.post(`/activeEntity/delete`, params);
}