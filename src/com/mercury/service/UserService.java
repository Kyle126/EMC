package com.mercury.service;

import org.apache.commons.codec.digest.DigestUtils;

import com.mercury.bean.User;
import com.mercury.bean.UserRole;
import com.mercury.dao.UserDao;

public class UserService {
	private UserDao ud;

	public UserDao getUd() {
		return ud;
	}
	public void setUd(UserDao ud) {
		this.ud = ud;
	}
	
	public User checkUser(String username){
		User user = ud.findByUserName(username);
		return user;
	}
	
	// Save normal user ROLE_USER
	public void saveUser(User user){
		UserRole role = new UserRole(user, "ROLE_USER");
		user.addUserRole(role);
		ud.save(user);
	}
	
	public void updatePassword(String username, String newPwd) {
		User user = ud.findByUserName(username);
		user.setPassword(newPwd);
		ud.update(user);
	}
	
	public void updateEmail(String username, String email) {
		User user = ud.findByUserName(username);
		user.setEmail(email);
		ud.update(user);
	}
	
	public String[] activateUser(String username){
		User user = ud.findByUserName(username);
		if (!user.isEnabled()) {
			user.setEnabled(true);
			ud.update(user);
			return new String[] {"success", "Your account is activated sucessfully."};
		} else {
			return new String[] {"error", "Your account has already been activated."};
		}
	}
	
	public String getMd5Password(String password){
		return DigestUtils.md5Hex(password);
	}
}
