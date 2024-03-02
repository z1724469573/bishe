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
 * 评论
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Getter
@Setter
@TableName("eld_review")
@Schema(name = "ReviewEntity", description = "$!{table.comment}")
public class ReviewEntity extends Model<ReviewEntity> {

    @Schema(description = "主键")
    @ColumnWidth(30)
    @ExcelProperty("主键")
    @TableId(value = "review_id", type = IdType.AUTO)
    private Integer reviewId;

    @Schema(description = "姓名")
    @ColumnWidth(30)
    @ExcelProperty("姓名")
    @TableField("review_name")
    private String reviewName;

    @Schema(description = "日期")
    @ColumnWidth(30)
    @ExcelProperty("日期")
    @TableField("review_date")
    private String reviewDate;

    @Schema(description = "内容")
    @ColumnWidth(30)
    @ExcelProperty("内容")
    @TableField("review_content")
    private String reviewContent;

    @Schema(description = "点赞")
    @ColumnWidth(30)
    @ExcelProperty("点赞")
    @TableField("review_star")
    private Integer reviewStar;

    @Schema(description = "状态(1 正常 0 禁用)")
    @ColumnWidth(30)
    @ExcelProperty("状态(1 正常 0 禁用)")
    @TableField("review_state")
    private Integer reviewState;

    @Override
    public Serializable pkVal() {
        return this.reviewId;
    }
}
