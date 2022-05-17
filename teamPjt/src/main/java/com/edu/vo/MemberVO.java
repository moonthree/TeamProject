package com.edu.vo;

import java.util.Date;

public class MemberVO {
	
	//git 넘기기용
	private int member_idx;
	private String member_email;
	private String member_password;
	private String member_name;
	private String member_addr;
	private String member_addr2;
	private String member_postnum;
	private String member_phone;
	private String member_business_num;
	private String member_business_name;
	private int member_pet;
	private int member_level;
	private Date member_join_date;
	private char member_state;
	private String member_photo;
	
	
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_business_num() {
		return member_business_num;
	}
	public void setMember_business_num(String member_business_num) {
		this.member_business_num = member_business_num;
	}
	public String getMember_business_name() {
		return member_business_name;
	}
	public void setMember_business_name(String member_business_name) {
		this.member_business_name = member_business_name;
	}
	public int getMember_pet() {
		return member_pet;
	}
	public void setMember_pet(int member_pet) {
		this.member_pet = member_pet;
	}
	public int getMember_level() {
		return member_level;
	}
	public void setMember_level(int member_level) {
		this.member_level = member_level;
	}
	public Date getMember_join_date() {
		return member_join_date;
	}
	public void setMember_join_date(Date member_join_date) {
		this.member_join_date = member_join_date;
	}
	public char getMember_state() {
		return member_state;
	}
	public void setMember_state(char member_state) {
		this.member_state = member_state;
	}

	
	public String getMember_photo() {
		return member_photo;
	}
	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}
	
	
	@Override
	public String toString() {
		return "MemberVO [member_idx=" + member_idx + ", member_email=" + member_email + ", member_password="
				+ member_password + ", member_name=" + member_name + ", member_addr=" + member_addr + ", member_phone="
				+ member_phone + ", member_business_num=" + member_business_num + ", member_business_name="
				+ member_business_name + ", member_pet=" + member_pet + ", member_level=" + member_level
				+ ", member_join_date=" + member_join_date + ", member_state=" + member_state + ", member_photo="
				+ member_photo + "]";
	}
	public String getMember_addr2() {
		return member_addr2;
	}
	public void setMember_addr2(String member_addr2) {
		this.member_addr2 = member_addr2;
	}
	public String getMember_postnum() {
		return member_postnum;
	}
	public void setMember_postnum(String member_postnum) {
		this.member_postnum = member_postnum;
	}
	
	
}
