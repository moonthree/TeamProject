package com.edu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.memberDao;
import com.edu.vo.MemberVO;

@Service
public class memberServiceImp implements memberService{
	
	@Autowired
	private memberDao dao;
	
	@Override
	public int memberJoin(MemberVO vo) {
		
		return dao.memberJoin(vo);
	}

	
	
}
