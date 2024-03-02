package com.example.common.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.common.req.LoginParam;
import com.example.common.req.RegistParam;
import com.example.common.resp.Result;
import com.example.common.utils.VerifyCodeUtils;
import com.example.springboot.entity.UserEntity;
import com.example.springboot.mapper.UserMapper;
import com.example.springboot.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Date;
import java.util.Objects;

/**
 * <p>
 * 养老院表 前端控制器
 * </p>
 *
 * @author xiaohe
 * @since 2024-02-17
 */
@Tag(name = "通用")
@RestController
@RequestMapping("/commonEntity")
public class CommonController {
    @Autowired
    private UserService commonService;
    @Autowired
    private UserMapper commonMapper;
    private final String acc = "user_acc";
    private final String role = "user_ide";

    /**
     * @param session  会话
     * @param response 返回
     * @throws IOException 校验
     */
    @Operation(summary = "生成验证码")
    @GetMapping("/generateImageCode")
    public void generateImageCode(HttpSession session, HttpServletResponse response) throws IOException {
        //随机生成四位随机数
        String code = VerifyCodeUtils.generateVerifyCode(4);
        //保存到session域中
        session.setAttribute("code", code);
        //根据随机数生成图片，reqponse响应图片
        response.setContentType("image/png");
        ServletOutputStream os = response.getOutputStream();
        VerifyCodeUtils.outputImage(130, 60, os, code);
    }


    /**
     * @param param   数据
     * @param session 会话
     * @return 返回
     */
    @Operation(summary = "登录")
    @PostMapping("/login")
    public Result login(@RequestBody @Validated LoginParam param, HttpSession session) {
        QueryWrapper<UserEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(acc, param.getUserAcc()).eq(role, param.getUserIde());
        if (commonService.count(wrapper) == 0) return Result.failure("账号不存在", new Date());
        if (!Objects.equals(commonService.getOne(wrapper).getUserPwd(), param.getUserPwd()))
            return Result.failure("密码错误", new Date());
        if (!Objects.equals(session.getAttribute("code").toString(), param.getCode()))
            return Result.failure("验证码错误", new Date());
        return Result.success("登陆成功", new Date());
    }

    /**
     * @param param   数据
     * @param session 会话
     * @return 返回
     */
    @Operation(summary = "注册")
    @PostMapping("/regist")
    public Result regist(@RequestBody @Validated RegistParam param, HttpSession session) {
        param.setUserIde("普通用户");
        QueryWrapper<UserEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(acc, param.getUserAcc()).eq(role, param.getUserIde());
        if (commonService.count(wrapper) != 0) return Result.failure("账号已存在", new Date());
        UserEntity entity = new UserEntity();
        BeanUtils.copyProperties(param, entity);
        if (commonService.save(entity)) return Result.success("注册成功", new Date());
        return Result.failure("注册失败", new Date());
    }

}
