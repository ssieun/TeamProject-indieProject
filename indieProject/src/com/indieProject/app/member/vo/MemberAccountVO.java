package com.indieProject.app.member.vo;
//MEMBERID VARCHAR2(100),
//MEMBERNAME VARCHAR2(100),
//MEMBERBANK VARCHAR2(100),
//ACCOUNTNUM VARCHAR2(200),
public class MemberAccountVO {
	private String memberId;
	private String memberName;
	private String memberBank;
	private String accountNum;
	
	public MemberAccountVO() {;}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
	
	
}
