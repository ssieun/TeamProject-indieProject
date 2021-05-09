package com.indieProject.app.member.vo;
//AMATITLEKOR VARCHAR2(100),
//SENDID VARCHAR2(100),
//RECEIVEID VARCHAR2(100),
//SENDDATE DATE,
//AMANUM NUMBER,
//POPCORNNUM NUMBER,
//POPCORNCONTENT VARCHAR2(500),
public class MyPagePopcornVO {
	private String receiveId;
	private String amaTitleKor;

	private int popCornNum;
	private String sendDate;

	public String getAmaTitleKor() {
		return amaTitleKor;
	}
	public void setAmaTitleKor(String amaTitleKor) {
		this.amaTitleKor = amaTitleKor;
	}
	public String getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	public int getPopCornNum() {
		return popCornNum;
	}
	public void setPopCornNum(int popCornNum) {
		this.popCornNum = popCornNum;
	}


}
