package com.boxads.product.vo;

public class ProductVO {
	
	// BoxVO
	private int idx;
	private String state;
	private String title;
	private String content;
	private int writer;
	private String pCIdx;
	private String cCIdx;
	private String ctmAge;
	private String ctmGender;
	private String ctmType;
	private String avgPrice;
	private String url;
	private int pdtCnt;
	private int boxCnt;
	private String viewCnt;
	private int unit;
	private String reason;
	private String sellDate;
	private String insertDate;
	private String updateDate;
	private String adPrice;
	private String intro;
	
	// AdVO
	private String adStartDate;
	private String adEndDate;
	private String viewStartDate;
	private String viewEndDate;
	private String qrcode;
	
	//common
	private String type;
	private String secCtg;
	private String thrCtg;
	private String secPro;
	private String thrPro;
	private String fileName;
	private String fileType = "E";
	private String profile;
	private String name;
	private String fir;
	private String sec;
	private String thr;
	private String fth;
	private String fif;
	private String pNo;
	private String searchType;
	private String keyword;
	private String excel;
	private int favCnt;
	private String odCnt;
	private String[] stateList;
	
	private int start = 0;
	private int end = 10;
	
	public String[] getStateList() {
		return stateList;
	}
	public void setStateList(String[] stateList) {
		this.stateList = stateList;
	}
	public int getFavCnt() {
		return favCnt;
	}
	public void setFavCnt(int favCnt) {
		this.favCnt = favCnt;
	}
	public String getOdCnt() {
		return odCnt;
	}
	public void setOdCnt(String odCnt) {
		this.odCnt = odCnt;
	}
	public String getpNo() {
		return pNo;
	}
	public void setpNo(String pNo) {
		this.pNo = pNo;
	}
	
	
	public String getExcel() {
		return excel;
	}
	public void setExcel(String excel) {
		this.excel = excel;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getpCIdx() {
		return pCIdx;
	}
	public void setpCIdx(String pCIdx) {
		this.pCIdx = pCIdx;
	}
	public String getcCIdx() {
		return cCIdx;
	}
	public void setcCIdx(String cCIdx) {
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
	public String getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(String viewCnt) {
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
	public String getAdPrice() {
		return adPrice;
	}
	public void setAdPrice(String adPrice) {
		this.adPrice = adPrice;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getAdStartDate() {
		return adStartDate;
	}
	public void setAdStartDate(String adStartDate) {
		this.adStartDate = adStartDate;
	}
	public String getAdEndDate() {
		return adEndDate;
	}
	public void setAdEndDate(String adEndDate) {
		this.adEndDate = adEndDate;
	}
	public String getViewStartDate() {
		return viewStartDate;
	}
	public void setViewStartDate(String viewStartDate) {
		this.viewStartDate = viewStartDate;
	}
	public String getViewEndDate() {
		return viewEndDate;
	}
	public void setViewEndDate(String viewEndDate) {
		this.viewEndDate = viewEndDate;
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
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFir() {
		return fir;
	}
	public void setFir(String fir) {
		this.fir = fir;
	}
	public String getSec() {
		return sec;
	}
	public void setSec(String sec) {
		this.sec = sec;
	}
	public String getThr() {
		return thr;
	}
	public void setThr(String thr) {
		this.thr = thr;
	}
	public String getFth() {
		return fth;
	}
	public void setFth(String fth) {
		this.fth = fth;
	}
	public String getFif() {
		return fif;
	}
	public void setFif(String fif) {
		this.fif = fif;
	}
	public String getQrcode() {
		return qrcode;
	}
	public void setQrcode(String qrcode) {
		this.qrcode = qrcode;
	}
	
	
	
}
