package com.mercury.service;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mercury.bean.UserRole;
import com.mercury.dao.UserDao;

@Service
@Transactional(readOnly=true)
public class CustomUserDetailsService implements UserDetailsService{	
	private UserDao ud;

	public UserDao getUd() {
		return ud;
	}
	public void setUd(UserDao ud) {
		this.ud = ud;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		com.mercury.bean.User user = ud.findByUserName(username);
		Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for (UserRole role : user.getUserRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.getAuthority()));
		}
		UserDetails userDetails = new User(
				user.getUsername(),
				user.getPassword(),
				user.isEnabled(),
				true,
				true,
				true,
				authorities 
		);
		return userDetails;
	}
	
}
