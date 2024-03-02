import request from "@/request";

// 响应接口
export interface ListNewsRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 列表
 * @returns
 */
export function listNews(): Promise<ListNewsRes> {
    return request.post(`/newsEntity/list`);
}

// 参数接口
export interface UpdateNewsParams {
    newsId?: number;
    newsTitle?: string;
    newsContent?: string;
    newsType?: string;
    newsDate?: string;
    newsCover?: string;
    newsTag?: string;
    newsRead?: string;
    newsState?: number;
}

// 响应接口
export interface UpdateNewsRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 修改
 * @param {object} params $!{table.comment}
 * @param {number} params.newsId 主键
 * @param {string} params.newsTitle 标题
 * @param {string} params.newsContent 内容
 * @param {string} params.newsType 类别
 * @param {string} params.newsDate 日期
 * @param {string} params.newsCover 封面
 * @param {string} params.newsTag 标签
 * @param {string} params.newsRead 阅读
 * @param {number} params.newsState 状态(1 正常 0 禁用)
 * @returns
 */
export function updateNews(params: UpdateNewsParams): Promise<UpdateNewsRes> {
    return request.post(`/newsEntity/update`, params);
}

// 参数接口
export interface SelectNewsParams {
    id?: number;
}

// 响应接口
export interface SelectNewsRes {
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
export function selectNews(params: SelectNewsParams): Promise<SelectNewsRes> {
    return request.post(`/newsEntity/select`, params);
}

// 响应接口
export interface ListPageNewsRes {
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
export function listPageNews(page: number, pageSize: number): Promise<ListPageNewsRes> {
    return request.post(`/newsEntity/listPage?page=${page}&pageSize=${pageSize}`);
}

// 参数接口
export interface InsertNewsParams {
    newsId?: number;
    newsTitle?: string;
    newsContent?: string;
    newsType?: string;
    newsDate?: string;
    newsCover?: string;
    newsTag?: string;
    newsRead?: string;
    newsState?: number;
}

// 响应接口
export interface InsertNewsRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 保存
 * @param {object} params $!{table.comment}
 * @param {number} params.newsId 主键
 * @param {string} params.newsTitle 标题
 * @param {string} params.newsContent 内容
 * @param {string} params.newsType 类别
 * @param {string} params.newsDate 日期
 * @param {string} params.newsCover 封面
 * @param {string} params.newsTag 标签
 * @param {string} params.newsRead 阅读
 * @param {number} params.newsState 状态(1 正常 0 禁用)
 * @returns
 */
export function insertNews(params: InsertNewsParams): Promise<InsertNewsRes> {
    return request.post(`/newsEntity/insert`, params);
}

// 响应接口
export interface ImportExcelNewsRes {
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
export function importExcelNews(file: object): Promise<ImportExcelNewsRes> {
    return request.post(`/newsEntity/importExcel`,file);
}

// 响应接口
export interface ExportExcelNewsRes {
}

/**
 * 导出数据
 * @returns
 */
export function exportExcelNews(): Promise<ExportExcelNewsRes> {
    return request.post(`/newsEntity/exportExcel`, {}, {
        responseType: 'arraybuffer',
        headers: {'Content-Type': ' application/octet-stream'}
    });
}

// 参数接口
export interface ExistNewsParams {
    id?: number;
}

// 响应接口
export interface ExistNewsRes {
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
export function existNews(params: ExistNewsParams): Promise<ExistNewsRes> {
    return request.post(`/newsEntity/exist`, params);
}

// 参数接口
export interface DeleteNewsParams {
    id?: number;
}

// 响应接口
export interface DeleteNewsRes {
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
export function deleteNews(params: DeleteNewsParams): Promise<DeleteNewsRes> {
    return request.post(`/newsEntity/delete`, params);
}


// 响应接口
export interface ListSortNewsRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 列表类别
 * @param {string} newsType
 * @returns
 */
export function listSortNews(newsType: string): Promise<ListSortNewsRes> {
    return request.post(`/newsEntity/listSort?newsType=${newsType}`);
}
