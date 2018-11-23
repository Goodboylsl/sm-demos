package com.baizhi.service.impl;

import com.baizhi.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baizhi.dao.UserDao;
import com.baizhi.service.UserService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	
	@Override
	public User Login(String name,String pwd) {
		User user = userDao.selectTwo(name,pwd);
		return user;
	}


	@Override
	public void Register(User user) {
		userDao.insert(user);
		
	}

}
