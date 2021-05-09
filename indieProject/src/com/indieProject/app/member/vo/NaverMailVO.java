package com.indieProject.app.member.vo;

public class NaverMailVO {
	private String email;
	private String password;
	
	public NaverMailVO() {
		this.email = "이메일주소작성"; //네이버이메일주소작성
		this.password = "패스워드작성"; //패스워드작성
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}
}
