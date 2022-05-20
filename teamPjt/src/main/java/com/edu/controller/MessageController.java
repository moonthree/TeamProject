package com.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.service.MessageService;
import com.edu.vo.FundingMainVO;
import com.edu.vo.MemberVO;
import com.edu.vo.MessageVO;

@Controller
@RequestMapping(value = "/")
public class MessageController {
	
	@Autowired
	private MessageService messageService;

	
	//알림
	@RequestMapping(value = "/message.do")
	public String message(Model model, HttpServletRequest request) {
		// 세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		
		///페이지 불러왔을 때 message 테이블 체크함
		List<FundingMainVO> fundingMainVO = messageService.checkFundingPermit(login.getMember_idx());
		model.addAttribute("permitFunding",fundingMainVO);
		
		//판매자에따른 최신 쪽지 한개 - 불러오게 되는건 MessageVO 더미
		model.addAttribute("dialogue", messageService.message_dialogue(login.getMember_idx()));
		
		return "message";
	}
	
	//쪽지
	@RequestMapping(value = "/mypage/note.do")
	public String note(Model model, HttpServletRequest request, @RequestParam("seller") int from_member_idx) {
		// 세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		
		System.out.println("쪽지에 들어온 사람의 이름 : "+login.getMember_name());
		System.out.println("보내고자 하는 사람의 idx : "+from_member_idx);
		
		Map<String, Object> param = new HashMap<String, Object>();
		//판매자 idx 설정
		param.put("from_member_idx", from_member_idx);
		//소비자 idx 설정
		param.put("to_member_idx", login.getMember_idx());
		List<MessageVO> messageVOs = messageService.message_dialogue_detail(param);
		model.addAttribute("messages", messageVOs);
		model.addAttribute("name",messageVOs.get(0).getMember_name());
		return "note";
	}

	
}
