package com.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.searchDAO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.SearchCriteria;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private searchDAO dao;
	
	@Override
	public List<FundingMainVO> listSearch(SearchCriteria scri) throws Exception {
		return dao.listSearch(scri);
	}

	@Override
	public int searchFundingCount(SearchCriteria scri) throws Exception {
		return dao.searchFundingCount(scri);
	}

}
