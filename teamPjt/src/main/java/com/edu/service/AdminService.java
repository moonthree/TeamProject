package com.edu.service;

import java.util.List;

import com.edu.vo.FundingMainVO;
import com.edu.vo.MemberVO;
import com.edu.vo.Pagination;
import com.edu.vo.Pagination2;
import com.edu.vo.StoreVO;
//주석 version12 
public interface AdminService {

	//모든 소비자 계정 찾기
	List<MemberVO> memberList_sell(Pagination page);
	int count_seller ();
	
	//모든 판매자 계정 찾기
	List<MemberVO>memberList_company(Pagination2 page2);
	int count_company ();
	
	//신청한 펀딩 List 찾기 
	List<FundingMainVO>list_funding(Pagination page);
	int funding_Count();
	
	//신청한 스토어 List 찾기
	List<StoreVO>list_store(Pagination2 page2);
	int store_Count();
	
	//펀딩 상태 업데이트 -> 승인으로
	int update_funding(int f_idx);
	
	//펀딩 상태 업데이트 -> 거절로
	int update_funding2(int f_idx);
	
	
	//스토어 상태 업데이트 -> 승인으로
	int update_store(int store_idx);
		
	//스토어 상태 업데이트 -> 거절로
	int update_store2(int store_idx);
	
	
	//제품 관리 페이지 -> 펀딩 제품
	List<FundingMainVO> pro_funding(Pagination page);
	int pro_FundingCount();
	
	//제품 관리 페이지 -> 스토어 제품
	List<StoreVO>pro_store(Pagination2 page2);
	int pro_StoreCount();
	
	
	int funding_thumUpdate(FundingMainVO vo );
	int store_Thumupdate(StoreVO vo);
	
	
}
