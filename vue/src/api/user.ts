import request from "@/request";

// 响应接口
export interface ListUserRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 列表
 * @returns
 */
export function listUser(): Promise<ListUserRes> {
    return request.post(`/userEntity/list`);
}

// 响应接口
export interface SelectUserByAccRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 查询byAcc
 * @param {string} param
 * @returns
 */
export function selectUserByAcc(param: string): Promise<SelectUserByAccRes> {
    return request.post(`/userEntity/selectByAcc/${param}`);
}

// 参数接口
export interface UpdateUserParams {
    userId?: number;
    userAcc?: string;
    userPwd?: string;
    userName?: string;
    userSex?: number;
    userAge?: number;
    userPhone?: string;
    userIde?: string;
    userAddress?: string;
    userState?: number;
}

// 响应接口
export interface UpdateUserRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 修改
 * @param {object} params $!{table.comment}
 * @param {number} params.userId 主键
 * @param {string} params.userAcc 账号
 * @param {string} params.userPwd 密码
 * @param {string} params.userName 姓名
 * @param {number} params.userSex 性别(0男 1女 2不详)
 * @param {number} params.userAge 年龄
 * @param {string} params.userPhone 电话
 * @param {string} params.userIde 角色
 * @param {string} params.userAddress 地址
 * @param {number} params.userState 状态(1 正常 0 禁用)
 * @returns
 */
export function updateUser(params: UpdateUserParams): Promise<UpdateUserRes> {
    return request.post(`/userEntity/update`, params);
}

// 响应接口
export interface ListPageUserRes {
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
export function listPageUser(page: number, pageSize: number): Promise<ListPageUserRes> {
    return request.post(`/userEntity/listPage?page=${page}&pageSize=${pageSize}`);
}

// 参数接口
export interface InsertUserParams {
    userId?: number;
    userAcc?: string;
    userPwd?: string;
    userName?: string;
    userSex?: number;
    userAge?: number;
    userPhone?: string;
    userIde?: string;
    userAddress?: string;
    userState?: number;
}

// 响应接口
export interface InsertUserRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 保存
 * @param {object} params $!{table.comment}
 * @param {number} params.userId 主键
 * @param {string} params.userAcc 账号
 * @param {string} params.userPwd 密码
 * @param {string} params.userName 姓名
 * @param {number} params.userSex 性别(0男 1女 2不详)
 * @param {number} params.userAge 年龄
 * @param {string} params.userPhone 电话
 * @param {string} params.userIde 角色
 * @param {string} params.userAddress 地址
 * @param {number} params.userState 状态(1 正常 0 禁用)
 * @returns
 */
export function insertUser(params: InsertUserParams): Promise<InsertUserRes> {
    return request.post(`/userEntity/insert`, params);
}

// 响应接口
export interface ImportExcelUserRes {
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
export function importExcelUser(file: object): Promise<ImportExcelUserRes> {
    return request.post(`/userEntity/importExcel`, file);
}

// 响应接口
export interface ExportExcelUserRes {
}

/**
 * 导出数据
 * @returns
 */
export function exportExcelUser(): Promise<ExportExcelUserRes> {
    return request.post(`/userEntity/exportExcel`, {}, {
        responseType: 'arraybuffer',
        headers: {'Content-Type': ' application/octet-stream'}
    });
}

// 参数接口
export interface ExistUserParams {
    id?: number;
}

// 响应接口
export interface ExistUserRes {
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
export function existUser(params: ExistUserParams): Promise<ExistUserRes> {
    return request.post(`/userEntity/exist`, params);
}

// 参数接口
export interface DeleteUserParams {
    id?: number;
}

// 响应接口
export interface DeleteUserRes {
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
export function deleteUser(params: DeleteUserParams): Promise<DeleteUserRes> {
    return request.post(`/userEntity/delete`, params);
}

// 参数接口
export interface SelectUserParams {
    id?: number;
}

// 响应接口
export interface SelectUserRes {
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
export function selectUser(params: SelectUserParams): Promise<SelectUserRes> {
    return request.post(`/userEntity/select`, params);
}