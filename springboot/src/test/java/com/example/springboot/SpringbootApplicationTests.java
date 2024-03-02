package com.example.springboot;

import com.alibaba.excel.EasyExcel;
import com.example.common.resp.Result;
import com.example.springboot.entity.SwiperEntity;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@SpringBootTest
class SpringbootApplicationTests {

    @Test
    void contextLoads() {
        String a = "AAA";
        System.out.println(a.toLowerCase(Locale.ROOT));
    }

    public static void main(String[] args) {
//        String a="AAA";
//        System.out.println(a.toLowerCase(Locale.ROOT));
//        Date date = new Date();
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        System.out.println(sdf.format(date).toString());

//        File file = new File("D:\\Downloads\\utf-8''轮播图 (1).xlsx");

    }

}
