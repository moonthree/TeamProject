package com.edu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	//git 넘기기용

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest request) {
		
		MemberVO member = memberService.selectOne(vo);
		
		if(member != null) {
			
			HttpSession session = request.getSession(true);
			
			MemberVO login = new MemberVO();
			login.setMember_idx(member.getMember_idx());
			login.setMember_email(member.getMember_email());
			login.setMember_password(member.getMember_password());
			login.setMember_name(member.getMember_name());
			
			session.setAttribute("login", login);
			
			return "redirect:/.do";
			
		}else {
			
			return "redirect:login.do";
		}
		
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	

	@RequestMapping(value = "/join_select.do")
	public String join_select() {
		return "member/join_select";
	}
	
		/*소비자 계정 회원가입 페이지 이동 시 get방식으로 */
	  @RequestMapping(value = "/join_seller.do", method = RequestMethod.GET)
	  public String join_seller() { 
			 System.out.println("get방식"); 
		  return "member/join_seller"; 
	  }
	 
	  /*post 방식 소비자 계정 회원가입 페이지 연동 즉, 입력폼들을 받아온다.  */
	@RequestMapping(value = "/join_seller.do", method = RequestMethod.POST)
	public void join_seller(MemberVO vo, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String[] phones = request.getParameterValues("phone1");
		String phone = "";
		
		String addr2 = request.getParameter("member_addr2");
		
		for (String s : phones) {

			phone += s;
			phone += "-";
		}
		phone = phone.substring(0, phone.length() - 1);
		
		vo.setMember_phone(phone);
		
		
		// 소비자 계정 회원가입 이므로  DB의 member_level칼럼을 0으로 지정
		vo.setMember_level(0);
		
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
	
	
	/*판매자 계정 로그인*/
	@RequestMapping(value = "/join_company.do", method = RequestMethod.GET)
	public String join_company() {
		
		return "member/join_company";
	}
	
	@RequestMapping(value = "/join_company.do", method = RequestMethod.POST)
	public void join_company(MemberVO vo, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String[] phones = request.getParameterValues("phone1");
		String phone = "";
		
		String addr2 = request.getParameter("member_addr2");
		
		for (String s : phones) {

			phone += s;
			phone += "-";
		}
		phone = phone.substring(0, phone.length() - 1);
		
		vo.setMember_phone(phone);
		
		// 소비자 계정 회원가입 이므로  DB의 member_level칼럼을 1로 지정
		
		vo.setMember_level(1);
		
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
	
	
	
	/*카카오 계정 회원 가입 및 로그인*/
	@RequestMapping(value = "/join_kakao.do")
	public String join_kakao(MemberVO vo, Model model, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		
	
		MemberVO member = memberService.selectOne(vo);
		
		if(member != null) {
			//카카오 회원으로 회원가입 이미 했을 경우 자동 로그인됨
				
				
				HttpSession session = request.getSession(true);
				
				MemberVO login = new MemberVO();
				login.setMember_idx(member.getMember_idx());
				login.setMember_email(member.getMember_email());
				login.setMember_password(member.getMember_password());
				login.setMember_name(member.getMember_name());
				
				
				/*세션 등록 */
				session.setAttribute("login", login);
				
				return "redirect:/.do";
				
		}else {
				//카카오 회원으로 회원가입 한게 없을 경우
				
				model.addAttribute("kakaoVo", vo);
				return "member/join_seller";
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
