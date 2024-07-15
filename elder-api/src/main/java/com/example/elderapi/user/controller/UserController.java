package com.example.elderapi.user.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.elderapi.common.resp.Result;
import com.example.elderapi.common.utils.JWTUtils;
import com.example.elderapi.user.entity.UserEntity;
import com.example.elderapi.user.mapper.UserMapper;
import com.example.elderapi.user.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpSession;
import lombok.Data;
import org.springframework.beans.BeanUtils;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Objects;

/**
 * <p>
 * 用户 前端控制器
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Tag(name = "用户 前端控制器")
@RestController
@RequestMapping("/userEntity")
public class UserController {

    private final UserService service;
    private final UserMapper mapper;

    public UserController(UserService service, UserMapper mapper) {
        this.service = service;
        this.mapper = mapper;
    }

    @Operation(summary = "列表")
    @GetMapping("/userList")
    public Result<?> userList() {
        return Result.success(service.list());
    }

    @Data
    static class User {
        private String pic;
        private String acc;
        private String pwd;
        private String name;
        private String sex;
        private Integer age;
        private String phone;
        private String address;
    }

    @Operation(summary = "新增")
    @PostMapping("/userAppend")
    public Result<?> userAppend(@RequestBody User user) {
        QueryWrapper<UserEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("user_name", user.getName());
        if (service.getOne(wrapper) != null) {
            return Result.failure("名称已存在");
        }
        wrapper.eq("user_acc", user.getAcc());
        if (service.getOne(wrapper) != null) {
            return Result.failure("账号已存在");
        }
        UserEntity entity = new UserEntity();
        BeanUtils.copyProperties(user, entity);
        return Result.success(service.save(entity));
    }

    @Operation(summary = "删除")
    @PostMapping("/userDelete")
    public Result<?> userDelete(@RequestParam Integer id) {
        return Result.success(service.removeById(id));
    }

    @Operation(summary = "编辑")
    @PostMapping("/userEditor")
    public Result<?> userEditor(@RequestBody UserEntity userEntity) {
//        userEntity.setPwd(DigestUtils.md5DigestAsHex(userEntity.getPwd().getBytes(StandardCharsets.UTF_8)));
        QueryWrapper<UserEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id", userEntity.getId());
        //修改过名称
//        if (!Objects.equals(service.getOne(wrapper).getName(), userEntity.getName())) {
//            QueryWrapper<UserEntity> queryWrapper = new QueryWrapper<>();
//            queryWrapper.eq("user_name", userEntity.getName());
//            if (service.count(queryWrapper) != 0) {
//                return Result.failure("名称已存在");
//            }
//        }
        if (service.updateById(userEntity)) {
            UserEntity entity = service.getOne(wrapper);
            return Result.success(entity);
        }
        return Result.success("系统超时，失败");
    }

    @Operation(summary = "搜索")
    @PostMapping("/userSearch")
    public Result<?> userSearch(@RequestParam String name) {
        QueryWrapper<UserEntity> wrapper = new QueryWrapper<>();
        wrapper.like("user_name", name);
        return Result.success(mapper.selectList(wrapper));
    }

    @Operation(summary = "登录")
    @PostMapping("/userLogin")
    public Result<?> userLogin(@RequestParam String acc, @RequestParam String pwd, @RequestParam String code, HttpSession session) {
        if (!session.getAttribute("code").equals(code)) {
            return Result.failure("验证码错误");
        }
        QueryWrapper<UserEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("user_acc", acc);
        UserEntity user = service.getOne(wrapper);
        if (user == null) {
            return Result.failure("账号不存在，登陆失败");
        }
        if (user.getStatus() == 0) {
            return Result.failure("账号状态异常，请联系管理员处理");
        }
        pwd = DigestUtils.md5DigestAsHex(pwd.getBytes(StandardCharsets.UTF_8));
        if (!pwd.equals(user.getPwd())) {
            return Result.failure("密码错误，登陆失败");
        }
        HashMap<String, String> map = new HashMap<>();
        map.put("id", user.getId().toString());
        map.put("acc", user.getAcc());
        map.put("name", user.getName());
        String token = JWTUtils.generateToken(map);
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("token", token);
        hashMap.put("user", user);
        return Result.success("登录成功", hashMap);
    }

    @Operation(summary = "注册")
    @PostMapping("/userRegist")
    public Result<?> userRegist(@RequestParam String acc, @RequestParam String pwd, @RequestParam String name, @RequestParam String code, HttpSession session) {
        if (!session.getAttribute("code").equals(code)) {
            return Result.failure("验证码错误");
        }
        QueryWrapper<UserEntity> wrapperA = new QueryWrapper<>();
        wrapperA.eq("user_acc", acc);
        UserEntity userA = service.getOne(wrapperA);
        if (userA != null) {
            return Result.failure("账号已存在，注册失败");
        }
        UserEntity user = new UserEntity();
        pwd = DigestUtils.md5DigestAsHex(pwd.getBytes(StandardCharsets.UTF_8));
        user.setAcc(acc).setPhone(acc).setPwd(pwd).setName(name);
        if (service.save(user)) {
            return Result.success("注册成功，请返回登录");
        }
        return Result.success("系统超时，注册失败");
    }

    @Operation(summary = "找回密码")
    @PostMapping("/userForget")
    public Result<?> userForget(@RequestParam String acc, @RequestParam String pwd, @RequestParam String code, HttpSession session) {
        if (!session.getAttribute("code").equals(code)) {
            return Result.failure("验证码错误");
        }
        HashMap<String, Object> hashMap = new HashMap<>();
        return Result.success("登录成功", hashMap);
    }

    @Operation(summary = "修改密码")
    @PostMapping("/userChange")
    public Result<?> userChange(@RequestParam String id, @RequestParam String oldPwd, @RequestParam String newPwd) {
        UserEntity user = service.getById(id);
        oldPwd = DigestUtils.md5DigestAsHex(oldPwd.getBytes(StandardCharsets.UTF_8));
        if (!oldPwd.equals(user.getPwd())) {
            return Result.failure("原密码错误");
        }
        newPwd = DigestUtils.md5DigestAsHex(newPwd.getBytes(StandardCharsets.UTF_8));
        user.setPwd(newPwd);
        if (service.updateById(user)) {
            return Result.success("成功,请重新登陆");
        }
        return Result.success("系统超时，失败");
    }

}
