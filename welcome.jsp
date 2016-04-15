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
		<title> 企业信息管理系统 - 欢迎页面 </title>
		<meta http-equiv = "pragma" content = "no-cache">
		<meta http-equiv = "cache-control" content = "no-cache">
		<meta http-equiv = "expires" content = "0">
		<meta http-equiv = "keywords" content = "企业，信息，管理">
		<meta http-equiv = "description" content = "企业信息管理系统 - 欢迎页面">
		<meta http-equiv = "Content-Type" content = "text/html;charset=UTF-8">
		<Link rel="stylesheet" type="text/css" href="css/styles.css">
	</head>
	<body>
		<table height="100%" width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2" height="200">
					
					<%@ include file="inc/top.jsp" %>
				</td>	
			</tr>	

			<tr>
				<td width="160" bgcolor="#EEEEEE" valign="top" height="100%">
					<%@ include file="inc/menu.jsp" %>
					
				</td>

				<td align="left" valign="top">
			
					<table width="100%" class="position">
						<tr>
							<td>当前位置：首页面</td>
							<td width="20"></td>
						</tr>
					</table>
		
					<table id="t1" border="0" cellpadding="0" cellspacing="0"
					style="border-collapse: collapse" bordercolor="D0E7FF" width="95%" 
					height="2">
						<tr>
							<td align="center"><img src="images/welcome.gif"></td>
						</tr>

						<tr>
							<td align="center">
								<h1><font face="华文新魏" color="#FF0099">欢迎使用企业信息管理系统</font></h1>
							</td>
						</tr>
						<tr>
							<td align="center"><img src="images/flower.gif"></td>
						</tr>

					</table>

				</td>	
			</tr>

			<tr>
				<td colspan="2" align="center">
					
					<%@ include file="inc/foot.jsp" %>
				</td>
			</tr>	
		</table>	
	</body>
</html>	