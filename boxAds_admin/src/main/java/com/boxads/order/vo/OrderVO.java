package com.boxads.order.vo;

import java.util.Arrays;

public class OrderVO {
	
	private int idx; 
	private String orderCode; 
	private int mIdx; 
	private int oIdx;  
	private int aIdx; 
	private int bIdx; 
	private int cIdx;
	private int pdtUnit;
	private int totalPrice; 
	private int printUnit;
	private int printPrice; 
	private String insertDate;
	private String state;
	private String[] oState;
	
	private String searchType;
	private String keyword;
	private String startDate;
	private String endDate;
	private String[] pCIdx;
	
	private int start = 0;
	private int end = 10;
	private String excel;
	
	private int cpPrice;
	private int dash;
	
	
	
	
	public OrderVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderVO(int idx) {
		super();
		this.idx = idx;
	}
	public String getExcel() {
		return excel;
	}
	public void setExcel(String excel) {
		this.excel = excel;
	}
	public String[] getoState() {
		return oState;
	}
	public void setoState(String[] oState) {
		this.oState = oState;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String[] getpCIdx() {
		return pCIdx;
	}
	public void setpCIdx(String[] pCIdx) {
		this.pCIdx = pCIdx;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
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
	public int getDash() {
		return dash;
	}
	public void setDash(int dash) {
		this.dash = dash;
	}
	@Override
	public String toString() {
		return "OrderVO [idx=" + idx + ", orderCode=" + orderCode + ", mIdx=" + mIdx + ", oIdx=" + oIdx + ", aIdx="
				+ aIdx + ", bIdx=" + bIdx + ", cIdx=" + cIdx + ", pdtUnit=" + pdtUnit + ", totalPrice=" + totalPrice
				+ ", printUnit=" + printUnit + ", printPrice=" + printPrice + ", insertDate=" + insertDate + ", state="
				+ state + ", oState=" + Arrays.toString(oState) + ", searchType=" + searchType + ", keyword=" + keyword
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", pCIdx=" + Arrays.toString(pCIdx) + ", start="
				+ start + ", end=" + end + ", excel=" + excel + ", cpPrice=" + cpPrice + ", dash=" + dash + "]";
	}


	
	
	
	
	
}