package com.boxads.member.vo;

public class MemberVO {
	private int idx;
	private int fIdx;
	private String name;
	private String id;
	private String pw;
	private String state;
	private String authFlag;
	private String authkey;
	private String phone;
	private String address;
	private String companyName;
	private String companyNumber;
	private String confirmFlag;
	private String confirmDate;
	private String insertDate;
	private String deleteDate;
	private String loginDate;
	private int loginCnt;
	private String companyType;
	private String sector;
	private String business;
	private String siteUrl;
	private String intro;
	private String proName;
	private String proPhone;
	private String proAddress;
	private String agree = "N";
	private String detail;
	private String proDetail;
	private String quitMsg;
	private String endDate;
	private String keyword;
	private String searchType;
	private String excel;
	private String companyFile;
	private String profile;
	
	private int start = 0;
	private int end = 10;
	
	
	public String getCompanyFile() {
		return companyFile;
	}
	public void setCompanyFile(String companyFile) {
		this.companyFile = companyFile;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getfIdx() {
		return fIdx;
	}
	public void setfIdx(int fIdx) {
		this.fIdx = fIdx;
	}
	public String getExcel() {
		return excel;
	}
	public void setExcel(String excel) {
		this.excel = excel;
	}
	public String getQuitMsg() {
		return quitMsg;
	}
	public void setQuitMsg(String quitMsg) {
		this.quitMsg = quitMsg;
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
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getProDetail() {
		return proDetail;
	}
	public void setProDetail(String proDetail) {
		this.proDetail = proDetail;
	}
	public String getAgree() {
		return agree;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
	public String getAuthFlag() {
		return authFlag;
	}
	public void setAuthFlag(String authFlag) {
		this.authFlag = authFlag;
	}
	public String getCompanyType() {
		return companyType;
	}
	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}
	public String getSector() {
		return sector;
	}
	public void setSector(String sector) {
		this.sector = sector;
	}
	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	public String getSiteUrl() {
		return siteUrl;
	}
	public void setSiteUrl(String siteUrl) {
		this.siteUrl = siteUrl;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProPhone() {
		return proPhone;
	}
	public void setProPhone(String proPhone) {
		this.proPhone = proPhone;
	}
	public String getProAddress() {
		return proAddress;
	}
	public void setProAddress(String proAddress) {
		this.proAddress = proAddress;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getAuth_flag() {
		return authFlag;
	}
	public void setAuth_flag(String auth_flag) {
		this.authFlag = auth_flag;
	}
	public String getAuthkey() {
		return authkey;
	}
	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyNumber() {
		return companyNumber;
	}
	public void setCompanyNumber(String companyNumber) {
		this.companyNumber = companyNumber;
	}
	public String getConfirmFlag() {
		return confirmFlag;
	}
	public void setConfirmFlag(String confirmFlag) {
		this.confirmFlag = confirmFlag;
	}
	public String getConfirmDate() {
		return confirmDate;
	}
	public void setConfirmDate(String confirmDate) {
		this.confirmDate = confirmDate;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getDeleteDate() {
		return deleteDate;
	}
	public void setDeleteDate(String deleteDate) {
		this.deleteDate = deleteDate;
	}
	public String getLoginDate() {
		return loginDate;
	}
	public void setLoginDate(String loginDate) {
		this.loginDate = loginDate;
	}
	public int getLoginCnt() {
		return loginCnt;
	}
	public void setLoginCnt(int loginCnt) {
		this.loginCnt = loginCnt;
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
	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", name=" + name + ", id=" + id + ", pw=" + pw + ", state=" + state
				+ ", authFlag=" + authFlag + ", authkey=" + authkey + ", phone=" + phone + ", address=" + address
				+ ", companyName=" + companyName + ", companyNumber=" + companyNumber + ", confirmFlag=" + confirmFlag
				+ ", confirmDate=" + confirmDate + ", insertDate=" + insertDate + ", deleteDate=" + deleteDate
				+ ", loginDate=" + loginDate + ", loginCnt=" + loginCnt + ", companyType=" + companyType + ", sector="
				+ sector + ", business=" + business + ", siteUrl=" + siteUrl + ", intro=" + intro + ", proName="
				+ proName + ", proPhone=" + proPhone + ", proAddress=" + proAddress + ", agree=" + agree + ", detail="
				+ detail + ", proDetail=" + proDetail + ", quitMsg=" + quitMsg + ", endDate=" + endDate + ", keyword="
				+ keyword + ", searchType=" + searchType + ", start=" + start + ", end=" + end + "]";
	}

	
	
}
