package com.example.elderapi.user.service.impl;

import com.example.elderapi.user.entity.UserEntity;
import com.example.elderapi.user.mapper.UserMapper;
import com.example.elderapi.user.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户 服务实现类
 * </p>
 *
 * @author he
 * @since 2024-07-09
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, UserEntity> implements UserService {

}
