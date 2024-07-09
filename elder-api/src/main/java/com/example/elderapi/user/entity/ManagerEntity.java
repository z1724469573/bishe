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
 * 管理员
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("eld_manager")
@Schema(name = "ManagerEntity", description = "$!{table.comment}")
public class ManagerEntity extends Model<ManagerEntity> {

    @Schema(description = "主键")
    @TableId(value = "manager_id", type = IdType.AUTO)
    private Integer id;

    @Schema(description = "账号")
    @TableField("manager_acc")
    private String acc;

    @Schema(description = "密码")
    @TableField("manager_pwd")
    private String pwd;

    @Schema(description = "姓名")
    @TableField("manager_name")
    private String name;

    @Schema(description = "性别")
    @TableField("user_sex")
    private String userSex;

    @Schema(description = "年龄")
    @TableField("manager_age")
    private Integer age;

    @Schema(description = "电话")
    @TableField("manager_phone")
    private String phone;

    @Schema(description = "地址")
    @TableField("manager_address")
    private String address;

    @Schema(description = "状态(1 正常 0 禁用)")
    @TableField("status")
    private Integer status;

    @Override
    public Serializable pkVal() {
        return this.id;
    }
}
