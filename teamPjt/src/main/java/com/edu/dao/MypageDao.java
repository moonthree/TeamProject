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
import com.edu.vo.Funding_expressVO;
import com.edu.vo.Funding_optionVO;
import com.edu.vo.Funding_order_optionVO;
import com.edu.vo.Funding_order_payVO;
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
	
	public List<FundingInfoDetailVO> select3Funding(int member_idx){
		return sqlSession.selectList("MypageMapper.select3Funding", member_idx);
	}
	
	public List<FundingInfoDetailVO> select4Funding(int member_idx){
		return sqlSession.selectList("MypageMapper.select4Funding", member_idx);
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
	
	public List<FundingInfoDetailVO> myFundingList2(int member_idx){
		return sqlSession.selectList("MypageMapper.myFundingList2", member_idx);
	}
	
	public List<FundingMainVO> myZzimList(int member_idx){
		return sqlSession.selectList("MypageMapper.myZzimList", member_idx);
	}
	
	//판매자 펀딩 내역
	public List<FundingMainVO> sellerFundingList(int member_idx){
		return sqlSession.selectList("MypageMapper.sellerFundingList", member_idx);
	}
	
	/*funding_info_detail*/
	//funding & funding_order
	public FundingInfoDetailVO fundingDetail(int funding_order_idx){
		return sqlSession.selectOne("MypageMapper.fundingInfoDetail", funding_order_idx);
	}
	//funding_order_pay
	public Funding_order_payVO fundingPayDetail(int funding_order_idx) {
		return sqlSession.selectOne("MypageMapper.fundingPayDetail", funding_order_idx);
	}
	//funding_express
	public Funding_expressVO fundingExpressDetail(Map<String, Object> paramMap) {
		return sqlSession.selectOne("MypageMapper.fundingExpressDetail", paramMap);
	}
	//funding_option
	public List<FundingInfoDetailVO> fundingOptionDetail(int funding_order_idx) {
		return sqlSession.selectList("MypageMapper.fundingOptionDetail", funding_order_idx);
	}
	
	
	//찜 취소
	public int deleteZzim(Map<String, Integer> paramMap) {
		return sqlSession.update("MypageMapper.deleteZzim", paramMap);
	}
	
	//비밀번호 변경-마이페이지
	public int changePassword(Map<String, Object> paramMap) {
		return sqlSession.update("MypageMapper.changePassword", paramMap);
	}
	
	//주소지 변경 - funding_info_detail
	public int changeExpress(Map<String, Object> paramMap) {
		return sqlSession.update("MypageMapper.changeExpress", paramMap);
	}
	
	//찜 취소
	public int fundingWithdraw(int funding_order_idx) {
		sqlSession.delete("MypageMapper.fundingWithdraw1", funding_order_idx); //funding_order_option
		sqlSession.delete("MypageMapper.fundingWithdraw2", funding_order_idx); //funding_express
		sqlSession.delete("MypageMapper.fundingWithdraw3", funding_order_idx); //funding_order_pay
		return sqlSession.delete("MypageMapper.fundingWithdraw4", funding_order_idx); //funding_order
	}

	
}
