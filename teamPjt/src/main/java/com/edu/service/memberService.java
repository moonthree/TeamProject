package com.edu.service;


import com.edu.vo.LoginVO;
import com.edu.vo.MemberVO;

public interface memberService {
	
	//회원가입 메소드
	int memberJoin(MemberVO vo);
	

	//Email 중복 체크 메소드  -> 존재 : 1이상 return, 중복 없으면 return 0;
	int checkEmail(String email);
	
	MemberVO selectOne(MemberVO vo);
	
	MemberVO login(LoginVO vo);
	

}
