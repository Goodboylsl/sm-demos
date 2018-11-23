package com.baizhi.service;

import com.baizhi.entity.User;

public interface UserService {
	
	public User Login(String name, String pwd);
	
	public void Register(User user);
}
