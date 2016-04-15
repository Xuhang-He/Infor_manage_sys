<%@page import="com.demo.javabean.ScheduleBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>  
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
		ScheduleBean scheduleBean = new ScheduleBean();
		if(method.equals("list")){//列表操作
			// 查询数据
			scheduleBean.list(request,username,pageSize,pageNo);
			
			topage="../schedule.jsp";
		}else if(method.equals("delete")){// 删除操作
			//执行删除
			scheduleBean.delete(request,username);
			//查询数据
			scheduleBean.list(request,username,pageSize,pageNo);
			topage="../schedule.jsp";
			
		}else if(method.equals("add")){//新增操作
			topage="../schedule_add.jsp";// 跳到新增页面
		}else if(method.equals("insert")){// 插入操作
			scheduleBean.insert(request, username);
			//查询数据
			scheduleBean.list(request,username,pageSize,pageNo);
			topage="../schedule.jsp";
		}else if(method.equals("edit")){//修改操作
			// 执行查询
			scheduleBean.select(request, username);			
			topage="../schedule_edit.jsp";// 跳转到修改页
		}else if(method.equals("update")){
			// 更新数据
			scheduleBean.update(request, username);
			// 查询数据
			scheduleBean.list(request,username,pageSize,pageNo);
			topage="../schedule.jsp";// 跳到列表页
		}
		
	}
	
	
	
	
	
		
%>
<jsp:forward page="<%=topage %>"/>

    