//package store.controller;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import store.bean.ResponseResult;
//import store.bean.User;
//import store.service.UserService;
//import store.util.CaptchaUtil;
//
//@Controller
//public class UserController {
//
//    @Autowired
//    private UserService userService;
//
//    /**
//     * 跳转到登录页面
//     */
//    @GetMapping("/login")
//    public String toLogin() {
//        return "login";
//    }
//
//    /**
//     * 跳转到注册页面
//     */
//    @GetMapping("/register")
//    public String toRegister() {
//        return "register";
//    }
//
//    /**
//     * 用户登录处理
//     */
//    @PostMapping("/login")
//    @ResponseBody
//    public ResponseResult login(
//            @RequestParam("username") String username,
//            @RequestParam("password") String password,
//            @RequestParam(value = "captcha", required = false) String captcha,
//            HttpSession session) {
//
//        // 验证用户名和密码是否为空
//        if(username == null || username.trim().isEmpty()) {
//            return ResponseResult.error("用户名不能为空");
//        }
//        if(password == null || password.trim().isEmpty()) {
//            return ResponseResult.error("密码不能为空");
//        }
//
//        // 检查是否需要验证码
//        User tempUser = userService.getUserByUsername(username);
//        if(tempUser != null && tempUser.getLoginAttempts() >= 3) {
//            // 需要验证码
//            String sessionCaptcha = (String) session.getAttribute("captcha");
//            if(!userService.validateCaptcha(captcha, sessionCaptcha)) {
//                return ResponseResult.error("验证码错误");
//            }
//        }
//
//        // 登录验证
//        ResponseResult result = userService.login(username, password);
//
//        // 如果登录成功，将用户信息存入session
//        if(result.getState() == ResponseResult.SUCCESS) {
//            User user = (User) result.getData();
//            session.setAttribute("user", user);
//
//            // 更新登录时间
//            userService.updateLoginStatus(username);
//        }
//
//        return result;
//    }
//
//    /**
//     * 生成验证码
//     */
//    @GetMapping("/captcha")
//    public void generateCaptcha(HttpSession session) {
//        // 生成验证码，并将验证码存入session
//        String captcha = CaptchaUtil.generateCaptcha();
//        session.setAttribute("captcha", captcha);
//    }
//
//    /**
//     * 检查用户名是否存在
//     */
//    @GetMapping("/check_username")
//    @ResponseBody
//    public ResponseResult checkUsername(@RequestParam("username") String username) {
//        boolean exists = userService.checkUsername(username);
//        if(exists) {
//            return ResponseResult.error("用户名已存在");
//        } else {
//            return ResponseResult.success();
//        }
//    }
//
//    /**
//     * 用户注册
//     */
//    @PostMapping("/register")
//    @ResponseBody
//    public ResponseResult register(User user) {
//        return userService.register(user);
//    }
//
//    /**
//     * 用户登出
//     */
//    @GetMapping("/logout")
//    public String logout(HttpSession session) {
//        session.invalidate();
//        return "redirect:/login";
//    }
//
//    /**
//     * 解锁用户
//     */
//    @PostMapping("/unlock_user")
//    @ResponseBody
//    public ResponseResult unlockUser(@RequestParam("username") String username) {
//        return userService.unlockUser(username);
//    }
//}