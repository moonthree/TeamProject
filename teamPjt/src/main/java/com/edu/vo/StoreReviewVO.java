package com.edu.vo;

public class StoreReviewVO {
	
	private int store_review_idx;
	private int store_idx;
	private int member_idx;
	private int store_order_idx;
	private int store_review_star;
	private int store_review_like;
	private String store_review_content;
	private String store_review_regdate;
	private String store_review_option;
	private String store_review_photo1;
	private String store_review_photo2;
	private String store_review_photo3;
	private String store_review_photo4;
	private String store_review_photo5;
	
	private MemberVO memberVO;
	private String member_name;
	private String member_photo;
	
	//페이징 용도
	private int startRowNum;
	private int rowCount;
	private int totalRow;
	private boolean prev;
	private boolean next;

	private String sortReviewLike;
	private String sortReviewNew;
	private String sortReviewHighStar;
	private String sortReviewLowStar;
	
	
	
	
	public String getSortReviewLike() {
		return sortReviewLike;
	}
	public void setSortReviewLike(String sortReviewLike) {
		this.sortReviewLike = sortReviewLike;
	}
	public String getSortReviewNew() {
		return sortReviewNew;
	}
	public void setSortReviewNew(String sortReviewNew) {
		this.sortReviewNew = sortReviewNew;
	}
	public String getSortReviewHighStar() {
		return sortReviewHighStar;
	}
	public void setSortReviewHighStar(String sortReviewHighStar) {
		this.sortReviewHighStar = sortReviewHighStar;
	}
	public String getSortReviewLowStar() {
		return sortReviewLowStar;
	}
	public void setSortReviewLowStar(String sortReviewLowStar) {
		this.sortReviewLowStar = sortReviewLowStar;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_photo() {
		return member_photo;
	}
	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}
	public int getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	public int getTotalRow() {
		return totalRow;
	}
	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	
	public int getStore_review_idx() {
		return store_review_idx;
	}
	public void setStore_review_idx(int store_review_idx) {
		this.store_review_idx = store_review_idx;
	}
	public int getStore_idx() {
		return store_idx;
	}
	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getStore_review_star() {
		return store_review_star;
	}
	public void setStore_review_star(int store_review_star) {
		this.store_review_star = store_review_star;
	}
	public int getStore_review_like() {
		return store_review_like;
	}
	public void setStore_review_like(int store_review_like) {
		this.store_review_like = store_review_like;
	}
	public String getStore_review_content() {
		return store_review_content;
	}
	public void setStore_review_content(String store_review_content) {
		this.store_review_content = store_review_content;
	}
	public String getStore_review_regdate() {
		return store_review_regdate;
	}
	public void setStore_review_regdate(String store_review_regdate) {
		this.store_review_regdate = store_review_regdate;
	}
	public String getStore_review_photo1() {
		return store_review_photo1;
	}
	public void setStore_review_photo1(String store_review_photo1) {
		this.store_review_photo1 = store_review_photo1;
	}
	public String getStore_review_photo2() {
		return store_review_photo2;
	}
	public void setStore_review_photo2(String store_review_photo2) {
		this.store_review_photo2 = store_review_photo2;
	}
	public String getStore_review_photo3() {
		return store_review_photo3;
	}
	public void setStore_review_photo3(String store_review_photo3) {
		this.store_review_photo3 = store_review_photo3;
	}
	public String getStore_review_photo4() {
		return store_review_photo4;
	}
	public void setStore_review_photo4(String store_review_photo4) {
		this.store_review_photo4 = store_review_photo4;
	}
	public String getStore_review_photo5() {
		return store_review_photo5;
	}
	public void setStore_review_photo5(String store_review_photo5) {
		this.store_review_photo5 = store_review_photo5;
	}
	@Override
	public String toString() {
		return "Store_reviewVO [store_review_idx=" + store_review_idx + ", store_idx=" + store_idx + ", member_idx="
				+ member_idx + ", store_review_star=" + store_review_star + ", store_review_like=" + store_review_like
				+ ", store_review_content=" + store_review_content + ", store_review_regdate=" + store_review_regdate
				+ ", store_review_photo1=" + store_review_photo1 + ", store_review_photo2=" + store_review_photo2
				+ ", store_review_photo3=" + store_review_photo3 + ", store_review_photo4=" + store_review_photo4
				+ ", store_review_photo5=" + store_review_photo5 + "]";
	}
	public String getStore_review_option() {
		return store_review_option;
	}
	public void setStore_review_option(String store_review_option) {
		this.store_review_option = store_review_option;
	}
	public int getStore_order_idx() {
		return store_order_idx;
	}
	public void setStore_order_idx(int store_order_idx) {
		this.store_order_idx = store_order_idx;
	}
	
	
	

}
