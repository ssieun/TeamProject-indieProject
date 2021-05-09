package com.indieProject.app.amamovie.vo;
//AMANUM NUMBER,
//AMACAST VARCHAR2(100),
//ACTORNAME VARCHAR2(100),
public class AmaMovieActorVO {
	private int amaNum;
	private String amaCast;
	private String actorName;
	
	public AmaMovieActorVO() {;}
	
	public int getAmaNum() {
		return amaNum;
	}
	public void setAmaNum(int amaNum) {
		this.amaNum = amaNum;
	}
	public String getAmaCast() {
		return amaCast;
	}
	public void setAmaCast(String amaCast) {
		this.amaCast = amaCast;
	}
	public String getActorName() {
		return actorName;
	}
	public void setActorName(String actorName) {
		this.actorName = actorName;
	}
	
	
}
