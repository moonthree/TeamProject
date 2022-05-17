package com.edu.service;

import java.util.List;
import java.util.Map;

import com.edu.vo.ChangePwVO;
import com.edu.vo.EmailDTO;
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
public interface MypageService {

	//프로필 정보 가져오기
	MemberVO selectOne(MemberVO vo);

	//프로필 사진 업데이트
	void update_photo(FileUploadVO vo);
	
	//프로필 정보 업데이트
	int update_profile(MemberVO vo);

	//아이디 찾기
	String findId(MemberVO vo);
	
	//비밀번호 찾기
	String findPw(ChangePwVO vo);
	
	//비밀번호 변경
	int changePw(ChangePwVO vo);	
	
	//이메일 보내기
	public void sendMail(EmailDTO dto);
	
	//3개의 최신 펀딩목록
	List<FundingInfoDetailVO> select3Funding(int member_idx);
	
	//4개의 최신 펀딩목록
	List<FundingMainVO> select4Funding(int member_idx);
	
	//3개의 최신 찜목록
	List<ZzimVO> select3Zzim(int member_idx);
	
	//펀딩개수
	int countFunding(int member_idx);
	
	//찜개수
	int countZzim(int member_idx);
	
	//펀딩내역 
	List<FundingMainVO> myFundingList(int member_idx);
	
	//펀딩내역2 - 위에꺼 안쓰고 고침 info_funding
	List<FundingInfoDetailVO> myFundingList2(int member_idx);
	
	//찜내역
	List<FundingMainVO> myZzimList(int member_idx);
	
	//판매자 펀딩목록 mypage2
	List<FundingMainVO> sellerFundingList(int member_idx);
	
	/*funding_info_detail*/
	//funding & funding_order
	FundingInfoDetailVO fundingDetail(FundingInfoDetailParameterVO vo);
	//funding_order_pay
	Funding_order_payVO fundingPayDetail(int funding_order_idx);
	//funding_express
	Funding_expressVO fundingExpressDetail(Map<String,Object> param);
	//funding_option1
	List<FundingInfoDetailVO> fundingOptionDetail(int funding_order_idx);
	
	//찜 취소
	int deleteZzim(Map<String, Integer> paramMap);
	
	//비밀번호 변경-마이페이지
	int changePw(Map<String,Object> paramMap);
	
	//주소 변경-funding_info_detail
	int changeExpress(Map<String,Object> paramMap);
	
	//펀딩 취소
	int fundingWithdraw(int funding_order_idx);
}
