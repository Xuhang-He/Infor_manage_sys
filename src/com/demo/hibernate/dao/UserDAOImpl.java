package com.demo.hibernate.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.demo.hibernate.beans.User;
import com.demo.hibernate.util.HibernateSessionFactory;

public class UserDAOImpl implements UserDAO {

	//按用户名查询
	public User select(String username) {
		Session session = null;
		User record = null;
		
		
		try{
			session = HibernateSessionFactory.currentSession();
			Query query = session.createQuery("from User where username=?");
			query.setString(0, username.trim());
			record =(User) query.uniqueResult();
			query = null;
			
			
		}catch(HibernateException e){
			throw e;
		}finally {
			HibernateSessionFactory.closeSession();
		}
		
		
		return record;
	}

	public Integer insert(User record) {
		Session session = null;
		Transaction tx = null;
		Integer id = null;
		try{
			
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.save(record);
			id = record.getId();
			tx.commit();
			
		}catch(HibernateException exception){
			throw exception;
		}finally {
			if(tx != null){
				tx.rollback();
			}
			HibernateSessionFactory.closeSession();
		}
		
		return id;
	}
	

}
