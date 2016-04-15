package com.demo.javabean;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class AddressBean {

	public boolean list(HttpServletRequest request,String username,String strPageSize, String strPageNo){
	DBAccess db = new DBAccess();
	
	if(db.createConn()){
		
		//查询总的记录数, 计算跳页参数
		int pageSize = Integer.parseInt(strPageSize);
		int pageNo = Integer.parseInt(strPageNo);
		
		int start = pageSize*(pageNo-1);
		//总记录数查询SQL
		String sql1 ="select count(*) as countall from address where username='"+username+"'";
		db.query(sql1);
		if(db.next()){
			//计算总行数并保存
			String countall = db.getValue("countall");
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
		db.closeRs();
		String sql2 = "select * from address where username='"+username+"' order by name limit "+start+","+pageSize;
		
		List<Hashtable<String,String>> list = new ArrayList<Hashtable<String,String>>();
		db.query(sql2);
		
		
		while(db.next()){
			//查询每行数据的各个字段数据
			Hashtable<String,String> hash = new Hashtable<String,String>();
			hash.put("id", db.getValue("id"));
			hash.put("username", db.getValue("username"));
			hash.put("name", db.getValue("name"));
			hash.put("sex", db.getValue("sex"));
			hash.put("mobile", db.getValue("mobile"));
			hash.put("email", db.getValue("email"));
			hash.put("qq", db.getValue("qq"));
			hash.put("company", db.getValue("company"));
			hash.put("address", db.getValue("address"));
			hash.put("postcode", db.getValue("postcode"));
			//保存当前行
			list.add(hash);
		}
		
		//保存所有行数据列表传递给下一个页面
		request.setAttribute("list",list);
		
		db.closeRs();
		db.closeStm();
		db.closeConn();
	
	
	
	}

	return true;

	
	}



	public boolean delete(HttpServletRequest request,String username){
	DBAccess db = new DBAccess();
	if(db.createConn()){
		// 根据id组成删除SQL，执行删除
		String id =request.getParameter("id");
		String sql = "delete from address where id="+id;
		db.update(sql);
		db.closeStm();
		db.closeConn();
		
	
		
	}
	
	return true;
} 

	

	public boolean insert(HttpServletRequest request,String username){
		
		DBAccess db = new DBAccess();
		
		if(db.createConn()){
		
		String name = request.getParameter("name");
		String sex= request.getParameter("sex");
		String mobile = request.getParameter("mobile");
		String qq= request.getParameter("qq");
		String company = request.getParameter("company");
		String address= request.getParameter("address");
		String email = request.getParameter("email");
		String postcode= request.getParameter("postcode");
		// 组合新增sql
		String sql="insert into address(username,name,sex,mobile,email,qq,company,address,postcode)";
		sql+="values('"+username+"','"+name+"','"+sex+"','"+mobile+"','"+email+"','"+qq+"','"+company+"','"+address+"','"+postcode+"')";
		
		//转换参数编码
		try {
			sql=new String(sql.getBytes("ISO8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 执行插入
		db.update(sql);
		db.closeStm();
		db.closeConn();
		
	}
		
	
	
	return true;
} 

	

	public boolean select(HttpServletRequest request, String username){
	 DBAccess db = new DBAccess();
	 
	 if(db.createConn()){
 		// 根据id组成删除SQL，执行删除
		String id =request.getParameter("id");
		String sql = "select * from address where id="+id;
		db.query(sql);
		if(db.next()){
			//取得各个字段的值并保存
			request.setAttribute("id", db.getValue("id"));
			request.setAttribute("username", db.getValue("username"));
			request.setAttribute("name",db.getValue("name"));
			request.setAttribute("sex", db.getValue("sex"));
			request.setAttribute("mobile", db.getValue("mobile"));
			request.setAttribute("email", db.getValue("email"));
			request.setAttribute("qq",db.getValue("qq"));
			request.setAttribute("company", db.getValue("company"));
			request.setAttribute("address", db.getValue("address"));
			request.setAttribute("postcode", db.getValue("postcode"));
		}
		db.closeRs();
		db.closeStm();
		db.closeConn();
		
	
	}
	
	return true;
} 



	public boolean update(HttpServletRequest request, String username){
		DBAccess db = new DBAccess();
		
		if(db.createConn()){
		// 取得修改页表单参数
		String id =request.getParameter("id");
		String name =request.getParameter("name");
		String sex =request.getParameter("sex");
		String mobile =request.getParameter("mobile");
		String email =request.getParameter("email");
		String qq =request.getParameter("qq");
		String company =request.getParameter("company");
		String address =request.getParameter("address");
		String postcode =request.getParameter("postcode");
		
		//取得更新SQL
		String sql="update address set name='"+name+"', sex='"+sex+"', mobile='"+mobile+"',email='"+email+"',qq='"+qq+"',company='"+company+"',address='"+address+"',postcode='"+postcode+"'where id="+id;
		
		//转换参数编码
		try {
			sql = new String(sql.getBytes("ISO8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//执行更新
		db.update(sql);
		db.closeStm();
		db.closeConn();
		
	
	}
	return true;
} 







}