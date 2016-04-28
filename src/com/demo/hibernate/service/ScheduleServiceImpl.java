package com.demo.hibernate.service;

import com.demo.hibernate.beans.Schedule;
import com.demo.hibernate.dao.ScheduleDAO;
import com.demo.hibernate.util.Pager;

public class ScheduleServiceImpl implements ScheduleService {
	
	ScheduleDAO scheduleDAO;
	
	// 分页查询
	public Pager list(String username, int pageSize, int pageNo) {
		
		return scheduleDAO.list(username, pageSize, pageNo);
	}
	// 取得一个记录
	public Schedule select(Integer id) {
		return scheduleDAO.select(id);
	}
	
	//插入
	public Integer insert(Schedule record) {
		return scheduleDAO.insert(record);
	}
	
	// 更新
	public boolean update(Schedule record) {
		return scheduleDAO.update(record);
	}

	//删除
	public boolean delete(Integer id) {
		Schedule record = scheduleDAO.select(id);
		
		return scheduleDAO.delete(record);
	}
	
	public ScheduleDAO getScheduleDAO(){
		return scheduleDAO;
	}
	
	public void setScheduleDAO(ScheduleDAO scheduleDAO){
		this.scheduleDAO = scheduleDAO;
	}
	
}
