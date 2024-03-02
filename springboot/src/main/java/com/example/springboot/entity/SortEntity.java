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
 * 类别
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Getter
@Setter
@TableName("eld_sort")
@Schema(name = "SortEntity", description = "$!{table.comment}")
public class SortEntity extends Model<SortEntity> {

    @Schema(description = "主键")
    @ColumnWidth(30)
    @ExcelProperty("主键")
    @TableId(value = "sort_id", type = IdType.AUTO)
    private Integer sortId;

    @Schema(description = "描述")
    @ColumnWidth(30)
    @ExcelProperty("描述")
    @TableField("sort_label")
    private String sortLabel;

    @Schema(description = "状态(1 正常 0 禁用)")
    @ColumnWidth(30)
    @ExcelProperty("状态(1 正常 0 禁用)")
    @TableField("sort_state")
    private Integer sortState;

    @Override
    public Serializable pkVal() {
        return this.sortId;
    }
}
