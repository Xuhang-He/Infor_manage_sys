package com.demo.javabean;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class SmsBean {
	public boolean list(HttpServletRequest request,String username,String strPageSize, String strPageNo){
		
		DBAccess dbAccess = new DBAccess();
			
		
			if(dbAccess.createConn()){
			//查询总的记录数, 计算跳页参数
			int pageSize = Integer.parseInt(strPageSize);
			int pageNo = Integer.parseInt(strPageNo);
			
			int start = pageSize*(pageNo-1);
			//总记录数查询SQL
			String sql1 ="select count(*) as countall from sms where username='"+username+"'";
			dbAccess.query(sql1);
			if(dbAccess.next()){
				//计算总行数并保存
				String countall = dbAccess.getValue("countall");
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
			dbAccess.closeRs();
			String sql2 = "select * from sms where username='"+username+"' order by sendertime desc limit "+start+","+pageSize;
			
			List<Hashtable<String,String>> list = new ArrayList<Hashtable<String,String>>();
			
			dbAccess.query(sql2);
			
			while(dbAccess.next()){
				//查询每行数据的各个字段数据
				Hashtable<String,String> hash = new Hashtable<String,String>();
				hash.put("id", dbAccess.getValue("id"));
				hash.put("username", dbAccess.getValue("username"));
				hash.put("sender", dbAccess.getValue("sender"));
				hash.put("message", dbAccess.getValue("message"));
				hash.put("sendertime", dbAccess.getValue("sendertime"));
				hash.put("isRead", dbAccess.getValue("isRead"));
				//保存当前行
				list.add(hash);
			}
			
			//保存所有行数据列表传递给下一个页面
			request.setAttribute("list",list);
			
			
			dbAccess.closeRs();
			dbAccess.closeStm();
			dbAccess.closeConn();
		}
			
		
			
		
		return true;
	}
	

	public boolean delete(HttpServletRequest request,String username){
		
		DBAccess dbAccess = new DBAccess();
		if(dbAccess.createConn()){
			// 根据id组成删除SQL，执行删除
			String id =request.getParameter("id");
			String sql = "delete from sms where id="+id;
			dbAccess.update(sql);
			dbAccess.closeStm();
			dbAccess.closeConn();
		
		}
		
		
		return true;
	} 
	

	public boolean insert(HttpServletRequest request,String username){
		DBAccess dbAccess = new DBAccess();
			// 取得新增表单参数
			if(dbAccess.createConn()){
			String to = request.getParameter("username");
			String message= request.getParameter("message");
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String sendertime = format.format(new Date());
			
			// 组合新增sql
			String sql="insert into sms(username,sender,message,sendertime,isRead)";
			sql+="values('"+to+"','"+username+"','"+message+"','"+sendertime+"','0')";
			
			//转换参数编码
			try {
				sql=new String(sql.getBytes("ISO8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			// 执行插入
			
			dbAccess.update(sql);
			dbAccess.closeStm();
			dbAccess.closeConn();
			
			
		}
		
		return true;
	} 
	

	public boolean read(HttpServletRequest request,String username){
			DBAccess dbAccess = new DBAccess();
			
			
			if(dbAccess.createConn()){
			//取得更新SQL
			String id =request.getParameter("id");
			String sql="update sms set isRead='1' where id="+id;
			
			//转换参数编码
			
			//执行更新
			dbAccess.update(sql);
			dbAccess.closeStm();
			dbAccess.closeConn();
			
			
		}
		
		return true;
	} 



}
