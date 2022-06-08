package com.edu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.edu.service.HomeService;
import com.edu.service.MypageService;
import com.edu.service.fundingMainService;
import com.edu.vo.FundingCommunityVO;
import com.edu.vo.FundingInfoDetailParameterVO;
import com.edu.vo.FundingInfoDetailVO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.FundingQnaVO;
import com.edu.vo.Funding_expressVO;
import com.edu.vo.Funding_optionVO;
import com.edu.vo.Funding_orderVO;
import com.edu.vo.Funding_order_optionVO;
import com.edu.vo.Funding_order_payVO;
import com.edu.vo.MemberVO;
import com.edu.vo.PageMaker;
import com.edu.vo.Pagination;
import com.edu.vo.ZzimVO;


// Funding에 관련된 모든 동작 수행
@Controller
@RequestMapping(value = "/funding")
public class FundingController {
	
	@Autowired
	private fundingMainService fms;

	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private HomeService hs;
	
	// 펀딩 메인페이지
	@RequestMapping(value = "/main.do")
	public String main() {
		return "funding/main";
	}
	
	//펀딩 메인페이지
	@RequestMapping(value = "/main.do", method=RequestMethod.GET)
	public String listMain(HttpServletRequest request, HttpSession session) throws Exception {
		final int PAGE_ROW_COUNT = 9; 							//한 페이지에 몇개씩 표시할 것인지
		final int displayPageNum = 3;							//페이징 번호 몇 개
		
		int pageNum = 1; 										//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		String strPageNum = request.getParameter("pageNum"); 	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		if(strPageNum != null) {								//만일 페이지 번호가 파라미터로 넘어 온다면
			pageNum = Integer.parseInt(strPageNum);				//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		}															
		
		int startRowNum = (pageNum -1) * PAGE_ROW_COUNT;	//보여줄 페이지의 시작 ROWNUM  0부터 시작
		int endRowNum= startRowNum * PAGE_ROW_COUNT - 1;				//보여줄 페이지의 끝 ROWNUM
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
		System.out.println(condition);
		
		String encodedk = URLEncoder.encode(condition);			//특수기호를 인코딩한 키워드를 준비한다.
		
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
		}
		if(categorySelect.equals("dog")) {
			vo.setDog("dog");
		}else if(categorySelect.equals("cat")){
			vo.setCat("cat");
		}else if(categorySelect.equals("other")) {
			vo.setOther("other");
		}
		
		ArrayList<FundingMainVO> listMain = null;					//ArrayList 객체의 참조값을 담을 지역변수를 미리 만든다.
		int totalRow = 0;										//전체 row의 개수를담을 지역변수를 미리 만든다.
		
		//글 목록 얻어오기
		listMain = (ArrayList<FundingMainVO>) fms.listMain(vo);
		
		
		
		// 글의 개수
		totalRow = fms.listMainCount(vo);
		
		// 전체 페이지의 갯수
		int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);
		
		int endPage = (int) (Math.ceil(pageNum / (double)displayPageNum) * displayPageNum);
		int startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int) (Math.ceil(totalRow / (double)PAGE_ROW_COUNT));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		boolean prev = startPage == 1 ? false : true;
		boolean next = endPage * PAGE_ROW_COUNT >= totalRow ? false : true;
		
		
		request.setAttribute("listMain", listMain);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("condition", condition);
		request.setAttribute("categorySelect", categorySelect);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startRowNum", startRowNum);
		request.setAttribute("endRowNum", endRowNum);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);
		request.setAttribute("endPage", endPage);
		request.setAttribute("startPage", startPage);
	
		return "funding/main";
	}

	// 찜 select
	/*
	 * @RequestMapping(value ="/selectZzim", method= RequestMethod.POST)
	 * 
	 * @ResponseBody public Object selectZzim(@RequestParam Map<String, Object>
	 * paramMap){ Map<String, Object> selectZzim = new HashMap<String, Object>();
	 * List<ZzimVO> result = fms.selectZzim(paramMap); return result; }
	 */
	
	//펀딩 뷰
	@RequestMapping(value = "/view.do", method = RequestMethod.GET)
	public String read(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,Funding_optionVO optionvo, FundingCommunityVO fcvo, FundingQnaVO qvo, FundingMainVO vo, Model model, HttpSession session) throws Exception{
		
		//funding_idx에 따른 뷰페이지 정보 가져오기
		model.addAttribute("read", fms.read(vo.getFunding_idx()));		
		
		/*
		 * System.out.println(fms.read(vo.getFunding_idx()).getFunding_thumbnail());
		 * System.out.println(fms.read(vo.getFunding_idx()).getFunding_notice());
		 * System.out.println(fms.read(vo.getFunding_idx()).getFunding_content());
		 */
		//세션사용자정보 가져옴
		session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member",member);
		
		int member_idx = 0;
		if(login == null) {
			member_idx = 0;
		}else{
			member_idx = login.getMember_idx();
		}
		Map<String, Integer> zzimMap = new HashMap<String, Integer>();
		//찜
		zzimMap.put("funding_idx", vo.getFunding_idx());
		zzimMap.put("member_idx", member_idx);
		
		System.out.println(zzimMap);
		
		ZzimVO zzimResult = fms.selectZzim2(zzimMap);
		if(zzimResult == null) {
			request.setAttribute("zzimResult", 0);
		}else {
			request.setAttribute("zzimResult", 1);
		}
		
		
		
		//펀딩 커뮤니티 댓글 리스트
		//List<FundingCommunityVO> fundingCommunityCommentList =fms.readFundingCommunityComent(vo.getFunding_idx());
		//model.addAttribute("fundingCommunityCommentList", fundingCommunityCommentList);
		final int PAGE_ROW_COUNT = 10; 							//한 페이지에 몇개씩 표시할 것인지
		final int displayPageNum = 3;							//페이징 번호 몇 개
		int pageNum = 1; 										//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		
		String strPageNum = request.getParameter("pageNum"); 	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		if(strPageNum != null) {								//만일 페이지 번호가 파라미터로 넘어 온다면
			pageNum = Integer.parseInt(strPageNum);				//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		}	
		
		int startRowNum = (pageNum -1) * PAGE_ROW_COUNT + 0;	//보여줄 페이지의 시작 ROWNUM  0부터 시작ss
		int rowCount = PAGE_ROW_COUNT;
		
		fcvo.setStartRowNum(startRowNum);
		fcvo.setRowCount(rowCount);
		//커뮤 댓글 개수
		ArrayList<FundingCommunityVO> listCommu = null;
		int totalRow = 0;
		
		listCommu = (ArrayList<FundingCommunityVO>) fms.readFundingCommunityComent(fcvo);
		
		
		totalRow = fms.countFundingCommunityComment(fcvo);
		
		//System.out.println("totalRow = " + totalRow);
		//System.out.println("startRowNum = " + startRowNum);
			
		// 전체 페이지의 개수
		int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);
		
		int endPage = (int) (Math.ceil(pageNum / (double)displayPageNum) * displayPageNum);
		int startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int) (Math.ceil(totalRow / (double)PAGE_ROW_COUNT));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		boolean prev = startPage == 1 ? false : true;
		boolean next = endPage * PAGE_ROW_COUNT >= totalRow ? false : true;
		
		//System.out.println("totalPageCount = " + totalPageCount);
		//System.out.println("endPage = " + endPage);
		//System.out.println("startPage = " + startPage);
		
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("listCommu", listCommu);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startRowNum", startRowNum);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);
		request.setAttribute("endPage", endPage);
		request.setAttribute("startPage", startPage);
		
	
		//펀딩 qna 댓글 리스트
		
		int pageNumQna = 1;
		
		String strPageNumQna = request.getParameter("pageNumQna"); 	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		if(strPageNumQna != null) {								//만일 페이지 번호가 파라미터로 넘어 온다면
			pageNumQna = Integer.parseInt(strPageNumQna);				//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		}	
		
		int startRowNumQna = (pageNumQna -1) * PAGE_ROW_COUNT + 0;	//보여줄 페이지의 시작 ROWNUM  0부터 시작ss
		int rowCountQna = PAGE_ROW_COUNT;
		
		fcvo.setStartRowNumQna(startRowNumQna);
		
		paramMap.put("startRowNumQna", startRowNumQna);
		
		fcvo.setRowCountQna(rowCountQna);
		
		ArrayList<FundingQnaVO> listQna = null;
		int totalRowQna = 0;

		listQna = (ArrayList<FundingQnaVO>)fms.getQnaList(paramMap);
		
		//qna 댓글 개수
		totalRowQna = fms.countFundingQna(qvo);
		
		System.out.println("totalRowQna = " + totalRowQna);
		System.out.println("startRowNumQna = " + startRowNumQna);
			
		// 전체 페이지의 개수
		int totalPageCountQna = (int)Math.ceil(totalRowQna / (double)PAGE_ROW_COUNT);
		
		int endPageQna = (int) (Math.ceil(pageNumQna / (double)displayPageNum) * displayPageNum);
		int startPageQna = (endPageQna - displayPageNum) + 1;
		
		int tempEndPageQna = (int) (Math.ceil(totalRowQna / (double)PAGE_ROW_COUNT));
		if (endPageQna > tempEndPageQna) {
			endPageQna = tempEndPageQna;
		}
		boolean prevQna = startPageQna == 1 ? false : true;
		boolean nextQna = endPageQna * PAGE_ROW_COUNT >= totalRowQna ? false : true;
		

		
		
		request.setAttribute("listQna", listQna);
		request.setAttribute("totalPageCountQna", totalPageCountQna);
		request.setAttribute("pageNumQna", pageNumQna);
		request.setAttribute("startRowNumQna", startRowNumQna);
		request.setAttribute("prevQna", prevQna);
		request.setAttribute("nextQna", nextQna);
		request.setAttribute("endPageQna", endPageQna);
		request.setAttribute("startPageQna", startPageQna);
		
		//model.addAttribute("qnaList", fms.getQnaList(paramMap));

		//model.addAttribute("qnaAnser", fms.getQnaAnswer(paramMap));
		return "funding/view";
	}
	//펀딩 큐엔에이 답변
	@RequestMapping(value ="/qnaList", method= RequestMethod.POST)
	@ResponseBody
	public ArrayList<FundingQnaVO> qnaList(FundingQnaVO vo, HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		//클릭한 qna의 qna 번호 가져오기
		String Strfunding_qna_idx = request.getParameter("funding_qna_idx");
		int funding_qna_idx = Integer.parseInt(Strfunding_qna_idx);
		String Strfunding_idx = request.getParameter("funding_idx");
		int funding_idx = Integer.parseInt(Strfunding_idx);
		
		//vo에 클릭한 qna 번호 저장
		vo.setFunding_qna_idx(funding_qna_idx);
		vo.setFunding_idx(funding_idx);
		
		ArrayList<FundingQnaVO> qnaAnswer = null;
		qnaAnswer = (ArrayList<FundingQnaVO>) fms.getQnaAnswer(paramMap);
		System.out.println(qnaAnswer);
		
		return qnaAnswer;
	}
	
	
	//오더 카운트
	@RequestMapping(value ="/read_funding_form", method= RequestMethod.POST)
	@ResponseBody
	public int orderCount(Funding_orderVO vo) throws Exception {
		return fms.orderCount(vo);
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
	//펀딩 커뮤 faq 더보기 누르면
	@RequestMapping(value ="/faq_page.do", method= RequestMethod.POST)
	@ResponseBody
	public String faq_page(HttpServletRequest request, HttpSession session) throws Exception {
		return "funding/view_faq";
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
			retVal.put("funding_idx", paramMap.get("funding_idx"));
			retVal.put("member_idx", paramMap.get("member_idx"));
			retVal.put("funding_qna_idx", paramMap.get("funding_qna_idx"));
			retVal.put("parent_id", paramMap.get("parent_id"));
			retVal.put("funding_qna_secret", paramMap.get("funding_qna_secret"));
			retVal.put("message", "등록 성공!");
		}else {
			retVal.put("code", "FAIL");
			retVal.put("message", "등록 실패!");
		}
		return retVal;
	}
	
	//펀딩 qna 답변 상태 업데이트
	@RequestMapping(value ="/qnaAnswerDone", method= RequestMethod.POST)
	@ResponseBody
	public int qnaAnswerDone(FundingQnaVO vo) throws Exception{
		return fms.qnaAnswerDone(vo);
	}
	// 펀딩 qna 답변 수정
	@RequestMapping(value ="/qnaAnswerModify", method= RequestMethod.POST)
	@ResponseBody
	public void qnaAnswerModify(FundingQnaVO vo) throws Exception {
		fms.qnaAnswerModify(vo);
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
	
	// 찜 insert
	@RequestMapping(value ="/insertZzim", method= RequestMethod.POST)
	@ResponseBody
	public Object insertZzim(@RequestParam Map<String, Object> paramMap){
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		int result = fms.insertZzim(paramMap);
		if(result>0) {
			retVal.put("code", "OK");
			retVal.put("message", "찜 성공!");
		}else {
			retVal.put("code", "FAIL");
			retVal.put("message", "찜 실패!");
		}
		return retVal;
	}
	
	
	// 찜 delete
	@RequestMapping(value ="/deleteZzim", method= RequestMethod.POST)
	@ResponseBody
	public Object deleteZzim(@RequestParam Map<String, Object> paramMap){
		Map<String, Object> deleteZzim = new HashMap<String, Object>();
		int result = fms.deleteZzim(paramMap);
		return result;
	}

	
	
	
	
	
	// 이동
	@RequestMapping(value = "/view.do")
	public String view() {
		return "funding/view";
	}
	
	// 옵션 페이지
	@RequestMapping(value = "/option.do", method = RequestMethod.GET)
	public String option(Model model, FundingMainVO mainvo, Funding_optionVO optionvo) throws Exception {
		
		model.addAttribute("read", fms.read(mainvo.getFunding_idx()));
		
		System.out.println();
		// 옵션 리스트 출력
		List<Funding_optionVO> optionlist = fms.list(optionvo);
		model.addAttribute("optionlist", optionlist);
		
		return "funding/option";
	}
	
	@RequestMapping(value = "/reserve.do", method = RequestMethod.GET)
	public String option(Model model, Funding_optionVO optionvo, FundingMainVO mainvo, HttpServletRequest request) throws Exception {
		// 옵션 리스트 출력
		List<Funding_optionVO> optionlist = fms.list(optionvo);
		model.addAttribute("optionlist", optionlist);
		
		//세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		MemberVO member = fms.selectOne(login);
		model.addAttribute("member", member);
		
		model.addAttribute("read", fms.read(mainvo.getFunding_idx()));
		
		return "funding/reserve";
	}
	
	@RequestMapping(value = "/reserve.do", method = RequestMethod.POST)
	public void reserve(Model model, Funding_orderVO ordervo, Funding_order_optionVO orderOptionvo, Funding_expressVO expressvo, Funding_order_payVO payvo, HttpServletRequest request, HttpServletResponse response, @RequestParam("inlineRadioOptions1") String radio) throws IOException {
		// 펀딩 주문 번호
		int result = fms.insertOrder(ordervo);
		
		// 펀딩 주문 옵션 저장
		String[] select_idx = request.getParameterValues("funding_order_option_select_idx");
		String[] select_count = request.getParameterValues("funding_order_option_select_count");
		for(int i=0; i<select_idx.length; i++) {
			int si = Integer.parseInt(select_idx[i]);
			int sc = Integer.parseInt(select_count[i]);
			orderOptionvo.setFunding_order_option_select_idx(si);
			orderOptionvo.setFunding_order_option_select_count(sc);
			fms.insertOrderOption(orderOptionvo);
			
			//옵션 수량에 따른 펀딩 상품 옵션 수량 감소하게 함 -> update 수량
			System.out.println("선택한 옵션 idx :" +orderOptionvo.getFunding_order_option_select_idx());
			System.out.println("선택한 옵션 수량 : " +orderOptionvo.getFunding_order_option_select_count());
			fms.update_option(orderOptionvo);
			
		}
		
		// 펀딩 주문 배송지 저장
		String name = "";
		String phone = "";
		String postnum = "";
		String addr1 = "";
		String addr2 = "";
		if(radio.equals("option1")) {
			name = request.getParameter("funding_express_name1");
			phone = request.getParameter("funding_express_phone1");
			postnum = request.getParameter("funding_express_postnum1");
			addr1 = request.getParameter("funding_express_addr1_1");
			addr2 = request.getParameter("funding_express_addr2_1");
			
		}else {
			name = request.getParameter("funding_express_name2");
			phone = request.getParameter("funding_express_phone2");
			postnum = request.getParameter("funding_express_postnum2");
			addr1 = request.getParameter("funding_express_addr1_2");
			addr2 = request.getParameter("funding_express_addr2_2");
		}
		expressvo.setFunding_express_name(name);
		expressvo.setFunding_express_phone(phone);
		expressvo.setFunding_express_postnum(postnum);
		expressvo.setFunding_express_addr1(addr1);
		expressvo.setFunding_express_addr2(addr2);
		fms.insertExpress(expressvo);
		
		
		// 결제 정보 저장
		String[] card_number = request.getParameterValues("card_num");
		String card = "";
		for(String c : card_number) {
			card += c;
			card += " ";
		}
		card = card.substring(0, card.length() - 1);
		payvo.setFunding_order_pay_card_num(card);
		fms.insertPay(payvo);
		
		// 결제 금액 합산하기
		fms.addPrice(ordervo);
		
		int funding_idx = Integer.parseInt(request.getParameter("funding_idx"));
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter pw = response.getWriter();
		if(result>0) {
			// 저장 완료
			pw.println("<script>"
//					+ "alert('결제 예약이 완료되었습니다.');"
					+ "location.href='reserve_complete.do?funding_idx="+funding_idx+"';</script>");
		}else {
			// 저장 안됭
			pw.println("<script>"
					+ "alert('결제 예약이 실패하었습니다.');"
					+ "location.href='reserInteger.parseIntve.do';</script>");
		}
		pw.flush();
		
	}
	
	@RequestMapping(value = "/reserve_complete.do")
	public String reserveComplete(FundingMainVO mainvo, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("read", fms.read(mainvo.getFunding_idx()));
		
		//세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		MemberVO member = fms.selectOne(login);
		model.addAttribute("member", member);
		
		//펀딩리스트
		List<FundingInfoDetailVO> mfl = mypageService.myFundingList2(login.getMember_idx());
		model.addAttribute("myFundingList",mfl);
		ArrayList<FundingMainVO> fundHomeAll = null;
		ArrayList<FundingMainVO> fundHomeDog = null;
		ArrayList<FundingMainVO> fundHomeCat = null;
		ArrayList<FundingMainVO> fundHomeOther = null;
		
		fundHomeAll = (ArrayList<FundingMainVO>) hs.fundHomeAll(mainvo);
		fundHomeDog = (ArrayList<FundingMainVO>) hs.fundHomeDog(mainvo);
		fundHomeCat = (ArrayList<FundingMainVO>) hs.fundHomeCat(mainvo);
		fundHomeOther = (ArrayList<FundingMainVO>) hs.fundHomeOther(mainvo);
		
		request.setAttribute("fundHomeAll", fundHomeAll);
		request.setAttribute("fundHomeDog", fundHomeDog);
		request.setAttribute("fundHomeCat", fundHomeCat);
		request.setAttribute("fundHomeOther", fundHomeOther);
		
		return "funding/reserve_complete";
	}
	
	
}
