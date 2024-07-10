package com.example.elderapi.manager.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.elderapi.common.resp.Result;
import com.example.elderapi.user.entity.ManagerEntity;
import com.example.elderapi.user.entity.UserEntity;
import com.example.elderapi.user.mapper.ManagerMapper;
import com.example.elderapi.user.service.ManagerService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Data;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

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

    @Operation(summary = "删除")
    @PostMapping("/managerDelete")
    public Result<?> managerDelete(@RequestParam Integer id) {
        return Result.success(service.removeById(id));
    }

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

    @Operation(summary = "搜索")
    @PostMapping("/managerSearch")
    public Result<?> managerSearch(@RequestParam String name) {
        QueryWrapper<ManagerEntity> wrapper = new QueryWrapper<>();
        wrapper.like("manager_name", name);
        return Result.success(mapper.selectList(wrapper));
    }


}
