package com.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.noticeDao;
import com.edu.vo.CriteriaVO;
import com.edu.vo.NoticeVO;

@Service
public class noticeServiceImp implements noticeService {
	
	@Autowired
	private noticeDao noticedao;
	
	public List<NoticeVO> selectAll(){
		
		return noticedao.selectAll();	
	}

	@Override
	public NoticeVO view(int board_idx) {
		
		return noticedao.view(board_idx);
	}

	@Override
	public int write(NoticeVO vo) {
		
		return noticedao.write(vo);
	}

	@Override
	public int delete(int board_idx) {
		
		return noticedao.delete(board_idx);
	}

	@Override
	public NoticeVO modify(int board_idx) {
		
		return noticedao.modify(board_idx);
	}

	@Override
	public int update(NoticeVO vo) {
		
		return noticedao.update(vo);
	}

	@Override
	public List<NoticeVO> list(CriteriaVO cri) throws Exception {
		
		return noticedao.list(cri);
	}

	@Override
	public int listCount() throws Exception {
		
		return noticedao.listCount();
	}
	
	
}
