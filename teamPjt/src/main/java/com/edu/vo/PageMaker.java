package com.edu.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.apache.xerces.util.URI;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 5;
	private Pagination page;
	
	public void setPage(Pagination page) {
		this.page = page;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	public Pagination getPage() {
		return page;
	}
	 
	private void calcData() {
		endPage = (int) (Math.ceil(page.getPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
	  
		int tempEndPage = (int) (Math.ceil(totalCount / (double)page.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * page.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String makeQuery1( int Page) {
		
		UriComponents uriComponents1 =
		UriComponentsBuilder.newInstance()
										.queryParam("Page", Page)
										.queryParam("perPageNum", page.getPerPageNum())
										.build();
							   
				return uriComponents1.toUriString();
		
	}
	
	
	public String makeQuery2(int Page) {
		
		
		UriComponents uriComponents1 =
		UriComponentsBuilder.newInstance()
									    .queryParam("Page", Page)
										.queryParam("perPageNum", page.getPerPageNum())
										.build();
					   
			return uriComponents1.toUriString();
		
	}
	
	
	//검색 시작
	public String makeSearch(int Page)
	{
	  
	 UriComponents uriComponents =
	            UriComponentsBuilder.newInstance()
	            .queryParam("Page", Page)
	            .queryParam("perPageNum", page.getPerPageNum())
	            .queryParam("searchType", ((SearchCriteria)page).getSearchType())
	            .queryParam("keyword", encoding(((SearchCriteria)page).getKeyword()))
	            .build(); 
	    return uriComponents.toUriString();  
	}

	private String encoding(String keyword) {
		if(keyword == null || keyword.trim().length() == 0) { 
			return "";
		}
		 
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch(UnsupportedEncodingException e) { 
			return ""; 
		}
	}
	//검색 끝
}
