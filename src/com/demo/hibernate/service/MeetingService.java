package com.demo.hibernate.service;

import com.demo.hibernate.beans.Meeting;
import com.demo.hibernate.util.Pager;

public interface MeetingService {
	//分页查询
	public Pager list(int pageSize, int pageNo);
	
	// 取得一个记录
	public Meeting select(Integer id);
	
	// 插入
	public Integer insert(Meeting record);
	
	// 更新
	public boolean update(Meeting record);
	
	// 删除
	public boolean delete(Integer id);
}
