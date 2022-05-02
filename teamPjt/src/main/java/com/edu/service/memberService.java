package com.edu.service;

import com.edu.vo.MemberVO;

public interface memberService {

	int memberJoin(MemberVO vo);
	
	MemberVO selectOne(MemberVO vo);
}
