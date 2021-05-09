package com.indieProject.app.promovie.vo;

public class ChromeDriverVO {
	private static String chromeDriver = "C:\\chromedriver.exe";
	//윈도우 기준 C:\\chromedriver.exe
	//네이버 서버 기준 /usr/bin/chromedriver
	
	public ChromeDriverVO() {;}

	public static String getPath() {
		return chromeDriver;
	}
}
