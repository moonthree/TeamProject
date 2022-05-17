package com.edu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.service.MessageService;
import com.edu.vo.FundingMainVO;
import com.edu.vo.MemberVO;

@Controller
@RequestMapping(value = "/")
public class MessageController {
	
	@Autowired
	private MessageService messageService;

	
	//message
	@RequestMapping(value = "/message.do")
	public String message(Model model, HttpServletRequest request) {
		// 세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		
		///페이지 불러왔을 때 message 테이블 체크함
		List<FundingMainVO> fundingMainVO = messageService.checkFundingPermit(login.getMember_idx());
		
		model.addAttribute("permitFunding",fundingMainVO);
		
		
		return "message";
	}
	

	
}
