package com.demo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.javabean.UserBean;

public class RegisterServlet extends HttpServlet {

	public final static long serialVersionUID = 0;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//取得参数
				String username = req.getParameter("username");
				String password1 = req.getParameter("password1");
				String email = req.getParameter("email");
		// 注册用户
				UserBean userBean = new UserBean();
				boolean isExist = userBean.isExist(username);
				if(isExist){
					userBean.add(username, password1, email);
					resp.sendRedirect("login.jsp");
				}else{
					resp.sendRedirect("register.jsp");
				}
	}
	
}
