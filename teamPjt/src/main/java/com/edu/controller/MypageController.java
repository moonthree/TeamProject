package com.edu.controller;



import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;

import com.edu.service.MypageService;
import com.edu.service.fundingMainService;
import com.edu.vo.FileUploadVO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.Funding_optionVO;
import com.edu.vo.MemberVO;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController {
	@Autowired
	private MypageService mypageService;

	@Autowired 
	private fundingMainService fundingMainServiece;
	
	@RequestMapping(value = "/mypage.do")
	public String mypage(Model model, HttpServletRequest request) {
		// 세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member", member);

		return "mypage/mypage";
	}

	@RequestMapping(value = "/mypage2.do")
	public String mypage2(Model model, HttpServletRequest request) {
		// 세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member", member);

		return "mypage/mypage2";
	}

	/* 펀딩 등록 메소드 */
	@RequestMapping(value = "/funding_register.do", method = RequestMethod.GET)
	public String funding_register() {
		//git 넘기기용
		return "mypage/funding_register";
	}
	
	/* 펀등 등록 - db에 모든 내용 쓰기*/
	@RequestMapping(value = "/funding_register.do", method = RequestMethod.POST)
	public void funding_register2(FundingMainVO vo, Model model,HttpServletRequest request
			,HttpServletResponse response
			,String funding_option_name, int []funding_option_price, String funding_option_detail, 
			int []funding_option_stock) throws IOException {
		
			String []strName = funding_option_name.split(",");
			String []strDetail = funding_option_detail.split(",");
		
			List<Funding_optionVO> optionVo = new ArrayList<Funding_optionVO>();
		
			int result = fundingMainServiece.fun_reg(vo);
			response.setContentType("text/html; charset=euc-kr;");
			PrintWriter pw = response.getWriter();
		

		if (result > 0) { // 회원가입 성공 -> home으로 이동
			
			//마지막 증가된 funding_idx 가져옴
			int fid = vo.getFunding_idx();
	System.out.println(vo.toString());
		
		int result = fundingMainServiece.fun_reg(vo);
		
		if(result  == 1) {
			return "redirect:/mypage/mypage2.do";
		}
		else {
			
			for(int i=0; i<funding_option_price.length; i++) {
				Funding_optionVO voo = new Funding_optionVO();
				voo.setFunding_option_name(strName[i]);
				voo.setFunding_option_price(funding_option_price[i]);
				voo.setFunding_option_detail(strDetail[i]);
				voo.setFunding_option_stock(funding_option_stock[i]);
				voo.setFunding_idx(fid);
				optionVo.add(voo);
			}
			
		
			int listresult = fundingMainServiece.fun_option_reg(optionVo);

			if(listresult > 0) {
				pw.println("<script>alert('상품 등록 성공');location.href='" + request.getContextPath() + "'" + "</script>");
			}
			//pw.println("<script>alert('상품 등록 성공');location.href='" + request.getContextPath() + "'" + "</script>");
		} else {
			pw.println("<script>alert('회원가입 실패');location.href='" + request.getContextPath() + "/mypage/mypage.do'" + "</script>");
		}
		pw.flush();


	
	}

	
	/* 펀딩 미리보기 페이지*/
	@RequestMapping(value = "/funding_view.do",method = RequestMethod.POST)
	public String funding_view( FundingMainVO vo, Model model, 
			MultipartFile funding_thumbnail_temp ,
			MultipartFile funding_Detail_temp,
			MultipartFile funding_Notice_temp,
			HttpServletRequest request
			,String funding_option_name, int []funding_option_price, String funding_option_detail, 
			int []funding_option_stock) throws ParseException, IllegalStateException, IOException {
		
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
		  
		
		String []strName = funding_option_name.split(",");
		String []strDetail = funding_option_detail.split(",");
		
		List<Funding_optionVO> optionVo = new ArrayList<Funding_optionVO>();
		
		for(int i=0; i<funding_option_price.length; i++) {
			Funding_optionVO voo = new Funding_optionVO();
			voo.setFunding_option_name( strName[i]);
			voo.setFunding_option_price(funding_option_price[i]);
			voo.setFunding_option_detail(strDetail[i]);
			voo.setFunding_option_stock(funding_option_stock[i]);
			optionVo.add(voo);
			
		}
		
		/*옵션 리스트 모델에 담기*/
		model.addAttribute("optionList", optionVo);
		
		return "mypage/funding_view"; 
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
	
	
	
}
