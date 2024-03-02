import request from "@/request";

// 响应接口
export interface SelectOrderByAccRes {
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
export function selectOrderByAcc(param: string): Promise<SelectOrderByAccRes> {
    return request.post(`/orderEntity/selectByAcc/${param}`);
}

// 参数接口
export interface UpdateOrderParams {
    orderId?: number;
    orderAcc?: string;
    orderDate?: string;
    orderCheck?: string;
    orderAdvice?: string;
    orderState?: number;
}

// 响应接口
export interface UpdateOrderRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 修改
 * @param {object} params $!{table.comment}
 * @param {number} params.orderId 主键
 * @param {string} params.orderAcc 用户
 * @param {string} params.orderDate 日期
 * @param {string} params.orderCheck 审核
 * @param {string} params.orderAdvice 意见
 * @param {number} params.orderState 状态（1正常 0禁用）
 * @returns
 */
export function updateOrder(params: UpdateOrderParams): Promise<UpdateOrderRes> {
    return request.post(`/orderEntity/update`, params);
}

// 参数接口
export interface SelectOrderParams {
    id?: number;
}

// 响应接口
export interface SelectOrderRes {
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
export function selectOrder(params: SelectOrderParams): Promise<SelectOrderRes> {
    return request.post(`/orderEntity/select`, params);
}// 响应接口
export interface ListOrderRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 列表
 * @returns
 */
export function listOrder(): Promise<ListOrderRes> {
    return request.post(`/orderEntity/list`);
}// 响应接口
export interface ListPageOrderRes {
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
export function listPageOrder(page: number, pageSize: number): Promise<ListPageOrderRes> {
    return request.post(`/orderEntity/listPage?page=${page}&pageSize=${pageSize}`);
}// 参数接口
export interface InsertOrderParams {
    orderId?: number;
    orderAcc?: string;
    orderDate?: string;
    orderCheck?: string;
    orderAdvice?: string;
    orderState?: number;
}

// 响应接口
export interface InsertOrderRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 保存
 * @param {object} params $!{table.comment}
 * @param {number} params.orderId 主键
 * @param {string} params.orderAcc 用户
 * @param {string} params.orderDate 日期
 * @param {string} params.orderCheck 审核
 * @param {string} params.orderAdvice 意见
 * @param {number} params.orderState 状态（1正常 0禁用）
 * @returns
 */
export function insertOrder(params: InsertOrderParams): Promise<InsertOrderRes> {
    return request.post(`/orderEntity/insert`, params);
}// 响应接口
export interface ImportExcelOrderRes {
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
export function importExcelOrder(file: object): Promise<ImportExcelOrderRes> {
    return request.post(`/orderEntity/importExcel`,file);
}// 响应接口
export interface ExportExcelOrderRes {
}

/**
 * 导出数据
 * @returns
 */
export function exportExcelOrder(): Promise<ExportExcelOrderRes> {
    return request.post(`/orderEntity/exportExcel`, {}, {
        responseType: 'arraybuffer',
        headers: {'Content-Type': ' application/octet-stream'}
    });
}// 参数接口
export interface ExistOrderParams {
    id?: number;
}

// 响应接口
export interface ExistOrderRes {
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
export function existOrder(params: ExistOrderParams): Promise<ExistOrderRes> {
    return request.post(`/orderEntity/exist`, params);
}// 参数接口
export interface DeleteOrderParams {
    id?: number;
}

// 响应接口
export interface DeleteOrderRes {
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
export function deleteOrder(params: DeleteOrderParams): Promise<DeleteOrderRes> {
    return request.post(`/orderEntity/delete`, params);
}
