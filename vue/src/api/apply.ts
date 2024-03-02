import request from "@/request";

// 响应接口
export interface SelectApplyByAccRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 查询ByAcc
 * @param {string} param
 * @returns
 */
export function selectApplyByAcc(param: string): Promise<SelectApplyByAccRes> {
    return request.post(`/applyEntity/selectByAcc/${param}`);
}

// 参数接口
export interface UpdateApplyParams {
    applyId?: number;
    applyAcc?: string;
    applyPhone?: string;
    applyLabel?: string;
    applyDate?: string;
    applyCheck?: string;
    applyAdvice?: string;
    applyState?: number;
}

// 响应接口
export interface UpdateApplyRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 修改
 * @param {object} params $!{table.comment}
 * @param {number} params.applyId 主键
 * @param {string} params.applyAcc 账号
 * @param {string} params.applyPhone 账号
 * @param {string} params.applyLabel 账号
 * @param {string} params.applyDate 日期
 * @param {string} params.applyCheck 审核
 * @param {string} params.applyAdvice 意见
 * @param {number} params.applyState 状态（1正常 0禁用）
 * @returns
 */
export function updateApply(params: UpdateApplyParams): Promise<UpdateApplyRes> {
    return request.post(`/applyEntity/update`, params);
}

// 参数接口
export interface SelectApplyParams {
    id?: number;
}

// 响应接口
export interface SelectApplyRes {
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
export function selectApply(params: SelectApplyParams): Promise<SelectApplyRes> {
    return request.post(`/applyEntity/select`, params);
}

// 响应接口
export interface ListApplyRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 列表
 * @returns
 */
export function listApply(): Promise<ListApplyRes> {
    return request.post(`/applyEntity/list`);
}

// 响应接口
export interface ListPageApplyRes {
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
export function listPageApply(page: number, pageSize: number): Promise<ListPageApplyRes> {
    return request.post(`/applyEntity/listPage?page=${page}&pageSize=${pageSize}`);
}

// 参数接口
export interface InsertApplyParams {
    applyId?: number;
    applyAcc?: string;
    applyPhone?: string;
    applyLabel?: string;
    applyDate?: string;
    applyCheck?: string;
    applyAdvice?: string;
    applyState?: number;
}

// 响应接口
export interface InsertApplyRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 保存
 * @param {object} params $!{table.comment}
 * @param {number} params.applyId 主键
 * @param {string} params.applyAcc 账号
 * @param {string} params.applyPhone 账号
 * @param {string} params.applyLabel 账号
 * @param {string} params.applyDate 日期
 * @param {string} params.applyCheck 审核
 * @param {string} params.applyAdvice 意见
 * @param {number} params.applyState 状态（1正常 0禁用）
 * @returns
 */
export function insertApply(params: InsertApplyParams): Promise<InsertApplyRes> {
    return request.post(`/applyEntity/insert`, params);
}

// 响应接口
export interface ImportExcelApplyRes {
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
export function importExcelApply(file: object): Promise<ImportExcelApplyRes> {
    return request.post(`/applyEntity/importExcel`,file);
}

// 响应接口
export interface ExportExcelApplyRes {}

/**
 * 导出数据
 * @returns
 */
export function exportExcelApply(): Promise<ExportExcelApplyRes> {
    return request.post(`/applyEntity/exportExcel`, {}, {
        responseType: 'arraybuffer',
        headers: {'Content-Type': ' application/octet-stream'}
    });
}

// 参数接口
export interface ExistApplyParams {
    id?: number;
}

// 响应接口
export interface ExistApplyRes {
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
export function existApply(params: ExistApplyParams): Promise<ExistApplyRes> {
    return request.post(`/applyEntity/exist`, params);
}

// 参数接口
export interface DeleteApplyParams {
    id?: number;
}

// 响应接口
export interface DeleteApplyRes {
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
export function deleteApply(params: DeleteApplyParams): Promise<DeleteApplyRes> {
    return request.post(`/applyEntity/delete`, params);
}



