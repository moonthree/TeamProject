package com.edu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.ChangePwVO;
import com.edu.vo.FileUploadVO;
import com.edu.vo.FundingInfoDetailParameterVO;
import com.edu.vo.FundingInfoDetailVO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.MemberVO;
import com.edu.vo.ZzimVO;

//git 넘기기용

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
	
	public String findPw(ChangePwVO vo) {
		return sqlSession.selectOne("MypageMapper.findPw", vo);
	}
	
	public int changePw(ChangePwVO vo) {
		return sqlSession.update("MypageMapper.changePw", vo);
	}
	
	public List<FundingMainVO> select3Funding(int member_idx){
		return sqlSession.selectList("MypageMapper.select3Funding", member_idx);
	}
	
	public List<ZzimVO> select3Zzim(int member_idx){
		return sqlSession.selectList("MypageMapper.select3Zzim", member_idx);
	}
	
	public int countFunding(int member_idx) {
		return sqlSession.selectOne("MypageMapper.countFunding", member_idx);
	}
	
	public int countZzim(int member_idx) {
		return sqlSession.selectOne("MypageMapper.countZzim", member_idx);
	}
	
	public List<FundingMainVO> myFundingList(int member_idx){
		return sqlSession.selectList("MypageMapper.myFundingList", member_idx);
	}
	
	public List<FundingMainVO> myZzimList(int member_idx){
		return sqlSession.selectList("MypageMapper.myZzimList", member_idx);
	}
	
	//판매자 펀딩 내역
	public List<FundingMainVO> sellerFundingList(int member_idx){
		return sqlSession.selectList("MypageMapper.sellerFundingList", member_idx);
	}
	
	//funding_info_detail
	public FundingInfoDetailVO fundingDetail(FundingInfoDetailParameterVO vo){
		return sqlSession.selectOne("MypageMapper.fundingInfoDetail", vo);
	}
	
	//찜 취소
	public int deleteZzim(Map<String, Integer> paramMap) {
		return sqlSession.update("MypageMapper.deleteZzim", paramMap);
	}
}
