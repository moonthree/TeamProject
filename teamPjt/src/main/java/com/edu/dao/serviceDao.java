package com.edu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.CriteriaVO;
import com.edu.vo.ServiceVO;

@Repository
public class serviceDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<ServiceVO> selectAll(){
		return sqlSession.selectList("ServiceMapper.service_list");
	}
	
	public List<ServiceVO> list(CriteriaVO cri) throws Exception {
		return sqlSession.selectList("ServiceMapper.listPage", cri);
	}
	
	public int listCount() throws Exception {
		return sqlSession.selectOne("ServiceMapper.listCount");
	}
	
	public ServiceVO view(int sboard_idx) {
		return sqlSession.selectOne("ServiceMapper.view", sboard_idx);
	}
	
	public int write(ServiceVO vo) {
		return sqlSession.insert("ServiceMapper.write", vo);
	}
	
	public ServiceVO modify(int sboard_idx) {
		
		return sqlSession.selectOne("ServiceMapper.modify", sboard_idx);
	}

	public int update(ServiceVO vo) {
		
		return sqlSession.update("ServiceMapper.update",vo);
	}
	
	public int delete(ServiceVO vo) {
		
		return sqlSession.delete("ServiceMapper.delete", vo);
	}


	
}
