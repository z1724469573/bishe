package com.example.elderapi.system.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.elderapi.common.resp.Result;
import com.example.elderapi.system.entity.ActiveEntity;
import com.example.elderapi.system.entity.ActiveShEntity;
import com.example.elderapi.system.mapper.ActiveMapper;
import com.example.elderapi.system.mapper.ActiveShMapper;
import com.example.elderapi.system.service.ActiveService;
import com.example.elderapi.system.service.ActiveShService;
import com.example.elderapi.user.entity.UserEntity;
import com.example.elderapi.user.mapper.UserMapper;
import com.example.elderapi.user.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 报名 前端控制器
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Tag(name = "活动报名 前端控制器")
@RestController
@RequestMapping("/activeShEntity")
public class ActiveShController {

    private final ActiveShService service;
    private final ActiveShMapper mapper;

    public ActiveShController(ActiveShService service, ActiveShMapper mapper, ActiveService activeService, UserService userService, ActiveMapper activeMapper, UserMapper userMapper) {
        this.service = service;
        this.mapper = mapper;
        this.activeService = activeService;
        this.userService = userService;
        this.activeMapper = activeMapper;
        this.userMapper = userMapper;
    }

    @Data
    @Accessors(chain = true)
    static class ActiveShEntire {
        private Integer id;
        private Integer activeId;
        private ActiveEntity active;
        private Integer userId;
        private UserEntity user;
        private String date;
        private String checked;
        private String advice;
        private Integer status;
    }

    private final ActiveService activeService;
    private final UserService userService;

    @Operation(summary = "列表")
    @GetMapping("/activeList")
    public Result<?> activeList() {
        List<ActiveShEntity> list = service.list();
        ArrayList<ActiveShEntire> shEntires = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            ActiveShEntity entity = list.get(i);
            ActiveShEntire entire = new ActiveShEntire();
            BeanUtils.copyProperties(entity, entire);
            ActiveEntity active = activeService.getById(entity.getActiveId());
            UserEntity user = userService.getById(entity.getUserId());
            entire.setActive(active).setUser(user);
            shEntires.add(entire);
        }
        return Result.success(shEntires);
    }

    @Data
    static class ActiveSh {
        private Integer activeId;
        private Integer userId;
        private String checked;
        private String advice;
    }

    @Operation(summary = "新增")
    @PostMapping("/activeAppend")
    public Result<?> activeAppend(@RequestBody ActiveSh active) {
        ActiveShEntity entity = new ActiveShEntity();
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
    public Result<?> activeEditor(@RequestBody ActiveShEntity activeEntity) {
        return Result.success(service.updateById(activeEntity));
    }

    private final ActiveMapper activeMapper;
    private final UserMapper userMapper;

    @Operation(summary = "搜索")
    @PostMapping("/activeSearch")
    public Result<?> activeSearch(@RequestParam String name) {
        ArrayList<ActiveShEntire> list = new ArrayList<>();
        // active
        QueryWrapper<ActiveEntity> wrapperA = new QueryWrapper<>();
        wrapperA.like("active_name", name);
        List<ActiveEntity> listA = activeMapper.selectList(wrapperA);
        for (int i = 0; i < listA.size(); i++) {
            ActiveEntity active = listA.get(i);
            Integer activeId = active.getId();
            QueryWrapper<ActiveShEntity> wrapper = new QueryWrapper<>();
            wrapper.eq("sh_active_id", activeId);
            List<ActiveShEntity> entityList = mapper.selectList(wrapper);
            for (int j = 0; j < entityList.size(); j++) {
                ActiveShEntity shEntity = entityList.get(j);
                ActiveShEntire activeShEntire = new ActiveShEntire();
                BeanUtils.copyProperties(shEntity, activeShEntire);
                activeShEntire.setActive(active);
                UserEntity user = userService.getById(shEntity.getUserId());
                activeShEntire.setUser(user);
                list.add(activeShEntire);
            }
        }
        // user
        QueryWrapper<UserEntity> wrapperU = new QueryWrapper<>();
        wrapperU.like("user_name", name);
        List<UserEntity> listU = userMapper.selectList(wrapperU);
        for (int i = 0; i < listU.size(); i++) {
            UserEntity user = listU.get(i);
            Integer userId = user.getId();
            QueryWrapper<ActiveShEntity> wrapper = new QueryWrapper<>();
            wrapper.eq("sh_user_id", userId);
            List<ActiveShEntity> entityList = mapper.selectList(wrapper);
            for (int j = 0; j < entityList.size(); j++) {
                ActiveShEntity shEntity = entityList.get(j);
                ActiveShEntire activeShEntire = new ActiveShEntire();
                BeanUtils.copyProperties(shEntity, activeShEntire);
                activeShEntire.setUser(user);
                ActiveEntity active = activeService.getById(shEntity.getActiveId());
                activeShEntire.setActive(active);
                list.add(activeShEntire);
            }
        }
        return Result.success(list);
    }

}
