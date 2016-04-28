package com.demo.hibernate.test;

import com.demo.hibernate.beans.User;
import com.demo.hibernate.dao.UserDAO;
import com.demo.hibernate.dao.UserDAOImpl;
import com.demo.hibernate.service.UserServiceImpl;

import junit.framework.TestCase;

public class UserServiceTest extends TestCase {
	public UserServiceImpl userService;
	
	public UserServiceTest(String name){
		super(name);
	}
	
	protected void setUp()throws Exception {
		super.setUp();
		userService = new UserServiceImpl();
		UserDAO userDAO = new UserDAOImpl() ;
		userService.setUserDAO(userDAO);
		
	}
	
	protected void tearDown() throws Exception {
		super.tearDown();
	}
	
	//测试登陆
	public void testLogin() throws Exception{
		assertTrue(userService.login("admin", "admin"));
	}
	
	// 测试检查用户名
	public void testIsExist() throws Exception{
		assertTrue(userService.isExist("admin"));
	}
	
	//测试注册
	public void testInsert() throws Exception{
		User record = new User();
		record.setUsername("test");
		record.setPassword("123");
		record.setEmail("lzb_box@163.com");
		userService.register(record);
		assertTrue(userService.isExist("test"));
	}
	
}
