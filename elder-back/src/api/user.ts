import request from "@/request";

// 参数接口
export interface UpdateUserParams {
    id?: number;
    acc?: string;
    pwd?: string;
    name?: string;
    sex?: number;
    roleId?: number;
    roleName?: string;
    birth?: string;
    createBy?: string;
    createTime?: string;
    updateBy?: string;
    updateTime?: string;
    undock?: number;
    unlucky?: number;
    remark?: string;
}

// 响应接口
export interface UpdateUserRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 修改编号
 * @param {object} params $!{table.comment}
 * @param {number} params.id 编号
 * @param {string} params.acc 账号
 * @param {string} params.pwd 密码
 * @param {string} params.name 姓名
 * @param {number} params.sex 性别（0-男 1-女）
 * @param {number} params.roleId 角色
 * @param {string} params.roleName 角色名称
 * @param {string} params.birth 出生日期
 * @param {string} params.createBy 创建者
 * @param {string} params.createTime 创建时间
 * @param {string} params.updateBy 更新者
 * @param {string} params.updateTime 更新时间
 * @param {number} params.undock 伪删除（0-已 1-未）
 * @param {number} params.unlucky 状态（0-禁用 1-正常）
 * @param {string} params.remark 备注
 * @returns
 */
export function updateUser(params: UpdateUserParams): Promise<UpdateUserRes> {
    return request.post(`/userEntity/update`, params);
}

// 响应接口
export interface RecoverListUserRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 恢复列表
 * @returns
 */
export function recoverListUser(): Promise<RecoverListUserRes> {
    return request.post(`/userEntity/recoverList`);
}

// 响应接口
export interface RecoverUserRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 恢复数据
 * @param {string} param
 * @returns
 */
export function recoverUser(param: string): Promise<RecoverUserRes> {
    return request.post(`/userEntity/recover/${param}`);
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
    return request.post(`/userEntity/listPageUser?page=${page}&pageSize=${pageSize}`);
}

// 参数接口
export interface InsertUserParams {
    id?: number;
    acc?: string;
    pwd?: string;
    name?: string;
    sex?: number;
    roleId?: number;
    roleName?: string;
    birth?: string;
    createBy?: string;
    createTime?: string;
    updateBy?: string;
    updateTime?: string;
    undock?: number;
    unlucky?: number;
    remark?: string;
}

// 响应接口
export interface InsertUserRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 保存数据
 * @param {object} params $!{table.comment}
 * @param {number} params.id 编号
 * @param {string} params.acc 账号
 * @param {string} params.pwd 密码
 * @param {string} params.name 姓名
 * @param {number} params.sex 性别（0-男 1-女）
 * @param {number} params.roleId 角色
 * @param {string} params.roleName 角色名称
 * @param {string} params.birth 出生日期
 * @param {string} params.createBy 创建者
 * @param {string} params.createTime 创建时间
 * @param {string} params.updateBy 更新者
 * @param {string} params.updateTime 更新时间
 * @param {number} params.undock 伪删除（0-已 1-未）
 * @param {number} params.unlucky 状态（0-禁用 1-正常）
 * @param {string} params.remark 备注
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

// 参数接口
export interface FindUserParams {
    id?: number;
    acc?: string;
    pwd?: string;
    name?: string;
    sex?: string;
    roleId?: number;
    roleName?: string;
    birth?: string;
    createBy?: string;
    createTime?: string;
    updateBy?: string;
    updateTime?: string;
    undock?: number;
    unlucky?: number;
    remark?: string;
}

// 响应接口
export interface FindUserRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 条件查询
 * @param {object} params $!{table.comment}
 * @param {number} params.id 编号
 * @param {string} params.acc 账号
 * @param {string} params.pwd 密码
 * @param {string} params.name 姓名
 * @param {number} params.sex 性别（0-男 1-女）
 * @param {number} params.roleId 角色
 * @param {string} params.roleName 角色名称
 * @param {string} params.birth 出生日期
 * @param {string} params.createBy 创建者
 * @param {string} params.createTime 创建时间
 * @param {string} params.updateBy 更新者
 * @param {string} params.updateTime 更新时间
 * @param {number} params.undock 伪删除（0-已 1-未）
 * @param {number} params.unlucky 状态（0-禁用 1-正常）
 * @param {string} params.remark 备注
 * @returns
 */
export function findUser(params: FindUserParams): Promise<FindUserRes> {
    return request.post(`/userEntity/findUser`, params);
}

// 响应接口
export interface FindByNameUserRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 查询名称
 * @param {string} param
 * @returns
 */
export function findByNameUser(param: string): Promise<FindByNameUserRes> {
    return request.post(`/userEntity/findByNameUser/${param}`);
}

// 响应接口
export interface FindByIDUserRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 查询编号
 * @param {string} param
 * @returns
 */
export function findByIDUser(param: string): Promise<FindByIDUserRes> {
    return request.post(`/userEntity/findByIDUser/${param}`);
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
        responseType: "blob"
    });
}

// 响应接口
export interface DeleteTempUserRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 暂时删除
 * @param {string} param
 * @returns
 */
export function deleteTempUser(param: string): Promise<DeleteTempUserRes> {
    return request.post(`/userEntity/deleteTemp/${param}`);
}

// 响应接口
export interface DeleteUserRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 永久删除
 * @param {string} param
 * @returns
 */
export function deleteUser(param: string): Promise<DeleteUserRes> {
    return request.post(`/userEntity/delete/${param}`);
}

// 响应接口
export interface ListUsersRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 列表
 * @returns
 */
export function listUsers(): Promise<ListUsersRes> {
    return request.post(`/userEntity/listUsers`);
}