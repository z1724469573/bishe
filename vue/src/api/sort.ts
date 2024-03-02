import request from "@/request";

// 响应接口
export interface ListSortRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 列表
 * @returns
 */
export function listSort(): Promise<ListSortRes> {
    return request.post(`/sortEntity/list`);
}

// 参数接口
export interface UpdateSortParams {
    sortId?: number;
    sortLabel?: string;
    sortState?: number;
}

// 响应接口
export interface UpdateSortRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 修改
 * @param {object} params $!{table.comment}
 * @param {number} params.sortId 主键
 * @param {string} params.sortLabel 描述
 * @param {number} params.sortState 状态(1 正常 0 禁用)
 * @returns
 */
export function updateSort(params: UpdateSortParams): Promise<UpdateSortRes> {
    return request.post(`/sortEntity/update`, params);
}

// 参数接口
export interface SelectSortParams {
    id?: number;
}

// 响应接口
export interface SelectSortRes {
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
export function selectSort(params: SelectSortParams): Promise<SelectSortRes> {
    return request.post(`/sortEntity/select`, params);
}

// 响应接口
export interface ListPageSortRes {
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
export function listPageSort(page: number, pageSize: number): Promise<ListPageSortRes> {
    return request.post(`/sortEntity/listPage?page=${page}&pageSize=${pageSize}`);
}

// 参数接口
export interface InsertSortParams {
    sortId?: number;
    sortLabel?: string;
    sortState?: number;
}

// 响应接口
export interface InsertSortRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 保存
 * @param {object} params $!{table.comment}
 * @param {number} params.sortId 主键
 * @param {string} params.sortLabel 描述
 * @param {number} params.sortState 状态(1 正常 0 禁用)
 * @returns
 */
export function insertSort(params: InsertSortParams): Promise<InsertSortRes> {
    return request.post(`/sortEntity/insert`, params);
}

// 响应接口
export interface ImportExcelSortRes {
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
export function importExcelSort(file: object): Promise<ImportExcelSortRes> {
    return request.post(`/sortEntity/importExcel`,file);
}

// 响应接口
export interface ExportExcelSortRes {
}

/**
 * 导出数据
 * @returns
 */
export function exportExcelSort(): Promise<ExportExcelSortRes> {
    return request.post(`/sortEntity/exportExcel`, {}, {
        responseType: 'arraybuffer',
        headers: {'Content-Type': ' application/octet-stream'}
    });
}

// 参数接口
export interface ExistSortParams {
    id?: number;
}

// 响应接口
export interface ExistSortRes {
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
export function existSort(params: ExistSortParams): Promise<ExistSortRes> {
    return request.post(`/sortEntity/exist`, params);
}

// 参数接口
export interface DeleteSortParams {
    id?: number;
}

// 响应接口
export interface DeleteSortRes {
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
export function deleteSort(params: DeleteSortParams): Promise<DeleteSortRes> {
    return request.post(`/sortEntity/delete`, params);
}


