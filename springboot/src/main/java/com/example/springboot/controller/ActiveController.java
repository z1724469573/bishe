package com.example.springboot.controller;

import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.common.req.IdParam;
import com.example.common.resp.Result;
import com.example.springboot.entity.ActiveEntity;
import com.example.springboot.entity.ActiveEntity;
import com.example.springboot.mapper.ActiveMapper;
import com.example.springboot.service.ActiveService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * <p>
 * 活动 前端控制器
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Tag(name = "活动")
@RestController
@RequestMapping("/activeEntity")
public class ActiveController {

    @Autowired
    private ActiveMapper commonMapper;
    @Autowired
    private ActiveService commonService;
    private final String id = "Active_id";

    @Operation(summary = "列表")
    @PostMapping("/list")
    public Result listActive() {
        return Result.success("数据列表", commonService.list());
    }

    @Operation(summary = "存在")
    @PostMapping("/exist")
    public Result existActive(@RequestBody @Validated IdParam param) {
        QueryWrapper<ActiveEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(id.toLowerCase(Locale.ROOT), param.getId());
        long count = commonService.count(wrapper);
        if (count == 0) return Result.success("ID不存在", false);
        return Result.success("ID已存在", true);
    }

    @Operation(summary = "保存")
    @PostMapping("/insert")
    public Result insertActive(@RequestBody @Validated ActiveEntity param) {
        QueryWrapper<ActiveEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(id.toLowerCase(Locale.ROOT), param.getActiveId());
        if (commonService.count(wrapper) != 0) return Result.failure("ID已存在", new Date());
        if (commonService.save(param)) return Result.success("保存成功", new Date());
        return Result.failure("保存失败", new Date());
    }

    @Operation(summary = "删除")
    @PostMapping("/delete")
    public Result deleteActive(@RequestBody @Validated IdParam param) {
        QueryWrapper<ActiveEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(id.toLowerCase(Locale.ROOT), param.getId());
        if (commonService.count(wrapper) == 0) return Result.failure("ID不存在", param.getId());
        if (commonService.remove(wrapper)) return Result.success("删除成功", param.getId());
        return Result.failure("删除失败", param.getId());
    }

    @Operation(summary = "修改")
    @PostMapping("/update")
    public Result updateActive(@RequestBody @Validated ActiveEntity param) {
        QueryWrapper<ActiveEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(id.toLowerCase(Locale.ROOT), param.getActiveId());
        if (commonService.count(wrapper) == 0) return Result.failure("ID不存在", new Date());
        if (commonService.updateById(param)) return Result.success("修改成功", new Date());
        return Result.failure("修改失败", new Date());
    }

    @Operation(summary = "查询")
    @PostMapping("/select")
    public Result selectActive(@RequestBody @Validated IdParam param) {
        QueryWrapper<ActiveEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(id.toLowerCase(Locale.ROOT), param.getId());
        if (commonService.count(wrapper) == 0) return Result.failure("ID不存在", param.getId());
        return Result.success(commonService.getOne(wrapper));
    }


    @Operation(summary = "列表分页")
    @PostMapping("/listPage")
    public Result listPageActive(@RequestParam Integer page, @RequestParam Integer pageSize) {
        //分页参数
        Page<ActiveEntity> rowPage = new Page(page, pageSize);
        //queryWrapper组装查询where条件
        LambdaQueryWrapper<ActiveEntity> queryWrapper = new LambdaQueryWrapper<>();
        rowPage = commonMapper.selectPage(rowPage, queryWrapper);
        return Result.success("数据列表", rowPage);
    }

    @Operation(summary = "导出数据")
    @PostMapping("exportExcel")
    public void exportExcelActive(HttpServletResponse response) throws IOException {
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setCharacterEncoding("utf-8");
        String fileName = URLEncoder.encode("轮播图", StandardCharsets.UTF_8).replaceAll("\\+", "%20");
        List<ActiveEntity> list = commonService.list();
        response.setHeader("Content-disposition", "attachment;filename*=" + fileName + ".xlsx");
        EasyExcel.write(response.getOutputStream(), ActiveEntity.class).sheet("轮播图").doWrite(list);
    }

    @Operation(summary = "导入数据")
    @PostMapping("/importExcel")
    public Result importExcelActive(MultipartFile file) {
        try {
            //获取文件的输入流
            InputStream inputStream = file.getInputStream();
            List<ActiveEntity> list = EasyExcel.read(inputStream) //调用read方法
                    //注册自定义监听器，字段校验可以在监听器内实现
                    //.registerReadListener(new UserListener())
                    .head(ActiveEntity.class) //对应导入的实体类
                    .sheet(0) //导入数据的sheet页编号，0代表第一个sheet页，如果不填，则会导入所有sheet页的数据
                    .headRowNumber(1) //列表头行数，1代表列表头有1行，第二行开始为数据行
                    .doReadSync();//开始读Excel，返回一个List<T>集合，继续后续入库操作
            //模拟导入数据库操作
            for (ActiveEntity entity : list) {
                commonService.saveOrUpdate(entity);
            }
            return Result.success("导入成功", new Date());
        } catch (IOException exception) {
            throw new RuntimeException(exception);
        }
    }
}
