package com.edu.vo;

import com.edu.vo.MemberVO;
public class ReplyVO extends CriteriaVO {
	private int reply_idx;
	private int sboard_idx;
	private int member_idx;
	private int parent_id;
	private int depth;
	private int reply_state;
	private int reply_secret;
	private String member_name;
	private String reply_content;
	private int reply_writer_idx;
	private String reply_regdate;
	
	
	private MemberVO memberVO;
	
	public int getReply_idx() {
		return reply_idx;
	}

	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}

	public int getSboard_idx() {
		return sboard_idx;
	}

	public void setSboard_idx(int sboard_idx) {
		this.sboard_idx = sboard_idx;
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

	public int getReply_state() {
		return reply_state;
	}

	public void setReply_state(int reply_state) {
		this.reply_state = reply_state;
	}

	public int getReply_secret() {
		return reply_secret;
	}

	public void setReply_secret(int reply_secret) {
		this.reply_secret = reply_secret;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public int getReply_writer_idx() {
		return reply_writer_idx;
	}

	public void setReply_writer_idx(int reply_writer_idx) {
		this.reply_writer_idx = reply_writer_idx;
	}

	public String getReply_regdate() {
		return reply_regdate;
	}

	public void setReply_regdate(String reply_regdate) {
		this.reply_regdate = reply_regdate;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	@Override
	public String toString() {
		return "ReplyVO [reply_idx=" + reply_idx + ", sboard_idx=" + sboard_idx + ", member_idx=" + member_idx
				+ ", parent_id=" + parent_id + ", depth=" + depth + ", reply_state=" + reply_state + ", reply_secret="
				+ reply_secret + ", member_name=" + member_name + ", reply_content=" + reply_content
				+ ", reply_writer_idx=" + reply_writer_idx + ", reply_regdate=" + reply_regdate + ", memberVO="
				+ memberVO + "]";
	}

	

	

	
}
