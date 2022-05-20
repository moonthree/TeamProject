package com.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.adminDao;
import com.edu.vo.FundingMainVO;
import com.edu.vo.MemberVO;
import com.edu.vo.Pagination;
import com.edu.vo.Pagination2;
import com.edu.vo.StoreVO;

@Service
public class AdminServiceImp implements AdminService{
	
	@Autowired
	private adminDao admindao;

	
	//소비자 계정 찾기
	@Override
	public List<MemberVO> memberList_sell(Pagination page) {
		return admindao.listMember_sell(page);
	}
	//소비자 페이징
	@Override
	public int count_seller() {
		return admindao.count_seller();
	}
	
	//판매자 계정 찾기
	@Override
	public List<MemberVO> memberList_company(Pagination2 page) {
		return admindao.listMember_company(page);
	}
	//판매자 페이징
	@Override
	public int count_company() {
		return admindao.count_company();
	}
	
	//////////////////////////////////////////
	
	//펀딩 신청한 제품 목록 찾기
	@Override
	public List<FundingMainVO> list_funding(Pagination page) {
		
		return admindao.list_Funding(page);
	}
	//펀딩 페이징
	@Override
	public int funding_Count() {
		
		return admindao.funding_Count();
	}
	
	
	
	//관리자가 펀딩 신청 승인 시 펀딩 상태 변경
	@Override
	public int update_funding(int f_idx) {
		
		return admindao.update_funding(f_idx);
	}
	//관리자가 펀딩 신청 거절 시 펀딩 상태 변경
	@Override
	public int update_funding2(int f_idx) {
		
		return admindao.update_funding2(f_idx);
	}
	
	
	//스토어 신청한 제품 목록 찾기
	@Override
	public List<StoreVO> list_store(Pagination2 page) {
		
		return admindao.list_Store(page);
	}
	
	//스토어 페이징
	@Override
	public int store_Count() {
		
		return admindao.store_Count();
	}
	
	//관리자가 스토어 신청 승인 시 스토어 상태 변경
	@Override
	public int update_store(int store_idx) {
		
		return admindao.update_store(store_idx);
	}
	//관리자가 펀딩 신청 거절 시 펀딩 상태 변경
	@Override
	public int update_store2(int store_idx) {
		
		return admindao.update_store2(store_idx);
	}

	
}
