package com.indieProject.app.amamovie.vo;

/*CREATE TABLE AMAMOVIE_TABLE(
		   AMANUM NUMBER,
		   AMATITLEENG VARCHAR2(100),
		   AMATITLEKOR VARCHAR2(100),
		   AMAMAKEDATE DATE,
		   AMAMOVIELENGTH VARCHAR2(100),
		   AMADIRECTOR VARCHAR2(100),
		   GENRE VARCHAR2(100),
		   RATING VARCHAR2(100),
		   LINK VARCHAR2(200),
		   POPCORN VARCHAR2(10),
		   SYNOPSIS VARCHAR2(1000),
		   THEME VARCHAR2(1000),
		   MEMBERID VARCHAR2(100),
		   AMACOUNT NUMBER,
		   AMADATE DATE,
		   CONSTRAINT PK_AMAMOVIE PRIMARY KEY (AMANUM),
		   CONSTRAINT FK_AMAMOVIE FOREIGN KEY (MEMBERID) REFERENCES MEMBER_TABLE(MEMBERID)
		);*/

public class AmaMovieVO {
	private int amaNum;
	private String amaTitleEng;
	private String amaTitleKor;
	private String amaMakeDate;
	private String amaMovieLength;
	private String amaDirector;
	private String genre;
	private String rating;
	private String link;
	private String popcorn;
	private String synopsis;
	private String theme;
	private String memberId;
	private int amaCount;
	private String amaDate;
	private String fileName;
	
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
	public int getAmaNum() {
		return amaNum;
	}
	public void setAmaNum(int amaNum) {
		this.amaNum = amaNum;
	}
	public String getAmaTitleEng() {
		return amaTitleEng;
	}
	public void setAmaTitleEng(String amaTitleEng) {
		this.amaTitleEng = amaTitleEng;
	}
	public String getAmaTitleKor() {
		return amaTitleKor;
	}
	public void setAmaTitleKor(String amaTitleKor) {
		this.amaTitleKor = amaTitleKor;
	}
	public String getAmaMakeDate() {
		return amaMakeDate;
	}
	public void setAmaMakeDate(String amaMakeDate) {
		this.amaMakeDate = amaMakeDate;
	}
	public String getAmaMovieLength() {
		return amaMovieLength;
	}
	public void setAmaMovieLength(String amaMovieLength) {
		this.amaMovieLength = amaMovieLength;
	}
	public String getAmaDirector() {
		return amaDirector;
	}
	public void setAmaDirector(String amaDirector) {
		this.amaDirector = amaDirector;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getPopcorn() {
		return popcorn;
	}
	public void setPopcorn(String popcorn) {
		this.popcorn = popcorn;
	}
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getAmaCount() {
		return amaCount;
	}
	public void setAmaCount(int amaCount) {
		this.amaCount = amaCount;
	}
	public String getAmaDate() {
		return amaDate;
	}
	public void setAmaDate(String amaDate) {
		this.amaDate = amaDate;
	}


	
}
