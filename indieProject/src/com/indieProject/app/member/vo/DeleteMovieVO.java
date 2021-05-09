package com.indieProject.app.member.vo;
/*
 * MEMBERID VARCHAR2(100),
	AMANUM NUMBER,
	AMATITLEKOR VARCHAR2(100),
	REQUESTDATE DATE,
	SUCCESSDATE DATE,
	DELETECHECK VARCHAR2(20),
 */
public class DeleteMovieVO {
	private String memberId;
	private int amaNum;
	private String amaTitleKor;
	private String requestDate;
	private String successDate;
	private String deleteCheck;
	private String reason;
	
	public DeleteMovieVO() {;}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getAmaNum() {
		return amaNum;
	}

	public void setAmaNum(int amaNum) {
		this.amaNum = amaNum;
	}

	public String getAmaTitleKor() {
		return amaTitleKor;
	}

	public void setAmaTitleKor(String amaTitleKor) {
		this.amaTitleKor = amaTitleKor;
	}

	public String getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}

	public String getSuccessDate() {
		return successDate;
	}

	public void setSuccessDate(String successDate) {
		this.successDate = successDate;
	}

	public String getDeleteCheck() {
		return deleteCheck;
	}

	public void setDeleteCheck(String deleteCheck) {
		this.deleteCheck = deleteCheck;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
}
