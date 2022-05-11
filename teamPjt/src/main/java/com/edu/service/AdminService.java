package com.edu.service;

import java.util.List;

import com.edu.vo.FundingMainVO;
import com.edu.vo.MemberVO;
import com.edu.vo.Pagination;

public interface AdminService {

	//모든 소비자 계정 찾기
	List<MemberVO> memberList_sell(Pagination page);
	int count_seller ();
	
	//모든 판매자 계정 찾기
	List<MemberVO>memberList_company(Pagination page);
	int count_company ();
	//신청한 펀딩 List 찾기 
	List<FundingMainVO>list_funding();
	
	//펀딩 상태 업데이트 -> 승인으로
	int update_funding(int f_idx);
}
