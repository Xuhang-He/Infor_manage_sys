package com.demo.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.javabean.DBAccess;

public class InitServlet extends HttpServlet {
	public final static long serialVersionUID = 0;
	public void init(ServletConfig config) {
		try {
			super.init(config);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String drv = config.getInitParameter("drv");
		String url = config.getInitParameter("url");
		String usr = config.getInitParameter("usr");
		String pwd = config.getInitParameter("pwd");
		DBAccess.drv = drv;
		DBAccess.url = url;
		DBAccess.usr = usr;
		DBAccess.pwd = pwd;
		
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
}
