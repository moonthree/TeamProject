package com.edu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        
//    	System.out.println("AuthInterceptor.pre>>");
        HttpSession session = request.getSession();
        
        // 로그인하지 않은 사용자일 경우 로그인 페이지로 이동
		if( session.getAttribute(LOGIN) == null) {
//			System.out.println("session is null");
			String uri = request.getRequestURI();
			String query = request.getQueryString();
			String path = uri;
			
			if(request.getMethod().equalsIgnoreCase("get")) {
				if(query == null) {
					path = uri;
				}else {
					path = uri + "?" + query;
				}
			}
			session.setAttribute("dest", path.substring(5));
			response.sendRedirect("../member/login.do");
			return false;
		}
		// 로그인한 사용자일 경우 Controller 호출
		return true;
    }
}