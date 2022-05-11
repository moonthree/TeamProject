package com.edu.service;

import java.util.List;
import java.util.Map;

import com.edu.vo.ChangePwVO;
import com.edu.vo.EmailDTO;
import com.edu.vo.FileUploadVO;
import com.edu.vo.FundingInfoDetailParameterVO;
import com.edu.vo.FundingInfoDetailVO;
import com.edu.vo.FundingMainVO;
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
	List<FundingMainVO> select3Funding(int member_idx);
	
	//3개의 최신 찜목록
	List<ZzimVO> select3Zzim(int member_idx);
	
	//펀딩개수
	int countFunding(int member_idx);
	
	//찜개수
	int countZzim(int member_idx);
	
	//펀딩내역 
	List<FundingMainVO> myFundingList(int member_idx);
	
	//찜내역
	List<FundingMainVO> myZzimList(int member_idx);
	
	//판매자 펀딩목록 mypage2
	List<FundingMainVO> sellerFundingList(int member_idx);
	
	//펀딩 디테일 funding_info_detail
	FundingInfoDetailVO fundingDetail(FundingInfoDetailParameterVO vo);
	
	//찜 취소
	int deleteZzim(Map<String, Integer> paramMap);
}
