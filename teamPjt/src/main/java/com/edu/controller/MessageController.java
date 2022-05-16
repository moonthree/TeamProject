package com.edu.controller;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/")
public class MessageController {

	//message
	@RequestMapping(value = "/message.do")
	@Scheduled(fixedDelay=1000) 
	public String message() {
		System.out.println("하하하하하");
		return "message";
	}
	

	
}
