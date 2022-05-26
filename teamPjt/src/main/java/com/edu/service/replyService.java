package com.edu.service;

import java.util.List;


import com.edu.vo.ReplyVO;


public interface replyService {

	List<ReplyVO> selectAll(ReplyVO reVOs);
	
	int write(ReplyVO vo);
	
	int delete(ReplyVO vo);

	int update(ReplyVO vo);

	ReplyVO modify(int sboard_idx, int reply_idx);

	
}
