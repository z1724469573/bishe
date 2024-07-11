package com.example.elderapi.system.entity;

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
 * @since 2024-07-09
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("eld_elder")
@Schema(name = "ElderEntity", description = "$!{table.comment}")
public class ElderEntity extends Model<ElderEntity> {

    @Schema(description = "主键")
    @TableId(value = "elder_id", type = IdType.AUTO)
    private Integer id;

    @Schema(description = "名称")
    @TableField("elder_name")
    private String name;

    @Schema(description = "内容")
    @TableField("elder_content")
    private String content;

    @Schema(description = "标签")
    @TableField("elder_tag")
    private String tag;

    @Schema(description = "价格")
    @TableField("elder_price")
    private String price;

    @Schema(description = "地址")
    @TableField("elder_address")
    private String address;

    @Schema(description = "成立日期")
    @TableField("elder_date")
    private String date;

    @Schema(description = "封面")
    @TableField("elder_cover")
    private String cover;

    @Schema(description = "房间数")
    @TableField("elder_bed")
    private Integer bed;

    @Schema(description = "面积")
    @TableField("elder_area")
    private String area;

    @Schema(description = "电话")
    @TableField("elder_phone")
    private String phone;

    @Schema(description = "经度")
    @TableField("elder_jd")
    private String jd;

    @Schema(description = "纬度")
    @TableField("elder_wd")
    private String wd;

    @Schema(description = "状态（1正常 0禁用）")
    @TableField("status")
    private Integer status;

    @Override
    public Serializable pkVal() {
        return this.id;
    }
}
