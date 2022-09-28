package com.boxads.setting.vo;

public class CodeVO {
	
	private int idx;
	private int parent;
	private int sort;
	private int writer;
	private String type;
	private String name;
	private int depth;
	private String useFlag;
	private String insertDate;
	
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
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getUseFlag() {
		return useFlag;
	}
	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	@Override
	public String toString() {
		return "CodeVO [idx=" + idx + ", parent=" + parent + ", sort=" + sort + ", writer=" + writer + ", type=" + type
				+ ", name=" + name + ", depth=" + depth + ", useFlag=" + useFlag + ", insertDate=" + insertDate + "]";
	}

	
	
	
	
}
