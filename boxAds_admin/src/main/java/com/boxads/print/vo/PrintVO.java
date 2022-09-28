package com.boxads.print.vo;

public class PrintVO {
	
	private int idx;
	private int oIdx;
	private String state;
	private String content;
	private String insertDate;
	
	private int fIdx;
	private String realName;
	private String url;
	
	private String delivery;
	private String mesg;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getoIdx() {
		return oIdx;
	}
	public void setoIdx(int oIdx) {
		this.oIdx = oIdx;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getMesg() {
		return mesg;
	}
	public void setMesg(String mesg) {
		this.mesg = mesg;
	}
	public int getfIdx() {
		return fIdx;
	}
	public void setfIdx(int fIdx) {
		this.fIdx = fIdx;
	}
	@Override
	public String toString() {
		return "PrintVO [idx=" + idx + ", oIdx=" + oIdx + ", state=" + state + ", content=" + content + ", insertDate="
				+ insertDate + ", fIdx=" + fIdx + ", realName=" + realName + ", url=" + url + ", delivery=" + delivery
				+ ", mesg=" + mesg + "]";
	}

	
	
	
	
	
}