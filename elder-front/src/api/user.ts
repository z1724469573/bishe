import request from "@/request";
// 响应接口
export interface UserListRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 列表
 * @returns
 */
export function userList(): Promise<UserListRes> {
    return request.get(`/userEntity/userList`);
}

// 参数接口
export interface UserAppendParams {
    acc?: string;
    pwd?: string;
    name?: string;
    sex?: string;
    age?: number;
    phone?: string;
    address?: string;
}

// 响应接口
export interface UserAppendRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 新增
 * @param {object} params User
 * @param {string} params.acc
 * @param {string} params.pwd
 * @param {string} params.name
 * @param {string} params.sex
 * @param {number} params.age
 * @param {string} params.phone
 * @param {string} params.address
 * @returns
 */
export function userAppend(params: UserAppendParams): Promise<UserAppendRes> {
    return request.post(`/userEntity/userAppend`, params);
}

// 响应接口
export interface UserDeleteRes {
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
export function userDelete(id: number): Promise<UserDeleteRes> {
    return request.post(`/userEntity/userDelete?id=${id}`);
}

// 参数接口
export interface UserEditorParams {
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
export interface UserEditorRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
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
export function userEditor(params: UserEditorParams): Promise<UserEditorRes> {
    return request.post(`/userEntity/userEditor`, params);
}

// 响应接口
export interface UserSearchRes {
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
export function userSearch(name: string): Promise<UserSearchRes> {
    return request.post(`/userEntity/userSearch?name=${name}`);
}

// 响应接口
export interface UserLoginRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 登录
 * @param {string} acc
 * @param {string} pwd
 * @param {string} code
 * @returns
 */
export function userLogin(acc: string, pwd: string, code: string): Promise<UserLoginRes> {
    return request.post(`/userEntity/userLogin?acc=${acc}&pwd=${pwd}&code=${code}`);
}

// 响应接口
export interface UserRegistRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 注册
 * @param {string} acc
 * @param {string} pwd
 * @param {string} name
 * @param {string} code
 * @returns
 */
export function userRegist(acc: string, pwd: string, name: string, code: string): Promise<UserRegistRes> {
    return request.post(`/userEntity/userRegist?acc=${acc}&pwd=${pwd}&name=${name}&code=${code}`);
}

// 响应接口
export interface UserChangeRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 修改密码
 * @param {string} id
 * @param {string} oldPwd
 * @param {string} newPwd
 * @returns
 */
export function userChange(id: string, oldPwd: string, newPwd: string): Promise<UserChangeRes> {
    return request.post(`/userEntity/userChange?id=${id}&oldPwd=${oldPwd}&newPwd=${newPwd}`);
}

