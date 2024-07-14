import request from "@/request";

// 响应接口
export interface SortNewsListRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 列表
 * @returns
 */
export function sortNewsList(): Promise<SortNewsListRes> {
    return request.get(`/sortNewsEntity/sortNewsList`);
}

// 参数接口
export interface SortNewsAppendParams {
    sortId?: number;
    title?: string;
    content?: string;
    date?: string;
    cover?: string;
    looks?: string;
}

// 响应接口
export interface SortNewsAppendRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 新增
 * @param {object} params SortNews
 * @param {number} params.sortId
 * @param {string} params.title
 * @param {string} params.content
 * @param {string} params.date
 * @param {string} params.cover
 * @param {string} params.looks
 * @returns
 */
export function sortNewsAppend(params: SortNewsAppendParams): Promise<SortNewsAppendRes> {
    return request.post(`/sortNewsEntity/sortNewsAppend`, params);
}

// 响应接口
export interface SortNewsDeleteRes {
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
export function sortNewsDelete(id: number): Promise<SortNewsDeleteRes> {
    return request.post(`/sortNewsEntity/sortNewsDelete?id=${id}`);
}

// 参数接口
export interface SortNewsEditorParams {
    id?: number;
    sortId?: number;
    title?: string;
    content?: string;
    date?: string;
    cover?: string;
    looks?: string;
    status?: number;
}

// 响应接口
export interface SortNewsEditorRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 编辑
 * @param {object} params $!{table.comment}
 * @param {number} params.id 主键
 * @param {number} params.sortId 类别
 * @param {string} params.title 标题
 * @param {string} params.content 内容
 * @param {string} params.date 日期
 * @param {string} params.cover 封面
 * @param {string} params.looks 阅读
 * @param {number} params.status 状态(1 正常 0 禁用)
 * @returns
 */
export function sortNewsEditor(params: SortNewsEditorParams): Promise<SortNewsEditorRes> {
    return request.post(`/sortNewsEntity/sortNewsEditor`, params);
}

// 响应接口
export interface SortNewsSearchRes {
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
export function sortNewsSearch(name: string): Promise<SortNewsSearchRes> {
    return request.post(`/sortNewsEntity/sortNewsSearch?name=${name}`);
}

// 响应接口
export interface SortNewsLateRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 最新
 * @returns
 */
export function sortNewsLate(): Promise<SortNewsLateRes> {
    return request.get(`/sortNewsEntity/sortNewsLate`);
}

// 响应接口
export interface SortNewsHotsRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 最热
 * @returns
 */
export function sortNewsHots(): Promise<SortNewsHotsRes> {
    return request.get(`/sortNewsEntity/sortNewsHots`);
}


// 响应接口
export interface SortNewsSortRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 分类
 * @param {string} name
 * @returns
 */
export function sortNewsSort(name: string): Promise<SortNewsSortRes> {
    return request.post(`/sortNewsEntity/sortNewsSort?name=${name}`);
}
