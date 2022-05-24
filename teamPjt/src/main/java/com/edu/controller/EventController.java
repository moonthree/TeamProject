package com.edu.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.service.EventService;
import com.edu.vo.EventVO;
import com.edu.vo.StoreVO;

@Controller
@RequestMapping(value = "/event")
public class EventController {
	
	@Autowired
	private EventService es;
	
	@RequestMapping(value = "/event_main.do")
	public String eventMain(EventVO vo, HttpServletRequest request, Model model) throws Exception {
		
		ArrayList<EventVO> eventMain = null;
		eventMain = (ArrayList<EventVO>) es.eventMain(vo);
		request.setAttribute("eventMain", eventMain);
		
		return "event/event_main";
	}
	@RequestMapping(value = "/event_view.do", method = RequestMethod.GET)
	public String eventView(EventVO vo, StoreVO svo, HttpServletRequest request, Model model) throws Exception {
		
		model.addAttribute("read", es.read(vo.getMember_idx()));	
		
		ArrayList<StoreVO> eventView = null;
		eventView = (ArrayList<StoreVO>) es.eventView(svo);
		request.setAttribute("eventView", eventView);
		
		return "event/event_view";
	}
}
