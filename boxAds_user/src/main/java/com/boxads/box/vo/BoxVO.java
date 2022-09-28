package com.boxads.box.vo;

public class BoxVO {
	
	private int idx;
	private int mIdx;
	private String state;
	private String title;
	private String content;
	private int writer;
	private int pCIdx;
	private int cCIdx;
	private String ctmAge;
	private String ctmGender;
	private String ctmType;
	private String avgPrice;
	private String url;
	private int pdtCnt;
	private int totalCnt;
	private int sellCnt;
	private int boxCnt;
	private int viewCnt;
	private int unit;
	private String reason;
	private String sellDate;
	private String insertDate;
	private String updateDate;
	private int adPrice;
	private String intro;
	private String mIntro;
	private String boxCode;
	private String siteUrl;
	private String soldOutFlag;
	
	private String secCtg;
	private String thrCtg;
	private String secPro;
	private String thrPro;
	private String fileName;
	private String fileType;
	private String profile;
	private String name;
	private int odCnt;
	private String type = "";
	
	private int favCnt; // 좋아요 수
	private String favFlag; 
		
	private String searchKeyword;
	
	private int start;
	private int end;
	private String startDate;
	private String endDate;
	
	
	public int getmIdx() {
		return mIdx;
	}
	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
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
	public int getOdCnt() {
		return odCnt;
	}
	public void setOdCnt(int odCnt) {
		this.odCnt = odCnt;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getFavFlag() {
		return favFlag;
	}
	public void setFavFlag(String favFlag) {
		this.favFlag = favFlag;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSiteUrl() {
		return siteUrl;
	}
	public void setSiteUrl(String siteUrl) {
		this.siteUrl = siteUrl;
	}
	
	public String getBoxCode() {
		return boxCode;
	}
	public void setBoxCode(String boxCode) {
		this.boxCode = boxCode;
	}
	public String getSecPro() {
		return secPro;
	}
	public void setSecPro(String secPro) {
		this.secPro = secPro;
	}
	public String getThrPro() {
		return thrPro;
	}
	public void setThrPro(String thrPro) {
		this.thrPro = thrPro;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
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
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
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
	public int getpCIdx() {
		return pCIdx;
	}
	public void setpCIdx(int pCIdx) {
		this.pCIdx = pCIdx;
	}
	public int getcCIdx() {
		return cCIdx;
	}
	public void setcCIdx(int cCIdx) {
		this.cCIdx = cCIdx;
	}
	public String getCtmAge() {
		return ctmAge;
	}
	public void setCtmAge(String ctmAge) {
		this.ctmAge = ctmAge;
	}
	public String getCtmGender() {
		return ctmGender;
	}
	public void setCtmGender(String ctmGender) {
		this.ctmGender = ctmGender;
	}
	public String getCtmType() {
		return ctmType;
	}
	public void setCtmType(String ctmType) {
		this.ctmType = ctmType;
	}
	public String getAvgPrice() {
		return avgPrice;
	}
	public void setAvgPrice(String avgPrice) {
		this.avgPrice = avgPrice;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getPdtCnt() {
		return pdtCnt;
	}
	public void setPdtCnt(int pdtCnt) {
		this.pdtCnt = pdtCnt;
	}
	public int getBoxCnt() {
		return boxCnt;
	}
	public void setBoxCnt(int boxCnt) {
		this.boxCnt = boxCnt;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getUnit() {
		return unit;
	}
	public void setUnit(int unit) {
		this.unit = unit;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getSellDate() {
		return sellDate;
	}
	public void setSellDate(String sellDate) {
		this.sellDate = sellDate;
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
	public int getAdPrice() {
		return adPrice;
	}
	public void setAdPrice(int adPrice) {
		this.adPrice = adPrice;
	}
	
	public String getSoldOutFlag() {
		return soldOutFlag;
	}
	public void setSoldOutFlag(String soldOutFlag) {
		this.soldOutFlag = soldOutFlag;
	}
	public int getFavCnt() {
		return favCnt;
	}
	public void setFavCnt(int favCnt) {
		this.favCnt = favCnt;
	}
	public int getSellCnt() {
		return sellCnt;
	}
	public void setSellCnt(int sellCnt) {
		this.sellCnt = sellCnt;
	}
	public String getmIntro() {
		return mIntro;
	}
	public void setmIntro(String mIntro) {
		this.mIntro = mIntro;
	}
	@Override
	public String toString() {
		return "BoxVO [idx=" + idx + ", mIdx=" + mIdx + ", state=" + state + ", title=" + title + ", content=" + content
				+ ", writer=" + writer + ", pCIdx=" + pCIdx + ", cCIdx=" + cCIdx + ", ctmAge=" + ctmAge + ", ctmGender="
				+ ctmGender + ", ctmType=" + ctmType + ", avgPrice=" + avgPrice + ", url=" + url + ", pdtCnt=" + pdtCnt
				+ ", totalCnt=" + totalCnt + ", sellCnt=" + sellCnt + ", boxCnt=" + boxCnt + ", viewCnt=" + viewCnt
				+ ", unit=" + unit + ", reason=" + reason + ", sellDate=" + sellDate + ", insertDate=" + insertDate
				+ ", updateDate=" + updateDate + ", adPrice=" + adPrice + ", intro=" + intro + ", mIntro=" + mIntro
				+ ", boxCode=" + boxCode + ", siteUrl=" + siteUrl + ", soldOutFlag=" + soldOutFlag + ", secCtg="
				+ secCtg + ", thrCtg=" + thrCtg + ", secPro=" + secPro + ", thrPro=" + thrPro + ", fileName=" + fileName
				+ ", fileType=" + fileType + ", profile=" + profile + ", name=" + name + ", odCnt=" + odCnt + ", type="
				+ type + ", favCnt=" + favCnt + ", favFlag=" + favFlag + ", searchKeyword=" + searchKeyword + ", start="
				+ start + ", end=" + end + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
	
	
	
	
	
	
}