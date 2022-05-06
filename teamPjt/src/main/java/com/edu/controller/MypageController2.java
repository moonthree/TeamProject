package com.edu.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.service.MypageService;
import com.edu.vo.EmailDTO;
import com.edu.vo.MemberVO;


@Controller
@RequestMapping(value = "/member")
public class MypageController2 {
	@Autowired
	private MypageService mypageService ;
	
	//아이디*비밀번호 찾기 ajax

	@RequestMapping(value = "/findId.do" , method = RequestMethod.POST)
	@ResponseBody
	public String findId(@ModelAttribute MemberVO vo, Model model , HttpServletResponse response)throws Exception {
		System.out.println(vo.toString());
		String email = mypageService.findId(vo);
		System.out.println("찾아온 이메일 : "+email);

		return email;
	}
	
	//비밀번호 찾기
	@RequestMapping(value="/findPw.do", method = RequestMethod.POST)
	@ResponseBody
	public String sample(@RequestParam("member_name") String member_name, @RequestParam("member_email") String member_email, @RequestParam("member_phone") String member_phone) {
		//1. 비밀번호 찾기에서 아이디, 이름, 폰번호 가져오기
		String returnval = member_name + member_email + member_phone;
		//2. emaildto 안쓰고 serviceImpl로 받는 사람등의 정보를 넘겨주기
		//3. send.do controller 가져오기(병합)
		return returnval;
	}
	
	//비밀번호 찾기 (이메일 전송 테스트)
	@Inject
    MypageService emailService; // 서비스를 호출하기위한 의존성 주입
 
    @RequestMapping("write.do") // 이메일 쓰기를 누르면 이 메소드로 맵핑되어서
    public String write() {
        return "/member/write"; // 다시 write jsp 페이지로 이동하고 jsp페이지에서 내용을 다 채운 뒤에 확인 버튼을 누르면 send.do로 넘어감
    }
 
    @RequestMapping("send.do") // 확인 (메일발송) 버튼을 누르면 맵핑되는 메소드
    public String send(@ModelAttribute EmailDTO dto, Model model) {
        try {
 
            emailService.sendMail(dto); // dto (메일관련 정보)를 sendMail에 저장함
            model.addAttribute("message", "이메일이 발송되었습니다."); // 이메일이 발송되었다는 메시지를 출력시킨다.
 
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "이메일 발송 실패..."); // 이메일 발송이 실패되었다는 메시지를 출력
        }
        return "/member/write"; // 실패했으므로 다시 write jsp 페이지로 이동함
    }
	
}
