package com.example.springboot.mapper;

import com.example.springboot.entity.ReviewEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 评论 Mapper 接口
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Mapper
public interface ReviewMapper extends BaseMapper<ReviewEntity> {

}
