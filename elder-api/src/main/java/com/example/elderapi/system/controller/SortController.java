package com.example.elderapi.system.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.elderapi.common.resp.Result;
import com.example.elderapi.system.entity.SortEntity;
import com.example.elderapi.system.mapper.SortMapper;
import com.example.elderapi.system.service.SortService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Data;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 类别 前端控制器
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Tag(name = "类别 前端控制器")
@RestController
@RequestMapping("/sortEntity")
public class SortController {

    private final SortService service;
    private final SortMapper mapper;

    public SortController(SortService service, SortMapper mapper) {
        this.service = service;
        this.mapper = mapper;
    }

    @Operation(summary = "列表")
    @GetMapping("/sortList")
    public Result<?> sortList() {
        return Result.success(service.list());
    }

    @Data
    static class Sort {
        private String name;
    }

    @Operation(summary = "新增")
    @PostMapping("/sortAppend")
    public Result<?> sortAppend(@RequestBody Sort sort) {
        QueryWrapper<SortEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("sort_name", sort.getName());
        if (service.getOne(wrapper) != null) {
            return Result.failure("名称已存在");
        }
        SortEntity entity = new SortEntity();
        entity.setName(sort.getName());
        return Result.success(service.save(entity));
    }

    @Operation(summary = "删除")
    @PostMapping("/sortDelete")
    public Result<?> sortDelete(@RequestParam Integer id) {
        return Result.success(service.removeById(id));
    }

    @Operation(summary = "编辑")
    @PostMapping("/sortEditor")
    public Result<?> sortEditor(@RequestBody SortEntity sortEntity) {
        return Result.success(service.updateById(sortEntity));
    }

    @Operation(summary = "搜索")
    @PostMapping("/sortSearch")
    public Result<?> sortSearch(@RequestParam String name) {
        QueryWrapper<SortEntity> wrapper = new QueryWrapper<>();
        wrapper.like("sort_name", name);
        return Result.success(mapper.selectList(wrapper));
    }

}
