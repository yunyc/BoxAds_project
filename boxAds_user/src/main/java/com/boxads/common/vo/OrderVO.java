package com.boxads.common.vo;

public class OrderVO {
	
	private int idx; 
	private String orderCode; 
	private int mIdx; 
	private int oIdx;  
	private int aIdx; 
	private int bIdx; 
	private int cIdx;
	private int boxCnt;
	private int pdtUnit;
	private int printUnit;
	private int printPrice; 
	private int totalPrice; 
	private String insertDate;
	private String state;

	private int cpPrice;
		
	private String temp;
	
	public int getBoxCnt() {
		return boxCnt;
	}
	public void setBoxCnt(int boxCnt) {
		this.boxCnt = boxCnt;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getCpPrice() {
		return cpPrice;
	}
	public void setCpPrice(int cpPrice) {
		this.cpPrice = cpPrice;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public int getmIdx() {
		return mIdx;
	}
	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}
	public int getoIdx() {
		return oIdx;
	}
	public void setoIdx(int oIdx) {
		this.oIdx = oIdx;
	}
	public int getaIdx() {
		return aIdx;
	}
	public void setaIdx(int aIdx) {
		this.aIdx = aIdx;
	}
	public int getbIdx() {
		return bIdx;
	}
	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}
	public int getcIdx() {
		return cIdx;
	}
	public void setcIdx(int cIdx) {
		this.cIdx = cIdx;
	}
	public int getPdtUnit() {
		return pdtUnit;
	}
	public void setPdtUnit(int pdtUnit) {
		this.pdtUnit = pdtUnit;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getPrintUnit() {
		return printUnit;
	}
	public void setPrintUnit(int printUnit) {
		this.printUnit = printUnit;
	}
	public int getPrintPrice() {
		return printPrice;
	}
	public void setPrintPrice(int printPrice) {
		this.printPrice = printPrice;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	

	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
	}
	public OrderVO(int idx) {
		super();
		this.idx = idx;
	}
	public OrderVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderVO(String insertDate, String state) {
		super();
		this.insertDate = insertDate;
		this.state = state;
	}
	@Override
	public String toString() {
		return "OrderVO [idx=" + idx + ", orderCode=" + orderCode + ", mIdx=" + mIdx + ", oIdx=" + oIdx + ", aIdx="
				+ aIdx + ", bIdx=" + bIdx + ", cIdx=" + cIdx + ", boxCnt=" + boxCnt + ", pdtUnit=" + pdtUnit
				+ ", printUnit=" + printUnit + ", printPrice=" + printPrice + ", totalPrice=" + totalPrice
				+ ", insertDate=" + insertDate + ", state=" + state + ", cpPrice=" + cpPrice + ", temp=" + temp + "]";
	}

	
	

	

	
	
	
	
	
	
	
}