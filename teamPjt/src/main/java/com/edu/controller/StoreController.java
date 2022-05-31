package com.edu.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.edu.service.HomeService;
import com.edu.service.MypageService;
import com.edu.service.StoreService;
import com.edu.service.fundingMainService;
import com.edu.vo.FundingMainVO;
import com.edu.vo.Funding_optionVO;
import com.edu.vo.Funding_orderVO;
import com.edu.vo.MemberVO;
import com.edu.vo.StoreExpressVO;
import com.edu.vo.StoreInfoDetailVO;
import com.edu.vo.StoreOptionVO;
import com.edu.vo.StoreOrderOptionVO;
import com.edu.vo.StoreOrderPayVO;
import com.edu.vo.StoreOrderVO;
import com.edu.vo.StoreQnaVO;
import com.edu.vo.StoreReviewLikeVO;
import com.edu.vo.StoreReviewVO;
import com.edu.vo.StoreVO;
import com.edu.vo.ZzimVO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;


@Controller
@RequestMapping(value = "/store")
public class StoreController {
	
	/*
	 * 컨트롤 f 로 찾아가기
	 * 01 = 스토어 메인페이지
	 * 02 = 스토어 뷰페이지
	 * 03 = 스토어 qna
	 * 04 = 스토어 상품 등록
	 * 05 = 스토어 리뷰
	 * 06 = 스토어 결제
	 * */
	
	@Autowired
	private fundingMainService fms;
	
	@Autowired
	private StoreService sts;

	@Autowired
	private MypageService ms;

	@Autowired
	private HomeService hs;
	
	// 스토어 메인페이지 
	@RequestMapping(value = "/store_main.do")
	public String main() {
		return "store/store_main";
	}
	// 스토어 메인페이지 01
	@RequestMapping(value = "/store_main.do", method=RequestMethod.GET)
	public String listMain(StoreReviewVO srvo, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		//세션사용자정보 가져옴
		session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		MemberVO member = ms.selectOne(login);
		model.addAttribute("member",member);

		final int PAGE_ROW_COUNT = 12; 							//한 페이지에 몇개씩 표시할 것인지
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
		
		StoreVO vo = new StoreVO();							
		vo.setStartRowNum(startRowNum);
		vo.setEndRowNum(endRowNum);
		vo.setRowCount(rowCount);
		

		if(condition.equals("sortNew")) {
			vo.setSortNew("a");
		}else if(condition.equals("sortView")){
			vo.setSortView("b");
		}else if(condition.equals("sortStar")) {
			vo.setSortStar("c");
		}else if(condition.equals("sortHighPrice")) {
			vo.setSortHighPrice("d");
		}else if(condition.equals("sortLowPrice")) {
			vo.setSortLowPrice("e");
		}
		if(categorySelect.equals("dog")) {
			vo.setDog("dog");
		}else if(categorySelect.equals("cat")){
			vo.setCat("cat");
		}else if(categorySelect.equals("other")) {
			vo.setOther("other");
		}else if(categorySelect.equals("fund")) {
			vo.setFund("fund");
		}
		
		
		ArrayList<StoreVO> listMain = null;					//ArrayList 객체의 참조값을 담을 지역변수를 미리 만든다.
		int totalRow = 0;										//전체 row의 개수를담을 지역변수를 미리 만든다.
		
		//글 목록 얻어오기
		listMain = (ArrayList<StoreVO>) sts.listMain(vo);
		
		// 글의 개수
		totalRow = sts.listMainCount(vo);
		
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
		
		
		return "store/store_main";
	}
	//스토어 메인 별점 넣기
	@ResponseBody
	@RequestMapping(value = "/star_avg", method = RequestMethod.POST)
	public double star_avg(StoreReviewVO srvo) throws Exception{
		//스토어 별점 평균
		double starAvg = 0;
		if(sts.starAvg(srvo) == null) {
			starAvg= 0;
		}else{
			starAvg = Math.round(sts.starAvg(srvo) * 10) / 10.0;
		}
		
		StoreVO vo = new StoreVO();
		vo.setStarAvg(starAvg);
		return starAvg;
	}
	//스토어 메인 리뷰 숫자 넣기
	@ResponseBody
	@RequestMapping(value = "/reviewNum", method = RequestMethod.POST)
	public double reviewNum(StoreReviewVO srvo) throws Exception{
		return sts.countStoreReviewList(srvo);
	}
	
	// 스토어 뷰페이지 02
	@RequestMapping(value = "/store_view.do", method = RequestMethod.GET)
	public String store_view(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session, HttpServletRequest request, StoreQnaVO sqvo, StoreReviewVO srvo, StoreOptionVO optionvo, StoreVO vo) throws Exception {
		
		//세션사용자정보 가져옴
		session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		MemberVO member = ms.selectOne(login);
		model.addAttribute("member",member);
		
		
	
		//store_idx에 따른 뷰페이지 정보 가져오기
		StoreVO store = sts.read(vo.getStore_idx(), vo.getStore_funding());
		model.addAttribute("read", store );

		int member_idx = 0;
		if(login == null) {
			member_idx = 0;
		}else{
			member_idx = login.getMember_idx();
		}
		Map<String, Integer> zzimMap = new HashMap<String, Integer>();
		//찜
		zzimMap.put("store_idx", vo.getStore_idx());
		zzimMap.put("member_idx", member_idx);
		
		System.out.println(zzimMap);
		
		ZzimVO zzimResult = sts.selectZzimStore(zzimMap);
		if(zzimResult == null) {
			request.setAttribute("zzimResult", 0);
		}else {
			request.setAttribute("zzimResult", 1);
		}
		
		
		
		
		int store_fund = store.getStore_funding();
		
		if(store_fund == 0) {
			model.addAttribute("orderCount", 0);
		}else {
			int funding_idx = store.getFunding_idx();
			int orderCount =0;
			Funding_orderVO fovo = new Funding_orderVO();
			if(funding_idx>0) {
				fovo.setFunding_idx(funding_idx);
				orderCount = fms.orderCount(fovo);
			}
			model.addAttribute("orderCount", orderCount);
		}
		
		//스토어 리뷰 정렬
		String reviewSort= request.getParameter("reviewSort");
		if(reviewSort == null) {
			reviewSort = "";
		}
		System.out.println(reviewSort);
		String encodedk = URLEncoder.encode(reviewSort);			//특수기호를 인코딩한 키워드를 준비한다.
		
		if(reviewSort.equals("sortReviewLike")) {
			srvo.setSortReviewLike("a");
		}else if(reviewSort.equals("sortReviewNew")){
			srvo.setSortReviewNew("b");
		}else if(reviewSort.equals("sortReviewHighStar")) {
			srvo.setSortReviewHighStar("c");
		}else if(reviewSort.equals("sortReviewLowStar")) {
			srvo.setSortReviewLowStar("d");
		}
		
		//스토어 리뷰 사진만 가져오기 리스트
		ArrayList<StoreReviewVO> storeReviewPhoto = null;
		storeReviewPhoto = (ArrayList<StoreReviewVO>) sts.storeReviewPhoto(srvo);
		//스토어 리뷰 리스트
		final int PAGE_ROW_COUNT = 5; 							//한 페이지에 몇개씩 표시할 것인지
		final int displayPageNum = 3;							//페이징 번호 몇 개
		int pageNum = 1; 										//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		
		String strPageNum = request.getParameter("pageNum"); 	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		if(strPageNum != null) {								//만일 페이지 번호가 파라미터로 넘어 온다면
			pageNum = Integer.parseInt(strPageNum);				//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		}	
		
		int startRowNum = (pageNum -1) * PAGE_ROW_COUNT + 0;	//보여줄 페이지의 시작 ROWNUM  0부터 시작ss
		int rowCount = PAGE_ROW_COUNT;
		srvo.setStartRowNum(startRowNum);
		ArrayList<StoreReviewVO> storeReviewList = null;
		int totalRow = 0;
		
		storeReviewList = (ArrayList<StoreReviewVO>) sts.storeReviewList(srvo);
		totalRow = sts.countStoreReviewList(srvo);
		
		System.out.println("리뷰개수: "+totalRow);
		
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
		
		request.setAttribute("storeReviewList", storeReviewList);
		request.setAttribute("storeReviewPhoto", storeReviewPhoto);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("startRowNum", startRowNum);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);
		request.setAttribute("endPage", endPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("reviewSort", reviewSort);
		//스토어 리뷰 리스트 끝
		
		//스토어 별점 평균
		double starAvg = 0;
		if(sts.starAvg(srvo) == null) {
			starAvg= 0;
		}else{
			starAvg = Math.round(sts.starAvg(srvo) * 10) / 10.0;
		}
		request.setAttribute("starAvg", starAvg);
		
		//스토어 별점 별 카운트
		double star55 = sts.star5(srvo);
		double star44 = sts.star4(srvo);
		double star33 = sts.star3(srvo);
		double star22 = sts.star2(srvo);
		double star11 = sts.star1(srvo);
		int star5 = (int) Math.round(star55/totalRow*100);
		int star4 = (int) Math.round(star44/totalRow*100);
		int star3 = (int) Math.round(star33/totalRow*100);
		int star2 = (int) Math.round(star22/totalRow*100);
		int star1 = (int) Math.round(star11/totalRow*100);
		request.setAttribute("star5", star5);
		request.setAttribute("star4", star4);
		request.setAttribute("star3", star3);
		request.setAttribute("star2", star2);
		request.setAttribute("star1", star1);
		

		//펀딩 qna 댓글 리스트
		
		int pageNumQna = 1;
		
		String strPageNumQna = request.getParameter("pageNumQna"); 	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		if(strPageNumQna != null) {								//만일 페이지 번호가 파라미터로 넘어 온다면
			pageNumQna = Integer.parseInt(strPageNumQna);				//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		}	
		
		int startRowNumQna = (pageNumQna -1) * PAGE_ROW_COUNT + 0;	//보여줄 페이지의 시작 ROWNUM  0부터 시작ss
		int rowCountQna = PAGE_ROW_COUNT;
		
		sqvo.setStartRowNumQna(startRowNumQna);
		
		paramMap.put("startRowNumQna", startRowNumQna);
		
		sqvo.setRowCountQna(rowCountQna);
		
		ArrayList<StoreQnaVO> listQna = null;
		int totalRowQna = 0;

		listQna = (ArrayList<StoreQnaVO>)sts.getQnaList(paramMap);
		
		//qna 댓글 개수
		totalRowQna = sts.countStoreQna(sqvo);
		
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
		
		
		

		
		// 옵션 출력
		List<StoreOptionVO> optionlist = sts.storeOptionList(optionvo);
		model.addAttribute("optionlist", optionlist);
		
		return "store/store_view";
	}
	
//qna 시작 03
	//스토어 qna 작성, 답변 작성 ajax로 불러옴
	@RequestMapping(value ="/qnaInsert2", method= RequestMethod.POST)
	@ResponseBody
	public Object qnaInsert2(@RequestParam Map<String, Object> paramMap){
		
		//리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();
		int result = sts.qnaInsert(paramMap);
		if(result>0) {
			retVal.put("code", "OK");
			retVal.put("store_idx", paramMap.get("store_idx"));
			retVal.put("member_idx", paramMap.get("member_idx"));
			retVal.put("store_qna_idx", paramMap.get("store_qna_idx"));
			retVal.put("parent_id", paramMap.get("parent_id"));
			retVal.put("store_qna_secret", paramMap.get("store_qna_secret"));
			retVal.put("message", "등록 성공!");
		}else {
			retVal.put("code", "FAIL");
			retVal.put("message", "등록 실패!");
		}
		return retVal;
	}
	// 스토어 qna 수정
	@RequestMapping(value ="/qnaModify2", method= RequestMethod.POST)
	@ResponseBody
	public void modifyFundingQna(StoreQnaVO vo) throws Exception {
		sts.modifyStoreQna(vo);
	}
	// 스토어 qna 답변 수정
	@RequestMapping(value ="/qnaAnswerModify2", method= RequestMethod.POST)
	@ResponseBody
	public void qnaAnswerModify(StoreQnaVO vo) throws Exception {
		sts.qnaAnswerModify(vo);
	}
	//스토어 qna 답변 상태 업데이트
	@RequestMapping(value ="/qnaAnswerDone2", method= RequestMethod.POST)
	@ResponseBody
	public int qnaAnswerDone(StoreQnaVO vo) throws Exception{
		return sts.qnaAnswerDone(vo);
	}
	//스토어 큐엔에이 답변 출력
	@RequestMapping(value ="/qnaList2", method= RequestMethod.POST)
	@ResponseBody
	public ArrayList<StoreQnaVO> qnaList(StoreQnaVO vo, HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		//클릭한 qna의 qna 번호 가져오기
		String Strstore_qna_idx = request.getParameter("store_qna_idx");
		int store_qna_idx = Integer.parseInt(Strstore_qna_idx);
		String Strstore_idx = request.getParameter("store_idx");
		int store_idx = Integer.parseInt(Strstore_idx);
		
		//vo에 클릭한 qna 번호 저장
		vo.setStore_qna_idx(store_qna_idx);
		vo.setStore_idx(store_idx);
		
		ArrayList<StoreQnaVO> qnaAnswer = null;
		qnaAnswer = (ArrayList<StoreQnaVO>) sts.getQnaAnswer(paramMap);
		System.out.println(qnaAnswer);
		
		return qnaAnswer;
	}
	//스토어 qna 삭제
	@RequestMapping(value ="/qnaDelete2", method= RequestMethod.POST)
	@ResponseBody
	public void deleteFundingQna(StoreQnaVO vo) throws Exception {
		sts.deleteStoreQna(vo);
	}
//qna 끝
	
	
	
	
	/*스토어 상품 등록 페이지  기본 0 신청 -> 새 스토어 오픈*/
	@RequestMapping(value="/store_register.do",method = RequestMethod.GET)
	public String stroe_reg(Model model,HttpServletRequest request ) {
		
		MemberVO login = (MemberVO) request.getSession().getAttribute("login");
		model.addAttribute("check",0);
		model.addAttribute("login",login);
		return "store/store_reg";
	}
	
	/*스토어 상품등록 페이지 1 신청 즉, 펀딩제품 성공해서 스토어 신청 페이지*/
	@RequestMapping(value="/store_registerFun.do",method = RequestMethod.GET)
	public String stroe_FunS(Model model,HttpServletRequest request, int funding_idx ) {
		
		MemberVO login = (MemberVO) request.getSession().getAttribute("login");
		model.addAttribute("login",login);
		model.addAttribute("check",1);
		model.addAttribute("funding_idx",funding_idx);

		FundingMainVO vo = fms.select_fundingOne(funding_idx);
		List<Funding_optionVO> optionVO = fms.select_fundingOption(funding_idx);
		model.addAttribute("funding", vo);
		model.addAttribute("optionList",optionVO);
		return "store/store_reg";
	}
	
	
	/* 스토어 등록 - db에 모든 내용 쓰기*/
	   @RequestMapping(value = "/store_register.do", method = RequestMethod.POST)
	   public void store_registerDB(StoreVO vo, Model model,HttpServletRequest request
	         ,HttpServletResponse response
	         ,String store_option_name, int []store_option_price, String store_option_detail, 
	         int []store_option_stock , int funding_idx) throws IOException {

		   if(funding_idx == 0 ) {
			   		System.out.println("기본 스토어  신청");
					/*
					 * String []strName = store_option_name.split(","); String []strDetail =
					 * store_option_detail.split(",");
					 */
		      
			   	 String []strName = request.getParameterValues("store_option_name");
		         String []strDetail = request.getParameterValues("store_option_detail");
			   		
		         List<StoreOptionVO> optionVo = new ArrayList<StoreOptionVO>();
		      
		         String path = request.getSession().getServletContext().getRealPath("/resources/upload/store");
		         
		         
		         String thum = vo.getStore_thumbnail();
		         String content = vo.getStore_content();
		         String notice = vo.getStore_notice();
		         
		         
		         File dir1 = new File(path+"/"+thum);
		         File dir2 = new File(path+"/"+content);
		         File dir3 = new File(path+"/"+notice);
		         
		 		 String extension1 = thum.substring(thum.lastIndexOf("."));
		 		 String extension2 = content.substring(content.lastIndexOf("."));
		 		 String extension3 = notice.substring(notice.lastIndexOf("."));
		 		 
		 		 
		 		 String savedThumName = UUID.randomUUID() + extension1; //저장될 파일 명
		 		 String savedConName = UUID.randomUUID() + extension2; //저장될 파일 명
		 		 String savedNotName = UUID.randomUUID() + extension3; //저장될 파일 명
		         
		 		 File newdir4 = new File(path+"/"+savedThumName);
		         File newdir5 = new File(path+"/"+savedConName);
		         File newdir6 = new File(path+"/"+savedNotName);
		 		 
		 		
			   
			 	dir1.renameTo(newdir4);
			 	dir2.renameTo(newdir5);
			 	dir3.renameTo(newdir6);
			        
		         
		         vo.setStore_thumbnail(savedThumName);
		         vo.setStore_content(savedConName);
		         vo.setStore_notice(savedNotName);
		         
		         //store 상품 등록 메소드 -> 옵션배열중 첫번째 가격이 vo세팅후 들어감
		         vo.setStore_price(store_option_price[0]);
		         int result = sts.store_reg(vo);
		         
		         response.setContentType("text/html; charset=euc-kr;");
		         PrintWriter pw = response.getWriter();
		         
		         System.out.println(vo.toString());
		         System.out.println(vo.getStore_idx());

		      if (result > 0) { // 
		         
		         //마지막 증가된 Store idx 가져옴
		         int sid = vo.getStore_idx();
		         
		         for(int i=0; i<store_option_price.length; i++) {
		        	 StoreOptionVO voo = new StoreOptionVO();
		           
		            voo.setStore_option_name(strName[i]);
		          
		            voo.setStore_option_price(store_option_price[i]);
		          
		            voo.setStore_option_detail(strDetail[i]);
		          
		            voo.setStore_option_stock(store_option_stock[i]);
		            
		            voo.setStore_idx(sid);
		            optionVo.add(voo);
		         }
		         
		         //스토어 옵션 저장
		         int listresult = sts.storeOptionReg(optionVo);

		         if(listresult > 0) {
		            pw.println("<script>alert('상품 등록 성공');location.href='" + request.getContextPath() + "'" + "</script>");
		         }
		         //pw.println("<script>alert('상품 등록 성공');location.href='" + request.getContextPath() + "'" + "</script>");
		      } else {
		         pw.println("<script>alert('상품 등록 실패');location.href='" + request.getContextPath() + "/mypage/mypage.do'" + "</script>");
		      }
		      pw.flush();
			   
			   
			   
			   
			  //펀딩 성공 후 스토어 신청 
		   }else {
			   System.out.println("펀딩 성공후  스토어 신청");
			   
				/*
				 * String []strName = store_option_name.split(","); String []strDetail =
				 * store_option_detail.split(",");
				 */
			   
			   	 String []strName = request.getParameterValues("store_option_name");
		         String []strDetail = request.getParameterValues("store_option_detail");
		      
		         List<StoreOptionVO> optionVo = new ArrayList<StoreOptionVO>();
		      
		         String path = request.getSession().getServletContext().getRealPath("/resources/upload/store");
		         
		         
		         String thum = vo.getStore_thumbnail();
		         String content = vo.getStore_content();
		         String notice = vo.getStore_notice();
		         
		         
		         File dir1 = new File(path+"/"+thum);
		         File dir2 = new File(path+"/"+content);
		         File dir3 = new File(path+"/"+notice);
		         
		 		 String extension1 = thum.substring(thum.lastIndexOf("."));
		 		 String extension2 = content.substring(content.lastIndexOf("."));
		 		 String extension3 = notice.substring(notice.lastIndexOf("."));
		 		 
		 		 
		 		 String savedThumName = UUID.randomUUID() + extension1; //저장될 파일 명
		 		 String savedConName = UUID.randomUUID() + extension2; //저장될 파일 명
		 		 String savedNotName = UUID.randomUUID() + extension3; //저장될 파일 명
		         
		 		 File newdir4 = new File(path+"/"+savedThumName);
		         File newdir5 = new File(path+"/"+savedConName);
		         File newdir6 = new File(path+"/"+savedNotName);
		 		 
		 		
			   
			 	dir1.renameTo(newdir4);
			 	dir2.renameTo(newdir5);
			 	dir3.renameTo(newdir6);
			        
		         
		         vo.setStore_thumbnail(savedThumName);
		         vo.setStore_content(savedConName);
		         vo.setStore_notice(savedNotName);
		         
		         //store 상품 등록 메소드 -> 옵션배열중 첫번째 가격이 vo세팅후 들어감
		         vo.setStore_price(store_option_price[0]);
		         vo.setFunding_idx(funding_idx);
		         vo.setStore_funding(1);
		         int result = sts.store_reg2(vo);
		         
		         response.setContentType("text/html; charset=euc-kr;");
		         PrintWriter pw = response.getWriter();
		         
		         System.out.println(vo.toString());
		         System.out.println(vo.getStore_idx());

		      if (result > 0) { // 
		         
		         //마지막 증가된 Store idx 가져옴
		         int sid = vo.getStore_idx();
		         
		         for(int i=0; i<store_option_price.length; i++) {
		        	 StoreOptionVO voo = new StoreOptionVO();
		           
		            voo.setStore_option_name(strName[i]);
		          
		            voo.setStore_option_price(store_option_price[i]);
		          
		            voo.setStore_option_detail(strDetail[i]);
		          
		            voo.setStore_option_stock(store_option_stock[i]);
		            
		            voo.setStore_idx(sid);
		            optionVo.add(voo);
		         }
		         
		         //스토어 옵션 저장
		         int listresult = sts.storeOptionReg(optionVo);

		         if(listresult > 0) {
		            pw.println("<script>alert('상품 등록 성공');location.href='" + request.getContextPath() + "'" + "</script>");
		         }
		         //pw.println("<script>alert('상품 등록 성공');location.href='" + request.getContextPath() + "'" + "</script>");
		      } else {
		         pw.println("<script>alert('상품 등록 실패');location.href='" + request.getContextPath() + "/mypage/mypage.do'" + "</script>");
		      }
		      pw.flush();
		   }
		   
		   
	       
	      

	   }
	/*스토어 상품 등록 미리보기*/
	@RequestMapping(value="/store_preview.do",method = RequestMethod.POST)
	public String store_preview(StoreVO vo, Model model, 
			MultipartFile store_thumbnail_temp ,
			MultipartFile store_Detail_temp,
			MultipartFile store_Notice_temp,
			HttpServletRequest request
			,String store_option_name, int []store_option_price, String store_option_detail, 
			int []store_option_stock) throws IllegalStateException, IOException, ParseException {
		
			
			MemberVO mvo = (MemberVO) request.getSession().getAttribute("login");
		
			
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/store");
			
			
			File dir = new File(path);
			String org_ThumName = store_thumbnail_temp.getOriginalFilename();
			String org_DetailName = store_Detail_temp.getOriginalFilename();
			String org_NoticeName = store_Notice_temp.getOriginalFilename();
			
			
			if (!dir.exists()) { // 해당 디렉토리가 존재하지 않는 경우
				dir.mkdirs(); // 경로의 폴더가 없는 경우 상위 폴더에서부터 전부 생성
			}

			if (!org_ThumName.isEmpty()) { // 업로드할 파일 명이 존재하는 경우
				store_thumbnail_temp.transferTo(new File(path, org_ThumName));
			}
			
			if(!org_DetailName.isEmpty()) {
				store_Detail_temp.transferTo(new File(path, org_DetailName));
			}
			
			if(!org_NoticeName.isEmpty()) {
				store_Notice_temp.transferTo(new File(path, org_NoticeName));
			}
			
			  model.addAttribute("store", vo); 
			  model.addAttribute("org_ThumName",org_ThumName);
			  model.addAttribute("org_DetailName",org_DetailName);
			  model.addAttribute("org_NoticeName",org_NoticeName);
			  model.addAttribute("login",mvo);
			
			  String []strName = request.getParameterValues("store_option_name");
		     String []strDetail = request.getParameterValues("store_option_detail");
			
			List<StoreOptionVO> optionVo = new ArrayList<StoreOptionVO>();
			
			for(int i=0; i<store_option_price.length; i++) {
				StoreOptionVO voo = new StoreOptionVO();
				voo.setStore_option_name(strName[i]);
				voo.setStore_option_price(store_option_price[i]);
				voo.setStore_option_detail(strDetail[i]);
				voo.setStore_option_stock(store_option_stock[i]);
				optionVo.add(voo);

			}
			
			/*store 옵션 리스트 모델에 담기*/
			model.addAttribute("optionList", optionVo);
			
		return "store/store_preview";
	}
	
	//스토어 등록 됬는지 확인하는 컨트롤러
	@RequestMapping(value ="/check_store.do",method = RequestMethod.GET)
	@ResponseBody
	public int checkStore(int funding_idx) {
		
		int result = sts.store_Check(funding_idx);
		return result;
	}
	
	
	// 스토어 리뷰 작성 05
	@ResponseBody
	@RequestMapping(value = "/file-upload", method = RequestMethod.POST)
	public String fileUpload(StoreReviewVO vo, @RequestParam("store_idx") int store_idx, @RequestParam("member_idx") int member_idx, @RequestParam("store_review_star") int store_review_star, @RequestParam("store_review_content") String store_review_content, @RequestParam("article_file") List<MultipartFile> multipartFile, HttpServletRequest request) throws Exception {
		
		/*
		 * System.out.println(store_idx); System.out.println(member_idx);
		 * System.out.println(store_review_star);
		 * System.out.println(store_review_content);
		 */
		
		//파일 업로드 시작
		String strResult = "{ \"result\":\"FAIL\" }";
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot;
		System.out.println("multipartFile :" +multipartFile);
		try {
			// 파일이 있을때 탄다.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				int idx = 1;
				for(MultipartFile file:multipartFile) {
					fileRoot = contextRoot + "resources/upload/";
					System.out.println(fileRoot);
					
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
					
					
					File targetFile = new File(fileRoot + savedFileName);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						if(idx == 1) {
							vo.setStore_review_photo1(savedFileName);
						}else if(idx == 2) {
							vo.setStore_review_photo2(savedFileName);
						}else if(idx == 3) {
							vo.setStore_review_photo3(savedFileName);
						}else if(idx == 4) {
							vo.setStore_review_photo4(savedFileName);
						}else if(idx == 5) {
							vo.setStore_review_photo5(savedFileName);
						}
						idx++;
						
						
					} catch (Exception e) {
						//파일삭제
						FileUtils.deleteQuietly(targetFile);	//저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
				strResult = "{ \"result\":\"OK\" }";
			}
			// 파일 아무것도 첨부 안했을때 탄다.(게시판일때, 업로드 없이 글을 등록하는경우)
			else
				strResult = "{ \"result\":\"OK\" }";
		}catch(Exception e){
			e.printStackTrace();
		}
		sts.storeReviewWrite(vo);
		return strResult;
	}
	// 리뷰 추천 insert, update, getssss
	@RequestMapping(value ="/doReviewLike", method= RequestMethod.POST)
	@ResponseBody
	public Object doReviewLike(@RequestParam Map<String, Object> paramMap){
		
		/*
		 * Map<String, Object> retVal = new HashMap<String, Object>();
		 * System.out.println(retVal);
		 */
		sts.updateReviewLike(paramMap);
		sts.doReviewLike(paramMap);
		int result = sts.getReviewLikeNum(paramMap);
		return result;
	}
	//리뷰 추천 취소 delete, update, get
	@RequestMapping(value ="/cancelLike", method= RequestMethod.POST)
	@ResponseBody
	public Object cancelLike(@RequestParam Map<String, Object> paramMap){
		
		sts.updateReviewLike2(paramMap);
		sts.cancelLike(paramMap);
		int result = sts.getReviewLikeNum(paramMap);
		return result;
	}
	//리뷰 추천 select
	@RequestMapping(value ="/selectThumbsUp", method= RequestMethod.POST)
	@ResponseBody
	public Object selectThumbsUp(@RequestParam Map<String, Object> paramMap){
		Map<String, Object> selectThumbsUp = new HashMap<String, Object>();
		List<StoreReviewVO> result = sts.selectThumbsUp(paramMap);		
		return result;		
	}
	//스토어 리뷰 관리자 삭제
	@RequestMapping(value ="/reviewLikeAdminDel", method= RequestMethod.POST)
	@ResponseBody
	public void storeReviewLikeAdminDelete(StoreReviewLikeVO vo) throws Exception {
		sts.storeReviewLikeAdminDelete(vo);
	}
	@RequestMapping(value ="/reviewAdminDel", method= RequestMethod.POST)
	@ResponseBody
	public void storeReviewAdminDelete(StoreReviewVO vo) throws Exception {
		sts.storeReviewAdminDelete(vo);
	}
//리뷰 끝		

//결제 시작
	// 스토어 결제페이지 06
	@RequestMapping(value = "/store_pay.do", method = RequestMethod.GET)
	public String pay(Model model, StoreOptionVO optionvo, HttpServletRequest request, HttpServletResponse response) {
		
		// 옵션 출력
		List<StoreOptionVO> optionlist = sts.storeOptionList(optionvo);
		model.addAttribute("optionlist", optionlist);
			
		//세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		MemberVO member = sts.selectOne(login);
		model.addAttribute("member", member);
		
		return "store/store_pay";
	}
	
	@RequestMapping(value = "/store_pay.do", method = RequestMethod.POST)
	@ResponseBody
	public void pay(StoreOrderVO ordervo, StoreOrderOptionVO orderoptionvo, StoreExpressVO expressvo, StoreOrderPayVO payvo, HttpServletRequest request, HttpServletResponse response, 
			@RequestParam("inlineRadioOptions1") String radio) throws IOException {
		
		// 스토어 주문 번호
		int result = sts.insertOrder(ordervo);
		
		// 스토어 주문 옵션 저장
		String select = request.getParameter("select");
		String[] select_idx = select.split(",");
		String[] select_count = request.getParameterValues("count");
		for(int i=0; i<select_idx.length; i++) {
			int si = Integer.parseInt(select_idx[i]);
			int sc = Integer.parseInt(select_count[i]);
			orderoptionvo.setStore_order_option_select_idx(si);
			orderoptionvo.setStore_order_option_select_count(sc);
			sts.insertOrderOption(orderoptionvo);
			
			//옵션 수량에 따른 스토어 상품 옵션 수량 감소하게 함 -> update 수량
			sts.update_option(orderoptionvo);
		}
		
		// 스토어 주문 배송지 저장
		String name = "";
		String phone = "";
		String postnum = "";
		String addr1 = "";
		String addr2 = "";
		System.out.println(radio);
		if(radio.equals("option1")) {
			name = request.getParameter("store_express_name1");
			phone = request.getParameter("store_express_phone1");
			postnum = request.getParameter("store_express_postnum1");
			addr1 = request.getParameter("store_express_addr1_1");
			addr2 = request.getParameter("store_express_addr2_1");
			
		}else {
			name = request.getParameter("store_express_name2");
			phone = request.getParameter("store_express_phone2");
			postnum = request.getParameter("store_express_postnum2");
			addr1 = request.getParameter("store_express_addr1_2");
			addr2 = request.getParameter("store_express_addr2_2");
		}
		expressvo.setStore_express_name(name);
		expressvo.setStore_express_phone(phone);
		expressvo.setStore_express_postnum(postnum);
		expressvo.setStore_express_addr1(addr1);
		expressvo.setStore_express_addr2(addr2);
		sts.insertExpress(expressvo);
		
		// 결제 정보 저장
		sts.insertPay(payvo);
		
		
		int store_idx = Integer.parseInt(request.getParameter("store_idx"));
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter pw = response.getWriter();
		if(result>0) {
			// 저장 완료
			pw.println("<script>alert('결제가 완료되었습니다.');location.href='store_pay_complete.do?store_idx="+store_idx+"';</script>");
		}else {
			// 저장 안됭
			pw.println("<script>alert('결제가 실패하었습니다.');location.href='reserInteger.parseIntve.do';</script>");
		}
		pw.flush();
	}
	
	// 결제 검증
	private IamportClient api;
	public StoreController() {
		this.api = new IamportClient("0592735777149220", "c38863fa697011512241e9543b0a8a0e6055505edadadcfa7db2ebeba5031a556b1d24d43572d885");
	}
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{
			return api.paymentByImpUid(imp_uid);
	}
	
	// 스토어 결제 완료페이지
	@RequestMapping(value = "/store_pay_complete.do", method = RequestMethod.GET)
	public String pay_complete(HttpServletRequest request, Model model, StoreVO vo) throws Exception {
		
		//세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		MemberVO member = ms.selectOne(login);
		model.addAttribute("member", member);
		
		//store_idx에 따른 뷰페이지 정보 가져오기
		StoreVO store_info = sts.store_info(vo.getStore_idx());
		model.addAttribute("info", store_info );
		
		//스토어리스트
		List<StoreInfoDetailVO> msl = ms.myStoreList(login.getMember_idx());
		model.addAttribute("myStoreList", msl);
		
		ArrayList<StoreVO> storeHomeView = null;
		storeHomeView = (ArrayList<StoreVO>) hs.storeHomeView(vo);
		request.setAttribute("storeHomeView", storeHomeView);

		return "store/store_pay_complete";
	}
	
	
	
//찜 시작	
	// 찜 insert 07
	@RequestMapping(value ="/insertZzim2", method= RequestMethod.POST)
	@ResponseBody
	public Object insertZzim(@RequestParam Map<String, Object> paramMap){
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		System.out.println(retVal);
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
	// 찜 select
	/*
	 * @RequestMapping(value ="/selectZzim", method= RequestMethod.POST)
	 * 
	 * @ResponseBody public Object selectZzim(@RequestParam Map<String, Object>
	 * paramMap){ Map<String, Object> selectZzim = new HashMap<String, Object>();
	 * List<ZzimVO> result = sts.selectZzimStore(paramMap); return result; }
	 */
	// 찜 delete
	@RequestMapping(value ="/deleteZzim", method= RequestMethod.POST)
	@ResponseBody
	public Object deleteZzim(@RequestParam Map<String, Object> paramMap){
		Map<String, Object> deleteZzim = new HashMap<String, Object>();
		int result = sts.deleteZzimStore(paramMap);
		return result;
	}
	
	@RequestMapping(value = "/store_view_event.do", method = RequestMethod.GET)
	public String store_view_event(@RequestParam Map<String, Object> paramMap, Model model, HttpSession session, HttpServletRequest request, StoreQnaVO sqvo, StoreReviewVO srvo, StoreOptionVO optionvo, StoreVO vo) throws Exception {
		
		String event = request.getParameter("event");
		
		//세션사용자정보 가져옴
		session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		MemberVO member = ms.selectOne(login);
		model.addAttribute("member",member);
		
		
		int event2 = Integer.parseInt(event);
		
		request.setAttribute("event", event2);
		
		//store_idx에 따른 뷰페이지 정보 가져오기
		StoreVO store = sts.read(vo.getStore_idx(), vo.getStore_funding());
		model.addAttribute("read", store );

		int member_idx = 0;
		if(login == null) {
			member_idx = 0;
		}else{
			member_idx = login.getMember_idx();
		}
		Map<String, Integer> zzimMap = new HashMap<String, Integer>();
		//찜
		zzimMap.put("store_idx", vo.getStore_idx());
		zzimMap.put("member_idx", member_idx);
		
		System.out.println(zzimMap);
		
		ZzimVO zzimResult = sts.selectZzimStore(zzimMap);
		if(zzimResult == null) {
			request.setAttribute("zzimResult", 0);
		}else {
			request.setAttribute("zzimResult", 1);
		}
		
		int store_fund = store.getStore_funding();
		
		if(store_fund == 0) {
			model.addAttribute("orderCount", 0);
		}else {
			int funding_idx = store.getFunding_idx();
			int orderCount =0;
			Funding_orderVO fovo = new Funding_orderVO();
			if(funding_idx>0) {
				fovo.setFunding_idx(funding_idx);
				orderCount = fms.orderCount(fovo);
			}
			model.addAttribute("orderCount", orderCount);
		}
		
		//스토어 리뷰 정렬
		String reviewSort= request.getParameter("reviewSort");
		if(reviewSort == null) {
			reviewSort = "";
		}
		System.out.println(reviewSort);
		String encodedk = URLEncoder.encode(reviewSort);			//특수기호를 인코딩한 키워드를 준비한다.
		
		if(reviewSort.equals("sortReviewLike")) {
			srvo.setSortReviewLike("a");
		}else if(reviewSort.equals("sortReviewNew")){
			srvo.setSortReviewNew("b");
		}else if(reviewSort.equals("sortReviewHighStar")) {
			srvo.setSortReviewHighStar("c");
		}else if(reviewSort.equals("sortReviewLowStar")) {
			srvo.setSortReviewLowStar("d");
		}
		
		//스토어 리뷰 사진만 가져오기 리스트
		ArrayList<StoreReviewVO> storeReviewPhoto = null;
		storeReviewPhoto = (ArrayList<StoreReviewVO>) sts.storeReviewPhoto(srvo);
		//스토어 리뷰 리스트
		final int PAGE_ROW_COUNT = 5; 							//한 페이지에 몇개씩 표시할 것인지
		final int displayPageNum = 3;							//페이징 번호 몇 개
		int pageNum = 1; 										//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		
		String strPageNum = request.getParameter("pageNum"); 	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		if(strPageNum != null) {								//만일 페이지 번호가 파라미터로 넘어 온다면
			pageNum = Integer.parseInt(strPageNum);				//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		}	
		
		int startRowNum = (pageNum -1) * PAGE_ROW_COUNT + 0;	//보여줄 페이지의 시작 ROWNUM  0부터 시작ss
		int rowCount = PAGE_ROW_COUNT;
		srvo.setStartRowNum(startRowNum);
		ArrayList<StoreReviewVO> storeReviewList = null;
		int totalRow = 0;
		
		storeReviewList = (ArrayList<StoreReviewVO>) sts.storeReviewList(srvo);
		totalRow = sts.countStoreReviewList(srvo);
		
		System.out.println("리뷰개수: "+totalRow);
		
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
		
		request.setAttribute("storeReviewList", storeReviewList);
		request.setAttribute("storeReviewPhoto", storeReviewPhoto);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("startRowNum", startRowNum);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);
		request.setAttribute("endPage", endPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("reviewSort", reviewSort);
		//스토어 리뷰 리스트 끝
		
		//스토어 별점 평균
		double starAvg = 0;
		if(sts.starAvg(srvo) == null) {
			starAvg= 0;
		}else{
			starAvg = Math.round(sts.starAvg(srvo) * 10) / 10.0;
		}
		request.setAttribute("starAvg", starAvg);
		
		//스토어 별점 별 카운트
		double star55 = sts.star5(srvo);
		double star44 = sts.star4(srvo);
		double star33 = sts.star3(srvo);
		double star22 = sts.star2(srvo);
		double star11 = sts.star1(srvo);
		int star5 = (int) Math.round(star55/totalRow*100);
		int star4 = (int) Math.round(star44/totalRow*100);
		int star3 = (int) Math.round(star33/totalRow*100);
		int star2 = (int) Math.round(star22/totalRow*100);
		int star1 = (int) Math.round(star11/totalRow*100);
		request.setAttribute("star5", star5);
		request.setAttribute("star4", star4);
		request.setAttribute("star3", star3);
		request.setAttribute("star2", star2);
		request.setAttribute("star1", star1);
		

		//펀딩 qna 댓글 리스트
		
		int pageNumQna = 1;
		
		String strPageNumQna = request.getParameter("pageNumQna"); 	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		if(strPageNumQna != null) {								//만일 페이지 번호가 파라미터로 넘어 온다면
			pageNumQna = Integer.parseInt(strPageNumQna);				//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		}	
		
		int startRowNumQna = (pageNumQna -1) * PAGE_ROW_COUNT + 0;	//보여줄 페이지의 시작 ROWNUM  0부터 시작ss
		int rowCountQna = PAGE_ROW_COUNT;
		
		sqvo.setStartRowNumQna(startRowNumQna);
		
		paramMap.put("startRowNumQna", startRowNumQna);
		
		sqvo.setRowCountQna(rowCountQna);
		
		ArrayList<StoreQnaVO> listQna = null;
		int totalRowQna = 0;

		listQna = (ArrayList<StoreQnaVO>)sts.getQnaList(paramMap);
		
		//qna 댓글 개수
		totalRowQna = sts.countStoreQna(sqvo);
		
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
		
		
		
		// 옵션 출력
		List<StoreOptionVO> optionlist = sts.storeOptionList(optionvo);
		model.addAttribute("optionlist", optionlist);
		
		return "store/store_view_event";
	}
	
	 /*스토어 수정_수량 페이지*/
		@RequestMapping(value= "/store_modify.do", method = RequestMethod.GET)
		public String store_modify(int store_idx, Model model) {
			
			// 스토어 내용 불러오기
			StoreVO vo =  sts.store_info(store_idx);
			model.addAttribute("store", vo);
			
			//스토어 옵션 불러오기
			StoreOptionVO option = new StoreOptionVO();
			option.setStore_idx(store_idx);
			List<StoreOptionVO> storeOptionVo = sts.storeOptionList(option);
			
			if(storeOptionVo.size() >0) {
				
				model.addAttribute("optionList", storeOptionVo);
			}
			
			return "mypage/store_modify";
		}
		
		/*스토어 옵션 수량 추가*/
		@RequestMapping(value= "/store_modify.do", method = RequestMethod.POST)
		@ResponseBody
		public int store_modify2(Model model , HttpServletRequest req ) {
			System.out.println("스토어 수량 추가 메소드 들어옴");
				
			String[] option_idx = req.getParameterValues("option_idx");
			String[] store_option_plus = req.getParameterValues("store_option_plus");
			StoreOptionVO vo = new StoreOptionVO();
			int result = 1;
			for(int i = 0; i<option_idx.length;i++) {
				if(!store_option_plus[i].equals("0")) {
					
					vo.setStore_option_idx(Integer.parseInt(option_idx[i]));
					System.out.println("idx : "+option_idx[i]);
					vo.setStore_option_stock(Integer.parseInt(store_option_plus[i]));
					System.out.println("수량"+store_option_plus[i]);
					
					result = sts.addStock(vo);
					if(result == 0) {
						return 0;
					}else {
						result = 1;
					}
				}
			}
			return result;
		}
		
		/*스토어 상품 pdf변경 */
		@RequestMapping(value="/store_modify_content.do", method=RequestMethod.GET)
		public String modify_content(int store_idx, Model model,int check) {
			System.out.println("get메소드" +store_idx);
			//FundingMainVO vo =  fms.select_fundingOne(funding_idx);
			StoreVO vo = sts.store_info(store_idx);
			
			
			model.addAttribute("store", vo);
			model.addAttribute("check",check);
			model.addAttribute("store_idx", store_idx);
			
			
			return "mypage/store_modify_file";
		}
		
		/*스토어 공지사항 변경*/
		@RequestMapping(value="/store_modify_notice.do", method=RequestMethod.GET)
		public String modify_notice(int store_idx, Model model,int check) {
			System.out.println("get메소드" +store_idx);
			StoreVO vo = sts.store_info(store_idx);
			
			model.addAttribute("store", vo);
			model.addAttribute("check",check);
			model.addAttribute("store_idx", store_idx);
			return "mypage/store_modify_file";
		}
		
		
		
		/*스토어 컨텐츠 변경*/
		@RequestMapping(value = "/store_update_conetent.do",method=RequestMethod.POST)
		public String update_content(MultipartFile store_Detail_temp , HttpServletRequest request , Model model, 
				int store_idx, int flag) throws IllegalStateException, IOException {
			
			
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/store");
			
			File dir = new File(path);
			
			String org_DetailName = store_Detail_temp.getOriginalFilename();
			
			if (!dir.exists()) { // 해당 디렉토리가 존재하지 않는 경우
				dir.mkdirs(); // 경로의 폴더가 없는 경우 상위 폴더에서부터 전부 생성
			}
			
			if(!org_DetailName.isEmpty()) {
				store_Detail_temp.transferTo(new File(path, org_DetailName));
			}
			StoreVO vo = sts.storeSelectOne(store_idx);
			model.addAttribute("store", vo);
			model.addAttribute("file_name" ,org_DetailName);
			model.addAttribute("flag", flag);
			
			StoreOptionVO ovo = new StoreOptionVO();
			ovo.setStore_idx(store_idx);
			List<StoreOptionVO> storeOptionVo = sts.storeOptionList(ovo);
			model.addAttribute("optionList", storeOptionVo);
			
		
				return "mypage/store_preview2";
		}
		
		/*스토어 공지사항 변경*/
		@RequestMapping(value = "/store_update_notice.do",method=RequestMethod.POST)
		public String update_notice(MultipartFile store_Notice_temp , HttpServletRequest request , Model model, 
				int store_idx, int flag) throws IllegalStateException, IOException {
			
			
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/store");
			
			File dir = new File(path);
			
			String org_DetailName = store_Notice_temp.getOriginalFilename();
			
			if (!dir.exists()) { // 해당 디렉토리가 존재하지 않는 경우
				dir.mkdirs(); // 경로의 폴더가 없는 경우 상위 폴더에서부터 전부 생성
			}
			
			if(!org_DetailName.isEmpty()) {
				store_Notice_temp.transferTo(new File(path, org_DetailName));
			}
			
			System.out.println(org_DetailName);
			
			StoreVO vo = sts.storeSelectOne(store_idx);
			model.addAttribute("store", vo);
			model.addAttribute("file_name" ,org_DetailName);
			model.addAttribute("flag", flag);
			
			StoreOptionVO ovo = new StoreOptionVO();
			ovo.setStore_idx(store_idx);
			List<StoreOptionVO> storeOptionVo = sts.storeOptionList(ovo);
			model.addAttribute("optionList", storeOptionVo);
			
			
		
				return "mypage/store_preview2";
		}
		
		
		
		
		@RequestMapping(value="/update_file.do",method = RequestMethod.POST)
		public void update_file(int store_idx, int check, String store_content, String store_notice, 
				HttpServletResponse response, HttpServletRequest request) throws IOException {
			//프로젝트 pdf 업데이트
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			HashMap<String,Object> map2 = new HashMap<String,Object>();
			response.setContentType("text/html; charset=euc-kr;" );
			PrintWriter pw = response.getWriter();
			String mainPath = request.getContextPath();
			  String path = request.getSession().getServletContext().getRealPath("/resources/upload/store");
			
			int result = 0;
			
			if(check == 0 ) {
				/*파일 난수이름으로 바꾸기*/
				   String content = store_content;
				   File dir2 = new File(path+"/"+content);
				   String extension2 = content.substring(content.lastIndexOf("."));
				   String savedConName = UUID.randomUUID() + extension2; //저장될 파일 명
				   File newdir5 = new File(path+"/"+savedConName);
				   dir2.renameTo(newdir5);
				   store_content = savedConName;
				
				System.out.println(store_idx +" : " +check + " : " +store_content +" : " +store_notice );
				System.out.println("프로젝트 pdf 업데이트");
				map.put("store_idx", store_idx);
				map.put("checkValue", check);
				map.put("store_content", store_content);
				
				result = sts.store_updateFile(map);
				if (result == 1) {
					System.out.println(mainPath);
					
					pw.println("<script>alert('제품 설명 파일 수정완료');location.href='"+mainPath+"/mypage/mypage2.do'"+"</script>");
				}
				else {
					pw.println("<script>alert('제품 설명 파일 수정실패');window.history.back();</script>");
				}
			}else {
			     
		         String notice = store_notice;
		         File dir3 = new File(path+"/"+notice);
		 		 String extension3 = notice.substring(notice.lastIndexOf("."));
		 		 String savedNotName = UUID.randomUUID() + extension3; //저장될 파일 명
		   
		         File newdir6 = new File(path+"/"+savedNotName);
			 	 dir3.renameTo(newdir6);
				
				store_notice = savedNotName;
				
				System.out.println("공지사항 업데이트");
				map2.put("store_idx", store_idx);
				map2.put("checkValue", check);
				map2.put("store_notice", store_notice);
				result = sts.store_updateFile(map2);
				
				
				if (result == 1) {
					
					pw.println("<script>alert('공지사항 파일 수정완료');location.href='"+mainPath+"/mypage/mypage2.do'"+"</script>");
				}
				else {
					pw.println("<script>alert('공지사항 파일 수정실패');window.history.back();</script>");
				}
				
			}
			pw.flush();
			
		}
		
		
		
		
		
}
