
package com.boxads.common.vo;

public class LogVO {
	
	private int idx;
	private int oIdx;
	private String type;
	private String content;
	private String actionFlag;
	private String insertDate;
	private String mesg;
	private String reciver;
	
	// 택배 정보
	private String delivery;	
	
	// 버튼 등 actionFlag Y 일 때 저장될 내용
	private String action;
	
	// 인쇄관리 insertKey
	private String printState;
	private String printContent;
	
	private String reasonType;
	private String reasonState;
	
	private String realName;
	private String url;
	
	public LogVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LogVO(int oIdx, String type, String content, String actionFlag, String mesg, String reciver) {
		this.oIdx = oIdx;
		this.type = type;
		this.content = content;
		this.actionFlag = actionFlag;		
		this.mesg = mesg;
		this.reciver = reciver;
	}
	
	public LogVO(String type) {
		this.type = type;
	}	
	
	public LogVO(String type, String mesg) {		
		this.type = type;
		this.mesg = mesg;
	}
	
	
	
	
	public String getReasonType() {
		return reasonType;
	}
	public void setReasonType(String reasonType) {
		this.reasonType = reasonType;
	}
	public String getReasonState() {
		return reasonState;
	}
	public void setReasonState(String reasonState) {
		this.reasonState = reasonState;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPrintContent() {
		return printContent;
	}
	public void setPrintContent(String printContent) {
		this.printContent = printContent;
	}
	public String getPrintState() {
		return printState;
	}
	public void setPrintState(String printState) {
		this.printState = printState;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getoIdx() {
		return oIdx;
	}
	public void setoIdx(int oIdx) {
		this.oIdx = oIdx;
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
	public String getActionFlag() {
		return actionFlag;
	}
	public void setActionFlag(String actionFlag) {
		this.actionFlag = actionFlag;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getMesg() {
		return mesg;
	}
	public void setMesg(String mesg) {
		this.mesg = mesg;
	}	
	public String getReciver() {
		return reciver;
	}
	public void setReciver(String reciver) {
		this.reciver = reciver;
	}
	
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	@Override
	public String toString() {
		return "LogVO [idx=" + idx + ", oIdx=" + oIdx + ", type=" + type + ", content=" + content + ", actionFlag="
				+ actionFlag + ", insertDate=" + insertDate + ", mesg=" + mesg + ", reciver=" + reciver + ", delivery="
				+ delivery + ", action=" + action + ", printState=" + printState + ", printContent=" + printContent
				+ ", reasonType=" + reasonType + ", reasonState=" + reasonState + ", realName=" + realName + ", url="
				+ url + "]";
	}

	
	

	
	

	
	
	
	
	
	
	
	
	
	
}