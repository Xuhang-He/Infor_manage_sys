package com.demo.hibernate.test;


import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class AllTest extends TestCase {
	public static void main(String[] args){
		junit.textui.TestRunner.run(suite());
	}

	public static Test suite() {
		TestSuite suite = new TestSuite("Test for Hibernate");
		suite.addTest(new TestSuite(UserServiceTest.class));
		suite.addTest(new TestSuite(ScheduleServiceTest.class));
		suite.addTest(new TestSuite(AddressServiceTest.class));
		suite.addTest(new TestSuite(WorklogServiceTest.class));
		suite.addTest(new TestSuite(SmsServiceTest.class));
		suite.addTest(new TestSuite(NoticeServiceTest.class));
		suite.addTest(new TestSuite(MeetingServiceTest.class));
		
		return suite;
		
	} 
}
