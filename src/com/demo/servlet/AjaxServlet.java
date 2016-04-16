package com.demo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.javabean.UserBean;

public class AjaxServlet extends HttpServlet {

	public final static long serialVersionUID = 0;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/xml;charset=UTF-8");
		resp.setHeader("Cache-Control", "no-cache");
		
		String username=req.getParameter("username");
		
		UserBean userBean = new UserBean();
		
		boolean isExist = userBean.isExist(username);
		
		PrintWriter out = resp.getWriter();
		if(isExist){
			out.println("<content>failure</content>");
		}else{
			out.println("<content>ok</content>");
		}
		
	}
	
}
