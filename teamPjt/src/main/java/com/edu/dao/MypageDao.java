package com.edu.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.FileUploadVO;
import com.edu.vo.MemberVO;



@Repository
public class MypageDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void update_photo(FileUploadVO vo) {
		sqlSession.update("MypageMapper.update_photo", vo);
	}
	
	public int update_profile(MemberVO vo) {
		return sqlSession.update("MypageMapper.update_profile",vo);
	}
	
	public String findId(MemberVO vo) {
		return sqlSession.selectOne("MypageMapper.findId", vo);
	}
	
}
