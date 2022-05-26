package com.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.service.noticeService;
import com.edu.vo.CriteriaVO;
import com.edu.vo.NoticeVO;
import com.edu.vo.PageMakerVO;

@RequestMapping(value = "/notice")
@Controller
public class NoticeController {
	
	@Autowired
	private noticeService noticeservice;
	
	@RequestMapping(value = "/notice_list.do", method=RequestMethod.GET)
	public String notice_list(Model model, CriteriaVO cri) throws Exception {
		
		//List<NoticeVO> list = noticeservice.selectAll()

		 
		 
		//model.addAttribute("list",list);
		
		model.addAttribute("list",noticeservice.list(cri));
		
		PageMakerVO pageMaker = new PageMakerVO();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(noticeservice.listCount());
		model.addAttribute("pageMaker",pageMaker);
		return "notice/notice_list";
	}
	
	@RequestMapping(value = "/notice_view.do")
	public String view(int board_idx,Model model) {
		
		NoticeVO vo = noticeservice.view(board_idx);
		
		model.addAttribute("vo",vo);
		
		return "notice/notice_view";
	}
	
	@RequestMapping(value = "/notice_write.do")
	public String notice_wirter() {
		return "notice/notice_write";
	}
	
	@RequestMapping(value="/notice_write.do", method=RequestMethod.POST)
	public String write(NoticeVO vo) {
		System.out.println(vo.toString());
		int result = noticeservice.write(vo);
		return "redirect:notice_list.do";
	}
	
	@RequestMapping(value="/notice_modify.do",method=RequestMethod.GET)
	public String modify(int board_idx,Model model) {
		NoticeVO vo = noticeservice.modify(board_idx);
		model.addAttribute("vo",vo);
		return "notice/notice_modify";
	}
	
	@RequestMapping(value="/notice_modify.do",method=RequestMethod.POST)
	public String modify(NoticeVO vo) {
		int result = noticeservice.update(vo);
		return "redirect:notice_view.do?board_idx="+vo.getBoard_idx();
	}
	
	@RequestMapping(value="notice_delete.do")
	public String delete(int board_idx) {
		int vo = noticeservice.delete(board_idx);
		return "redirect:notice_list.do";
	}
	
	
	
}
