package com.edu.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@RequestMapping(value = "/introduction")
@Controller
public class IntroductionController {
	
	
	@RequestMapping(value="/introduction.do")
	public String introduction() {
		return "introduction/introduction";
	}
}
