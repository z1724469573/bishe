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
 * 预约
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Getter
@Setter
@TableName("eld_order")
@Schema(name = "OrderEntity", description = "$!{table.comment}")
public class OrderEntity extends Model<OrderEntity> {

    @Schema(description = "主键")
    @ColumnWidth(30)
    @ExcelProperty("主键")
    @TableId(value = "order_id", type = IdType.AUTO)
    private Integer orderId;

    @Schema(description = "用户")
    @ColumnWidth(30)
    @ExcelProperty("用户")
    @TableField("order_acc")
    private String orderAcc;

    @Schema(description = "日期")
    @ColumnWidth(30)
    @ExcelProperty("日期")
    @TableField("order_date")
    private String orderDate;

    @Schema(description = "审核")
    @ColumnWidth(30)
    @ExcelProperty("审核")
    @TableField("order_check")
    private String orderCheck;

    @Schema(description = "意见")
    @ColumnWidth(30)
    @ExcelProperty("意见")
    @TableField("order_advice")
    private String orderAdvice;

    @Schema(description = "状态（1正常 0禁用）")
    @ColumnWidth(30)
    @ExcelProperty("状态（1正常 0禁用）")
    @TableField("order_state")
    private Integer orderState;

    @Override
    public Serializable pkVal() {
        return this.orderId;
    }
}
