package com.mercury.dao;

import com.mercury.bean.User;

public interface UserDao {
	public User findByUserName(String username);
	public void save(User user);
	public void update(User user);
}
