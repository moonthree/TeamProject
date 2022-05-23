package com.edu.vo;

public class FundingMainVO {
	//git 넘기기용
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
	
	private MemberVO memberVO;
	
	private String keyword = "";

	private String dog;
	private String cat;
	private String other;
	private String all;
	
	private String sortNew;
	private String sortView;
	private String sortPrice;
	private String sortdeadline;

	private int startRowNum;
	private int endRowNum;
	private int rowCount;
	private int totalRow;

	private boolean prev;
	private boolean next;
	
	
	
	public String getSortdeadline() {
		return sortdeadline;
	}
	public void setSortdeadline(String sortdeadline) {
		this.sortdeadline = sortdeadline;
	}
	public String getAll() {
		return all;
	}
	public void setAll(String all) {
		this.all = all;
	}
	public int getTotalRow() {
		return totalRow;
	}
	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public String getSortNew() {
		return sortNew;
	}
	public void setSortNew(String sortNew) {
		this.sortNew = sortNew;
	}
	public String getSortView() {
		return sortView;
	}
	public void setSortView(String sortView) {
		this.sortView = sortView;
	}
	public String getSortPrice() {
		return sortPrice;
	}
	public void setSortPrice(String sortPrice) {
		this.sortPrice = sortPrice;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getDog() {
		return dog;
	}
	public void setDog(String dog) {
		this.dog = dog;
	}
	public String getCat() {
		return cat;
	}
	public void setCat(String cat) {
		this.cat = cat;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	
	public int getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}
	public int getEndRowNum() {
		return endRowNum;
	}
	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public int getFunding_views() {
		return funding_views;
	}
	public void setFunding_views(int funding_views) {
		this.funding_views = funding_views;
	}
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
	
	@Override
	public String toString() {
		return "FundingMainVO [funding_idx=" + funding_idx + ", member_idx=" + member_idx + ", funding_title="
				+ funding_title + ", funding_thumbnail=" + funding_thumbnail + ", funding_content=" + funding_content
				+ ", funding_notice=" + funding_notice + ", funding_target_price=" + funding_target_price
				+ ", funding_current_price=" + funding_current_price + ", funding_start_date=" + funding_start_date
				+ ", funding_end_date=" + funding_end_date + ", funding_permit_state=" + funding_permit_state
				+ ", funding_current_state=" + funding_current_state + ", funding_write_date=" + funding_write_date
				+ ", funding_category=" + funding_category + ", funding_express_date=" + funding_express_date
				+ ", funding_express_fee=" + funding_express_fee + ", funding_views="  + "]";
	}
	
	

}
