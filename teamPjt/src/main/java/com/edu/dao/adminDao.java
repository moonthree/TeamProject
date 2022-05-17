package com.edu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.FundingMainVO;
import com.edu.vo.MemberVO;
import com.edu.vo.Pagination;
import com.edu.vo.Pagination2;

@Repository
public class adminDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//모든 멤버 중 소비자만 찾기
	public List<MemberVO> listMember_sell(Pagination page){
			return sqlSession.selectList("adminMapper.listMember_seller",page);
	}
	
	//페이지 소비자 카운트
	public int count_seller() {
		return 	sqlSession.selectOne("adminMapper.seller_Count");
	}
	
	//모든 멤버 중 판매자만 찾기
	public List<MemberVO> listMember_company(Pagination2 page){
		
	return sqlSession.selectList("adminMapper.listMember_company",page);
	}
	
	//페이지 판매자 카운트
	public int count_company() {
		return sqlSession.selectOne("adminMapper.company_Count");
	}
	
	
	
	//펀딩 승인 목록 리스트 가져오기
	public List<FundingMainVO> list_Funding(){
		
		return sqlSession.selectList("adminMapper.list_funding");
	}
	
	//update 펀딩 상태 -> 승인으로
	public int update_funding(int f_idx) {
		
		return sqlSession.update("adminMapper.updateFun_State", f_idx);
	}
	
	//update 펀딩 상태 -> 거절로
		public int update_funding2(int f_idx) {
			
			return sqlSession.update("adminMapper.updateFun_State2", f_idx);
		}

	
	
}
