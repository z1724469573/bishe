package com.example.elderapi.common.generator;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.util.Collections;

public class GeneratorMySQL {
    /**
     * 数据库连接url
     */
    public static final String URL = "jdbc:mysql://localhost/db_elder";
    /**
     * 数据库 用户名
     */
    public static final String USER_NAME = "root";
    /**
     * 数据库 密码
     */
    public static final String PASSWORD = "root@XH2001!";
    /**
     * 作者
     */
    public static final String AUTHOR = "he";
    /**
     * java代码保存目录
     */
//    public static final String SAVE_PATH = System.getProperty("user.dir") + "/src/main/java";
    public static final String SAVE_PATH = "he-code-generator";
    /**
     * xml保存目录
     */
    public static final String XML_SAVE_PATH = "he-code-generator";
    /**
     * 保存到包下面
     */
    public static final String PACKAGE = "com.example.elderapi.system";
    /**
     * 要生成的表
     */
    public static final String[] TABLES = {"eld_sort_news"};
    public static final String[] TablePrefix = {"eld_"};
    public static final String[] FieldPrefix = {"news_"};

    /**
     * 代码生成入口
     *
     * @param args 参数
     */
    public static void main(String[] args) {
        FastAutoGenerator.create(URL, USER_NAME, PASSWORD).globalConfig(builder -> {
                    builder.author(AUTHOR) // 设置作者
                            .enableSpringdoc() // 是否启用springdoc注解
                            .dateType(DateType.ONLY_DATE) // 时间策略
                            .commentDate("yyyy-MM-dd") // 注释日期
                            .outputDir(SAVE_PATH) // 输出目录
                            .disableOpenDir()// 生成后禁止打开所生成的系统目录
                            .fileOverride(); // 覆盖已生成文件

                }).packageConfig(builder -> {
                    builder
                            .parent(PACKAGE) // 父包名
                            .entity("entity") // 实体类包名
                            .service("service") // service包名
                            .serviceImpl("service.impl") // serviceImpl包名
                            .mapper("mapper") // mapper包名
                            .pathInfo(Collections.singletonMap(OutputFile.xml, XML_SAVE_PATH)) // xml位置（还可自定义配置entity，service等位置）
                            .controller("controller"); // controller包名
                }).strategyConfig(builder -> {
                    builder
//                            .addTablePrefix("coll_") // 增加过滤表前缀
                            //.addTableSuffix("_db") // 增加过滤表后缀
//                            .addFieldPrefix("use_") // 增加过滤字段前缀
                            //.addFieldSuffix("_field") // 增加过滤字段后缀
                            .addTablePrefix(TablePrefix)// 增加过滤表前缀
                            .addFieldPrefix(FieldPrefix)// 增加过滤字段前缀
                            .addInclude(TABLES) // 表名称

                            // Entity 策略配置
                            .entityBuilder()
                            .enableLombok() // 开启lombok
                            .enableChainModel() // 链式
                            .enableTableFieldAnnotation() //开启生成实体时生成的字段注解
                            .enableRemoveIsPrefix() //开启 Boolean 类型字段移除 is 前缀
                            .disableSerialVersionUID()  //禁用生成 serialVersionUID
                            .idType(IdType.AUTO)// 主键生成策略 此处为 自增（可选）
                            .naming(NamingStrategy.underline_to_camel) // 表名 下划线 -》 驼峰命名
                            .columnNaming(NamingStrategy.underline_to_camel) // 字段名 下划线 -》 驼峰命名
                            .formatFileName("%sEntity") // Entity 文件名称
                            //.enableColumnConstant()
                            .enableActiveRecord()
                            // Controller 策略配置
                            .controllerBuilder()
                            .enableRestStyle() // 开启@RestController
                            .formatFileName("%sController") // Controller 文件名称

                            // Service 策略配置
                            .serviceBuilder()
                            .formatServiceFileName("%sService") // Service 文件名称
                            .formatServiceImplFileName("%sServiceImpl") // ServiceImpl 文件名称

                            // Mapper 策略配置
                            .mapperBuilder()
                            .enableMapperAnnotation() // 开启@Mapper
                            .enableBaseColumnList() // 启用 columnList (通用查询结果列)
                            .enableBaseResultMap() // 启动resultMap
                            .formatMapperFileName("%sMapper") // Mapper 文件名称
                            .formatXmlFileName("%sMapper"); // Xml 文件名称
                })
                // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .templateEngine(new FreemarkerTemplateEngine()).execute();
    }
}
