package com.edu.vo;			
			
import java.util.Date;			
			
public class Funding_orderVO {			
			
	private int funding_order_idx;		
	private int funding_order_total_price;		
	private int funding_order_pay_state;		
	private Date funding_order_date;		
	private int member_idx;		
	private int funding_idx;		
			
	public Date getFunding_order_date() {		
		return funding_order_date;	
	}		
	public void setFunding_order_date(Date funding_order_date) {		
		this.funding_order_date = funding_order_date;	
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
			
}			