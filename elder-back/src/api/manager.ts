import request from "@/request";
// 响应接口
export interface ManagerListRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 列表
 * @returns
 */
export function managerList(): Promise<ManagerListRes> {
    return request.get(`/managerEntity/managerList`);
}

// 参数接口
export interface ManagerAppendParams {
    acc?: string;
    pwd?: string;
    name?: string;
    sex?: string;
    age?: number;
    phone?: string;
    address?: string;
}

// 响应接口
export interface ManagerAppendRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 新增
 * @param {object} params Manager
 * @param {string} params.acc
 * @param {string} params.pwd
 * @param {string} params.name
 * @param {string} params.sex
 * @param {number} params.age
 * @param {string} params.phone
 * @param {string} params.address
 * @returns
 */
export function managerAppend(params: ManagerAppendParams): Promise<ManagerAppendRes> {
    return request.post(`/managerEntity/managerAppend`, params);
}

// 响应接口
export interface ManagerDeleteRes {
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
export function managerDelete(id: number): Promise<ManagerDeleteRes> {
    return request.post(`/managerEntity/managerDelete?id=${id}`);
}

// 参数接口
export interface ManagerEditorParams {
    id?: number;
    acc?: string;
    pwd?: string;
    name?: string;
    sex?: string;
    age?: number;
    phone?: string;
    address?: string;
    status?: number;
}

// 响应接口
export interface ManagerEditorRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 编辑
 * @param {object} params $!{table.comment}
 * @param {number} params.id 主键
 * @param {string} params.acc 账号
 * @param {string} params.pwd 密码
 * @param {string} params.name 姓名
 * @param {string} params.sex 性别
 * @param {number} params.age 年龄
 * @param {string} params.phone 电话
 * @param {string} params.address 地址
 * @param {number} params.status 状态(1 正常 0 禁用)
 * @returns
 */
export function managerEditor(params: ManagerEditorParams): Promise<ManagerEditorRes> {
    return request.post(`/managerEntity/managerEditor`, params);
}

// 响应接口
export interface ManagerSearchRes {
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
export function managerSearch(name: string): Promise<ManagerSearchRes> {
    return request.post(`/managerEntity/managerSearch?name=${name}`);
}


