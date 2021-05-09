package com.indieProject.app.amamovie.vo;
//AMANUM NUMBER,
//MAKERPOSITION VARCHAR2(100),
//MAKERNAME VARCHAR2(100),
public class AmaMovieMakerVO {
	private int amaNum;
	private String makerPosition;
	private String makerName;
	
	public AmaMovieMakerVO() {;}

	public int getAmaNum() {
		return amaNum;
	}

	public void setAmaNum(int amaNum) {
		this.amaNum = amaNum;
	}

	public String getMakerPosition() {
		return makerPosition;
	}

	public void setMakerPosition(String makerPosition) {
		this.makerPosition = makerPosition;
	}

	public String getMakerName() {
		return makerName;
	}

	public void setMakerName(String makerName) {
		this.makerName = makerName;
	}
	
	
	
}
