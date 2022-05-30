package com.edu.vo;
import java.util.Date;	
			
public class StoreOrderVO {			
			
	private int store_order_idx;		
	private int store_order_total_price;		
	private int store_order_pay_state;		
	private Date store_order_date;		
	private int member_idx;		
	private int store_idx;
	private int store_event_price;
	
			
	public int getStore_event_price() {
		return store_event_price;
	}
	public void setStore_event_price(int store_event_price) {
		this.store_event_price = store_event_price;
	}
	public Date getstore_order_date() {		
		return store_order_date;	
	}		
	public void setstore_order_date(Date store_order_date) {		
		this.store_order_date = store_order_date;	
	}		
	public int getstore_order_idx() {		
		return store_order_idx;	
	}		
	public void setstore_order_idx(int store_order_idx) {		
		this.store_order_idx = store_order_idx;	
	}		
	public int getstore_order_total_price() {		
		return store_order_total_price;	
	}		
	public void setstore_order_total_price(int store_order_total_price) {		
		this.store_order_total_price = store_order_total_price;	
	}		
	public int getstore_order_pay_state() {		
		return store_order_pay_state;	
	}		
	public void setstore_order_pay_state(int store_order_pay_state) {		
		this.store_order_pay_state = store_order_pay_state;	
	}		
	public int getMember_idx() {		
		return member_idx;	
	}		
	public void setMember_idx(int member_idx) {		
		this.member_idx = member_idx;	
	}		
	public int getstore_idx() {		
		return store_idx;	
	}		
	public void setstore_idx(int store_idx) {		
		this.store_idx = store_idx;	
	}		
			
}			