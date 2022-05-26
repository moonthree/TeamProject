package com.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.replyDao;

import com.edu.vo.ReplyVO;

@Service
public class replyServiceImp implements replyService {
	
	@Autowired
	private replyDao replydao;
	
	public List<ReplyVO> selectAll(ReplyVO reVO) {
		return replydao.selectAll(reVO);
	}
	
	@Override
	public int write(ReplyVO vo) {
		return replydao.write(vo);
	}
	
	@Override
	public int delete(ReplyVO vo) {
		
		return replydao.delete(vo);
	}

	@Override
	public int update(ReplyVO vo) {
		
		return replydao.update(vo);
	}

	@Override
	public ReplyVO modify(int sboard_idx, int reply_idx) {
		
		return replydao.modify(sboard_idx, reply_idx);
	}

	

	
}
