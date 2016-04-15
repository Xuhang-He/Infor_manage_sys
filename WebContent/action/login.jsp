<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.demo.javabean.UserBean" %>
<%	
	//取得参数
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	//验证登录
	UserBean userBean = new UserBean();
	
	boolean isValid = userBean.valid(username, password);
	
	
	if(isValid){
		session.setAttribute("username",username);
		response.sendRedirect("../welcome.jsp");
	}else{
		response.sendRedirect("../login.jsp");
	}


%>