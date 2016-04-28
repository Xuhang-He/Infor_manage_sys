package com.demo.hibernate.test;

import java.util.Iterator;

import com.demo.hibernate.beans.Schedule;
import com.demo.hibernate.dao.ScheduleDAO;
import com.demo.hibernate.dao.ScheduleDAOImpl;
import com.demo.hibernate.service.ScheduleServiceImpl;
import com.demo.hibernate.util.Pager;

import junit.framework.TestCase;

public class ScheduleServiceTest extends TestCase {
	public ScheduleServiceImpl scheduleService;
	public static Integer id = null;
	
	public ScheduleServiceTest(String name){
		super(name);
	}
	
	protected void setUp() throws Exception{
		super.setUp();
		scheduleService = new ScheduleServiceImpl();
		ScheduleDAO scheduleDAO = new ScheduleDAOImpl();
		scheduleService.setScheduleDAO(scheduleDAO);
	}
	
	protected void tearDown() throws Exception {
		super.tearDown();
		
	}
	
	// 测试分页
	public void testList() throws Exception{
		Pager pager = scheduleService.list("admin", 25, 1);
		assertTrue(pager.getRowCount()>0);
		Iterator<?> it = pager.getResultList().iterator();
		while(it.hasNext()){
			Schedule schedule = (Schedule) it.next();
			assertNotNull(schedule);
		}
	}
	
	// 测试新增
	public void testInsert() throws Exception{
		Schedule schedule = new Schedule();
		schedule.setUsername("admin");
		schedule.setYear(new Integer(2007));
		schedule.setMonth(new Integer(8));
		schedule.setDay(new Integer(30));
		schedule.setPlan("javaweb");
		id = scheduleService.insert(schedule);
		assertNotNull(id);
	}
	
	// 测试查询
	public void testSelect() throws Exception{
		assertNotNull(scheduleService.select(id));
	}
	
	// 测试更新
	public void testUpdate() throws Exception{
		Schedule schedule = new Schedule();
		schedule.setId(id);
		schedule.setUsername("admin");
		schedule.setYear(new Integer(2007));
		schedule.setMonth(new Integer(6));
		schedule.setDay(new Integer(30));
		schedule.setPlan("javaweb");
		scheduleService.update(schedule);
		Schedule schedule2 = scheduleService.select(id);
		assertTrue(schedule2.getMonth().intValue() == 6);
		
	}
	
	//测试删除
	public void testDelete() throws Exception{
		scheduleService.delete(id);
		assertNull(scheduleService.select(id));
	}
	
	
	
	
	
	
	
}
