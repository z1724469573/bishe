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
 * 服务
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("eld_serve")
@Schema(name = "ServeEntity", description = "$!{table.comment}")
public class ServeEntity extends Model<ServeEntity> {

    @Schema(description = "主键")
    @TableId(value = "serve_id", type = IdType.AUTO)
    private Integer id;

    @Schema(description = "名称")
    @TableField("serve_name")
    private String name;

    @Schema(description = "封面")
    @TableField("serve_cover")
    private String cover;

    @Schema(description = "内容")
    @TableField("serve_content")
    private String content;

    @Schema(description = "状态（1正常 0禁用）")
    @TableField("status")
    private Integer status;

    @Override
    public Serializable pkVal() {
        return this.id;
    }
}
