package com.edu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.EventVO;
import com.edu.vo.StoreVO;

@Repository
public class eventDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<EventVO> eventMain(EventVO vo) throws Exception{
		return sqlSession.selectList("EventMapper.eventMain", vo);
	}
	public List<StoreVO> eventView(StoreVO vo) throws Exception{
		return sqlSession.selectList("EventMapper.eventView", vo);
	}
	
	public EventVO read(int member_idx) throws Exception{
		return sqlSession.selectOne("EventMapper.read", member_idx);
	}
}
