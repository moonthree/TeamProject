package com.edu.service;

import java.util.List;

import com.edu.vo.MemberVO;
import com.edu.vo.StoreOptionVO;
import com.edu.vo.StoreReviewVO;
import com.edu.vo.StoreVO;

public interface StoreService {

	// 스토어 메인
	//스토어 메인 리스트
	List<StoreVO> listMain(StoreVO vo) throws Exception;
	//스토어 메인 게시글 수
	public int listMainCount(StoreVO vo) throws Exception;
	// 스토어 뷰
	public StoreVO read(int store_idx, int store_funding) throws Exception;
	// 스토어 리뷰 리스트
	List<StoreReviewVO> storeReviewList(StoreReviewVO vo) throws Exception;
	// 스토어 리뷰 카운트
	public int countStoreReviewList(StoreReviewVO vo) throws Exception;
	// 스토어 별점 평균
	public Double starAvg(StoreReviewVO vo) throws Exception;
	// 스토어 별점 별 카운트
	public int star5(StoreReviewVO vo) throws Exception;
	public int star4(StoreReviewVO vo) throws Exception;
	public int star3(StoreReviewVO vo) throws Exception;
	public int star2(StoreReviewVO vo) throws Exception;
	public int star1(StoreReviewVO vo) throws Exception;
	// 스토어 별점 별 카운트 끝
	// 스토어 리뷰 작성
	public int storeReviewWrite(StoreReviewVO vo) throws Exception;
	
	// 스토어 옵션 리스트
	List<StoreOptionVO> storeOptionList(StoreOptionVO vo);
	//멤버조회
	MemberVO selectOne(MemberVO vo);

}