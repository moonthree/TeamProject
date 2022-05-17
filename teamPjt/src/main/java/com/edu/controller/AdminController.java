package com.edu.controller;

import java.net.http.HttpRequest;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.service.AdminService;
import com.edu.vo.FundingCommunityVO;
import com.edu.service.MessageService;
import com.edu.vo.MemberVO;
import com.edu.vo.PageMaker;
import com.edu.vo.PageMaker2;
import com.edu.vo.Pagination;
import com.edu.vo.Pagination2;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value = "/approval.do")
	public String approval(Model model) {
		//펀딩 신청한 제품 목록 가져오기
		model.addAttribute("listFun", adminService.list_funding());
		return "mypage/approval";
	}

	@RequestMapping(value = "/management_product.do")
	public String management_product() {
		return "mypage/management_product";
	}
	
	//@RequestParam(required = false)
	
	@RequestMapping(value = "/management_member.do", method = RequestMethod.GET)
	public String management_member(Model model,  Pagination page , 
	 Pagination2 page2, HttpServletRequest request, String check) {
		System.out.println("들어옴 들어옴");
		System.out.println("page파라미터 : " + page.getPage());
		System.out.println(check);
		System.out.println("page2 파라미터 : " + page2.getPage());
		
		System.out.println("----------------------");
		if(check.equals(null)) {
			check = "3";
		}
		
		if(("3".equals(check)) ) {
		model.addAttribute("seller", adminService.memberList_sell(page));
		PageMaker pageMaker_sell = new PageMaker();
		pageMaker_sell.setPage(page);
		pageMaker_sell.setTotalCount(adminService.count_seller());
		
		  model.addAttribute("seller", adminService.memberList_sell(page));
		  model.addAttribute("pageMaker_sell", pageMaker_sell);
		
		  model.addAttribute("company", adminService.memberList_company(page2));
		 PageMaker2 pageMaker_company = new PageMaker2();
			pageMaker_company.setPage(page2);
			pageMaker_company.setTotalCount(adminService.count_company());
			model.addAttribute("company", adminService.memberList_company(page2));
			model.addAttribute("pageMaker_company", pageMaker_company);
		}
		
		
		else if(check.charAt(0) == '0') {
			System.out.println("소비자  들어옴");
			model.addAttribute("seller", adminService.memberList_sell(page));
			PageMaker pageMaker_sell = new PageMaker();
			pageMaker_sell.setPage(page);
			pageMaker_sell.setTotalCount(adminService.count_seller());
			
			  model.addAttribute("seller", adminService.memberList_sell(page));
			  model.addAttribute("pageMaker_sell", pageMaker_sell);
			 
			System.out.println("page1 : "+adminService.memberList_sell(page).toString());
		}
			
		else {	
			
			System.out.println("판매자 들어옴");
			
			model.addAttribute("company", adminService.memberList_company(page2));
			PageMaker2 pageMaker_company = new PageMaker2();
			pageMaker_company.setPage(page2);
			pageMaker_company.setTotalCount(adminService.count_company());
			model.addAttribute("company", adminService.memberList_company(page2));
			model.addAttribute("pageMaker_company", pageMaker_company);
			System.out.println("page2 : "+adminService.memberList_company(page2).toString());
			
		}
		
		
		return "mypage/management_member";
	}
	
	@RequestMapping(value = "/getTestList.do")
	public String testListDo(Model model ,Pagination page) throws Exception {
		model.addAttribute("seller", adminService.memberList_sell(page));
		PageMaker pageMaker_sell = new PageMaker();
		pageMaker_sell.setPage(page);
		pageMaker_sell.setTotalCount(adminService.count_seller());
		model.addAttribute("pageMaker_sell", pageMaker_sell);
		
		return "/admin/member_sell";
			
	}
	
	/*
	@RequestMapping(value = "/productPage_sell.do")
	public String productPage_sell(Model model,Pagination page) {
		
		
		//소비자 계정  model에 담기
		model.addAttribute("seller", adminService.memberList_sell(page));
		PageMaker pageMaker_sell = new PageMaker();
		pageMaker_sell.setPage(page);
		pageMaker_sell.setTotalCount(adminService.count_seller());
		model.addAttribute("pageMaker_sell", pageMaker_sell);
		
		
		return "mypage/page_product/productPage_sell";
	}
	*/
	
	
	
	//펀딩 제품 상태 변경하기 위한 ajax 컨트롤러
	@RequestMapping(value = "/update_FundingState.do")
	@ResponseBody
	public int updateFundingState(int f_idx) {
		
		// update 쿼리문
		int result = adminService.update_funding(f_idx);
		
		// funding 신청한 사람의  member_idx를 가져오기
		int member_idx = messageService.getMemberIdx(f_idx);
		System.out.println("f_idx : "+f_idx+"에 따른 member_idx : "+member_idx);
		
		// message 테이블에 로그 남기기 insert
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("f_idx", f_idx);
		param.put("member_idx", member_idx);
		messageService.insertLog(param);
		
		return result;
	}
	
	//펀딩 제품 상태 변경하기 위한 ajax 컨트롤러
	@RequestMapping(value = "/update_FundingState2.do")
	@ResponseBody
	public int updateFundingState2(int f_idx) {
		
		// update 쿼리문
		int result = adminService.update_funding2(f_idx);
		return result;
	}

	
}
