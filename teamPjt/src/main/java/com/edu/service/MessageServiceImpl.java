package com.edu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.MessageDao;
import com.edu.vo.FundingMainVO;
import com.edu.vo.MemberVO;
import com.edu.vo.MessageNoticeVO;
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
	public int getMemberIdxStore(int store_idx) {
		return dao.getMemberIdxStore(store_idx);
	}
	@Override
	public void insertLog(Map<String,Object> paramMap) {
		dao.insertLog(paramMap);
	}
	
	//공지 불러오기
	public List<MessageNoticeVO> notice_timeline(int to_member_idx) {
		return dao.notice_timeline(to_member_idx);
	}
	@Override
	public MessageNoticeVO message_notice(Map<String,Object> param) {
		return dao.message_notice(param);
	}
	
	//메세지 불러오기 - form_member_idx마다 단한개
	@Override
	public List<MessageVO> message_dialogue(int to_member_idx) {
		return dao.message_dialogue(to_member_idx);
	}
	//메세지 로그 불러오기
	@Override
	public List<MessageVO> message_dialogue_detail(Map<String,Object> param) {
		return dao.message_dialogue_detail(param);
	}
	@Override
	public List<MessageVO> message_dialogue_detail2(int message_idx) {
		return dao.message_dialogue_detail2(message_idx);
	}

	//메세지 보내기
	@Override
	public void sendMessage(Map<String, Object> param) {
		dao.sendMessage(param);
	}
	
	//messageIdx개수 카운트
	@Override
	public int countMessageIdx(Map<String, Object> param) {
		return dao.countMessageIdx(param);
	}
	//messageIdx찾기
	@Override
	public int findMessageIdx(Map<String, Object> param) {
		return dao.findMessageIdx(param);
	}

	//messageIdx생성
	@Override
	public void insertMessageIdx(Map<String, Object> param) {
		dao.insertMessageIdx(param);
	}
	//마지막 messageIdx가져오기
	public int getLastMessageIdx() {
		return dao.getLastMessageIdx();
	}
	@Override
	public int findSellerIdx(int funding_idx) {
		return dao.findSellerIdx(funding_idx);
	}

	@Override
	public int checkLevel(int member_idx) {
		return dao.checkLevel(member_idx);
	}

	@Override
	public List<MessageVO> getFrom_member_idxs(int to_member_idx) {
		return dao.getFrom_member_idxs(to_member_idx);
	}
	
	//level에 따른 messageVO하나씩 불러옴
	@Override
	public MessageVO getMessageDialogue(Map<String, Object> paramMap) {
		return dao.getMessageDialogue(paramMap);
	}

	
	@Override
	public int getFromMemberIdx(Map<String, Object> param) {
		return dao.getFromMemberIdx(param);
	}
	@Override
	public MemberVO getPhotoName(int member_idx) {
		return dao.getPhotoName(member_idx);
	}

	

	
	
	
}
