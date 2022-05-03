package com.edu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.MypageDao;
import com.edu.dao.memberDao;
import com.edu.vo.FileUploadVO;
import com.edu.vo.MemberVO;

@Service
public class MypageServiceImp implements MypageService{
	
	@Autowired
	private memberDao dao;
	
	@Autowired
	private MypageDao mdao;
	
	@Override
	public MemberVO selectOne(MemberVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public void update_photo(FileUploadVO vo) {
		mdao.update_photo(vo);
	}

	@Override
	public int update_profile(MemberVO vo) {
		return mdao.update_profile(vo);
	}

	
	
}
