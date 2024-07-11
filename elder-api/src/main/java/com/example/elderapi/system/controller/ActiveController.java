package com.example.elderapi.system.controller;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.elderapi.common.resp.Result;
import com.example.elderapi.system.entity.ActiveEntity;
import com.example.elderapi.system.mapper.ActiveMapper;
import com.example.elderapi.system.service.ActiveService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Data;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 活动 前端控制器
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Tag(name = "活动 前端控制器")
@RestController
@RequestMapping("/activeEntity")
public class ActiveController {

    private final ActiveService service;
    private final ActiveMapper mapper;

    public ActiveController(ActiveService service, ActiveMapper mapper) {
        this.service = service;
        this.mapper = mapper;
    }

    @Operation(summary = "列表")
    @GetMapping("/activeList")
    public Result<?> activeList() {
        return Result.success(service.list());
    }

    @Data
    static class Active {
        private String name;
        private String start;
        private String end;
        private String address;
        private String phone;
        private String content;
        private String cover;
    }

    @Operation(summary = "新增")
    @PostMapping("/activeAppend")
    public Result<?> activeAppend(@RequestBody Active active) {
        QueryWrapper<ActiveEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("active_name", active.getName());
        if (service.getOne(wrapper) != null) {
            return Result.failure("名称已存在");
        }
        ActiveEntity entity = new ActiveEntity();
        BeanUtils.copyProperties(active, entity);
        return Result.success(service.save(entity));
    }

    @Operation(summary = "删除")
    @PostMapping("/activeDelete")
    public Result<?> activeDelete(@RequestParam Integer id) {
        return Result.success(service.removeById(id));
    }

    @Operation(summary = "编辑")
    @PostMapping("/activeEditor")
    public Result<?> activeEditor(@RequestBody ActiveEntity activeEntity) {
        return Result.success(service.updateById(activeEntity));
    }

    @Operation(summary = "搜索")
    @PostMapping("/activeSearch")
    public Result<?> activeSearch(@RequestParam String name) {
        QueryWrapper<ActiveEntity> wrapper = new QueryWrapper<>();
        wrapper.like("active_name", name);
        return Result.success(mapper.selectList(wrapper));
    }

}
