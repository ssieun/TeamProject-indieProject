package com.indieProject.app.board.vo;
/*BOARDNUM NUMBER,
REPLYNUM NUMBER,
MEMBERID VARCHAR2(100),
REPLYCONTENT VARCHAR2(1000),
REPLYDATE DATE,*/
public class BoardReplyVO {
	private int boardNum;
	private int replyNum;
	private String memberId;
	private String replyContent;
	private String replyDate;;
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
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
