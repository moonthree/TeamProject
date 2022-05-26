package com.edu.vo;

public class ServiceVO {
	private int sboard_idx;
	private String sboard_title;
	private String sboard_content;
	private String sboard_regdate;
	private String admin;
	private String member_name;
	private int member_idx;
	
	public int getSboard_idx() {
		return sboard_idx;
	}
	public void setSboard_idx(int sboard_idx) {
		this.sboard_idx = sboard_idx;
	}
	public String getSboard_title() {
		return sboard_title;
	}
	public void setSboard_title(String sboard_title) {
		this.sboard_title = sboard_title;
	}
	public String getSboard_content() {
		return sboard_content;
	}
	public void setSboard_content(String sboard_content) {
		this.sboard_content = sboard_content;
	}
	public String getSboard_regdate() {
		return sboard_regdate;
	}
	public void setSboard_regdate(String sboard_regdate) {
		this.sboard_regdate = sboard_regdate;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	@Override
	public String toString() {
		return "ServiceVO [sboard_idx=" + sboard_idx + ", sboard_title=" + sboard_title + ", sboard_content="
				+ sboard_content + ", sboard_regdate=" + sboard_regdate + ", admin=" + admin + ", member_name="
				+ member_name + "]";
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	
	
}
