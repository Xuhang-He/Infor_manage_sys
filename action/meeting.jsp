<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../inc/db.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<%
	String method = request.getParameter("method");// 操作方法
	String topage =null;// 跳转页地址
	//未登录时跳转到登陆页面
	if(session.getAttribute("username")==null){
		topage="../login.jsp";
	}else{
		String username=(String) session.getAttribute("username");// 当前登陆用户名
		
		//取得分页参数
		String pageSize = request.getParameter("pageSize");//每页显示行数
		String pageNo = request.getParameter("pageNo");// 当前显示第几页
		if(pageSize == null){// 为空时设置默认页大小为25
			pageSize="25";
		}
		if(pageNo == null){//为空时设置默认为第一页
			pageNo ="1";
		}
		
		//保存分页参数。传递给下一个页面 
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNo", pageNo);
		
		// 根据 method 参数执行各种操作
		if(method.equals("list")){//列表操作
			// 查询数据
			list(request,drv,url,usr,pwd,username,pageSize,pageNo);
			
			topage="../meeting.jsp";
		}else if(method.equals("delete")){// 删除操作
			//执行删除
			delete(request,drv,url,usr,pwd,username);
			//查询数据
			list(request,drv,url,usr,pwd,username,pageSize,pageNo);
			topage="../meeting.jsp";
			
		}else if(method.equals("add")){//新增操作
			topage="../meeting_add.jsp";// 跳到新增页面
		}else if(method.equals("insert")){// 插入操作
			insert(request,drv,url,usr,pwd,username);
			//查询数据
			list(request,drv,url,usr,pwd,username,pageSize,pageNo);
			topage="../meeting.jsp";
		}else if(method.equals("edit")){//修改操作
			// 执行查询
			select(request,drv,url,usr,pwd,username);
			
			topage="../meeting_edit.jsp";// 跳转到修改页
		}else if(method.equals("update")){
			// 更新数据
			update(request,drv,url,usr,pwd,username);
			// 查询数据
			list(request,drv,url,usr,pwd,username,pageSize,pageNo);
			topage="../meeting.jsp";// 跳到列表页
		}
		
	}
	
	
	
	
	
		
%>
<jsp:forward page="<%=topage %>"/>

<%!public boolean list(HttpServletRequest request, String drv,String url,
		String usr,String pwd,String username,String strPageSize, String strPageNo){
	
	//System.out.println(list);
	try{
		//创建数据库连接
		Class.forName(drv).newInstance();
		Connection conn = DriverManager.getConnection(url,usr,pwd);
		Statement stm = conn.createStatement();
		
		//查询总的记录数, 计算跳页参数
		int pageSize = Integer.parseInt(strPageSize);
		int pageNo = Integer.parseInt(strPageNo);
		
		int start = pageSize*(pageNo-1);
		//总记录数查询SQL
		String sql1 ="select count(*) as countall from meeting";
		ResultSet rs1 =stm.executeQuery(sql1);
		if(rs1.next()){
			//计算总行数并保存
			String countall = rs1.getString("countall");
			int rowCount = Integer.parseInt(countall);
			request.setAttribute("rowCount", rowCount);
			
			//计算总页数并保存
			int pageCount = rowCount % pageSize == 0 ? rowCount/pageSize:rowCount/pageSize+1;
			
			request.setAttribute("pageCount", pageCount);
			
			// 计算跳页参数并保存
			int pageFirstNo =1; //首页
			int pageLastNo = pageCount;
			int pagePreNo = pageNo > 1? pageNo-1:1;
			int pageNextNo = pageNo < pageCount ? pageNo+1:pageCount;
			
			request.setAttribute("pageFirstNo", pageFirstNo);
			request.setAttribute("pageLastNo", pageLastNo);
			request.setAttribute("pagePreNo", pagePreNo);
			request.setAttribute("pageNextNo", pageNextNo);
			
		}
		rs1.close();
		String sql2 = "select * from meeting order by starttime desc limit "+start+","+pageSize;
		
		List<Hashtable<String,String>> list = new ArrayList<Hashtable<String,String>>();
		ResultSet rs2 = stm.executeQuery(sql2);
		ResultSetMetaData rsmd = rs2.getMetaData();
		int cols = rsmd.getColumnCount();
		while(rs2.next()){
			//查询每行数据的各个字段数据
			Hashtable<String,String> hash = new Hashtable<String,String>();
			for(int i = 1;i<=cols;i++){
				String field =(String) (rsmd.getColumnName(i));
				String value = (String)(rs2.getString(i));
				if(value == null){
					value="";
				}
				hash.put(field,value);
			}
			//保存当前行
			list.add(hash);
		}
		
		//保存所有行数据列表传递给下一个页面
		request.setAttribute("list",list);
		
		
		
		
		rs2.close();
		stm.close();
		conn.close();
			
	}catch(Exception e){
		e.printStackTrace();
		return false;
	}finally{
		
	}
		
	
	return true;
}
%>

<%!public boolean delete(HttpServletRequest request, String drv,String url,
		String usr,String pwd,String username){
	try{
		//创建数据库连接
		Class.forName(drv).newInstance();
		Connection conn = DriverManager.getConnection(url,usr,pwd);
		Statement stm = conn.createStatement();
		// 根据id组成删除SQL，执行删除
		String id =request.getParameter("id");
		String sql = "delete from meeting where id="+id;
		stm.executeUpdate(sql);
		stm.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
		return false;
	}finally{
		
	}
	
	return true;
} 

%>

<%!public boolean insert(HttpServletRequest request, String drv,String url,
		String usr,String pwd,String username){
	try{
		//创建数据库连接
		Class.forName(drv).newInstance();
		Connection conn = DriverManager.getConnection(url,usr,pwd);
		Statement stm = conn.createStatement();
		// 取得新增表单参数
		
		String starttime = request.getParameter("starttime");
		String endtime= request.getParameter("endtime");
		String address = request.getParameter("address");
		String title= request.getParameter("title");
		String content = request.getParameter("content");
		
		// 组合新增sql
		String sql="insert into meeting (sender,starttime,endtime,address,title,content)";
		sql+="values('"+username+"','"+starttime+"','"+endtime+"','"+address+"','"+title+"','"+content+"')";
		
		//转换参数编码
		sql=new String(sql.getBytes("ISO8859-1"),"UTF-8");
		
		// 执行插入
		stm.executeUpdate(sql);
		stm.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
		return false;
	}finally{
		
	}
	
	return true;
} 

%>

<%!public boolean select(HttpServletRequest request, String drv,String url,
		String usr,String pwd,String username){
	try{
		//创建数据库连接
		Class.forName(drv).newInstance();
		Connection conn = DriverManager.getConnection(url,usr,pwd);
		Statement stm = conn.createStatement();
		// 根据id组成删除SQL，执行删除
		String id =request.getParameter("id");
		String sql = "select * from meeting where id="+id;
		ResultSet rs = stm.executeQuery(sql);
		if(rs.next()){
			//取得各个字段的值并保存
			request.setAttribute("id", (String)(rs.getString("id")));
			request.setAttribute("sender", (String)(rs.getString("sender")));
			request.setAttribute("starttime", (String)(rs.getString("starttime")));
			request.setAttribute("endtime", (String)(rs.getString("endtime")));
			request.setAttribute("address", (String)(rs.getString("address")));
			request.setAttribute("title", (String)(rs.getString("title")));
			request.setAttribute("content", (String)(rs.getString("content")));
		}
		rs.close();
		stm.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
		return false;
	}finally{
		
	}
	
	return true;
} 

%>

<%!public boolean update(HttpServletRequest request, String drv,String url,
		String usr,String pwd,String username){
	try{
		//创建数据库连接
		Class.forName(drv).newInstance();
		Connection conn = DriverManager.getConnection(url,usr,pwd);
		Statement stm = conn.createStatement();
		
		// 取得修改页表单参数
		String id = request.getParameter("id");
		String starttime = request.getParameter("starttime");
		String endtime= request.getParameter("endtime");
		String address = request.getParameter("address");
		String title= request.getParameter("title");
		String content = request.getParameter("content");
		
		//取得更新SQL
		String sql="update meeting set starttime='"+starttime+"', endtime='"+endtime+"', address='"+address+"',title='"+title+"',content='"+content+"'where id="+id;
		
		//转换参数编码
		sql = new String(sql.getBytes("ISO8859-1"),"UTF-8");
		
		//执行更新
		stm.executeUpdate(sql);
		stm.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
		return false;
	}finally{
		
	}
	return true;
} 

%>


    