package com.edu.vo;
import com.edu.vo.MemberVO;

public class FundingCommunityVO {
	
	private int funding_detail_community_idx;
	private int funding_idx;
	private int member_idx;
	private String funding_detail_community_content;
	private String funding_detail_community_regdate;
	private int funding_detail_community_category;
	private MemberVO memberVO;
	
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public int getFunding_detail_community_idx() {
		return funding_detail_community_idx;
	}
	public void setFunding_detail_community_idx(int funding_detail_community_idx) {
		this.funding_detail_community_idx = funding_detail_community_idx;
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
	public String getFunding_detail_community_content() {
		return funding_detail_community_content;
	}
	public void setFunding_detail_community_content(String funding_detail_community_content) {
		this.funding_detail_community_content = funding_detail_community_content;
	}
	public String getFunding_detail_community_regdate() {
		return funding_detail_community_regdate;
	}
	public void setFunding_detail_community_regdate(String funding_detail_community_regdate) {
		this.funding_detail_community_regdate = funding_detail_community_regdate;
	}
	public int getFunding_detail_community_category() {
		return funding_detail_community_category;
	}
	public void setFunding_detail_community_category(int funding_detail_community_category) {
		this.funding_detail_community_category = funding_detail_community_category;
	}
	
	@Override
	public String toString() {
		return "FundingCommunityVO [funding_detail_community_idx=" + funding_detail_community_idx + ", funding_idx="
				+ funding_idx + ", member_idx=" + member_idx + ", funding_detail_community_content="
				+ funding_detail_community_content + ", funding_detail_community_regdate="
				+ funding_detail_community_regdate + ", funding_detail_community_category="
				+ funding_detail_community_category + "]";
	}
	
	
	

}
