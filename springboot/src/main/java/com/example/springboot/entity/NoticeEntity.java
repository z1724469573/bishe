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
 * 公告
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Getter
@Setter
@TableName("eld_notice")
@Schema(name = "NoticeEntity", description = "$!{table.comment}")
public class NoticeEntity extends Model<NoticeEntity> {

    @Schema(description = "主键")
    @ColumnWidth(30)
    @ExcelProperty("主键")
    @TableId(value = "notice_id", type = IdType.AUTO)
    private Integer noticeId;

    @Schema(description = "标题")
    @ColumnWidth(30)
    @ExcelProperty("标题")
    @TableField("notice_label")
    private String noticeLabel;

    @Schema(description = "状态（1正常 0禁用）")
    @ColumnWidth(30)
    @ExcelProperty("状态（1正常 0禁用）")
    @TableField("notice_state")
    private Integer noticeState;

    @Override
    public Serializable pkVal() {
        return this.noticeId;
    }
}
