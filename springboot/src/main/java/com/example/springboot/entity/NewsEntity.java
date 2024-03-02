package com.example.springboot.entity;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

/**
 * <p>
 * 新闻
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Getter
@Setter
@TableName("eld_news")
@Schema(name = "NewsEntity", description = "$!{table.comment}")
public class NewsEntity extends Model<NewsEntity> {

    @Schema(description = "主键")
    @ColumnWidth(30)
    @ExcelProperty("主键")
    @TableId(value = "news_id", type = IdType.AUTO)
    private Integer newsId;

    @Schema(description = "标题")
    @ColumnWidth(30)
    @ExcelProperty("标题")
    @TableField("news_title")
    private String newsTitle;

    @Schema(description = "内容")
    @ColumnWidth(30)
    @ExcelProperty("内容")
    @TableField("news_content")
    private String newsContent;

    @Schema(description = "类别")
    @ColumnWidth(30)
    @ExcelProperty("类别")
    @TableField("news_type")
    private String newsType;

    @Schema(description = "日期")
    @ColumnWidth(30)
    @ExcelProperty("日期")
    @TableField("news_date")
    private String newsDate;

    @Schema(description = "封面")
    @ColumnWidth(30)
    @ExcelProperty("封面")
    @TableField("news_cover")
    private String newsCover;

    @Schema(description = "标签")
    @ColumnWidth(30)
    @ExcelProperty("标签")
    @TableField("news_tag")
    private String newsTag;

    @Schema(description = "阅读")
    @ColumnWidth(30)
    @ExcelProperty("阅读")
    @TableField("news_read")
    private String newsRead;

    @Schema(description = "状态(1 正常 0 禁用)")
    @ColumnWidth(30)
    @ExcelProperty("状态(1 正常 0 禁用)")
    @TableField("news_state")
    private Integer newsState;

    @Override
    public Serializable pkVal() {
        return this.newsId;
    }
}
