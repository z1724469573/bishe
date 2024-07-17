import request from "@/request";

// 响应接口
export interface ActiveShAppendRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 新增
 * @param {string} activeId
 * @param {string} userId
 * @returns
 */
export function activeShAppend(activeId: number, userId: number): Promise<ActiveShAppendRes> {
    return request.post(`/activeShEntity/activeShAppend?activeId=${activeId}&userId=${userId}`);
}

// 响应接口
export interface ActiveShMyselfRes {
    message: string;
    success: boolean;
    code: number;
    data: any;
}

/**
 * 报名人
 * @param {string} userId
 * @returns
 */
export function activeShMyself(userId: number): Promise<ActiveShMyselfRes> {
    return request.post(`/activeShEntity/activeShMyself?userId=${userId}`);
}

// 响应接口
export interface ActiveShDeleteRes {
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
export function activeShDelete(id: number): Promise<ActiveShDeleteRes> {
    return request.post(`/activeShEntity/activeShDelete?id=${id}`);
}

