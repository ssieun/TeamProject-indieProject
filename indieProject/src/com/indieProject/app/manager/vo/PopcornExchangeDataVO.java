package com.indieProject.app.manager.vo;
// ROWNUM, pet.MEMBERID, pet.MONEY, pet.POPCORNNUM, pet.EXCHANGEDATE, pet.EXCHANGECHECK, 
//mat.MEMBERNAME, mat.MEMBERBANK, mat.ACCOUNTNUM FROM POPCORN_EXCHANGE_TABLE pet , 
//MEMBER_ACCOUNT_TABLE mat WHERE pet.MEMBERID = mat.MEMBERID AND pet.EXCHANGECHECK = 'no');
public class PopcornExchangeDataVO {
	private int rowNumber;
	private String memberId;
	private int money;
	private int popcornNum;
	private String exchangeDate;
	private String exchangeCheck;
	private int exchangeNum;
	private String memberName;
	private String memberBank;
	private String accountNum;
	private String successDate;
	
	public PopcornExchangeDataVO() {;}

	public int getRowNum() {
		return rowNumber;
	}

	public void setRowNum(int rowNum) {
		this.rowNumber = rowNum;
	}

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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberBank() {
		return memberBank;
	}

	public void setMemberBank(String memberBank) {
		this.memberBank = memberBank;
	}

	public String getAccountNum() {
		return accountNum;
	}

	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}

	public int getExchangeNum() {
		return exchangeNum;
	}

	public void setExchangeNum(int exchangeNum) {
		this.exchangeNum = exchangeNum;
	}

	public int getRowNumber() {
		return rowNumber;
	}

	public void setRowNumber(int rowNumber) {
		this.rowNumber = rowNumber;
	}

	public String getSuccessDate() {
		return successDate;
	}

	public void setSuccessDate(String successDate) {
		this.successDate = successDate;
	}
	
	
}
