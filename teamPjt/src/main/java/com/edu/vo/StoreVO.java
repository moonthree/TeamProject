package com.edu.vo;

public class StoreVO {
	
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
	
	
	private MemberVO memberVO;
	private String member_business_name;
	private String member_addr;
	private String member_addr2;
	private String member_postnum;
	private String member_phone;
	private String member_business_num;
	private String member_email;
	private String member_name;
	private String member_level;
	
	
	private int funding_current_price;
	private String fund;
	private String dog;
	private String cat;
	private String other;
	private String sortNew;
	private String sortView;
	private String sortStar;
	private String sortHighPrice;
	private String sortLowPrice;
	private int startRowNum;
	private int endRowNum;
	private int rowCount;
	private int totalRow;
	private boolean prev;
	private boolean next;
	
	//검색 관련
	private int startRowNumStore;
	private int endRowNumStore;
	private int rowCountStore;
	private int totalRowStore;
	
	private String all;
	private String sortNewStore;
	private String sortViewStore;
	private String sortStarStore;
	private String sortHighPriceStore;
	private String sortLowPriceStore;
	
	private String keyword = "";
	
	private Double starAvg;
	private Double avg_star;
	
	
	
	
	
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
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
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getAll() {
		return all;
	}
	public void setAll(String all) {
		this.all = all;
	}
	public String getSortNewStore() {
		return sortNewStore;
	}
	public void setSortNewStore(String sortNewStore) {
		this.sortNewStore = sortNewStore;
	}
	public String getSortViewStore() {
		return sortViewStore;
	}
	public void setSortViewStore(String sortViewStore) {
		this.sortViewStore = sortViewStore;
	}
	public String getSortStarStore() {
		return sortStarStore;
	}
	public void setSortStarStore(String sortStarStore) {
		this.sortStarStore = sortStarStore;
	}
	public String getSortHighPriceStore() {
		return sortHighPriceStore;
	}
	public void setSortHighPriceStore(String sortHighPriceStore) {
		this.sortHighPriceStore = sortHighPriceStore;
	}
	public String getSortLowPriceStore() {
		return sortLowPriceStore;
	}
	public void setSortLowPriceStore(String sortLowPriceStore) {
		this.sortLowPriceStore = sortLowPriceStore;
	}
	public Double getAvg_star() {
		return avg_star;
	}
	public void setAvg_star(Double avg_star) {
		this.avg_star = avg_star;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
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
	public Double getStarAvg() {
		return starAvg;
	}
	public void setStarAvg(Double starAvg) {
		this.starAvg = starAvg;
	}
	public int getStore_funding() {
		return store_funding;
	}
	public void setStore_funding(int store_funding) {
		this.store_funding = store_funding;
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
	public int getTotalRow() {
		return totalRow;
	}
	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getFund() {
		return fund;
	}
	public void setFund(String fund) {
		this.fund = fund;
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
	public String getSortStar() {
		return sortStar;
	}
	public void setSortStar(String sortStar) {
		this.sortStar = sortStar;
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
	@Override
	public String toString() {
		return "StoreVO [store_idx=" + store_idx + ", member_idx=" + member_idx + ", funding_idx=" + funding_idx
				+ ", store_title=" + store_title + ", store_thumbnail=" + store_thumbnail + ", store_content="
				+ store_content + ", store_notice=" + store_notice + ", store_write_date=" + store_write_date
				+ ", store_permit_state=" + store_permit_state + ", store_current_state=" + store_current_state
				+ ", store_category=" + store_category + ", store_funding=" + store_funding + ", store_express_fee="
				+ store_express_fee + ", store_views=" + store_views + "]";
	}
	public int getStore_price() {
		return store_price;
	}
	public void setStore_price(int store_price) {
		this.store_price = store_price;
	}
	public String getMember_business_name() {
		return member_business_name;
	}
	public void setMember_business_name(String member_business_name) {
		this.member_business_name = member_business_name;
	}
	public int getFunding_current_price() {
		return funding_current_price;
	}
	public void setFunding_current_price(int funding_current_price) {
		this.funding_current_price = funding_current_price;
	}
	public String getSortHighPrice() {
		return sortHighPrice;
	}
	public void setSortHighPrice(String sortHighPrice) {
		this.sortHighPrice = sortHighPrice;
	}
	public String getSortLowPrice() {
		return sortLowPrice;
	}
	public void setSortLowPrice(String sortLowPrice) {
		this.sortLowPrice = sortLowPrice;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_level() {
		return member_level;
	}
	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}
	
	
	
	

}
