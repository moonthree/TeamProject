package com.edu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.edu.vo.ChangePwVO;
import com.edu.vo.EmailDTO;
import com.edu.vo.FileUploadVO;
import com.edu.vo.FundingInfoDetailVO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.Funding_expressVO;
import com.edu.vo.Funding_orderVO;
import com.edu.vo.Funding_order_payVO;
import com.edu.vo.MemberVO;
import com.edu.vo.StoreExpressVO;
import com.edu.vo.StoreInfoDetailVO;
import com.edu.vo.StoreOrderPayVO;
import com.edu.vo.StoreVO;
import com.edu.vo.ZzimInfoVO;
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
	HashMap<String,Object> findPw(ChangePwVO vo);
	
	//비밀번호 변경
	int changePw(ChangePwVO vo);	
	
	//이메일 보내기
	public void sendMail(EmailDTO dto);
	
	//3개의 최신 펀딩목록
	List<FundingInfoDetailVO> select3Funding(int member_idx);
	
	//4개의 최신 펀딩목록
	List<FundingInfoDetailVO> select4Funding(int member_idx);
	
	List<StoreInfoDetailVO> select4Store(int member_idx);
	//3개의 최신 구매목록 
	List<StoreInfoDetailVO> select3Store(int member_idx);
	
	//3개의 최신 찜목록
	List<ZzimVO> select3Zzim(int member_idx);
	
	//펀딩개수
	int countFunding(int member_idx);
	
	//구매개수
	int countStore(int member_idx);
	
	//찜개수
	int countZzim(int member_idx);
	
	//펀딩내역 
	List<FundingMainVO> myFundingList(int member_idx);
	
	//펀딩내역2 - 위에꺼 안쓰고 고침 info_funding
	List<FundingInfoDetailVO> myFundingList2(int member_idx);
	
	//스토어내역
	List<StoreInfoDetailVO> myStoreList(int member_idx);
	
	//찜내역
	List<FundingMainVO> myZzimList(int member_idx);
	//찜 카테고리 리스트
	List<ZzimInfoVO> getZzim_category(int member_idx);
	//찜내역 - 무한스크롤
	ZzimInfoVO myZzimList1(ZzimInfoVO vo);
	//찜내역 - 스크롤
	ZzimInfoVO myZzimList2(Map<String,Object> param);
	
	//판매자 펀딩목록 mypage2
	List<FundingMainVO> sellerFundingList(int member_idx);
	
	//판매자 스토어목록 mypage2
	List<StoreVO> sellerStoreList(int member_idx);
	
	/*funding_info_detail*/
	//funding & funding_order
	FundingInfoDetailVO fundingDetail(int funding_order_idx);
	//funding_order_pay
	Funding_order_payVO fundingPayDetail(int funding_order_idx);
	//funding_express
	Funding_expressVO fundingExpressDetail(Map<String,Object> param);
	//funding_option1
	List<FundingInfoDetailVO> fundingOptionDetail(int funding_order_idx);
	int fundingOrderCount(Funding_orderVO vo);
	
	/*store_info_detail*/
	//store & store_order
	StoreInfoDetailVO storeDetail(int store_order_idx);
	//store_order_pay
	StoreOrderPayVO storePayDetail(int store_order_idx);
	//store_express
	StoreExpressVO storeExpressDetail(int store_order_idx);
	//store_option
	List<StoreInfoDetailVO> storeOptionDetail(int store_order_idx);
	
	//찜 취소
	int deleteZzim(Map<String, Integer> paramMap);
	int deleteZzim2(Map<String, Integer> paramMap);
	//비밀번호 변경-마이페이지
	int changePw(Map<String,Object> paramMap);
	
	//주소 변경-funding_info_detail
	int changeExpress(Map<String,Object> paramMap);
	
	//펀딩 취소
	int fundingWithdraw(Map<String,Object> paramMap);
	
	// 스토어 관리
	List<StoreVO> store_admin(int store_idx);
	
	// 배송 상태 변경
	int update_Express(int store_order_idx);
	//구매 취소
	int storeWithdraw(int store_order_idx);
	
	//펀딩 판매자입장에서 주문 내역 가져오기
	List<HashMap<String,Object>>fundingAdmin(int funding_idx);
	
	//펀딩 배송 시작 메소드
	int update_FundingExpress(int fundung_order_idx);
}
