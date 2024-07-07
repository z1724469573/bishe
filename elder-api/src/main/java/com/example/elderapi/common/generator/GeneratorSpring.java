package com.example.elderapi.common.generator;


/*
import com.alibaba.excel.EasyExcel;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.annotate.JwtToken;
import com.example.springboot.common.resp.Result;
import com.example.springboot.common.utils.JWTUtils;
import com.example.springboot.system.entity.BooknoEntity;
import com.example.springboot.system.mapper.BooknoMapper;
import com.example.springboot.system.service.BooknoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

* */
public class GeneratorSpring {
    public static void main(String[] args) {
        // 示例注释字符串，请根据您的实际情况替换
        String little = "user";
        String bigger = "User";
        // 定义一个方法来输出JavaScript数组
        String originalString = """

                @Autowired
                private BooknoMapper booknoMapper;

                @Autowired
                private BooknoService booknoService;

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                @JwtToken
                @Operation(summary = "列表分页")
                @PostMapping("/listPageBookno")
                public Result<?> listPageBookno(@RequestParam Integer page, @RequestParam Integer pageSize) {
                    //分页参数
                    Page<BooknoEntity> rowPage = new Page(page, pageSize);
                    QueryWrapper<BooknoEntity> wrapper = new QueryWrapper<>();
                    wrapper.eq("undock", 1);
                    rowPage = booknoMapper.selectPage(rowPage, wrapper);
                    return Result.success("数据请求成功", rowPage);
                }

                @JwtToken
                @Operation(summary = "查询编号")
                @PostMapping("/findByIDBookno/{param}")
                public Result<?> findByIDBookno(@PathVariable @Validated String param) {
                    QueryWrapper<BooknoEntity> wrapper = new QueryWrapper<>();
                    wrapper.like(("bookno_id"), param);
                    wrapper.eq(("undock"), 1);
                    if (booknoService.count(wrapper) == 0) return Result.success("查询成功，但数据不存在");
                    return Result.success("查询成功", booknoMapper.selectList(wrapper));
                }

                @JwtToken
                @Operation(summary = "查询名称")
                @PostMapping("/findByNameBookno/{param}")
                public Result<?> findByNameBookno(@PathVariable @Validated String param) {
                    QueryWrapper<BooknoEntity> wrapper = new QueryWrapper<>();
                    wrapper.like(("bookno_name"), param);
                    wrapper.eq(("undock"), 1);
                    if (booknoService.count(wrapper) == 0) return Result.failure("查询成功，但数据不存在");
                    return Result.success("查询成功", booknoMapper.selectList(wrapper));
                }

                @JwtToken
                @Operation(summary = "条件查询")
                @PostMapping("/findBookno")
                public Result<?> findBookno(@RequestBody BooknoEntity entity) {
                    QueryWrapper<BooknoEntity> wrapper = new QueryWrapper<>();
                    if (entity.getName() != "") wrapper.like(("bookno_name"), entity.getName());
                    wrapper.like(("unlucky"), entity.getUnlucky());
                    wrapper.eq(("undock"), 1);
                    if (booknoService.count(wrapper) == 0) return Result.failure("查询成功，但数据不存在");
                    return Result.success("查询成功", booknoMapper.selectList(wrapper));
                }

                @JwtToken
                @Operation(summary = "保存数据")
                @PostMapping("/insert")
                public Result<?> insertBookno(@RequestBody @Validated BooknoEntity entity, HttpServletRequest httpServletRequest) {
                    String token = httpServletRequest.getHeader("token");
                    DecodedJWT decodedJWT = JWTUtils.resolveToken(token);
                    //保存
                    QueryWrapper<BooknoEntity> wrapper = new QueryWrapper<>();
                    wrapper.eq(("bookno_id"), entity.getId());
                    if (booknoService.count(wrapper) != 0) return Result.failure("保存失败，编号已存在");
                    //设置创建者
                    String name = decodedJWT.getClaim("name").asString();
                    entity.setCreateBy(name);
                    entity.setCreateTime(sdf.format(new Date()));
                    if (booknoService.save(entity)) return Result.success("保存成功");
                    return Result.failure("系统超时，保存失败");
                }

                @JwtToken
                @Operation(summary = "永久删除")
                @PostMapping("/delete/{param}")
                public Result<?> deleteBookno(@PathVariable @Validated String param) {
                    QueryWrapper<BooknoEntity> wrapper = new QueryWrapper<>();
                    wrapper.eq(("bookno_id"), param);
                    if (booknoService.count(wrapper) == 0) return Result.failure("删除失败，编号不存在");
                    if (booknoService.remove(wrapper)) return Result.success("删除成功");
                    return Result.failure("系统超时，删除失败");
                }

                @JwtToken
                @Operation(summary = "暂时删除")
                @PostMapping("/deleteTemp/{param}")
                public Result<?> deleteTempBookno(@PathVariable @Validated String param, HttpServletRequest httpServletRequest) {
                    String token = httpServletRequest.getHeader("token");
                    DecodedJWT decodedJWT = JWTUtils.resolveToken(token);
                    //修改
                    QueryWrapper<BooknoEntity> wrapper = new QueryWrapper<>();
                    wrapper.eq(("bookno_id"), param);
                    if (booknoService.count(wrapper) == 0) return Result.failure("删除失败，编号不存在");
                    BooknoEntity bookno = booknoService.getOne(wrapper);
                    bookno.setUndock(0);
                    //设置修改者
                    String name = decodedJWT.getClaim("name").asString();
                    bookno.setUpdateBy(name);
                    bookno.setUpdateTime(sdf.format(new Date()));
                    if (booknoService.updateById(bookno)) return Result.success("删除成功");
                    return Result.failure("系统超时，删除失败");
                }

                @JwtToken
                @Operation(summary = "恢复列表")
                @PostMapping("/recoverList")
                public Result<?> recoverListBookno() {
                    QueryWrapper<BooknoEntity> wrapper = new QueryWrapper<>();
                    wrapper.eq("undock", 0);
                    return Result.success(booknoMapper.selectList(wrapper));
                }

                @JwtToken
                @Operation(summary = "恢复数据")
                @PostMapping("/recover/{param}")
                public Result<?> recoverBookno(@PathVariable @Validated String param, HttpServletRequest httpServletRequest) {
                    String token = httpServletRequest.getHeader("token");
                    DecodedJWT decodedJWT = JWTUtils.resolveToken(token);
                    //修改
                    QueryWrapper<BooknoEntity> wrapper = new QueryWrapper<>();
                    wrapper.eq(("bookno_id"), param);
                    if (booknoService.count(wrapper) == 0) return Result.failure("恢复失败，编号不存在");
                    BooknoEntity bookno = booknoService.getOne(wrapper);
                    bookno.setUndock(1);
                    //设置修改者
                    String name = decodedJWT.getClaim("name").asString();
                    bookno.setUpdateBy(name);
                    bookno.setUpdateTime(sdf.format(new Date()));
                    if (booknoService.updateById(bookno)) return Result.success("数据恢复成功");
                    return Result.failure("系统超时，数据恢复失败");
                }

                @JwtToken
                @Operation(summary = "修改编号")
                @PostMapping("/update")
                public Result<?> updateBookno(@RequestBody @Validated BooknoEntity entity) {
                    QueryWrapper<BooknoEntity> wrapper = new QueryWrapper<>();
                    wrapper.eq(("bookno_id"), entity.getId());
                    if (booknoService.count(wrapper) == 0) return Result.failure("修改失败，编号不存在");
                    if (booknoService.updateById(entity)) return Result.success("修改成功");
                    return Result.failure("系统超时，修改失败");
                }

                @Operation(summary = "导出数据")
                @PostMapping("exportExcel")
                public void exportExcelBookno(HttpServletResponse response) throws IOException {
                    response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
                    response.setCharacterEncoding("utf-8");
                    String fileName = URLEncoder.encode("Excel数据表", StandardCharsets.UTF_8).replaceAll("\\\\+", "%20");
                    List<BooknoEntity> list = booknoService.list();
                    response.setHeader("Content-disposition", "attachment;filename*=" + fileName + ".xlsx");
                    EasyExcel.write(response.getOutputStream(), BooknoEntity.class).sheet("Excel数据表").doWrite(list);
                }

                @JwtToken
                @Operation(summary = "导入数据")
                @PostMapping("/importExcel")
                public Result<?> importExcelBookno(MultipartFile file, HttpServletRequest httpServletRequest) {
                    String token = httpServletRequest.getHeader("token");
                    DecodedJWT decodedJWT = JWTUtils.resolveToken(token);
                    try {
                        //获取文件的输入流
                        InputStream inputStream = file.getInputStream();
                        List<BooknoEntity> list = EasyExcel.read(inputStream) //调用read方法
                                //注册自定义监听器，字段校验可以在监听器内实现
                                //.registerReadListener(new BooknoListener())
                                .head(BooknoEntity.class) //对应导入的实体类
                                .sheet(0) //导入数据的sheet页编号，0代表第一个sheet页，如果不填，则会导入所有sheet页的数据
                                .headRowNumber(1) //列表头行数，1代表列表头有1行，第二行开始为数据行
                                .doReadSync();//开始读Excel，返回一个List<T>集合，继续后续入库操作
                        //模拟导入数据库操作
                        String name = decodedJWT.getClaim("name").asString();
                        for (BooknoEntity entity : list) {
                            entity.setCreateBy(name);
                            entity.setCreateTime(sdf.format(new Date()));
                            booknoService.saveOrUpdate(entity);
                        }
                        return Result.success("导入成功");
                    } catch (IOException exception) {
                        throw new RuntimeException(exception);
                    }
                }
                                """;
        // 替换 "role" 为 "_mine"
        String replacedRole = originalString.replace("bookno", little);

        // 替换 "Role" 为 "_Mine"
        String finalString = replacedRole.replace("Bookno", bigger);

        // 输出最终的字符串
        System.out.println(finalString);

    }

}