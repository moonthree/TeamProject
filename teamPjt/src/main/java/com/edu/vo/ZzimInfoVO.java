package com.edu.vo;

public class ZzimInfoVO {
	
	private int zzim_idx;
	private int zzim_category;
	
	//펀딩
	private int funding_idx;
	private int member_idx;
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
	
	//스토어
	private int store_idx;
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
	
	//무한스크롤
	private int startRowNumStore;
	private int endRowNumStore;
	private int rowCountStore;
	private int totalRowStore;
	
	public int getStartRowNumStore() {
		return startRowNumStore;
	}
	public void setStartRowNumStore(int startRowNumStore) {
		this.startRowNumStore = startRowNumStore;
	}
	public int getEndRowNumStore() {
		return endRowNumStore;
	}
	public void setEndRowNumStore(int endRowNumStore) {
		this.endRowNumStore = endRowNumStore;
	}
	public int getRowCountStore() {
		return rowCountStore;
	}
	public void setRowCountStore(int rowCountStore) {
		this.rowCountStore = rowCountStore;
	}
	public int getTotalRowStore() {
		return totalRowStore;
	}
	public void setTotalRowStore(int totalRowStore) {
		this.totalRowStore = totalRowStore;
	}
	
	public int getZzim_idx() {
		return zzim_idx;
	}
	public void setZzim_idx(int zzim_idx) {
		this.zzim_idx = zzim_idx;
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
	public int getStore_idx() {
		return store_idx;
	}
	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}
	@Override
	public String toString() {
		return "ZzimVO [zzim_idx=" + zzim_idx + ", member_idx=" + member_idx + ", funding_idx=" + funding_idx
				+ ", store_idx=" + store_idx + "]";
	}
	public int getZzim_category() {
		return zzim_category;
	}
	public void setZzim_category(int zzim_category) {
		this.zzim_category = zzim_category;
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
	
	

}
