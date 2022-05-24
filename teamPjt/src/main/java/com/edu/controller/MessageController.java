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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.service.MessageService;
import com.edu.service.MypageService;
import com.edu.vo.FundingMainVO;
import com.edu.vo.MemberVO;
import com.edu.vo.MessageVO;

@Controller
@RequestMapping(value = "/")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	@Autowired
	private MypageService mypageService;

	
	//알림&쪽지
	@RequestMapping(value = "/message.do")
	public String message(Model model, HttpServletRequest request) {
		// 세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member", member);
		
		///페이지 불러왔을 때 message 테이블 체크함
		List<FundingMainVO> fundingMainVO = messageService.checkFundingPermit(login.getMember_idx());
		model.addAttribute("permitFunding",fundingMainVO);
		
		//판매자에따른 최신 쪽지 한개 - 불러오게 되는건 MessageVO 더미
		//여기서 member의 level에 따라 바뀌는 메세지 불러오기
		System.out.println("member_level : "+login.getMember_level());
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("to_member_idx",login.getMember_idx());
		
		//to_member_idx로 from_member_idx를 찾아와야함
		//배열에 넣고 for 문돌림
		List<MessageVO> from_member_idxs = messageService.getFrom_member_idxs(login.getMember_idx());
		for(int i=0 ; i<from_member_idxs.size() ; i++) {
			System.out.println("from_member_idx : "+from_member_idxs.get(i).getFrom_member_idx());
			if(from_member_idxs.get(i).getFrom_member_idx() == login.getMember_idx()) {
				model.addAttribute("isEqualLevel","y");
			
				
			}else {
				model.addAttribute("isEqualLevel","n");
				
			}
		}
		
		param.put("member_level",login.getMember_level());
		model.addAttribute("dialogue", messageService.message_dialogue(param));
		
		
		
		return "message";
	}
	
	//쪽지 상세
	@RequestMapping(value = "/mypage/note.do")
	public String note(Model model, HttpServletRequest request, @RequestParam("seller") int from_member_idx, @RequestParam("consumer") int to_member_idx, @RequestParam("funding_idx") int funding_idx) {
		// 세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member", member);
		
		Map<String, Object> param = new HashMap<String, Object>();
		//판매자 idx 설정
		param.put("from_member_idx", from_member_idx);
		//소비자 idx 설정
		param.put("to_member_idx", to_member_idx);
		//member_level 설정 --> 프로필 사진과 이름을 다르게 넣어주기 위함
		if(from_member_idx != login.getMember_idx()) {
			param.put("member_level",0);
		}else {
			param.put("member_level",1);
		}
		//check 보낸이 받는이의 레벨 둘다 1이면 판마자끼리인거, 다르면 소비자 판매자끼리인거
		// from_member_idx 의 레벨과 to_member_idx의 레벨을 체크
		int from_member_level = messageService.checkLevel(from_member_idx);
		int to_member_level = messageService.checkLevel(to_member_idx);
		if(from_member_level == to_member_level) {
			model.addAttribute("isEqualLevel","y");
		}else {
			model.addAttribute("isEqualLevel","n");
		}
		List<MessageVO> messageVOs = messageService.message_dialogue_detail(param);
		model.addAttribute("messages", messageVOs);
		return "note";
	}
	
	//메시지 보내기
	@RequestMapping(value="/mypage/sendMessage.do", method=RequestMethod.POST)
	public String sendMessage(HttpServletRequest request, @RequestParam("message_content") String message_content,@RequestParam("seller") int from_member_idx, @RequestParam("consumer") int to_member_idx,@RequestParam("funding_idx") int funding_idx) {
		// 세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
				
		Map<String, Object> param = new HashMap<String, Object>();

		//판매자 idx 설정
		param.put("from_member_idx", from_member_idx);
		//소비자 idx 설정
		param.put("to_member_idx", to_member_idx);
		//member_level 설정 --> message_send_person구분 0:판매자 1:소비자
		if(from_member_idx != login.getMember_idx()) {
			param.put("member_level",0);
		}else {
			param.put("member_level",1);
		}
		
		//메세지 내용 설정
		param.put("message_content",message_content);
		param.put("funding_idx",funding_idx);
	
		messageService.sendMessage(param);
		
		return "redirect:/mypage/note.do?seller="+from_member_idx+"&consumer="+to_member_idx+"&funding_idx="+funding_idx;
	}

	
}
