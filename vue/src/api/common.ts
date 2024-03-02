import request from "@/request";

// 响应接口
export interface GenerateImageCodeRes {
}

/**
 * 生成验证码
 * @returns
 */
export function generateImageCode(): Promise<GenerateImageCodeRes> {
    return request.get(`/commonEntity/generateImageCode`, {
        responseType: "arraybuffer",
    });
}

// 参数接口
export interface LoginParams {
    userAcc?: string;
    userPwd?: string;
    code?: string;
    userIde?: string;
}

// 响应接口
export interface LoginRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 登录
 * @param {object} params LoginParam
 * @param {string} params.userAcc 账号
 * @param {string} params.userPwd 密码
 * @param {string} params.code 验证码
 * @param {string} params.userIde 角色
 * @returns
 */
export function login(params: LoginParams): Promise<LoginRes> {
    return request.post(`/commonEntity/login`, params);
}



// 参数接口
export interface RegistParams {
    userAcc?: string;
    userPwd?: string;
    userIde?: string;
}

// 响应接口
export interface RegistRes {
    message: string;
    success: boolean;
    code: number;
    data: Record<string, unknown>;
}

/**
 * 注册
 * @param {object} params RegistParam
 * @param {string} params.userAcc 账号
 * @param {string} params.userPwd 密码
 * @param {string} params.userIde 角色
 * @returns
 */
export function regist(params: RegistParams): Promise<RegistRes> {
    return request.post(`/commonEntity/regist`, params);
}
