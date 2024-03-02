package com.example.springboot.mapper;

import com.example.springboot.entity.NewsEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 新闻 Mapper 接口
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Mapper
public interface NewsMapper extends BaseMapper<NewsEntity> {

}
