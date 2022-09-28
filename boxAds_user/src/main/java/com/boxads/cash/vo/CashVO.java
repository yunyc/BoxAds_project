package com.boxads.cash.vo;

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
	
    private int start;
    private int end;
	private String insertDate;
	private String endDate;
	
	private String cashCode; 
	private int cash; 
	private String state; 
	private String taxBill;
	private String pAmt;
    private String pUname;
    private String pGoods;
    private String pTrNo;
    private String pFnCd1;
    private String pFnCd2;
    private String pFnNm;
    private String pAuthNo;
    private String pAuthDt;
    private String pIntMon;
	
	
	private String issue; // 세금계산서 발급여부 
	private int fee;
	
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
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getOut() {
		return out;
	}
	public void setOut(int out) {
		this.out = out;
	}
    public String getTaxBill() {
        return taxBill;
    }
    public void setTaxBill(String taxBill) {
        this.taxBill = taxBill;
    }
    public String getpAmt() {
        return pAmt;
    }
    public void setpAmt(String pAmt) {
        this.pAmt = pAmt;
    }
    public String getpUname() {
        return pUname;
    }
    public void setpUname(String pUname) {
        this.pUname = pUname;
    }
    public String getpGoods() {
        return pGoods;
    }
    public void setpGoods(String pGoods) {
        this.pGoods = pGoods;
    }
    public String getpTrNo() {
        return pTrNo;
    }
    public void setpTrNo(String pTrNo) {
        this.pTrNo = pTrNo;
    }
    public String getpFnCd1() {
        return pFnCd1;
    }
    public void setpFnCd1(String pFnCd1) {
        this.pFnCd1 = pFnCd1;
    }
    public String getpFnCd2() {
        return pFnCd2;
    }
    public void setpFnCd2(String pFnCd2) {
        this.pFnCd2 = pFnCd2;
    }
    public String getpFnNm() {
        return pFnNm;
    }
    public void setpFnNm(String pFnNm) {
        this.pFnNm = pFnNm;
    }
    public String getpAuthNo() {
        return pAuthNo;
    }
    public void setpAuthNo(String pAuthNo) {
        this.pAuthNo = pAuthNo;
    }
    public String getpAuthDt() {
        return pAuthDt;
    }
    public void setpAuthDt(String pAuthDt) {
        this.pAuthDt = pAuthDt;
    }
    public String getpIntMon() {
        return pIntMon;
    }
    public void setpIntMon(String pIntMon) {
        this.pIntMon = pIntMon;
    }

	public String getIssue() {
		return issue;
	}

	public void setIssue(String issue) {
		this.issue = issue;
	}
	

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

    @Override
    public String toString() {
        return "CashVO [idx=" + idx + ", mIdx=" + mIdx + ", oIdx=" + oIdx + ", category=" + category + ", type=" + type
                + ", content=" + content + ", cashBefore=" + cashBefore + ", cashIncrease=" + cashIncrease
                + ", cashAfter=" + cashAfter + ", cashResidual=" + cashResidual + ", useFlag=" + useFlag + ", keyword="
                + keyword + ", name=" + name + ", start=" + start + ", end=" + end + ", insertDate=" + insertDate
                + ", endDate=" + endDate + ", cashCode=" + cashCode + ", cash=" + cash + ", state=" + state
                + ", taxBill=" + taxBill + ", pAmt=" + pAmt + ", pUname=" + pUname + ", pGoods=" + pGoods + ", pTrNo="
                + pTrNo + ", pFnCd1=" + pFnCd1 + ", pFnCd2=" + pFnCd2 + ", pFnNm=" + pFnNm + ", pAuthNo=" + pAuthNo
                + ", pAuthDt=" + pAuthDt + ", pIntMon=" + pIntMon + ", issue=" + issue + ", fee=" + fee + ", out=" + out
                + "]";
    }


	
	
}