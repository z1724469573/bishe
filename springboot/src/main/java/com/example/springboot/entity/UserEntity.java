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
 * 用户
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Getter
@Setter
@TableName("eld_user")
@Schema(name = "UserEntity", description = "$!{table.comment}")
public class UserEntity extends Model<UserEntity> {

    @Schema(description = "主键")
    @ColumnWidth(30)
    @ExcelProperty("主键")
    @TableId(value = "user_id", type = IdType.AUTO)
    private Integer userId;

    @Schema(description = "账号")
    @ColumnWidth(30)
    @ExcelProperty("账号")
    @TableField("user_acc")
    private String userAcc;

    @Schema(description = "密码")
    @ColumnWidth(30)
    @ExcelProperty("密码")
    @TableField("user_pwd")
    private String userPwd;

    @Schema(description = "姓名")
    @ColumnWidth(30)
    @ExcelProperty("姓名")
    @TableField("user_name")
    private String userName;

    @Schema(description = "性别(0男 1女 2不详)")
    @ColumnWidth(30)
    @ExcelProperty("性别(0男 1女 2不详)")
    @TableField("user_sex")
    private Integer userSex;

    @Schema(description = "年龄")
    @ColumnWidth(30)
    @ExcelProperty("年龄")
    @TableField("user_age")
    private Integer userAge;

    @Schema(description = "电话")
    @ColumnWidth(30)
    @ExcelProperty("电话")
    @TableField("user_phone")
    private String userPhone;

    @Schema(description = "角色")
    @ColumnWidth(30)
    @ExcelProperty("角色")
    @TableField("user_ide")
    private String userIde;

    @Schema(description = "地址")
    @ColumnWidth(30)
    @ExcelProperty("地址")
    @TableField("user_address")
    private String userAddress;

    @Schema(description = "状态(1 正常 0 禁用)")
    @ColumnWidth(30)
    @ExcelProperty("状态(1 正常 0 禁用)")
    @TableField("user_state")
    private Integer userState;

    @Override
    public Serializable pkVal() {
        return this.userId;
    }
}
