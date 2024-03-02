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
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

/**
 * <p>
 * 活动
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Getter
@Setter
@TableName("eld_active")
@Schema(name = "ActiveEntity", description = "$!{table.comment}")
public class ActiveEntity extends Model<ActiveEntity> {

    @Schema(description = "主键")
    @ColumnWidth(30)
    @ExcelProperty("主键")
    @TableId(value = "active_id", type = IdType.AUTO)
    private Integer activeId;

    @Schema(description = "名称")
    @ColumnWidth(30)
    @ExcelProperty("名称")
    @TableField("active_label")
    private String activeLabel;

    @Schema(description = "开始")
    @ColumnWidth(30)
    @ExcelProperty("开始")
    @TableField("active_start")
    private String activeStart;

    @Schema(description = "结束")
    @ColumnWidth(30)
    @ExcelProperty("结束")
    @TableField("active_end")
    private String activeEnd;

    @Schema(description = "地址")
    @ColumnWidth(30)
    @ExcelProperty("地址")
    @TableField("active_address")
    private String activeAddress;

    @Schema(description = "电话")
    @ColumnWidth(30)
    @ExcelProperty("电话")
    @TableField("active_phone")
    private String activePhone;

    @Schema(description = "内容")
    @ColumnWidth(30)
    @ExcelProperty("内容")
    @TableField("active_content")
    private String activeContent;

    @Schema(description = "封面")
    @ColumnWidth(30)
    @ExcelProperty("封面")
    @TableField("active_cover")
    private String activeCover;

    @Schema(description = "状态(1 正常 0 禁用)")
    @TableField("active_state")
    private Integer activeState;

    @Override
    public Serializable pkVal() {
        return this.activeId;
    }
}
