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
import lombok.*;
import lombok.experimental.Accessors;

/**
 * <p>
 * 轮播图
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Getter
@Setter
@TableName("eld_swiper")
@Schema(name = "SwiperEntity", description = "$!{table.comment}")
public class SwiperEntity extends Model<SwiperEntity> {

    @ExcelProperty("主键")
    @TableId(value = "swiper_id", type = IdType.AUTO)
    private Integer swiperId;

    @ColumnWidth(40)
    @ExcelProperty("名称")
    @Schema(description = "名称")
    @TableField("swiper_label")
    private String swiperLabel;

    @ColumnWidth(40)
    @ExcelProperty("图片")
    @Schema(description = "图片")
    @TableField("swiper_src")
    private String swiperSrc;

    @ColumnWidth(40)
    @ExcelProperty("新闻")
    @Schema(description = "新闻")
    @TableField("swiper_url")
    private String swiperUrl;

    @ColumnWidth(60)
    @ExcelProperty("状态（1正常 0禁用）")
    @Schema(description = "状态（1正常 0禁用）")
    @TableField("swiper_state")
    private Integer swiperState;

    @Override
    public Serializable pkVal() {
        return this.swiperId;
    }
}
