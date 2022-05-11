package com.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.adminDao;
import com.edu.vo.FundingMainVO;
import com.edu.vo.MemberVO;
import com.edu.vo.Pagination;

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
	public List<MemberVO> memberList_company(Pagination page) {
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
	public List<FundingMainVO> list_funding() {
		
		return admindao.list_Funding();
	}
	
	//관리자가 펀딩 신청 승인 시 펀딩 상태 변경
	@Override
	public int update_funding(int f_idx) {
		
		return admindao.update_funding(f_idx);
	}

	
}
