import request from "@/request";

// 参数接口
export interface UpdateElderParams {
    elderId?: number;
    elderLabel?: string;
    elderContent?: string;
    elderTag?: string;
    elderPrice?: number;
    elderAddress?: string;
    elderDate?: string;
    elderCover?: string;
    elderBed?: number;
    elderArea?: number;
    elderPhone?: string;
    elderJw?: string;
    elderWd?: string;
    elderState?: number;
}

// 响应接口
export interface UpdateElderRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 修改
 * @param {object} params $!{table.comment}
 * @param {number} params.elderId 主键
 * @param {string} params.elderLabel 名称
 * @param {string} params.elderContent 内容
 * @param {string} params.elderTag 标签
 * @param {number} params.elderPrice 价格
 * @param {string} params.elderAddress 地址
 * @param {string} params.elderDate 成立日期
 * @param {string} params.elderCover 封面
 * @param {number} params.elderBed 房间数
 * @param {number} params.elderArea 面积
 * @param {string} params.elderPhone 电话
 * @param {string} params.elderJw 经纬度
 * @param {string} params.elderWd 经纬度
 * @param {number} params.elderState 状态（1正常 0禁用）
 * @returns
 */
export function updateElder(params: UpdateElderParams): Promise<UpdateElderRes> {
    return request.post(`/elderEntity/update`, params);
}
// 参数接口
export interface SelectElderParams {
    id?: number;
}

// 响应接口
export interface SelectElderRes {
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
export function selectElder(params: SelectElderParams): Promise<SelectElderRes> {
    return request.post(`/elderEntity/select`, params);
}
// 响应接口
export interface ListElderRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 列表
 * @returns
 */
export function listElder(): Promise<ListElderRes> {
    return request.post(`/elderEntity/list`);
}
// 响应接口
export interface ListPageElderRes {
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
export function listPageElder(page: number, pageSize: number): Promise<ListPageElderRes> {
    return request.post(`/elderEntity/listPage?page=${page}&pageSize=${pageSize}`);
}
// 参数接口
export interface InsertElderParams {
    elderId?: number;
    elderLabel?: string;
    elderContent?: string;
    elderTag?: string;
    elderPrice?: number;
    elderAddress?: string;
    elderDate?: string;
    elderCover?: string;
    elderBed?: number;
    elderArea?: number;
    elderPhone?: string;
    elderJw?: string;
    elderWd?: string;
    elderState?: number;
}

// 响应接口
export interface InsertElderRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 保存
 * @param {object} params $!{table.comment}
 * @param {number} params.elderId 主键
 * @param {string} params.elderLabel 名称
 * @param {string} params.elderContent 内容
 * @param {string} params.elderTag 标签
 * @param {number} params.elderPrice 价格
 * @param {string} params.elderAddress 地址
 * @param {string} params.elderDate 成立日期
 * @param {string} params.elderCover 封面
 * @param {number} params.elderBed 房间数
 * @param {number} params.elderArea 面积
 * @param {string} params.elderPhone 电话
 * @param {string} params.elderJw 经纬度
 * @param {string} params.elderWd 经纬度
 * @param {number} params.elderState 状态（1正常 0禁用）
 * @returns
 */
export function insertElder(params: InsertElderParams): Promise<InsertElderRes> {
    return request.post(`/elderEntity/insert`, params);
}
// 响应接口
export interface ImportExcelElderRes {
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
export function importExcelElder(file: object): Promise<ImportExcelElderRes> {
    return request.post(`/elderEntity/importExcel`,file);
}
// 响应接口
export interface ExportExcelElderRes {}

/**
 * 导出数据
 * @returns
 */
export function exportExcelElder(): Promise<ExportExcelElderRes> {
    return request.post(`/elderEntity/exportExcel`, {}, {
        responseType: 'arraybuffer',
        headers: {'Content-Type': ' application/octet-stream'}
    });
}
// 参数接口
export interface ExistElderParams {
    id?: number;
}

// 响应接口
export interface ExistElderRes {
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
export function existElder(params: ExistElderParams): Promise<ExistElderRes> {
    return request.post(`/elderEntity/exist`, params);
}
// 参数接口
export interface DeleteElderParams {
    id?: number;
}

// 响应接口
export interface DeleteElderRes {
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
export function deleteElder(params: DeleteElderParams): Promise<DeleteElderRes> {
    return request.post(`/elderEntity/delete`, params);
}


