<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"
		+request.getServerName()+":"+request.getServerPort()+path+"/";
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 TRANSITIONAL//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title> 企业信息管理系统 - 登录 </title>
		<meta http-equiv = "pragma" content = "no-cache">
		<meta http-equiv = "cache-control" content = "no-cache">
		<meta http-equiv = "expires" content = "0">
		<meta http-equiv = "keywords" content = "企业，信息，管理">
		<meta http-equiv = "description" content = "企业信息管理系统 - 登陆窗口">
		<meta http-equiv = "Content-Type" content = "text/html;charset=UTF-8">
		<Link rel="stylesheet" type="text/css" href="css/styles.css">
			<script language="javascript">
				function validLogin(theform){
					var username = theform.username.value;
					var password = theform.password.value;
					if(username==""){
						alert("用户名不能为空！");
						return false; 
					}

					if(password==""){
						alert("密码不能为空！");
						return false;
					}

					return true;

				}
			</script>
	</head>
	<body bgcolor="#52BDFE">
		
		<table height="100%" width="100%">
			<tr>
				<td align="center">
					<table width="550" height = "307" background ="images/login.jpg">
						<tr>
							<td width="60%"></td>
							
							<td align="center">
								<form name="form1" action="welcome.jsp" method="post" onsubmit="return validLogin(this);">
									<table>
										<tr>
											<td> 用户名：</td>
											<td><input type="text" name="username" size=15></td>

										</tr>

										<tr>
											<td>密&nbsp;&nbsp;码:</td>
											<td><input type="password" name="password" size=15></td>
										</tr>

										<tr>
										<td colspan="2" align="center"><a href="register.jsp">注册新用户</a> <input type="submit" name="submit" value ="登陆系统"></td>

										</tr>	
									</table>
								</form>
							</td>	
						</tr>	
					</table>	
				</td>
			</tr>
		</table>	
		
		
	</body>	
</html>

