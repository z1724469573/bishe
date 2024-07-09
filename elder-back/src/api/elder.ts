import request from "@/request";

// 响应接口
export interface ElderListRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 列表
 * @returns
 */
export function elderList(): Promise<ElderListRes> {
    return request.get(`/elderEntity/elderList`);
}

// 参数接口
export interface ElderAppendParams {
    name?: string;
    content?: string;
    tag?: string;
    price?: number;
    address?: string;
    date?: string;
    cover?: string;
    bed?: number;
    area?: number;
    phone?: string;
    jd?: string;
    wd?: string;
}

// 响应接口
export interface ElderAppendRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 新增
 * @param {object} params Elder
 * @param {string} params.name
 * @param {string} params.content
 * @param {string} params.tag
 * @param {number} params.price
 * @param {string} params.address
 * @param {string} params.date
 * @param {string} params.cover
 * @param {number} params.bed
 * @param {number} params.area
 * @param {string} params.phone
 * @param {string} params.jd
 * @param {string} params.wd
 * @returns
 */
export function elderAppend(params: ElderAppendParams): Promise<ElderAppendRes> {
    return request.post(`/elderEntity/elderAppend`, params);
}

// 响应接口
export interface ElderDeleteRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 删除
 * @param {string} id
 * @returns
 */
export function elderDelete(id: number): Promise<ElderDeleteRes> {
    return request.post(`/elderEntity/elderDelete?id=${id}`);
}


// 参数接口
export interface ElderEditorParams {
    id?: number;
    name?: string;
    content?: string;
    tag?: string;
    price?: number;
    address?: string;
    date?: string;
    cover?: string;
    bed?: number;
    area?: number;
    phone?: string;
    jd?: string;
    wd?: string;
    status?: number;
}

// 响应接口
export interface ElderEditorRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 编辑
 * @param {object} params $!{table.comment}
 * @param {number} params.id 主键
 * @param {string} params.name 名称
 * @param {string} params.content 内容
 * @param {string} params.tag 标签
 * @param {number} params.price 价格
 * @param {string} params.address 地址
 * @param {string} params.date 成立日期
 * @param {string} params.cover 封面
 * @param {number} params.bed 房间数
 * @param {number} params.area 面积
 * @param {string} params.phone 电话
 * @param {string} params.jd 经度
 * @param {string} params.wd 纬度
 * @param {number} params.status 状态（1正常 0禁用）
 * @returns
 */
export function elderEditor(params: ElderEditorParams): Promise<ElderEditorRes> {
    return request.post(`/elderEntity/elderEditor`, params);
}

// 响应接口
export interface ElderSearchRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 搜索
 * @param {string} name
 * @returns
 */
export function elderSearch(name: string): Promise<ElderSearchRes> {
    return request.post(`/elderEntity/elderSearch?name=${name}`);
}


