package com.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.service.AdminService;
import com.edu.vo.PageMaker;
import com.edu.vo.Pagination;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	
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

	@RequestMapping(value = "/management_member.do", method = RequestMethod.GET)
	public String management_member(Model model,Pagination page) {
		
		//소비자 계정  model에 담기
		model.addAttribute("seller", adminService.memberList_sell(page));
		PageMaker pageMaker_sell = new PageMaker();
		pageMaker_sell.setPage(page);
		pageMaker_sell.setTotalCount(adminService.count_seller());
		model.addAttribute("pageMaker_sell", pageMaker_sell);
		
		//판매자 계정  model에 담기
		model.addAttribute("company", adminService.memberList_company(page));
		PageMaker pageMaker_company = new PageMaker();
		pageMaker_company.setPage(page);
		pageMaker_company.setTotalCount(adminService.count_company());
		model.addAttribute("pageMaker_company", pageMaker_company);
		
		return "mypage/management_member";
	}
	
	//펀딩 제품 상태 변경하기 위한 ajax 컨트롤러
	@RequestMapping(value = "/update_FundingState.do")
	@ResponseBody
	public int updateFundingState(int f_idx) {
		
		// update 쿼리문
		int result = adminService.update_funding(f_idx);
		return result;
	}

	
}