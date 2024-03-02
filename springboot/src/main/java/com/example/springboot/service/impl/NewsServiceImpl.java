package com.example.springboot.service.impl;

import com.example.springboot.entity.NewsEntity;
import com.example.springboot.mapper.NewsMapper;
import com.example.springboot.service.NewsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 新闻 服务实现类
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Service
public class NewsServiceImpl extends ServiceImpl<NewsMapper, NewsEntity> implements NewsService {

}
