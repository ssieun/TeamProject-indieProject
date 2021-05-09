package com.indieProject.app.board.vo;
/*CREATE TABLE BOARDIMAGES_TABLE(
   BOARDNUM NUMBER,
   IMAGENAME VARCHAR2(1000),
   CONSTRAINT FK_BOARDIMAGE FOREIGN KEY (BOARDNUM) REFERENCES BOARD_TABLE (BOARDNUM)
);*/
public class BoardImageVO {
	private int boardNum;
	private String imageName;

	public BoardImageVO() {;}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	
}
