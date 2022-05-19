package com.edu.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.edu.service.MypageService;
import com.edu.service.StoreService;
import com.edu.service.fundingMainService;
import com.edu.vo.FundingCommunityVO;
import com.edu.vo.Funding_orderVO;
import com.edu.vo.MemberVO;
import com.edu.vo.StoreOptionVO;
import com.edu.vo.StoreReviewVO;
import com.edu.vo.StoreVO;
import com.edu.vo.ZzimVO;

@Controller
@RequestMapping(value = "/store")
public class StoreController {
	
	@Autowired
	private fundingMainService fms;
	
	@Autowired
	private StoreService sts;

	@Autowired
	private MypageService ms;

	
	// 스토어 메인페이지 
	@RequestMapping(value = "/store_main.do")
	public String main() {
		return "store/store_main";
	}
	// 스토어 메인페이지 
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
	
	// 스토어 뷰페이지 
	@RequestMapping(value = "/store_view.do", method = RequestMethod.GET)
	public String store_view(Model model, HttpSession session, HttpServletRequest request, StoreReviewVO srvo, StoreOptionVO optionvo, StoreVO vo) throws Exception {
		
		//store_idx에 따른 뷰페이지 정보 가져오기
		StoreVO store = sts.read(vo.getStore_idx(), vo.getStore_funding());
		model.addAttribute("read", store );

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
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("startRowNum", startRowNum);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);
		request.setAttribute("endPage", endPage);
		request.setAttribute("startPage", startPage);
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
		
		
		//세션사용자정보 가져옴
		session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		MemberVO member = ms.selectOne(login);
		model.addAttribute("member",member);

		
		// 옵션 출력
		List<StoreOptionVO> optionlist = sts.storeOptionList(optionvo);
		model.addAttribute("optionlist", optionlist);
		
		return "store/store_view";
	}
	/*스토어 상품 등록 페이지*/
	@RequestMapping(value="store_register.do",method = RequestMethod.GET)
	public String stroe_reg(Model model,HttpServletRequest request ) {
		
		MemberVO login = (MemberVO) request.getSession().getAttribute("login");
		model.addAttribute("login",login);
		return "store/store_reg";
	}
	/*스토어 상품 등록 미리보기*/
	@RequestMapping(value="store_preview.do",method = RequestMethod.POST)
	public String store_preview(StoreVO vo, Model model, 
			MultipartFile store_thumbnail_temp ,
			MultipartFile store_Detail_temp,
			MultipartFile store_Notice_temp,
			HttpServletRequest request
			,String store_option_name, int []store_option_price, String store_option_detail, 
			int []store_option_stock) throws IllegalStateException, IOException, ParseException {
		
			System.out.println(vo.toString());
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
			
			String []strName = store_option_name.split(",");
			String []strDetail = store_option_detail.split(",");
			
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
	// 스토어 리뷰 작성
	@ResponseBody
	@RequestMapping(value = "/file-upload", method = RequestMethod.POST)
	public String fileUpload(StoreReviewVO vo, @RequestParam("store_idx") int store_idx, @RequestParam("member_idx") int member_idx, @RequestParam("store_review_star") int store_review_star, @RequestParam("store_review_content") String store_review_content, @RequestParam("article_file") List<MultipartFile> multipartFile, HttpServletRequest request) throws Exception {
		
		System.out.println(store_idx);
		System.out.println(member_idx);
		System.out.println(store_review_star);
		System.out.println(store_review_content);
		
		//파일 업로드 시작
		String strResult = "{ \"result\":\"FAIL\" }";
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot;
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
	
	// 스토어 결제페이지
	@RequestMapping(value = "/store_pay.do", method = RequestMethod.GET)
	public String pay(Model model, HttpServletRequest request) {
		
		//세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		MemberVO member = sts.selectOne(login);
		model.addAttribute("member", member);
		
		return "store/store_pay";
	}
	// 찜 insert
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
	@RequestMapping(value ="/selectZzim", method= RequestMethod.POST)
	@ResponseBody
	public Object selectZzim(@RequestParam Map<String, Object> paramMap){
		Map<String, Object> selectZzim = new HashMap<String, Object>();
		List<ZzimVO> result = fms.selectZzim(paramMap);		
		return result;		
	}
	
	// 찜 delete
	@RequestMapping(value ="/deleteZzim", method= RequestMethod.POST)
	@ResponseBody
	public Object deleteZzim(@RequestParam Map<String, Object> paramMap){
		Map<String, Object> deleteZzim = new HashMap<String, Object>();
		int result = fms.deleteZzim(paramMap);
		return result;
	}
}
