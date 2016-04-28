package com.demo.hibernate.dao;

import com.demo.hibernate.beans.Notice;
import com.demo.hibernate.util.Pager;

public interface NoticeDAO {
	//分页查询
	public Pager list(int pageSize, int pageNo);
	
	// 查询
	public Notice select(Integer id);
	
	// 插入
	public Integer insert(Notice record);
	
	// 更新
	public boolean update(Notice record);
	
	// 删除
	public boolean delete(Notice record);
}
