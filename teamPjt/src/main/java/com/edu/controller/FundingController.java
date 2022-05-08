package com.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.vo.FundingCommunityVO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.FundingQnaVO;
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
	public String read(@RequestParam Map<String, Object> paramMap, FundingMainVO vo, Model model, HttpSession session, HttpServletRequest request) throws Exception{
		
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
		
		
		//펀딩 qna 댓글 리스트
		model.addAttribute("qnaList", fms.getQnaList(paramMap));
		
		/*
		 * List<FundingQnaVO> fundingQnaCommentList =
		 * fms.readFundingQnaComent(vo.getFunding_idx());
		 * model.addAttribute("fundingQnaCommentList", fundingQnaCommentList);
		 */
		
		return "funding/view";
	}
	
	//펀딩 커뮤니티 댓글 작성 ajax로 불러옴
	@RequestMapping(value ="/serialize", method= RequestMethod.POST)
	@ResponseBody
	public int serialize(FundingCommunityVO vo) throws Exception {
		//return vo.getFunding_detail_community_content() + vo.getFunding_idx() + vo.getMember_idx() + vo.getFunding_detail_community_category();
		return fms.writeFundingCommunityComment(vo);
	}
	
	//펀딩 커뮤니티 댓글 수정 ajax로 불러옴
	@RequestMapping(value ="/commuModify", method= RequestMethod.POST)
	@ResponseBody
	public void commuModify(FundingCommunityVO vo) throws Exception {
		//return vo.getFunding_detail_community_content() + vo.getFunding_idx() + vo.getMember_idx() + vo.getFunding_detail_community_category();
		fms.modifyFundingCommunityComment(vo);
	}
	//펀딩 커뮤니티 댓글 삭제ajax로 불러옴
	@RequestMapping(value ="/commuDelete", method= RequestMethod.POST)
	@ResponseBody
	public void commuDelete(FundingCommunityVO vo) throws Exception {
		//return vo.getFunding_detail_community_content() + vo.getFunding_idx() + vo.getMember_idx() + vo.getFunding_detail_community_category();
		fms.deleteFundingCommunityComment(vo);
	}
	
	//펀딩 qna 작성 ajax로 불러옴
	@RequestMapping(value ="/qnaInsert", method= RequestMethod.POST)
	@ResponseBody
	public Object qnaInsert(@RequestParam Map<String, Object> paramMap){
		
		//리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();
		int result = fms.qnaInsert(paramMap);
		if(result>0) {
			retVal.put("code", "OK");
			retVal.put("funding_qna_idx", paramMap.get("funding_qna_idx"));
			retVal.put("parent_id", paramMap.get("parent_id"));
			retVal.put("message", "등록 성공!");
		}else {
			retVal.put("code", "FAIL");
			retVal.put("message", "등록 실패!");
		}
		return retVal;
	}
	
	//펀딩 qna 상태 업데이트
	@RequestMapping(value ="/qnaAnswerDone", method= RequestMethod.POST)
	@ResponseBody
	public int qnaAnswerDone(FundingQnaVO vo) throws Exception{
		return fms.qnaAnswerDone(vo);
	}
	// 펀딩 qna 삭제
	@RequestMapping(value ="/qnaDelete", method= RequestMethod.POST)
	@ResponseBody
	public void deleteFundingQna(FundingQnaVO vo) throws Exception {
		fms.deleteFundingQna(vo);
	}
	// 펀딩 qna 수정
	@RequestMapping(value ="/qnaModify", method= RequestMethod.POST)
	@ResponseBody
	public void modifyFundingQna(FundingQnaVO vo) throws Exception {
		fms.modifyFundingQna(vo);
	}
	
	
	
	
	// 이동
	@RequestMapping(value = "/view.do")
	public String view() {
		return "funding/view";
	}
	
	// 옵션 페이지
	@RequestMapping(value = "/option.do", method = RequestMethod.GET)
	public String option(Model model, Funding_optionVO vo) {
		// 옵션 리스트 출력
		List<Funding_optionVO> optionlist = fms.list(vo);
		model.addAttribute("optionlist", optionlist);
		
		return "funding/option";
	}
	
	@RequestMapping(value = "/option.do", method = RequestMethod.POST)
	public String orderForm(Model model, Funding_optionVO optionvo, HttpServletRequest request) {
		// 옵션 리스트 출력
		List<Funding_optionVO> optionlist = fms.list(optionvo);
		model.addAttribute("optionlist", optionlist);
		
		//세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		MemberVO member = fms.selectOne(login);
		model.addAttribute("member", member);
		
		return "funding/reserve";
	}
	
	
}
