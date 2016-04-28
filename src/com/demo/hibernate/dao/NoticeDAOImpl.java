package com.demo.hibernate.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;

import com.demo.hibernate.beans.Notice;
import com.demo.hibernate.util.HibernateSessionFactory;
import com.demo.hibernate.util.Pager;

public class NoticeDAOImpl implements NoticeDAO {
	//分页查询
	public Pager list(int pageSize, int pageNo) {
		Session session = null;
		Pager pager = null;
		try {
			session = HibernateSessionFactory.currentSession();
			
			// 创建查询条件
			Criteria criteria = session.createCriteria(Notice.class);
			
			// 取得总数
			int rowCount = ((Integer)criteria.setProjection(Projections.rowCount()).uniqueResult()).intValue();
			criteria.setProjection(null);
			
			// 取得当前页
			int startIndex = pageSize * (pageNo -1);
			
			// 设置排序条件
			criteria.addOrder(Order.desc("sendtime"));
			criteria.setFirstResult(startIndex);
			criteria.setMaxResults(pageSize);
			List<?> result = criteria.list();
			pager = new Pager(pageSize, pageNo, rowCount, result);
		} catch (HibernateException e) {
			pager = new  Pager(pageSize, pageNo, 0, new ArrayList<Object>());
			throw e;
		}finally {
			HibernateSessionFactory.closeSession();
		}
		
		return pager;
	}

	// 查询
	public Notice select(Integer id) {
		Session session = null;
		Notice record = null;
		try {
			session = HibernateSessionFactory.currentSession();
			Query query = session.createQuery("from Notice where id =?");
			query.setInteger(0, id);
			record=(Notice) query.uniqueResult();
			query = null;
		} catch (HibernateException e) {
			throw e;
		}finally {
			HibernateSessionFactory.closeSession();
		}
		return record;
	}
	
	// 插入
	public Integer insert(Notice record) {
		Session session = null;
		Transaction transaction = null;
		Integer id = null;
		try {
			session = HibernateSessionFactory.currentSession();
			transaction = session.beginTransaction();
			session.save(record);
			id = record.getId();
			transaction.commit();
			
		} catch (HibernateException e) {
			throw e;
		}finally {
			if(transaction!=null){
				transaction.rollback();
			}
			HibernateSessionFactory.closeSession();
		}
		return id;
	}

	// 更新
	public boolean update(Notice record) {
		Session session = null;
		Transaction transaction = null;
		boolean b = true;
		try {
			session = HibernateSessionFactory.currentSession();
			transaction = session.beginTransaction();
			session.update(record);
			transaction.commit();
			
		} catch (HibernateException e) {
			b = false;
			throw e;
		}finally {
			if(transaction!= null){
				transaction.rollback();
			}
			HibernateSessionFactory.closeSession();
		}
		return b;
	}
	
	//删除
	public boolean delete(Notice record) {
		Session session = null;
		Transaction transaction = null;
		boolean b = true;
		try {
			session = HibernateSessionFactory.currentSession();
			transaction = session.beginTransaction();
			session.delete(record);
			transaction.commit();
		} catch (HibernateException e) {
			b = false;
			throw e;
		}finally {
			if(transaction!= null){
				transaction.rollback();
			}
			HibernateSessionFactory.closeSession();
		}
		
		return b;
	}
	
}
