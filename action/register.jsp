<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/db.jsp" %>
<%	
	// 取得参数
	String username = request.getParameter("username");
	String password1 = request.getParameter("password1");
	String email = request.getParameter("email");
	
	//注册用户
	boolean isValid =false;
	String sql ="select * from user where username='"+username+"'";
	try{
		Class.forName(drv).newInstance();
		Connection conn = DriverManager.getConnection(url, usr, pwd);
		Statement stm = conn.createStatement();
		ResultSet rs = stm.executeQuery(sql);
		System.out.println(rs.next());
		if(!rs.next()){
			sql="insert into user(username,password,email)values('"+username+"','"+password1+"','"+email+"')";
			stm.execute(sql);
			isValid = true;
		}
		
	}catch(Exception e){
		e.printStackTrace();
		out.println(e);
	}finally{
		
	}
	
	if(isValid){
		response.sendRedirect("../login.jsp");
	}else{
		response.sendRedirect("../register.jsp");
	}


%>