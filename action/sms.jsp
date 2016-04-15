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
			
			topage="../sms.jsp";
		}else if(method.equals("delete")){// 删除操作
			//执行删除
			delete(request,drv,url,usr,pwd,username);
			//查询数据
			list(request,drv,url,usr,pwd,username,pageSize,pageNo);
			topage="../sms.jsp";
			
		}else if(method.equals("add")){//新增操作
			topage="../sms_add.jsp";// 跳到新增页面
		}else if(method.equals("insert")){// 插入操作
			insert(request,drv,url,usr,pwd,username);
			//查询数据
			list(request,drv,url,usr,pwd,username,pageSize,pageNo);
			topage="../sms.jsp";
		
		}else if(method.equals("read")){
			// 更新数据
			read(request,drv,url,usr,pwd,username);
			// 查询数据
			list(request,drv,url,usr,pwd,username,pageSize,pageNo);
			topage="../sms.jsp";// 跳到列表页
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
		String sql1 ="select count(*) as countall from sms where username='"+username+"'";
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
		String sql2 = "select * from sms where username='"+username+"' order by sendertime desc limit "+start+","+pageSize;
		
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
		String sql = "delete from sms where id="+id;
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
		
		String to = request.getParameter("username");
		String message= request.getParameter("message");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sendertime = format.format(new Date());
		
		// 组合新增sql
		String sql="insert into sms(username,sender,message,sendertime,isRead)";
		sql+="values('"+to+"','"+username+"','"+message+"','"+sendertime+"','0')";
		
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

<%!public boolean read(HttpServletRequest request, String drv,String url,
		String usr,String pwd,String username){
	try{
		//创建数据库连接
		Class.forName(drv).newInstance();
		Connection conn = DriverManager.getConnection(url,usr,pwd);
		Statement stm = conn.createStatement();
		
		
		
		
		//取得更新SQL
		String id =request.getParameter("id");
		String sql="update sms set isRead='1' where id="+id;
		
		//转换参数编码
		
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


