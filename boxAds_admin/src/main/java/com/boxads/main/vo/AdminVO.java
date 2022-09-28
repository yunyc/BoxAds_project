package com.boxads.main.vo;

public class AdminVO {
	
	private int idx;
	private String name;
	private String id;
	private String pw;
	private String insertDate;	
	private String email; 
	private String phone; 
	private String dpmt; 
	private String grp; 
	private String useFlag; 
	private String loginDate;
	private String searchType;

	private int aIdx; 
	private int uIdx;
	private String pdt = "N"; 
	private String odr = "N";  
	private String cal = "N"; 
	private String etc = "N"; 
	private String member = "N"; 
	private String site = "N"; 
	private String setting = "N"; 
	private String stat = "N"; 
	private String print = "N"; 
	
	private int start = 0;
	private int end = 10;
	
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
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDpmt() {
		return dpmt;
	}
	public void setDpmt(String dpmt) {
		this.dpmt = dpmt;
	}
	public String getGrp() {
		return grp;
	}
	public void setGrp(String grp) {
		this.grp = grp;
	}
	public String getUseFlag() {
		return useFlag;
	}
	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
	}
	public String getLoginDate() {
		return loginDate;
	}
	public void setLoginDate(String loginDate) {
		this.loginDate = loginDate;
	}
	public int getaIdx() {
		return aIdx;
	}
	public void setaIdx(int aIdx) {
		this.aIdx = aIdx;
	}
	public int getuIdx() {
		return uIdx;
	}
	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}
	public String getPdt() {
		return pdt;
	}
	public void setPdt(String pdt) {
		this.pdt = pdt;
	}
	public String getOdr() {
		return odr;
	}
	public void setOdr(String odr) {
		this.odr = odr;
	}
	public String getCal() {
		return cal;
	}
	public void setCal(String cal) {
		this.cal = cal;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getMember() {
		return member;
	}
	public void setMember(String member) {
		this.member = member;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public String getSetting() {
		return setting;
	}
	public void setSetting(String setting) {
		this.setting = setting;
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	public String getPrint() {
		return print;
	}
	public void setPrint(String print) {
		this.print = print;
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
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	@Override
	public String toString() {
		return "AdminVO [idx=" + idx + ", name=" + name + ", id=" + id + ", pw=" + pw + ", insertDate=" + insertDate
				+ ", email=" + email + ", phone=" + phone + ", dpmt=" + dpmt + ", grp=" + grp + ", useFlag=" + useFlag
				+ ", loginDate=" + loginDate + ", searchType=" + searchType + ", aIdx=" + aIdx + ", uIdx=" + uIdx
				+ ", pdt=" + pdt + ", odr=" + odr + ", cal=" + cal + ", etc=" + etc + ", member=" + member + ", site="
				+ site + ", setting=" + setting + ", stat=" + stat + ", print=" + print + ", start=" + start + ", end="
				+ end + "]";
	}


	
	
	
	
	
	
	
	

}
