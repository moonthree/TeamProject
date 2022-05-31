package com.edu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.FundingMainVO;
import com.edu.vo.MemberVO;

 // 주석 version13 -->
@Repository
public class schedulerDAO {
	
	// 스케줄러 매퍼만 참조해서, 특정 시간에 펀딩 테이블에 입력되있는 펀딩 제품들의 마감 날짜를 보고 마감날짜와 같으면 
	// 1. 펀딩률을 보고 -> 100%가 넘으면 테이블의 currunt_state를 1로 바꾸고
	// 2. 펀딩률을 보고 -> 100%가 안됬을 경우 테이블의 currunt_state를 0으로 바꾼다.
	@Autowired
	private SqlSession sqlSession;
	//"0 */5 * * * *" ->5분주기
	//매일 자정 0 0 0 * * *
	
	//펀딩 성공
	public void FundingSuccess() {
		System.out.println("펀딩 성공 실행");
		sqlSession.update("SchedulerMapper.fundingStateOne");
	
		//펀딩 성공 공지
		System.out.println("펀딩 성공 공지");
		//조건에 해당하는 펀딩 idx가져오기
		List<FundingMainVO> fmv = sqlSession.selectList("MessageMapper.messageFundingList");
		
		for(int i=0 ; i<fmv.size() ; i++) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("from_member_idx",fmv.get(i).getFrom_member_idx());
			param.put("to_member_idx",fmv.get(i).getTo_member_idx());
			param.put("funding_idx",fmv.get(i).getFunding_idx());
			param.put("message_content", "<span style=\"color:#fa6463\" >"+fmv.get(i).getFunding_title()+"</span> 펀딩이 100%를 달성했습니다.");
			param.put("f_or_s",0);
			//같은 행 있는지 카운트 부터 하고 없으면 넣기로..
			int sameRow = sqlSession.selectOne("MessageMapper.messageNoticeSameRow",param);
			System.out.println("sameRow? : "+sameRow);
			if(sameRow == 0) { //같은 행이 없는 경우 로그를 넣는 작업
				sqlSession.insert("MessageMapper.insertLog",param);
			}else {
				System.out.println("같은 행 존재");
			}
		}
	}
	//펀딩 실패
	public void FundingFail() {
		System.out.println("펀딩 실패 실행");
		sqlSession.update("SchedulerMapper.fundingStateTwo");
	}
}
