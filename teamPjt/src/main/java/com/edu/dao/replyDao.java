package com.edu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.ReplyVO;

@Repository
public class replyDao {

	@Autowired
	private SqlSession sqlSession;
	
	//reply 리스트
		public List<ReplyVO> selectAll(ReplyVO reVO){
			return sqlSession.selectList("ReplyMapper.reply_list",reVO);
		}
		
		public int write(ReplyVO vo) {
			return sqlSession.insert("ReplyMapper.write", vo);
		}
		
		public int delete(ReplyVO vo) {
			return sqlSession.delete("ReplyMapper.delete", vo);
		}
		
		

		public int update(ReplyVO vo) {
			
			return sqlSession.update("ReplyMapper.update", vo);
		}

		public ReplyVO modify(int sboard_idx, int reply_idx) {
			
			// 1. map 구조로 만들어서 보내거나 
			//2. vo로 묶어서 만들어서 보낸다.
			ReplyVO vo = new ReplyVO();
			vo.setSboard_idx(sboard_idx);
			vo.setReply_idx(reply_idx);
			
			return sqlSession.selectOne("ReplyMapper.modify",vo);
		}
		
}
