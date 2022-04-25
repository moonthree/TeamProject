package com.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController {

	@RequestMapping(value = "/mypage.do")
	public String mypage() {
		
		
		return "mypage/mypage";
	}
	@RequestMapping(value = "/mypage2.do")
	public String mypage2() {
		return "mypage/mypage2";
	}
	
	@RequestMapping(value = "/funding_register.do")
	public String funding_register() {
		return "mypage/funding_register";
	}
	
	@RequestMapping(value = "/approval.do")
	public String approval() {
		return "mypage/approval";
	}
	
	
	
	
}
