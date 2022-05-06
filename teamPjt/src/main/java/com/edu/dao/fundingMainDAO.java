package com.edu.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.FundingCommunityVO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.Funding_optionVO;
import com.edu.vo.Pagination;

@Repository
public class fundingMainDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FundingMainVO> listDog(Pagination page) throws Exception{
		return sqlSession.selectList("FundingMainMapper.listDog", page);
	}
	public List<FundingMainVO> listCat(Pagination page) throws Exception{
		return sqlSession.selectList("FundingMainMapper.listCat", page);
	}
	public List<FundingMainVO> listOther(Pagination page) throws Exception{
		return sqlSession.selectList("FundingMainMapper.listOther", page);
	}
	
	// 펀딩 총 갯수
	public int listDogCount() throws Exception{
		return sqlSession.selectOne("FundingMainMapper.listDogCount");
	}
	public int listCatCount() throws Exception{
		return sqlSession.selectOne("FundingMainMapper.listCatCount");
	}
	public int listOtherCount() throws Exception{
		return sqlSession.selectOne("FundingMainMapper.listOtherCount");
	}
	
	
	// 게시물 조회
	public FundingMainVO read(int funding_idx) throws Exception{
		return sqlSession.selectOne("FundingMainMapper.read", funding_idx);
	}
	
	//펀딩 조회수
	public void fundingViews(int funding_idx) throws Exception{
		sqlSession.update("FundingMainMapper.fundingViews", funding_idx);
	}
	
	//펀딩 커뮤니티 댓글 리스트
	public List<FundingCommunityVO> readFundingCommunityComent(int funding_idx) throws Exception{
		return sqlSession.selectList("FundingMainMapper.readFundingCommunityComment", funding_idx);
	}
	//펀딩 커뮤니티 댓글 작성
	public int writeFundingCommunityComment(FundingCommunityVO vo) throws Exception{
		return sqlSession.insert("FundingMainMapper.writeFundingCommunityComment", vo);
	}
	//펀딩 커뮤니티 댓글 작성 여부
	public String checkCommentWrite(FundingCommunityVO vo) throws Exception{
		return sqlSession.selectOne("FundingMainMapper.checkCommentWrite", vo);
	}
	
	// 펀딩 옵션
	public List<Funding_optionVO> list(Funding_optionVO vo){
		return sqlSession.selectList("FundingMainMapper.list", vo);
	}
}
