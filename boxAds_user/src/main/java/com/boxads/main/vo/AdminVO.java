package com.boxads.main.vo;

public class AdminVO {
	
	private int idx;
	private String name;
	private String id;
	private String pw;
	private String insert_date;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(String insert_date) {
		this.insert_date = insert_date;
	}
	
	@Override
	public String toString() {
		return "AdminVO [idx=" + idx + ", name=" + name + ", id=" + id + ", pw=" + pw + ", insert_date=" + insert_date
				+ "]";
	}
	
	

}
