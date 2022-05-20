package com.edu.service;

import java.util.List;
import java.util.Map;

import com.edu.vo.FundingMainVO;
import com.edu.vo.MessageVO;

public interface MessageService {

	//FUNDING PERMIT CHECK
	List<FundingMainVO> checkFundingPermit(int member_idx);
	
	//admincontroller
	int getMemberIdx(int f_idx); //funding_idx를 가지고 member_idx를 구할거임
	void insertLog(Map<String,Object> paramMap); //message 로그남김
	
	//쪽지 불러오기 - 판매자마다 단 한개씩
	List<MessageVO> message_dialogue(int to_member_idx);
	
	List<MessageVO> message_dialogue_detail(Map<String, Object> param);
}
