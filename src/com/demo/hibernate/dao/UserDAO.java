package com.demo.hibernate.dao;

import com.demo.hibernate.beans.User;

public interface UserDAO {
	//按用户名查询
	public User select(String username) ;
	
	// 插入用户
	public Integer insert(User record) ;
		
}
