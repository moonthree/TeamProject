package com.edu.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.edu.dao.fundingMainDAO;
import com.edu.dao.memberDao;
import com.edu.vo.FundingCommunityVO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.Funding_optionVO;
import com.edu.vo.Funding_orderVO;
import com.edu.vo.Funding_order_optionVO;
import com.edu.vo.MemberVO;
import com.edu.vo.Pagination;

@Service
public class fundingMainServiceImpl implements fundingMainService{
	
	@Autowired
	private fundingMainDAO dao;
	
	@Autowired
	private memberDao memdao;
	
	//펀딩 메인 리스트
	@Override
	public List<FundingMainVO> listDog(Pagination page) throws Exception {
		return dao.listDog(page);
	}
	@Override
	public List<FundingMainVO> listCat(Pagination page) throws Exception {
		return dao.listCat(page);
	}
	@Override
	public List<FundingMainVO> listOther(Pagination page) throws Exception {
		return dao.listOther(page);
	}

		
	//게시물 총 갯수
	@Override
	public int listDogCount() throws Exception {
		return dao.listDogCount();
	}
	@Override
	public int listCatCount() throws Exception {
		return dao.listCatCount();
	}
	@Override
	public int listOtherCount() throws Exception {
		return dao.listOtherCount();
	}
	
	//펀딩 뷰
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public FundingMainVO read(int funding_idx) throws Exception {
		dao.fundingViews(funding_idx);
		return dao.read(funding_idx);
	}
	
	@Override
	//펀딩 커뮤니티 댓글 리스트
	public List<FundingCommunityVO> readFundingCommunityComent(int funding_idx) throws Exception{
		return dao.readFundingCommunityComent(funding_idx);
	}
	//펀딩 커뮤니티 댓글 작성
	@Override
	public int writeFundingCommunityComment(FundingCommunityVO vo) throws Exception {
		return dao.writeFundingCommunityComment(vo);
	}
	
	// 펀딩 옵션
	@Override
	public List<Funding_optionVO> list(Funding_optionVO vo) {
		return dao.list(vo);
	}
	@Override
	public MemberVO selectOne(MemberVO vo) {
		return memdao.selectOne(vo);
	}
	
	// 결제 예약
	// 주문 번호
	@Override
	public int insertOrder(Funding_orderVO ordervo) {
		return dao.insertOrder(ordervo);
	}
	// 주문 옵션 정보 등록
	@Override
	public int insertOption(Funding_order_optionVO orderOptionvo) {
		return dao.insertOption(orderOptionvo);
	}
		
}
