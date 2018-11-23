package com.baizhi.dao;

import org.apache.ibatis.annotations.Param;

import com.baizhi.entity.User;

public interface UserDao {
	
	public User selectTwo(@Param("username") String name, @Param("password") String pwd);
	
	public void insert(User user);
}
