package com.lren.interceptor;


import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //1.验证场景一：检查请求URL中是否包含：login
        if(request.getRequestURI().contains("login")) {
            return true;
        }
        //2.验证场景二：检查请求发送的数据：帐号 密码是否为空
        HttpSession session = request.getSession();
        if(session.getAttribute("email") != null) {
            return true;
        }
        //3.用户没有登录时的请求响应：false
            //请求转发，无法进入首页——>转发进入登录页面
        request.getRequestDispatcher("/admin.jsp").forward(request,response);
        return false;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
