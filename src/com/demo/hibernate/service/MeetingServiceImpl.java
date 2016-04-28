package com.demo.hibernate.service;

import com.demo.hibernate.beans.Meeting;
import com.demo.hibernate.dao.MeetingDAO;
import com.demo.hibernate.util.Pager;

public class MeetingServiceImpl implements MeetingService {
	MeetingDAO meetingDAO;
	
	//分页查询
	public Pager list(int pageSize, int pageNo) {
		return meetingDAO.list(pageSize, pageNo);
	}
	
	// 取得一个记录
	public Meeting select(Integer id) {
		return meetingDAO.select(id);
	}

	//插入
	public Integer insert(Meeting record) {
		return meetingDAO.insert(record);
	}

	// 更新
	public boolean update(Meeting record) {
		return meetingDAO.update(record);
	}

	// 删除
	public boolean delete(Integer id) {
		Meeting record = meetingDAO.select(id);
		
		return meetingDAO.delete(record);
	}

	public MeetingDAO getMeetingDAO() {
		return meetingDAO;
	}

	public void setMeetingDAO(MeetingDAO meetingDAO) {
		this.meetingDAO = meetingDAO;
	}
	

}
