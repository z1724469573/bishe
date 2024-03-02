import request from "@/request";

// 响应接口
export interface ListServeRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 列表
 * @returns
 */
export function listServe(): Promise<ListServeRes> {
    return request.post(`/serveEntity/list`);
}

// 参数接口
export interface UpdateServeParams {
    serveId?: number;
    serveCover?: string;
    serveLabel?: string;
    serveContent?: string;
    serveState?: number;
}

// 响应接口
export interface UpdateServeRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 修改
 * @param {object} params $!{table.comment}
 * @param {number} params.serveId 主键
 * @param {string} params.serveCover 封面
 * @param {string} params.serveLabel 名称
 * @param {string} params.serveContent 内容
 * @param {number} params.serveState 状态（1正常 0禁用）
 * @returns
 */
export function updateServe(params: UpdateServeParams): Promise<UpdateServeRes> {
    return request.post(`/serveEntity/update`, params);
}

// 响应接口
export interface ListPageServeRes {
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
export function listPageServe(page: number, pageSize: number): Promise<ListPageServeRes> {
    return request.post(`/serveEntity/listPage?page=${page}&pageSize=${pageSize}`);
}

// 参数接口
export interface InsertServeParams {
    serveId?: number;
    serveCover?: string;
    serveLabel?: string;
    serveContent?: string;
    serveState?: number;
}

// 响应接口
export interface InsertServeRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 保存
 * @param {object} params $!{table.comment}
 * @param {number} params.serveId 主键
 * @param {string} params.serveCover 封面
 * @param {string} params.serveLabel 名称
 * @param {string} params.serveContent 内容
 * @param {number} params.serveState 状态（1正常 0禁用）
 * @returns
 */
export function insertServe(params: InsertServeParams): Promise<InsertServeRes> {
    return request.post(`/serveEntity/insert`, params);
}// 响应接口
export interface ImportExcelServeRes {
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
export function importExcelServe(file: object): Promise<ImportExcelServeRes> {
    return request.post(`/serveEntity/importExcel`,file);
}

// 响应接口
export interface ExportExcelServeRes {
}

/**
 * 导出数据
 * @returns
 */
export function exportExcelServe(): Promise<ExportExcelServeRes> {
    return request.post(`/serveEntity/exportExcel`, {}, {
        responseType: 'arraybuffer',
        headers: {'Content-Type': ' application/octet-stream'}
    });
}// 参数接口
export interface ExistServeParams {
    id?: number;
}

// 响应接口
export interface ExistServeRes {
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
export function existServe(params: ExistServeParams): Promise<ExistServeRes> {
    return request.post(`/serveEntity/exist`, params);
}// 参数接口
export interface DeleteServeParams {
    id?: number;
}

// 响应接口
export interface DeleteServeRes {
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
export function deleteServe(params: DeleteServeParams): Promise<DeleteServeRes> {
    return request.post(`/serveEntity/delete`, params);
}

// 参数接口
export interface SelectServeParams {
    id?: number;
}

// 响应接口
export interface SelectServeRes {
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
export function selectServe(params: SelectServeParams): Promise<SelectServeRes> {
    return request.post(`/serveEntity/select`, params);
}