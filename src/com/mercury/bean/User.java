package com.mercury.bean;

import java.util.HashSet;
import java.util.Set;
 
public class User {
	private int user_id;
	private String username;
	private String password;
	private String email;
	private boolean enabled;
	private Set<UserRole> userRoles = new HashSet<UserRole>();
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public Set<UserRole> getUserRoles() {
		return userRoles;
	}
	public void setUserRoles(Set<UserRole> userRoles) {
		this.userRoles = userRoles;
	}
	
	public void addUserRole(UserRole role) {
		userRoles.add(role);
	}
	
	public void removeUserRole(UserRole role) {
		userRoles.remove(role);
	}
 
}
