package com.example.elderapi.system.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.elderapi.common.resp.Result;
import com.example.elderapi.system.entity.SortEntity;
import com.example.elderapi.system.entity.SortNewsEntity;
import com.example.elderapi.system.mapper.SortNewsMapper;
import com.example.elderapi.system.service.SortNewsService;
import com.example.elderapi.system.service.SortService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Data;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 资讯 前端控制器
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Tag(name = "资讯 前端控制器")
@RestController
@RequestMapping("/sortNewsEntity")
public class SortNewsController {

    private final SortNewsService service;
    private final SortNewsMapper mapper;
    private final SortService sortService;

    public SortNewsController(SortNewsService service, SortNewsMapper mapper, SortService sortService) {
        this.service = service;
        this.mapper = mapper;
        this.sortService = sortService;
    }

    @Operation(summary = "最新")
    @GetMapping("/sortNewsLate")
    public Result<?> sortNewsLate() {
        ArrayList<SortNewsRs> listRs = new ArrayList<>();
        QueryWrapper<SortNewsEntity> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("news_date");
        List<SortNewsEntity> list = mapper.selectList(wrapper);
        for (int i = 0; i < list.size(); i++) {
            SortNewsRs newsRs = new SortNewsRs();
            Integer sortId = list.get(i).getSortId();
            SortEntity sort = sortService.getById(sortId);
            BeanUtils.copyProperties(list.get(i), newsRs);
            newsRs.setSortName(sort.getName());
            listRs.add(newsRs);
        }
        return Result.success(listRs);
    }

    @Operation(summary = "最热")
    @GetMapping("/sortNewsHots")
    public Result<?> sortNewsHots() {
        ArrayList<SortNewsRs> listRs = new ArrayList<>();
        QueryWrapper<SortNewsEntity> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("news_looks");
        List<SortNewsEntity> list = mapper.selectList(wrapper);
        for (int i = 0; i < list.size(); i++) {
            SortNewsRs newsRs = new SortNewsRs();
            Integer sortId = list.get(i).getSortId();
            SortEntity sort = sortService.getById(sortId);
            BeanUtils.copyProperties(list.get(i), newsRs);
            newsRs.setSortName(sort.getName());
            listRs.add(newsRs);
        }
        return Result.success(listRs);
    }

    @Data
    static class SortNewsRs {
        private Integer id;
        private Integer sortId;
        private String sortName;
        private String title;
        private String content;
        private String date;
        private String cover;
        private Integer looks;
        private Integer status;
    }

    @Operation(summary = "列表")
    @GetMapping("/sortNewsList")
    public Result<?> sortNewsList() {
        ArrayList<SortNewsRs> listRs = new ArrayList<>();
        List<SortNewsEntity> list = service.list();
        for (int i = 0; i < list.size(); i++) {
            SortNewsRs newsRs = new SortNewsRs();
            Integer sortId = list.get(i).getSortId();
            SortEntity sort = sortService.getById(sortId);
            BeanUtils.copyProperties(list.get(i), newsRs);
            newsRs.setSortName(sort.getName());
            listRs.add(newsRs);
        }
        return Result.success(listRs);
    }

    @Data
    static class SortNews {
        private Integer sortId;
        private String title;
        private String content;
        private String date;
        private String cover;
        private Integer looks;
    }

    @Operation(summary = "新增")
    @PostMapping("/sortNewsAppend")
    public Result<?> sortNewsAppend(@RequestBody SortNews sortNews) {
        QueryWrapper<SortNewsEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("news_title", sortNews.getTitle());
        if (service.getOne(wrapper) != null) {
            return Result.failure("名称已存在");
        }
        SortNewsEntity entity = new SortNewsEntity();
        BeanUtils.copyProperties(sortNews, entity);
        return Result.success(service.save(entity));
    }

    @Operation(summary = "删除")
    @PostMapping("/sortNewsDelete")
    public Result<?> sortNewsDelete(@RequestParam Integer id) {
        return Result.success(service.removeById(id));
    }

    @Operation(summary = "编辑")
    @PostMapping("/sortNewsEditor")
    public Result<?> sortNewsEditor(@RequestBody SortNewsEntity sortNewsEntity) {
        return Result.success(service.updateById(sortNewsEntity));
    }

    @Operation(summary = "搜索")
    @PostMapping("/sortNewsSearch")
    public Result<?> sortNewsSearch(@RequestParam String name) {
        QueryWrapper<SortNewsEntity> wrapper = new QueryWrapper<>();
        wrapper.like("news_title", name);
        return Result.success(mapper.selectList(wrapper));
    }

}
