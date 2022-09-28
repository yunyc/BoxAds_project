package com.boxads.main.vo;

public class MemberVO {
	private int idx;
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
	private String sessionId;
	private String quitMsg;
	
	public String getQuitMsg() {
		return quitMsg;
	}
	public void setQuitMsg(String quitMsg) {
		this.quitMsg = quitMsg;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
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
	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", name=" + name + ", id=" + id + ", pw=" + pw + ", state=" + state
				+ ", authFlag=" + authFlag + ", authkey=" + authkey + ", phone=" + phone + ", address=" + address
				+ ", companyName=" + companyName + ", companyNumber=" + companyNumber + ", confirmFlag=" + confirmFlag
				+ ", confirmDate=" + confirmDate + ", insertDate=" + insertDate + ", deleteDate=" + deleteDate
				+ ", loginDate=" + loginDate + ", loginCnt=" + loginCnt + ", companyType=" + companyType + ", sector="
				+ sector + ", business=" + business + ", siteUrl=" + siteUrl + ", intro=" + intro + ", proName="
				+ proName + ", proPhone=" + proPhone + ", proAddress=" + proAddress + ", agree=" + agree + ", detail="
				+ detail + ", proDetail=" + proDetail + "]";
	}
	
	
}