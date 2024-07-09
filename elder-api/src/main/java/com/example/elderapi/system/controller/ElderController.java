package com.example.elderapi.system.controller;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.elderapi.common.resp.Result;
import com.example.elderapi.system.entity.ElderEntity;
import com.example.elderapi.system.mapper.ElderMapper;
import com.example.elderapi.system.service.ElderService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Data;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 养老院 前端控制器
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Tag(name = "养老院 前端控制器")
@RestController
@RequestMapping("/elderEntity")
public class ElderController {

    private final ElderService service;
    private final ElderMapper mapper;

    public ElderController(ElderService service, ElderMapper mapper) {
        this.service = service;
        this.mapper = mapper;
    }

    @Operation(summary = "列表")
    @GetMapping("/elderList")
    public Result<?> elderList() {
        return Result.success(service.list());
    }

    @Data
    static class Elder {
        private String name;
        private String content;
        private String tag;
        private Integer price;
        private String address;
        private String date;
        private String cover;
        private Integer bed;
        private Integer area;
        private String phone;
        private String jd;
        private String wd;
    }

    @Operation(summary = "新增")
    @PostMapping("/elderAppend")
    public Result<?> elderAppend(@RequestBody ElderController.Elder elder) {
        QueryWrapper<ElderEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("elder_name", elder.getName());
        if (service.getOne(wrapper) != null) {
            return Result.failure("名称已存在");
        }
        ElderEntity entity = new ElderEntity();
        entity.setName(elder.getName());
        return Result.success(service.save(entity));
    }

    @Operation(summary = "删除")
    @PostMapping("/elderDelete")
    public Result<?> elderDelete(@RequestParam Integer id) {
        return Result.success(service.removeById(id));
    }

    @Operation(summary = "编辑")
    @PostMapping("/elderEditor")
    public Result<?> elderEditor(@RequestBody ElderEntity elderEntity) {
        return Result.success(service.updateById(elderEntity));
    }

    @Operation(summary = "搜索")
    @PostMapping("/elderSearch")
    public Result<?> elderSearch(@RequestParam String name) {
        QueryWrapper<ElderEntity> wrapper = new QueryWrapper<>();
        wrapper.like("elder_name", name);
        return Result.success(mapper.selectList(wrapper));
    }

}
