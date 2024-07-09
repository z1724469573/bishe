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
 * 资讯
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("eld_sort_news")
@Schema(name = "SortNewsEntity", description = "$!{table.comment}")
public class SortNewsEntity extends Model<SortNewsEntity> {

    @Schema(description = "主键")
    @TableId(value = "news_id", type = IdType.AUTO)
    private Integer id;

    @Schema(description = "类别")
    @TableField("news_sort_id")
    private Integer sortId;

    @Schema(description = "标题")
    @TableField("news_title")
    private String title;

    @Schema(description = "内容")
    @TableField("news_content")
    private String content;

    @Schema(description = "日期")
    @TableField("news_date")
    private String date;

    @Schema(description = "封面")
    @TableField("news_cover")
    private String cover;

    @Schema(description = "阅读")
    @TableField("news_read")
    private String read;

    @Schema(description = "状态(1 正常 0 禁用)")
    @TableField("status")
    private Integer status;

    @Override
    public Serializable pkVal() {
        return this.id;
    }
}
