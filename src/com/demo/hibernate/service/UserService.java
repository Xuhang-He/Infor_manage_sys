package com.demo.hibernate.service;

import com.demo.hibernate.beans.User;

public interface UserService {
	// 登陆
	public boolean login(String username, String password);
	
	// 检查用户名是否存在
	public boolean isExist(String username);
	
	// 注册用户
	public Integer register(User record);
}
