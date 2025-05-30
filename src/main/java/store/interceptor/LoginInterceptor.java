package store.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import store.bean.User;

public class LoginInterceptor implements HandlerInterceptor {
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // 获取请求的URL
        String url = request.getRequestURI();
        
        // 不需要拦截的URL
        if (url.contains("/login") || url.contains("/register") || 
            url.contains("/captcha") || url.contains("/check_username") || 
            url.contains("/assets") || url.contains("/css") || 
            url.contains("/js") || url.contains("/images") || url.contains("/Widgt")
                || url.contains("/products")|| url.contains("/font")|| url.contains("/doLogin")
                || url.contains("/doRegister")) {
            return true;
        }
        
        // 获取Session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        // 判断是否已登录
        if (user != null) {
            return true;
        }
        
        // 未登录则跳转到登录页面
        response.sendRedirect(request.getContextPath() + "/login");
        return false;
    }
    
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        // 无需实现
    }
    
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // 无需实现
    }
}