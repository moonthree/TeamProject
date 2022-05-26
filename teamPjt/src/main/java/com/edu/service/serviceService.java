package com.edu.service;

import java.util.List;

import com.edu.vo.CriteriaVO;

import com.edu.vo.ServiceVO;
public interface serviceService {
	
	List<ServiceVO> selectAll();
	
	List<ServiceVO> list(CriteriaVO cri) throws Exception;
	
	int listCount() throws Exception;
	
	ServiceVO view(int sboard_idx);
	
	int write(ServiceVO vo);
	
	ServiceVO modify(int sboard_idx);
	
	int update(ServiceVO vo);
	
	int delete(ServiceVO vo);
	
	
}
