package com.edu.vo;

public class Pagination {
	
	private int page1;
	private int perPageNum1;	
	private int rowStart;
	private int rowEnd;

	public Pagination() {
		
		this.page1 = 1;
		this.perPageNum1 = 9;
		
	}
	

	public void setPage1(int page1) {
		if(page1<=0) {
			this.page1 = 1;
			return;
		}
		this.page1 = page1;
	}
	
	public void setPerPageNum1(int perPageNum1) {
		if(perPageNum1 <= 0 || perPageNum1 > 100) {
			this.perPageNum1 = 9;
			return;
		}
		this.perPageNum1 = perPageNum1;
	}
	
	public int getPage1() {
		return page1;
	}
	
	public int getPageStart() {
		return (this.page1 - 1) * perPageNum1;
	}
	
	public int getPerPageNum1() {
		return this.perPageNum1;
	}
	
	public int getRowStart() {
		rowStart = ((page1 - 1) * perPageNum1);
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum1;
		return rowEnd;
	}
	

	
	@Override
	public String toString() {
		return "Pagination [page=" + page1 + ", perPageNum=" + perPageNum1 + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}


}
