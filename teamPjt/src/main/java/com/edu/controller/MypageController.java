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
	
	
}