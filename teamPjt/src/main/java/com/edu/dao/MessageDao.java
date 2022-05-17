package com.edu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.FundingMainVO;



@Repository
public class MessageDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FundingMainVO> checkFundingPermit(int member_idx) {
		return sqlSession.selectList("MessageMapper.checkFundingPermit",member_idx);
	}
	
	//f_idx에 따른 member_idx를 구함
	public int getMemberIdx(int f_idx) {
		return sqlSession.selectOne("MessageMapper.getMemberIdx",f_idx);
	}
	//메세지로그남김
	public void insertLog(Map<String,Object> paramMap) {
		sqlSession.insert("MessageMapper.insertLog", paramMap);
	}


}
