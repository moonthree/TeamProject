package com.edu.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	
		
		
		return "home";
	}
	
	@RequestMapping(value = "/header.do")
	public String header(Locale locale, Model model) {
	
		//git commit용
		return "header";
	}
	
	@RequestMapping(value = "/footer.do")
	public String footer(Locale locale, Model model) {
	
		//git commit용
		return "footer";
	}
	
	
	@RequestMapping(value = "/index.do")
	public String home2() {
	
	
		return "home";
	}
	
	@RequestMapping(value = "/search.do")
	public String search() {
		
		return "search";
	}
}
