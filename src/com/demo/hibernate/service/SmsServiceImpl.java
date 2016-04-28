package com.demo.hibernate.service;

import com.demo.hibernate.beans.Sms;
import com.demo.hibernate.dao.SmsDAO;
import com.demo.hibernate.util.Pager;

public class SmsServiceImpl implements SmsService {
	SmsDAO smsDAO;

	// 分页查询
	public Pager list(String username, int pageSize, int pageNo) {
		return smsDAO.list(username, pageSize, pageNo);
	}
	
	//取得一个记录
	public Sms select(Integer id) {
		return smsDAO.select(id);
	}

	// 设置已读
	public boolean read(Integer id) {
		Sms record = smsDAO.select(id);
		record.setIsRead("1");
		
		return smsDAO.update(record);
	}

	// 插入
	public Integer insert(Sms record) {
		return smsDAO.insert(record);
	}

	// 更新
	public boolean update(Sms record) {
		return smsDAO.update(record);
	}

	// 删除
	public boolean delete(Integer id) {
		Sms record = smsDAO.select(id);
		
		return smsDAO.delete(record);
	}
	
	public SmsDAO getSmsDAO(){
		return smsDAO;
	}
	public void setSmsDAO(SmsDAO smsDAO){
		this.smsDAO = smsDAO;
	}
	

}
