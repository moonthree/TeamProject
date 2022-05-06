package com.edu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.vo.FundingCommunityVO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.Funding_optionVO;
import com.edu.vo.MemberVO;
import com.edu.vo.PageMaker;
import com.edu.vo.Pagination;
import com.edu.service.MypageService;
import com.edu.service.fundingMainService;


// Funding에 관련된 모든 동작 수행
@Controller
@RequestMapping(value = "/funding")
public class FundingController {
	
	@Autowired
	private fundingMainService fms;

	@Autowired
	private MypageService mypageService ;
	
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
	
	
	// 펀딩 메인페이지에 리스트 출력	
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
	public String read(FundingMainVO vo, Model model, HttpSession session, HttpServletRequest request) throws Exception{
		
		//funding_idx에 따른 뷰페이지 정보 가져오기
		model.addAttribute("read", fms.read(vo.getFunding_idx()));
		
		//세션사용자정보 가져옴
		session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member",member);
		
		//펀딩 커뮤니티 댓글 리스트
		List<FundingCommunityVO> fundingCommunityCommentList =fms.readFundingCommunityComent(vo.getFunding_idx());
		model.addAttribute("fundingCommunityCommentList", fundingCommunityCommentList);
		
		return "funding/view";
	}
	
	//펀딩 커뮤니티 댓글 작성 ajax로 불러옴
	@RequestMapping(value ="/serialize", method= RequestMethod.POST)
	@ResponseBody
	public int serialize(FundingCommunityVO vo) throws Exception {
		//return vo.getFunding_detail_community_content() + vo.getFunding_idx() + vo.getMember_idx() + vo.getFunding_detail_community_category();
		return fms.writeFundingCommunityComment(vo);
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
