<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.demo.javabean.UserBean" %>
<%	
	// 取得参数
	String username = request.getParameter("username");
	String password1 = request.getParameter("password1");
	String email = request.getParameter("email");
	
	//注册用户
	UserBean userBean = new UserBean();
	boolean isExist = userBean.isExist(username);
	String sql ="select * from user where username='"+username+"'";
	
	
	if(isExist){
		userBean.add(username, password1, email);
		response.sendRedirect("../login.jsp");
	}else{
		response.sendRedirect("../register.jsp");
	}


%>