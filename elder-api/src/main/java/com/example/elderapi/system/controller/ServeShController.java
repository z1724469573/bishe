package com.example.elderapi.system.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.elderapi.common.resp.Result;
import com.example.elderapi.system.entity.ActiveEntity;
import com.example.elderapi.system.entity.ActiveShEntity;
import com.example.elderapi.system.entity.ServeEntity;
import com.example.elderapi.system.entity.ServeShEntity;
import com.example.elderapi.system.mapper.ServeMapper;
import com.example.elderapi.system.mapper.ServeShMapper;
import com.example.elderapi.system.service.ServeService;
import com.example.elderapi.system.service.ServeShService;
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
 * 预约 前端控制器
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Tag(name = "服务预约 前端控制器")
@RestController
@RequestMapping("/serveShEntity")
public class ServeShController {

    private final ServeShService service;
    private final ServeShMapper mapper;

    public ServeShController(ServeShService service, ServeShMapper mapper, ServeMapper serveMapper, UserMapper userMapper, ServeService serveService, UserService userService) {
        this.service = service;
        this.mapper = mapper;
        this.serveMapper = serveMapper;
        this.userMapper = userMapper;
        this.serveService = serveService;
        this.userService = userService;
    }

    @Data
    @Accessors(chain = true)
    static class ServeShEntire {
        private Integer id;
        private Integer serveId;
        private String serveName;
        private ServeEntity serve;
        private Integer userId;
        private String userName;
        private UserEntity user;
        private String date;
        private String checked;
        private String advice;
        private Integer status;
    }

    private final ServeService serveService;
    private final UserService userService;

    @Operation(summary = "列表")
    @GetMapping("/serveShList")
    public Result<?> serveShList() {
        List<ServeShEntity> list = service.list();
        ArrayList<ServeShController.ServeShEntire> shEntires = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            ServeShEntity entity = list.get(i);
            ServeShController.ServeShEntire entire = new ServeShController.ServeShEntire();
            BeanUtils.copyProperties(entity, entire);
            ServeEntity serve = serveService.getById(entity.getServeId());
            UserEntity user = userService.getById(entity.getUserId());
            entire.setServe(serve).setServeName(serve.getName());
            entire.setUser(user).setUserName(user.getName());
            shEntires.add(entire);
        }
        return Result.success(shEntires);
    }

    @Operation(summary = "新增")
    @PostMapping("/serveShAppend")
    public Result<?> serveShAppend(@RequestParam Integer serveId, @RequestParam Integer userId, @RequestParam String date) {
        ServeShEntity entity = new ServeShEntity();
        entity.setServeId(serveId).setUserId(userId).setDate(date);
        return Result.success(service.save(entity));
    }

    @Operation(summary = "删除")
    @PostMapping("/serveShDelete")
    public Result<?> serveShDelete(@RequestParam Integer id) {
        return Result.success(service.removeById(id));
    }

    @Operation(summary = "编辑")
    @PostMapping("/serveShEditor")
    public Result<?> serveShEditor(@RequestBody ServeShEntity serveShEntity) {
        return Result.success(service.updateById(serveShEntity));
    }

    private final ServeMapper serveMapper;
    private final UserMapper userMapper;

    @Operation(summary = "搜索")
    @PostMapping("/serveShSearch")
    public Result<?> serveShSearch(@RequestParam String name) {
        ArrayList<ServeShController.ServeShEntire> list = new ArrayList<>();
        // serve
        QueryWrapper<ServeEntity> wrapperA = new QueryWrapper<>();
        wrapperA.like("serve_name", name);
        List<ServeEntity> listA = serveMapper.selectList(wrapperA);
        for (int i = 0; i < listA.size(); i++) {
            ServeEntity serve = listA.get(i);
            Integer serveId = serve.getId();
            QueryWrapper<ServeShEntity> wrapper = new QueryWrapper<>();
            wrapper.eq("sh_serve_id", serveId);
            List<ServeShEntity> entityList = mapper.selectList(wrapper);
            for (int j = 0; j < entityList.size(); j++) {
                ServeShEntity shEntity = entityList.get(j);
                ServeShController.ServeShEntire serveShEntire = new ServeShController.ServeShEntire();
                BeanUtils.copyProperties(shEntity, serveShEntire);
                serveShEntire.setServe(serve).setServeName(serve.getName());
                UserEntity user = userService.getById(shEntity.getUserId());
                serveShEntire.setUser(user).setUserName(user.getName());
                list.add(serveShEntire);
            }
        }
        // user
        QueryWrapper<UserEntity> wrapperU = new QueryWrapper<>();
        wrapperU.like("user_name", name);
        List<UserEntity> listU = userMapper.selectList(wrapperU);
        for (int i = 0; i < listU.size(); i++) {
            UserEntity user = listU.get(i);
            Integer userId = user.getId();
            QueryWrapper<ServeShEntity> wrapper = new QueryWrapper<>();
            wrapper.eq("sh_user_id", userId);
            List<ServeShEntity> entityList = mapper.selectList(wrapper);
            for (int j = 0; j < entityList.size(); j++) {
                ServeShEntity shEntity = entityList.get(j);
                ServeShController.ServeShEntire serveShEntire = new ServeShController.ServeShEntire();
                BeanUtils.copyProperties(shEntity, serveShEntire);
                serveShEntire.setUser(user).setUserName(user.getName());
                ServeEntity serve = serveService.getById(shEntity.getServeId());
                serveShEntire.setServe(serve).setServeName(serve.getName());
                list.add(serveShEntire);
            }
        }
        return Result.success(list);
    }

    @Operation(summary = "报名人")
    @PostMapping("/serveShMyself")
    public Result<?> serveShMyself(@RequestParam Integer userId) {
        QueryWrapper<ServeShEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("sh_user_id", userId);
        List<ServeShEntity> list = mapper.selectList(wrapper);
        ArrayList<ServeShController.ServeShEntire> shEntires = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            ServeShEntity serveSh = list.get(i);
            Integer serveId = serveSh.getServeId();
            ServeEntity serve = serveService.getById(serveId);
            ServeShController.ServeShEntire shEntire = new ServeShController.ServeShEntire();
            BeanUtils.copyProperties(serveSh, shEntire);
            shEntire.setServe(serve);
            shEntire.setServeName(serve.getName());
            shEntires.add(shEntire);
        }
        return Result.success(shEntires);
    }


}
