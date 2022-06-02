package com.edu.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.edu.dao.MessageDao;
import com.edu.dao.schedulerDAO;

//<!-- 주석 version13 -->
@Component
public class Scheduler {
	
	@Autowired
	private schedulerDAO scdao;
	
	@Autowired
	private MessageDao messageDao;
	
	// 스케줄러 매퍼만 참조해서, 특정 시간에 펀딩 테이블에 입력되있는 펀딩 제품들의 마감 날짜를 보고 마감날짜와 같으면 
	// 1. 펀딩률을 보고 -> 100%가 넘으면 테이블의 currunt_state를 1로 바꾸고
	// 2. 펀딩률을 보고 -> 100%가 안됬을 경우 테이블의 currunt_state를 0으로 바꾼다.
		
		//0 * * * * * 1분 주기
		//"0 */5 * * * *" ->5분주기
		//매일 자정 0 0 0 * * *
	
	@Scheduled(cron = "0 0 0 * * *")
	public void test() {
		scdao.FundingSuccess();
		scdao.FundingFail();
	}
	
	//임시보류 -> 하루단위로 current_state가 바뀌는데 일분마다 체크할 필요가 없음
	//메세지 dao에서 1분마다 current_state를 확인하고 
	//1이 되면 100%가 되었다고 소비자에게 공지해줌
	/*
	 * @Scheduled(cron = "0 * * * * *") public void messageNotice() {
	 * //messageDao.FundingSuccess(); }
	 */

}
