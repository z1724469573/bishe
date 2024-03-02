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
 * 服务
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Getter
@Setter
@TableName("eld_serve")
@Schema(name = "ServeEntity", description = "$!{table.comment}")
public class ServeEntity extends Model<ServeEntity> {

    @Schema(description = "主键")
    @ColumnWidth(30)
    @ExcelProperty("主键")
    @TableId(value = "serve_id", type = IdType.AUTO)
    private Integer serveId;

    @Schema(description = "封面")
    @ColumnWidth(30)
    @ExcelProperty("封面")
    @TableField("serve_cover")
    private String serveCover;

    @Schema(description = "名称")
    @ColumnWidth(30)
    @ExcelProperty("名称")
    @TableField("serve_label")
    private String serveLabel;

    @Schema(description = "内容")
    @ColumnWidth(30)
    @ExcelProperty("内容")
    @TableField("serve_content")
    private String serveContent;

    @Schema(description = "状态（1正常 0禁用）")
    @ColumnWidth(30)
    @ExcelProperty("状态（1正常 0禁用）")
    @TableField("serve_state")
    private Integer serveState;

    @Override
    public Serializable pkVal() {
        return this.serveId;
    }
}
