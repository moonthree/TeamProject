package com.edu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        
        HttpSession session = request.getSession();
        
        if(session.getAttribute("login") != null) {
        
            // 로그인하지 않은 사용자일 경우 로그인 페이지로 이동
        	System.out.println("로그인 안됨 이동");
            response.sendRedirect("/member/login.do");
            return false;
        }
        
        // 로그인한 사용자일 경우 Controller 호출
        return true;
    }
}