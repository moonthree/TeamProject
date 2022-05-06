package com.edu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.vo.FundingMainVO;
import com.edu.vo.Funding_optionVO;
import com.edu.vo.PageMaker;
import com.edu.vo.Pagination;
import com.edu.service.fundingMainService;


// Funding에 관련된 모든 동작 수행
@Controller
@RequestMapping(value = "/funding")
public class FundingController {

	// 펀딩 메인페이지 카테고리
	@RequestMapping(value = "/main.do")
	public String main() {
		return "funding/main";
	}
	
	@RequestMapping(value = "/main_cat.do")
	public String main_cat() {
		return "funding/main_cat";
	}
	
	@RequestMapping(value = "/main_other.do")
	public String main_other() {
		return "funding/main_other";
	}
	
	
	// 펀딩 메인페이지에 데이터 가져와서 출력하기
	@Autowired
	private fundingMainService fms;
		
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String listDog(Model model, Pagination page) throws Exception {
		
		model.addAttribute("listDog",fms.listDog(page));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPage(page);
		pageMaker.setTotalCount(fms.listDogCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "funding/main";
	}
	@RequestMapping(value="/main_cat.do", method=RequestMethod.GET)
	public String listCat(Model model, Pagination page) throws Exception {
		
		model.addAttribute("listCat",fms.listCat(page));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPage(page);
		pageMaker.setTotalCount(fms.listCatCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "funding/main_cat";
	}
	@RequestMapping(value="/main_other.do", method=RequestMethod.GET)
	public String listOther(Model model, Pagination page) throws Exception {
		
		model.addAttribute("listOther",fms.listOther(page));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPage(page);
		pageMaker.setTotalCount(fms.listOtherCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "funding/main_other";
	}
	
	//펀딩 뷰
	@RequestMapping(value = "/view.do", method = RequestMethod.GET)
	public String read(FundingMainVO vo, Model model) throws Exception{
		
		model.addAttribute("read", fms.read(vo.getFunding_idx()));
		
		return "funding/view";
	}
	// 이동
	@RequestMapping(value = "/view.do")
	public String view() {
		return "funding/view";
	}
	
	// 옵션 선택
	@RequestMapping(value = "/option.do")
	public String option(Model model, Funding_optionVO vo) {
		
		List<Funding_optionVO> list = fms.list(vo);
		
		model.addAttribute("list", list);
		
		return "funding/option";
	}
	
	@RequestMapping(value = "/reserve.do")
	public String reserve() {
		return "funding/reserve";
	}
	
	@RequestMapping(value = "/reserve_complete.do")
	public String reserveComplete() {
		return "funding/reserve_complete";
	}
	
	
}
