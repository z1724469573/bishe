package com.example.elderapi.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.elderapi.user.entity.ManagerEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 管理员 Mapper 接口
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Mapper
public interface ManagerMapper extends BaseMapper<ManagerEntity> {

}
