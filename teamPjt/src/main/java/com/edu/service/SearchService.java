package com.edu.service;

import java.util.List;

import com.edu.vo.FundingMainVO;
import com.edu.vo.StoreVO;

public interface SearchService {
		
		List<FundingMainVO> searchList(FundingMainVO vo) throws Exception;
		public int searchCount(FundingMainVO vo) throws Exception;
		
		List<StoreVO> searchStoreList(StoreVO vo) throws Exception;
		public int searchStoreCount(StoreVO vo) throws Exception;
}
