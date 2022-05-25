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
	
	//쪽지 불러오기 - from_member_idx마다 단 한개씩
	List<MessageVO> message_dialogue(int to_member_idx);
	
	List<MessageVO> message_dialogue_detail(Map<String, Object> param);

	List<MessageVO> message_dialogue_detail2(int message_idx);
	//쪽지 보내기
	void sendMessage(Map<String, Object> param);
	
	//message_idx찾기
	int findMessageIdx(Map<String, Object> param);
	
	//message_idx만들기
	void insertMessageIdx(int funding_idx);
	
	
	
	
	//funding_idx로 판매자의 member_idx를 찾기
	int findSellerIdx(int funding_idx);
	
	//level체크
	int checkLevel(int member_idx);
	
	//level에 따른 MessageVO하나씩 가져옴
	MessageVO getMessageDialogue(Map<String,Object> paramMap);
	
	List<MessageVO> getFrom_member_idxs(int to_member_idx);
}
