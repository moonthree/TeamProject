package com.edu.controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.vo.FundingMainVO;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.edu.service.MypageService;
import com.edu.vo.FileUploadVO;
import com.edu.vo.MemberVO;


@Controller
@RequestMapping(value = "/mypage")
public class MypageController {
	@Autowired
	private MypageService mypageService ;
	
	@RequestMapping(value = "/mypage.do")
	public String mypage(Model model, HttpServletRequest request) {
		//세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member",member);
		
		return "mypage/mypage";
	}
	@RequestMapping(value = "/mypage2.do")
	public String mypage2(Model model, HttpServletRequest request) {
		//세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member",member);
		
		return "mypage/mypage2";
	}
	
	/* 펀딩 등록 메소드*/
	@RequestMapping(value = "/funding_register.do")
	public String funding_register() {
		return "mypage/funding_register";
	}
	
	
	/*펀딩 미리보기 페이지*/
	@RequestMapping(value="/funding_view.do", method = RequestMethod.POST)
	public String funding_view1(FundingMainVO vo, Model model) throws ParseException {
		System.out.println("view.들어옴");
		System.out.println(vo.toString());
		
		
		System.out.println(vo.getFunding_end_date());
		System.out.println(vo.getFunding_start_date());
		
		String from = vo.getFunding_end_date() +" 00:00:00";
		System.out.println(from);
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date to = fm.parse(from);
		long d2= to.getTime();
		
		System.out.println("하하하 : " +d2);
		
		Date date1 = new Date(d2);
		System.out.println(date1);
		
		model.addAttribute("funding", vo);
		
		return "mypage/funding_view";
	}
	
	

	
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
		
		//세션에 있는 사용자의 정보를 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member",member);
		
		return "mypage/my_info";
	}
	
	@RequestMapping(value = "/my_info_modify.do")
	public String my_info_modify(Model model, HttpServletRequest request) {
		
		//세션에 있는 사용자의 정보를 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member",member);
		
		return "mypage/my_info_modify";
	}
	
	@RequestMapping(value="/upload.do")
	public String upload(HttpServletRequest request
			, @RequestParam("fff") MultipartFile file
			, FileUploadVO vo) throws IllegalStateException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		System.out.println("file idx : " + login.getMember_idx());
		System.out.println("file photo : " + login.getMember_photo());
		
		
		//절대경로가 아닌
		//톰캣이 카피를 떠서 사용하는 경로 -> 실시간 반영
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println("경로 : "+path);
		
		
		File dir = new File(path);
		if(!dir.exists()) { //해당 디렉토리가 존재하지 않는 경우
			dir.mkdirs(); //경로의 폴더가 없는 경우 상위 폴더에서부터 전부 생성
		}
		
		if(!file.getOriginalFilename().isEmpty()) { //업로드할 파일 명이 존재하는 경우
			file.transferTo(new File(path, file.getOriginalFilename()));
		}
		
		System.out.println("originalFilename : "+file.getOriginalFilename());
		vo.setPath(file.getOriginalFilename());
		
		
		//update_photo메소드로 originalFilename명을 넣어줌
		mypageService.update_photo(vo);
		
		return "redirect:my_info_modify.do";
	}
	
	@RequestMapping(value = "/profileUpdate.do")
	public String profileUpdate(MemberVO vo, HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		
		vo.setMember_idx(login.getMember_idx());
		
		//DB에 수정처리
		int result = mypageService.update_profile(vo);
		
		if(result > 0) {
			return "redirect:my_info.do";
		}else {
			System.out.println("수정 실패");
			return "redirect:/";
		}
		
	}
	
	
}
