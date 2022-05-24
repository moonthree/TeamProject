package com.edu.scheduler;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.edu.dao.schedulerDAO;
import com.edu.vo.FundingMainVO;

//<!-- 주석 version13 -->
@Component
public class Scheduler {
	
	@Autowired
	private schedulerDAO scdao;
	
	// 스케줄러 매퍼만 참조해서, 특정 시간에 펀딩 테이블에 입력되있는 펀딩 제품들의 마감 날짜를 보고 마감날짜와 같으면 
	// 1. 펀딩률을 보고 -> 100%가 넘으면 테이블의 currunt_state를 1로 바꾸고
	// 2. 펀딩률을 보고 -> 100%가 안됬을 경우 테이블의 currunt_state를 0으로 바꾼다.
		
		//0 * * * * * 1분 주기
		//"0 */5 * * * *" ->5분주기
		//매일 자정 0 0 0 * * *
	
	@Scheduled(cron = "0 * * * * *")
	public void test() {
		scdao.FundingSuccess();
		scdao.FundingFail();
	}
	
	
//	public void test()throws Exception {
//		
//		SimpleDateFormat dtf = new SimpleDateFormat("yyyy/MM/dd");
//		long miliseconds = System.currentTimeMillis();
//        Date nowDate = new Date(miliseconds);
//        
//        String NOWDate = dtf.format(nowDate);
//		
//		List<FundingMainVO> vo =  scdao.scheduler();
//		
//		  System.out.println("지금 날짜 : "+nowDate);
//		
//		if(vo.size() > 0 && !vo.equals(null)) {
//			
//			for(FundingMainVO voo : vo) {
//				
//				if(NOWDate.equals(voo.getFunding_end_date())) {
//					   
//			   System.out.println("펀딩 idx : "+voo.getFunding_idx());
//			   System.out.println("펀딩 목표 금액 : "+voo.getFunding_target_price());
//			   System.out.println("펀딩 현재 금액 : "+voo.getFunding_current_price());
//			   System.out.println("펀딩 끝나는 날짜 : "+ voo.getFunding_end_date());
//			  
//			   System.out.println("------------------------------");
//			   }else {
//				   System.out.println("같은게 없음");
//			   }
//			 
//			   //* 만약 마감 날짜가 매일 동작하는 날짜의 자정일 경우(작거나 같을경우) -> 무조건 비교
//			   //1. 이제 펀딩 쌓인 금액이 타겟 금액보다 크거나 같다면 상태 1 ->Funding_current_price
//			   //2. 이제 펀딩 쌓인 금액이 타겟 금액보다 작다면 상태 2로 변경 -> Funding_current_price
//			   
//			}
//		}
//	}
}
