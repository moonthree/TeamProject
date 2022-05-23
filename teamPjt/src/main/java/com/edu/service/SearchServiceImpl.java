package com.edu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.searchDAO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.SearchCriteria;
import com.edu.vo.StoreVO;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private searchDAO dao;

	@Override
	public List<FundingMainVO> searchList(FundingMainVO vo) throws Exception {
		ArrayList<FundingMainVO> searchList = (ArrayList<FundingMainVO>) dao.searchList(vo);
		return searchList;
	}

	@Override
	public int searchCount(FundingMainVO vo) throws Exception {
		int result = dao.searchCount(vo);
		return result;
	}

	@Override
	public List<StoreVO> searchStoreList(StoreVO vo) throws Exception {
		ArrayList<StoreVO> searchStoreList = (ArrayList<StoreVO>) dao.searchStoreList(vo);
		return searchStoreList;
	}

	@Override
	public int searchStoreCount(StoreVO vo) throws Exception {
		int result = dao.searchStoreCount(vo);
		return result;
	}

}
