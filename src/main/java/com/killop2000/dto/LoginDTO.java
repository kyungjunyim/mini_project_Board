package com.killop2000.dto;

public class LoginDTO {
	private String userId;
	private String userPwd;
	private boolean useCookie;
	public LoginDTO() {
		super();
	}
	public LoginDTO(String userId, String userPwd, boolean useCookie) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.useCookie = useCookie;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	@Override
	public String toString() {
		return "LoginDTO [userId=" + userId + ", userPwd=" + userPwd + ", useCookie=" + useCookie + "]";
	}
}
