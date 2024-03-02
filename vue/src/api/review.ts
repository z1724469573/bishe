import request from "@/request";

// 参数接口
export interface UpdateReviewParams {
    reviewId?: number;
    reviewName?: string;
    reviewDate?: string;
    reviewContent?: string;
    reviewStar?: number;
    reviewState?: number;
}

// 响应接口
export interface UpdateReviewRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 修改
 * @param {object} params $!{table.comment}
 * @param {number} params.reviewId 主键
 * @param {string} params.reviewName 姓名
 * @param {string} params.reviewDate 日期
 * @param {string} params.reviewContent 内容
 * @param {number} params.reviewStar 点赞
 * @param {number} params.reviewState 状态(1 正常 0 禁用)
 * @returns
 */
export function updateReview(params: UpdateReviewParams): Promise<UpdateReviewRes> {
    return request.post(`/reviewEntity/update`, params);
}

// 参数接口
export interface SelectReviewParams {
    id?: number;
}

// 响应接口
export interface SelectReviewRes {
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
export function selectReview(params: SelectReviewParams): Promise<SelectReviewRes> {
    return request.post(`/reviewEntity/select`, params);
}

// 响应接口
export interface ListReviewRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 列表
 * @returns
 */
export function listReview(): Promise<ListReviewRes> {
    return request.post(`/reviewEntity/list`);
}

// 响应接口
export interface ListPageReviewRes {
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
export function listPageReview(page: number, pageSize: number): Promise<ListPageReviewRes> {
    return request.post(`/reviewEntity/listPage?page=${page}&pageSize=${pageSize}`);
}

// 参数接口
export interface InsertReviewParams {
    reviewId?: number;
    reviewName?: string;
    reviewDate?: string;
    reviewContent?: string;
    reviewStar?: number;
    reviewState?: number;
}

// 响应接口
export interface InsertReviewRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 保存
 * @param {object} params $!{table.comment}
 * @param {number} params.reviewId 主键
 * @param {string} params.reviewName 姓名
 * @param {string} params.reviewDate 日期
 * @param {string} params.reviewContent 内容
 * @param {number} params.reviewStar 点赞
 * @param {number} params.reviewState 状态(1 正常 0 禁用)
 * @returns
 */
export function insertReview(params: InsertReviewParams): Promise<InsertReviewRes> {
    return request.post(`/reviewEntity/insert`, params);
}

// 响应接口
export interface ImportExcelReviewRes {
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
export function importExcelReview(file: object): Promise<ImportExcelReviewRes> {
    return request.post(`/reviewEntity/importExcel`,file);
}

// 响应接口
export interface ExportExcelReviewRes {
}

/**
 * 导出数据
 * @returns
 */
export function exportExcelReview(): Promise<ExportExcelReviewRes> {
    return request.post(`/reviewEntity/exportExcel`, {}, {
        responseType: 'arraybuffer',
        headers: {'Content-Type': ' application/octet-stream'}
    });
}

// 参数接口
export interface ExistReviewParams {
    id?: number;
}

// 响应接口
export interface ExistReviewRes {
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
export function existReview(params: ExistReviewParams): Promise<ExistReviewRes> {
    return request.post(`/reviewEntity/exist`, params);
}

// 参数接口
export interface DeleteReviewParams {
    id?: number;
}

// 响应接口
export interface DeleteReviewRes {
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
export function deleteReview(params: DeleteReviewParams): Promise<DeleteReviewRes> {
    return request.post(`/reviewEntity/delete`, params);
}
