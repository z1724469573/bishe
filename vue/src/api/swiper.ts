import request from "@/request";

// 响应接口
export interface ListSwiperRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 列表
 * @returns
 */
export function listSwiper(): Promise<ListSwiperRes> {
    return request.post(`/swiperEntity/list`);
}


// 响应接口
export interface ListPageSwiperRes {
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
export function listPageSwiper(page: number, pageSize: number): Promise<ListPageSwiperRes> {
    return request.post(`/swiperEntity/listPage?page=${page}&pageSize=${pageSize}`);
}


// 参数接口
export interface SelectSwiperParams {
    id?: number;
}

// 响应接口
export interface SelectSwiperRes {
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
export function selectSwiper(params: SelectSwiperParams): Promise<SelectSwiperRes> {
    return request.post(`/swiperEntity/select`, params);
}

// 参数接口
export interface InsertSwiperParams {
    swiperId?: number;
    swiperLabel?: string;
    swiperSrc?: string;
    swiperUrl?: string;
    swiperState?: number;
}

// 响应接口
export interface InsertSwiperRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 保存
 * @param {object} params $!{table.comment}
 * @param {number} params.swiperId
 * @param {string} params.swiperLabel 名称
 * @param {string} params.swiperSrc 图片
 * @param {string} params.swiperUrl 新闻
 * @param {number} params.swiperState 状态（1正常 0禁用）
 * @returns
 */
export function insertSwiper(params: InsertSwiperParams): Promise<InsertSwiperRes> {
    return request.post(`/swiperEntity/insert`, params);
}


// 参数接口
export interface DeleteSwiperParams {
    id?: number;
}

// 响应接口
export interface DeleteSwiperRes {
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
export function deleteSwiper(params: DeleteSwiperParams): Promise<DeleteSwiperRes> {
    return request.post(`/swiperEntity/delete`, params);
}


// 参数接口
export interface UpdateSwiperParams {
    swiperId?: number;
    swiperLabel?: string;
    swiperSrc?: string;
    swiperUrl?: string;
    swiperState?: number;
}

// 响应接口
export interface UpdateSwiperRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 修改
 * @param {object} params $!{table.comment}
 * @param {number} params.swiperId
 * @param {string} params.swiperLabel 名称
 * @param {string} params.swiperSrc 图片
 * @param {string} params.swiperUrl 新闻
 * @param {number} params.swiperState 状态（1正常 0禁用）
 * @returns
 */
export function updateSwiper(params: UpdateSwiperParams): Promise<UpdateSwiperRes> {
    return request.post(`/swiperEntity/update`, params);
}

// 响应接口
export interface ImportExcelSwiperRes {
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
export function importExcelSwiper(file: object): Promise<ImportExcelSwiperRes> {
    return request.post(`/swiperEntity/importExcel`, file);
}

// 响应接口
export interface ExportExcelSwiperRes {
}

/**
 * 导出数据
 * @returns
 */
export function exportExcelSwiper(): Promise<ExportExcelSwiperRes> {
    return request.post(`/swiperEntity/exportExcel`, {}, {
        responseType: 'arraybuffer',
        headers: {'Content-Type': ' application/octet-stream'}
    })
}




