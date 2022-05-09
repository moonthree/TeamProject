package com.edu.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.edu.dao.fundingMainDAO;
import com.edu.dao.memberDao;
import com.edu.vo.FundingCommunityVO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.FundingOrderVO;
import com.edu.vo.FundingQnaVO;
import com.edu.vo.Funding_optionVO;
import com.edu.vo.MemberVO;
import com.edu.vo.Pagination;
import com.edu.vo.ZzimVO;

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
	//오더 카운트
	@Override
	public int orderCount(FundingOrderVO vo) throws Exception {
		return dao.orderCount(vo);
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
	//펀딩 커뮤니티 댓글 수정
	@Override
	public void modifyFundingCommunityComment(FundingCommunityVO vo) throws Exception {
		dao.modifyFundingCommunityComment(vo);
	}
	//펀딩 커뮤니티 댓글 삭제
	@Override
	public void deleteFundingCommunityComment(FundingCommunityVO vo) throws Exception {
		dao.deleteFundingCommunityComment(vo);
	}
	
	// 펀딩 qna 댓글 리스트
	@Override
	public List<FundingQnaVO> getQnaList(Map<String, Object> paramMap) {
		//mysql에서 계층적 쿼리 처리가 어려우니 여기서 해결 -> 답변형 게시판 위해서
		List<FundingQnaVO> fundingQnaList = dao.getQnaList(paramMap);
		
		//부모
		List<FundingQnaVO> fundingQnaListParent = new ArrayList<FundingQnaVO>();
		//자식
		List<FundingQnaVO> fundingQnaListChild = new ArrayList<FundingQnaVO>();
		//통합
		List<FundingQnaVO> fundingQnaListNew = new ArrayList<FundingQnaVO>();
		
		//1. 부모와 자식 분리
		for(FundingQnaVO fundingQnaVO: fundingQnaList) {
			if(fundingQnaVO.getDepth() == 0) {
				fundingQnaListParent.add(fundingQnaVO);
			}else {
				fundingQnaListChild.add(fundingQnaVO);
			}
		}
		
		//2. 부모를 돌린다.
		for(FundingQnaVO fundingQnaParent: fundingQnaListParent) {
			//2-1. 부모는 무조건 넣는다.
			fundingQnaListNew.add(fundingQnaParent);
			
			//3. 자식을 돌린다.
			for(FundingQnaVO fundingQnaChild: fundingQnaListChild) {
				//3-1. 부모의 자식인 것들만 넣는다.
				if(fundingQnaParent.getFunding_qna_idx() == fundingQnaChild.getParent_id()){
					fundingQnaListNew.add(fundingQnaChild);
				}
			}
		}
		
		//정리한 list return
		return fundingQnaListNew;
	}
	

	
	
	//펀딩 qna 작성
	@Override
	public int qnaInsert(Map<String, Object> paramMap) {
		return dao.qnaInsert(paramMap);
	}
	// 펀딩 qna 답변 작성 완료
	@Override
	public int qnaAnswerDone(FundingQnaVO vo) throws Exception {
		return dao.qnaAnswerDone(vo);
	}
	// 펀딩 qna 삭제
	@Override
	public void deleteFundingQna(FundingQnaVO vo) throws Exception {
		dao.deleteFundingQna(vo);
	}
	// 펀딩 qna 수정

	@Override
	public void modifyFundingQna(FundingQnaVO vo) throws Exception {
		dao.modifyFundingQna(vo);
	}
	
	 // insert찜
	@Override
	public int insertZzim(Map<String, Object> paramMap) {
		return dao.insertZzim(paramMap);
	}
	//select찜
	@Override
	public List<ZzimVO> selectZzim(Map<String, Object> paramMap) {
		return dao.selectZzim(paramMap);
	}
	// delete 찜

	@Override
	public int deleteZzim(Map<String, Object> paramMap) {
		return dao.deleteZzim(paramMap);
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
	@Override
	public int fun_reg(FundingMainVO vo) {
		
		return dao.fun_reg(vo);
	}
	
	
}
