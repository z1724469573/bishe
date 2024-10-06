package com.example.elderapi.manager.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.elderapi.common.annotate.JwtToken;
import com.example.elderapi.common.resp.Result;
import com.example.elderapi.common.utils.JWTUtils;
import com.example.elderapi.user.entity.ManagerEntity;
import com.example.elderapi.user.entity.UserEntity;
import com.example.elderapi.user.mapper.ManagerMapper;
import com.example.elderapi.user.service.ManagerService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpSession;
import lombok.Data;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Objects;

/**
 * <p>
 * 管理员 前端控制器
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Tag(name = "管理员 前端控制器")
@RestController
@RequestMapping("/managerEntity")
public class ManagerController {

    private final ManagerService service;
    private final ManagerMapper mapper;

    public ManagerController(ManagerService service, ManagerMapper mapper) {
        this.service = service;
        this.mapper = mapper;
    }

    @JwtToken
    @Operation(summary = "列表")
    @GetMapping("/managerList")
    public Result<?> managerList() {
        return Result.success(service.list());
    }

    @Data
    static class Manager {
        private String acc;
        private String pwd;
        private String name;
        private String sex;
        private Integer age;
        private String phone;
        private String address;
    }

    @JwtToken
    @Operation(summary = "新增")
    @PostMapping("/managerAppend")
    public Result<?> managerAppend(@RequestBody Manager manager) {
        QueryWrapper<ManagerEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("manager_name", manager.getName());
        if (service.getOne(wrapper) != null) {
            return Result.failure("名称已存在");
        }
        wrapper.eq("manager_acc", manager.getAcc());
        if (service.getOne(wrapper) != null) {
            return Result.failure("账号已存在");
        }
        ManagerEntity entity = new ManagerEntity();
        BeanUtils.copyProperties(manager, entity);
        return Result.success(service.save(entity));
    }

    @JwtToken
    @Operation(summary = "删除")
    @PostMapping("/managerDelete")
    public Result<?> managerDelete(@RequestParam Integer id) {
        return Result.success(service.removeById(id));
    }

    @JwtToken
    @Operation(summary = "编辑")
    @PostMapping("/managerEditor")
    public Result<?> managerEditor(@RequestBody ManagerEntity managerEntity) {
        QueryWrapper<ManagerEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("manager_id", managerEntity.getId());
        //修改过名称
        if (!Objects.equals(service.getOne(wrapper).getName(), managerEntity.getName())) {
            QueryWrapper<ManagerEntity> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("manager_name", managerEntity.getName());
            if (service.count(queryWrapper) != 0) {
                return Result.failure("名称已存在");
            }
        }
        return Result.success(service.updateById(managerEntity));
    }

    @JwtToken
    @Operation(summary = "搜索")
    @PostMapping("/managerSearch")
    public Result<?> managerSearch(@RequestParam String name) {
        QueryWrapper<ManagerEntity> wrapper = new QueryWrapper<>();
        wrapper.like("manager_name", name);
        return Result.success(mapper.selectList(wrapper));
    }

    @Operation(summary = "登录")
    @PostMapping("/managerLogin")
    public Result<?> managerLogin(@RequestParam String acc, @RequestParam String pwd, @RequestParam String code, HttpSession session) {
        if (ObjectUtils.isEmpty(session.getAttribute("code"))) {
            return Result.failure("验证码生成错误");
        }
        if (!session.getAttribute("code").equals(code)) {
            return Result.failure("验证码错误");
        }
        QueryWrapper<ManagerEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("manager_acc", acc);
        ManagerEntity manager = service.getOne(wrapper);
        if (manager == null) {
            return Result.failure("账号不存在，登陆失败");
        }
        if (manager.getStatus() == 0) {
            return Result.failure("账号状态异常，请联系管理员处理");
        }
        pwd = DigestUtils.md5DigestAsHex(pwd.getBytes(StandardCharsets.UTF_8));
        if (!pwd.equals(manager.getPwd())) {
            return Result.failure("密码错误，登陆失败");
        }
        HashMap<String, String> map = new HashMap<>();
        map.put("id", manager.getId().toString());
        map.put("acc", manager.getAcc());
        map.put("name", manager.getName());
        String token = JWTUtils.generateToken(map);
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("token", token);
        hashMap.put("manager", manager);
        return Result.success("登录成功", hashMap);
    }

}
