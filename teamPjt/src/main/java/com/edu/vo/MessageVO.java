package com.edu.vo;

import java.util.Date;

public class MessageVO {
	private int member_idx;
	private String member_name;
	private String member_photo;
	
	private int from_member_idx;
	private int to_member_idx; 
	private int funding_idx;
	private String message_content;
	private String message_photo;
	private int message_state;
	private int message_send_person;
	private String message_date;
	
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
	public int getFunding_idx() {
		return funding_idx;
	}
	public void setFunding_idx(int funding_idx) {
		this.funding_idx = funding_idx;
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
	public int getMessage_state() {
		return message_state;
	}
	public void setMessage_state(int message_state) {
		this.message_state = message_state;
	}
	public String getMessage_date() {
		return message_date;
	}
	public void setMessage_date(String message_date) {
		this.message_date = message_date;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getMessage_send_person() {
		return message_send_person;
	}
	public void setMessage_send_person(int message_send_person) {
		this.message_send_person = message_send_person;
	}
	
}
