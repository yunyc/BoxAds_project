package com.boxads.setting.vo;

public class FeesVO {
	private int idx; 
	private int writer; 
	private String type; 
	private String category; 
	private int per; 
	private String insertDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPer() {
		return per;
	}
	public void setPer(int per) {
		this.per = per;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	@Override
	public String toString() {
		return "FeesVO [idx=" + idx + ", writer=" + writer + ", type=" + type + ", category=" + category + ", per="
				+ per + ", insertDate=" + insertDate + "]";
	}

	
	
	
}
