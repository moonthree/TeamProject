package com.edu.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.service.AdminService;
import com.edu.service.MessageService;
import com.edu.vo.PageMaker;
import com.edu.vo.PageMaker2;
import com.edu.vo.Pagination;
import com.edu.vo.Pagination2;

/*주석 version6*/


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

	@RequestMapping(value = "/management_member.do")
	public String management_member(Model model ,Pagination page1, Pagination2 page2) {
		
			System.out.println("메소드 들어옴");
			model.addAttribute("seller", adminService.memberList_sell(page1));
			PageMaker pageMaker_sell = new PageMaker();
			pageMaker_sell.setPage(page1);
			pageMaker_sell.setTotalCount(adminService.count_seller());
			model.addAttribute("pageMaker_sell", pageMaker_sell);
			
			System.out.println(adminService.memberList_sell(page1).toString());
		
			
			model.addAttribute("company", adminService.memberList_company(page2));
			PageMaker2 pageMaker_company = new PageMaker2();
			pageMaker_company.setPage(page2);
			pageMaker_company.setTotalCount(adminService.count_company());
			model.addAttribute("pageMaker_company", pageMaker_company);
			 
		
		return "mypage/management_member";
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
	    param.put("from_member_idx", 0);
	    param.put("to_member_idx", member_idx);
	    messageService.insertLog(param);
		
		return result;
	}

	
}
