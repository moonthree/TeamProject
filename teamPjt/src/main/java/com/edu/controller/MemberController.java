package com.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	
	@RequestMapping(value = "/login.do")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value = "/join_select.do")
	public String join_select() {
		return "member/join_select";
	}
	
	
	@RequestMapping(value = "/join_company.do")
	public String join_company() {
		return "member/join_company";
	}

}
