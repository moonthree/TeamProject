package com.edu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.edu.vo.FundingCommunityVO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.FundingQnaVO;
import com.edu.vo.Funding_expressVO;
import com.edu.vo.Funding_optionVO;
import com.edu.vo.Funding_orderVO;
import com.edu.vo.Funding_order_optionVO;
import com.edu.vo.Funding_order_payVO;
import com.edu.vo.MemberVO;
import com.edu.vo.Pagination;
import com.edu.vo.ZzimVO;

public interface fundingMainService {
	
	//펀딩 메인 리스트
	List<FundingMainVO> listMain(FundingMainVO vo) throws Exception;
	/*
	 * List<FundingMainVO> listDog(Pagination page) throws Exception;
	 * List<FundingMainVO> listCat(Pagination page) throws Exception;
	 * List<FundingMainVO> listCat(FundingMainVO vo) throws Exception;
	 * List<FundingMainVO> listOther(Pagination page) throws Exception;
	 */
	//펀딩 메인 게시글 수
	public int listMainCount(FundingMainVO vo) throws Exception;
	
	/*
	 * public int listDogCount() throws Exception; public int listCatCount() throws
	 * Exception; public int listOtherCount() throws Exception;
	 */
	
	//펀딩 뷰
	public FundingMainVO read(int funding_idx) throws Exception;
	//오더 카운트
	public int orderCount(Funding_orderVO vo) throws Exception;
	
	//펀딩 커뮤니티 댓글 리스트
	List<FundingCommunityVO> readFundingCommunityComent(FundingCommunityVO fcvo) throws Exception;
	//펀딩 커뮤니티 댓글 작성
	public int writeFundingCommunityComment(FundingCommunityVO vo) throws Exception;
	//펀딩 커뮤니티 댓글 수정
	public void modifyFundingCommunityComment(FundingCommunityVO vo) throws Exception;
	//펀딩 커뮤니티 댓글 삭제
	public void deleteFundingCommunityComment(FundingCommunityVO vo) throws Exception;
	//펀딩 커뮤니티 댓글 갯수
	public int countFundingCommunityComment(FundingCommunityVO fcvo) throws Exception;
	
	//펀딩 qna 댓글 리스트
	List<FundingQnaVO> getQnaList(Map<String, Object> paramMap);
	//펀딩 qna 답글 리스트
	List<FundingQnaVO> getQnaAnswer(Map<String, Object> paramMap);
	//펀딩 QNA 댓글 작성
	public int qnaInsert(Map<String, Object> paramMap);
	//펀딩 qna 답변 작성 완료
	public int qnaAnswerDone(FundingQnaVO vo) throws Exception;
	//펀딩 qna 답변 수정
	public void qnaAnswerModify(FundingQnaVO vo) throws Exception;
	//펀딩 qna 삭제
	public void deleteFundingQna(FundingQnaVO vo) throws Exception;
	//펀딩 qna 수정
	public void modifyFundingQna(FundingQnaVO vo) throws Exception;
	//펀딩 qna 개수
	public int countFundingQna(FundingQnaVO vo) throws Exception;
	

	//찜 insert
	public int insertZzim(Map<String, Object> paramMap);
	//찜 select
	/* List<ZzimVO> selectZzim(Map<String, Object> paramMap); */
	public ZzimVO selectZzim2(Map<String, Integer> zzimMap);
	//찜 delete
	public int deleteZzim(Map<String, Object> paramMap);
	
	// 펀딩 옵션 리스트
	List<Funding_optionVO> list(Funding_optionVO vo);
	
	// 멤버 조회
	MemberVO selectOne(MemberVO vo);
	//펀딩 상품 등록
	int fun_reg(FundingMainVO vo);
	
	//펀딩 상품 등록후 옵션 등록
	int fun_option_reg(List<Funding_optionVO> vo);
	
	// 결제 예약
	// 주문 번호
	int insertOrder(Funding_orderVO ordervo);
	// 주문 옵션 정보 등록
	int insertOrderOption(Funding_order_optionVO orderOptionvo);
	// 배송 정보 등록
	int insertExpress(Funding_expressVO expressvo);
	// 결제 정보
	int insertPay(Funding_order_payVO payvo);
	// 결제 금액 합산
	void addPrice(Funding_orderVO ordervo);
	
	//펀딩 옵션 수량 감소 메소드
	int update_option(Funding_order_optionVO orderOptionvo);
	//펀딩 취소 시 옵션 수량 증가
	int update_option_plus(Funding_order_optionVO orderOptionvo);
	
	//펀딩 내용 가져오기 (modify.do 사용)
	FundingMainVO select_fundingOne(int funding_idx);
	
	//펀딩 옵션 가져오기 (modify.do 사용)
	List<Funding_optionVO> select_fundingOption(int funding_idx);
	
	//펀딩 옵션 수량 추가()
	int addStock(Funding_optionVO vo);
	
	//펀딩 제품 pdf 변경 메소드
	int update_content(HashMap<String, Object> map);
}
