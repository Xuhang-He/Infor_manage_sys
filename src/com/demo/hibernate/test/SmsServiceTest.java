package com.demo.hibernate.test;


import java.util.Iterator;

import com.demo.hibernate.beans.Sms;
import com.demo.hibernate.dao.SmsDAO;
import com.demo.hibernate.dao.SmsDAOImpl;
import com.demo.hibernate.service.SmsServiceImpl;
import com.demo.hibernate.util.Pager;

import junit.framework.TestCase;

public class SmsServiceTest extends TestCase {
	public SmsServiceImpl smsService;
	public static Integer id = null;
	
	public SmsServiceTest(String name) {
		super(name);
	}
	
	protected void setUp() throws Exception{
		super.setUp();
		smsService = new SmsServiceImpl();
		SmsDAO smsDAO = new SmsDAOImpl();
		smsService.setSmsDAO(smsDAO);
	}
	
	protected void tearDown() throws Exception {
		super.tearDown();
		
	}
	
	
	// 测试分页
	public void testList() throws Exception{
		Pager pager = smsService.list("admin", 25, 1);
		assertTrue(pager.getRowCount()>0);
		Iterator<?> it = pager.getResultList().iterator();
		while(it.hasNext()){
			Sms sms = (Sms) it.next();
			assertNotNull(sms);
		}
	}
	
	//测试新增
	public void testInsert() throws Exception{
		Sms sms = new Sms();
		sms.setUsername("admin");
		sms.setSender("admin");
		sms.setMessage("javaweb");
		sms.setSendertime("2008-10-10");
		sms.setIsRead("0");
		id = smsService.insert(sms);
		assertNotNull(id);
		
	}
	
	// 测试查询
	public void testSelect() throws Exception{
		assertNotNull(smsService.select(id));
	}
	
	
	// 测试更新
	
	public void testUpdate() throws Exception{
		Sms sms = new Sms();
		sms.setId(id);
		sms.setUsername("admin");
		sms.setSender("admin");
		sms.setMessage("javaweb");
		sms.setSendertime("2008-10-10");
		sms.setIsRead("1");
		smsService.update(sms);
		
		Sms sms2 = smsService.select(id);
		assertTrue(sms2.getIsRead().equals("1"));
	}
	
	
	//测试删除
	public void testDelete() throws Exception{
		smsService.delete(id);
		assertNull(smsService.select(id));
	}
	
	
	
	
	
	
}
