package com.edu.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.vo.FundingMainVO;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController {

	@RequestMapping(value = "/mypage.do")
	public String mypage() {
		
		
		return "mypage/mypage";
	}
	@RequestMapping(value = "/mypage2.do")
	public String mypage2() {
		return "mypage/mypage2";
	}
	
	/* 펀딩 등록 메소드*/
	@RequestMapping(value = "/funding_register.do")
	public String funding_register() {
		return "mypage/funding_register";
	}
	
	
	/*펀딩 미리보기 페이지*/
	@RequestMapping(value="/funding_view.do", method = RequestMethod.POST)
	public String funding_view1(FundingMainVO vo, Model model) throws ParseException {
		System.out.println("view.들어옴");
		System.out.println(vo.toString());
		
		
		System.out.println(vo.getFunding_end_date());
		System.out.println(vo.getFunding_start_date());
		
		String from = vo.getFunding_end_date() +" 00:00:00";
		System.out.println(from);
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date to = fm.parse(from);
		long d2= to.getTime();
		
		System.out.println("하하하 : " +d2);
		
		Date date1 = new Date(d2);
		System.out.println(date1);
		
		model.addAttribute("funding", vo);
		
		return "mypage/funding_view";
	}
	
	

	
	@RequestMapping(value = "/approval.do")
	public String approval() {
		return "mypage/approval";
	}
	
	@RequestMapping(value = "/management_product.do")
	public String management_product() {
		return "mypage/management_product";
	}
	
	@RequestMapping(value = "/management_member.do")
	public String management_member() {
		return "mypage/management_member";
	}
	
	@RequestMapping(value = "/info_funding.do")
	public String info_funding() {
		return "mypage/info_funding";
	}
	
	@RequestMapping(value = "/info_funding_detail.do")
	public String info_funding_detail() {
		return "mypage/info_funding_detail";
	}
	
	@RequestMapping(value = "/info_zzim.do")
	public String info_zzim() {
		return "mypage/info_zzim";
	}
	
	@RequestMapping(value = "/my_info.do")
	public String my_info() {
		return "mypage/my_info";
	}
	
	@RequestMapping(value = "/my_info_modify.do")
	public String my_info_modify() {
		return "mypage/my_info_modify";
	}
	
	
}
