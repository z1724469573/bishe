package com.example.springboot.mapper;

import com.example.springboot.entity.ElderEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 养老院 Mapper 接口
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Mapper
public interface ElderMapper extends BaseMapper<ElderEntity> {

}
