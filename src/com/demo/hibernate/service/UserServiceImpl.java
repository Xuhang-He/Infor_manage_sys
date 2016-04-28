package com.demo.hibernate.service;

import com.demo.hibernate.beans.User;
import com.demo.hibernate.dao.UserDAO;

public class UserServiceImpl implements UserService {
	UserDAO userDAO;

	public boolean login(String username, String password) {
		User record = userDAO.select(username); // 取得用户对象
		if(record == null){//用户不存在
			return false;
		}else{
			String pwd = record.getPassword();
			if(pwd != null && pwd.equals(password)){// 密码相同
				return true;
			}else{//验证错误
				return false;
			}
		}
		
	}
	
	// 检查用户名是否存在
	public boolean isExist(String username) {
		User record = userDAO.select(username);// 取得用户对象
		if(record == null){// 用户不存在
			return false;
		}else{//用户存在
			return true;
		}
	}

	// 注册一个新用户
	public Integer register(User record) {
		User user = userDAO.select(record.getUsername());
		if(user != null){// 用户名已存在
			return null;
			
		}else{
			return userDAO.insert(record);
		}

	}
	
	public UserDAO getUserDAO(){
		return userDAO;
	}
	
	public void setUserDAO(UserDAO userDAO){
		this.userDAO = userDAO;
	}
	
}
