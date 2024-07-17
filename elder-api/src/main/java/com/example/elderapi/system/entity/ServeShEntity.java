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
 * 预约
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("eld_serve_sh")
@Schema(name = "ServeShEntity", description = "$!{table.comment}")
public class ServeShEntity extends Model<ServeShEntity> {

    @TableId(value = "sh_id", type = IdType.AUTO)
    private Integer id;

    @Schema(description = "服务")
    @TableField("sh_serve_id")
    private Integer serveId;

    @Schema(description = "用户")
    @TableField("sh_user_id")
    private Integer userId;

    @Schema(description = "日期")
    @TableField("sh_date")
    private String date;

    @Schema(description = "审核")
    @TableField("sh_checked")
    private String checked;

    @Schema(description = "意见")
    @TableField("sh_advice")
    private String advice;

    @Schema(description = "状态（1正常 0禁用）")
    @TableField("status")
    private Integer status;

    @Override
    public Serializable pkVal() {
        return this.id;
    }
}
