package com.edu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
 
	private static final String LOGIN = "login";
    
    
    @Override
    public boolean preHandle(HttpServletRequest request, 
    	HttpServletResponse response,
        Object handler) throws Exception {
        
        HttpSession session = request.getSession();
        
        if(session.getAttribute(LOGIN) != null) {
        
            // 기존 HttpSession에 남아있는 정보가 있는 경우 이를 삭제
            session.removeAttribute(LOGIN);
        }
        
        return true;
    }
 
    @Override
    public void postHandle (HttpServletRequest request, HttpServletResponse response, Object handler,
        ModelAndView modelAndView) throws Exception {
        
//    	HttpSession session = request.getSession();
//    	Object obj = modelAndView.getModelMap().get("loginUserModel");
//        
//        if(obj != null) {
//        
//            // 로그인 성공시 Session에 저장후, 초기 화면 이동
//            session.setAttribute(LOGIN, obj);
//            response.sendRedirect("/");
//        }
    }
    
}