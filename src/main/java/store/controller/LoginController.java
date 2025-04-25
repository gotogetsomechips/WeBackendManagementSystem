package store.controller;

import store.bean.User;
import store.service.UserService;
import store.util.CaptchaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    /**
     * 登录页面
     */
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doLogin(String username, String password, String captcha, HttpSession session) {
        Map<String, Object> result = new HashMap<>();

        // 检查是否需要验证码
        boolean needCaptcha = userService.needCaptcha(username);

        // 需要验证码但未提供或验证码错误
        if (needCaptcha) {
            String sessionCaptcha = (String) session.getAttribute("captcha");
            if (captcha == null || captcha.trim().isEmpty()) {
                result.put("success", false);
                result.put("message", "请输入验证码");
                result.put("needCaptcha", true);
                return result;
            }

            if (!captcha.equalsIgnoreCase(sessionCaptcha)) {
                // 验证码错误也计入登录失败次数
                User user = userService.getUserByUsername(username);
                if (user != null) {
                    int attempts = user.getLoginAttempts() + 1;
                    userService.updateLoginAttempts(user.getId(), attempts);

                    // 检查是否需要锁定账户
                    if (attempts >= 6) {
                        userService.lockUser(user.getId());
                        result.put("success", false);
                        result.put("message", "密码错误次数过多，账户已被锁定，请联系管理员解锁");
                        result.put("needCaptcha", true);
                        return result;
                    }
                }

                result.put("success", false);
                result.put("message", "验证码错误");
                result.put("needCaptcha", true);
                return result;
            }
        }

        // 登录验证
        int loginResult = userService.login(username, password);
        User user = userService.getUserByUsername(username);

        switch (loginResult) {
            case 0: // 登录成功
                session.setAttribute("user", user);
                result.put("success", true);
                result.put("message", "登录成功");
                break;
            case 1: // 用户名不存在
                result.put("success", false);
                result.put("message", "用户名不存在");
                break;
            case 2: // 密码错误
                // 检查登录失败次数是否已达到需要验证码的阈值
                boolean nowNeedCaptcha = userService.needCaptcha(username);
                result.put("success", false);
                result.put("message", "密码错误");
                result.put("needCaptcha", nowNeedCaptcha);

                // 检查是否已被锁定
                if (user != null && user.getLoginAttempts() + 1 >= 6) {
                    result.put("message", "密码错误次数过多，账户已被锁定，请联系管理员解锁");
                } else if (user != null) {
                    result.put("message", "密码错误，还剩" + (6 - (user.getLoginAttempts() + 1)) + "次机会");
                }
                break;
            case 3: // 账户已锁定
                result.put("success", false);
                result.put("message", "账户已被锁定，请联系管理员解锁");
                break;
        }

        return result;
    }

    /**
     * 生成验证码
     */
    @RequestMapping("/captcha")
    public void generateCaptcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 清除浏览器缓存
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");

        // 生成验证码
        String captcha = CaptchaUtil.generateCaptcha(response.getOutputStream());

        // 将验证码保存到session
        request.getSession().setAttribute("captcha", captcha);
    }

    /**
     * 检查是否需要验证码
     */
    @RequestMapping("/needCaptcha")
    @ResponseBody
    public Map<String, Object> needCaptcha(String username) {
        Map<String, Object> result = new HashMap<>();
        result.put("needCaptcha", userService.needCaptcha(username));
        return result;
    }

    /**
     * 退出登录
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    /**
     * 首页
     */
    @RequestMapping("/index")
    public String index(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            model.addAttribute("username", user.getUsername());
        }
        return "index";
    }
    @RequestMapping("/home")
    public String home() {
        return "home";
    }
    @RequestMapping("/Products_List")
    public String Products_List() {
        return "Products_List";
    }
    @RequestMapping("/Brand_Manage")
    public String Brand_Manage() {
        return "Brand_Manage";
    }
    @RequestMapping("/Category_Manage")
    public String Category_Manage() {
        return "Category_Manage";
    }
    @RequestMapping("/advertising")
    public String advertising() {
        return "advertising";
    }
    @RequestMapping("/Sort_ads")
    public String Sort_ads() {
        return "Sort_ads";
    }
    @RequestMapping("/transaction")
    public String transaction() {
        return "transaction";
    }
    @RequestMapping("/Order_Chart")
    public String Order_Chart() {
        return "Order_Chart";
    }
    @RequestMapping("/Orderform")
    public String Orderform() {
        return "Orderform";
    }
    @RequestMapping("/Amounts")
    public String Amounts() {
        return "Amounts";
    }
    @RequestMapping("/Order_handling")
    public String Order_handling() {
        return "Order_handling";
    }
    @RequestMapping("/Refund")
    public String Refund() {
        return "Refund";
    }
    @RequestMapping("/Cover_management")
    public String Cover_management() {
        return "Cover_management";
    }
    @RequestMapping("/payment_method")
    public String payment_method() {
        return "payment_method";
    }
    @RequestMapping("/Payment_Configure")
    public String Payment_Configure() {
        return "Payment_Configure";
    }
    @RequestMapping("/user_list")
    public String user_list() {
        return "user_list";
    }
    @RequestMapping("/member-Grading")
    public String member_Grading() {
        return "member-Grading";
    }
    @RequestMapping("/integration")
    public String integration() {
        return "integration";
    }
    @RequestMapping("/Shop_list")
    public String Shop_list() {
        return "Shop_list";
    }
    @RequestMapping("/Shops_Audit")
    public String Shops_Audit() {
        return "Shops_Audit";
    }
    @RequestMapping("/Guestbook")
    public String Guestbook() {
        return "Guestbook";
    }
    @RequestMapping("/Feedback")
    public String Feedback() {
        return "Feedback";
    }
    @RequestMapping("/article_list")
    public String article_list() {
        return "article_list";
    }
    @RequestMapping("/article_Sort")
    public String article_Sort() {
        return "article_Sort";
    }
    @RequestMapping("/Systems")
    public String Systems() {
        return "Systems";
    }
    @RequestMapping("/System_section")
    public String System_section() {
        return "System_section";
    }
    @RequestMapping("/register")
    public String register() {
        return "register";
    }
    @RequestMapping("/System_Logs")
    public String System_Logs() {
        return "System_Logs";
    }
    @RequestMapping("/admin_Competence")
    public String admin_Competence() {
        return "admin_Competence";
    }
    @RequestMapping("/administrator")
    public String administrator() {
        return "administrator";
    }
    @RequestMapping("/admin_info")
    public String admin_info() {
        return "admin_info";
    }

}
