package com.edu.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {

	
	 @Scheduled(fixedDelay=15000)
	    public void checkFundingPermit() {
	        //System.out.println("15초마다 펀딩 허용상태 체크");
	        
	    }
}