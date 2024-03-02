package com.example.springboot.mapper;

import com.example.springboot.entity.UserEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 用户 Mapper 接口
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Mapper
public interface UserMapper extends BaseMapper<UserEntity> {

}
