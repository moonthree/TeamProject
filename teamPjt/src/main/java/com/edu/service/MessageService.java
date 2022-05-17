package com.edu.service;

import java.util.List;
import java.util.Map;

import com.edu.vo.FundingMainVO;

public interface MessageService {

	//FUNDING PERMIT CHECK
	List<FundingMainVO> checkFundingPermit(int member_idx);
	
	//admincontroller
	int getMemberIdx(int f_idx); //funding_idx를 가지고 member_idx를 구할거임
	void insertLog(Map<String,Object> paramMap); //message 로그남김
	
}
