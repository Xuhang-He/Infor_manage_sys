package com.demo.hibernate.service;

import com.demo.hibernate.beans.Worklog;
import com.demo.hibernate.dao.WorklogDAO;
import com.demo.hibernate.util.Pager;

public class WorklogServiceImpl implements WorklogService {

	WorklogDAO worklogDAO;
	
	//分页查询
	public Pager list(String username, int pageSize, int pageNo) {
		return worklogDAO.list(username, pageSize, pageNo);
	}

	// 取得一个记录
	public Worklog select(Integer id) {
		return worklogDAO.select(id);
	}

	// 插入
	public Integer insert(Worklog record) {
		return worklogDAO.insert(record);
	}

	// 更新
	public boolean update(Worklog record) {
		return worklogDAO.update(record);
	}

	//删除
	public boolean delete(Integer id) {
		Worklog record = worklogDAO.select(id);
		
		return worklogDAO.delete(record);
	}
	
	public WorklogDAO getWorklogDAO(){
		return worklogDAO;
	}
	
	public void setWorklogDAO(WorklogDAO worklogDAO){
		this.worklogDAO = worklogDAO;
	}

}
