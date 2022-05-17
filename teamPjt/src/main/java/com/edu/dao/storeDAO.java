package com.edu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.StoreOptionVO;

@Repository
public class storeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 스토어 메인
	
	// 스토어 뷰
	
	
	// 스토어 옵션 리스트
	public List<StoreOptionVO> storeOptionList(StoreOptionVO vo) {
		return sqlSession.selectList("StoreMapper.storeOptionList", vo);
	}

}
