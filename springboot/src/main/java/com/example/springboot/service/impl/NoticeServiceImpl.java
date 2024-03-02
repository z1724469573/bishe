package com.example.springboot.service.impl;

import com.example.springboot.entity.NoticeEntity;
import com.example.springboot.mapper.NoticeMapper;
import com.example.springboot.service.NoticeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 公告 服务实现类
 * </p>
 *
 * @author he
 * @since 2024-02-20
 */
@Service
public class NoticeServiceImpl extends ServiceImpl<NoticeMapper, NoticeEntity> implements NoticeService {

}
