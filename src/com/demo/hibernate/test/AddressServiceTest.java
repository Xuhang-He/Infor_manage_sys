package com.demo.hibernate.test;

import java.util.Iterator;


import com.demo.hibernate.beans.Address;
import com.demo.hibernate.dao.AddressDAO;
import com.demo.hibernate.dao.AddressDAOImpl;
import com.demo.hibernate.service.AddressServiceImpl;
import com.demo.hibernate.util.Pager;

import junit.framework.TestCase;

public class AddressServiceTest extends TestCase {
		public AddressServiceImpl addressService;
		public static Integer id = null;
		public AddressServiceTest(String name){
			super(name);
		}
	
		protected void setUp() throws Exception {
			super.setUp();
			addressService = new AddressServiceImpl();
			AddressDAO addressDAO = new AddressDAOImpl();
			addressService.setAddressDAO(addressDAO);
			
		}
	
	//测试分页
		public void testList() throws Exception{
			Pager pager = addressService.list("admin", 25, 1);
			assertTrue(pager.getRowCount()>0);
			Iterator<?> it = pager.getResultList().iterator();
			while (it.hasNext()) {
				Address address = (Address) it.next();
				assertNotNull(address);
			}
		}	
		// 测试新增
		
		public void testInsert()throws Exception {
			Address address = new Address();
			address.setUsername("admin");
			address.setName("andy");
			address.setSex("2");
			address.setMobile("13888886666");
			address.setEmail("andy@163.com");
			address.setQq("12345678");
			address.setCompany("Inter");
			address.setAddress("北京");
			address.setPostcode("200089");
			id = addressService.insert(address);
			assertNotNull(id);
			
		} 
		
		//测试查询
		public void testSelect() throws Exception{
			assertNotNull(addressService.select(id));
		}
		
		// 测试更新
		
		public void testUpdate() throws Exception{
			Address address = new Address();
			address.setId(id);
			address.setUsername("admin");
			address.setName("andy");
			address.setSex("2");
			address.setMobile("13888886666");
			address.setEmail("andy@163.com");
			address.setQq("12345678");
			address.setCompany("Microsoft");
			address.setAddress("北京");
			address.setPostcode("200089");
			addressService.update(address);
			
			Address address2 = addressService.select(id);
			assertTrue(address2.getCompany().equals("Microsoft"));
		}
		
		// 测试删除
		public void testDelete() throws Exception{
			addressService.delete(id);
			assertNull(addressService.select(id));
		}
		
		
		
	
	
	
	
	
	
	
	
	
}
