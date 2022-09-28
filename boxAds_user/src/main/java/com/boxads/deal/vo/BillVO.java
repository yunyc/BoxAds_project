package com.boxads.deal.vo;

public class BillVO {	
	private int idx;
	private int mIdx;
	private String email;
	private String phone;
	private String type;
	private String insertDate;
	
	private String name;
	private String companyNumber;
	private String business;
	private String companyName;
	private String address;
	
	
	
	public BillVO(int mIdx) {
		this.mIdx = mIdx;
	}
	public BillVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getmIdx() {
		return mIdx;
	}
	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompanyNumber() {
		return companyNumber;
	}
	public void setCompanyNumber(String companyNumber) {
		this.companyNumber = companyNumber;
	}
	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "BillVO [idx=" + idx + ", mIdx=" + mIdx + ", email=" + email + ", phone=" + phone + ", type=" + type
				+ ", insertDate=" + insertDate + ", name=" + name + ", companyNumber=" + companyNumber + ", business="
				+ business + ", companyName=" + companyName + ", address=" + address + "]";
	}
}
