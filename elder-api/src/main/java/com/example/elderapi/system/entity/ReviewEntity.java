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
 * 评论
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("eld_review")
@Schema(name = "ReviewEntity", description = "$!{table.comment}")
public class ReviewEntity extends Model<ReviewEntity> {

    @Schema(description = "主键")
    @TableId(value = "review_id", type = IdType.AUTO)
    private Integer id;

    @Schema(description = "用户")
    @TableField("review_user_id")
    private Integer userId;

    @Schema(description = "日期")
    @TableField("review_date")
    private String date;

    @Schema(description = "内容")
    @TableField("review_content")
    private String content;

    @Schema(description = "点赞")
    @TableField("review_star")
    private Integer star;

    @Schema(description = "状态(1 正常 0 禁用)")
    @TableField("status")
    private Integer status;

    @Override
    public Serializable pkVal() {
        return this.id;
    }
}
