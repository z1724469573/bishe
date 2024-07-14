package com.example.elderapi.user.entity;

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
 * 用户
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("eld_user")
@Schema(name = "UserEntity", description = "$!{table.comment}")
public class UserEntity extends Model<UserEntity> {

    @Schema(description = "主键")
    @TableId(value = "user_id", type = IdType.AUTO)
    private Integer id;

    @Schema(description = "头像")
    @TableField("user_pic")
    private String pic;

    @Schema(description = "账号")
    @TableField("user_acc")
    private String acc;

    @Schema(description = "密码")
    @TableField("user_pwd")
    private String pwd;

    @Schema(description = "姓名")
    @TableField("user_name")
    private String name;

    @Schema(description = "性别")
    @TableField("user_sex")
    private String sex;

    @Schema(description = "年龄")
    @TableField("user_age")
    private Integer age;

    @Schema(description = "电话")
    @TableField("user_phone")
    private String phone;

    @Schema(description = "地址")
    @TableField("user_address")
    private String address;

    @Schema(description = "状态(1 正常 0 禁用)")
    @TableField("status")
    private Integer status;

    @Override
    public Serializable pkVal() {
        return this.id;
    }
}
