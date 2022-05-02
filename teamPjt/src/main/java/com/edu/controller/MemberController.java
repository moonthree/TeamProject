package com.edu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.service.memberService;
import com.edu.vo.MemberVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	private memberService memberService;

	@RequestMapping(value = "/login.do")
	public String login() {
		return "member/login";
	}

	@RequestMapping(value = "/join_select.do")
	public String join_select() {
		return "member/join_select";
	}

	
	  @RequestMapping(value = "/join_company.do", method = RequestMethod.GET)
	  public String join_company() { 
			 System.out.println("get방식"); 
		  return "member/join_company"; 
	  }
	 

	@RequestMapping(value = "/join_company.do", method = RequestMethod.POST)
	public void join_company(MemberVO vo, HttpServletRequest request, HttpServletResponse response) throws IOException {

		System.out.println("post방식");
		String[] phones = request.getParameterValues("phone1");
		String phone = "";
		for (String s : phones) {

			phone += s;
			phone += "-";
		}
		phone = phone.substring(0, phone.length() - 1);
		vo.setMember_phone(phone);
		System.out.println("post방식 " + vo.toString());
		
		

		int result = memberService.memberJoin(vo);
		response.setContentType("text/html; charset=euc-kr;");
		PrintWriter pw = response.getWriter();
		if (result > 0) { // 회원가입 성공 -> home으로 이동
			pw.println("<script>alert('회원가입 성공');location.href='" + request.getContextPath() + "'" + "</script>");
		} else {
			pw.println("<script>alert('회원가입 실패');location.href='" + request.getContextPath() + "'" + "</script>");
		}
		pw.flush();

	}

	@RequestMapping(value = "/join_kakao.do")
	public String join_kakao(MemberVO vo, Model model, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		
		int result = memberService.checkEmail(vo.getMember_email());
		
		if(result>=1) {
			
			return "member/login";
		}
		else {
			System.out.println("섬네일 이미지 : " + vo.getMember_photo());
			model.addAttribute("kakaoVo", vo);
			return "member/join_company";
			
		}
		
	}
	
	
	@RequestMapping(value="/check.do",method = RequestMethod.POST)
	@ResponseBody
	public int check(String email) {
		
		return memberService.checkEmail(email);
	}
	

	@RequestMapping(value = "/emailpw_find.do")
	public String find() {
		return "member/emailpw_find";
	}

}
