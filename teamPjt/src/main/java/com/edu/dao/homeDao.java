package com.edu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.FundingMainVO;
import com.edu.vo.StoreVO;

@Repository
public class homeDao {
	
	@Autowired
	private SqlSession sqlSession;
//취향 맞춤 펀딩 프로젝트 용도
	public List<FundingMainVO> fundHomeAll(FundingMainVO vo) throws Exception{
		return sqlSession.selectList("HomeMapper.fundHomeAll", vo);
	}
	public List<FundingMainVO> fundHomeDog(FundingMainVO vo) throws Exception{
		return sqlSession.selectList("HomeMapper.fundHomeDog", vo);
	}
	public List<FundingMainVO> fundHomeCat(FundingMainVO vo) throws Exception{
		return sqlSession.selectList("HomeMapper.fundHomeCat", vo);
	}
	public List<FundingMainVO> fundHomeOther(FundingMainVO vo) throws Exception{
		return sqlSession.selectList("HomeMapper.fundHomeOther", vo);
	}

// 새로 오픈한 프로젝트 용도
	public List<FundingMainVO> fundHomeNew(FundingMainVO vo) throws Exception{
		return sqlSession.selectList("HomeMapper.fundHomeNew", vo);
	}

// 실시간 랭킹 용도
	public List<FundingMainVO> fundHomeView(FundingMainVO vo) throws Exception{
		return sqlSession.selectList("HomeMapper.fundHomeView", vo);
	}
	public List<StoreVO> storeHomeView(StoreVO vo) throws Exception{
		return sqlSession.selectList("HomeMapper.storeHomeView", vo);
	}
	
// 스토어 추천 제품 용도
	public List<StoreVO> storeHomeFund(StoreVO vo) throws Exception{
		return sqlSession.selectList("HomeMapper.storeHomeFund", vo);
	}
}
