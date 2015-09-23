package com.mercury.bean;

public class UserRole{
	private int user_role_id;
	private User user;
	private String authority;
	
	public UserRole() {}
	public UserRole(User user, String authority) {
		this.user = user;
		this.authority = authority;
	}
	
	public int getUser_role_id() {
		return user_role_id;
	}
	public void setUser_role_id(int user_role_id) {
		this.user_role_id = user_role_id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
}