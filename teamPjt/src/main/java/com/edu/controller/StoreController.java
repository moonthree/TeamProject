package com.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/store")
public class StoreController {

	// 스토어 메인페이지 
	@RequestMapping(value = "/store_main.do")
	public String main() {
		return "store/store_main";
	}
	// 스토어 뷰페이지 
	@RequestMapping(value = "/store_view.do")
	public String store_view() {
		return "store/store_view";
	}
	
	
}
