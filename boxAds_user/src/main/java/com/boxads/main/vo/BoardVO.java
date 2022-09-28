package com.boxads.main.vo;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	
	private int idx;
	private int parent;
	private String type;
	private String title;
	private String content;
	private String state;
	private String noticeFlag = "N";
	private String replyFlag;
	private String category;		
	private int writer;
	private String insertDate;
	private String updateDate;
	private int viewCnt;
	private String name;
	private String email;
	private String adGroup;
	private String url;
	private String window;
	private String keyword;
	private String searchType;
	private String endDate;
	private String newFlag;
	
	private String secCtg;
	private String thrCtg;
	
	private int start;
	private int end;
	
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
	public String getSecCtg() {
		return secCtg;
	}
	public void setSecCtg(String secCtg) {
		this.secCtg = secCtg;
	}
	public String getThrCtg() {
		return thrCtg;
	}
	public void setThrCtg(String thrCtg) {
		this.thrCtg = thrCtg;
	}
	public String getNewFlag() {
		return newFlag;
	}
	public void setNewFlag(String newFlag) {
		this.newFlag = newFlag;
	}
	public String getAdGroup() {
		return adGroup;
	}
	public void setAdGroup(String adGroup) {
		this.adGroup = adGroup;
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
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getWindow() {
		return window;
	}
	public void setWindow(String window) {
		this.window = window;
	}
	public String getReplyFlag() {
		return replyFlag;
	}
	public void setReplyFlag(String replyFlag) {
		this.replyFlag = replyFlag;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNoticeFlag() {
		return noticeFlag;
	}
	public void setNoticeFlag(String noticeFlag) {
		this.noticeFlag = noticeFlag;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
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
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	@Override
	public String toString() {
		return "BoardVO [idx=" + idx + ", parent=" + parent + ", type=" + type + ", title=" + title + ", content="
				+ content + ", state=" + state + ", noticeFlag=" + noticeFlag + ", replyFlag=" + replyFlag
				+ ", category=" + category + ", writer=" + writer + ", insertDate=" + insertDate + ", updateDate="
				+ updateDate + ", viewCnt=" + viewCnt + ", name=" + name + ", email=" + email + ", adGroup=" + adGroup
				+ ", url=" + url + ", window=" + window + ", keyword=" + keyword + ", searchType=" + searchType
				+ ", endDate=" + endDate + ", newFlag=" + newFlag + ", secCtg=" + secCtg + ", thrCtg=" + thrCtg
				+ ", start=" + start + ", end=" + end + "]";
	}

	
	
	
	
	
}
