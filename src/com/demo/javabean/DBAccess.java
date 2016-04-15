package com.demo.javabean;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class DBAccess {
	// 数据库驱动
	private String drv ="com.mysql.jdbc.Driver";
	// 连接url
	private String url ="jdbc:mysql://localhost:3306/demo?useUnicode=true&characterEncoding=utf-8&useSSL=false";
	// 用户名
	private String usr="root";
	// 密码
	private String pwd= "123";
	
	// 数据库连接对象
	private Connection conn = null;
	
	// 数据库声明对象
	private Statement stm = null;
	// 数据库结果集对象
	private ResultSet rs = null;
	
	public boolean createConn(){
		boolean b = false;
		try{
			Class.forName(drv).newInstance();
			conn = (Connection) DriverManager.getConnection(url, usr, pwd);
			b = true;
			
			
			b=true;
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return b;
	}

	
	
	public boolean update(String sql){
		boolean b = false;
		try{
			stm = (Statement) conn.createStatement();
			stm.execute(sql);
			b = true;
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return b;
	}

	
	public void query(String sql) {
		try {
			stm = (Statement) conn.createStatement();
			rs = stm.executeQuery(sql);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDrv() {
		return drv;
	}
	
	public boolean next() {
		boolean b = false;
		try {
			if(rs.next()){
				b =true;
			}
		} catch (Exception e) {
		}
		return b;
		
	}
	
	
	public String getValue(String field) {
		String value = null;
		try {
			if(rs!=null){
				value = rs.getString(field);
			}
		} catch (Exception e) {
		}
		return value;
		
	}

	
	public void closeRs() {
		try {
			if(rs!= null){
				rs.close();
			}
		} catch (SQLException e) {
		}
	}
	
	public void closeStm() {
		try {
			if(stm!= null){
				stm.close();
			}
		} catch (SQLException e) {
		}
	}
	public void closeConn() {
		try {
			if(conn != null){
				conn.close();
			}
		} catch (SQLException e) {
		}
	}
	
	
	public void setDrv(String drv) {
		this.drv = drv;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUsr() {
		return usr;
	}

	public void setUsr(String usr) {
		this.usr = usr;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public Statement getStm() {
		return stm;
	}

	public void setStm(Statement stm) {
		this.stm = stm;
	}

	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}

	

}
