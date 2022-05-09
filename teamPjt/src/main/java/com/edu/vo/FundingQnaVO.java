package com.edu.vo;
import com.edu.vo.MemberVO;

public class FundingQnaVO {
	private int funding_qna_idx;
	private int funding_idx;
	private int member_idx;
	private int parent_id;
	private int depth;
	private int funding_qna_state;
	private int funding_qna_secret;
	private String funding_qna_content;
	private int funding_qna_writer_idx;
	private String funding_qna_regdate;
	
	private MemberVO memberVO;
	
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public int getFunding_qna_idx() {
		return funding_qna_idx;
	}
	public void setFunding_qna_idx(int funding_qna_idx) {
		this.funding_qna_idx = funding_qna_idx;
	}
	public int getFunding_idx() {
		return funding_idx;
	}
	public void setFunding_idx(int funding_idx) {
		this.funding_idx = funding_idx;
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
	public int getFunding_qna_state() {
		return funding_qna_state;
	}
	public void setFunding_qna_state(int funding_qna_state) {
		this.funding_qna_state = funding_qna_state;
	}
	public int getFunding_qna_secret() {
		return funding_qna_secret;
	}
	public void setFunding_qna_secret(int funding_qna_secret) {
		this.funding_qna_secret = funding_qna_secret;
	}
	public String getFunding_qna_content() {
		return funding_qna_content;
	}
	public void setFunding_qna_content(String funding_qna_content) {
		this.funding_qna_content = funding_qna_content;
	}
	public int getFunding_qna_writer_idx() {
		return funding_qna_writer_idx;
	}
	public void setFunding_qna_writer_idx(int funding_qna_writer_idx) {
		this.funding_qna_writer_idx = funding_qna_writer_idx;
	}
	public String getFunding_qna_regdate() {
		return funding_qna_regdate;
	}
	public void setFunding_qna_regdate(String funding_qna_regdate) {
		this.funding_qna_regdate = funding_qna_regdate;
	}
	@Override
	public String toString() {
		return "FundingQnaVO [funding_qna_idx=" + funding_qna_idx + ", funding_idx=" + funding_idx + ", member_idx="
				+ member_idx + ", parent_id=" + parent_id + ", depth=" + depth + ", funding_qna_state="
				+ funding_qna_state + ", funding_qna_secret=" + funding_qna_secret + ", funding_qna_content="
				+ funding_qna_content + ", funding_qna_writer_idx=" + funding_qna_writer_idx + ", funding_qna_regdate="
				+ funding_qna_regdate + "]";
	}
	
	
}
