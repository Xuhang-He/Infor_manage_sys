package com.demo.hibernate.dao;


import com.demo.hibernate.beans.Meeting;
import com.demo.hibernate.util.Pager;

public interface MeetingDAO {
	// 分页查询
	public Pager list(int pageSize, int pageNo);
	
	// 查询
	public Meeting select(Integer id);
	
	// 插入
	public Integer insert(Meeting record);

	// 更新
	public boolean update(Meeting record);
	
	// 删除
	public boolean delete(Meeting record);
	
}
