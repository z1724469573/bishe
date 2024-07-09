package com.example.elderapi.user.mapper;

import com.example.elderapi.user.entity.UserEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 用户 Mapper 接口
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Mapper
public interface UserMapper extends BaseMapper<UserEntity> {

}
