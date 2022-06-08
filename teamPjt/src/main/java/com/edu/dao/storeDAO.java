package com.edu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.Funding_order_payVO;
import com.edu.vo.StoreExpressVO;
import com.edu.vo.StoreOptionVO;
import com.edu.vo.StoreOrderOptionVO;
import com.edu.vo.StoreOrderPayVO;
import com.edu.vo.StoreOrderVO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.FundingQnaVO;
import com.edu.vo.Funding_optionVO;
import com.edu.vo.StoreOptionVO;
import com.edu.vo.StoreQnaVO;
import com.edu.vo.StoreReviewLikeVO;
import com.edu.vo.StoreReviewVO;
import com.edu.vo.StoreVO;
import com.edu.vo.ZzimVO;

@Repository
public class storeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 스토어 메인 리스트
	public List<StoreVO> listMain(StoreVO vo) throws Exception{
		return sqlSession.selectList("StoreMapper.listMain", vo);
	}
	// 스토어 총 갯수
	public int listMainCount(StoreVO vo) throws Exception{
		return sqlSession.selectOne("StoreMapper.listMainCount", vo);
	}
	//스토어 조회수
	public void storeViews(int store_idx) throws Exception{
		sqlSession.update("StoreMapper.storeViews", store_idx);
	}
	// 스토어 뷰
	public StoreVO read(HashMap<String, Integer> hm) throws Exception{
		return sqlSession.selectOne("StoreMapper.read", hm);
	}
	// 스토어 리뷰 리스트
	public List<StoreReviewVO> storeReviewList(StoreReviewVO vo) throws Exception{
		return sqlSession.selectList("StoreMapper.storeReviewList", vo);
	}
	public List<StoreReviewVO> storeReviewList2(StoreReviewVO vo) throws Exception{
		return sqlSession.selectList("StoreMapper.storeReviewList2", vo);
	}
	// 스토어 리뷰 카운트
	public int countStoreReviewList(StoreReviewVO vo) throws Exception{
		return sqlSession.selectOne("StoreMapper.countStoreReviewList", vo);
	}
	// 스토어 리뷰 사진만 가져오기
	public List<StoreReviewVO> storeReviewPhoto(StoreReviewVO vo) throws Exception{
		return sqlSession.selectList("StoreMapper.storeReviewPhoto", vo);
	}
	// 스토어 리뷰 수정에 가져가기
	public StoreReviewVO getReview(HashMap<String, Integer> hm){
		return sqlSession.selectOne("StoreMapper.getReview", hm);
	}
	
	// 스토어 리뷰 평균
	public Double starAvg(StoreReviewVO vo) throws Exception{
		return sqlSession.selectOne("StoreMapper.starAvg", vo);
	}
	//<!-- 스토어 별점 별 카운트 -->
	public int star5(StoreReviewVO vo) throws Exception{
		return sqlSession.selectOne("StoreMapper.star5", vo);
	}
	public int star4(StoreReviewVO vo) throws Exception{
		return sqlSession.selectOne("StoreMapper.star4", vo);
	}
	public int star3(StoreReviewVO vo) throws Exception{
		return sqlSession.selectOne("StoreMapper.star3", vo);
	}
	public int star2(StoreReviewVO vo) throws Exception{
		return sqlSession.selectOne("StoreMapper.star2", vo);
	}
	public int star1(StoreReviewVO vo) throws Exception{
		return sqlSession.selectOne("StoreMapper.star1", vo);
	}
	//<!-- 스토어 별점 별 카운트 끝 -->
	//스토어 리뷰 작성
	public int storeReviewWrite(StoreReviewVO vo) throws Exception{
		return sqlSession.insert("StoreMapper.storeReviewWrite", vo);
	}
	//스토어 리뷰 수정
	public int storeReviewModify(StoreReviewVO vo) throws Exception{
		return sqlSession.update("StoreMapper.storeReviewModify", vo);
	}
	// 스토어 리뷰 삭제
	public void storeReviewDelete(StoreReviewVO vo){
		sqlSession.delete("StoreMapper.storeReviewDelete", vo);
	}
	// 스토어 리뷰 관리자 삭제
	public void storeReviewLikeAdminDelete(StoreReviewLikeVO vo){
		sqlSession.delete("StoreMapper.storeReviewLikeAdminDelete", vo);
	}
	public void storeReviewAdminDelete(StoreReviewVO vo){
		sqlSession.delete("StoreMapper.storeReviewAdminDelete", vo);
	}
	//zzim select
	public ZzimVO selectZzimStore(Map<String, Integer> zzimMap) {
		return sqlSession.selectOne("StoreMapper.selectZzimStore", zzimMap);
	}
	//zzim 삭제
	public int deleteZzimStore(Map<String, Object> paramMap) {
		return sqlSession.delete("StoreMapper.deleteZzimStore", paramMap);
	}
	//리뷰 추천 insert
	public int doReviewLike(Map<String, Object> paramMap) {
		return sqlSession.insert("StoreMapper.doReviewLike", paramMap);
	}
	//리뷰 추천 증가 update
	public int updateReviewLike(Map<String, Object> paramMap) {
		return sqlSession.update("StoreMapper.updateReviewLike", paramMap);
	}
	//리뷰 추천 개수 가져오기
	public int getReviewLikeNum(Map<String, Object> paramMap) {
		return sqlSession.selectOne("StoreMapper.getReviewLikeNum", paramMap);
	}
	//리뷰 추천 select
	public List<StoreReviewVO> selectThumbsUp(Map<String, Object> paramMap) {
		return sqlSession.selectList("StoreMapper.selectThumbsUp", paramMap);
	}
	//리뷰 추천 취소 delete
	public int cancelLike(Map<String, Object> paramMap) {
		return sqlSession.delete("StoreMapper.cancelLike", paramMap);
	}
	//리뷰 추천 수 감소
	public int updateReviewLike2(Map<String, Object> paramMap) {
		return sqlSession.update("StoreMapper.updateReviewLike2", paramMap);
	}
//스토어 qna 시작
	//스토어 qna 리스트
	public List<StoreQnaVO> getQnaList(Map<String, Object> paramMap) {
		return sqlSession.selectList("StoreMapper.readStoreQnaList", paramMap);
	}
	//스토어 qna 답변 리스트
	public List<StoreQnaVO> getQnaAnswer(Map<String, Object> paramMap) {
		return sqlSession.selectList("StoreMapper.readStoreQnaAnswer", paramMap);
	}
	
	//스토어 qna 작성
	public int qnaInsert(Map<String, Object> paramMap) {
		return sqlSession.insert("StoreMapper.insertStoreQna", paramMap);
	}
	//스토어 qna 답변 작성 완료
	public int qnaAnswerDone(StoreQnaVO vo) throws Exception{
		return sqlSession.update("StoreMapper.qnaAnswerDone", vo);
	}
	//스토어 qna 답변 수정
	public void qnaAnswerModify(StoreQnaVO vo) throws Exception{
		sqlSession.update("StoreMapper.qnaAnswerModify", vo);	
	}
	//스토어 QNA 삭제
	public void deleteStoreQna(StoreQnaVO vo) throws Exception{
		sqlSession.delete("StoreMapper.deleteStoreQna", vo);
	}
	//스토어 qna 수정
	public void modifyStoreQna(StoreQnaVO vo) throws Exception{
		sqlSession.update("StoreMapper.modifyStoreQna", vo);	
	}
	//스토어 qna 개수
	public int countStoreQna(StoreQnaVO vo) throws Exception{ 
		return sqlSession.selectOne("StoreMapper.countStoreQna", vo); 
	}
//스토어 qna 끝
	
	// 스토어 옵션 리스트
	public List<StoreOptionVO> storeOptionList(StoreOptionVO vo) {
		return sqlSession.selectList("StoreMapper.storeOptionList", vo);
	}
	
	//스토어 제품 있는지 체크 -> mypage2 에서 ajax로 넘어옴
	public int store_Check(int funding_idx) {
		
		return sqlSession.selectOne("StoreMapper.store_Check", funding_idx);
	}
	//스토어 제품 등록 -> 단독 스토어 제품 등록
	public int store_reg(StoreVO vo) {
		
		return sqlSession.insert("StoreMapper.store_Reg",vo);
	}
	//스토어 제품 등록 -> 펀딩 성공 후  스토어 제품 등록
	public int store_reg2(StoreVO vo) {
			
		return sqlSession.insert("StoreMapper.store_Reg2",vo);
	}
	
	//스토어 옵션제품 옵션 등록
	public int storeOptionReg(List<StoreOptionVO> vo) {
		
		return sqlSession.insert("StoreMapper.StoreOption_Reg", vo);
	}
	
	// 결제
	// 주문 번호
	public int insertOrder(StoreOrderVO ordervo) {
		return sqlSession.insert("StoreMapper.insertOrder", ordervo);
	}
	// 주문 옵션 정보 등록
	public int insertOrderOption(StoreOrderOptionVO orderoptionvo) {
		return sqlSession.insert("StoreMapper.insertOrderOption", orderoptionvo);
	}
	// 배송지 정보
	public int insertExpress(StoreExpressVO expressvo) {
		return sqlSession.insert("StoreMapper.insertExpress", expressvo);
	}
	// 결제 정보
	public int insertPay(StoreOrderPayVO payvo) {
		return sqlSession.insert("StoreMapper.insertPay", payvo);
	}
	// 주문 완료 - 주문 정보
	public StoreVO store_info(int store_idx) {
		return sqlSession.selectOne("StoreMapper.store_info", store_idx);
	}
	//옵션 수량 감소 메소드
	public int update_option(StoreOrderOptionVO orderoptionvo) {
		return sqlSession.update("StoreMapper.update_option", orderoptionvo);
	}
	// 스토어 옵션 수량 복구 메소드 (주문 취소 시)
	public int update_option_cancel(StoreOrderOptionVO orderoptionvo) {
		return sqlSession.update("StoreMapper.update_option_cancel", orderoptionvo);
	}
	//옵션 수량 추가 메소드
	public int  addStock(StoreOptionVO vo) {
		return sqlSession.update("StoreMapper.storeOption_plus", vo);
	}
	//select one
	public StoreVO selectStoreOne(int store_idx) {
		return sqlSession.selectOne("StoreMapper.storeSelectOne", store_idx);
	}
	//스토어 파일 업데이트 메소드
	public int store_updateFile(HashMap<String, Object> map) {
		return sqlSession.update("StoreMapper.store_file_update", map);
	}
}
