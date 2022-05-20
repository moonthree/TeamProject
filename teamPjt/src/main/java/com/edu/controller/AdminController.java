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
	public String approval(Model model,Pagination page1, Pagination2 page2) {
		
		//펀딩 신청한 제품 목록 가져오기
		model.addAttribute("listFun", adminService.list_funding(page1));
		
		PageMaker pageMaker_One = new PageMaker();
		pageMaker_One.setPage(page1);
		pageMaker_One.setTotalCount(adminService.funding_Count());
		model.addAttribute("pageOne", pageMaker_One);
		
		//스토어 신청한 제품 목록 가져오기 
		model.addAttribute("listStore", adminService.list_store(page2));
		PageMaker2 pageMaker_Two = new PageMaker2();
		pageMaker_Two.setPage(page2);
		pageMaker_Two.setTotalCount(adminService.store_Count());
		model.addAttribute("pageTwo", pageMaker_Two);
		
		return "mypage/approval";
	}

	@RequestMapping(value = "/management_product.do")
	public String management_product() {
		return "mypage/management_product";
	}

	@RequestMapping(value = "/management_member.do")
	public String management_member(Model model ,Pagination page1, Pagination2 page2) {
		
			
			
			model.addAttribute("seller", adminService.memberList_sell(page1));
			PageMaker pageMaker_sell = new PageMaker();
			pageMaker_sell.setPage(page1);
			pageMaker_sell.setTotalCount(adminService.count_seller());
			model.addAttribute("pageMaker_sell", pageMaker_sell);
			
			model.addAttribute("company", adminService.memberList_company(page2));
			PageMaker2 pageMaker_company = new PageMaker2();
			pageMaker_company.setPage(page2);
			pageMaker_company.setTotalCount(adminService.count_company());
			model.addAttribute("pageMaker_company", pageMaker_company);
			 
		
		return "mypage/management_member";
	}
	
	
	//펀딩 제품 상태 변경하기 위한 ajax 컨트롤러 -> 승인 허용
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
	
	//펀딩 제품 상태 거절하기 위한 ajax 컨트롤러 -> 승인 거절
		@RequestMapping(value = "/update_FundingState2.do")
		@ResponseBody
		public int updateFundingState2(int f_idx) {
			
			// update 쿼리문
			int result = adminService.update_funding2(f_idx);
			return result;
		}
		
	
		//스토어 제품 상태 변경하기 위한 ajax 컨트롤러 -> 승인 허용
		@RequestMapping(value = "/update_StoreState.do")
		@ResponseBody
		public int updateStoreState(int store_idx) {
			
			// update 쿼리문
			int result = adminService.update_store(store_idx);
			
			/*
			// funding 신청한 사람의  member_idx를 가져오기
		    int member_idx = messageService.getMemberIdx(store_idx);
		    System.out.println("f_idx : "+store_idx+"에 따른 member_idx : "+member_idx);
		      
		    // message 테이블에 로그 남기기 insert
		    Map<String, Object> param = new HashMap<String, Object>();
		    param.put("f_idx", store_idx);
		    param.put("from_member_idx", 0);
		    param.put("to_member_idx", member_idx);
		    messageService.insertLog(param);
		    */
			
			return result;
		}
		
		//스토어 제품 상태 거절하기 위한 ajax 컨트롤러 -> 스토어 승인 거절
			@RequestMapping(value = "/update_StoreState2.do")
			@ResponseBody
			public int updateStoreState2(int store_idx) {
				
				// update 쿼리문
				int result = adminService.update_store2(store_idx);
				return result;
			}
		
		

	
}
