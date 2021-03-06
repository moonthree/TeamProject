package com.edu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.vo.FundingCommunityVO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.FundingQnaVO;
import com.edu.vo.Funding_expressVO;
import com.edu.vo.Funding_optionVO;
import com.edu.vo.Funding_orderVO;
import com.edu.vo.Funding_order_optionVO;
import com.edu.vo.Funding_order_payVO;
import com.edu.vo.Pagination;
import com.edu.vo.ZzimVO;

@Repository
public class fundingMainDAO {
	
	@Autowired
	private SqlSession sqlSession;
	//펀딩 메인페이지
	public List<FundingMainVO> listMain(FundingMainVO vo) throws Exception{
		return sqlSession.selectList("FundingMainMapper.listMain", vo);
	}
	
	// 펀딩 총 갯수
	public int listMainCount(FundingMainVO vo) throws Exception{
		return sqlSession.selectOne("FundingMainMapper.listMainCount", vo);
	}
	
	// 게시물 조회
	public FundingMainVO read(int funding_idx) throws Exception{
		return sqlSession.selectOne("FundingMainMapper.read", funding_idx);
	}
	
	//펀딩 조회수
	public void fundingViews(int funding_idx) throws Exception{
		sqlSession.update("FundingMainMapper.fundingViews", funding_idx);
	}
	//오더 카운트
	public int orderCount(Funding_orderVO vo) throws Exception{
		return sqlSession.selectOne("FundingMainMapper.orderCount", vo);
	}
	//펀딩 커뮤니티 댓글 리스트
	public List<FundingCommunityVO> readFundingCommunityComent(FundingCommunityVO fcvo) throws Exception{
		return sqlSession.selectList("FundingMainMapper.readFundingCommunityComment", fcvo);
	}
	//펀딩 커뮤니티 댓글 작성
	public int writeFundingCommunityComment(FundingCommunityVO vo) throws Exception{
		return sqlSession.insert("FundingMainMapper.writeFundingCommunityComment", vo);
	}
	//펀딩 커뮤니티 댓글 수정
	public void modifyFundingCommunityComment(FundingCommunityVO vo) throws Exception{
		sqlSession.update("FundingMainMapper.modifyFundingCommunityComment", vo);	
	}
	//펀딩 커뮤니티 댓글 삭제
	public void deleteFundingCommunityComment(FundingCommunityVO vo) throws Exception{
		sqlSession.delete("FundingMainMapper.deleteFundingCommunityComment", vo);	
	}
	//펀딩 커뮤니티 댓글 개수
	public int countFundingCommunityComment(FundingCommunityVO fcvo) throws Exception{ 
		return sqlSession.selectOne("FundingMainMapper.countFundingCommunityComment", fcvo); 
	}
		 
	
	//펀딩 qna 리스트
	public List<FundingQnaVO> getQnaList(Map<String, Object> paramMap) {
		return sqlSession.selectList("FundingMainMapper.readFundingQnaList", paramMap);
	}
	//펀딩 qna 답변 리스트
	public List<FundingQnaVO> getQnaAnswer(Map<String, Object> paramMap) {
		return sqlSession.selectList("FundingMainMapper.readFundingQnaAnswer", paramMap);
	}
	
	//펀딩 qna 작성
	public int qnaInsert(Map<String, Object> paramMap) {
		return sqlSession.insert("FundingMainMapper.insertFundingQna", paramMap);
	}
	//펀딩 qna 답변 작성 완료
	public int qnaAnswerDone(FundingQnaVO vo) throws Exception{
		return sqlSession.update("FundingMainMapper.qnaAnswerDone", vo);
	}
	//펀딩 qna 답변 수정
	public void qnaAnswerModify(FundingQnaVO vo) throws Exception{
		sqlSession.update("FundingMainMapper.qnaAnswerModify", vo);	
	}
	//펀딩 QNA 삭제
	public void deleteFundingQna(FundingQnaVO vo) throws Exception{
		sqlSession.delete("FundingMainMapper.deleteFundingQna", vo);
	}
	//펀딩 qna 수정
	public void modifyFundingQna(FundingQnaVO vo) throws Exception{
		sqlSession.update("FundingMainMapper.modifyFundingQna", vo);	
	}
	//펀딩 qna 개수
	public int countFundingQna(FundingQnaVO vo) throws Exception{ 
		return sqlSession.selectOne("FundingMainMapper.countFundingQna", vo); 
	}
	
	
	//zzim 등록
	public int insertZzim(Map<String, Object> paramMap) {
		return sqlSession.insert("FundingMainMapper.insertZzim", paramMap);
	}
	//zzim select
	/*
	 * public List<ZzimVO> selectZzim(Map<String, Object> paramMap) { return
	 * sqlSession.selectList("FundingMainMapper.selectZzim", paramMap); }
	 */
	public ZzimVO selectZzim2(Map<String, Integer> zzimMap) {
		return sqlSession.selectOne("FundingMainMapper.selectZzim2", zzimMap);
	}
	
	
	//zzim 삭제
	public int deleteZzim(Map<String, Object> paramMap) {
		return sqlSession.delete("FundingMainMapper.deleteZzim", paramMap);
	}
	
	
	// 펀딩 옵션
	public List<Funding_optionVO> list(Funding_optionVO vo){
		return sqlSession.selectList("FundingMainMapper.list", vo);
	}
	
	//펀딩 등록
	public int fun_reg(FundingMainVO vo) {
		return sqlSession.insert("Funding_reg",vo);
	}
	
	// 펀딩 상품 등록 후 옵션 등록 메소드
	public int fun_option_reg(List<Funding_optionVO> vo) {
		
		return sqlSession.insert("FundingMainMapper.insListOption",vo);
	}
	
	// 결제 예약
	// 주문 번호
	public int insertOrder(Funding_orderVO ordervo) {
		return sqlSession.insert("FundingMainMapper.insertOrder", ordervo);
	}
	// 주문 옵션 정보 등록
	public int insertOrderOption(Funding_order_optionVO orderOptionvo) {
		return sqlSession.insert("FundingMainMapper.insertOrderOption", orderOptionvo);
	}
	// 배송지 정보
	public int insertExpress(Funding_expressVO expressvo) {
		return sqlSession.insert("FundingMainMapper.insertExpress", expressvo);
	}
	// 결제 정보
	public int insertPay(Funding_order_payVO payvo) {
		return sqlSession.insert("FundingMainMapper.insertPay", payvo);
	}
	// 결제 금액 합산
	public void addPrice(Funding_orderVO ordervo) {
		sqlSession.update("FundingMainMapper.addPrice", ordervo);
	}
	//옵션 수량 감소 메소드
	public int update_option(Funding_order_optionVO opderOptionvo) {
		
		return sqlSession.update("FundingMainMapper.update_option", opderOptionvo);
	}
	//펀딩 취소 시 옵션 수량 증가
	public int update_option_plus(Funding_order_optionVO opderOptionvo) {
		
		return sqlSession.update("FundingMainMapper.update_option_plus", opderOptionvo);
	}
	//펀딩 내용 가져오기 (modify.do 사용)
	public FundingMainVO select_fundingOne(int funding_idx) {
		return sqlSession.selectOne("FundingMainMapper.funding_one", funding_idx);
	}
	
	//펀딩 옵션 가져오기 (modify.do 사용)
	public List<Funding_optionVO> select_fundingOption(int funding_idx) {
		
		return sqlSession.selectList("FundingMainMapper.fundingOption_list",funding_idx);
	}
	
	//펀딩 옵션 수량 증가 메소드
	public int  addStock(Funding_optionVO vo) {
		return sqlSession.update("FundingMainMapper.fundingOption_plus", vo);
	}
	
	//펀딩 제품 pdf 업데이트
	public int update_content(HashMap<String, Object> map) {
		return sqlSession.update("FundingMainMapper.funding_file_update",map);
		
	}
	
	
}
