package com.example.elderapi.system.controller;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.elderapi.common.resp.Result;
import com.example.elderapi.system.entity.ServeEntity;
import com.example.elderapi.system.mapper.ServeMapper;
import com.example.elderapi.system.service.ServeService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Data;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 服务 前端控制器
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Tag(name = "服务 前端控制器")
@RestController
@RequestMapping("/serveEntity")
public class ServeController {

    private final ServeService service;
    private final ServeMapper mapper;

    public ServeController(ServeService service, ServeMapper mapper) {
        this.service = service;
        this.mapper = mapper;
    }

    @Operation(summary = "列表")
    @GetMapping("/serveList")
    public Result<?> serveList() {
        return Result.success(service.list());
    }

    @Data
    static class Serve {
        private String name;
        private String cover;
        private String content;
    }

    @Operation(summary = "新增")
    @PostMapping("/serveAppend")
    public Result<?> serveAppend(@RequestBody Serve serve) {
        QueryWrapper<ServeEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("serve_name", serve.getName());
        if (service.getOne(wrapper) != null) {
            return Result.failure("名称已存在");
        }
        ServeEntity entity = new ServeEntity();
        entity.setName(serve.getName());
        return Result.success(service.save(entity));
    }

    @Operation(summary = "删除")
    @PostMapping("/serveDelete")
    public Result<?> serveDelete(@RequestParam Integer id) {
        return Result.success(service.removeById(id));
    }

    @Operation(summary = "编辑")
    @PostMapping("/serveEditor")
    public Result<?> serveEditor(@RequestBody ServeEntity serveEntity) {
        return Result.success(service.updateById(serveEntity));
    }

    @Operation(summary = "搜索")
    @PostMapping("/serveSearch")
    public Result<?> serveSearch(@RequestParam String name) {
        QueryWrapper<ServeEntity> wrapper = new QueryWrapper<>();
        wrapper.like("serve_name", name);
        return Result.success(mapper.selectList(wrapper));
    }

}
