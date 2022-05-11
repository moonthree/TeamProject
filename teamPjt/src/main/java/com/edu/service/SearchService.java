package com.edu.service;

import java.util.List;

import com.edu.vo.FundingMainVO;
import com.edu.vo.SearchCriteria;

public interface SearchService {
	
		// 검색 펀딩 리스트
		public List<FundingMainVO> listSearch(SearchCriteria scri) throws Exception;
		// 검색 펀딩 총 갯수
		public int searchFundingCount(SearchCriteria scri) throws Exception;
		
		List<FundingMainVO> searchList(FundingMainVO vo) throws Exception;
		public int searchCount(FundingMainVO vo) throws Exception;
		
		
}
