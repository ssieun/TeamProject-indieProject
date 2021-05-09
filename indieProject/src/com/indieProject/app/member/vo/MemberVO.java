package com.indieProject.app.member.vo;
/*
CREATE TABLE MEMBER_TABLE(
   MEMBERID VARCHAR2(100),
   MEMBERPW VARCHAR2(100),
   MEMBERNAME VARCHAR2(100),
   MEMBEREMAIL VARCHAR2(300),
   POPCORNNUM NUMBER,
   CONSTRAINT PK_MEMBER PRIMARY KEY (MEMBERID) 
);
*/
public class MemberVO {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberEmail;
	private int popcornNum;
	private int myPopcorn;
	
	public int getMyPopcorn() {
		return myPopcorn;
	}

	public void setMyPopcorn(int myPopcorn) {
		this.myPopcorn = myPopcorn;
	}

	public MemberVO() {;}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public int getPopcornNum() {
		return popcornNum;
	}

	public void setPopcornNum(int popcornNum) {
		this.popcornNum = popcornNum;
	}
	
	
}
