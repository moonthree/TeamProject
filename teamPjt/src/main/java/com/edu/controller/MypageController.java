package com.edu.controller;



import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.edu.service.MypageService;
import com.edu.service.fundingMainService;
import com.edu.vo.FileUploadVO;
import com.edu.vo.FundingCommunityVO;
import com.edu.vo.FundingInfoDetailParameterVO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.MemberVO;
import com.edu.vo.ZzimVO;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController {
	@Autowired
	private MypageService mypageService;

	@Autowired
	private fundingMainService fms;
	
	@Autowired 
	private fundingMainService fundingMainServiece;
	@RequestMapping(value = "/mypage.do")
	public String mypage(Model model, HttpServletRequest request) {
		// 세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member", member);
		
		//펀딩리스트 3개씩 & 펀딩 개수
		List<FundingMainVO> s3f = mypageService.select3Funding(login.getMember_idx());
		model.addAttribute("select3Funding",s3f);
		model.addAttribute("countFunding",mypageService.countFunding(login.getMember_idx()));
		
		//찜리스트 3개씩 & 찜 개수
		List<ZzimVO> s3z = mypageService.select3Zzim(login.getMember_idx());
		model.addAttribute("select3Zzim",s3z);
		model.addAttribute("countZzim",mypageService.countZzim(login.getMember_idx()));
		
		return "mypage/mypage";
	}

	@RequestMapping(value = "/mypage2.do")
	public String mypage2(Model model, HttpServletRequest request) {
		// 세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member", member);

		//판매자 펀딩 내역 가져오기
		List<FundingMainVO> sfl = mypageService.sellerFundingList(login.getMember_idx());
		model.addAttribute("sellerFundingList",sfl);
		
		return "mypage/mypage2";
	}

	/* 펀딩 등록 메소드 */
	@RequestMapping(value = "/funding_register.do", method = RequestMethod.GET)
	public String funding_register() {
		//git 넘기기용
		return "mypage/funding_register";
	}
	@RequestMapping(value = "/funding_register.do", method = RequestMethod.POST)
	public String funding_register2(FundingMainVO vo, Model model,HttpServletRequest request) {
		
	System.out.println(vo.toString());
		
		int result = fundingMainServiece.fun_reg(vo);
		
		if(result  == 1) {
			return "redirect:/mypage/mypage2.do";
		}
		else {
			
			return "redirect:/request.getContextPath()";
		}
	
	}

	
	/* 펀딩 미리보기 페이지*/
	@RequestMapping(value = "/funding_view.do",method = RequestMethod.POST)
	public String funding_view( FundingMainVO vo, Model model, 
			MultipartFile funding_thumbnail_temp ,
			MultipartFile funding_Detail_temp,
			MultipartFile funding_Notice_temp,
			HttpServletRequest request) throws ParseException, IllegalStateException, IOException {
		
		//MemberVO vo  = request.getSession().getAttribute("login");
		
		System.out.println(vo.toString());
		
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/funding");
	
		File dir = new File(path);
		String org_ThumName = funding_thumbnail_temp.getOriginalFilename();
		String org_DetailName = funding_Detail_temp.getOriginalFilename();
		String org_NoticeName = funding_Notice_temp.getOriginalFilename();
		
		
		if (!dir.exists()) { // 해당 디렉토리가 존재하지 않는 경우
			dir.mkdirs(); // 경로의 폴더가 없는 경우 상위 폴더에서부터 전부 생성
		}

		if (!org_ThumName.isEmpty()) { // 업로드할 파일 명이 존재하는 경우
			funding_thumbnail_temp.transferTo(new File(path, org_ThumName));
		}
		
		if(!org_DetailName.isEmpty()) {
			funding_Detail_temp.transferTo(new File(path, org_DetailName));
		}
		
		if(!org_NoticeName.isEmpty()) {
			funding_Notice_temp.transferTo(new File(path, org_NoticeName));
		}
		
		/*
		 * List<String>filepath = new ArrayList<String>();
		 * 
		 * filepath.add(org_ThumName); filepath.add(org_DetailName);
		 */
		
		
		 String from = vo.getFunding_end_date()+" 00:00:00";;
		 SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 Date to = fm.parse(from);
		 long d1 = to.getTime();
		
		  Calendar c1 = Calendar.getInstance(); 
		  long today = c1.getTimeInMillis();
		  
		  long diffSec = (d1 - today) / 1000; //초 차이 
		  long diffDays = diffSec /(24*60*60); //일자수 차이
		  
		  model.addAttribute("funding", vo); 
		  model.addAttribute("difftime", diffDays);
		  
		  
		  model.addAttribute("org_ThumName",org_ThumName);
		  model.addAttribute("org_DetailName",org_DetailName);
		  model.addAttribute("org_NoticeName",org_NoticeName);
		  
		MemberVO login = new MemberVO();
		HttpSession session = request.getSession();
		
		login = (MemberVO) session.getAttribute("login");
		
		 
		return "mypage/funding_view"; 
	}
/*
	 @RequestMapping(value="/funding_view.do", method = RequestMethod.POST) 
	 public String funding_view1( FundingMainVO vo, Model model, HttpServletRequest
	  request ,@RequestParam("funding_thumbnail22") MultipartFile file ) throws ParseException {
		 
	 System.out.println("view.들어옴");
	  System.out.println(vo.toString());
	  
	  System.out.println();
	  
	  String from = vo.getFunding_end_date() +" 00:00:00"; SimpleDateFormat fm =
	  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); Date to = fm.parse(from); long
	  d1 = to.getTime();
	  
	  
	  Calendar c1 = Calendar.getInstance(); long today = c1.getTimeInMillis();
	  
	  long diffSec = (d1 - today) / 1000; //초 차이 long diffDays = diffSec /
	  (24*60*60); //일자수 차이
	  
	  
	  
	  String path =
	  request.getSession().getServletContext().getRealPath("/resources/upload");
	  System.out.println("파일 경로 : "+path);
	  
	  String filename = file.getOriginalFilename(); System.out.println(filename);
	  
	  model.addAttribute("funding", vo); model.addAttribute("difftime", diffDays);
	 	model.addAttribute("fuding_thum", filename);
	  
	
	 
	  return "mypage/funding_view"; 
	 }
	*/

	
	/*
	@RequestMapping(value="/testUpload.do",method = RequestMethod.POST)
	@ResponseBody
	public int testUpload( MultipartFile upload, final String userEmail, String checkForm, HttpServletRequest request) throws IllegalStateException, IOException {
		
		
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/funding");
		
		System.out.println( "유저 이메일 :"+userEmail);
		File dir = new File(path);
		if (!dir.exists()) { // 해당 디렉토리가 존재하지 않는 경우
			dir.mkdirs(); // 경로의 폴더가 없는 경우 상위 폴더에서부터 전부 생성
		}

		//1. 오리지널 파일명
		String orgName = upload.getOriginalFilename();
		//2. 파일명만 추출
		String imgName = orgName.substring(0, orgName.lastIndexOf('.'));
		//3. 확장자 추출
		String ext = orgName.substring(orgName.lastIndexOf('.'));
		
		
		//5. 최종 파일이름
		
		
		String newName ="";
		if(checkForm.equals("1")) {
			newName = userEmail + "1#" +orgName;
		}
		else if(checkForm.equals("2")) {
			newName = userEmail + "2#" +orgName;
		}
		else {
			newName = userEmail + "3#" +orgName;
			
		}
		
		File[] files = dir.listFiles();
		for(File f : files) {
			if(f.isFile() && f.getName().startsWith(userEmail +checkForm+"#")) { 
				System.out.println("찾았다 : "+f.getName());
			
				
				upload.transferTo(new File(path, newName));
				
				return 1;
			}
		}
		return 0;
	}
	*/
	

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
	public String info_funding(Model model, HttpServletRequest request) {
		// 세션에 있는 사용자의 정보를 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member", member);
		//펀딩리스트 3개씩 & 펀딩 개수
		List<FundingMainVO> mfl = mypageService.myFundingList(login.getMember_idx());
		model.addAttribute("myFundingList",mfl);

		return "mypage/info_funding";
	}

	@RequestMapping(value = "/info_funding_detail.do", method = RequestMethod.GET)
	public String info_funding_detail(Model model, FundingMainVO vo, HttpServletRequest request) {
		
		// 세션에 있는 사용자의 정보를 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member", member);
		
		//funding_idx에 따른 주문정보가져오기
		FundingInfoDetailParameterVO fipv = new FundingInfoDetailParameterVO();
		fipv.setFunding_idx(vo.getFunding_idx());
		fipv.setMember_idx(login.getMember_idx());
		model.addAttribute("detail", mypageService.fundingDetail(fipv));
		
		return "mypage/info_funding_detail";
	}

	@RequestMapping(value = "/info_zzim.do")
	public String info_zzim(Model model, FundingMainVO vo, HttpServletRequest request) throws Exception {
		
		// 세션에 있는 사용자의 정보를 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member", member);
		// 찜리스트
		List<FundingMainVO> mzl = mypageService.myZzimList(login.getMember_idx());
		model.addAttribute("myZzimList",mzl);
		
		return "mypage/info_zzim";
	}

	@RequestMapping(value = "/my_info.do")
	public String my_info(Model model, HttpServletRequest request) {

		// 세션에 있는 사용자의 정보를 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member", member);

		return "mypage/my_info";
		
	}

	@RequestMapping(value = "/my_info_modify.do")
	public String my_info_modify(Model model, HttpServletRequest request) {

		// 세션에 있는 사용자의 정보를 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member", member);

		return "mypage/my_info_modify";
	}

	@RequestMapping(value = "/upload.do")
	public String upload(HttpServletRequest request, @RequestParam("fff") MultipartFile file, FileUploadVO vo)
			throws IllegalStateException, IOException {

		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		System.out.println("file idx : " + login.getMember_idx());
		System.out.println("file photo : " + login.getMember_photo());

		// 절대경로가 아닌
		// 톰캣이 카피를 떠서 사용하는 경로 -> 실시간 반영
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println("경로 : " + path);

		File dir = new File(path);
		if (!dir.exists()) { // 해당 디렉토리가 존재하지 않는 경우
			dir.mkdirs(); // 경로의 폴더가 없는 경우 상위 폴더에서부터 전부 생성
		}

		if (!file.getOriginalFilename().isEmpty()) { // 업로드할 파일 명이 존재하는 경우
			file.transferTo(new File(path, file.getOriginalFilename()));
		}

		//System.out.println("originalFilename : " + file.getOriginalFilename());
		vo.setPath(file.getOriginalFilename());

		// update_photo메소드로 originalFilename명을 넣어줌
		mypageService.update_photo(vo);

		return "redirect:my_info_modify.do";
	}

	@RequestMapping(value = "/profileUpdate.do")
	public String profileUpdate(MemberVO vo, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");

		vo.setMember_idx(login.getMember_idx());

		// DB에 수정처리
		int result = mypageService.update_profile(vo);

		if (result > 0) {
			return "redirect:my_info.do";
		} else {
			System.out.println("수정 실패");
			return "redirect:/";
		}

	}
	
	// 공지사항 이동
	@RequestMapping(value = "/notice_list.do")
	public String notice_list() {	
		return "notice/notice_list";
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
		
		return "funding/view";
	}
	
	// 찜 delete
	@RequestMapping(value ="/deleteZzim.do", method= RequestMethod.GET)
	public String deleteZzim(HttpServletRequest request, FundingMainVO vo, Model model){
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		
		Map<String, Integer> deleteZzim = new HashMap<String, Integer>();
		deleteZzim.put("member_idx", login.getMember_idx());
		deleteZzim.put("funding_idx", vo.getFunding_idx());
		
		int result = mypageService.deleteZzim(deleteZzim);
		if(result > 0) { //찜성공
			return "redirect:info_zzim.do";
		}else { //찜실패
			System.out.println("찜실패");
			return "redirect:info_zzim.do";
		}
	}
	
	
	
	
}
