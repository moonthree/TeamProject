package com.edu.vo;

import java.util.Date;

public class FundingInfoDetailVO {
	private int funding_idx;
	private int member_idx;
	private String member_name; //판매자 이름
	private String member_phone;
	
	private String funding_title;
	private String funding_thumbnail;
	private String funding_content;
	private String funding_notice;
	private int funding_target_price;
	private int funding_current_price;
	private String funding_start_date;
	private String funding_end_date;
	private int funding_permit_state;
	private int funding_current_state;
	private String funding_write_date;
	private int funding_category;
	private String funding_express_date;
	private int funding_express_fee;
	private int funding_views;
	
	
	private int funding_order_idx;		
	private int funding_order_total_price;		
	private int funding_order_pay_state;		
	private Date funding_order_date;
	private int funding_order_donation;
	
	//funding_option
	private String funding_option_name;
	private int funding_option_price;
	private String funding_option_detail;
	private int funding_option_stock;
	
	//funding_order_option
	private int funding_order_option_idx;								
	private int funding_order_option_select_idx;				
	private int funding_order_option_select_count;
	
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
	public String getFunding_title() {
		return funding_title;
	}
	public void setFunding_title(String funding_title) {
		this.funding_title = funding_title;
	}
	public String getFunding_thumbnail() {
		return funding_thumbnail;
	}
	public void setFunding_thumbnail(String funding_thumbnail) {
		this.funding_thumbnail = funding_thumbnail;
	}
	public String getFunding_content() {
		return funding_content;
	}
	public void setFunding_content(String funding_content) {
		this.funding_content = funding_content;
	}
	public String getFunding_notice() {
		return funding_notice;
	}
	public void setFunding_notice(String funding_notice) {
		this.funding_notice = funding_notice;
	}
	public int getFunding_target_price() {
		return funding_target_price;
	}
	public void setFunding_target_price(int funding_target_price) {
		this.funding_target_price = funding_target_price;
	}
	public int getFunding_current_price() {
		return funding_current_price;
	}
	public void setFunding_current_price(int funding_current_price) {
		this.funding_current_price = funding_current_price;
	}
	public String getFunding_start_date() {
		return funding_start_date;
	}
	public void setFunding_start_date(String funding_start_date) {
		this.funding_start_date = funding_start_date;
	}
	public String getFunding_end_date() {
		return funding_end_date;
	}
	public void setFunding_end_date(String funding_end_date) {
		this.funding_end_date = funding_end_date;
	}
	public int getFunding_permit_state() {
		return funding_permit_state;
	}
	public void setFunding_permit_state(int funding_permit_state) {
		this.funding_permit_state = funding_permit_state;
	}
	public int getFunding_current_state() {
		return funding_current_state;
	}
	public void setFunding_current_state(int funding_current_state) {
		this.funding_current_state = funding_current_state;
	}
	public String getFunding_write_date() {
		return funding_write_date;
	}
	public void setFunding_write_date(String funding_write_date) {
		this.funding_write_date = funding_write_date;
	}
	public int getFunding_category() {
		return funding_category;
	}
	public void setFunding_category(int funding_category) {
		this.funding_category = funding_category;
	}
	public String getFunding_express_date() {
		return funding_express_date;
	}
	public void setFunding_express_date(String funding_express_date) {
		this.funding_express_date = funding_express_date;
	}
	public int getFunding_express_fee() {
		return funding_express_fee;
	}
	public void setFunding_express_fee(int funding_express_fee) {
		this.funding_express_fee = funding_express_fee;
	}
	public int getFunding_views() {
		return funding_views;
	}
	public void setFunding_views(int funding_views) {
		this.funding_views = funding_views;
	}
	public int getFunding_order_idx() {
		return funding_order_idx;
	}
	public void setFunding_order_idx(int funding_order_idx) {
		this.funding_order_idx = funding_order_idx;
	}
	public int getFunding_order_total_price() {
		return funding_order_total_price;
	}
	public void setFunding_order_total_price(int funding_order_total_price) {
		this.funding_order_total_price = funding_order_total_price;
	}
	public int getFunding_order_pay_state() {
		return funding_order_pay_state;
	}
	public void setFunding_order_pay_state(int funding_order_pay_state) {
		this.funding_order_pay_state = funding_order_pay_state;
	}
	public Date getFunding_order_date() {
		return funding_order_date;
	}
	public void setFunding_order_date(Date funding_order_date) {
		this.funding_order_date = funding_order_date;
	}
	public int getFunding_order_donation() {
		return funding_order_donation;
	}
	public void setFunding_order_donation(int funding_order_donation) {
		this.funding_order_donation = funding_order_donation;
	}
	public String getFunding_option_name() {
		return funding_option_name;
	}
	public void setFunding_option_name(String funding_option_name) {
		this.funding_option_name = funding_option_name;
	}
	public int getFunding_option_price() {
		return funding_option_price;
	}
	public void setFunding_option_price(int funding_option_price) {
		this.funding_option_price = funding_option_price;
	}
	public String getFunding_option_detail() {
		return funding_option_detail;
	}
	public void setFunding_option_detail(String funding_option_detail) {
		this.funding_option_detail = funding_option_detail;
	}
	public int getFunding_option_stock() {
		return funding_option_stock;
	}
	public void setFunding_option_stock(int funding_option_stock) {
		this.funding_option_stock = funding_option_stock;
	}
	public int getFunding_order_option_idx() {
		return funding_order_option_idx;
	}
	public void setFunding_order_option_idx(int funding_order_option_idx) {
		this.funding_order_option_idx = funding_order_option_idx;
	}
	public int getFunding_order_option_select_idx() {
		return funding_order_option_select_idx;
	}
	public void setFunding_order_option_select_idx(int funding_order_option_select_idx) {
		this.funding_order_option_select_idx = funding_order_option_select_idx;
	}
	public int getFunding_order_option_select_count() {
		return funding_order_option_select_count;
	}
	public void setFunding_order_option_select_count(int funding_order_option_select_count) {
		this.funding_order_option_select_count = funding_order_option_select_count;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	
	
	
}
