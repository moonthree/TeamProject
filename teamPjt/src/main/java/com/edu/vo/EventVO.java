package com.edu.vo;

public class EventVO {
	
	private int event_idx;
	private int member_idx;
	private int event_price;
	private String event_thumbnail;
	private String event_title;
	private String event_subtitle;
	
	
	
	public int getEvent_price() {
		return event_price;
	}
	public void setEvent_price(int event_price) {
		this.event_price = event_price;
	}
	public int getEvent_idx() {
		return event_idx;
	}
	public void setEvent_idx(int event_idx) {
		this.event_idx = event_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getEvent_thumbnail() {
		return event_thumbnail;
	}
	public void setEvent_thumbnail(String event_thumbnail) {
		this.event_thumbnail = event_thumbnail;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getEvent_subtitle() {
		return event_subtitle;
	}
	public void setEvent_subtitle(String event_subtitle) {
		this.event_subtitle = event_subtitle;
	}
	@Override
	public String toString() {
		return "EventVO [event_idx=" + event_idx + ", member_idx=" + member_idx + ", event_thumbnail=" + event_thumbnail
				+ ", event_title=" + event_title + ", event_subtitle=" + event_subtitle + "]";
	}
	
	
	

}
