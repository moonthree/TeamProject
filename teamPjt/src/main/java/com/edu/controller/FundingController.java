package com.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


// Funding에 관련된 모든 동작 수행
@Controller
@RequestMapping(value = "/funding")
public class FundingController {

	
	@RequestMapping(value = "/main.do")
	public String main() {
		
		
		return "funding/main";
	}
	
}
