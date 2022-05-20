package com.edu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor3 extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        
        HttpSession session = request.getSession();
        String uri = request.getRequestURI();
        String query = request.getQueryString();
        String path = uri;
		
        System.out.println(query.length());
        // 뷰에 접속
		if(query.length() > 90) {
			// 로그인하지 않은 사용자일 경우 로그인 페이지로 이동
			System.out.println(query.length());
			if( session.getAttribute(LOGIN) == null) {
				if(request.getMethod().equalsIgnoreCase("get")) {
					path = uri + "?" + query;
				}
				session.setAttribute("dest", path.substring(5));
				response.sendRedirect("../member/login.do");
				return false;
			}
		}
		// 로그인한 사용자일 경우 Controller 호출
		return true;
    }
}