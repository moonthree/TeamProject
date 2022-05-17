package com.edu.service;

import java.util.List;

import com.edu.vo.FundingMainVO;
import com.edu.vo.MemberVO;
import com.edu.vo.Pagination;
import com.edu.vo.Pagination2;

public interface AdminService {

	//모든 소비자 계정 찾기
	List<MemberVO> memberList_sell(Pagination page);
	int count_seller ();
	
	//모든 판매자 계정 찾기
	List<MemberVO>memberList_company(Pagination2 page2);
	int count_company ();
	
	//신청한 펀딩 List 찾기 
	List<FundingMainVO>list_funding();
	
	//펀딩 상태 업데이트 -> 승인으로
	int update_funding(int f_idx);
	
	//펀딩 상태 업데이트 -> 거절로
	int update_funding2(int f_idx);
}
