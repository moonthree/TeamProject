package com.edu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.edu.dao.memberDao;
import com.edu.dao.storeDAO;
import com.edu.vo.MemberVO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.StoreOptionVO;
import com.edu.vo.StoreReviewVO;
import com.edu.vo.StoreVO;
import com.edu.vo.ZzimVO;

@Service
public class StoreServiceImpl implements StoreService{

	@Autowired
	private storeDAO dao;
	
	@Autowired
	private memberDao memdao;
	
	// 스토어 메인
	// 스토어 메인 리스트
	@Override
	public List<StoreVO> listMain(StoreVO vo) throws Exception {
		ArrayList<StoreVO> listMain = (ArrayList<StoreVO>) dao.listMain(vo);
		return listMain;
	}
	//스토어 메인 카운트
	@Override
	public int listMainCount(StoreVO vo) throws Exception {
		int result = dao.listMainCount(vo);
		return result;
	}
	// 스토어 뷰
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public StoreVO read(int store_idx, int store_funding) throws Exception {
		HashMap<String,Integer> hm = new HashMap<String,Integer>();
		hm.put("store_idx", store_idx);
		hm.put("store_funding", store_funding);
		
		dao.storeViews(store_idx);
		return dao.read(hm);
	}
	//스토어 리뷰 리스트
	@Override
	public List<StoreReviewVO> storeReviewList(StoreReviewVO vo) throws Exception {
		ArrayList<StoreReviewVO> storeReviewList = (ArrayList<StoreReviewVO>) dao.storeReviewList(vo);
		return storeReviewList;
	}
	//스토어 리뷰 카운트
	@Override
	public int countStoreReviewList(StoreReviewVO vo) throws Exception {
		return dao.countStoreReviewList(vo);
	}
	//스토어 리뷰 사진만 가져오기
	@Override
	public List<StoreReviewVO> storeReviewPhoto(StoreReviewVO vo) throws Exception {
		ArrayList<StoreReviewVO> storeReviewPhoto = (ArrayList<StoreReviewVO>) dao.storeReviewPhoto(vo);
		return storeReviewPhoto;
	}
	//스토어 별점 평균
	@Override
	public Double starAvg(StoreReviewVO vo) throws Exception {
		return dao.starAvg(vo);
	}
	//스토어 별점 별 카운트
	@Override
	public int star5(StoreReviewVO vo) throws Exception {
		return dao.star5(vo);
	}
	@Override
	public int star4(StoreReviewVO vo) throws Exception {
		return dao.star4(vo);
	}
	@Override
	public int star3(StoreReviewVO vo) throws Exception {
		return dao.star3(vo);
	}
	@Override
	public int star2(StoreReviewVO vo) throws Exception {
		return dao.star2(vo);
	}
	@Override
	public int star1(StoreReviewVO vo) throws Exception {
		return dao.star1(vo);
	}
	//스토어 별점 별 카운트 끝
	//스토어 리뷰 작성
	@Override
	public int storeReviewWrite(StoreReviewVO vo) throws Exception {
		return dao.storeReviewWrite(vo);
	}
	//찜 select
	@Override
	public List<ZzimVO> selectZzimStore(Map<String, Object> paramMap) {
		return dao.selectZzimStore(paramMap);
	}
	//찜 delete
	@Override
	public int deleteZzimStore(Map<String, Object> paramMap) {
		return dao.deleteZzimStore(paramMap);
	}
	//스토어 리뷰 추천 하기
	@Override
	public int doReviewLike(Map<String, Object> paramMap) {
		return dao.doReviewLike(paramMap);
	}
	//스토어 리뷰 추천 수 증가
	@Override
	public int updateReviewLike(Map<String, Object> paramMap) {
		return dao.updateReviewLike(paramMap);
	}
	//리뷰 추천 개수 가져오기
	@Override
	public int getReviewLikeNum(Map<String, Object> paramMap) {
		return dao.getReviewLikeNum(paramMap);
	}
	//스토어 리뷰 추천 select
	@Override
	public List<StoreReviewVO> selectThumbsUp(Map<String, Object> paramMap) {
		return dao.selectThumbsUp(paramMap);
	}
	//리뷰 추천 취소
	@Override
	public int cancelLike(Map<String, Object> paramMap) {
		return dao.cancelLike(paramMap);
	}
	//리뷰 추천 감소
	@Override
	public int updateReviewLike2(Map<String, Object> paramMap) {
		return dao.updateReviewLike2(paramMap);
	}
	
	
	// 스토어 옵션 리스트
	@Override
	public List<StoreOptionVO> storeOptionList(StoreOptionVO vo) {
		return dao.storeOptionList(vo);
	}

	@Override
	public MemberVO selectOne(MemberVO vo) {
		return memdao.selectOne(vo);
	}
	
	
}

	
