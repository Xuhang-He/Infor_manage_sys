package com.demo.hibernate.service;

import com.demo.hibernate.beans.Sms;
import com.demo.hibernate.util.Pager;

public interface SmsService {
	//分页查询
	public Pager list(String username,int pageSize, int pageNo);
	
	// 取得一个记录
	public Sms select(Integer id);
	
	// 设置已读
	public boolean read(Integer id);
	
	//插入
	public Integer insert(Sms record);
	
	//更新
	public boolean update(Sms record);
	
	// 删除
	public boolean delete(Integer id);
	
}
