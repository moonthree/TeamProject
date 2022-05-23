package com.edu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.fundingMainDAO;
import com.edu.dao.homeDao;
import com.edu.vo.FundingMainVO;
import com.edu.vo.StoreVO;
@Service
public class HomeServiceImpl implements HomeService {
	@Autowired
	private homeDao dao;
	
	@Override
	public List<FundingMainVO> fundHomeAll(FundingMainVO vo) throws Exception {
		ArrayList<FundingMainVO> fundHomeAll = (ArrayList<FundingMainVO>) dao.fundHomeAll(vo);
		return fundHomeAll;
	}
	@Override
	public List<FundingMainVO> fundHomeDog(FundingMainVO vo) throws Exception {
		ArrayList<FundingMainVO> fundHomeDog = (ArrayList<FundingMainVO>) dao.fundHomeDog(vo);
		return fundHomeDog;
	}
	@Override
	public List<FundingMainVO> fundHomeCat(FundingMainVO vo) throws Exception {
		ArrayList<FundingMainVO> fundHomeCat = (ArrayList<FundingMainVO>) dao.fundHomeCat(vo);
		return fundHomeCat;
	}
	@Override
	public List<FundingMainVO> fundHomeOther(FundingMainVO vo) throws Exception {
		ArrayList<FundingMainVO> fundHomeOther = (ArrayList<FundingMainVO>) dao.fundHomeOther(vo);
		return fundHomeOther;
	}
	
	@Override
	public List<FundingMainVO> fundHomeNew(FundingMainVO vo) throws Exception {
		ArrayList<FundingMainVO> fundHomeNew = (ArrayList<FundingMainVO>) dao.fundHomeNew(vo);
		return fundHomeNew;
	}
	
	@Override
	public List<FundingMainVO> fundHomeView(FundingMainVO vo) throws Exception {
		ArrayList<FundingMainVO> fundHomeView = (ArrayList<FundingMainVO>) dao.fundHomeView(vo);
		return fundHomeView;
	}
	@Override
	public List<StoreVO> storeHomeView(StoreVO vo) throws Exception {
		ArrayList<StoreVO> storeHomeView = (ArrayList<StoreVO>) dao.storeHomeView(vo);
		return storeHomeView;
	}
	@Override
	public List<StoreVO> storeHomeFund(StoreVO vo) throws Exception {
		ArrayList<StoreVO> storeHomeFund = (ArrayList<StoreVO>) dao.storeHomeFund(vo);
		return storeHomeFund;
	}

}
