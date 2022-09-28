package com.boxads.common.vo;

public class PriceVO {
	
	private int boxCnt;
	private int unit;
	private int prUnit;
	private int cpPrice;
	private int prPrice;
	private int adPrice;

	private int fee;
	private int income;
	private int incomeCash;
	private int per;
	
	
	
	
	public int getIncomeCash() {
		return incomeCash;
	}
	public void setIncomeCash(int incomeCash) {
		this.incomeCash = incomeCash;
	}
	public int getBoxCnt() {
		return boxCnt;
	}
	public void setBoxCnt(int boxCnt) {
		this.boxCnt = boxCnt;
	}
	public int getUnit() {
		return unit;
	}
	public void setUnit(int unit) {
		this.unit = unit;
	}
	public int getPrUnit() {
		return prUnit;
	}
	public void setPrUnit(int prUnit) {
		this.prUnit = prUnit;
	}
	public int getCpPrice() {
		return cpPrice;
	}
	public void setCpPrice(int cpPrice) {
		this.cpPrice = cpPrice;
	}
	public int getPrPrice() {
		return prPrice;
	}
	public void setPrPrice(int prPrice) {
		this.prPrice = prPrice;
	}
	public int getAdPrice() {
		return adPrice;
	}
	public void setAdPrice(int adPrice) {
		this.adPrice = adPrice;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public int getIncome() {
		return income;
	}
	public void setIncome(int income) {
		this.income = income;
	}
	public int getPer() {
		return per;
	}
	public void setPer(int per) {
		this.per = per;
	}
	@Override
	public String toString() {
		return "PriceVO [boxCnt=" + boxCnt + ", unit=" + unit + ", prUnit=" + prUnit + ", cpPrice=" + cpPrice
				+ ", prPrice=" + prPrice + ", adPrice=" + adPrice + ", fee=" + fee + ", income=" + income
				+ ", incomeCash=" + incomeCash + ", per=" + per + "]";
	}

	
	
}
