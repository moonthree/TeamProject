package com.edu.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.service.EventService;
import com.edu.service.HomeService;
import com.edu.service.MypageService;
import com.edu.service.SearchService;
import com.edu.vo.EventVO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.MemberVO;
import com.edu.vo.StoreVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/")
public class HomeController {
	@Autowired
	private EventService es;
	
	@Autowired
	private SearchService service;
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private HomeService hs;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,  HttpServletRequest request, EventVO evo, FundingMainVO vo, StoreVO svo) throws Exception {
		
		// 세션에 있는 사용자의 정보를 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member", member);
		
		
		ArrayList<EventVO> eventMain = null;
		eventMain = (ArrayList<EventVO>) es.eventMain(evo);
		
		
		//
		ArrayList<FundingMainVO> fundHomeAll = null;
		ArrayList<FundingMainVO> fundHomeDog = null;
		ArrayList<FundingMainVO> fundHomeCat = null;
		ArrayList<FundingMainVO> fundHomeOther = null;
		
		ArrayList<FundingMainVO> fundHomeNew = null;
		
		ArrayList<FundingMainVO> fundHomeView = null;
		ArrayList<StoreVO> storeHomeView = null;
		
		ArrayList<StoreVO> storeHomeFund = null;
		
		//
		fundHomeAll = (ArrayList<FundingMainVO>) hs.fundHomeAll(vo);
		fundHomeDog = (ArrayList<FundingMainVO>) hs.fundHomeDog(vo);
		fundHomeCat = (ArrayList<FundingMainVO>) hs.fundHomeCat(vo);
		fundHomeOther = (ArrayList<FundingMainVO>) hs.fundHomeOther(vo);
		
		fundHomeNew = (ArrayList<FundingMainVO>) hs.fundHomeNew(vo);
		
		fundHomeView = (ArrayList<FundingMainVO>) hs.fundHomeView(vo);
		storeHomeView = (ArrayList<StoreVO>) hs.storeHomeView(svo);
		
		storeHomeFund = (ArrayList<StoreVO>) hs.storeHomeFund(svo);
		
		request.setAttribute("fundHomeAll", fundHomeAll);
		request.setAttribute("fundHomeDog", fundHomeDog);
		request.setAttribute("fundHomeCat", fundHomeCat);
		request.setAttribute("fundHomeOther", fundHomeOther);
		
		request.setAttribute("fundHomeNew", fundHomeNew);
		
		request.setAttribute("fundHomeView", fundHomeView);
		request.setAttribute("storeHomeView", storeHomeView);
		
		request.setAttribute("storeHomeFund", storeHomeFund);
		request.setAttribute("eventMain", eventMain);
		
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
	public String home2(Model model,  HttpServletRequest request, EventVO evo, FundingMainVO vo, StoreVO svo) throws Exception {
		// 세션에 있는 사용자의 정보를 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member", member);
		
		
		ArrayList<EventVO> eventMain = null;
		eventMain = (ArrayList<EventVO>) es.eventMain(evo);
		
		//
		ArrayList<FundingMainVO> fundHomeAll = null;
		ArrayList<FundingMainVO> fundHomeDog = null;
		ArrayList<FundingMainVO> fundHomeCat = null;
		ArrayList<FundingMainVO> fundHomeOther = null;
		
		ArrayList<FundingMainVO> fundHomeNew = null;
		
		ArrayList<FundingMainVO> fundHomeView = null;
		ArrayList<StoreVO> storeHomeView = null;
		
		ArrayList<StoreVO> storeHomeFund = null;
		
		//
		fundHomeAll = (ArrayList<FundingMainVO>) hs.fundHomeAll(vo);
		fundHomeDog = (ArrayList<FundingMainVO>) hs.fundHomeDog(vo);
		fundHomeCat = (ArrayList<FundingMainVO>) hs.fundHomeCat(vo);
		fundHomeOther = (ArrayList<FundingMainVO>) hs.fundHomeOther(vo);
		
		fundHomeNew = (ArrayList<FundingMainVO>) hs.fundHomeNew(vo);
		
		fundHomeView = (ArrayList<FundingMainVO>) hs.fundHomeView(vo);
		storeHomeView = (ArrayList<StoreVO>) hs.storeHomeView(svo);
		
		storeHomeFund = (ArrayList<StoreVO>) hs.storeHomeFund(svo);
		
		request.setAttribute("fundHomeAll", fundHomeAll);
		request.setAttribute("fundHomeDog", fundHomeDog);
		request.setAttribute("fundHomeCat", fundHomeCat);
		request.setAttribute("fundHomeOther", fundHomeOther);
		
		request.setAttribute("fundHomeNew", fundHomeNew);
		
		request.setAttribute("fundHomeView", fundHomeView);
		request.setAttribute("storeHomeView", storeHomeView);
		
		request.setAttribute("storeHomeFund", storeHomeFund);
		request.setAttribute("eventMain", eventMain);
		return "home";
	}
	
	
	
	@RequestMapping(value = "/search2.do")
	public String search2() {
		
		return "search2";
	}
	
	@RequestMapping(value = "/searchList.do", method=RequestMethod.GET)
	public String searchList(HttpServletRequest request, HttpSession session) throws Exception {
		final int PAGE_ROW_COUNT = 8; 							//한 페이지에 몇개씩 표시할 것인지
		int pageNum = 1; 										//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		String strPageNum = request.getParameter("pageNum"); 	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		if(strPageNum != null) {								//만일 페이지 번호가 파라미터로 넘어 온다면
			pageNum = Integer.parseInt(strPageNum);				//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		}															
		
		int startRowNum = (pageNum -1) * PAGE_ROW_COUNT;	//보여줄 페이지의 시작 ROWNUM  0부터 시작
		int rowCount = PAGE_ROW_COUNT;
		
		String categorySelect = request.getParameter("categorySelect");
		String condition= request.getParameter("condition");
		
		if(categorySelect == null) {
			categorySelect = "";
		}
		
		if(condition == null) {
			condition = "";
		}
		
		System.out.println(categorySelect);
		System.out.println(condition);;
		
		//검색 키워드 관련 처리 - 검색 키워드가 파라미터로 넘어올 수도 있고 넘어오지 않을 수도 있다.
		String keyword = request.getParameter("keyword");
		if(keyword == null) {									//키워드가 넘어오지 않으면
			keyword = "";		
		}
		String encodedk = URLEncoder.encode(keyword);			//특수기호를 인코딩한 키워드를 준비한다.
		
		System.out.println(keyword);
		
		FundingMainVO vo = new FundingMainVO();							//ROWNUM과 ROWCOUNT를 FundingMainVO 객체에 담는다.
		vo.setStartRowNum(startRowNum);
		vo.setRowCount(rowCount);
		
		if(condition.equals("sortNew")) {
			vo.setSortNew("a");
		}else if(condition.equals("sortView")){
			vo.setSortView("b");
		}else if(condition.equals("sortPrice")) {
			vo.setSortPrice("c");
		}else if(condition.equals("sortdeadline")) {
			vo.setSortdeadline("d");
		}
		
		if(categorySelect.equals("dog")) {
			vo.setDog("dog");
		}else if(categorySelect.equals("cat")){
			vo.setCat("cat");
		}else if(categorySelect.equals("pet")) {
			vo.setOther("ohter");
		}else if(categorySelect.equals("all")) {
			vo.setAll("all");
		}
		
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
		System.out.println(totalRow);
		// 전체 페이지의 갯수
		int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);
		int endRowNum = totalRow - (rowCount * (totalPageCount-1));
		vo.setEndRowNum(endRowNum);
		vo.setTotalRow(totalRow);
		//System.out.println(endRowNum);
		//System.out.println(totalPageCount);
		//System.out.println(startRowNum);
		
		
		request.setAttribute("searchList", searchList);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("keyword", keyword);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("pageNum", pageNum);
		
		
//스토어 //스토어 //스토어
		final int PAGE_ROW_COUNT_STORE = 8;
		int pageNumStore = 1; 										//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		String strPageNumStore = request.getParameter("pageNumStore"); 	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		if(strPageNumStore != null) {								//만일 페이지 번호가 파라미터로 넘어 온다면
			pageNumStore = Integer.parseInt(strPageNumStore);				//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		}															
		
		int startRowNumStore = (pageNumStore -1) * PAGE_ROW_COUNT_STORE;	//보여줄 페이지의 시작 ROWNUM  0부터 시작
		int rowCountStore = PAGE_ROW_COUNT_STORE;
		
		String conditionStore= request.getParameter("conditionStore");
		if(conditionStore == null) {
			conditionStore = "";
		}
		
		StoreVO svo = new StoreVO();							//ROWNUM과 ROWCOUNT를 FundingMainVO 객체에 담는다.
		svo.setStartRowNumStore(startRowNumStore);
		svo.setRowCountStore(rowCountStore);
		
		if(categorySelect.equals("dog")) {
			svo.setDog("dog");
		}else if(categorySelect.equals("cat")){
			svo.setCat("cat");
		}else if(categorySelect.equals("pet")) {
			svo.setOther("other");
		}else if(categorySelect.equals("all")) {
			svo.setAll("all");
		}
		
		if(conditionStore.equals("sortNewStore")) {
			svo.setSortNewStore("a");
		}else if(conditionStore.equals("sortViewStore")){
			svo.setSortViewStore("b");
		}else if(conditionStore.equals("sortStarStore")) {
			svo.setSortStarStore("c");
		}else if(conditionStore.equals("sortHighPriceStore")) {
			svo.setSortHighPriceStore("d");
		}else if(conditionStore.equals("sortLowPriceStore")) {
			svo.setSortLowPriceStore("d");
		}
		
		
		
		ArrayList<StoreVO> searchStoreList = null;					//ArrayList 객체의 참조값을 담을 지역변수를 미리 만든다.
		int totalRowStore = 0;										//전체 row의 개수를담을 지역변수를 미리 만든다.
		
		if(!keyword.equals("")) {
			svo.setKeyword(keyword);
		}
		// 위의 검색 키워드에 따라 svo에 담기는 내용이 다르고
		// 그 내용을 기준으로 조건이 다를때마다 select 되도록 dynamic query를 구성한다.
		
		//글 목록 얻어오기
		searchStoreList = (ArrayList<StoreVO>) service.searchStoreList(svo);
		
		// 글의 개수
		totalRowStore = service.searchStoreCount(svo);
		// 전체 페이지의 갯수
		int totalPageCountStore = (int)Math.ceil(totalRowStore / (double)PAGE_ROW_COUNT_STORE);
		int endRowNumStore = totalRowStore - (rowCountStore * (totalPageCountStore-1));
		svo.setEndRowNumStore(endRowNumStore);
		svo.setTotalRowStore(totalRowStore);

		request.setAttribute("searchStoreList", searchStoreList);
		request.setAttribute("totalPageCountStore", totalPageCountStore);
		request.setAttribute("keyword", keyword);
		request.setAttribute("totalRowStore", totalRowStore);
		request.setAttribute("pageNumStore", pageNumStore);
		
		
	
		return "search2";
		
	}
	
	// 무한스크롤로 불러오는 리스트
	@RequestMapping(value = "/ajax_page.do")
	public String fundAjaxList(HttpServletRequest request, HttpSession session) throws Exception {
		final int PAGE_ROW_COUNT = 8; 							//한 페이지에 몇개씩 표시할 것인지
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
		
		String categorySelect = request.getParameter("categorySelect");
		String condition= request.getParameter("condition");
		
		if(categorySelect == null) {
			categorySelect = "";
		}
		
		if(condition == null) {
			condition = "";
		}
		System.out.println(keyword);
		String encodedk = URLEncoder.encode(keyword);			//특수기호를 인코딩한 키워드를 준비한다.
		
		System.out.println(keyword);
		
		FundingMainVO vo = new FundingMainVO();							//ROWNUM과 ROWCOUNT를 FundingMainVO 객체에 담는다.
		vo.setStartRowNum(startRowNum);
		vo.setEndRowNum(endRowNum);
		vo.setRowCount(rowCount);
		
		if(condition.equals("sortNew")) {
			vo.setSortNew("a");
		}else if(condition.equals("sortView")){
			vo.setSortView("b");
		}else if(condition.equals("sortPrice")) {
			vo.setSortPrice("c");
		}else if(condition.equals("sortdeadline")) {
			vo.setSortdeadline("d");
		}
		
		if(categorySelect.equals("dog")) {
			vo.setDog("dog");
		}else if(categorySelect.equals("cat")){
			vo.setCat("cat");
		}else if(categorySelect.equals("pet")) {
			vo.setOther("other");
		}else if(categorySelect.equals("all")) {
			vo.setAll("all");
		}
		
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
	
	@RequestMapping(value = "/ajax_page_store.do")
	public String storeAjaxListStore(HttpServletRequest request, HttpSession session) throws Exception {
		final int PAGE_ROW_COUNT_STORE = 8; 							//한 페이지에 몇개씩 표시할 것인지
		int pageNumStore = 1; 										//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		String strPageNumStore = request.getParameter("pageNumStore"); 	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		if(strPageNumStore != null) {								//만일 페이지 번호가 파라미터로 넘어 온다면
			pageNumStore = Integer.parseInt(strPageNumStore);				//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		}															
		
		int startRowNumStore = (pageNumStore -1) * PAGE_ROW_COUNT_STORE;	//보여줄 페이지의 시작 ROWNUM  0부터 시작
		int rowCountStore = PAGE_ROW_COUNT_STORE;
		
		String categorySelect = request.getParameter("categorySelect");
		if(categorySelect == null) {
			categorySelect = "";
		}
		String conditionStore= request.getParameter("conditionStore");
		if(conditionStore == null) {
			conditionStore = "";
		}
		
		StoreVO svo = new StoreVO();							//ROWNUM과 ROWCOUNT를 FundingMainVO 객체에 담는다.
		svo.setStartRowNumStore(startRowNumStore);
		svo.setRowCountStore(rowCountStore);
		
		if(categorySelect.equals("dog")) {
			svo.setDog("dog");
		}else if(categorySelect.equals("cat")){
			svo.setCat("cat");
		}else if(categorySelect.equals("pet")) {
			svo.setOther("other");
		}else if(categorySelect.equals("all")) {
			svo.setAll("all");
		}
		
		if(conditionStore.equals("sortNewStore")) {
			svo.setSortNewStore("a");
		}else if(conditionStore.equals("sortViewStore")){
			svo.setSortViewStore("b");
		}else if(conditionStore.equals("sortStarStore")) {
			svo.setSortStarStore("c");
		}else if(conditionStore.equals("sortHighPriceStore")) {
			svo.setSortHighPriceStore("d");
		}else if(conditionStore.equals("sortLowPriceStore")) {
			svo.setSortLowPriceStore("d");
		}
		
		ArrayList<StoreVO> searchStoreList = null;					//ArrayList 객체의 참조값을 담을 지역변수를 미리 만든다.
		int totalRowStore = 0;										//전체 row의 개수를담을 지역변수를 미리 만든다.
		//검색 키워드 관련 처리 - 검색 키워드가 파라미터로 넘어올 수도 있고 넘어오지 않을 수도 있다.
		String keyword = request.getParameter("keyword");
		if(keyword == null) {									//키워드가 넘어오지 않으면
			keyword = "";		
		}
		System.out.println(keyword);
		String encodedk = URLEncoder.encode(keyword);			//특수기호를 인코딩한 키워드를 준비한다.
		if(!keyword.equals("")) {
			svo.setKeyword(keyword);
		}
		// 위의 검색 키워드에 따라 svo에 담기는 내용이 다르고
		// 그 내용을 기준으로 조건이 다를때마다 select 되도록 dynamic query를 구성한다.
		
		//글 목록 얻어오기
		searchStoreList = (ArrayList<StoreVO>) service.searchStoreList(svo);
		
		// 글의 개수
		totalRowStore = service.searchStoreCount(svo);
		// 전체 페이지의 갯수
		int totalPageCountStore = (int)Math.ceil(totalRowStore / (double)PAGE_ROW_COUNT_STORE);

		request.setAttribute("searchStoreList", searchStoreList);
		request.setAttribute("totalPageCountStore", totalPageCountStore);
		request.setAttribute("keyword", keyword);
		request.setAttribute("totalRowStore", totalRowStore);
		request.setAttribute("pageNumStore", pageNumStore);
		
		return "ajax_page_store";
		
	}
	
	
	@RequestMapping(value = "/ajax_page_search.do")
	public String searchAjaxList(HttpServletRequest request, HttpSession session) throws Exception {
		final int PAGE_ROW_COUNT = 8; 							//한 페이지에 몇개씩 표시할 것인지
		int pageNumSearch = 1; 										//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		String strPageNum = request.getParameter("pageNumSearch"); 	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		if(strPageNum != null) {								//만일 페이지 번호가 파라미터로 넘어 온다면
			pageNumSearch = Integer.parseInt(strPageNum);				//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		}															
		
		int startRowNum = (pageNumSearch -1) * PAGE_ROW_COUNT;	//보여줄 페이지의 시작 ROWNUM  0부터 시작
		int endRowNum= startRowNum * PAGE_ROW_COUNT - 1;				//보여줄 페이지의 끝 ROWNUM
		int rowCount = PAGE_ROW_COUNT;
		
		System.out.println();
		
		//검색 키워드 관련 처리 - 검색 키워드가 파라미터로 넘어올 수도 있고 넘어오지 않을 수도 있다.
		String keyword = request.getParameter("keyword");
		if(keyword == null) {									//키워드가 넘어오지 않으면
			keyword = "";		
		}
		
		String categorySelect = request.getParameter("categorySelect");
		String condition= request.getParameter("condition");
		
		if(categorySelect == null) {
			categorySelect = "";
		}
		
		if(condition == null) {
			condition = "";
		}
		System.out.println(keyword);
		String encodedk = URLEncoder.encode(keyword);			//특수기호를 인코딩한 키워드를 준비한다.
		
		System.out.println(keyword);
		
		FundingMainVO vo = new FundingMainVO();							//ROWNUM과 ROWCOUNT를 FundingMainVO 객체에 담는다.
		vo.setStartRowNum(startRowNum);
		vo.setEndRowNum(endRowNum);
		vo.setRowCount(rowCount);
		
		if(condition.equals("sortNew")) {
			vo.setSortNew("a");
		}else if(condition.equals("sortView")){
			vo.setSortView("b");
		}else if(condition.equals("sortPrice")) {
			vo.setSortPrice("c");
		}else if(condition.equals("sortdeadline")) {
			vo.setSortdeadline("d");
		}
		
		if(categorySelect.equals("dog")) {
			vo.setDog("dog");
		}else if(categorySelect.equals("cat")){
			vo.setCat("cat");
		}else if(categorySelect.equals("pet")) {
			vo.setOther("other");
		}else if(categorySelect.equals("all")) {
			vo.setAll("all");
		}
		
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
		
		request.setAttribute("condition", condition);
		request.setAttribute("categorySelect", categorySelect);
		request.setAttribute("searchListSearch", searchList);
		request.setAttribute("totalPageCountSearch", totalPageCount);
		request.setAttribute("keyword", keyword);
		request.setAttribute("totalRowSearch", totalRow);
		request.setAttribute("pageNumSearch", pageNumSearch);
		
		
		return "ajax_page_search";
		
	}
	
	@RequestMapping(value = "/ajax_page_store_search.do")
	public String storeAjaxListStoreSearch(HttpServletRequest request, HttpSession session) throws Exception {
		final int PAGE_ROW_COUNT_STORE = 8; 							//한 페이지에 몇개씩 표시할 것인지
		int pageNumStoreSearch = 1; 										//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		String strPageNumStore = request.getParameter("pageNumStoreSearch"); 	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		if(strPageNumStore != null) {								//만일 페이지 번호가 파라미터로 넘어 온다면
			pageNumStoreSearch = Integer.parseInt(strPageNumStore);				//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		}															
		
		int startRowNumStore = (pageNumStoreSearch -1) * PAGE_ROW_COUNT_STORE;	//보여줄 페이지의 시작 ROWNUM  0부터 시작
		int rowCountStore = PAGE_ROW_COUNT_STORE;
		
		String categorySelect = request.getParameter("categorySelect");
		if(categorySelect == null) {
			categorySelect = "";
		}
		String conditionStore= request.getParameter("conditionStore");
		if(conditionStore == null) {
			conditionStore = "";
		}
		
		StoreVO svo = new StoreVO();							//ROWNUM과 ROWCOUNT를 FundingMainVO 객체에 담는다.
		svo.setStartRowNumStore(startRowNumStore);
		svo.setRowCountStore(rowCountStore);
		
		if(categorySelect.equals("dog")) {
			svo.setDog("dog");
		}else if(categorySelect.equals("cat")){
			svo.setCat("cat");
		}else if(categorySelect.equals("pet")) {
			svo.setOther("other");
		}else if(categorySelect.equals("all")) {
			svo.setAll("all");
		}
		
		if(conditionStore.equals("sortNewStore")) {
			svo.setSortNewStore("a");
		}else if(conditionStore.equals("sortViewStore")){
			svo.setSortViewStore("b");
		}else if(conditionStore.equals("sortStarStore")) {
			svo.setSortStarStore("c");
		}else if(conditionStore.equals("sortHighPriceStore")) {
			svo.setSortHighPriceStore("d");
		}else if(conditionStore.equals("sortLowPriceStore")) {
			svo.setSortLowPriceStore("d");
		}
		
		ArrayList<StoreVO> searchStoreList = null;					//ArrayList 객체의 참조값을 담을 지역변수를 미리 만든다.
		int totalRowStore = 0;										//전체 row의 개수를담을 지역변수를 미리 만든다.
		//검색 키워드 관련 처리 - 검색 키워드가 파라미터로 넘어올 수도 있고 넘어오지 않을 수도 있다.
		String keyword = request.getParameter("keyword");
		if(keyword == null) {									//키워드가 넘어오지 않으면
			keyword = "";		
		}
		System.out.println(keyword);
		String encodedk = URLEncoder.encode(keyword);			//특수기호를 인코딩한 키워드를 준비한다.
		if(!keyword.equals("")) {
			svo.setKeyword(keyword);
		}
		// 위의 검색 키워드에 따라 svo에 담기는 내용이 다르고
		// 그 내용을 기준으로 조건이 다를때마다 select 되도록 dynamic query를 구성한다.
		
		//글 목록 얻어오기
		searchStoreList = (ArrayList<StoreVO>) service.searchStoreList(svo);
		
		// 글의 개수
		totalRowStore = service.searchStoreCount(svo);
		// 전체 페이지의 갯수
		int totalPageCountStore = (int)Math.ceil(totalRowStore / (double)PAGE_ROW_COUNT_STORE);
		
		request.setAttribute("conditionStore", conditionStore);
		request.setAttribute("categorySelect", categorySelect);
		request.setAttribute("searchStoreListSearch", searchStoreList);
		request.setAttribute("totalPageCountStoreSearch", totalPageCountStore);
		request.setAttribute("keyword", keyword);
		request.setAttribute("totalRowStoreSearch", totalRowStore);
		request.setAttribute("pageNumStoreSearch", pageNumStoreSearch);
		
		return "ajax_page_store_search";
		
	}
}
