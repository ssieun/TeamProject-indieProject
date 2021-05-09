package com.indieProject.app.member.vo;
//MEMBERID VARCHAR2(100),
//MONEY NUMBER,
//POPCORNNUM NUMBER,
//EXCHANGEDATE DATE,
//EXCHANGECHECK VARCHAR2(20),
public class PopcornExchangeVO {
	private String memberId;
	private int money;
	private int popcornNum;
	private String exchangeDate;
	private String exchangeCheck;
	private String successDate;
	private int exchangeNum;
	
	public PopcornExchangeVO() {;}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getPopcornNum() {
		return popcornNum;
	}

	public void setPopcornNum(int popcornNum) {
		this.popcornNum = popcornNum;
	}

	public String getExchangeDate() {
		return exchangeDate;
	}

	public void setExchangeDate(String exchangeDate) {
		this.exchangeDate = exchangeDate;
	}

	public String getExchangeCheck() {
		return exchangeCheck;
	}

	public void setExchangeCheck(String exchangeCheck) {
		this.exchangeCheck = exchangeCheck;
	}

	public String getSuccessDate() {
		return successDate;
	}

	public void setSuccessDate(String successDate) {
		this.successDate = successDate;
	}

	public int getExchangeNum() {
		return exchangeNum;
	}

	public void setExchangeNum(int exchangeNum) {
		this.exchangeNum = exchangeNum;
	}
	
	
}
