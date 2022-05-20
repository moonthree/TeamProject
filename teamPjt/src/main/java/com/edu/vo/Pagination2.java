package com.edu.vo;

public class Pagination2 {
	
	private int page2;
	private int perPageNum2;
	private int rowStart;
	private int rowEnd;

	public Pagination2() {
		
		this.page2 = 1;
		this.perPageNum2 = 9;
		
	}
	

	public void setPage2(int page2) {
		if(page2<=0) {
			this.page2 = 1;
			return;
		}
		this.page2 = page2;
	}
	
	public void setPerPageNum2(int perPageNum2) {
		if(perPageNum2 <= 0 || perPageNum2 > 100) {
			this.perPageNum2 = 9;
			return;
		}
		this.perPageNum2 = perPageNum2;
	}
	
	public int getPage2() {
		return page2;
	}
	
	public int getPageStart() {
		return (this.page2 - 1) * perPageNum2;
	}
	
	public int getPerPageNum2() {
		return this.perPageNum2;
	}
	
	public int getRowStart() {
		rowStart = ((page2 - 1) * perPageNum2);
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum2;
		return rowEnd;
	}
	

	
	@Override
	public String toString() {
		return "Pagination [page=" + page2 + ", perPageNum=" + perPageNum2 + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}


}
