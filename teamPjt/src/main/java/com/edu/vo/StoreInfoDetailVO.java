package com.edu.vo;

import java.util.Date;

public class StoreInfoDetailVO {
	//MEMBER
	private String member_name;
	private String member_phone;
	
	//STORE
	private int store_idx;
	private int member_idx;
	private int funding_idx;
	
	private int store_price;
	private String store_title; 
	private String store_thumbnail;
	private String store_content;
	private String store_notice;
	private String store_write_date;
	private int store_permit_state;
	private int store_current_state;
	private int store_category;
	private int store_funding;
	private int store_express_fee;
	private int store_views;
	
	//STORE_ORDER
	private int store_order_idx;
	private int store_order_total_price;
	private int store_order_pay_state;
	private Date store_order_date;
	private int store_event_price;
	
	//funding_option
	private String store_option_name;
	private int store_option_price;
	private String store_option_detail;
	private int store_option_stock;
	
	//storeOrderOption
	private int store_order_option_idx;								
	private int store_order_option_select_idx;				
	private int store_order_option_select_count;
	
	//storeExpress
	private int store_express_state;
	
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
	public int getFunding_idx() {
		return funding_idx;
	}
	public void setFunding_idx(int funding_idx) {
		this.funding_idx = funding_idx;
	}
	public int getStore_price() {
		return store_price;
	}
	public void setStore_price(int store_price) {
		this.store_price = store_price;
	}
	public String getStore_title() {
		return store_title;
	}
	public void setStore_title(String store_title) {
		this.store_title = store_title;
	}
	public String getStore_thumbnail() {
		return store_thumbnail;
	}
	public void setStore_thumbnail(String store_thumbnail) {
		this.store_thumbnail = store_thumbnail;
	}
	public String getStore_content() {
		return store_content;
	}
	public void setStore_content(String store_content) {
		this.store_content = store_content;
	}
	public String getStore_notice() {
		return store_notice;
	}
	public void setStore_notice(String store_notice) {
		this.store_notice = store_notice;
	}
	public String getStore_write_date() {
		return store_write_date;
	}
	public void setStore_write_date(String store_write_date) {
		this.store_write_date = store_write_date;
	}
	public int getStore_permit_state() {
		return store_permit_state;
	}
	public void setStore_permit_state(int store_permit_state) {
		this.store_permit_state = store_permit_state;
	}
	public int getStore_current_state() {
		return store_current_state;
	}
	public void setStore_current_state(int store_current_state) {
		this.store_current_state = store_current_state;
	}
	public int getStore_category() {
		return store_category;
	}
	public void setStore_category(int store_category) {
		this.store_category = store_category;
	}
	public int getStore_funding() {
		return store_funding;
	}
	public void setStore_funding(int store_funding) {
		this.store_funding = store_funding;
	}
	public int getStore_express_fee() {
		return store_express_fee;
	}
	public void setStore_express_fee(int store_express_fee) {
		this.store_express_fee = store_express_fee;
	}
	public int getStore_views() {
		return store_views;
	}
	public void setStore_views(int store_views) {
		this.store_views = store_views;
	}
	public int getStore_order_idx() {
		return store_order_idx;
	}
	public void setStore_order_idx(int store_order_idx) {
		this.store_order_idx = store_order_idx;
	}
	public int getStore_order_total_price() {
		return store_order_total_price;
	}
	public void setStore_order_total_price(int store_order_total_price) {
		this.store_order_total_price = store_order_total_price;
	}
	public int getStore_order_pay_state() {
		return store_order_pay_state;
	}
	public void setStore_order_pay_state(int store_order_pay_state) {
		this.store_order_pay_state = store_order_pay_state;
	}
	public Date getStore_order_date() {
		return store_order_date;
	}
	public void setStore_order_date(Date store_order_date) {
		this.store_order_date = store_order_date;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getStore_order_option_idx() {
		return store_order_option_idx;
	}
	public void setStore_order_option_idx(int store_order_option_idx) {
		this.store_order_option_idx = store_order_option_idx;
	}
	public int getStore_order_option_select_idx() {
		return store_order_option_select_idx;
	}
	public void setStore_order_option_select_idx(int store_order_option_select_idx) {
		this.store_order_option_select_idx = store_order_option_select_idx;
	}
	public int getStore_order_option_select_count() {
		return store_order_option_select_count;
	}
	public void setStore_order_option_select_count(int store_order_option_select_count) {
		this.store_order_option_select_count = store_order_option_select_count;
	}

	public String getStore_option_name() {
		return store_option_name;
	}
	public void setStore_option_name(String store_option_name) {
		this.store_option_name = store_option_name;
	}
	public int getStore_option_price() {
		return store_option_price;
	}
	public void setStore_option_price(int store_option_price) {
		this.store_option_price = store_option_price;
	}
	public String getStore_option_detail() {
		return store_option_detail;
	}
	public void setStore_option_detail(String store_option_detail) {
		this.store_option_detail = store_option_detail;
	}
	public int getStore_option_stock() {
		return store_option_stock;
	}
	public void setStore_option_stock(int store_option_stock) {
		this.store_option_stock = store_option_stock;
	}
	public int getStore_express_state() {
		return store_express_state;
	}
	public void setStore_express_state(int store_express_state) {
		this.store_express_state = store_express_state;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public int getStore_event_price() {
		return store_event_price;
	}
	public void setStore_event_price(int store_event_price) {
		this.store_event_price = store_event_price;
	}

}
