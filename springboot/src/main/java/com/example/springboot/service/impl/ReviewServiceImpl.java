package com.example.springboot.service.impl;

import com.example.springboot.entity.ReviewEntity;
import com.example.springboot.mapper.ReviewMapper;
import com.example.springboot.service.ReviewService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 评论 服务实现类
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Service
public class ReviewServiceImpl extends ServiceImpl<ReviewMapper, ReviewEntity> implements ReviewService {

}
