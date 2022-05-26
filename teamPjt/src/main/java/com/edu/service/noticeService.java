package com.edu.service;

import java.util.List;

import com.edu.vo.CriteriaVO;
import com.edu.vo.NoticeVO;
public interface noticeService {
	
	List<NoticeVO> selectAll();
	
	NoticeVO view(int board_idx);
	
	int write(NoticeVO vo);
	
	int delete(int board_idx);
	
	NoticeVO modify(int board_idx);
	
	int update(NoticeVO vo);
	
	List<NoticeVO> list(CriteriaVO cri) throws Exception;
	
	int listCount() throws Exception;
	
	
}
