package com.edu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.FundingMainVO;
import com.edu.vo.StoreVO;

@Repository
public class searchDAO {
	
	@Autowired
	private SqlSession sqlSession;
	//검색 리스트
	public List<FundingMainVO> searchList(FundingMainVO vo) throws Exception{
		return sqlSession.selectList("SearchMapper.searchList", vo);
	}
	//검색 갯수
	public int searchCount(FundingMainVO vo) throws Exception{
		return sqlSession.selectOne("SearchMapper.searchCount", vo);
	}
	
	public List<StoreVO> searchStoreList(StoreVO vo) throws Exception{
		return sqlSession.selectList("SearchMapper.searchStoreList", vo);
	}
	//검색 갯수
	public int searchStoreCount(StoreVO vo) throws Exception{
		return sqlSession.selectOne("SearchMapper.searchStoreCount", vo);
	}
	
	

}
