package com.edu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.FundingMainVO;
import com.edu.vo.MemberVO;
import com.edu.vo.MessageNoticeVO;
import com.edu.vo.MessageVO;



@Repository
public class MessageDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FundingMainVO> checkFundingPermit(int member_idx) {
		return sqlSession.selectList("MessageMapper.checkFundingPermit",member_idx);
	}
	
	//Admincontroller
	//f_idx에 따른 member_idx를 구함
	public int getMemberIdx(int f_idx) {
		return sqlSession.selectOne("MessageMapper.getMemberIdx",f_idx);
	}
	//store_idx에 따른 member_idx를 구함
		public int getMemberIdxStore(int store_idx) {
			return sqlSession.selectOne("MessageMapper.getMemberIdxStore",store_idx);
		}
	//메세지로그남김
	public void insertLog(Map<String,Object> paramMap) {
		sqlSession.insert("MessageMapper.insertLog", paramMap);
	}
	
	//공지
	public List<MessageNoticeVO> notice_timeline(int to_member_idx){
		return sqlSession.selectList("MessageMapper.notice_timeline",to_member_idx);
	}
	public MessageNoticeVO message_notice(Map<String,Object> param){
		return sqlSession.selectOne("MessageMapper.message_notice",param);
	}
	//펀딩 성공시 소비자에게 알림로그남기기
//	public void FundingSuccess() {
//		sqlSession.insert("MessageMapper.FundingSuccess");
//	}
	
	
	//쪽지
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
	//마지막 message_idx가져오기
	public int getLastMessageIdx() {
		return sqlSession.selectOne("MessageMapper.getLastMessageIdx");
	}
	
	//message_idx만들기
	public void insertMessageIdx(Map<String, Object> param) {
		sqlSession.insert("MessageMapper.insertMessageIdx", param);
	}
	
	public int getFromMemberIdx(Map<String, Object> param) {
		return sqlSession.selectOne("MessageMapper.getFromMemberIdx",param);
	}
	public MemberVO getPhotoName(int member_idx) {
		return sqlSession.selectOne("MessageMapper.getPhotoName", member_idx);
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
	
	//스케쥴러
	//소비자에게 펀딩 성공 공지 로그
//	public void FundingSuccess() {
//		//System.out.println("펀딩 성공 공지");
//		//조건에 해당하는 펀딩 idx가져오기
//		List<FundingMainVO> fmv = sqlSession.selectList("MessageMapper.messageFundingList");
//		
//		for(int i=0 ; i<fmv.size() ; i++) {
//			Map<String, Object> param = new HashMap<String, Object>();
//			param.put("from_member_idx",fmv.get(i).getFrom_member_idx());
//			param.put("to_member_idx",fmv.get(i).getTo_member_idx());
//			param.put("funding_idx",fmv.get(i).getFunding_idx());
//			param.put("message_content", "<span style=\"color:#fa6463\" >"+fmv.get(i).getFunding_title()+"</span> 펀딩이 100%를 달성했습니다.");
//			param.put("f_or_s",0);
//			//같은 행 있는지 카운트 부터 하고 없으면 넣기로..
//			int sameRow = sqlSession.selectOne("MessageMapper.messageNoticeSameRow",param);
//			//System.out.println("sameRow? : "+sameRow);
//			if(sameRow == 0) { //같은 행이 없는 경우 로그를 넣는 작업
//				sqlSession.insert("MessageMapper.insertLog",param);
//			}else {
//				//System.out.println("같은 행 존재");
//			}
//			
//		}
		
//	}

}
