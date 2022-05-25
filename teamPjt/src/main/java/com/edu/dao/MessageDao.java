package com.edu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.FundingMainVO;
import com.edu.vo.MessageVO;



@Repository
public class MessageDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FundingMainVO> checkFundingPermit(int member_idx) {
		return sqlSession.selectList("MessageMapper.checkFundingPermit",member_idx);
	}
	
	//f_idx에 따른 member_idx를 구함
	public int getMemberIdx(int f_idx) {
		return sqlSession.selectOne("MessageMapper.getMemberIdx",f_idx);
	}
	
	//메세지로그남김
	public void insertLog(Map<String,Object> paramMap) {
		sqlSession.insert("MessageMapper.insertLog", paramMap);
	}
	
	//메세지불러오기 - from_member_idx마다 최신순 하나
	public List<MessageVO> message_dialogue(int to_member_idx) {
		return sqlSession.selectList("MessageMapper.message_dialogue",to_member_idx);
	}

	//메세지 로그
	public List<MessageVO> message_dialogue_detail(Map<String,Object> param) {
		return sqlSession.selectList("MessageMapper.message_dialogue_detail",param);
	}
	//메세지 로그
		public List<MessageVO> message_dialogue_detail2(int message_idx) {
			return sqlSession.selectList("MessageMapper.message_dialogue_detail2",message_idx);
		}

	//메세지 보내기
	public void sendMessage(Map<String, Object> param) {
		sqlSession.insert("MessageMapper.sendMessage", param);
	}
	
	//message_idx개수찾기
	public int countMessageIdx(Map<String, Object> param) {
		return sqlSession.selectOne("MessageMapper.countMessageIdx", param);
	}
	
	//message_idx찾기
	public int findMessageIdx(Map<String, Object> param) {
		return sqlSession.selectOne("MessageMapper.findMessageIdx", param);
	}
	
	//message_idx만들기
	public void insertMessageIdx(int funding_idx) {
		sqlSession.insert("MessageMapper.insertMessageIdx",funding_idx);
	}
	
	
	
	
	//판매자 member_idx찾기
	public int findSellerIdx(int funding_idx) {
		return sqlSession.selectOne("MessageMapper.findSellerIdx", funding_idx);
	}
	
	//level체크하기
	public int checkLevel(int member_idx) {
		return sqlSession.selectOne("MessageMapper.checkLevel", member_idx);
	}
	
	public List<MessageVO> getFrom_member_idxs(int to_member_idx) {
		return sqlSession.selectList("MessageMapper.getFrom_member_idxs", to_member_idx);
	}
	
	//level에 따른 messageVO하나씩 가져옴
	public MessageVO getMessageDialogue(Map<String, Object> param) {
		return sqlSession.selectOne("MessageMapper.getMessageDialogue", param);
	}

}
