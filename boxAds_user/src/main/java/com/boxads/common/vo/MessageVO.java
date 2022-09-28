
package com.boxads.common.vo;

public class MessageVO {
	
	private int idx;
	private int writer;
	private int receiver;
	private String content;
	private String insertDate;
	
	private String name;
	private String url;
	private String prImg;
	private String realName;
	private String newFlag;
	private int fIdx;
	
	private int start;
	private int end;
	private String keyword;
	private String searchType;
	
	
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
	public int getReceiver() {
		return receiver;
	}
	public void setReceiver(int receiver) {
		this.receiver = receiver;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPrImg() {
		return prImg;
	}
	public void setPrImg(String prImg) {
		this.prImg = prImg;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getNewFlag() {
		return newFlag;
	}
	public void setNewFlag(String newFlag) {
		this.newFlag = newFlag;
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
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public int getfIdx() {
		return fIdx;
	}
	public void setfIdx(int fIdx) {
		this.fIdx = fIdx;
	}
	@Override
	public String toString() {
		return "MessageVO [idx=" + idx + ", writer=" + writer + ", receiver=" + receiver + ", content=" + content
				+ ", insertDate=" + insertDate + ", name=" + name + ", url=" + url + ", prImg=" + prImg + ", realName="
				+ realName + ", newFlag=" + newFlag + ", fIdx=" + fIdx + ", start=" + start + ", end=" + end
				+ ", keyword=" + keyword + ", searchType=" + searchType + "]";
	}

	
	
	
	
	
	
	
	
	
}