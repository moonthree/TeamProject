package com.edu.vo;

import java.util.Date;

public class MessageVO {
	//상대방의 정보 from_member
	private int member_idx;
	private String member_name;
	private String member_photo;
	
	//message
	private int message_idx;
	private int funding_idx;
	private int store_idx;
	private char f_or_s;
	private int message_category;
	private String message_date;
	
	//message_note
	private int message_note_idx;
	private int from_member_idx;
	private int to_member_idx;
	private String message_content;
	private String message_photo;
	private char c_or_p;
	private String message_note_date;
	
	//message_notice
	private int message_notice_idx;
	private String message_notice_date;
	
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
	public int getMessage_idx() {
		return message_idx;
	}
	public void setMessage_idx(int message_idx) {
		this.message_idx = message_idx;
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
	public char getF_or_s() {
		return f_or_s;
	}
	public void setF_or_s(char f_or_s) {
		this.f_or_s = f_or_s;
	}
	public int getMessage_category() {
		return message_category;
	}
	public void setMessage_category(int message_category) {
		this.message_category = message_category;
	}
	public String getMessage_date() {
		return message_date;
	}
	public void setMessage_date(String message_date) {
		this.message_date = message_date;
	}
	public int getMessage_note_idx() {
		return message_note_idx;
	}
	public void setMessage_note_idx(int message_note_idx) {
		this.message_note_idx = message_note_idx;
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
	public String getMessage_photo() {
		return message_photo;
	}
	public void setMessage_photo(String message_photo) {
		this.message_photo = message_photo;
	}
	public char getC_or_p() {
		return c_or_p;
	}
	public void setC_or_p(char c_or_p) {
		this.c_or_p = c_or_p;
	}
	public String getMessage_note_date() {
		return message_note_date;
	}
	public void setMessage_note_date(String message_note_date) {
		this.message_note_date = message_note_date;
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
