package com.mercury.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.mercury.bean.User;
import com.mercury.dao.UserDao;

public class UserDaoImpl implements UserDao {
	private HibernateTemplate template;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		template = new HibernateTemplate(sessionFactory);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public User findByUserName(String username) {
		String hql = "from User where username = ?";
		List<User> users = template.find(hql, username);
		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}
	}
	
	@Override
	public void save(User user){
		template.save(user);
	}
	@Override
	public void update(User user) {
		template.update(user);
	}

}