package com.demo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.javabean.UserBean;

public class LoginServlet extends HttpServlet {
	public final static long serialVersionUID = 0;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		// 取得参数
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		// 验证登陆
		UserBean userBean = new UserBean();
		boolean isValid = userBean.valid(username, password);
		if(isValid){
			session.setAttribute("username", username);
			resp.sendRedirect("welcome.jsp");
		}else{
			resp.sendRedirect("login.jsp");
		}
	}

	
	

}
