package com.edu.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.MemberVO;



@Repository
public class memberDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int memberJoin(MemberVO vo) {
		return sqlSession.insert("memberMapper.memberJoin",vo);
	}
	
}
