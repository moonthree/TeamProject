package com.edu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.CriteriaVO;
import com.edu.vo.NoticeVO;

@Repository
public class noticeDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<NoticeVO> selectAll(){
		return sqlSession.selectList("NoticeMapper.notice_list");
	}
	
	public NoticeVO view(int board_idx) {
		return sqlSession.selectOne("NoticeMapper.view", board_idx);
	}
	
	public int write(NoticeVO vo) {
		return sqlSession.insert("NoticeMapper.write", vo);
	}

	public int delete(int board_idx) {
		
		return sqlSession.delete("NoticeMapper.delete", board_idx);
	}
	
	public NoticeVO modify(int board_idx) {
		
		return sqlSession.selectOne("NoticeMapper.modify", board_idx);
	}

	public int update(NoticeVO vo) {
		
		return sqlSession.update("NoticeMapper.update",vo);
	}
	
	public List<NoticeVO> list(CriteriaVO cri) throws Exception {
		return sqlSession.selectList("NoticeMapper.listPage", cri);
		 //NoticeMapper.listPage
	}
	
	public int listCount() throws Exception {
		return sqlSession.selectOne("NoticeMapper.listCount");
	}
}
