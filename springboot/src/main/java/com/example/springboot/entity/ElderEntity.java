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
 * 养老院
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Getter
@Setter
@TableName("eld_elder")
@Schema(name = "ElderEntity", description = "$!{table.comment}")
public class ElderEntity extends Model<ElderEntity> {

    @Schema(description = "主键")
    @ColumnWidth(30)
    @ExcelProperty("主键")
    @TableId(value = "elder_id", type = IdType.AUTO)
    private Integer elderId;

    @Schema(description = "名称")
    @ColumnWidth(30)
    @ExcelProperty("名称")
    @TableField("elder_label")
    private String elderLabel;

    @Schema(description = "内容")
    @ColumnWidth(30)
    @ExcelProperty("内容")
    @TableField("elder_content")
    private String elderContent;

    @Schema(description = "标签")
    @ColumnWidth(30)
    @ExcelProperty("标签")
    @TableField("elder_tag")
    private String elderTag;

    @Schema(description = "价格")
    @ColumnWidth(30)
    @ExcelProperty("价格")
    @TableField("elder_price")
    private Integer elderPrice;

    @Schema(description = "地址")
    @ColumnWidth(30)
    @ExcelProperty("地址")
    @TableField("elder_address")
    private String elderAddress;

    @Schema(description = "成立日期")
    @ColumnWidth(30)
    @ExcelProperty("成立日期")
    @TableField("elder_date")
    private String elderDate;

    @Schema(description = "封面")
    @ColumnWidth(30)
    @ExcelProperty("封面")
    @TableField("elder_cover")
    private String elderCover;

    @Schema(description = "房间数")
    @ColumnWidth(30)
    @ExcelProperty("房间数")
    @TableField("elder_bed")
    private Integer elderBed;

    @Schema(description = "面积")
    @ColumnWidth(30)
    @ExcelProperty("面积")
    @TableField("elder_area")
    private Integer elderArea;

    @Schema(description = "电话")
    @ColumnWidth(30)
    @ExcelProperty("电话")
    @TableField("elder_phone")
    private String elderPhone;

    @Schema(description = "经纬度")
    @ColumnWidth(30)
    @ExcelProperty("经纬度")
    @TableField("elder_jw")
    private String elderJw;

    @Schema(description = "经纬度")
    @ColumnWidth(30)
    @ExcelProperty("经纬度")
    @TableField("elder_wd")
    private String elderWd;

    @Schema(description = "状态（1正常 0禁用）")
    @ColumnWidth(30)
    @ExcelProperty("状态（1正常 0禁用）")
    @TableField("elder_state")
    private Integer elderState;

    @Override
    public Serializable pkVal() {
        return this.elderId;
    }
}
