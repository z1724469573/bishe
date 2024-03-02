package com.example.springboot.service.impl;

import com.example.springboot.entity.OrderEntity;
import com.example.springboot.mapper.OrderMapper;
import com.example.springboot.service.OrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 预约 服务实现类
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, OrderEntity> implements OrderService {

}
