package com.edu.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.fundingMainDAO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.Funding_optionVO;
import com.edu.vo.Pagination;

@Service
public class fundingMainServiceImpl implements fundingMainService{
	
	@Autowired
	private fundingMainDAO dao;
	//펀딩 메인 리스트
	@Override
	public List<FundingMainVO> listDog(Pagination page) throws Exception {
		return dao.listDog(page);
	}
	@Override
	public List<FundingMainVO> listCat(Pagination page) throws Exception {
		return dao.listCat(page);
	}
	@Override
	public List<FundingMainVO> listOther(Pagination page) throws Exception {
		return dao.listOther(page);
	}

		
	//게시물 총 갯수
	@Override
	public int listDogCount() throws Exception {
		return dao.listDogCount();
	}
	@Override
	public int listCatCount() throws Exception {
		return dao.listCatCount();
	}
	@Override
	public int listOtherCount() throws Exception {
		return dao.listOtherCount();
	}
	
	//펀딩 뷰
	@Override
	public FundingMainVO read(int funding_idx) throws Exception {
		return dao.read(funding_idx);
	}
	
	
	
	
	// 펀딩 옵션
	@Override
	public List<Funding_optionVO> list(Funding_optionVO vo) {
		return dao.list(vo);
	}
	

}
