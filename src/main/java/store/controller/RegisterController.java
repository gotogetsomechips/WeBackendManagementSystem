package store.controller;

import store.bean.User;
import store.service.UserService;
import store.util.CaptchaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class RegisterController {

    @Autowired
    private UserService userService;

    /**
     * 处理用户注册
     */
    @RequestMapping(value = "/doRegister", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doRegister(String username, String password,
                                          String email, String phone,
                                          String captcha, HttpSession session) {
        Map<String, Object> result = new HashMap<>();

//        // 1. 验证验证码
//        String sessionCaptcha = (String) session.getAttribute("captcha");
//        if (captcha == null || !captcha.equalsIgnoreCase(sessionCaptcha)) {
//            result.put("success", false);
//            result.put("message", "验证码错误");
//            return result;
//        }

        // 2. 检查用户名是否已存在
        if (userService.getUserByUsername(username) != null) {
            result.put("success", false);
            result.put("message", "用户名已存在");
            return result;
        }

        // 3. 检查邮箱是否已存在
        // 这里需要先在UserService和UserMapper中添加根据邮箱查询用户的方法
        // 暂时省略，可以根据实际需求添加

        // 4. 创建新用户
        User user = new User();
        user.setUsername(username);
        user.setPassword(password); // 实际项目中密码应该加密存储
        user.setEmail(email);
        user.setPhone(phone);
        user.setStatus(0); // 0表示正常状态
        user.setLoginAttempts(0); // 初始登录尝试次数为0
        user.setCreateTime(new Date());
        user.setLastLoginTime(null); // 首次注册，最后登录时间为空

        try {
            // 保存用户
            userService.addUser(user);
            result.put("success", true);
            result.put("message", "注册成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "注册失败，请稍后重试");
        }

        return result;
    }

    /**
     * 检查用户名是否可用
     */
    @RequestMapping("/checkUsername")
    @ResponseBody
    public Map<String, Object> checkUsername(String username) {
        Map<String, Object> result = new HashMap<>();
        boolean exists = userService.getUserByUsername(username) != null;
        result.put("exists", exists);
        result.put("available", !exists);
        return result;
    }

    /**
     * 检查邮箱是否可用
     * 需要先在UserService和UserMapper中添加相关方法
     */
    @RequestMapping("/checkEmail")
    @ResponseBody
    public Map<String, Object> checkEmail(String email) {
        Map<String, Object> result = new HashMap<>();
        // 实现邮箱检查逻辑
        result.put("exists", false); // 暂时返回false，实际项目中需要实现
        result.put("available", true);
        return result;
    }
}