package com.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.serviceDao;
import com.edu.vo.CriteriaVO;

import com.edu.vo.ServiceVO;

@Service
public class serviceServiceImp implements serviceService {
	@Autowired
	private serviceDao servicedao;
	
	public List<ServiceVO> selectAll(){
		
		return servicedao.selectAll();
	}
	
	@Override
	public List<ServiceVO> list(CriteriaVO cri) throws Exception {
		
		return servicedao.list(cri);
	}
	
	@Override
	public int listCount() throws Exception {
		
		return servicedao.listCount();
	}
	
	@Override
	public ServiceVO view(int board_idx) {
		
		return servicedao.view(board_idx);
	}
	
	@Override
	public int write(ServiceVO vo) {
		
		return servicedao.write(vo);
	}
	
	@Override
	public ServiceVO modify(int sboard_idx) {
		
		return servicedao.modify(sboard_idx);
	}

	@Override
	public int update(ServiceVO vo) {
		
		return servicedao.update(vo);
	}
	
	@Override
	public int delete(ServiceVO vo) {
		
		return servicedao.delete(vo);
	}

	
	
	
}
