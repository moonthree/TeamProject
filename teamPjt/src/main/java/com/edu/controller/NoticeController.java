package com.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {

	@RequestMapping(value = "/notice_list.do")
	public String notice_list() {
		
		return "notice/notice_list";
	}
	
	@RequestMapping(value = "/notice_write.do")
	public String notice_wirter() {
		
		
		
		return "notice/notice_write";
	}
}
