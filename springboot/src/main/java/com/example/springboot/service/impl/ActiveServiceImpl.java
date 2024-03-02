package com.example.springboot.service.impl;

import com.example.springboot.entity.ActiveEntity;
import com.example.springboot.mapper.ActiveMapper;
import com.example.springboot.service.ActiveService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 活动 服务实现类
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Service
public class ActiveServiceImpl extends ServiceImpl<ActiveMapper, ActiveEntity> implements ActiveService {

}
