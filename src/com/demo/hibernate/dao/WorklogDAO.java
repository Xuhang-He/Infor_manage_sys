package com.demo.hibernate.dao;

import com.demo.hibernate.beans.Worklog;
import com.demo.hibernate.util.Pager;

public interface WorklogDAO {
	// 分页查询
	public Pager list(String username, int pageSize, int pageNo);
	
	// 查询
	public Worklog select(Integer id);
	
	// 插入
	public Integer insert(Worklog record);
	
	//更新
	public boolean update(Worklog record);
	
	// 删除
	public boolean delete(Worklog record);
}
