package com.example.elderapi.system.controller;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.elderapi.common.annotate.JwtToken;
import com.example.elderapi.common.resp.Result;
import com.example.elderapi.system.entity.NoticeEntity;
import com.example.elderapi.system.mapper.NoticeMapper;
import com.example.elderapi.system.service.NoticeService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Data;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 公告 前端控制器
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Tag(name = "公告 前端控制器")
@RestController
@RequestMapping("/noticeEntity")
public class NoticeController {

    private final NoticeService service;
    private final NoticeMapper mapper;

    public NoticeController(NoticeService service, NoticeMapper mapper) {
        this.service = service;
        this.mapper = mapper;
    }

    @JwtToken
    @Operation(summary = "列表")
    @GetMapping("/noticeList")
    public Result<?> noticeList() {
        return Result.success(service.list());
    }

    @Data
    static class Notice {
        private String name;
    }

    @JwtToken
    @Operation(summary = "新增")
    @PostMapping("/noticeAppend")
    public Result<?> noticeAppend(@RequestBody NoticeController.Notice notice) {
        QueryWrapper<NoticeEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("notice_name", notice.getName());
        if (service.getOne(wrapper) != null) {
            return Result.failure("名称已存在");
        }
        NoticeEntity entity = new NoticeEntity();
        BeanUtils.copyProperties(notice,entity);
        return Result.success(service.save(entity));
    }

    @JwtToken
    @Operation(summary = "删除")
    @PostMapping("/noticeDelete")
    public Result<?> noticeDelete(@RequestParam Integer id) {
        return Result.success(service.removeById(id));
    }

    @JwtToken
    @Operation(summary = "编辑")
    @PostMapping("/noticeEditor")
    public Result<?> noticeEditor(@RequestBody NoticeEntity noticeEntity) {
        return Result.success(service.updateById(noticeEntity));
    }

    @JwtToken
    @Operation(summary = "搜索")
    @PostMapping("/noticeSearch")
    public Result<?> noticeSearch(@RequestParam String name) {
        QueryWrapper<NoticeEntity> wrapper = new QueryWrapper<>();
        wrapper.like("notice_name", name);
        return Result.success(mapper.selectList(wrapper));
    }


}
