import request from "@/request";

// 响应接口
export interface UploadRes {
}

/**
 * 上传图片
 * @param {string} file
 * @returns
 */
export function upload(file: object): Promise<UploadRes> {
    return request.post(`/upload`, file);
}


