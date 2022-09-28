package com.boxads.deal.vo;

public class BankInfoVO {
	private int idx;			//BankInfo 인덱스번호
	private int mIdx;			//사용자번호
	private String name;		
	private String bank;		//은행
	private String accNumber;	//계좌번호
	private String insertDate;	//등록일
	private String depositor;   //예금주명
	
	
	
	public BankInfoVO(int mIdx) {
		this.mIdx = mIdx;
	}
	public BankInfoVO() {
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
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAccNumber() {
		return accNumber;
	}
	public void setAccNumber(String accNumber) {
		this.accNumber = accNumber;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getDepositor() {
		return depositor;
	}
	public void setDepositor(String depositor) {
		this.depositor = depositor;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "BankInfoVO [idx=" + idx + ", mIdx=" + mIdx + ", name=" + name + ", bank=" + bank + ", accNumber="
				+ accNumber + ", insertDate=" + insertDate + ", depositor=" + depositor + "]";
	}

}