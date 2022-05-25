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
	public String note(Model model, HttpServletRequest request, 
						@RequestParam("funding_idx") int funding_idx, 
						@RequestParam("message_idx") int message_idx) {
		// 세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member", member);
		
		
		if(message_idx != 0) {
			//message_idx로 대화 내역 불러오기
			model.addAttribute("messages", messageService.message_dialogue_detail2(message_idx));
			//상대방의 사진, 이름 가져오는 작업은 따로 해야함
			if(messageService.getMemberIdx(funding_idx)==login.getMember_idx()) {
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("funding_idx",funding_idx);
				param.put("message_idx",message_idx);
				param.put("to_member_idx",login.getMember_idx());
				MemberVO member2 = messageService.getPhotoName(messageService.getFromMemberIdx(param));
				model.addAttribute("photo", member2.getMember_photo());
				model.addAttribute("name", member2.getMember_name());
			}else {
				MemberVO member2 = messageService.getPhotoName(messageService.getMemberIdx(funding_idx));
				model.addAttribute("photo", member2.getMember_photo());
				model.addAttribute("name", member2.getMember_name());
			}
			
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
				messageService.insertMessageIdx(funding_idx);
				int newMessageIdx = messageService.getLastMessageIdx();
				model.addAttribute("funding_idx",funding_idx);
				model.addAttribute("message_idx",newMessageIdx);
				
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
	public String sendMessage(Model model, HttpServletRequest request, 
			@RequestParam("message_content") String message_content, 
			@RequestParam("funding_idx") int funding_idx,
			@RequestParam("countMessages") int countMessages,
			@RequestParam("message_idx") int message_idx,
			@RequestParam("to_member_idx") int to_member_idx) {
		// 세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
				
		Map<String, Object> param = new HashMap<String, Object>();
		
		//메세지 내용 설정
		param.put("message_content",message_content);
		param.put("funding_idx",funding_idx);
		param.put("message_idx",message_idx);
		//보내는 사람 idx 설정
		param.put("from_member_idx", login.getMember_idx());
		//받는 사람 idx 설정 - funding_idx로부터 member_idx 가져왔는데 
		//그게 login에서 가져온 member_idx랑 같은경우
		if(messageService.getMemberIdx(funding_idx)==login.getMember_idx()) {
			param.put("to_member_idx", to_member_idx);
			System.out.println("from : "+login.getMember_idx());
			System.out.println("to : "+to_member_idx);
		}else {
			param.put("to_member_idx", messageService.getMemberIdx(funding_idx));
			System.out.println("from : "+login.getMember_idx());
			System.out.println("to : "+messageService.getMemberIdx(funding_idx));
		}
		messageService.sendMessage(param);
		
		model.addAttribute("funding_idx",funding_idx);
		model.addAttribute("message_idx",message_idx);
		return "redirect:/mypage/note.do";
	}

	
}
