package com.indieProject.app.board.vo;

/*BOARDNUM NUMBER,
MEMBERID VARCHAR2(100),
BOARDCONTENT VARCHAR2(1000),
BOARDCOUNT NUMBER,
BOARDDATE DATE,
ALTER TABLE BOARD_TABLE ADD IMAGE VARCHAR2(100);
*/

public class BoardVO {
	private int boardNum;
	private String memberId;
	private String boardContent;
	private int boardCount;
	private String boardDate;
	private String boardImage;
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public String getBoardImage() {
		return boardImage;
	}
	public void setBoardImage(String boardImage) {
		this.boardImage = boardImage;
	}

}
