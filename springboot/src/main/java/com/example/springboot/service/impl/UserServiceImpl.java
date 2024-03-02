package com.example.springboot.service.impl;

import com.example.springboot.entity.UserEntity;
import com.example.springboot.mapper.UserMapper;
import com.example.springboot.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户 服务实现类
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, UserEntity> implements UserService {

}
