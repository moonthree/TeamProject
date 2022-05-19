package com.edu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.service.StoreService;
import com.edu.vo.MemberVO;
import com.edu.vo.StoreOptionVO;

@Controller
@RequestMapping(value = "/store")
public class StoreController {
	
	@Autowired
	private StoreService sts;

	// 스토어 메인페이지 
	@RequestMapping(value = "/store_main.do")
	public String main() {
		return "store/store_main";
	}
	
	
	// 스토어 뷰페이지 
	@RequestMapping(value = "/store_view.do", method = RequestMethod.GET)
	public String store_view(Model model, StoreOptionVO optionvo) {
		
		
		
		
		// 옵션 출력
		List<StoreOptionVO> optionlist = sts.storeOptionList(optionvo);
		model.addAttribute("optionlist", optionlist);
		
		return "store/store_view";
	}
	
	// 스토어 결제페이지
	@RequestMapping(value = "/store_pay.do", method = RequestMethod.GET)
	public String pay(Model model, HttpServletRequest request) {
		
		//세션에 있는 사용자의 정보 가져옴
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		MemberVO member = sts.selectOne(login);
		model.addAttribute("member", member);
		
		return "store/store_pay";
	}
}
