package com.boxads.etc.vo;

public class CouponVO {
	
	private int idx;
	private String target;
	private String title;
	private String mesg;
	private String content;
	private String state = "N";
	private int writer;
	private String price;
	private String useFlag = "N";
	private String periodFlag;
	private int totalCnt;
	private int issueCnt;
	
	private String startDate;
	private String endDate;
	private String ableStartDate;
	private String ableEndDate;
	
	private String insertDate;
	private String updateDate;
	
	private int start;
	private int end;
	
	private int mIdx;
	
	public CouponVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CouponVO(String target, int mIdx) {
		super();
		this.target = target;
		this.mIdx = mIdx;
	}
	
	public CouponVO(String target) {
		super();
		this.target = target;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMesg() {
		return mesg;
	}
	public void setMesg(String mesg) {
		this.mesg = mesg;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}	
	public int getIssueCnt() {
		return issueCnt;
	}
	public void setIssueCnt(int issueCnt) {
		this.issueCnt = issueCnt;
	}
	public String getUseFlag() {
		return useFlag;
	}
	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
	}
	public String getPeriodFlag() {
		return periodFlag;
	}
	public void setPeriodFlag(String periodFlag) {
		this.periodFlag = periodFlag;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
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
	public String getAbleStartDate() {
		return ableStartDate;
	}
	public void setAbleStartDate(String ableStartDate) {
		this.ableStartDate = ableStartDate;
	}
	public String getAbleEndDate() {
		return ableEndDate;
	}
	public void setAbleEndDate(String ableEndDate) {
		this.ableEndDate = ableEndDate;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
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
	public int getmIdx() {
		return mIdx;
	}
	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}
	@Override
	public String toString() {
		return "CouponVO [idx=" + idx + ", target=" + target + ", title=" + title + ", mesg=" + mesg + ", content="
				+ content + ", state=" + state + ", writer=" + writer + ", price=" + price + ", useFlag=" + useFlag
				+ ", periodFlag=" + periodFlag + ", totalCnt=" + totalCnt + ", issueCnt=" + issueCnt + ", startDate="
				+ startDate + ", endDate=" + endDate + ", ableStartDate=" + ableStartDate + ", ableEndDate="
				+ ableEndDate + ", insertDate=" + insertDate + ", updateDate=" + updateDate + ", start=" + start
				+ ", end=" + end + ", mIdx=" + mIdx + "]";
	}
	
	
	
	
}
