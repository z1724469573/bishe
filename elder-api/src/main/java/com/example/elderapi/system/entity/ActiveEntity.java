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
 * 活动
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("eld_active")
@Schema(name = "ActiveEntity", description = "$!{table.comment}")
public class ActiveEntity extends Model<ActiveEntity> {

    @Schema(description = "主键")
    @TableId(value = "active_id", type = IdType.AUTO)
    private Integer id;

    @Schema(description = "名称")
    @TableField("active_name")
    private String name;

    @Schema(description = "开始")
    @TableField("active_start")
    private String start;

    @Schema(description = "结束")
    @TableField("active_end")
    private String end;

    @Schema(description = "地址")
    @TableField("active_address")
    private String address;

    @Schema(description = "电话")
    @TableField("active_phone")
    private String phone;

    @Schema(description = "内容")
    @TableField("active_content")
    private String content;

    @Schema(description = "封面")
    @TableField("active_cover")
    private String cover;

    @Schema(description = "状态(1 正常 0 禁用)")
    @TableField("status")
    private Integer status;

    @Override
    public Serializable pkVal() {
        return this.id;
    }
}
