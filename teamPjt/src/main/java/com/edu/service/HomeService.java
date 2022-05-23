package com.edu.service;

import java.util.List;

import com.edu.vo.FundingMainVO;
import com.edu.vo.StoreVO;

public interface HomeService {
	
	List<FundingMainVO> fundHomeAll(FundingMainVO vo) throws Exception;
	List<FundingMainVO> fundHomeDog(FundingMainVO vo) throws Exception;
	List<FundingMainVO> fundHomeCat(FundingMainVO vo) throws Exception;
	List<FundingMainVO> fundHomeOther(FundingMainVO vo) throws Exception;
	
	List<FundingMainVO> fundHomeNew(FundingMainVO vo) throws Exception;
	
	List<FundingMainVO> fundHomeView(FundingMainVO vo) throws Exception;
	List<StoreVO> storeHomeView(StoreVO vo) throws Exception;
	
	List<StoreVO> storeHomeFund(StoreVO vo) throws Exception;
}
