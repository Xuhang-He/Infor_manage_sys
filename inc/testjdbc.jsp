<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String sql ="select * from user";
	try{
		Class.forName(drv).newInstance();
		Connection conn = DriverManager.getConnection(url,usr,pwd);
		Statement stm=conn.createStatement();
		ResultSet rs = stm.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		int cols = rsmd.getColumnCount();
		while(rs.next()){
			for(int i = 1;i <= cols;i++){
				String field=(String)(rsmd.getColumnName(i));
				String value=(String)(rs.getString(i));
				out.println(field+"=" +value+";");
				
				
			}
		}
		rs.close();
		stm.close();
		conn.close();
		
		
		
		
	}catch(Exception e){
		e.printStackTrace();
		out.println(e);
	}
	
	
	
%>
</body>
</html>