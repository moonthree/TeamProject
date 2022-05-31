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
import com.edu.vo.LoginVO;
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
	public String login(MemberVO vo, LoginVO loginvo, Model model, HttpSession session, HttpServletResponse response) throws IOException {
		
			MemberVO user = memberService.login(loginvo);
			
			if(user != null) {
				model.addAttribute("user", user);
				
				// 이전 destination 불러오기
				Object dest = session.getAttribute("dest");
				return "redirect:" + ( dest != null ? (String)dest : "/.do");
			}else {
				response.setContentType("text/html; charset=UTF-8"); 
				PrintWriter pw = response.getWriter(); 
				pw.println("<script>alert('아이디나 비밀번호가 일치하지 않습니다.');location.href='login.do'</script>");
				pw.flush();

//				return "redirect:/member/login.do";
			}
			return null;
		
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
		
		System.out.println(vo.toString());
		
		
		String[] phones = request.getParameterValues("phone1");
		String phone = "";
		
		String addr2 = request.getParameter("member_addr2");
		
		for (String s : phones) {

			phone += s;
			phone += "-";
		}
		phone = phone.substring(0, phone.length() - 1);
		
		vo.setMember_phone(phone);
		
		// 판매자 계정 회원가입 이므로  DB의 member_level칼럼을 1로 지정
		
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
		
		//이미 중복 이메일이 있을경우
		if(member != null) {
			
			// 1. 그 이메일이 비밀번호가 null인가? 즉 이미 카카오 계정인 경우이므로 -> 바로 로그인 객체 등록해줌		
			if(member.getMember_password() == null) {

				HttpSession session = request.getSession(true);
				
				MemberVO login = new MemberVO();
				login.setMember_idx(member.getMember_idx());
				login.setMember_email(member.getMember_email());
				login.setMember_password(member.getMember_password());
				login.setMember_name(member.getMember_name());
				
				/*여기 추가*/
				login.setMember_addr(member.getMember_addr());
				login.setMember_addr2(member.getMember_addr2());
				login.setMember_level(member.getMember_level());
				login.setMember_pet(member.getMember_pet());
				login.setMember_phone(member.getMember_phone());
				/*세션 등록 */
				session.setAttribute("login", login);
				
				return "redirect:/.do";
			}
			//2. 그 이메일이 비밀번호가 null이 아니다?  즉 이미 카카오 계정과 같은 이메일로 자사 회원가입을 한 게 있으므로
			//회원 가입 페이지로 이동하야한다. -- 해당 카카오 계정으로 쓰인 이메일은 사용할 수 없게 해야한다.
			else {
				
				//model.addAttribute("kakaoVo", vo);
				/*
				 * request.setAttribute("msg",
				 * "죄송하지만 해당 이메일 계정은 이미 다른 유저가 사용중입니다.\n 자사 회원가입 서비스를 이용해주세요.");
				 * request.setAttribute("url","member/join_seller" );
				 */
				return "member/alert";
			}
			
				
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
