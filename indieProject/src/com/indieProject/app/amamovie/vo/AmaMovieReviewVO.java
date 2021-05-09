package com.indieProject.app.amamovie.vo;
/*AMANUM NUMBER,
REPLYNUM NUMBER,
STARS NUMBER,
MEMBERID VARCHAR2(100),
REPLYCONTENT VARCHAR2(500),
REPLYDATE DATE,*/
public class AmaMovieReviewVO {
	private int amaNum;
	private int replyNum;
	private int stars;
	private String memberId;
	private String replyContent;
	private String replyDate;

	public int getAmaNum() {
		return amaNum;
	}
	public void setAmaNum(int amaNum) {
		this.amaNum = amaNum;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

}
