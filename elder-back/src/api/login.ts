import request from "@/request";

// 响应接口
export interface GenerateImageCodeRes {
}

/**
 * 生成验证码
 * @returns
 */
export function generateImageCode(): Promise<GenerateImageCodeRes> {
    return request.get(`/generateImageCode`, {
        responseType: "arraybuffer",
    });
}

// 响应接口
export interface LoginRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 用户登录
 * @param {string} acc
 * @param {string} pwd
 * @param {string} code
 * @returns
 */
export function login(acc: string, pwd: string, code: string): Promise<LoginRes> {
    return request.post(`/login?acc=${acc}&pwd=${pwd}&code=${code}`);
}

// 响应接口
export interface RegisterRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 用户注册
 * @param {string} acc
 * @param {string} pwd
 * @param {string} name
 * @param {string} sex
 * @param {string} birth
 * @param {string} code
 * @returns
 */
export function register(acc: string, pwd: string, name: string, sex: string, birth: string, code: string): Promise<RegisterRes> {
    return request.post(`/register?acc=${acc}&pwd=${pwd}&name=${name}&sex=${sex}&birth=${birth}&code=${code}`);
}

// 参数接口
export interface ForgetParams {
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
export interface ForgetRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 找回密码
 * @param {object} params $!{table.comment}
 * @param {number} params.id 编号
 * @param {string} params.acc 账号
 * @param {string} params.pwd 密码
 * @param {string} params.name 姓名
 * @param {string} params.sex 性别（男/女）
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
export function forget(params: ForgetParams): Promise<ForgetRes> {
    return request.post(`/forget`, params);
}

// 响应接口
export interface ChnagePwdRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 修改密码
 * @param {string} acc
 * @param {string} pwd
 * @param {string} newPwd
 * @returns
 */
export function chnagePwd(acc: string, pwd: string, newPwd: string): Promise<ChnagePwdRes> {
    return request.post(`/chnagePwd?acc=${acc}&pwd=${pwd}&newPwd=${newPwd}`);
}
