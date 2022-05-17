package com.edu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.MessageDao;
import com.edu.vo.FundingMainVO;

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

	
}
