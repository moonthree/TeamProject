package com.edu.vo;

public class StoreQnaVO {
	private int store_qna_idx;
	private int store_idx;
	private int member_idx;
	private int parent_id;
	private int depth;
	private int store_qna_state;
	private int store_qna_secret;
	private String store_qna_content;
	private int store_qna_writer_idx;
	private String store_qna_regdate;
	
	private MemberVO memberVO;
	private String member_name;
	private String member_business_name;
	
	private int startRowNumQna;
	private int rowCountQna;
	private int totalRowQna;
	private boolean prevQna;
	private boolean nextQna;
	
	
	
	public int getStartRowNumQna() {
		return startRowNumQna;
	}

	public void setStartRowNumQna(int startRowNumQna) {
		this.startRowNumQna = startRowNumQna;
	}

	public int getRowCountQna() {
		return rowCountQna;
	}

	public void setRowCountQna(int rowCountQna) {
		this.rowCountQna = rowCountQna;
	}

	public int getTotalRowQna() {
		return totalRowQna;
	}

	public void setTotalRowQna(int totalRowQna) {
		this.totalRowQna = totalRowQna;
	}

	public boolean isPrevQna() {
		return prevQna;
	}

	public void setPrevQna(boolean prevQna) {
		this.prevQna = prevQna;
	}

	public boolean isNextQna() {
		return nextQna;
	}

	public void setNextQna(boolean nextQna) {
		this.nextQna = nextQna;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_business_name() {
		return member_business_name;
	}

	public void setMember_business_name(String member_business_name) {
		this.member_business_name = member_business_name;
	}

	public int getStore_qna_idx() {
		return store_qna_idx;
	}

	public void setStore_qna_idx(int store_qna_idx) {
		this.store_qna_idx = store_qna_idx;
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

	public int getParent_id() {
		return parent_id;
	}

	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getStore_qna_state() {
		return store_qna_state;
	}

	public void setStore_qna_state(int store_qna_state) {
		this.store_qna_state = store_qna_state;
	}

	public int getStore_qna_secret() {
		return store_qna_secret;
	}

	public void setStore_qna_secret(int store_qna_secret) {
		this.store_qna_secret = store_qna_secret;
	}

	public String getStore_qna_content() {
		return store_qna_content;
	}

	public void setStore_qna_content(String store_qna_content) {
		this.store_qna_content = store_qna_content;
	}

	public int getStore_qna_writer_idx() {
		return store_qna_writer_idx;
	}

	public void setStore_qna_writer_idx(int store_qna_writer_idx) {
		this.store_qna_writer_idx = store_qna_writer_idx;
	}

	public String getStore_qna_regdate() {
		return store_qna_regdate;
	}

	public void setStore_qna_regdate(String store_qna_regdate) {
		this.store_qna_regdate = store_qna_regdate;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	@Override
	public String toString() {
		return "StoreQnaVO [store_qna_idx=" + store_qna_idx + ", store_idx=" + store_idx + ", member_idx=" + member_idx
				+ ", parent_id=" + parent_id + ", depth=" + depth + ", store_qna_state=" + store_qna_state
				+ ", store_qna_secret=" + store_qna_secret + ", store_qna_content=" + store_qna_content
				+ ", store_qna_writer_idx=" + store_qna_writer_idx + ", store_qna_regdate=" + store_qna_regdate
				+ ", memberVO=" + memberVO + "]";
	}
	
	
	
}
