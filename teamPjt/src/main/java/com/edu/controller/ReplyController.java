package com.edu.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.service.replyService;
import com.edu.vo.MemberVO;
import com.edu.vo.ReplyVO;

@RequestMapping(value = "/reply")

@Controller
public class ReplyController {
	
	@Autowired
	private replyService replyservice;

	
		@RequestMapping(value="/reply_write.do", method=RequestMethod.POST)
		public String write(ReplyVO vo, HttpServletRequest request) {
			MemberVO login = (MemberVO)request.getSession().getAttribute("login");
			//System.out.println(vo.toString());
			System.out.println(vo.getReply_content().length());
			String str = vo.getReply_content();
			String str2 = str.substring(0, str.length()-1);
			System.out.println("바뀐 값 : "+str2);
			
			
			vo.setReply_content(str2);
			vo.setMember_idx(login.getMember_idx());
			int result = replyservice.write(vo);
			return "redirect:/service/service_view.do?sboard_idx="+vo.getSboard_idx();
		}
		
		@RequestMapping(value="/reply_modify.do",method=RequestMethod.GET)
		public String modify(int sboard_idx, int reply_idx, Model model) {
			/*
			 * model.addAttribute("sboard_idx", sboard_idx); model.addAttribute("reply_idx",
			 * reply_idx);
			 */
			
			ReplyVO vo = replyservice.modify(sboard_idx, reply_idx);
			model.addAttribute("vo",vo);
			
			return "/service/reply_modify";
			
		}
		
		@RequestMapping(value="/reply_modify.do",method=RequestMethod.POST)
		public String modify(ReplyVO vo) {
			/*
			 * System.out.println("post 매소드 들어옴"); System.out.println(vo.toString());
			 */
			
			int result = replyservice.update(vo);
			
			/*
			 * System.out.println("post 방식"); System.out.println(sboard_idx +" : : " 
			 * +reply_idx);
			 */
			return"redirect:/service/service_view.do?sboard_idx="+vo.getSboard_idx();
		}
		
		
	}
		
		
		
		
	/*
	 * int result = replyservice.replyInsert(vo);
	 * 
	 * if(result>0) { retVal.put("code", "OK"); retVal.put("sboard_idx",
	 * vo.getSboard_idx()); retVal.put("member_idx", vo.getMember_idx());
	 * retVal.put("reply_idx", vo.getReply_idx()); retVal.put("parent_id",
	 * vo.getParent_id()); retVal.put("reply_secret", vo.getReply_secret());
	 * retVal.put("reply_content", vo.getReply_content());
	 * retVal.put("reply_writer", login.getMember_name()); retVal.put("message",
	 * "등록 성공!"); }else { retVal.put("code", "FAIL"); retVal.put("message",
	 * "등록 실패!"); }
	 */
	
	
	//reply 상태 업데이트
	/*
	 * @RequestMapping(value ="/replyAnswerDone", method= RequestMethod.POST)
	 * 
	 * @ResponseBody public int replyAnswerDone(ReplyVO vo) throws Exception{ return
	 * replyservice.replyAnswerDone(vo); } // reply 삭제
	 * 
	 * @RequestMapping(value ="/replyDelete", method= RequestMethod.POST)
	 * 
	 * @ResponseBody public void deleteReply(ReplyVO vo) throws Exception {
	 * replyservice.deleteReply(vo); } // reply 수정
	 * 
	 * @RequestMapping(value ="/replyModify", method= RequestMethod.POST)
	 * 
	 * @ResponseBody public void modifyReply(ReplyVO vo) throws Exception {
	 * replyservice.modifyReply(vo); }
	 */
	
	

