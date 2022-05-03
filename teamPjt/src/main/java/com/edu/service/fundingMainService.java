package com.edu.service;

import java.util.List;

import com.edu.vo.FundingMainVO;
import com.edu.vo.Funding_optionVO;
import com.edu.vo.Pagination;

public interface fundingMainService {
	
	
	List<FundingMainVO> listDog(Pagination page) throws Exception;
	List<FundingMainVO> listCat(Pagination page) throws Exception;
	List<FundingMainVO> listOther(Pagination page) throws Exception;
	
	public int listCount() throws Exception;
	public int listCatCount() throws Exception;
	public int listOtherCount() throws Exception;
	
	// 펀딩 옵션 리스트
	List<Funding_optionVO> list(Funding_optionVO vo);
}
