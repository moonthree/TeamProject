package com.edu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.service.replyService;
import com.edu.service.serviceService;
import com.edu.vo.CriteriaVO;
import com.edu.vo.MemberVO;
import com.edu.vo.PageMakerVO;
import com.edu.vo.ReplyVO;
import com.edu.vo.ServiceVO;

@RequestMapping(value = "/service")
@Controller
public class ServiceController {
	
	@Autowired
	private serviceService serviceservice;
	@Autowired
	private replyService replyservice;
	
	@RequestMapping(value="/service_list.do", method=RequestMethod.GET)
	public String service_list(Model model, CriteriaVO cri,  HttpServletRequest request) throws Exception {
		
		/* System.out.println(serviceservice.list(cri).get(0)); */
		model.addAttribute("list",serviceservice.list(cri));
		MemberVO login =  (MemberVO) request.getSession().getAttribute("login");
		
		PageMakerVO pageMaker = new PageMakerVO();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(serviceservice.listCount());
		model.addAttribute("pageMaker", pageMaker);
		return "service/service_list";
	}
	
	@RequestMapping(value = "/service_view.do")
	public String view(int sboard_idx, Model model, ReplyVO reVO) throws Exception {
		
		ServiceVO vo = serviceservice.view(sboard_idx);
		//System.out.println(vo.toString());
		model.addAttribute("vo",vo);
		
		
		System.out.println(vo.getSboard_idx());
		reVO.setReply_idx(sboard_idx);
		vo.setMember_name(vo.getMember_name());
		
		List<ReplyVO> list = replyservice.selectAll(reVO);
		
		
		//System.out.println(list.toString());
	
		
		model.addAttribute("list", list);
		model.addAttribute("sboard_idx", sboard_idx);
		
	
		return "service/service_view";
	}
	
	@RequestMapping(value = "/service_write.do")
	public String service_wirter() {
		return "service/service_write";
	}
	
	@RequestMapping(value="/service_write.do",  method=RequestMethod.POST)
	public String write(ServiceVO vo , HttpServletRequest request) {
		MemberVO login =  (MemberVO) request.getSession().getAttribute("login");
		 System.out.println(vo.toString());
		
		vo.setMember_idx(login.getMember_idx());
		vo.setMember_name(login.getMember_name());
		
		int result = serviceservice.write(vo);
		return "redirect:service_list.do";
	}
	
	@RequestMapping(value="/service_modify.do",method=RequestMethod.GET)
	public String modify(int sboard_idx ,Model model) {
		ServiceVO vo = serviceservice.modify(sboard_idx);
		model.addAttribute("vo",vo);
		return "service/service_modify";
	}
	
	@RequestMapping(value="/service_modify.do",method=RequestMethod.POST)
	public String modify(ServiceVO vo) {
		System.out.println(vo.getSboard_idx());
		int result = serviceservice.update(vo);
		return "redirect:service_view.do?sboard_idx="+vo.getSboard_idx();
	}
	
	@RequestMapping(value="service_delete.do", method=RequestMethod.POST)
	public String delete(ServiceVO vo) {
		serviceservice.delete(vo);
		return "redirect:service_list.do";
	}
	
	@RequestMapping(value="reply_delete.do", method=RequestMethod.POST)
	public String delete(ReplyVO vo) {
		replyservice.delete(vo);
		return "redirect:service_view.do?sboard_idx=" +vo.getSboard_idx();
	}
	
}