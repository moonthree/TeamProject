package com.edu.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.edu.service.MessageService;
import com.edu.service.MypageService;
import com.edu.vo.MemberVO;
import com.edu.vo.MessageNoticeVO;

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
		
		//공지
		List<MessageNoticeVO> notices = new ArrayList<MessageNoticeVO>();
		List<MessageNoticeVO> notice_timeline = messageService.notice_timeline(login.getMember_idx());
		for(int i=0 ; i<notice_timeline.size() ; i++) {
			//이걸 파라미터로 funding과 store을 구분해서 넣어줘야함
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("to_member_idx", login.getMember_idx());
			param.put("message_notice_idx",notice_timeline.get(i).getMessage_notice_idx());
			System.out.println("getF_or_s : "+notice_timeline.get(i).getF_or_s());
			if(notice_timeline.get(i).getF_or_s()=="f") {
				param.put("f_or_s",0);
			}else{
				param.put("f_or_s",1);
			}
			
			notices.add(messageService.message_notice(param));
		}
		
		model.addAttribute("notice",notices);
		
		//쪽지 - 최신의 메세지를 가져오기 group by from_member_idx
		model.addAttribute("dialogue",messageService.message_dialogue(login.getMember_idx()));
		
		return "message";
	}
	
	//쪽지 상세
	@RequestMapping(value = "/mypage/note.do")
	public String note(Model model, HttpServletRequest request, 
						@RequestParam("funding_idx") int funding_idx, 
						@RequestParam("message_idx") int message_idx,
						@RequestParam("store_idx") int store_idx) {
		// 세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
		MemberVO member = mypageService.selectOne(login);
		model.addAttribute("member", member);
		
		if(funding_idx != 0) { //펀딩인경우
			//판매자인지 소비자인지 추리는 작업
			model.addAttribute("isSeller",messageService.getMemberIdx(funding_idx));
			
			if(message_idx != 0) { //메세지에서 들어온 경우
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
			}else { //판매자 문의 info_detail에서 들어온경우
				//만약 찾은 message_idx가 0아닌경우 대화 내역을 체크해서 있으면 원래의 대화내역으로 데려다주고
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("funding_idx",funding_idx);
				param.put("store_idx",0);
				param.put("from_member_idx",login.getMember_idx());
				
				//찾아올 message가 존재하는지 count부터한다
				int countMessageIdx = messageService.countMessageIdx(param);
				if(countMessageIdx > 0) { //기존 내역이 있는경우 -> message_idx가지고 경로이동
					int findMessageIdx = messageService.findMessageIdx(param);
					System.out.println("funding_idx : "+funding_idx+" findMessageIdx : "+findMessageIdx);
					
					model.addAttribute("funding_idx",funding_idx);
					model.addAttribute("message_idx",findMessageIdx);
					model.addAttribute("store_idx",0);
					
				}else { //0이면 message_idx 새로 만들어야함 그리고 리턴해 경로이동
					messageService.insertMessageIdx(param);
					int newMessageIdx = messageService.getLastMessageIdx();
					model.addAttribute("funding_idx",funding_idx);
					model.addAttribute("message_idx",newMessageIdx);
					model.addAttribute("store_idx",0);

				}
				return "redirect:/mypage/note.do";
			}
		}else { //스토어인경우
			//판매자인지 소비자인지 추리는 작업
			model.addAttribute("isSeller",messageService.getMemberIdxStore(store_idx));
			
			if(message_idx != 0) { //메세지에서 들어온 경우
				//message_idx로 대화 내역 불러오기
				model.addAttribute("messages", messageService.message_dialogue_detail2(message_idx));
				//상대방의 사진, 이름 가져오는 작업은 따로 해야함
				if(messageService.getMemberIdxStore(store_idx)==login.getMember_idx()) {
					Map<String, Object> param = new HashMap<String, Object>();
					param.put("funding_idx",0);
					param.put("store_idx",store_idx);
					param.put("message_idx",message_idx);
					param.put("to_member_idx",login.getMember_idx());
					MemberVO member2 = messageService.getPhotoName(messageService.getFromMemberIdx(param));
					model.addAttribute("photo", member2.getMember_photo());
					model.addAttribute("name", member2.getMember_name());
				}else {
					MemberVO member2 = messageService.getPhotoName(messageService.getMemberIdxStore(store_idx));
					model.addAttribute("photo", member2.getMember_photo());
					model.addAttribute("name", member2.getMember_name());
				}
				
				return "note";
			}else { //판매자 문의 info_detail에서 들어온경우
				//만약 찾은 message_idx가 0아닌경우 대화 내역을 체크해서 있으면 원래의 대화내역으로 데려다주고
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("funding_idx",0);
				param.put("store_idx",store_idx);
				param.put("from_member_idx",login.getMember_idx());
				
				//찾아올 message가 존재하는지 count부터한다
				int countMessageIdx = messageService.countMessageIdx(param);
				if(countMessageIdx > 0) { //기존 내역이 있는경우 -> message_idx가지고 경로이동
					int findMessageIdx = messageService.findMessageIdx(param);
					System.out.println("funding_idx : "+funding_idx+" findMessageIdx : "+findMessageIdx);
					
					model.addAttribute("funding_idx",0);
					model.addAttribute("message_idx",findMessageIdx);
					model.addAttribute("store_idx",store_idx);
					
				}else { //0이면 message_idx 새로 만들어야함 그리고 리턴해 경로이동
					messageService.insertMessageIdx(param);
					int newMessageIdx = messageService.getLastMessageIdx();
					model.addAttribute("funding_idx",0);
					model.addAttribute("message_idx",newMessageIdx);
					model.addAttribute("store_idx",store_idx);
					
				}
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
			@RequestParam("store_idx") int store_idx,
			@RequestParam("countMessages") int countMessages,
			@RequestParam("message_idx") int message_idx,
			@RequestParam("to_member_idx") int to_member_idx,
			@RequestParam(value="fff",required = false) MultipartFile file) throws IllegalStateException, IOException {
		// 세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("login");
				
		Map<String, Object> param = new HashMap<String, Object>();
		
		// 절대경로가 아닌
		// 톰캣이 카피를 떠서 사용하는 경로 -> 실시간 반영
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/message/"+message_idx);
		System.out.println("경로 : " + path);
		File dir = new File(path);
		if (!dir.exists()) { // 해당 디렉토리가 존재하지 않는 경우
			dir.mkdirs(); // 경로의 폴더가 없는 경우 상위 폴더에서부터 전부 생성
		}
		if (!file.getOriginalFilename().isEmpty()) { // 업로드할 파일 명이 존재하는 경우
			file.transferTo(new File(path, file.getOriginalFilename()));
		}
		if(file.getOriginalFilename()=="") {//메세지를 보낸경우
			param.put("c_or_p",0); //메세지
		}else { //사진을 보낸경우
			param.put("c_or_p",1); //사진
			param.put("message_photo",file.getOriginalFilename());
		}
		
		String content = new String(message_content);
		content = message_content.replace("\r\n","<br>");
		
		param.put("message_content", content);
		param.put("funding_idx", funding_idx);
		param.put("store_idx", store_idx);
		param.put("message_idx", message_idx);
		//보내는 사람 idx 설정
		param.put("from_member_idx", login.getMember_idx());
		//받는 사람 idx 설정 - funding_idx로부터 member_idx 가져왔는데 
		//그게 login에서 가져온 member_idx랑 같은경우
		if(funding_idx != 0) { //펀딩인 경우
			if(messageService.getMemberIdx(funding_idx)==login.getMember_idx()) {
				param.put("to_member_idx", to_member_idx);
			}else {
				param.put("to_member_idx", messageService.getMemberIdx(funding_idx));
			}
			model.addAttribute("funding_idx",funding_idx);
			model.addAttribute("store_idx",0);
			model.addAttribute("message_idx",message_idx);
		}else { //스토어인 경우
			if(messageService.getMemberIdxStore(store_idx)==login.getMember_idx()) {
				param.put("to_member_idx", to_member_idx);
			}else {
				param.put("to_member_idx", messageService.getMemberIdxStore(store_idx));
			}
			model.addAttribute("funding_idx",0);
			model.addAttribute("store_idx",store_idx);
			model.addAttribute("message_idx",message_idx);
		}
		
		messageService.sendMessage(param);
		
		
//		//메세지 내용 설정
//		param.put("message_content", message_content);
//		param.put("funding_idx", funding_idx);
//		param.put("store_idx", store_idx);
//		param.put("message_idx", message_idx);
//		//보내는 사람 idx 설정
//		param.put("from_member_idx", login.getMember_idx());
//		//받는 사람 idx 설정 - funding_idx로부터 member_idx 가져왔는데 
//		//그게 login에서 가져온 member_idx랑 같은경우
//		if(funding_idx != 0) { //펀딩인 경우
//			if(messageService.getMemberIdx(funding_idx)==login.getMember_idx()) {
//				param.put("to_member_idx", to_member_idx);
//			}else {
//				param.put("to_member_idx", messageService.getMemberIdx(funding_idx));
//			}
//			model.addAttribute("funding_idx",funding_idx);
//			model.addAttribute("store_idx",0);
//			model.addAttribute("message_idx",message_idx);
//		}else { //스토어인 경우
//			if(messageService.getMemberIdxStore(store_idx)==login.getMember_idx()) {
//				param.put("to_member_idx", to_member_idx);
//			}else {
//				param.put("to_member_idx", messageService.getMemberIdxStore(store_idx));
//			}
//			model.addAttribute("funding_idx",0);
//			model.addAttribute("store_idx",store_idx);
//			model.addAttribute("message_idx",message_idx);
//		}
//		
//		messageService.sendMessage(param);
		
		return "redirect:/mypage/note.do";
	}
	
	//메시지 - 받은 사진을 크게
	@RequestMapping(value = "mypage/photoCloseUp.do")
	public String photoCloseUp(Model model, 
			@RequestParam("message_idx") int message_idx,
			@RequestParam("message_content") String message_content) {
			
		model.addAttribute("message_idx", message_idx);
		model.addAttribute("message_content", message_content);
		return "photoCloseUp";
	}
	
}
