package com.edu.vo;

public class MessageNoticeVO {
	//상대방의 정보 from_member
	private int member_idx;
	private String member_name;
	private String member_photo;
	
	//message_notice
	private int message_notice_idx;
	private int from_member_idx;
	private int to_member_idx;
	private int funding_idx;
	private int store_idx;
	private String f_or_s;
	private String message_content;
	private String message_notice_date;
	
	private String funding_thumbnail;
	private String store_thumbnail;
	
	
	
	
	public String getFunding_thumbnail() {
		return funding_thumbnail;
	}
	public void setFunding_thumbnail(String funding_thumbnail) {
		this.funding_thumbnail = funding_thumbnail;
	}
	public String getStore_thumbnail() {
		return store_thumbnail;
	}
	public void setStore_thumbnail(String store_thumbnail) {
		this.store_thumbnail = store_thumbnail;
	}
	
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
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
	public int getFunding_idx() {
		return funding_idx;
	}
	public void setFunding_idx(int funding_idx) {
		this.funding_idx = funding_idx;
	}
	public int getStore_idx() {
		return store_idx;
	}
	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}
	public String getF_or_s() {
		return f_or_s;
	}
	public void setF_or_s(String f_or_s) {
		this.f_or_s = f_or_s;
	}
	public int getFrom_member_idx() {
		return from_member_idx;
	}
	public void setFrom_member_idx(int from_member_idx) {
		this.from_member_idx = from_member_idx;
	}
	public int getTo_member_idx() {
		return to_member_idx;
	}
	public void setTo_member_idx(int to_member_idx) {
		this.to_member_idx = to_member_idx;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	
	public int getMessage_notice_idx() {
		return message_notice_idx;
	}
	public void setMessage_notice_idx(int message_notice_idx) {
		this.message_notice_idx = message_notice_idx;
	}
	public String getMessage_notice_date() {
		return message_notice_date;
	}
	public void setMessage_notice_date(String message_notice_date) {
		this.message_notice_date = message_notice_date;
	}
		
}
