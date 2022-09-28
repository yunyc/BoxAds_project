package com.boxads.common.vo;

public class PageVO {
	private int curPage = 1;
	private int perPage = 10;
	private int totalPage;
	private Long totalCnt;	
	private int start = 0;
	private int end = perPage;
	
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public Long getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(Long totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getStart() {
		start = curPage == 1 ? 0 : ( curPage - 1 ) * perPage;
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
	@Override
	public String toString() {
		return "PageVO [curPage=" + curPage + ", perPage=" + perPage + ", totalPage=" + totalPage + ", totalCnt="
				+ totalCnt + ", start=" + start + ", end=" + end + "]";
	}
	
	
	

	
	
	
	

}
