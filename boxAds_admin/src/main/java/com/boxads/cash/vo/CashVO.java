package com.boxads.cash.vo;

import java.util.Arrays;
import java.util.List;

public class CashVO {
	
	private int idx; 
	private int mIdx; 
	private int oIdx; 
	private String category; 
	private String type; 
	private String content; 
	private int cashBefore; 
	private int cashIncrease; 
	private int cashAfter; 
	private int cashResidual; 
	private String useFlag;
	private String keyword;
	private String name;
	
	private String excel;
	
    private int start = 0;
    private int end = 10;
	private String insertDate;
	private String endDate;
	
	private String cashCode; 
	private int cash; 
	private String info; 
	private String state; 
	private String moduleUuid;
	
	private String[] typeArr;
	private String searchType;
	
	private int out;
	
	public CashVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CashVO(int mIdx, int oIdx, String category, String type, String content, int cashIncrease, String endDate) {
		this.mIdx = mIdx;
		this.oIdx = oIdx;
		this.category = category;
		this.type = type;
		this.content = content;
		this.cashIncrease = cashIncrease;
		this.endDate = endDate;
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
	public int getoIdx() {
		return oIdx;
	}
	public void setoIdx(int oIdx) {
		this.oIdx = oIdx;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCashBefore() {
		return cashBefore;
	}
	public void setCashBefore(int cashBefore) {
		this.cashBefore = cashBefore;
	}
	public int getCashIncrease() {
		return cashIncrease;
	}
	public void setCashIncrease(int cashIncrease) {
		this.cashIncrease = cashIncrease;
	}
	public int getCashAfter() {
		return cashAfter;
	}
	public void setCashAfter(int cashAfter) {
		this.cashAfter = cashAfter;
	}
	public int getCashResidual() {
		return cashResidual;
	}
	public void setCashResidual(int cashResidual) {
		this.cashResidual = cashResidual;
	}
	public String getUseFlag() {
		return useFlag;
	}
	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
	}
	public String getKeyword() {
        return keyword;
    }
    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
    public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getCashCode() {
		return cashCode;
	}
	public void setCashCode(String cashCode) {
		this.cashCode = cashCode;
	}
	public int getCash() {
		return cash;
	}
	public void setCash(int cash) {
		this.cash = cash;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getModuleUuid() {
		return moduleUuid;
	}
	public void setModuleUuid(String moduleUuid) {
		this.moduleUuid = moduleUuid;
	}

	public int getOut() {
		return out;
	}

	public void setOut(int out) {
		this.out = out;
	}

	public String getExcel() {
		return excel;
	}

	public void setExcel(String excel) {
		this.excel = excel;
	}

	public String[] getTypeArr() {
		return typeArr;
	}

	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	@Override
	public String toString() {
		return "CashVO [idx=" + idx + ", mIdx=" + mIdx + ", oIdx=" + oIdx + ", category=" + category + ", type=" + type
				+ ", content=" + content + ", cashBefore=" + cashBefore + ", cashIncrease=" + cashIncrease
				+ ", cashAfter=" + cashAfter + ", cashResidual=" + cashResidual + ", useFlag=" + useFlag + ", keyword="
				+ keyword + ", name=" + name + ", excel=" + excel + ", start=" + start + ", end=" + end
				+ ", insertDate=" + insertDate + ", endDate=" + endDate + ", cashCode=" + cashCode + ", cash=" + cash
				+ ", info=" + info + ", state=" + state + ", moduleUuid=" + moduleUuid + ", typeArr="
				+ Arrays.toString(typeArr) + ", searchType=" + searchType + ", out=" + out + "]";
	}




	
	
	

	
	
}