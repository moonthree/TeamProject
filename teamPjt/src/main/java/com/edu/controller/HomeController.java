package com.edu.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.service.MypageService;
import com.edu.service.SearchService;
import com.edu.vo.FundingMainVO;
import com.edu.vo.MemberVO;
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
	
	@Autowired
	private MypageService mypageService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	
		
		
		return "home";
	}
	
	@RequestMapping(value = "/header.do")
	public String header(Model model, HttpServletRequest request) {
		// 세션에 있는 사용자의 정보를 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member", member);
		
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
	
	
	/*
	 * @RequestMapping(value = "/search.do") public String search() {
	 * 
	 * return "search"; }
	 */
	
	@RequestMapping(value = "/search2.do")
	public String search2() {
		
		return "search2";
	}
	
	/*
	 * @RequestMapping(value = "/search.do", method = RequestMethod.GET) public
	 * String searchFundinglist(Model model, @ModelAttribute("scri") SearchCriteria
	 * scri) throws Exception{
	 * 
	 * model.addAttribute("searchFundinglist", service.listSearch(scri));
	 * model.addAttribute("searchFundingCount", service.searchFundingCount(scri));
	 * PageMaker pageMaker = new PageMaker(); pageMaker.setPage(scri);
	 * pageMaker.setTotalCount(service.searchFundingCount(scri));
	 * 
	 * model.addAttribute("pageMaker", pageMaker);
	 * 
	 * return "search"; }
	 */
	
	@RequestMapping(value = "/searchList.do")
	public String searchList(HttpServletRequest request, HttpSession session) throws Exception {
		final int PAGE_ROW_COUNT = 6; 							//한 페이지에 몇개씩 표시할 것인지
		int pageNum = 1; 										//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		String strPageNum = request.getParameter("pageNum"); 	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		if(strPageNum != null) {								//만일 페이지 번호가 파라미터로 넘어 온다면
			pageNum = Integer.parseInt(strPageNum);				//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		}															
		
		int startRowNum = (pageNum -1) * PAGE_ROW_COUNT;	//보여줄 페이지의 시작 ROWNUM  0부터 시작
		int rowCount = PAGE_ROW_COUNT;
		
		
		System.out.println();
		
		//검색 키워드 관련 처리 - 검색 키워드가 파라미터로 넘어올 수도 있고 넘어오지 않을 수도 있다.
		String keyword = request.getParameter("keyword");
		if(keyword == null) {									//키워드가 넘어오지 않으면
			keyword = "";		
		}
		System.out.println(keyword);
		String encodedk = URLEncoder.encode(keyword);			//특수기호를 인코딩한 키워드를 준비한다.
		
		System.out.println(keyword);
		
		FundingMainVO vo = new FundingMainVO();							//ROWNUM과 ROWCOUNT를 FundingMainVO 객체에 담는다.
		vo.setStartRowNum(startRowNum);
		vo.setRowCount(rowCount);
		
		ArrayList<FundingMainVO> searchList = null;					//ArrayList 객체의 참조값을 담을 지역변수를 미리 만든다.
		int totalRow = 0;										//전체 row의 개수를담을 지역변수를 미리 만든다.
		
		if(!keyword.equals("")) {
			vo.setKeyword(keyword);
		}
		// 위의 검색 키워드에 따라 vo에 담기는 내용이 다르고
		// 그 내용을 기준으로 조건이 다를때마다 select 되도록 dynamic query를 구성한다.
		
		//글 목록 얻어오기
		searchList = (ArrayList<FundingMainVO>) service.searchList(vo);
		
		// 글의 개수
		totalRow = service.searchCount(vo);
		
		// 전체 페이지의 갯수
		int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);
		int endRowNum = totalRow - (rowCount * (totalPageCount-1));
		vo.setEndRowNum(endRowNum);
		vo.setTotalRow(totalRow);
		System.out.println(endRowNum);

		request.setAttribute("searchList", searchList);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("keyword", keyword);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("pageNum", pageNum);
	
		return "search2";
		
	}
	
	// 무한스크롤로 불러오는 리스트
	@RequestMapping(value = "/ajax_page.do")
	public String searchAjaxList(HttpServletRequest request, HttpSession session) throws Exception {
		final int PAGE_ROW_COUNT = 6; 							//한 페이지에 몇개씩 표시할 것인지
		int pageNum = 1; 										//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		String strPageNum = request.getParameter("pageNum"); 	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		if(strPageNum != null) {								//만일 페이지 번호가 파라미터로 넘어 온다면
			pageNum = Integer.parseInt(strPageNum);				//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		}															
		
		int startRowNum = (pageNum -1) * PAGE_ROW_COUNT;	//보여줄 페이지의 시작 ROWNUM  0부터 시작
		int endRowNum= startRowNum * PAGE_ROW_COUNT - 1;				//보여줄 페이지의 끝 ROWNUM
		int rowCount = PAGE_ROW_COUNT;
		
		System.out.println();
		
		//검색 키워드 관련 처리 - 검색 키워드가 파라미터로 넘어올 수도 있고 넘어오지 않을 수도 있다.
		String keyword = request.getParameter("keyword");
		if(keyword == null) {									//키워드가 넘어오지 않으면
			keyword = "";		
		}
		System.out.println(keyword);
		String encodedk = URLEncoder.encode(keyword);			//특수기호를 인코딩한 키워드를 준비한다.
		
		System.out.println(keyword);
		
		FundingMainVO vo = new FundingMainVO();							//ROWNUM과 ROWCOUNT를 FundingMainVO 객체에 담는다.
		vo.setStartRowNum(startRowNum);
		vo.setEndRowNum(endRowNum);
		vo.setRowCount(rowCount);
		
		ArrayList<FundingMainVO> searchList = null;					//ArrayList 객체의 참조값을 담을 지역변수를 미리 만든다.
		int totalRow = 0;										//전체 row의 개수를담을 지역변수를 미리 만든다.
		
		if(!keyword.equals("")) {
			vo.setKeyword(keyword);
		}
		// 위의 검색 키워드에 따라 vo에 담기는 내용이 다르고
		// 그 내용을 기준으로 조건이 다를때마다 select 되도록 dynamic query를 구성한다.
		
		//글 목록 얻어오기
		searchList = (ArrayList<FundingMainVO>) service.searchList(vo);
		
		// 글의 개수
		totalRow = service.searchCount(vo);
		
		// 전체 페이지의 갯수
		int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);
		
		request.setAttribute("searchList", searchList);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("keyword", keyword);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("pageNum", pageNum);
		
		System.out.println("pageNum = " + pageNum);
		System.out.println("startRowNum = " + startRowNum);
		System.out.println("endRowNum = " + endRowNum);
		System.out.println("rowCount = " + rowCount);
		System.out.println("totalRow= " + totalRow);
		System.out.println("totalPageCount=" + totalPageCount);
		System.out.println("ajax = " + keyword);
		
		System.out.println("=====================");
		
		return "ajax_page";
		
	}
}
