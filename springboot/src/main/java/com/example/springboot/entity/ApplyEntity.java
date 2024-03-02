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
 * 报名
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Getter
@Setter
@TableName("eld_apply")
@Schema(name = "ApplyEntity", description = "$!{table.comment}")
public class ApplyEntity extends Model<ApplyEntity> {

    @Schema(description = "主键")
    @ColumnWidth(30)
    @ExcelProperty("主键")
    @TableId(value = "apply_id", type = IdType.AUTO)
    private Integer applyId;

    @Schema(description = "账号")
    @ColumnWidth(30)
    @ExcelProperty("账号")
    @TableField("apply_acc")
    private String applyAcc;

    @Schema(description = "账号")
    @ColumnWidth(30)
    @ExcelProperty("账号")
    @TableField("apply_phone")
    private String applyPhone;

    @Schema(description = "账号")
    @ColumnWidth(30)
    @ExcelProperty("账号")
    @TableField("apply_label")
    private String applyLabel;

    @Schema(description = "日期")
    @ColumnWidth(30)
    @ExcelProperty("日期")
    @TableField("apply_date")
    private String applyDate;

    @Schema(description = "审核")
    @ColumnWidth(30)
    @ExcelProperty("审核")
    @TableField("apply_check")
    private String applyCheck;

    @Schema(description = "意见")
    @ColumnWidth(30)
    @ExcelProperty("意见")
    @TableField("apply_advice")
    private String applyAdvice;

    @Schema(description = "状态（1正常 0禁用）")
    @ColumnWidth(30)
    @ExcelProperty("状态（1正常 0禁用）")
    @TableField("apply_state")
    private Integer applyState;

    @Override
    public Serializable pkVal() {
        return this.applyId;
    }
}
