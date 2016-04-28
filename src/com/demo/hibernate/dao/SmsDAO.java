package com.demo.hibernate.dao;

import com.demo.hibernate.beans.Sms;
import com.demo.hibernate.util.Pager;

public interface SmsDAO {
	//分页查询
	public Pager list(String username, int pageSize, int pageNo);
	
	// 查询
	public Sms select(Integer id);
	
	// 插入
	public Integer insert(Sms record);
	
	//更新
	public boolean update(Sms record);
	
	// 删除
	public boolean delete(Sms record);
}
