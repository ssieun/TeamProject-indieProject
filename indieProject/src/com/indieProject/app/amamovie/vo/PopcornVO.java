package com.indieProject.app.amamovie.vo;
/*CREATE TABLE POPCORN_USE_TABLE(
   SENDID VARCHAR2(100),
   RECEIVEID VARCHAR2(100),
   SENDDATE DATE,
   AMANUM NUMBER,
   POPCORNNUM NUMBER,
   POPCORNCONTENT VARCHAR2(500),
   CONSTRAINT FK_POPCORN_USE_SENDID FOREIGN KEY (SENDID) REFERENCES MEMBER_TABLE(MEMBERID),
   CONSTRAINT FK_POPCORN_USE_RECEIVEID FOREIGN KEY (RECEIVEID) REFERENCES MEMBER_TABLE(MEMBERID),
   CONSTRAINT FK_POPCORN_USE_AMANUM FOREIGN KEY (AMANUM) REFERENCES AMAMOVIE_TABLE(AMANUM)
);*/
public class PopcornVO {
     private String sendId;
	 private String receiveId;
	 private String sendDate;
	 private int amaNum;
	 private int popcornNum;
	 private String popcornContent;
	 
	 public PopcornVO() {;}

	public String getSendId() {
		return sendId;
	}

	public void setSendId(String sendId) {
		this.sendId = sendId;
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

	public int getAmaNum() {
		return amaNum;
	}

	public void setAmaNum(int amaNum) {
		this.amaNum = amaNum;
	}

	public int getPopcornNum() {
		return popcornNum;
	}

	public void setPopcornNum(int popcornNum) {
		this.popcornNum = popcornNum;
	}

	public String getPopcornContent() {
		return popcornContent;
	}

	public void setPopcornContent(String popcornContent) {
		this.popcornContent = popcornContent;
	}
	 
	 
	
}
