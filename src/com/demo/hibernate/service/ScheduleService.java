package com.demo.hibernate.service;

import com.demo.hibernate.beans.Schedule;
import com.demo.hibernate.util.Pager;

public interface ScheduleService {
	// 分页查询
	public Pager list(String username, int pageSize, int pageNo);
	
	// 取得一个记录
	public Schedule select(Integer id);
	//插入
	public Integer insert(Schedule record);
	//更新
	public boolean update(Schedule record);
	//删除
	public boolean delete(Integer id);
}
