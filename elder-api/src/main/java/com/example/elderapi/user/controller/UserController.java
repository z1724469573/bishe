package com.example.elderapi.user.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.elderapi.common.resp.Result;
import com.example.elderapi.user.entity.UserEntity;
import com.example.elderapi.user.mapper.UserMapper;
import com.example.elderapi.user.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Data;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

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
        QueryWrapper<UserEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id", userEntity.getId());
        //修改过名称
        if (!Objects.equals(service.getOne(wrapper).getName(), userEntity.getName())) {
            QueryWrapper<UserEntity> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("user_name", userEntity.getName());
            if (service.count(queryWrapper) != 0) {
                return Result.failure("名称已存在");
            }
        }
        return Result.success(service.updateById(userEntity));
    }

    @Operation(summary = "搜索")
    @PostMapping("/userSearch")
    public Result<?> userSearch(@RequestParam String name) {
        QueryWrapper<UserEntity> wrapper = new QueryWrapper<>();
        wrapper.like("user_name", name);
        return Result.success(mapper.selectList(wrapper));
    }

}
