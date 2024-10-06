package com.example.elderapi.common.config;

import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    /**
     * 添加拦截器
     *
     * @param registry 注册拦截器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        String[] swaggerExcludes = new String[]{"/swagger**/**", "/doc.html", "/swagger-resources/**", "/webjars/**", "/v3/**"};

        registry.addInterceptor(new JwtInterceptor())
                // 拦截所有请求，通过判断是否有 @JwtToken 注解 决定是否需要登录
                .addPathPatterns("/**")
                .excludePathPatterns(swaggerExcludes)
        ;
    }
}


