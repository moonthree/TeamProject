package com.edu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.FundingMainVO;
import com.edu.vo.MemberVO;
import com.edu.vo.Pagination;
import com.edu.vo.Pagination2;
import com.edu.vo.StoreVO;

@Repository
public class adminDao {
	
	@Autowired
	private SqlSession sqlSession;
	//////////////////////여기서 부턴 소비자///////////////////////
	
	//모든 멤버 중 소비자만 찾기
	public List<MemberVO> listMember_sell(Pagination page){
			return sqlSession.selectList("adminMapper.listMember_seller",page);
	}
	
	//페이지 소비자 카운트
	public int count_seller() {
		return 	sqlSession.selectOne("adminMapper.seller_Count");
	}
	
	//////////////////////여기서 부턴 판매자///////////////////////
	
	//모든 멤버 중 판매자만 찾기
	public List<MemberVO> listMember_company(Pagination2 page){
		
	return sqlSession.selectList("adminMapper.listMember_company",page);
	}
	
	//페이지 판매자 카운트
	public int count_company() {
		return sqlSession.selectOne("adminMapper.company_Count");
	}
	
////////////////////// 여기서 부턴 펀딩 ///////////////////////
	
	//펀딩 승인 목록 리스트 가져오기
	public List<FundingMainVO> list_Funding(Pagination page){
		
		return sqlSession.selectList("adminMapper.list_funding",page);
	}
	//펀딩 페이징 카운트
		public int funding_Count() {
			return 	sqlSession.selectOne("adminMapper.funding_Count");
	}
	
	
	//update 펀딩 상태 -> 승인으로
	public int update_funding(int f_idx) {
		
		return sqlSession.update("adminMapper.updateFun_State", f_idx);
	}
	
	//update 펀딩 상태 -> 거절로
		public int update_funding2(int f_idx) {
			
		return sqlSession.update("adminMapper.updateFun_State2", f_idx);
	}
		

	//////////////////////여기서 부턴 스토어///////////////////////
		
		//스토어  목록 리스트 가져오기
		public List<StoreVO> list_Store(Pagination2 page){
			
			return sqlSession.selectList("adminMapper.list_store",page);
		}
		//스토어 페이징 카운트
		public int store_Count() {
			return 	sqlSession.selectOne("adminMapper.store_Count");
		}
		
		
		//update 스토어 상태 -> 승인으로
		public int update_store(int store_idx) {
			
			return sqlSession.update("adminMapper.updateStore_State", store_idx);
		}
		
		//update 스토어 상태 -> 거절로
			public int update_store2(int store_idx) {
				
			return sqlSession.update("adminMapper.updateStore_State2", store_idx);
		}
		
		
		///제품 관리//
		//펀딩 목록 가져오기 상태 1인것만
		public List<FundingMainVO> pro_funding(Pagination page ){
			
			return sqlSession.selectList("adminMapper.productFunding",page);
		}
		public int pro_fundingCount() {
			return 	sqlSession.selectOne("adminMapper.pro_fundingCount");
		}
		
		//스토어 목록 가져오기 상태 1인것만
		public List<StoreVO> pro_store(Pagination2 page){
			
			return sqlSession.selectList("adminMapper.productStore",page);
		}
		//스토어 페이징 카운트
		public int pro_storeCount() {
			return 	sqlSession.selectOne("adminMapper.pro_storeCount");
		}
		
		
	
}
