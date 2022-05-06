package com.edu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.FundingMainVO;
import com.edu.vo.SearchCriteria;

@Repository
public class searchDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 검색 펀딩 리스트
	public List<FundingMainVO> listSearch(SearchCriteria scri) throws Exception{
		return sqlSession.selectList("SearchMapper.SearchFunding", scri);
	}
	// 검색 펀딩 총 갯수
	public int searchFundingCount(SearchCriteria scri) throws Exception{
		return sqlSession.selectOne("SearchMapper.searchFundingCount", scri);
	}
	
	

}
