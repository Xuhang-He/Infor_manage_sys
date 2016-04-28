package com.demo.hibernate.util;

import org.hibernate.HibernateException;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

public class HibernateSessionFactory {
	private static String CONFIG_FILE_LOCATION="hibernate.cfg.xml";
	private static final ThreadLocal<Session> THREAD_LOCAL = new ThreadLocal<Session>();
	private static final Configuration CONFIGURATION = new Configuration();
	private static org.hibernate.SessionFactory sessionFactory;
	
	//取得Session
	public static Session currentSession ()throws HibernateException{
		Session session = (Session) THREAD_LOCAL.get();
		if(session == null){
			if(sessionFactory == null){
				try{
				CONFIGURATION.configure(CONFIG_FILE_LOCATION);
				sessionFactory = CONFIGURATION.buildSessionFactory();
				}catch(Exception e){
					System.err.println("%%%% Error Creating SessionFactory%%%%");
					e.printStackTrace();
				}
				
			}
			session = sessionFactory.openSession();
			THREAD_LOCAL.set(session);
		}
		
		return session;
	}
	
	public static void closeSession() throws HibernateException{
		Session session =(Session) THREAD_LOCAL.get();
		THREAD_LOCAL.set(null);
		if(session!=null){
			session.close();
		}
	}

	
		
		
	

}
