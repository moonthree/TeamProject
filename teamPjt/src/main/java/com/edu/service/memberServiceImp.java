package com.edu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.memberDao;
import com.edu.vo.LoginVO;
import com.edu.vo.MemberVO;

@Service
public class memberServiceImp implements memberService{
	
	@Autowired
	private memberDao dao;
	
	@Override
	public int memberJoin(MemberVO vo) {
		
		return dao.memberJoin(vo);
	}

	@Override

	public int checkEmail(String email) {
		
		return dao.checkEmail(email);
	}
	
	public MemberVO selectOne(MemberVO vo) {
		return dao.selectOne(vo);

	}

	@Override
	public MemberVO login(LoginVO vo) {
		return dao.login(vo);
	}

	
}
