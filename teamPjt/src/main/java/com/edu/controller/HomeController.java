package com.edu.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.service.SearchService;
import com.edu.service.fundingMainService;
import com.edu.vo.PageMaker;
import com.edu.vo.SearchCriteria;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/")
public class HomeController {
	@Autowired
	private SearchService service;

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
	
	@RequestMapping(value = "/search.do", method = RequestMethod.GET)
	public String searchFundinglist(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		
		model.addAttribute("searchFundinglist", service.listSearch(scri));
		model.addAttribute("searchFundingCount", service.searchFundingCount(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPage(scri);
		pageMaker.setTotalCount(service.searchFundingCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "search";
		
	}
}
