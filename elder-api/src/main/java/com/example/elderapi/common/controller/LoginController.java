package com.example.elderapi.common.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.elderapi.common.resp.Result;
import com.example.elderapi.common.utils.JWTUtils;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@Tag(name = "登录注册")
@RestController
public class LoginController {
//
//    @Autowired
//    private UserService userService;
//    @Autowired
//    private RoleService roleService;
//    @Autowired
//    private RmMapper rmMapper;
//    @Autowired
//    private MenuService menuService;
//    @Autowired
//    private MenuMapper menuMapper;
//
//    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//
//    @Operation(summary = "用户登录")
//    @PostMapping("/login")
//    public Result<?> login(@RequestParam String acc, @RequestParam String pwd, @RequestParam String code, HttpSession session) {
//        //验证码比对
//        if (!session.getAttribute("code").equals(code)) {
//            return Result.failure("验证码错误");
//        }
//        //获取个人信息
//        QueryWrapper<UserEntity> wrapperUser = new QueryWrapper<>();
//        wrapperUser.eq("user_acc", acc);
//        UserEntity user = userService.getOne(wrapperUser);
//        //账号存在性
//        if (user == null) return Result.failure("账号不存在，登陆失败");
//        //账号是否正常
//        if (user.getUnlucky() == 0 || user.getUndock() == 0) return Result.failure("账号状态异常，请联系管理员处理");
//        //密码比对
//        pwd = DigestUtils.md5DigestAsHex(pwd.getBytes(StandardCharsets.UTF_8));
//        if (!pwd.equals(user.getPwd())) return Result.failure("密码错误，登陆失败");
//        //生成token
//        HashMap<String, String> map = new HashMap<>();
//        map.put("id", user.getId().toString());
//        map.put("acc", user.getAcc());
//        map.put("name", user.getName());
//        String token = JWTUtils.generateToken(map);
//        //获取角色
//        QueryWrapper<RoleEntity> wrapperRole = new QueryWrapper<>();
//        wrapperRole.eq("role_id", user.getRoleId());
//        RoleEntity role = roleService.getOne(wrapperRole);
//        if (role.getUndock() == 0) return Result.failure("登陆失败，用户角色存在异常");
//        //获取角色-菜单
//        QueryWrapper<RmEntity> wrapperRm = new QueryWrapper<>();
//        wrapperRm.eq("rm_role_id", role.getId()).eq("undock", 1);
//        List<RmEntity> listRm = rmMapper.selectList(wrapperRm);
//        //获取全部菜单
//        ArrayList<MenuEntity> listM = new ArrayList<>();
//        for (RmEntity rm : listRm) {
//            QueryWrapper<MenuEntity> wrapper = new QueryWrapper<>();
//            wrapper.eq("menu_id", rm.getMenuId()).eq("undock", 1);
//            MenuEntity menu = menuMapper.selectOne(wrapper);
//            if (menu != null) listM.add(menu);
//        }
//        //返回数据
//        HashMap<String, Object> hashMap = new HashMap<>();
//        hashMap.put("token", token);
//        hashMap.put("user", user);
//        hashMap.put("role", role);
//        hashMap.put("menu", listM);
//        return Result.success("登录成功", hashMap);
//    }
//
//    @Operation(summary = "用户注册")
//    @PostMapping("/register")
//    public Result<?> register(@RequestParam String acc, @RequestParam String pwd, @RequestParam String name, @RequestParam String sex, @RequestParam String birth, @RequestParam String code, HttpSession session) {
//        //验证码比对
//        if (!session.getAttribute("code").equals(code)) {
//            return Result.failure("验证码错误");
//        }
//        //密码加密
//        pwd = DigestUtils.md5DigestAsHex(pwd.getBytes(StandardCharsets.UTF_8));
//        //获取个人信息
//        long count = userService.count(new QueryWrapper<UserEntity>().eq("user_acc", acc));
//        if (count != 0) return Result.failure("账号（电话号码已存在），请更换手机号！");
//        //注册
//        UserEntity user = new UserEntity();
//        user.setAcc(acc);
//        user.setPwd(pwd);
//        user.setBirth(birth);
//        user.setName(name);
//        user.setSex(sex);
//        user.setRoleId(4);
//        boolean save = userService.save(user);
//        if (save) return Result.success("注册成功，请返回登陆");
//        return Result.failure("系统超时，请稍后尝试");
//    }
//
//    @Operation(summary = "找回密码")
//    @PostMapping("/forget")
//    public Result<?> forget(@RequestBody @Validated UserEntity entity) {
//        //账号存在性
//        QueryWrapper<UserEntity> wrapper = new QueryWrapper<>();
//        wrapper.eq(("user_acc"), entity.getAcc());
//        if (userService.count(wrapper) == 0) return Result.failure("账号不存在");
//        //验证信息
//        UserEntity user = userService.getOne(wrapper);
//        if (!Objects.equals(user.getName(), entity.getName()) && !Objects.equals(user.getSex(), entity.getSex()) && !Objects.equals(user.getBirth(), entity.getBirth())) {
//            return Result.failure("信息错误，找回失败");
//        }
//        user.setPwd(DigestUtils.md5DigestAsHex(entity.getPwd().getBytes(StandardCharsets.UTF_8)));
//        //设置修改者
//        entity.setUpdateBy(entity.getName());
//        entity.setUpdateTime(sdf.format(new Date()));
//        if (userService.updateById(user)) return Result.success("成功，密码重置为：123456");
//        return Result.failure("系统超时，找回失败");
//    }
//
//    @Operation(summary = "修改密码")
//    @PostMapping("/chnagePwd")
//    public Result<?> chnagePwd(@RequestParam String acc, @RequestParam String pwd, @RequestParam String newPwd) {
//        //密码加密
//        pwd = DigestUtils.md5DigestAsHex(pwd.getBytes(StandardCharsets.UTF_8));
//        newPwd = DigestUtils.md5DigestAsHex(newPwd.getBytes(StandardCharsets.UTF_8));
//        //获取个人信息
//        UserEntity user = userService.getOne(new QueryWrapper<UserEntity>().eq("user_acc", acc));
//        //密码验证
//        String userPwd = user.getPwd();
//        if (!userPwd.equals(pwd)) return Result.failure("原密码错误，修改失败");
//        //修改密码
//        user.setPwd(newPwd);
//        boolean update = userService.updateById(user);
//        if (update) return Result.success("修改成功，请重新登陆");
//        return Result.failure("系统超时，请稍后尝试");
//    }

}
