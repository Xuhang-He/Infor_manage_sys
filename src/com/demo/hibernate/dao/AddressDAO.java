package com.demo.hibernate.dao;

import com.demo.hibernate.beans.Address;
import com.demo.hibernate.util.Pager;

public interface AddressDAO {
	// 分页查询
	public Pager list(String username,int pageSize, int pageNo);
	
	//查询
	public Address select(Integer id);
	
	// 插入
	public Integer insert(Address record);
	
	//更新
	public boolean update(Address record);
	
	// 删除
	public boolean delete(Address record);

}
