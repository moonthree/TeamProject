package com.edu.vo;

public class ZzimVO {
	
	private int zzim_idx;
	private int member_idx;
	private int funding_idx;
	private int store_idx;
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
	
	

}
