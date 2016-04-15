<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/db.jsp" %>    

<%
	response.setContentType("text/xml");
	response.setHeader("Cache-control","no-cache");
	String username=request.getParameter("username");


	boolean isValid=false;
	String sql="select * from user where username='"+username+"'";
	
	try{
		Class.forName(drv).newInstance();
		Connection conn=DriverManager.getConnection(url,usr,pwd);
		Statement stm = conn.createStatement();
		ResultSet rs = stm.executeQuery(sql);
		if(rs.next()){
			isValid =true;
		}
		rs.close();
		stm.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
		out.println();
	}finally{
		
	}
	
	
	if(isValid){
		out.println("<content>该用户名已经存在！</content>");
	}else{
		out.println("<content>ok</content>");
	}
%>

