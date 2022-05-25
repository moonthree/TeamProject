package com.edu.controller;

import java.util.ArrayList;
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
		
		//최신의 메세지를 가져오기 group by from_member_idx
		model.addAttribute("dialogue",messageService.message_dialogue(login.getMember_idx()));
		
		return "message";
	}
	
	//쪽지 상세
	@RequestMapping(value = "/mypage/note.do")
	public String note(Model model, HttpServletRequest request, @RequestParam("funding_idx") int funding_idx, @RequestParam("message_idx") int message_idx) {
		// 세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member", member);
		
		if(message_idx != 0) {
			//message_idx로 대화 내역 불러오기
			model.addAttribute("messages", messageService.message_dialogue_detail2(message_idx));
			//상대방의 사진, 이름 가져오는 작업은 따로 해야함

			return "note";
		}else {
			//만약 찾은 message_idx가 0아닌경우 대화 내역을 체크해서 있으면 원래의 대화내역으로 데려다주고
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("funding_idx",funding_idx);
			param.put("from_member_idx",login.getMember_idx());
			
			//찾아올 message가 존재하는지 count부터한다
			int countMessageIdx = messageService.countMessageIdx(param);
			if(countMessageIdx > 0) { //기존 내역이 있는경우 -> message_idx가지고 경로이동
				int findMessageIdx = messageService.findMessageIdx(param);
				System.out.println("funding_idx : "+funding_idx+" findMessageIdx : "+findMessageIdx);
				
				model.addAttribute("funding_idx",funding_idx);
				model.addAttribute("message_idx",findMessageIdx);
				
				return "redirect:/mypage/note.do";
			}else { //0이면 message_idx 새로 만들어야함 그리고 리턴해 경로이동
				
				model.addAttribute("funding_idx",funding_idx);
				model.addAttribute("message_idx",3);
				
				return "redirect:/mypage/note.do";
			}
			
			
		}
		
		
		
		
		
//		Map<String, Object> param = new HashMap<String, Object>();
//		param.put("to_member_idx",login.getMember_idx());
//		param.put("funding_idx",funding_idx);
//		model.addAttribute("messages", messageService.message_dialogue_detail(param));
		
	}
	
	//메시지 보내기
	@RequestMapping(value="/mypage/sendMessage.do", method=RequestMethod.POST)
	public String sendMessage(HttpServletRequest request, @RequestParam("message_content") String message_content, @RequestParam("funding_idx") int funding_idx, @RequestParam("countMessages") int countMessages) {
		// 세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
				
		Map<String, Object> param = new HashMap<String, Object>();
		//보내는 사람 idx 설정
		param.put("from_member_idx", login.getMember_idx());
		//받는 사람 idx 설정
		param.put("to_member_idx", messageService.getMemberIdx(funding_idx));
		//메세지 내용 설정
		param.put("message_content",message_content);
		param.put("funding_idx",funding_idx);
			
		//1. countMessages의 갯수를 따져서 message테이블에 insert할지 정함
		if(countMessages == 0) {
			//2. message_idx생성
			//messageService.insertMessageIdx(funding_idx);
			//3. insert와 동시에 message_idx가져오기
		}else {
			//2. funding_idx member_idx를 통해 message_idx 가져오기
		}
		
		messageService.sendMessage(param);
		
		return "redirect:/mypage/note.do?funding_idx="+funding_idx;
	}

	
}
