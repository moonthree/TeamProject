package com.edu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.MessageDao;
import com.edu.vo.FundingMainVO;
import com.edu.vo.MessageVO;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageDao dao;
	
	@Override
	public List<FundingMainVO> checkFundingPermit(int member_idx) {
		return dao.checkFundingPermit(member_idx);
	}

	//admincontroller
	@Override
	public int getMemberIdx(int f_idx) {
		return dao.getMemberIdx(f_idx);
	}
	@Override
	public void insertLog(Map<String,Object> paramMap) {
		dao.insertLog(paramMap);
	}

	//메세지 불러오기 - 판매자마다 단한개
	@Override
	public List<MessageVO> message_dialogue(int to_member_idx) {
		return dao.message_dialogue(to_member_idx);
	}
	//메세지 로그 불러오기
	@Override
	public List<MessageVO> message_dialogue_detail(Map<String,Object> param) {
		return dao.message_dialogue_detail(param);
	}

	
}
