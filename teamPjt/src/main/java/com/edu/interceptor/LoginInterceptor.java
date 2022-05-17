package com.edu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.edu.vo.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
 
	private static final String LOGIN = "login";
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        
//    	System.out.println("LoginInterceptor.pre>>");
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute(LOGIN) != null) {
			// 기존 HttpSession에 남아있는 정보가 있는 경우 이를 삭제
			session.removeAttribute(LOGIN);
		}
        return true;
    }
 
    @Override
    public void postHandle (HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    	HandlerMethod method = (HandlerMethod) handler;
//		System.out.println("MMMM>> Bean: " + method.getBean() + ", Method: " + method.getMethod());
//		System.out.println("MMMM>> Model: " + modelAndView);
    	try {
    		MemberVO user = (MemberVO)modelAndView.getModelMap().get("user");
//        System.out.println("LoginInterceptor.post>>" + user);
    		
    		if(user != null) {
    			
    			HttpSession session = request.getSession();
    			// 로그인 성공시 Session에 저장
    			session.setAttribute(LOGIN, user);
    		}
    	}catch(NullPointerException e) {
    		System.out.println("loginInterceptor null");
    	}
    }
    
}